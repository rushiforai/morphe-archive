package app.morphe.extension.mapsautomotive.android9;

import android.app.ActivityManager;
import android.os.Build;

/** ActivityManager.isRunningInUserTestHarness (patch "Android 9 (API 28)"): false on Android 9. */
public final class ActivityManager28 {
    public static final String OWNER = "Landroid/app/ActivityManager;";

    private ActivityManager28() {
    }

    public static boolean isRunningInUserTestHarness() {
        if (Build.VERSION.SDK_INT >= 29) return ActivityManager.isRunningInUserTestHarness();
        return false;
    }
}
