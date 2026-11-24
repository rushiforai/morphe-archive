package app.morphe.extension.kicktv.base;

import android.app.Activity;
import android.content.Context;

import java.lang.ref.WeakReference;

/**
 * Holds a weak reference to the running activity and the application context
 * so the settings dialog and feature modules can reach them from anywhere.
 */
public final class MorpheContext {

    private static WeakReference<Activity> activityRef = new WeakReference<>(null);
    private static Context appContext;

    private MorpheContext() {
    }

    /** Called from MainActivity.onCreate() by the SEYTTINGS patch. */
    public static void setActivity(Activity activity) {
        activityRef = new WeakReference<>(activity);
        if (activity != null) {
            appContext = activity.getApplicationContext();
        }
    }

    public static Activity getActivity() {
        return activityRef.get();
    }

    public static Context getAppContext() {
        return appContext;
    }
}
