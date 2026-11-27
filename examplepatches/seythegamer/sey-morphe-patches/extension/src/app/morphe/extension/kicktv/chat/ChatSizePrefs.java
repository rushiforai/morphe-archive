package app.morphe.extension.kicktv.chat;

import android.content.Context;
import android.content.SharedPreferences;

import app.morphe.extension.kicktv.base.MorpheContext;

/**
 * Persistent CHAT SIZE setting with exactly three options:
 * Native (stock KICK), Twitch-like (measured Twitch TV ratio) and Big.
 *
 * <p>The player width ratio is the fraction of the screen used by the video;
 * the chat panel is its complement. Values were chosen so the patched player
 * and chat panel always meet at the same boundary.</p>
 */
public final class ChatSizePrefs {

    /** Native = stock KICK: player 70% / chat 30%. */
    public static final int SIZE_NATIVE = 100;

    /**
     * Twitch-like: measured from a 1080p Twitch TV screenshot — the chat
     * panel occupies ~25% of the screen, which matches KICK's 85% preset
     * (player 74.5% / chat 25.5%).
     */
    public static final int SIZE_TWITCH = 85;

    /** Big: player 62.5% / chat 37.5% (the old 125% preset). */
    public static final int SIZE_BIG = 125;

    /** Player width ratio used by KICK for the default VIDEO/CHAT layout. */
    static final float DEFAULT_PLAYER_WIDTH_RATIO = 0.7f;

    private static final String PREFS_NAME = "morphe_kicktv";
    private static final String KEY_CHAT_RESIZE_ENABLED = "chat_resize_enabled";
    private static final String KEY_CHAT_SIZE_PERCENT = "chat_size_percent";

    private static SharedPreferences prefs;

    private ChatSizePrefs() {
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

    public static boolean isChatResizeEnabled() {
        SharedPreferences p = getPrefs();
        return p == null || p.getBoolean(KEY_CHAT_RESIZE_ENABLED, true);
    }

    public static void setChatResizeEnabled(boolean enabled) {
        SharedPreferences p = getPrefs();
        if (p != null) {
            p.edit().putBoolean(KEY_CHAT_RESIZE_ENABLED, enabled).apply();
        }
    }

    public static int getChatSizePercent() {
        SharedPreferences p = getPrefs();
        if (p == null) {
            return SIZE_TWITCH;
        }
        int percent = p.getInt(KEY_CHAT_SIZE_PERCENT, SIZE_TWITCH);
        // Older builds stored 90 / 80; fold them into Twitch-like, the
        // closest supported option.
        if (percent == 90 || percent == 80) {
            return SIZE_TWITCH;
        }
        return isValidSize(percent) ? percent : SIZE_NATIVE;
    }

    public static void setChatSizePercent(int percent) {
        SharedPreferences p = getPrefs();
        if (p != null) {
            p.edit().putInt(KEY_CHAT_SIZE_PERCENT,
                    isValidSize(percent) ? percent : SIZE_TWITCH).apply();
        }
    }

    public static boolean isValidSize(int percent) {
        return percent == SIZE_NATIVE
                || percent == SIZE_TWITCH
                || percent == SIZE_BIG;
    }

    /**
     * Player width ratio that the patched player code should use.
     * Falls back to the stock value when the feature is disabled or the
     * application context is not available yet.
     */
    public static float getChatPlayerWidthRatio() {
        if (!isChatResizeEnabled()) {
            return DEFAULT_PLAYER_WIDTH_RATIO;
        }
        switch (getChatSizePercent()) {
            case SIZE_TWITCH:
                return 0.745f; // chat 25.5% of screen (Twitch TV ratio)
            case SIZE_BIG:
                return 0.625f; // chat 37.5% of screen
            case SIZE_NATIVE:
            default:
                return DEFAULT_PLAYER_WIDTH_RATIO; // chat 30%
        }
    }

    /**
     * Chat panel width ratio (fraction of the screen) used by the player UI.
     * It is the complement of {@link #getChatPlayerWidthRatio()} so the video
     * and the chat panel always meet at the same boundary.
     */
    public static float getChatPanelWidthRatio() {
        return 1.0f - getChatPlayerWidthRatio();
    }

    public static String getChatSizeLabel() {
        switch (getChatSizePercent()) {
            case SIZE_TWITCH:
                return "Twitch-like (85%)";
            case SIZE_BIG:
                return "Big (125%)";
            case SIZE_NATIVE:
            default:
                return "Native (100%)";
        }
    }

    /** Cycle used by the SEYTTINGS button: Native -> Twitch-like -> Big -> Native. */
    public static int nextChatSizePercent(int current) {
        if (current == SIZE_NATIVE) {
            return SIZE_TWITCH;
        }
        if (current == SIZE_TWITCH) {
            return SIZE_BIG;
        }
        return SIZE_NATIVE;
    }
}