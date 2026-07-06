package app.patches.extension.screenshot;

import android.view.Window;
import android.view.WindowManager;

/**
 * Intercepts Window flag calls and strips FLAG_SECURE so the OS never
 * applies the screenshot/screen-recording restriction.
 *
 * Both methods are injection points: the Kotlin patch replaces every
 * invoke-virtual to Window.addFlags / Window.setFlags in the app with
 * invoke-static to these methods instead.
 */
@SuppressWarnings("unused")
public class ScreenshotRestrictionPatch {

    public static void addFlags(Window window, int flags) {
        window.addFlags(flags & ~WindowManager.LayoutParams.FLAG_SECURE);
    }

    public static void setFlags(Window window, int flags, int mask) {
        window.setFlags(
            flags & ~WindowManager.LayoutParams.FLAG_SECURE,
            mask  & ~WindowManager.LayoutParams.FLAG_SECURE
        );
    }
}
