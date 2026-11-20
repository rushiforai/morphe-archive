package app.template.extension.fotmob;

import android.app.Activity;
import android.content.res.Configuration;
import android.util.Log;

import app.template.extension.hevalcontrols.HevalSettings;

/**
 * "AMOLED black" for FotMob: a Patch settings switch (fotmob.amoled_black, restart required for
 * screens that are already open). The resource patch adds the theme overlay HevalAmoledOverlay (ten
 * theme attributes of the dark theme at near-black values); while the switch is on, each new screen
 * that is in dark mode gets it applied on top of its theme, from ActivityHooks.onActivityCreated
 * (inside super.onCreate, before the content is inflated). With the switch off, or in light mode,
 * nothing is applied and the app looks as it does stock.
 */
@SuppressWarnings("unused")
public final class AmoledBlack {
    static final String FEATURE = "fotmob.amoled_black";

    /** The overlay style the resource patch adds. */
    private static final String THEME_OVERLAY = "HevalAmoledOverlay";

    private static volatile int overlayId = -1;

    private AmoledBlack() {
    }

    /** Whether the switch is on (stock when the settings engine answers off or fails). */
    static boolean isEnabled() {
        try {
            return HevalSettings.isEnabled(FEATURE);
        } catch (Throwable ignored) {
            return false;
        }
    }

    /** Applies the overlay to the activity's theme when the switch is on and the screen is dark. */
    static void applyTheme(Activity activity) {
        try {
            if (!isEnabled()) return;
            int night = activity.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK;
            if (night != Configuration.UI_MODE_NIGHT_YES) return;
            int id = overlayId;
            if (id == -1) {
                id = activity.getResources().getIdentifier(THEME_OVERLAY, "style", activity.getPackageName());
                overlayId = id;
            }
            if (id != 0) activity.getTheme().applyStyle(id, true);
        } catch (Throwable failure) {
            Log.w("Morphe-FotMob", "AMOLED theme not applied: " + failure.getClass().getName());
        }
    }
}
