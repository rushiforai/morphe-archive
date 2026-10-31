package app.tikkamasalla.stremio.introskip;

import android.content.Context;
import android.content.SharedPreferences;

/** Intro Skip settings, stored in a dedicated file so Stremio keys are never touched. */
public final class IntroSkipPrefs {
    public static final String FILE = "introskip_prefs";
    public static final String KEY_ENABLED = "introskip_enabled";
    public static final String KEY_ANIME = "introskip_anime";
    public static final String KEY_MODE = "introskip_mode";
    public static final String KEY_RECAPS = "introskip_recaps";
    public static final String MODE_AUTO = "auto";
    public static final String MODE_MANUAL = "manual";
    public static final String KEY_CREDITS = "introskip_credits";
    public static final String CREDITS_AUTO = "auto";
    public static final String CREDITS_BUTTON = "button";
    public static final String CREDITS_OFF = "off";
    public static final String KEY_PREVIEWS = "introskip_previews";
    public static final String KEY_BINGE_EXTERNAL = "external_binge";
    public static final String KEY_TRACKMEM = "trackmem_enabled";
    public static final String KEY_AUTOPICK = "autopick_enabled";
    public static final String KEY_SHOWLIST = "autopick_showlist";

    private IntroSkipPrefs() {
    }

    private static final String CACHE_FILE = "introskip_cache";
    private static final long CACHE_TTL_MS = 60L * 24L * 60L * 60L * 1000L;

    /** Stored Cinemeta hit for a "series:title" / "movie:title" key, or "" (missing or older than 60 days). */
    public static String cachedImdb(Context context, String key) {
        try {
            String raw = context.getSharedPreferences(CACHE_FILE, Context.MODE_PRIVATE).getString(key, "");
            int bar = raw == null ? -1 : raw.indexOf('|');
            if (bar <= 0) return "";
            long stored = Long.parseLong(raw.substring(bar + 1));
            if (System.currentTimeMillis() - stored > CACHE_TTL_MS) return "";
            return raw.substring(0, bar);
        } catch (Throwable ignored) {
            return "";
        }
    }

    /** Hits only; a miss is never stored. */
    public static void cacheImdb(Context context, String key, String imdb) {
        try {
            context.getSharedPreferences(CACHE_FILE, Context.MODE_PRIVATE).edit()
                    .putString(key, imdb + "|" + System.currentTimeMillis()).apply();
        } catch (Throwable ignored) {
            // Cache is optional.
        }
    }

    public static SharedPreferences prefs(Context context) {
        return context.getSharedPreferences(FILE, Context.MODE_PRIVATE);
    }

    public static boolean isEnabled(Context context) {
        try {
            return prefs(context).getBoolean(KEY_ENABLED, true);
        } catch (Throwable ignored) {
            return true;
        }
    }

    public static boolean isAnimeEnabled(Context context) {
        try {
            return prefs(context).getBoolean(KEY_ANIME, true);
        } catch (Throwable ignored) {
            return true;
        }
    }

    public static boolean isRecapsEnabled(Context context) {
        try {
            return prefs(context).getBoolean(KEY_RECAPS, true);
        } catch (Throwable ignored) {
            return true;
        }
    }

    public static String mode(Context context) {
        try {
            return MODE_MANUAL.equals(prefs(context).getString(KEY_MODE, MODE_AUTO))
                    ? MODE_MANUAL : MODE_AUTO;
        } catch (Throwable ignored) {
            return MODE_AUTO;
        }
    }

    public static boolean isManualMode(Context context) {
        return MODE_MANUAL.equals(mode(context));
    }

    public static String creditsMode(Context context) {
        try {
            String value = prefs(context).getString(KEY_CREDITS, CREDITS_BUTTON);
            if (CREDITS_AUTO.equals(value)) return CREDITS_AUTO;
            if (CREDITS_OFF.equals(value)) return CREDITS_OFF;
            return CREDITS_BUTTON;
        } catch (Throwable ignored) {
            return CREDITS_BUTTON;
        }
    }

    public static boolean isCreditsAuto(Context context) {
        return CREDITS_AUTO.equals(creditsMode(context));
    }

    public static boolean isCreditsButton(Context context) {
        return CREDITS_BUTTON.equals(creditsMode(context));
    }

    public static boolean isCreditsOff(Context context) {
        return CREDITS_OFF.equals(creditsMode(context));
    }

    public static boolean isPreviewsEnabled(Context context) {
        try {
            return prefs(context).getBoolean(KEY_PREVIEWS, false);
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static boolean isBingeExternalEnabled(Context context) {
        try {
            return prefs(context).getBoolean(KEY_BINGE_EXTERNAL, true);
        } catch (Throwable ignored) {
            return true;
        }
    }

    public static boolean isTrackMemEnabled(Context context) {
        try {
            return prefs(context).getBoolean(KEY_TRACKMEM, true);
        } catch (Throwable ignored) {
            return true;
        }
    }

    public static boolean isAutoPickEnabled(Context context) {
        try {
            return prefs(context).getBoolean(KEY_AUTOPICK, true);
        } catch (Throwable ignored) {
            return true;
        }
    }

    public static boolean isShowListEnabled(Context context) {
        try {
            return prefs(context).getBoolean(KEY_SHOWLIST, false);
        } catch (Throwable ignored) {
            return false;
        }
    }
}
