package app.morphe.extension.kicktv.chatbackground;

import android.content.Context;
import android.content.SharedPreferences;

import app.morphe.extension.kicktv.base.MorpheContext;

/**
 * Persistent CHAT BACKGROUND (AMOLED) setting.
 *
 * <p>When enabled, the KICK chat panel uses pure black (#000000) instead of
 * the stock #070809 dark grey.</p>
 */
public final class ChatBackgroundPrefs {

    private static final String PREFS_NAME = "morphe_kicktv";
    private static final String KEY_AMOLED_ENABLED = "chat_amoled_enabled";
    private static final boolean DEFAULT_AMOLED_ENABLED = true;

    /**
     * Stock chat panel background used by KICK 1.9.0: the packed Compose Color
     * held in {@code ng4.f} ({@code 0xFF070809}). The patch replaces the two
     * {@code sget-wide Lng4;->f:J} reads in {@code La79;.d} with this helper,
     * so the preference is honoured at the exact point the chat panel paints
     * its background.
     */
    // Compose stores a Color as ARGB shifted into the high 32 bits of a long
    // (see gca.f(long) -> j << 32 in KICK 1.9.0). Returning the unshifted ARGB
    // would set alpha to 0 and make the panel transparent, which looks black
    // regardless of the setting.
    private static final long STOCK_PANEL_COLOR_PACKED = 0xFF070809L << 32;

    /** Pure black, packed as a Compose Color (ARGB << 32). */
    private static final long AMOLED_PANEL_COLOR_PACKED = 0xFF000000L << 32;

    private static SharedPreferences prefs;
    private static Context appContext;
    private static volatile Boolean cachedAmoledEnabled;

    private ChatBackgroundPrefs() {
    }

    /**
     * Called from {@link app.morphe.patches.kicktv.chatbackground.ChatBackgroundPatch}
     * inside {@code MainActivity.onCreate()} so the preference is readable
     * before Compose builds the chat UI.
     */
    public static synchronized void init(Context context) {
        if (context != null) {
            appContext = context.getApplicationContext();
        }
    }

    private static synchronized SharedPreferences getPrefs() {
        if (prefs == null) {
            Context context = appContext != null ? appContext : MorpheContext.getAppContext();
            if (context != null) {
                prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
            }
        }
        return prefs;
    }

    public static boolean isAmoledEnabled() {
        Boolean cached = cachedAmoledEnabled;
        if (cached != null) {
            return cached;
        }
        SharedPreferences p = getPrefs();
        boolean value = p == null
                ? DEFAULT_AMOLED_ENABLED
                : p.getBoolean(KEY_AMOLED_ENABLED, DEFAULT_AMOLED_ENABLED);
        cachedAmoledEnabled = value;
        return value;
    }

    public static void setAmoledEnabled(boolean enabled) {
        cachedAmoledEnabled = enabled;
        SharedPreferences p = getPrefs();
        if (p != null) {
            p.edit().putBoolean(KEY_AMOLED_ENABLED, enabled).apply();
        }
    }

    /**
     * Returns the packed Compose Color for the chat panel background.
     * Never throws: the patched app must always paint a valid background.
     */
    public static long getChatPanelColorPacked() {
        try {
            return isAmoledEnabled() ? AMOLED_PANEL_COLOR_PACKED : STOCK_PANEL_COLOR_PACKED;
        } catch (Throwable ignored) {
            return STOCK_PANEL_COLOR_PACKED;
        }
    }
}