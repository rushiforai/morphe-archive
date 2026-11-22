package app.jofslash.extension.googlehealth;

import android.view.Window;
import android.view.WindowManager;

/**
 * Used by the Allow screenshots patch. The app's calls that set window flags are sent here, and
 * FLAG_SECURE, which blocks screenshots and screen recording, is left out.
 */
@SuppressWarnings("unused")
public final class AllowScreenshotsPatch {
    private AllowScreenshotsPatch() {
    }

    public static void addFlags(Window window, int flags) {
        window.addFlags(flags & ~WindowManager.LayoutParams.FLAG_SECURE);
    }

    public static void setFlags(Window window, int flags, int mask) {
        window.setFlags(flags & ~WindowManager.LayoutParams.FLAG_SECURE, mask);
    }
}
