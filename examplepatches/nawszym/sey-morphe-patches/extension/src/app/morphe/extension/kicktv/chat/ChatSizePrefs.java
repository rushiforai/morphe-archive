package app.morphe.extension.kicktv.chat;

import android.content.Context;
import android.content.SharedPreferences;

import app.morphe.extension.kicktv.base.MorpheContext;

/**
 * Persistent CHAT SIZE settings.
 *
 * <p>Chat size is expressed as a percentage of the default chat size:
 * 100% is the stock layout, 125% makes the chat larger and 80% makes it
 * smaller. The player width ratio is the fraction of the screen used by
 * the video, so a larger chat means a smaller player width.</p>
 */
public final class ChatSizePrefs {

    public static final int SIZE_DEFAULT = 100;
    public static final int SIZE_125 = 125;
    public static final int SIZE_90 = 90;
    public static final int SIZE_85 = 85;
    public static final int SIZE_80 = 80;

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
        return p != null && p.getBoolean(KEY_CHAT_RESIZE_ENABLED, false);
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
            return SIZE_DEFAULT;
        }
        int percent = p.getInt(KEY_CHAT_SIZE_PERCENT, SIZE_DEFAULT);
        if (!isValidSize(percent)) {
            return SIZE_DEFAULT;
        }
        return percent;
    }

    public static void setChatSizePercent(int percent) {
        SharedPreferences p = getPrefs();
        if (p != null) {
            p.edit().putInt(KEY_CHAT_SIZE_PERCENT, isValidSize(percent) ? percent : SIZE_DEFAULT).apply();
        }
    }

    public static boolean isValidSize(int percent) {
        return percent == SIZE_DEFAULT
                || percent == SIZE_125
                || percent == SIZE_90
                || percent == SIZE_85
                || percent == SIZE_80;
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
            case SIZE_125:
                return 0.625f; // chat 37.5% of screen
            case SIZE_90:
                return 0.73f;  // chat 27% of screen
            case SIZE_85:
                return 0.745f; // chat 25.5% of screen
            case SIZE_80:
                return 0.76f;  // chat 24% of screen
            case SIZE_DEFAULT:
            default:
                return DEFAULT_PLAYER_WIDTH_RATIO;
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
            case SIZE_125:
                return "125% (larger chat)";
            case SIZE_90:
                return "90%";
            case SIZE_85:
                return "85%";
            case SIZE_80:
                return "80% (smaller chat)";
            case SIZE_DEFAULT:
            default:
                return "Default (100%)";
        }
    }

    /** Cycles 100 -> 125 -> 90 -> 85 -> 80 -> 100. */
    public static int nextChatSizePercent(int current) {
        switch (current) {
            case SIZE_DEFAULT:
                return SIZE_125;
            case SIZE_125:
                return SIZE_90;
            case SIZE_90:
                return SIZE_85;
            case SIZE_85:
                return SIZE_80;
            case SIZE_80:
            default:
                return SIZE_DEFAULT;
        }
    }
}
