package app.morphe.extension.kicktv.emotes;

import android.content.Context;
import android.content.SharedPreferences;

import app.morphe.extension.kicktv.base.MorpheContext;

/**
 * Persistent EMOTES settings.
 *
 * <p>A single switch controls every third-party provider (7TV, BTTV and FFZ).
 * A second switch makes emotes bigger, Twitch-TV style, for both third-party
 * emotes and KICK's built-in emotes.</p>
 */
public final class EmotePrefs {

    private static final String PREFS_NAME = "morphe_kicktv";
    private static final String KEY_EMOTES_ENABLED = "emotes_enabled";
    private static final String KEY_EMOTE_SIZE_TWITCH = "emote_size_twitch";
    private static final boolean DEFAULT_ENABLED = true;
    private static final boolean DEFAULT_TWITCH_SIZE = true;

    /** Twitch TV draws emotes at about twice the surrounding font size. */
    private static final float TWITCH_SIZE_FACTOR = 1.6f;

    private static SharedPreferences prefs;
    private static volatile Boolean cachedEnabled;
    private static volatile Boolean cachedTwitchSize;

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

    public static boolean isTwitchSize() {
        Boolean cached = cachedTwitchSize;
        if (cached != null) {
            return cached;
        }
        SharedPreferences p = getPrefs();
        boolean value = p == null
                ? DEFAULT_TWITCH_SIZE
                : p.getBoolean(KEY_EMOTE_SIZE_TWITCH, DEFAULT_TWITCH_SIZE);
        cachedTwitchSize = value;
        return value;
    }

    public static void setTwitchSize(boolean twitch) {
        cachedTwitchSize = twitch;
        SharedPreferences p = getPrefs();
        if (p != null) {
            p.edit().putBoolean(KEY_EMOTE_SIZE_TWITCH, twitch).apply();
        }
    }

    /**
     * Called from the patched chat code for both KICK's built-in emotes (base =
     * the message font size) and third-party emotes (base = 20). Returns the
     * base size unchanged in Native mode, or a larger Twitch-like size.
     * Never throws: the patched app must always render a valid emote size.
     */
    public static float getEmoteSize(float base) {
        try {
            return isTwitchSize() ? base * TWITCH_SIZE_FACTOR : base;
        } catch (Throwable ignored) {
            return base;
        }
    }

    /**
     * Int variant for KICK's built-in emotes, whose placeholder is built from
     * integer dp constants (20 / 12) rather than floats.
     */
    public static int getEmoteSize(int base) {
        try {
            return isTwitchSize() ? (int) (base * TWITCH_SIZE_FACTOR) : base;
        } catch (Throwable ignored) {
            return base;
        }
    }
}