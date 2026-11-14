package app.morphe.extension.mapsautomotive.android9;

import android.os.Build;
import android.view.Window;

/** Window.setNavigationBarContrastEnforced (patch "Android 9 (API 28)"): no contrast scrim on Android 9. */
public final class Window28 {
    public static final String OWNER = "Landroid/view/Window;";

    private Window28() {
    }

    public static void setNavigationBarContrastEnforced(Window window, boolean enforceContrast) {
        if (Build.VERSION.SDK_INT >= 29) window.setNavigationBarContrastEnforced(enforceContrast);
    }
}
