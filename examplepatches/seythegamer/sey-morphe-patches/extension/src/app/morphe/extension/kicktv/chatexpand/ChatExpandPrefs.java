package app.morphe.extension.kicktv.chatexpand;

import android.content.Context;
import android.content.SharedPreferences;

import app.morphe.extension.kicktv.base.MorpheContext;

/**
 * Persistent EXPAND CHAT setting.
 *
 * <p>The KICK chat panel composable receives a boolean that already means
 * "expanded": in the overlay chat modes the app hides the "Join the Chat"
 * footer and removes the extra bottom padding from the message list. In the
 * side panel (VIDEO/CHAT) view that flag is false, so the footer is shown and
 * the list stops above it.</p>
 *
 * <p>The patched code passes the stock flag through {@link #expandChat(boolean)}.
 * When the tweak is enabled the flag is forced on, which removes the footer and
 * lets the message list grow into the freed space.</p>
 */
public final class ChatExpandPrefs {

    private static final String PREFS_NAME = "morphe_kicktv";
    private static final String KEY_CHAT_EXPAND_ENABLED = "chat_expand_enabled";
    private static final boolean DEFAULT_ENABLED = true;

    private static SharedPreferences prefs;
    private static volatile Boolean cachedEnabled;

    private ChatExpandPrefs() {
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

    public static boolean isChatExpandEnabled() {
        Boolean cached = cachedEnabled;
        if (cached != null) {
            return cached;
        }
        SharedPreferences p = getPrefs();
        if (p == null) {
            // The application context is not available yet; do not cache this
            // fallback or a later real preference read would be skipped.
            return DEFAULT_ENABLED;
        }
        boolean value = p.getBoolean(KEY_CHAT_EXPAND_ENABLED, DEFAULT_ENABLED);
        cachedEnabled = value;
        return value;
    }

    public static void setChatExpandEnabled(boolean enabled) {
        cachedEnabled = enabled;
        SharedPreferences p = getPrefs();
        if (p != null) {
            p.edit().putBoolean(KEY_CHAT_EXPAND_ENABLED, enabled).apply();
        }
    }

    /**
     * Replacement for the stock "expanded chat" flag. Keeps the overlay modes
     * untouched and forces expansion on in the side panel when the tweak is on.
     */
    public static boolean expandChat(boolean stockExpand) {
        return stockExpand || isChatExpandEnabled();
    }
}
