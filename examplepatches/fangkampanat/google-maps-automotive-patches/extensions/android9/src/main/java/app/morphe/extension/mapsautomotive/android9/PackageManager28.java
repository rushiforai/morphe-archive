package app.morphe.extension.mapsautomotive.android9;

import android.content.pm.PackageManager;
import android.os.Build;

/**
 * PackageManager.hasSystemFeature (patch "Android 9 (API 28)"): on Android 9 the automotive feature counts only where
 * android.car has Car.createCar(Context). Android 9 head units such as the issue #11 tester's (ecarx) declare the
 * feature with an older android.car without that method; Maps then takes its non-automotive paths, as on BYD DiLink 3,
 * instead of using car services that are not there. Every other feature as is; Android 10 and newer as is.
 */
public final class PackageManager28 {
    public static final String OWNER = "Landroid/content/pm/PackageManager;";
    private static final String AUTOMOTIVE = "android.hardware.type.automotive";

    private PackageManager28() {
    }

    public static boolean hasSystemFeature(PackageManager manager, String name) {
        boolean present = manager.hasSystemFeature(name);
        if (Build.VERSION.SDK_INT >= 29) return present;
        if (present && AUTOMOTIVE.equals(name) && !Android9.carApiUsable()) return false;
        return present;
    }
}
