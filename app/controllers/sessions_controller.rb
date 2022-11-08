class SessionsController < ApplicationController

    def create
        # This is for when the user first logs in. The :username is sent as form data
        # Then set sessions, which is sent back to the browswer in heads along with users. 
        user = User.find_by(username: params[:username])
        session[:user_id] = user.id
        render json: user
    end

    def destroy
        # Deleting the cookie/session so that they are logged out. 
        # I think these two are for when the user logs in for the first time... nothing really with when the user refreshes the page.
        session.delete :user_id
        head :no_content
    end
end
