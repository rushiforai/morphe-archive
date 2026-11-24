package app.morphe.extension.twitch.hometab;

import android.content.Context;
import android.content.SharedPreferences;

/**
 * Persistent "default home tab" setting.
 *
 * <p>Chooses which Twitch TV tab is opened automatically when the app starts:
 * Home, Following, Browse or Search. The value survives restarts and is read
 * by {@code twitch-hometab.js} on every page load.</p>
 */
public final class HomeTabPrefs {

    private static final String PREFS_NAME = "morphe_twitchtv";
    private static final String KEY_ENABLED = "hometab_enabled";
    private static final String KEY_TAB = "hometab_tab";
    private static final boolean DEFAULT_ENABLED = false;
    private static final String DEFAULT_TAB = "Home";

    private static Context appContext;
    private static SharedPreferences prefs;
    private static volatile Boolean cachedEnabled;
    private static volatile String cachedTab;

    private HomeTabPrefs() {
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
                : p.getBoolean(KEY_ENABLED, DEFAULT_ENABLED);
        cachedEnabled = value;
        return value;
    }

    public static void setEnabled(boolean enabled) {
        cachedEnabled = enabled;
        SharedPreferences p = getPrefs();
        if (p != null) {
            p.edit().putBoolean(KEY_ENABLED, enabled).apply();
        }
    }

    public static String getHomeTab() {
        String cached = cachedTab;
        if (cached != null) {
            return cached;
        }
        SharedPreferences p = getPrefs();
        String value = p == null
                ? DEFAULT_TAB
                : p.getString(KEY_TAB, DEFAULT_TAB);
        cachedTab = value;
        return value;
    }

    public static void setHomeTab(String tab) {
        cachedTab = tab;
        SharedPreferences p = getPrefs();
        if (p != null) {
            p.edit().putString(KEY_TAB, tab).apply();
        }
    }
}
