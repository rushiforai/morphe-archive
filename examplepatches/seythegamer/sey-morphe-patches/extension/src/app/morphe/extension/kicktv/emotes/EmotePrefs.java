package app.morphe.extension.kicktv.emotes;

import android.content.Context;
import android.content.SharedPreferences;

import app.morphe.extension.kicktv.base.MorpheContext;

/**
 * Persistent EMOTES settings.
 *
 * <p>A single switch controls every third-party provider (7TV, BTTV and FFZ)
 * so the chat stays consistent and the settings dialog remains simple.</p>
 */
public final class EmotePrefs {

    private static final String PREFS_NAME = "morphe_kicktv";
    private static final String KEY_EMOTES_ENABLED = "emotes_enabled";
    private static final boolean DEFAULT_ENABLED = true;

    private static SharedPreferences prefs;
    private static volatile Boolean cachedEnabled;

    private EmotePrefs() {
    }

    private static synchronized SharedPreferences getPrefs() {
        if (prefs == null) {
            Context context = MorpheContext.getAppContext();
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
