package app.spicetify.development;

import android.app.Application;
import app.spicetify.extension.spotify.settings.PatchSettings;

public final class DevelopmentApplication extends Application {
    @Override public void onCreate() {
        super.onCreate();
        PatchSettings.initialize(this);
    }
}
