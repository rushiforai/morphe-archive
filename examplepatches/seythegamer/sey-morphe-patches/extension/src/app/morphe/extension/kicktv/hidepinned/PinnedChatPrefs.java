package app.morphe.extension.kicktv.hidepinned;

import android.content.Context;
import android.content.SharedPreferences;

import app.morphe.extension.kicktv.base.MorpheContext;

/**
 * Persistent HIDE PINNED setting.
 *
 * <p>KICK renders the pinned chat message as an {@code AnimatedVisibility}
 * card above the message list. The card also carries the pinned ad text, so
 * it can cover a large part of the chat on a TV.</p>
 *
 * <p>The patched code passes the stock visibility flag through
 * {@link #shouldShowPinned(boolean)}. When the tweak is enabled the flag is
 * forced off, which removes the whole card and gives the space back to the
 * message list.</p>
 */
public final class PinnedChatPrefs {

    private static final String PREFS_NAME = "morphe_kicktv";
    private static final String KEY_HIDE_PINNED_ENABLED = "hide_pinned_enabled";
    private static final boolean DEFAULT_ENABLED = false;

    private static SharedPreferences prefs;
    private static volatile Boolean cachedEnabled;

    private PinnedChatPrefs() {
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

    public static boolean isHidePinnedEnabled() {
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
        boolean value = p.getBoolean(KEY_HIDE_PINNED_ENABLED, DEFAULT_ENABLED);
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

    /**
     * Replacement for the stock pinned-card visibility flag. Keeps the stock
     * state when the tweak is off and hides the card when it is on.
     */
    public static boolean shouldShowPinned(boolean stockVisible) {
        return stockVisible && !isHidePinnedEnabled();
    }
}
