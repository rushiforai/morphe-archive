package app.morphe.extension.sabp;

import android.content.Context;
import android.content.SharedPreferences;

/**
 * Typed access to Smart AudioBook Player's own settings (its default SharedPreferences), using
 * exactly SABP's keys, value encodings and defaults (see docs/inventory.md). eppy never keeps a
 * copy: a change made here is what SABP reads the next time it needs the value, and a change
 * made in SABP's screens shows up here. Titles come from SABP's own (translated) strings when
 * they exist.
 */
@SuppressWarnings("deprecation")
public final class SabpPrefs {
    private SabpPrefs() {
    }

    public static SharedPreferences prefs(Context c) {
        return android.preference.PreferenceManager.getDefaultSharedPreferences(c);
    }

    /** SABP's own string resource by name, or the English fallback. */
    public static String str(Context c, String name, String fallback) {
        try {
            int id = c.getResources().getIdentifier(name, "string", c.getPackageName());
            if (id != 0) return c.getString(id);
        } catch (Throwable ignored) {
        }
        return fallback;
    }

    // ---- choice settings: key, stored values, labels, default --------------------------------

    /** A list setting stored as a String, as SABP's ListPreferences do. */
    public static final class Choice {
        public final String key;
        public final String[] values;
        public final String[] labels;
        public final String def;
        public final String title;
        public final String summary;

        Choice(String key, String def, String title, String summary, String[] values, String[] labels) {
            this.key = key;
            this.def = def;
            this.title = title;
            this.summary = summary;
            this.values = values;
            this.labels = labels;
        }

        public String get(Context c) {
            String v = prefs(c).getString(key, def);
            return v != null ? v : def;
        }

        public int index(Context c) {
            String v = get(c);
            for (int i = 0; i < values.length; i++) if (values[i].equals(v)) return i;
            return 0;
        }

        public String label(Context c) {
            return labels[index(c)];
        }

        public void set(Context c, String value) {
            prefs(c).edit().putString(key, value).apply();
            EppyDiag.log("settings", key + " = " + value + " (shared with SABP)");
        }
    }

    public static Choice autoRewind(Context c) {
        return new Choice("autoRewind", "Medium", str(c, "auto_rewind", "Rewind after a pause"),
                "Go back a little when playback resumes", new String[]{"Off", "Small", "Medium"},
                new String[]{str(c, "off", "Off"), str(c, "small", "Small"), str(c, "big", "Big")});
    }

    public static Choice sleepTime(Context c) {
        String min = str(c, "minutes", "minutes");
        return new Choice("sleepTime", "10", str(c, "sleep", "Sleep timer"), null,
                new String[]{"-1", "5", "10", "15", "20", "30", "45", "60", "75", "90"},
                new String[]{str(c, "end_of_file", "End of file"), "5 " + min, "10 " + min, "15 " + min, "20 " + min, "30 " + min,
                        "45 " + min, "60 " + min, "75 " + min, "90 " + min});
    }

    public static Choice shakeToExtend(Context c) {
        return new Choice("trackMotion", "0", str(c, "track_motion", "Shake to reset the timer"), null,
                new String[]{"0", "1", "2"},
                new String[]{str(c, "always", "Always"), str(c, "during_fadeout", "During fade-out"), str(c, "never", "Never")});
    }

    public static Choice shakeForce(Context c) {
        return new Choice("shakeForce_v2", "6", str(c, "shake_force", "Shake sensitivity"), null,
                new String[]{"1", "3", "6", "12", "18"},
                new String[]{str(c, "very_low", "Very low"), str(c, "low", "Low"), str(c, "medium", "Medium"), str(c, "high", "High"),
                        str(c, "very_high", "Very high")});
    }

    // ---- booleans ---------------------------------------------------------------------------

    public static final class Toggle {
        public final String key;
        public final boolean def;
        public final String title;
        public final String summary;

        Toggle(String key, boolean def, String title, String summary) {
            this.key = key;
            this.def = def;
            this.title = title;
            this.summary = summary;
        }

        public boolean get(Context c) {
            return prefs(c).getBoolean(key, def);
        }

        public void set(Context c, boolean v) {
            prefs(c).edit().putBoolean(key, v).apply();
            EppyDiag.log("settings", key + " = " + v + " (shared with SABP)");
        }
    }

    public static Toggle[] playbackToggles(Context c) {
        return new Toggle[]{
                new Toggle("headsetConnectPlay", false, str(c, "headset_connect_play", "Play when headphones connect"),
                        str(c, "headset_connect_play_summary", null)),
                new Toggle("pauseOnMessage", true, str(c, "pause_on_message", "Pause for message sounds"),
                        str(c, "pause_playback_during_incoming_message", null)),
                new Toggle("stopWhenOthersPlaying", true, str(c, "stop_when_others_playing", "Stop when another player starts"),
                        str(c, "stop_playback_when_other_media_players_are_playing", null)),
                new Toggle("resumePlaybackAtEndOfCall", true, str(c, "resume_playback_at_end_of_call", "Resume after a call"),
                        str(c, "resume_playback_at_end_of_call_summary", null)),
        };
    }

    public static Toggle sleepOffInAndroidAuto(Context c) {
        return new Toggle("turnOffSleepTimerInAndroidAuto", true, str(c, "turn_off_in_android_auto", "Turn the timer off in Android Auto"), null);
    }

    public static Toggle coverOnLockScreen(Context c) {
        return new Toggle("showCoverOnLockScreen", true, str(c, "show_cover_on_lock_screen", "Cover on the lock screen"), null);
    }

    public static Toggle statisticsEnabled(Context c) {
        return new Toggle("playbackStatisticsEnabled", true, str(c, "playback_statistics", "Listening statistics"),
                "SABP records how long you listen each day");
    }

    // ---- rewind / fast-forward intervals ------------------------------------------------------

    /** Seconds for SABP's small rewind button, by stored index (key smallRewindIndex, default 2). */
    public static final int[] SMALL_STEPS = {3, 5, 10, 15, 20, 30, 45, 60, 120};
    /** Seconds for SABP's big rewind button, by stored index (key bigRewindIndex, default 3). */
    public static final int[] BIG_STEPS = {20, 30, 45, 60, 120, 180, 240, 300, 600};

    public static int smallIndex(Context c) {
        return clampIndex(prefs(c).getInt("smallRewindIndex", 2), SMALL_STEPS);
    }

    public static int bigIndex(Context c) {
        return clampIndex(prefs(c).getInt("bigRewindIndex", 3), BIG_STEPS);
    }

    public static int smallSeconds(Context c) {
        return SMALL_STEPS[smallIndex(c)];
    }

    public static int bigSeconds(Context c) {
        return BIG_STEPS[bigIndex(c)];
    }

    public static void setSmallIndex(Context c, int i) {
        prefs(c).edit().putInt("smallRewindIndex", clampIndex(i, SMALL_STEPS)).apply();
    }

    public static void setBigIndex(Context c, int i) {
        prefs(c).edit().putInt("bigRewindIndex", clampIndex(i, BIG_STEPS)).apply();
    }

    private static int clampIndex(int i, int[] steps) {
        return Math.max(0, Math.min(steps.length - 1, i));
    }

    // ---- speed defaults ---------------------------------------------------------------------

    public static float defaultSpeed(Context c) {
        return prefs(c).getFloat("defaultPlaybackSpeed", 1.0f);
    }

    public static int defaultSkipSilence(Context c) {
        return prefs(c).getInt("defaultSkipSilence_v2", 0);
    }

    /** Same keys SABP's "Set as default" writes; applies to books you haven't started yet. */
    public static void setDefaultSpeed(Context c, float speed, int skipSilence) {
        prefs(c).edit().putFloat("defaultPlaybackSpeed", speed).putInt("defaultSkipSilence_v2", skipSilence).apply();
    }

    // ---- sleep timer state ------------------------------------------------------------------

    public static boolean sleepActive(Context c) {
        return prefs(c).getBoolean("sleepActivated2", false);
    }

    /** Minutes; -1 means "end of file". */
    public static int sleepMinutes(Context c) {
        try {
            return Integer.parseInt(prefs(c).getString("sleepTime", "10"));
        } catch (NumberFormatException e) {
            return 10;
        }
    }

    public static void setSleepMinutes(Context c, int minutes) {
        prefs(c).edit().putString("sleepTime", String.valueOf(minutes)).apply();
    }
}
