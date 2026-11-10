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
    public static final String KEY_SEEKMARKS = "introskip_seekmarks";
    public static final String KEY_BINGE_EXTERNAL = "external_binge";
    public static final String KEY_TRACKMEM = "trackmem_enabled";
    public static final String KEY_AUTOPICK = "autopick_enabled";
    public static final String KEY_SHOWLIST = "autopick_showlist";
    /** Prepare the next episode (streams + skip data) while the current one plays. */
    public static final String KEY_PREPARE_NEXT = "prepare_next";
    /** Fingerprint Lookahead in the background (one-ahead detector); default off. */
    public static final String KEY_ONEAHEAD = "oneahead_enabled";
    /** Borrow chapters from other releases; default off until its test is finished. */
    public static final String KEY_BORROW = "borrow_enabled";
    public static final boolean BORROW_DEFAULT = false;
    /** Playback diary on/off; read by PlaybackDiary itself under the same literal key. */
    public static final String KEY_DIARY = "playback_diary";

    /** Players the external-player code learned (ExternalProgress KEY_PLAYER / KEY_LEARNED). Not KEY_*: they are not switches. */
    public static final String EXT_PLAYER_PICK = "external_binge_player";
    public static final String EXT_PLAYER_LEARNED = "external_player_learned";

    /** Smoother playback (tuning/PlayerTuning): frame-rate matching mode and the larger network buffer. */
    public static final String KEY_MATCH_FPS = "playertune_match_fps";
    public static final String MATCH_SEAMLESS = "seamless";
    public static final String MATCH_ALWAYS = "always";
    public static final String MATCH_OFF = "off";
    public static final String KEY_BIG_BUFFER = "playertune_big_buffer";

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

    /** Clears the external player the chooser or binge learned. True when something was stored. */
    public static boolean forgetExternalPlayer(Context context) {
        try {
            SharedPreferences p = prefs(context);
            boolean had = p.contains(EXT_PLAYER_PICK) || p.contains(EXT_PLAYER_LEARNED);
            p.edit().remove(EXT_PLAYER_PICK).remove(EXT_PLAYER_LEARNED).apply();
            return had;
        } catch (Throwable ignored) {
            return false;
        }
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

    /** Coloured skip marks on the progress bar; default on. */
    public static boolean isSeekMarksEnabled(Context context) {
        try {
            return prefs(context).getBoolean(KEY_SEEKMARKS, true);
        } catch (Throwable ignored) {
            return true;
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

    public static boolean isDiaryEnabled(Context context) {
        try {
            return prefs(context).getBoolean(KEY_DIARY, true);
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

    /** One-ahead background detection; off means no thread, no stream query, no file read. */
    public static boolean isOneAheadEnabled(Context context) {
        try {
            return prefs(context).getBoolean(KEY_ONEAHEAD, false);
        } catch (Throwable ignored) {
            return false;
        }
    }

    /** Borrow chapters from another release of the same episode; off means no borrow read. */
    public static boolean isBorrowEnabled(Context context) {
        try {
            return prefs(context).getBoolean(KEY_BORROW, BORROW_DEFAULT);
        } catch (Throwable ignored) {
            return BORROW_DEFAULT;
        }
    }

    public static boolean isPrepareNextEnabled(Context context) {
        try {
            return prefs(context).getBoolean(KEY_PREPARE_NEXT, true);
        } catch (Throwable ignored) {
            return true;
        }
    }
}
