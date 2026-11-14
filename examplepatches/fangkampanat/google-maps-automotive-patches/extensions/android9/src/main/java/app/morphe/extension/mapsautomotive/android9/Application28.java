package app.morphe.extension.mapsautomotive.android9;

import android.app.Application;
import android.os.Build;

/**
 * Application's callback registration (patch "Android 9 (API 28)"): on Android 9 a callback with Android 10 pre/post
 * methods is wrapped so they are called (LifecycleBridge). Android 10 and newer: the framework's own.
 */
public final class Application28 {
    public static final String OWNER = "Landroid/app/Application;";

    private Application28() {
    }

    public static void registerActivityLifecycleCallbacks(Application application,
                                                          Application.ActivityLifecycleCallbacks callback) {
        if (Build.VERSION.SDK_INT >= 29) {
            application.registerActivityLifecycleCallbacks(callback);
            return;
        }
        LifecycleBridge.registerApplicationWide(application, callback);
    }

    public static void unregisterActivityLifecycleCallbacks(Application application,
                                                            Application.ActivityLifecycleCallbacks callback) {
        if (Build.VERSION.SDK_INT >= 29) {
            application.unregisterActivityLifecycleCallbacks(callback);
            return;
        }
        LifecycleBridge.unregisterApplicationWide(application, callback);
    }
}
