package app.morphe.extension.twitch.emotes;

import android.content.Context;
import android.content.SharedPreferences;

/**
 * Persistent EMOTES settings.
 *
 * <p>A single switch controls every third-party provider (7TV, BTTV and FFZ)
 * so the chat stays consistent and the settings dialog remains simple.</p>
 */
public final class EmotePrefs {

    private static final String PREFS_NAME = "morphe_twitchtv";
    private static final String KEY_EMOTES_ENABLED = "emotes_enabled";
    private static final boolean DEFAULT_ENABLED = true;

    private static Context appContext;
    private static SharedPreferences prefs;
    private static volatile Boolean cachedEnabled;

    private EmotePrefs() {
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
                : p.getBoolean(KEY_EMOTES_ENABLED, DEFAULT_ENABLED);
        cachedEnabled = value;
        return value;
    }

    public static void setEnabled(boolean enabled) {
        cachedEnabled = enabled;
        SharedPreferences p = getPrefs();
        if (p != null) {
            p.edit().putBoolean(KEY_EMOTES_ENABLED, enabled).apply();
        }
    }
}
