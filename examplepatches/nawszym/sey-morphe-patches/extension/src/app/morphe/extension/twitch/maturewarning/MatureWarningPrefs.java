package app.morphe.extension.twitch.maturewarning;

import android.content.Context;
import android.content.SharedPreferences;

/**
 * Persistent SKIP 18+ WARNING setting.
 *
 * <p>The switch lives in the same preference file as the other Twitch TV
 * tweaks, so the native SEYTTINGS dialog and the injected page share one value.
 * Auto-accepting the mature content warning is on by default.</p>
 */
public final class MatureWarningPrefs {

    private static final String PREFS_NAME = "morphe_twitchtv";
    private static final String KEY_AUTO_ACCEPT_ENABLED = "mature_auto_accept_enabled";
    private static final boolean DEFAULT_ENABLED = true;

    private static Context appContext;
    private static SharedPreferences prefs;
    private static volatile Boolean cachedEnabled;

    private MatureWarningPrefs() {
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
                : p.getBoolean(KEY_AUTO_ACCEPT_ENABLED, DEFAULT_ENABLED);
        cachedEnabled = value;
        return value;
    }

    public static void setEnabled(boolean enabled) {
        cachedEnabled = enabled;
        SharedPreferences p = getPrefs();
        if (p != null) {
            p.edit().putBoolean(KEY_AUTO_ACCEPT_ENABLED, enabled).apply();
        }
    }
}
