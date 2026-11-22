/*
 * Forked from Hushfacebook (https://github.com/SysAdminDoc/Hushfacebook, GPL-3.0),
 * extensions/facebook/.../theme/ForceDarkMode.java and DarkMode.java, rewritten for
 * facebook-morphe-patches, 2026.
 */
package app.fbpatches.extension.facebook.theme;

import android.content.res.Configuration;
import android.content.res.Resources;
import android.util.Log;

/**
 * Facebook's dark mode controller answers whether dark mode is on for the whole app. Facebook's
 * Settings page comes from its server, and on tablets it has no Dark mode row, so there is no way
 * to turn dark mode on there.
 *
 * <p>This turns a light answer dark on a tablet and leaves every other answer alone. With the
 * patch's Follow the system theme option, a tablet is dark only while the system's dark theme is
 * on. Facebook asks as each screen applies its theme, so a change shows fully once Facebook
 * restarts.
 *
 * <p>Fails open: on any error the answer is Facebook's own.
 */
@SuppressWarnings("unused")
public final class DarkMode {
    private static final String TAG = "FbPatches";

    /** Android's tablet threshold: a smallest width of 600dp or more. */
    private static final int TABLET_SMALLEST_WIDTH_DP = 600;

    private DarkMode() {
    }

    /**
     * Injection point. Called with each answer of Facebook's dark mode controller, as an int
     * because ART lets a boolean method return a register it types as int.
     *
     * @return true on a tablet (only while the system is dark when {@link #followsSystem} says so),
     *     else Facebook's own answer.
     */
    public static boolean answer(int facebooks) {
        if (facebooks != 0) return true;
        try {
            // The system's configuration, not Facebook's: Facebook themes its own screens from this
            // answer, so reading its configuration would read the answer back.
            Configuration system = Resources.getSystem().getConfiguration();
            if (system.smallestScreenWidthDp < TABLET_SMALLEST_WIDTH_DP) return false;
            if (!followsSystem()) return true;
            return (system.uiMode & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
        } catch (Throwable t) {
            Log.w(TAG, "DarkMode.answer failed", t);
            return false;
        }
    }

    /** Filled in by the patch: true when its Follow the system theme option is on. */
    public static boolean followsSystem() {
        return false;
    }
}
