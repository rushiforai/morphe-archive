package io.github.bryceaspringfield.morphe.extension.youtube;

import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.KeyEvent;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.youtube.patches.VideoInformation;

/**
 * Sleep timer: with "Stop playback after" set to a number of minutes, the first playback starts a countdown, and when
 * it ends a playing video is paused with the media Pause key (the same key route as the screen-off fix). A pause by the
 * user does not stop the countdown, since the timer counts wall time from the first play; playing again after the
 * timer fired starts a new countdown. Playback is read every 2 s from the video's time (it moves while a video plays),
 * since the video state's change events did not arrive on 21.44.528 (emulator, 2026-11-13).
 */
public final class SleepTimer {

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static boolean registered;
    /** Uptime at which the countdown ends, or 0 with no countdown running. */
    private static long endsAt;

    private SleepTimer() {
    }

    private static final long POLL_MS = 2000;
    private static long lastTime = -1;

    static synchronized void register() {
        if (registered) return;
        registered = true;
        MAIN.postDelayed(SleepTimer::poll, POLL_MS);
    }

    /** Whether a video plays: its time moved since the last poll (the state alone can be stale). */
    private static boolean playing() {
        long t = VideoInformation.getVideoTime();
        boolean moved = lastTime >= 0 && t != lastTime && t > 0;
        lastTime = t;
        return moved;
    }

    private static void poll() {
        try {
            boolean playing = playing();
            if (endsAt == 0 && playing) start();
            else if (endsAt != 0 && SystemClock.uptimeMillis() >= endsAt) fire(playing);
        } catch (Throwable t) {
            Logger.printDebug(() -> "YouTube Extras: sleep timer poll failed: " + t);
        }
        MAIN.postDelayed(SleepTimer::poll, POLL_MS);
    }

    private static void start() {
        int seconds = Lengths.parse(XSettings.SLEEP_MINUTES.get());
        if (seconds <= 0) return;
        endsAt = SystemClock.uptimeMillis() + seconds * 1000L;
        Logger.printDebug(() -> "YouTube Extras: sleep timer starts, " + seconds + " s");
    }

    private static void fire(boolean playing) {
        endsAt = 0;
        if (!playing) {
            Logger.printDebug(() -> "YouTube Extras: sleep timer ended, nothing playing");
            return;
        }
        // The next poll would read the pause's last moved frame as playing; it starts reading afresh.
        lastTime = -1;
        if (PlaybackExtras.mediaKey(KeyEvent.KEYCODE_MEDIA_PAUSE)) Logger.printDebug(() -> "YouTube Extras: sleep timer ended, paused");
    }
}
