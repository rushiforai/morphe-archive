package app.template.extension.sofascore;

import android.app.Activity;
import android.view.Window;
import android.view.WindowManager;

import app.template.extension.hevalcontrols.HevalSettings;

/**
 * Runtime hooks of "Keep screen on" and "Hide screenshot sharing prompt". Every method answers the
 * stock behaviour when its switch is off or on any error.
 */
@SuppressWarnings("unused")
public final class ScreenCalm {

    private static final String KEEP_SCREEN_ON = "sofascore.keep_screen_on";
    private static final String SCREENSHOT_PROMPT = "sofascore.disable_screenshot_prompt";

    private ScreenCalm() { }

    /** Patched into the start of the match page's onResume: keep the screen on while the switch is on. */
    public static void keepScreenOn(Activity activity) {
        try {
            if (activity == null || !HevalSettings.isEnabled(KEEP_SCREEN_ON)) return;
            Window window = activity.getWindow();
            if (window != null) window.addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
        } catch (Throwable failure) {
            // Stock: the screen follows the system timeout.
        }
    }

    /**
     * Patched into the start of the match page's onPause. Clears the flag whatever the switch says,
     * so turning the switch off while the page is open never leaves the screen on.
     */
    public static void releaseScreen(Activity activity) {
        try {
            if (activity == null) return;
            Window window = activity.getWindow();
            if (window != null) window.clearFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
        } catch (Throwable failure) {
            // Nothing to restore.
        }
    }

    /**
     * Patched after each read of the "do not show again" screenshot preference: true while the switch
     * is on (the app then never registers its screenshot callback nor shows the sharing prompt).
     */
    public static boolean screenshotPromptHidden(boolean doNotShowAgain) {
        try {
            return doNotShowAgain || HevalSettings.isEnabled(SCREENSHOT_PROMPT);
        } catch (Throwable failure) {
            return doNotShowAgain;
        }
    }
}
