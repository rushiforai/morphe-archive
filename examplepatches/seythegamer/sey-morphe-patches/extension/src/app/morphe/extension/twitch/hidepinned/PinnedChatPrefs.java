package app.morphe.extension.twitch.hidepinned;

import android.content.Context;
import android.content.SharedPreferences;

/**
 * Persistent HIDE PINNED setting.
 *
 * <p>Twitch TV renders a pinned chat message as a card above the message list
 * (the native {@code pinned-chat} block). The card takes a large part of the
 * chat on a TV, so the injected helper removes the whole card and every related
 * pinned element when this setting is enabled.</p>
 *
 * <p>The switch lives in the same preference file as the other Twitch TV
 * tweaks, so the native SEYTTINGS dialog and the injected page share one value.
 * Pinned messages are shown by default.</p>
 */
public final class PinnedChatPrefs {

    private static final String PREFS_NAME = "morphe_twitchtv";
    private static final String KEY_HIDE_PINNED_ENABLED = "hide_pinned_enabled";
    private static final boolean DEFAULT_ENABLED = false;

    private static Context appContext;
    private static SharedPreferences prefs;
    private static volatile Boolean cachedEnabled;

    private PinnedChatPrefs() {
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

    public static boolean isHidePinnedEnabled() {
        Boolean cached = cachedEnabled;
        if (cached != null) {
            return cached;
        }
        SharedPreferences p = getPrefs();
        boolean value = p == null
                ? DEFAULT_ENABLED
                : p.getBoolean(KEY_HIDE_PINNED_ENABLED, DEFAULT_ENABLED);
        cachedEnabled = value;
        return value;
    }

    public static void setHidePinnedEnabled(boolean enabled) {
        cachedEnabled = enabled;
        SharedPreferences p = getPrefs();
        if (p != null) {
            p.edit().putBoolean(KEY_HIDE_PINNED_ENABLED, enabled).apply();
        }
    }
}
