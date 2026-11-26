/*
 * Copyright (C) 2026 lavinhoque33
 *
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-25.
 */

package app.morphe.extension.youtube.patches.general.offline;

import java.io.IOException;
import java.net.SocketException;
import java.net.SocketTimeoutException;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CancellationException;
import java.util.concurrent.TimeUnit;

import okhttp3.Call;

/** The running task's gate. Workers keep ownership of their partial ranges while parked here. */
final class OfflineTransferControl {
    enum State {RUNNING, PAUSING, PAUSED, WAITING}

    private static final long MAX_RECOVERY_BACKOFF = TimeUnit.SECONDS.toNanos(30);

    @FunctionalInterface
    interface Operation<T> {
        T run(Attempt attempt) throws IOException;
    }

    /** A response or local write error for which another request is not a network recovery. */
    static class PermanentFailure extends IOException {
        PermanentFailure(String message) {
            super(message);
        }

        PermanentFailure(String message, IOException cause) {
            super(message, cause);
        }
    }

    final class Attempt implements AutoCloseable {
        private final long generation;
        private Call call;

        private Attempt(long generation) {
            this.generation = generation;
        }

        void track(Call opened) throws IOException {
            synchronized (OfflineTransferControl.this) {
                check();
                call = opened;
            }
        }

        void check() throws IOException {
            checkCancelled();
            if (generation != OfflineTransferControl.this.generation) throw new IOException("Transfer suspended");
        }

        /** Only validated media bytes can confirm recovery; metadata and network callbacks cannot. */
        void mediaReceived() {
            synchronized (OfflineTransferControl.this) {
                if (probe != this || generation != OfflineTransferControl.this.generation) return;
                recovering = false;
                recoveryBackoff = 0;
                probe = null;
                OfflineTransferControl.this.notifyAll();
            }
            onChange.run();
        }

        /** An expiry response or resolved metadata advances the probe, but leaves the row waiting. */
        void advanceRecovery() {
            synchronized (OfflineTransferControl.this) {
                if (probe == this && generation == OfflineTransferControl.this.generation) {
                    nextProbe = System.nanoTime();
                }
            }
        }

        @Override
        public void close() {
            boolean changed;
            synchronized (OfflineTransferControl.this) {
                State previous = state();
                active.remove(this);
                if (probe == this) {
                    probe = null;
                    OfflineTransferControl.this.notifyAll();
                }
                changed = state() != previous;
            }
            if (changed) onChange.run();
        }
    }

    private final List<Attempt> active = new ArrayList<>();
    private final Runnable onChange;
    private final int attempts;
    private final long backoffNanos;
    private Runnable onNetworkFailure = () -> {};
    private volatile long generation;
    private volatile boolean cancelled;
    private boolean paused;
    private boolean online = true;
    private boolean recovering;
    private Attempt probe;
    private long nextProbe;
    private long recoveryBackoff;
    private boolean sealed;

    OfflineTransferControl(Runnable onChange, int attempts, long backoffMillis) {
        this.onChange = onChange;
        this.attempts = attempts;
        this.backoffNanos = TimeUnit.MILLISECONDS.toNanos(backoffMillis);
    }

    synchronized State state() {
        if (sealed) return State.RUNNING;
        if (paused) return active.isEmpty() ? State.PAUSED : State.PAUSING;
        return online && !recovering ? State.RUNNING : State.WAITING;
    }

    void onNetworkFailure(Runnable observer) {
        onNetworkFailure = observer;
    }

    void setPaused(boolean requested) {
        synchronized (this) {
            if (sealed || cancelled || paused == requested) return;
            paused = requested;
            if (paused) {
                invalidate();
            } else if (recovering) {
                nextProbe = System.nanoTime();
            }
            notifyAll();
        }
        onChange.run();
    }

    void setOnline(boolean connected) {
        boolean changed;
        synchronized (this) {
            if (sealed || cancelled || online == connected) return;
            State previous = state();
            online = connected;
            if (!online) {
                enterRecovery();
            } else {
                // A callback can advance the next probe, but cannot certify a media response.
                nextProbe = System.nanoTime();
            }
            changed = state() != previous;
            notifyAll();
        }
        if (changed) onChange.run();
    }

    /** A synchronous network snapshot is advisory; it is not guaranteed a callback will follow it. */
    void networkUnreachable() {
        boolean changed;
        synchronized (this) {
            if (sealed || cancelled || recovering) return;
            State previous = state();
            enterRecovery();
            changed = state() != previous;
        }
        if (changed) onChange.run();
    }

    private void enterRecovery() {
        if (!recovering) {
            recovering = true;
            nextProbe = System.nanoTime() + backoffNanos;
        }
        invalidate();
        notifyAll();
    }

    private void transportFailed(Attempt attempt) {
        boolean changed;
        synchronized (this) {
            if (attempt.generation != generation || recovering) return;
            State previous = state();
            enterRecovery();
            changed = state() != previous;
        }
        if (changed) onChange.run();
    }

    static boolean isConnectivityFailure(IOException failure) {
        for (Throwable cause = failure; cause != null; cause = cause.getCause()) {
            if (cause instanceof PermanentFailure) return false;
            if (cause instanceof UnknownHostException || cause instanceof SocketTimeoutException
                    || cause instanceof SocketException) return true;
        }
        return false;
    }

    synchronized void cancel() {
        cancelled = true;
        invalidate();
        notifyAll();
    }

    /** Wakes blocked sockets after the worker pool has been interrupted, without cancelling the task. */
    synchronized void abortRequests() {
        invalidate();
    }

    private void invalidate() {
        generation++;
        // OkHttp's nonblocking Call.cancel() also aborts an exchange still connecting or blocked in a read.
        for (Attempt attempt : active) {
            if (attempt.call != null) attempt.call.cancel();
        }
    }

    <T> T execute(Operation<T> operation) throws IOException {
        long retryGeneration = -1;
        int failures = 0;
        for (;;) {
            Attempt attempt = begin();
            if (attempt.generation != retryGeneration) {
                retryGeneration = attempt.generation;
                failures = 0;
            }
            try (attempt) {
                T result = operation.run(attempt);
                attempt.advanceRecovery();
                return result;
            } catch (IOException failure) {
                checkCancelled();
                if (attempt.generation != generation) continue;
                if (failure instanceof PermanentFailure) throw failure;

                // Sync connectivity on a socket failure as well as on Android's default network callback.
                onNetworkFailure.run();
                if (isConnectivityFailure(failure)) {
                    transportFailed(attempt);
                    continue;
                }

                synchronized (this) {
                    if (attempt.generation != generation) continue;
                    if (++failures >= attempts) throw failure;
                    long deadline = System.nanoTime() + failures * backoffNanos;
                    for (long remaining; attempt.generation == generation
                            && (remaining = deadline - System.nanoTime()) > 0;) {
                        checkCancelled();
                        waitForChange(remaining);
                    }
                }
            }
        }
    }

    private synchronized Attempt begin() throws IOException {
        for (;;) {
            checkCancelled();
            if (sealed) throw new IllegalStateException("Download already finalizing");
            if (paused || !online || probe != null) {
                waitForChange(0);
                continue;
            }
            if (recovering) {
                long remaining = nextProbe - System.nanoTime();
                if (remaining > 0) {
                    waitForChange(remaining);
                    continue;
                }
            }

            Attempt attempt = new Attempt(generation);
            if (recovering) {
                probe = attempt;
                recoveryBackoff = recoveryBackoff == 0 ? backoffNanos * 2
                        : Math.min(MAX_RECOVERY_BACKOFF, recoveryBackoff * 2);
                nextProbe = System.nanoTime() + recoveryBackoff;
            }
            active.add(attempt);
            return attempt;
        }
    }

    /** Commits the transition out of the pauseable phase before any local muxing or publication. */
    synchronized void seal(Runnable finalizing) throws IOException {
        while (paused) {
            checkCancelled();
            waitForChange(0);
        }
        checkCancelled();
        sealed = true;
        finalizing.run();
    }

    private void checkCancelled() {
        if (cancelled || Thread.currentThread().isInterrupted()) throw new CancellationException();
    }

    private void waitForChange(long nanos) throws IOException {
        try {
            if (nanos == 0) wait();
            else TimeUnit.NANOSECONDS.timedWait(this, nanos);
        } catch (InterruptedException ex) {
            Thread.currentThread().interrupt();
            throw new CancellationException();
        }
    }
}
