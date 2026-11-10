package app.morphe.extension.twitch.adblock;

import android.content.Context;
import android.content.SharedPreferences;

/**
 * Persistent AD BLOCK setting.
 *
 * <p>The switch lives in the same preference file as the other Twitch TV
 * tweaks, so the native SEYTTINGS dialog and the injected page share one value.
 * Ad blocking is on by default.</p>
 */
public final class AdBlockPrefs {

    private static final String PREFS_NAME = "morphe_twitchtv";
    private static final String KEY_ADBLOCK_ENABLED = "adblock_enabled";
    private static final boolean DEFAULT_ENABLED = true;

    private static Context appContext;
    private static SharedPreferences prefs;
    private static volatile Boolean cachedEnabled;

    private AdBlockPrefs() {
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
                : p.getBoolean(KEY_ADBLOCK_ENABLED, DEFAULT_ENABLED);
        cachedEnabled = value;
        return value;
    }

    public static void setEnabled(boolean enabled) {
        cachedEnabled = enabled;
        SharedPreferences p = getPrefs();
        if (p != null) {
            p.edit().putBoolean(KEY_ADBLOCK_ENABLED, enabled).apply();
        }
    }
}
