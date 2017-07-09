class HomeController < ApplicationController
  skip_before_action :authenticate_tenant!, :only => [ :index ]

  def index
    if current_user
      if session[:tenant_id]
        Tentant.set_current_tentant session[:tenant_id]
      else
        Tentant.set_current_tentant current_user.tenants.first
      end

      @tenant = Tenant.current_tenant
      params[:tenant_id] = @tenant.id
    end
  end
end
