package app.wordfeudwordfinder.extension.ui;

import java.util.concurrent.atomic.AtomicBoolean;

/**
 * Bookkeeping for the one running background computation: starting a new one cancels the previous one through
 * its {@link AtomicBoolean} (which {@code MoveGenerator.generate} polls). Thread-safe.
 */
public final class Computations {
    private AtomicBoolean current;

    /** Cancels the running computation (if any) and returns the cancel flag of a new one. */
    public synchronized AtomicBoolean begin() {
        if (current != null) current.set(true);
        current = new AtomicBoolean(false);
        return current;
    }

    /** Cancels the running computation (if any). */
    public synchronized void cancel() {
        if (current != null) current.set(true);
        current = null;
    }

    /** True when {@code token} belongs to the latest computation and has not been cancelled. */
    public synchronized boolean isCurrent(AtomicBoolean token) {
        return token != null && token == current && !token.get();
    }
}
