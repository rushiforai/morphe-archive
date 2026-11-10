package app.morphe.extension.twitch.amoled;

import android.content.Context;
import android.content.SharedPreferences;

/**
 * Persistent AMOLED theme setting.
 *
 * <p>The switch lives in the same preference file as the other Twitch TV
 * tweaks, so the native SEYTTINGS dialog and the injected page share one value.
 * The theme is on by default.</p>
 */
public final class AmoledPrefs {

    private static final String PREFS_NAME = "morphe_twitchtv";
    private static final String KEY_AMOLED_ENABLED = "amoled_enabled";
    private static final boolean DEFAULT_ENABLED = true;

    private static Context appContext;
    private static SharedPreferences prefs;
    private static volatile Boolean cachedEnabled;

    private AmoledPrefs() {
    }

    public static synchronized void init(Context context) {
        if (context == null) {
            return;
        }
        if (appContext == null) {
            appContext = context.getApplicationContext();
        }
    }

    private static synchronized SharedPreferences getPrefs() {
        if (prefs == null) {
            Context context = appContext;
            if (context != null) {
                prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
            }
        }
        return prefs;
    }

    public static boolean isEnabled() {
        Boolean cached = cachedEnabled;
        if (cached != null) {
            return cached;
        }
        SharedPreferences p = getPrefs();
        boolean value = p == null
                ? DEFAULT_ENABLED
                : p.getBoolean(KEY_AMOLED_ENABLED, DEFAULT_ENABLED);
        cachedEnabled = value;
        return value;
    }

    public static void setEnabled(boolean enabled) {
        cachedEnabled = enabled;
        SharedPreferences p = getPrefs();
        if (p != null) {
            p.edit().putBoolean(KEY_AMOLED_ENABLED, enabled).apply();
        }
    }
}
