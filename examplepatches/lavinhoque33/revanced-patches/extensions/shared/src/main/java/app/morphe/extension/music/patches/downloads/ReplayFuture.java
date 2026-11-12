/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-08.
 */
package app.morphe.extension.music.patches.downloads;

import com.google.common.util.concurrent.ListenableFuture;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CancellationException;
import java.util.concurrent.Executor;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

import app.morphe.extension.shared.utils.Logger;

/**
 * The future the offline replay answers a watch-next request with. Only the app's {@link ListenableFuture} interface
 * is used: the app's other future classes are shrunk and renamed, so the extension cannot name them.
 */
final class ReplayFuture implements ListenableFuture<Object> {
    private record Listener(Runnable task, Executor executor) {}

    private final Object lock = new Object();
    private final List<Listener> listeners = new ArrayList<>();
    private boolean done;
    private boolean cancelled;
    private Object value;
    private Throwable failure;

    /** Completes the future with the value; false when it was completed before. */
    boolean set(Object result) {
        return complete(result, null, false);
    }

    /** Completes the future with the failure; false when it was completed before. */
    boolean setException(Throwable throwable) {
        return complete(null, throwable, false);
    }

    private boolean complete(Object result, Throwable error, boolean cancel) {
        List<Listener> pending;
        synchronized (lock) {
            if (done) return false;

            done = true;
            value = result;
            failure = error;
            cancelled = cancel;
            pending = new ArrayList<>(listeners);
            listeners.clear();
            lock.notifyAll();
        }

        for (Listener listener : pending) run(listener);
        return true;
    }

    @Override
    public void addListener(Runnable task, Executor executor) {
        Listener listener = new Listener(task, executor);
        synchronized (lock) {
            if (!done) {
                listeners.add(listener);
                return;
            }
        }

        run(listener);
    }

    private static void run(Listener listener) {
        try {
            listener.executor().execute(listener.task());
        } catch (RuntimeException ex) {
            Logger.printException(() -> "ReplayFuture: a listener could not run", ex);
        }
    }

    @Override
    public boolean cancel(boolean mayInterruptIfRunning) {
        return complete(null, null, true);
    }

    @Override
    public boolean isCancelled() {
        synchronized (lock) {
            return cancelled;
        }
    }

    @Override
    public boolean isDone() {
        synchronized (lock) {
            return done;
        }
    }

    @Override
    public Object get() throws InterruptedException, ExecutionException {
        synchronized (lock) {
            while (!done) lock.wait();

            return result();
        }
    }

    @Override
    public Object get(long timeout, TimeUnit unit) throws InterruptedException, ExecutionException, TimeoutException {
        long deadline = System.nanoTime() + unit.toNanos(timeout);
        synchronized (lock) {
            while (!done) {
                long remaining = deadline - System.nanoTime();
                if (remaining <= 0) throw new TimeoutException();

                TimeUnit.NANOSECONDS.timedWait(lock, remaining);
            }

            return result();
        }
    }

    private Object result() throws ExecutionException {
        if (cancelled) throw new CancellationException();
        if (failure != null) throw new ExecutionException(failure);

        return value;
    }
}
