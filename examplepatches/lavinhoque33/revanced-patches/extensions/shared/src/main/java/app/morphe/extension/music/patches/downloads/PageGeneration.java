/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-10.
 */
package app.morphe.extension.music.patches.downloads;

import java.util.concurrent.atomic.AtomicInteger;

/**
 * Tells whether the Downloads page that was built is older than the stream copies. Every change of the copies
 * counts up; building or refreshing the page notes the count it was built at. A page that was never built is never
 * stale, so nothing is refreshed before a Downloads view was opened (and a restart never opens one).
 */
final class PageGeneration {
    private static final int NEVER = -1;

    private final AtomicInteger changes = new AtomicInteger();
    private volatile int builtAt = NEVER;

    void changed() {
        changes.incrementAndGet();
    }

    /** The page was built, or a refresh of it started, with the copies as they are now. */
    void built() {
        builtAt = changes.get();
    }

    boolean isStale() {
        int built = builtAt;
        return built != NEVER && built != changes.get();
    }
}
