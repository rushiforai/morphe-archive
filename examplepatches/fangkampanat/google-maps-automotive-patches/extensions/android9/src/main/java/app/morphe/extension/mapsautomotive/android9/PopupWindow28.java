package app.morphe.extension.mapsautomotive.android9;

import android.os.Build;
import android.widget.PopupWindow;

import java.lang.reflect.Method;

/**
 * PopupWindow.setIsClippedToScreen (patch "Android 9 (API 28)"): Android 9's setClipToScreenEnabled (on its light
 * greylist, as AppCompat used it) through reflection.
 */
public final class PopupWindow28 {
    public static final String OWNER = "Landroid/widget/PopupWindow;";
    private static Method clipToScreen;
    private static boolean looked;

    private PopupWindow28() {
    }

    public static void setIsClippedToScreen(PopupWindow window, boolean enabled) {
        if (Build.VERSION.SDK_INT >= 29) {
            window.setIsClippedToScreen(enabled);
            return;
        }
        synchronized (PopupWindow28.class) {
            if (!looked) {
                looked = true;
                try {
                    Method method = PopupWindow.class.getDeclaredMethod("setClipToScreenEnabled", boolean.class);
                    method.setAccessible(true);
                    clipToScreen = method;
                } catch (ReflectiveOperationException | RuntimeException ignored) {
                    clipToScreen = null;
                }
            }
        }
        try {
            if (clipToScreen != null) clipToScreen.invoke(window, enabled);
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            // The popup keeps its clipping.
        }
    }
}
