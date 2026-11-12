/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-08.
 */
package app.morphe.extension.music.patches.downloads;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

/**
 * The decisions of the backfill that fills in the stored data of stream copies that lack it. Pure: the worker
 * passes in what it read and the time, so every decision is pinned by host tests.
 */
final class OfflineBackfillLogic {
    /** How many times one copy is tried in a process before it is left for the next launch. */
    static final int MAX_FAILURES = 3;
    /** The wait after the first failure of a copy; each further failure waits four times as long. */
    static final long RETRY_BASE_MILLIS = 30_000;
    /** The pause between two copies, so the backfill never competes with what the user is playing. */
    static final long PAUSE_BETWEEN_MILLIS = 2_000;
    /** The pause after a run found nothing to do or only copies that wait for a retry. */
    static final long IDLE_MILLIS = 5 * 60_000;

    private OfflineBackfillLogic() {}

    /** @return Why the backfill must not fetch now, or null when it may. */
    @Nullable
    static String blockedReason(boolean enabled, boolean online) {
        if (!enabled) return "setting off";
        if (!online) return "offline";
        return null;
    }

    /** The copies without stored data, in a fixed order so a resumed run goes on where the last one stopped. */
    static List<String> pending(Collection<String> copyIds, Set<String> storedIds) {
        Set<String> missing = new TreeSet<>(copyIds);
        missing.removeAll(storedIds);
        return new ArrayList<>(missing);
    }

    /** The wait before a copy that failed {@code failures} times is tried again. */
    static long retryDelayMillis(int failures) {
        long delay = RETRY_BASE_MILLIS;
        for (int step = 1; step < failures; step++) delay *= 4;
        return delay;
    }

    /** Whether a run may start at {@code now}, given that the last one asked for quiet until {@code idleUntil}. */
    static boolean mayStartAgain(long idleUntil, long now) {
        return now >= idleUntil;
    }

    /** What failed, per copy: how often, and when it may be tried again. */
    static final class Schedule {
        private final Map<String, Integer> failures = new HashMap<>();
        private final Map<String, Long> retryAt = new HashMap<>();

        /** The first pending copy that is due: not given up on and not waiting for a retry. Null when none. */
        @Nullable
        synchronized String next(List<String> pending, long now) {
            for (String id : pending) {
                if (failures.getOrDefault(id, 0) >= MAX_FAILURES) continue;
                if (retryAt.getOrDefault(id, 0L) > now) continue;

                return id;
            }
            return null;
        }

        /** Counts a failure and schedules the retry; true when the copy is now given up on for this process. */
        synchronized boolean failed(String id, long now) {
            int count = failures.getOrDefault(id, 0) + 1;
            failures.put(id, count);
            retryAt.put(id, now + retryDelayMillis(count));
            return count >= MAX_FAILURES;
        }

        synchronized void succeeded(String id) {
            failures.remove(id);
            retryAt.remove(id);
        }
    }
}
