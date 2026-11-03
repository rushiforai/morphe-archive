package net.gtvbox.videoplayer;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

/**
 * Progress journal for the current Stremio launch (contract v1): Vimu's own SharedPreferences file
 * "tikka_progress_journal", read back through {@link ProgressJournalProvider}. The point is that a
 * crash or kill of Vimu still leaves the last position (at most ~10 s old) on disk.
 * Every entry point catches Throwable: a journal failure never touches playback or the result.
 */
public final class ProgressJournal {
    static final String PREFS = "tikka_progress_journal";
    private static final String TAG = "VimuResult";
    private static final long PLAYING_EVERY_MS = 10000L;
    private static final long CHANGE_MIN_MS = 2000L;
    private static final Object LOCK = new Object();
    private static final long NEVER = Long.MIN_VALUE / 4;

    private static String launchId = "";
    private static String videoId = "";
    private static String videoUrl = "";
    private static Context appContext;
    private static String lastState;
    private static long lastPos;
    private static long lastDur;
    private static long lastWriteAtMs = NEVER;

    private ProgressJournal() {
    }

    /** New launch (hook in normalize, every w1). Positions are kept only for the same non-empty launch id. */
    public static void begin(String launch, String stremioVideoId) {
        try {
            synchronized (LOCK) {
                String id = launch == null ? "" : launch;
                if (id.isEmpty() || !id.equals(launchId)) {
                    lastPos = 0;
                    lastDur = 0;
                }
                launchId = id;
                videoId = stremioVideoId == null ? "" : stremioVideoId;
                videoUrl = "";
                lastState = null;
                lastWriteAtMs = NEVER;
            }
        } catch (Throwable error) {
            Log.w(TAG, "journal begin", error);
        }
    }

    public static void attach(Context ctx, String url) {
        try {
            synchronized (LOCK) {
                if (ctx != null) {
                    Context app = ctx.getApplicationContext();
                    appContext = app != null ? app : ctx;
                }
                videoUrl = url == null ? "" : url;
            }
        } catch (Throwable error) {
            Log.w(TAG, "journal attach", error);
        }
    }

    /** Called from the 1 s tick with a known duration: writes every 10 s while playing, once on pause, and once on a seek while paused. */
    public static void tick(boolean playing, int posMs, int durMs) {
        try {
            synchronized (LOCK) {
                if (durMs <= 0) return;
                String state = playing ? "playing" : "paused";
                long elapsed = System.nanoTime() / 1000000L - lastWriteAtMs;
                if (Rules.tickWrite(playing, lastState, elapsed, posMs, lastPos)) {
                    write(state, "", posMs, durMs);
                }
            }
        } catch (Throwable error) {
            Log.w(TAG, "journal tick", error);
        }
    }

    /** Forced write: pause, exit, destroy, error, natural end. A missing duration falls back to the cached one. */
    public static void moment(String state, String endBy, int posMs, int durMs) {
        try {
            synchronized (LOCK) {
                write(state, endBy == null ? "" : endBy, posMs, durMs);
            }
        } catch (Throwable error) {
            Log.w(TAG, "journal moment", error);
        }
    }

    private static void write(String state, String endBy, long posMs, long durMs) {
        if (appContext == null || !Rules.allowed(lastState, state)) return;
        long[] resolved = Rules.resolve(state, posMs, durMs, lastPos, lastDur);
        if (resolved == null) return;
        long pos = resolved[0];
        long dur = resolved[1];
        SharedPreferences prefs = appContext.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        SharedPreferences.Editor edit = prefs.edit()
                .putString("launch_id", launchId)
                .putString("video_url", videoUrl)
                .putString("stremio_video_id", videoId)
                .putLong("position_ms", pos)
                .putLong("duration_ms", dur)
                .putString("state", state)
                .putString("end_by", endBy)
                .putLong("updated_at", System.currentTimeMillis());
        VimuTracks.writeJournal(edit);
        edit.apply();
        lastState = state;
        lastWriteAtMs = System.nanoTime() / 1000000L;
        if (pos > 0) lastPos = pos;
        lastDur = dur;
        Log.i(TAG, "journal w launch=" + launchId + " pos=" + pos + " dur=" + dur + " state=" + state);
    }

    /** Pure decisions, testable without Android. */
    static final class Rules {
        private Rules() {
        }

        static int rank(String state) {
            if ("ended".equals(state)) return 3;
            if ("error".equals(state)) return 2;
            if ("exited".equals(state)) return 1;
            return 0;
        }

        /** A terminal state is never overwritten by a lower one; playing/paused never overwrite it. */
        static boolean allowed(String prev, String next) {
            int before = rank(prev);
            return before == 0 || rank(next) >= before;
        }

        /** Tick write decision: playing keeps the 10 s cadence (plus the guarded state
         * change); paused writes once on the pause itself and once per seek landing
         * (>= 1 s away from the last written position). */
        static boolean tickWrite(boolean playing, String prevState, long elapsedMs,
                                 long posMs, long writtenPosMs) {
            if (!playing) {
                if (!"paused".equals(prevState)) return true;
                return posMs > 0L && Math.abs(posMs - writtenPosMs) >= 1000L;
            }
            return elapsedMs >= PLAYING_EVERY_MS
                    || (!"playing".equals(prevState) && elapsedMs >= CHANGE_MIN_MS);
        }

        /** Position and duration to store, or null for no write (no duration known). */
        static long[] resolve(String state, long pos, long dur, long lastPos, long lastDur) {
            if (dur <= 0) {
                dur = lastDur;
                if (pos <= 0) pos = lastPos;
            }
            if (dur <= 0) return null;
            if (pos < 0) pos = 0;
            if (pos == 0 && lastPos > 0 && !"ended".equals(state)) pos = lastPos;
            return new long[] {pos, dur};
        }
    }
}
