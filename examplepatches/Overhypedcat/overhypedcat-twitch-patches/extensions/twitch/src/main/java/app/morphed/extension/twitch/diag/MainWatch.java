package app.morphed.extension.twitch.diag;

import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;

import app.morphed.extension.twitch.patches.DebugLog;

/**
 * Debug mode's eye on the screen: the app's main thread (which draws everything and runs the player's controls) is
 * nudged a few times a second from a thread of its own. When a nudge goes unanswered for BLOCKED_MS, the log gets
 * what the main thread is busy with right then (its stack), and later how long it was blocked.
 */
public final class MainWatch {
    static final long NUDGE_MS = 200;
    static final long BLOCKED_MS = 700;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static volatile long answeredAt = SystemClock.uptimeMillis();
    private static volatile Thread watcher;

    private MainWatch() {
    }

    public static synchronized void start() {
        if (watcher != null) return;
        Thread thread = new Thread(MainWatch::watch, "TwitchMorphed-mainwatch");
        thread.setDaemon(true);
        thread.setPriority(Thread.MIN_PRIORITY);
        watcher = thread;
        answeredAt = SystemClock.uptimeMillis();
        thread.start();
    }

    public static synchronized void stop() {
        Thread thread = watcher;
        watcher = null;
        if (thread != null) thread.interrupt();
    }

    private static void watch() {
        Thread self = Thread.currentThread();
        long blockedSince = 0;
        try {
            while (watcher == self) {
                MAIN.post(() -> answeredAt = SystemClock.uptimeMillis());
                Thread.sleep(NUDGE_MS);
                long now = SystemClock.uptimeMillis();
                long waiting = now - answeredAt;
                if (blockedSince == 0 && waiting >= BLOCKED_MS) {
                    blockedSince = answeredAt;
                    DebugLog.log("Screen: the app's main thread is blocked (" + VideoTracker.seconds(waiting)
                            + " so far), busy in: " + stack(Looper.getMainLooper().getThread().getStackTrace()));
                } else if (blockedSince != 0 && waiting < NUDGE_MS * 2) {
                    DebugLog.log("Screen: main thread free again after " + VideoTracker.seconds(answeredAt - blockedSince));
                    blockedSince = 0;
                }
            }
        } catch (InterruptedException stopped) {
            // Debug mode off
        }
    }

    /** The top of a stack, the frames that say what it's doing (the app's and the extension's, not the looper's). */
    static String stack(StackTraceElement[] frames) {
        StringBuilder out = new StringBuilder();
        int shown = 0;
        for (StackTraceElement frame : frames) {
            if (shown == 10) break;
            if (out.length() > 0) out.append(" < ");
            out.append(frame.getClassName()).append('.').append(frame.getMethodName());
            if (frame.getLineNumber() > 0) out.append(':').append(frame.getLineNumber());
            shown++;
        }
        return shown == 0 ? "(no stack)" : out.toString();
    }
}
