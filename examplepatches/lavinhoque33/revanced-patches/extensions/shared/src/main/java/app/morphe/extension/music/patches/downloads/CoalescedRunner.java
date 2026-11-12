/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 */
package app.morphe.extension.music.patches.downloads;

import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * Runs a task on an executor, never twice at once: requests that arrive while one is queued are absorbed by it, and
 * requests that arrive while it runs cause exactly one more pass afterwards (so a late change is never missed).
 */
final class CoalescedRunner {
    private final Executor executor;
    private final Runnable task;
    private final AtomicBoolean running = new AtomicBoolean();
    private final AtomicBoolean requested = new AtomicBoolean();

    CoalescedRunner(Executor executor, Runnable task) {
        this.executor = executor;
        this.task = task;
    }

    void request() {
        requested.set(true);
        if (running.compareAndSet(false, true)) executor.execute(this::drain);
    }

    private void drain() {
        try {
            while (requested.getAndSet(false)) task.run();
        } finally {
            running.set(false);
        }
        // A request between the last check and clearing `running` found the runner busy and queued nothing.
        if (requested.get()) request();
    }
}
