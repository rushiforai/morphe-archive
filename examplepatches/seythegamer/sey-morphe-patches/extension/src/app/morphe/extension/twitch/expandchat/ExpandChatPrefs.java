package app.morphe.extension.twitch.expandchat;

import android.content.Context;
import android.content.SharedPreferences;

/**
 * Persistent EXPAND CHAT setting.
 *
 * <p>The toggle hides the "Join the conversation" footer in the Twitch TV
 * chat. With the footer gone, the message list uses the whole panel height.</p>
 */
public final class ExpandChatPrefs {

    private static final String PREFS_NAME = "morphe_twitchtv";
    private static final String KEY_EXPAND_CHAT_ENABLED = "expand_chat_enabled";
    private static final boolean DEFAULT_ENABLED = true;

    private static Context appContext;
    private static SharedPreferences prefs;
    private static volatile Boolean cachedEnabled;

    private ExpandChatPrefs() {
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
                : p.getBoolean(KEY_EXPAND_CHAT_ENABLED, DEFAULT_ENABLED);
        cachedEnabled = value;
        return value;
    }

    public static void setEnabled(boolean enabled) {
        cachedEnabled = enabled;
        SharedPreferences p = getPrefs();
        if (p != null) {
            p.edit().putBoolean(KEY_EXPAND_CHAT_ENABLED, enabled).apply();
        }
    }
}
