package io.github.bryceaspringfield.morphe.extension.youtube;

import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.KeyEvent;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.youtube.patches.VideoInformation;

public final class SleepTimer {

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static boolean registered;
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
        lastTime = -1;
        if (PlaybackExtras.mediaKey(KeyEvent.KEYCODE_MEDIA_PAUSE)) Logger.printDebug(() -> "YouTube Extras: sleep timer ended, paused");
    }
}
