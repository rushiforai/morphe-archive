/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 */
package app.morphe.extension.music.patches.downloads;

/**
 * Decides which calls of a hot hook are logged: the first few of the process always, then a bounded number per
 * window, so one device log shows that the hook runs without being flooded by a long queue.
 */
final class QueueLogBudget {
    static final int ALWAYS_LOGGED = 5;
    static final int PER_WINDOW = 20;
    static final long WINDOW_MILLIS = 10_000;

    private int calls;
    private long windowStart;
    private int windowCount;

    /** @return True when the call at {@code now} (a monotonic clock in milliseconds) is to be logged. */
    synchronized boolean allow(long now) {
        calls++;
        if (calls <= ALWAYS_LOGGED) return true;

        if (calls == ALWAYS_LOGGED + 1 || now - windowStart >= WINDOW_MILLIS) {
            windowStart = now;
            windowCount = 0;
        }
        if (windowCount >= PER_WINDOW) return false;

        windowCount++;
        return true;
    }
}
