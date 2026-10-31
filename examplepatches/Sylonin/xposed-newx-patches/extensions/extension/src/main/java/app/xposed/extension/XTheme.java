package app.xposed.extension;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.Configuration;

/**
 * X's own theme choice. X draws its UI in Compose from two preferences and leaves the
 * activity's configuration alone, so the configuration only knows the system's night mode.
 */
final class XTheme {
    enum Mode {LIGHT, DIM, LIGHTS_OUT}

    private static final String DARK_MODE_STATE = "dark_mode_state";
    private static final String DARK_MODE_APPEARANCE = "dark_mode_appearance";
    private static final String STATE_OFF = "0";
    private static final String STATE_ON = "1";
    private static final String APPEARANCE_DIM = "dim";

    private static volatile SharedPreferences prefs;
    private static volatile Context app;
    private static volatile Mode cached;
    // Held strongly: SharedPreferences only keeps weak references to listeners.
    private static final SharedPreferences.OnSharedPreferenceChangeListener listener = (p, key) -> {
        if (DARK_MODE_STATE.equals(key) || DARK_MODE_APPEARANCE.equals(key)) themeChanged();
    };

    private XTheme() {
    }

    static void init(Context context) {
        if (prefs != null) return;
        synchronized (XTheme.class) {
            if (prefs != null) return;
            app = context.getApplicationContext();
            // The file X's ThemeRepository reads, see com.x.android.preferences.
            SharedPreferences p = app.getSharedPreferences(app.getPackageName() + "_preferences", Context.MODE_PRIVATE);
            p.registerOnSharedPreferenceChangeListener(listener);
            prefs = p;
        }
    }

    /** Called when X's theme or the system night mode may have changed. */
    static void themeChanged() {
        cached = null;
        States.changedAll();
    }

    static Mode mode() {
        Mode m = cached;
        if (m == null) cached = m = read();
        return m;
    }

    static boolean isDark() {
        return mode() != Mode.LIGHT;
    }

    private static Mode read() {
        SharedPreferences p = prefs;
        Context c = app;
        if (p == null || c == null) return Mode.LIGHT;
        String state = p.getString(DARK_MODE_STATE, null);
        boolean dark;
        if (STATE_ON.equals(state)) {
            dark = true;
        } else if (STATE_OFF.equals(state)) {
            dark = false;
        } else {
            // "Use device settings", X's default.
            dark = (c.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                    == Configuration.UI_MODE_NIGHT_YES;
        }
        if (!dark) return Mode.LIGHT;
        return APPEARANCE_DIM.equals(p.getString(DARK_MODE_APPEARANCE, null)) ? Mode.DIM : Mode.LIGHTS_OUT;
    }
}
