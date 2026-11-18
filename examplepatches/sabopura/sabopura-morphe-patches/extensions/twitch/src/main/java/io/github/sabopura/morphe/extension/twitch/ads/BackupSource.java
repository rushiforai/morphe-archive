package io.github.sabopura.morphe.extension.twitch.ads;

import java.util.List;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;
import java.util.concurrent.Future;
import java.util.concurrent.FutureTask;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.function.BooleanSupplier;
import java.util.function.LongSupplier;

/**
 * One backup player type and what is known about it. It is opened once at a time and in the
 * background, so an opening slower than one playlist refresh still serves the next refresh.
 */
final class BackupSource {
    /** A source that gave no clean playlist is left alone this long. */
    static final long COOL_DOWN_MS = 30_000;
    /** Tokens last longer, but a fresh session now and then avoids expired playlists. */
    static final long LIFETIME_MS = TimeUnit.MINUTES.toMillis(5);
    private static final long POLL_MS = 50;

    /**
     * Opens the source: its renditions, or null when it has none now. A CancellationException means
     * the opening was given up for a reason that is not the source's: it neither opens nor rests.
     */
    interface Opener {
        List<Playlists.Variant> open();
    }

    final int index;
    final String name;
    private final LongSupplier clock;
    private List<Playlists.Variant> variants;
    private long expiresAt;
    private long retryAt;
    private Future<?> opening;

    BackupSource(int index, LongSupplier clock) {
        this.index = index;
        this.name = BackupSessions.sourceName(index);
        this.clock = clock;
    }

    /** The renditions while the source is open, else null. */
    synchronized List<Playlists.Variant> variants() {
        return clock.getAsLong() <= expiresAt ? variants : null;
    }

    synchronized boolean resting() {
        return clock.getAsLong() < retryAt;
    }

    synchronized void coolDown() {
        variants = null;
        retryAt = clock.getAsLong() + COOL_DOWN_MS;
    }

    /**
     * Starts opening the source on {@code executor} unless it is open, resting or opening already.
     * A failed opening rests the source.
     *
     * @return the opening to wait for, or null when there is none.
     */
    synchronized Future<?> start(Opener opener, Executor executor) {
        if (variants() == null && !resting() && (opening == null || opening.isDone())) {
            FutureTask<Void> task = new FutureTask<>(() -> finish(opener), null);
            executor.execute(task);
            opening = task;
        }
        return opening;
    }

    private void finish(Opener opener) {
        List<Playlists.Variant> found = null;
        boolean givenUp = false;
        try {
            found = opener.open();
        } catch (CancellationException e) {
            givenUp = true;
        } finally {
            synchronized (this) {
                if (givenUp) {
                    // Nothing learned about the source.
                } else if (found == null) {
                    coolDown();
                } else {
                    variants = found;
                    expiresAt = clock.getAsLong() + LIFETIME_MS;
                }
            }
        }
    }

    /** Waits for an opening until the deadline or until {@code cancelled}; true once it is done. */
    static boolean await(Future<?> opening, long deadline, BooleanSupplier cancelled) {
        try {
            while (!opening.isDone()) {
                long left = deadline - System.currentTimeMillis();
                if (left <= 0 || cancelled.getAsBoolean()) return false;
                try {
                    opening.get(Math.min(POLL_MS, left), TimeUnit.MILLISECONDS);
                } catch (ExecutionException | TimeoutException ignored) {
                    // Done with an error, which rested the source, or not done yet.
                }
            }
            return true;
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            return false;
        }
    }
}
