package app.morphed.extension.twitch.diag;

import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;

import com.amazonaws.ivs.player.Player;
import com.amazonaws.ivs.player.Quality;
import com.amazonaws.ivs.player.Statistics;

import java.lang.ref.WeakReference;

import app.morphed.extension.twitch.App;
import app.morphed.extension.twitch.patches.DebugLog;
import app.morphed.extension.twitch.patches.PlayerRefresher;

/**
 * Debug mode's eye on the video: the player on screen is looked at a few times a second (on the main thread, where
 * the app calls it too) and what it does goes into the log (see {@link VideoTracker}).
 */
public final class VideoWatch {
    static final long SAMPLE_MS = 500;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final VideoTracker TRACKER = new VideoTracker();
    private static final Runnable SAMPLE = VideoWatch::sample;
    private static WeakReference<Player> watched = new WeakReference<>(null);
    private static String session;
    private static boolean running, failureLogged;

    private VideoWatch() {
    }

    public static void start() {
        MAIN.post(() -> {
            if (running) return;
            running = true;
            MAIN.post(SAMPLE);
        });
    }

    public static void stop() {
        MAIN.post(() -> {
            running = false;
            MAIN.removeCallbacks(SAMPLE);
        });
    }

    private static void sample() {
        if (!running) return;
        try {
            look();
        } catch (Throwable t) {
            if (!failureLogged) { // (said once: a player that can't be read keeps failing the same way)
                failureLogged = true;
                Log.e(App.TAG, "Watching the video failed", t);
                DebugLog.log("PROBLEM Video: the player couldn't be read: " + t);
            }
        }
        MAIN.postDelayed(SAMPLE, SAMPLE_MS);
    }

    private static void look() {
        Player player = PlayerRefresher.shownPlayer();
        if (player == null) {
            if (watched.get() != null) {
                DebugLog.log("Video: no stream on screen");
                watched = new WeakReference<>(null);
                TRACKER.reset();
            }
            return;
        }
        String id = player.getSessionId();
        if (player != watched.get() || (id != null && !id.equals(session))) {
            watched = new WeakReference<>(player);
            session = id;
            TRACKER.reset();
        }
        Quality quality = player.getQuality();
        Statistics stats = player.getStatistics();
        VideoTracker.Sample s = new VideoTracker.Sample(SystemClock.uptimeMillis(), String.valueOf(player.getState()),
                quality == null ? null : quality.getName(),
                player.getPosition(), player.getBufferedPosition(), player.getLiveLatency(), player.getBandwidthEstimate(),
                stats == null ? -1 : stats.getDecodedFrames(), stats == null ? -1 : stats.getRenderedFrames(),
                stats == null ? -1 : stats.getDroppedFrames(), stats == null ? -1 : stats.getFrameRate(),
                stats == null ? -1 : stats.getVideoBitRate());
        for (String line : TRACKER.feed(s)) DebugLog.log(line);
    }
}
