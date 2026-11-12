/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-10.
 * Written by lavinhoque33, 2026-11-10.
 */
package app.morphe.extension.music.patches.androidauto;

import java.io.IOException;
import java.util.concurrent.Callable;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicLong;
import java.util.function.Consumer;

/** Resolves local queues off-main and delivers only the latest car selection on the session thread. */
final class AndroidAutoStreamPlayback {
    private final Executor worker;
    private final Executor session;
    private final Consumer<Exception> failure;
    private final AtomicLong generation = new AtomicLong();

    AndroidAutoStreamPlayback(Executor worker, Executor session, Consumer<Exception> failure) {
        this.worker = worker;
        this.session = session;
        this.failure = failure;
    }

    /** Every selection, including stock media IDs and a new service connection, supersedes pending local work. */
    long begin() {
        return generation.incrementAndGet();
    }

    void resolve(long request, Callable<byte[]> resolve, Consumer<byte[]> dispatch) {
        worker.execute(() -> {
            if (request != generation.get()) return;
            try {
                byte[] command = resolve.call();
                if (command == null || command.length == 0) throw new IOException("Downloaded track is unavailable");
                session.execute(() -> {
                    if (request == generation.get()) dispatch.accept(command);
                });
            } catch (Exception ex) {
                if (request == generation.get()) failure.accept(ex);
            }
        });
    }
}
