package app.morphe.extension.mapsautomotive.android9;

import android.app.Activity;
import android.app.Application;
import android.os.Build;

/** Android 10 members of Activity (patch "Android 9 (API 28)"); see LifecycleBridge. */
public final class Activity28 {
    public static final String OWNER = "Landroid/app/Activity;";

    private Activity28() {
    }

    public static void registerActivityLifecycleCallbacks(Activity activity, Application.ActivityLifecycleCallbacks callback) {
        if (Build.VERSION.SDK_INT >= 29) {
            activity.registerActivityLifecycleCallbacks(callback);
            return;
        }
        LifecycleBridge.registerForActivity(activity, callback);
    }
}
