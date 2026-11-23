package nl.johninnl.eclipse.auto.app;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Executor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import nl.johninnl.eclipse.app.ai5;

/**
 * A future the classic browse tree hands back when a level has to wait (the Home feed, a catalogue
 * collection). It implements the app's own listenable-future interface, which is all the session
 * needs of the result; it is completed exactly once, on the main thread, with the library result.
 */
final class PendingResult implements ai5 {
    private static final class Listener {
        final Runnable task;
        final Executor executor;

        Listener(Runnable task, Executor executor) {
            this.task = task;
            this.executor = executor;
        }
    }

    private final Object lock = new Object();
    private final List<Listener> listeners = new ArrayList<>();
    private boolean done;
    private Object value;

    /** Completes the future; later calls are ignored. */
    void set(Object result) {
        List<Listener> toRun;
        synchronized (lock) {
            if (done) return;
            done = true;
            value = result;
            toRun = new ArrayList<>(listeners);
            listeners.clear();
            lock.notifyAll();
        }
        for (Listener listener : toRun) run(listener);
    }

    private static void run(Listener listener) {
        try {
            listener.executor.execute(listener.task);
        } catch (RuntimeException rejected) {
            // A listener whose executor is gone has nothing left to tell.
        }
    }

    @Override public void a(Runnable task, Executor executor) {
        Listener listener = new Listener(task, executor);
        synchronized (lock) {
            if (!done) {
                listeners.add(listener);
                return;
            }
        }
        run(listener);
    }

    @Override public boolean cancel(boolean mayInterruptIfRunning) { return false; }

    @Override public boolean isCancelled() { return false; }

    @Override public boolean isDone() {
        synchronized (lock) { return done; }
    }

    @Override public Object get() throws InterruptedException {
        synchronized (lock) {
            while (!done) lock.wait();
            return value;
        }
    }

    @Override public Object get(long timeout, TimeUnit unit) throws InterruptedException, TimeoutException {
        long deadline = System.nanoTime() + unit.toNanos(timeout);
        synchronized (lock) {
            while (!done) {
                long remaining = deadline - System.nanoTime();
                if (remaining <= 0) throw new TimeoutException();
                TimeUnit.NANOSECONDS.timedWait(lock, remaining);
            }
            return value;
        }
    }
}
