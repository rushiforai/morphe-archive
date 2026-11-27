package app.template.extension.darkmode;

import android.app.Application;

/**
 * Set as the app's Application by the patch when the app doesn't declare its own.
 */
@SuppressWarnings("unused")
public class ForceDarkApplication extends Application {
    @Override
    public void onCreate() {
        super.onCreate();
        ForceDarkModePatch.apply(this);
    }
}
