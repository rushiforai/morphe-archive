package io.github.xxlc.extension.grok;

import android.os.SystemClock;

/** Prevents repeated delete confirmation runs when the dialog's Compose group recomposes before closing. */
public final class DeleteGuard {
    private static final long WINDOW_MS = 500;
    private static long lastAcquired = -WINDOW_MS;

    private DeleteGuard() {
    }

    /** True for the first call; subsequent calls within WINDOW_MS are rejected. */
    public static synchronized boolean tryAcquire() {
        long now = SystemClock.elapsedRealtime();
        if (now - lastAcquired < WINDOW_MS) {
            return false;
        }
        lastAcquired = now;
        return true;
    }
}
