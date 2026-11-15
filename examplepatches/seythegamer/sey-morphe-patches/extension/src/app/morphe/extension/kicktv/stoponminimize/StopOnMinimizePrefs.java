package app.morphe.extension.kicktv.stoponminimize;

import android.content.Context;
import android.content.SharedPreferences;

import app.morphe.extension.kicktv.base.MorpheContext;

/**
 * Persistent STOP ON MINIMIZE setting.
 *
 * <p>When enabled, the player is stopped (not merely paused) when KICK is
 * minimized, so audio and video do not keep playing in the background while
 * another app is in the foreground.</p>
 */
public final class StopOnMinimizePrefs {

    private static final String PREFS_NAME = "morphe_kicktv";
    private static final String KEY_ENABLED = "stop_on_minimize_enabled";
    private static final boolean DEFAULT_ENABLED = true;

    private static SharedPreferences prefs;
    private static volatile Boolean cachedEnabled;

    private StopOnMinimizePrefs() {
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

    public static boolean isStopOnMinimizeEnabled() {
        Boolean cached = cachedEnabled;
        if (cached != null) {
            return cached;
        }
        SharedPreferences p = getPrefs();
        if (p == null) {
            return DEFAULT_ENABLED;
        }
        boolean value = p.getBoolean(KEY_ENABLED, DEFAULT_ENABLED);
        cachedEnabled = value;
        return value;
    }

    public static void setStopOnMinimizeEnabled(boolean enabled) {
        cachedEnabled = enabled;
        SharedPreferences p = getPrefs();
        if (p != null) {
            p.edit().putBoolean(KEY_ENABLED, enabled).apply();
        }
    }
}
