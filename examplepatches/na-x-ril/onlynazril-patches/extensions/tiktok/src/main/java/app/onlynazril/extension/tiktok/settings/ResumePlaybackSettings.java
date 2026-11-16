package app.onlynazril.extension.tiktok.settings;

import android.content.Context;
import android.content.SharedPreferences;

/**
 * Resume playback's own switches: whether the feature runs, and the two thresholds that decide
 * which positions are worth keeping.
 * <p>
 * A position is saved only when it is past the start threshold and still at least the end
 * threshold away from the video's end. The defaults are 4 seconds on each side, so opening a video,
 * glancing at the first seconds and leaving does not create a resume point, and neither does
 * stopping just before the video finishes.
 * <p>
 * Stored in the shared prefs file so the settings export carries them like every other switch.
 */
public final class ResumePlaybackSettings {
    private static final String PREFS = "tiktokHandle_prefs";
    private static final String KEY_ENABLED = "resume_playback_enabled";
    private static final String KEY_START = "resume_playback_start_s";
    private static final String KEY_END = "resume_playback_end_s";

    private static final boolean DEFAULT_ENABLED = false;
    private static final int DEFAULT_THRESHOLD_S = 4;
    private static final int MAX_THRESHOLD_S = 24 * 60 * 60;

    private ResumePlaybackSettings() {}

    public static boolean isEnabled(Context ctx) {
        return ctx != null && prefs(ctx).getBoolean(KEY_ENABLED, DEFAULT_ENABLED);
    }

    public static boolean isEnabled() {
        Context ctx = appContext();
        return isEnabled(ctx);
    }

    public static void setEnabled(Context ctx, boolean value) {
        if (ctx == null) return;
        prefs(ctx).edit().putBoolean(KEY_ENABLED, value).apply();
    }

    /** Seconds skipped at the start: no position is saved before this. */
    public static int startSeconds(Context ctx) {
        return seconds(ctx, KEY_START);
    }

    /** Seconds kept clear at the end: no position is saved when less than this remains. */
    public static int endSeconds(Context ctx) {
        return seconds(ctx, KEY_END);
    }

    public static void setStartSeconds(Context ctx, long value) {
        putSeconds(ctx, KEY_START, value);
    }

    public static void setEndSeconds(Context ctx, long value) {
        putSeconds(ctx, KEY_END, value);
    }

    private static int seconds(Context ctx, String key) {
        if (ctx == null) return DEFAULT_THRESHOLD_S;
        int value = prefs(ctx).getInt(key, DEFAULT_THRESHOLD_S);
        return value < 0 ? 0 : Math.min(value, MAX_THRESHOLD_S);
    }

    private static void putSeconds(Context ctx, String key, long value) {
        if (ctx == null) return;
        int clamped = (int) Math.max(0, Math.min(value, MAX_THRESHOLD_S));
        prefs(ctx).edit().putInt(key, clamped).apply();
    }

    private static SharedPreferences prefs(Context ctx) {
        return ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    /** The process context, also used by the playback side which lives in another package. */
    public static Context appContext() {
        return HandleSettings.appContext();
    }
}
