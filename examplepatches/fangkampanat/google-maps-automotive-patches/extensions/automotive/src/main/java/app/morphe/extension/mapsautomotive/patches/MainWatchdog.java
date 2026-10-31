package app.morphe.extension.mapsautomotive.patches;

import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;

/**
 * Freezes: an Android 10 app cannot read the system's ANR traces, so the main process watches its own
 * main thread. When a message posted to it waits 5 s or more, the main thread's stack goes once to the
 * problem report's log, and how long it took when it answers. Nothing else changes. Uptime is used,
 * so the head unit's standby does not count. The silence is measured from the main thread's last
 * answer, with a ping every 0.5 s, so a stall that starts between two pings is not missed.
 */
final class MainWatchdog {
    private static final String TAG = "MorpheWatchdog";
    private static final long CHECK_MS = 500, STALL_MS = 5000;
    private static final int STACK_FRAMES = 30;
    private static volatile long lastAnswer;
    private static volatile boolean waiting;
    private static boolean started;

    private MainWatchdog() {
    }

    /** From the main process's start. */
    static synchronized void start() {
        if (started) return;
        started = true;
        Thread thread = new Thread(MainWatchdog::watch, TAG);
        thread.setDaemon(true);
        thread.start();
    }

    private static void watch() {
        Handler main = new Handler(Looper.getMainLooper());
        lastAnswer = SystemClock.uptimeMillis();
        long stalledSince = 0;
        try {
            while (true) {
                // One ping at a time; while the main thread is stuck, the last one waits in its queue.
                if (!waiting) {
                    waiting = true;
                    main.post(() -> {
                        lastAnswer = SystemClock.uptimeMillis();
                        waiting = false;
                    });
                }
                Thread.sleep(CHECK_MS);
                long answered = lastAnswer, silent = SystemClock.uptimeMillis() - answered;
                if (stalledSince == 0 && silent >= STALL_MS) {
                    stalledSince = answered;
                    ReportLog.w(TAG, "main thread has not answered for " + silent + " ms; its stack:",
                            Looper.getMainLooper().getThread().getStackTrace(), STACK_FRAMES);
                } else if (stalledSince != 0 && answered != stalledSince) {
                    ReportLog.w(TAG, "main thread answered after " + (answered - stalledSince) + " ms");
                    stalledSince = 0;
                }
            }
        } catch (InterruptedException | RuntimeException error) {
            ReportLog.w(TAG, "watchdog stopped", error);
        }
    }
}
