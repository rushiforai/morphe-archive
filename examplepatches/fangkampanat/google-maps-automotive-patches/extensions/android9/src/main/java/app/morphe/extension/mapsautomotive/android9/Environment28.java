package app.morphe.extension.mapsautomotive.android9;

import android.os.Build;
import android.os.Environment;

/** Environment.isExternalStorageLegacy (patch "Android 9 (API 28)"): all storage is legacy before Android 10. */
public final class Environment28 {
    public static final String OWNER = "Landroid/os/Environment;";

    private Environment28() {
    }

    public static boolean isExternalStorageLegacy() {
        if (Build.VERSION.SDK_INT >= 29) return Environment.isExternalStorageLegacy();
        return true;
    }
}
