package app.yydarlinker.aicaptions.source;

import app.yydarlinker.aicaptions.CaptionSourceControl;

import java.io.IOException;
import java.io.InterruptedIOException;
import java.net.HttpURLConnection;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.FutureTask;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

/**
 * Loads that are asked for twice at the same time are made once: the second consumer joins the
 * flight of the first. A consumer that leaves cannot cancel the others; the load is abandoned only
 * when the last of them has left.
 */
final class SourceLoadFlights {
    interface Loader<T> {
        T load(CaptionSourceControl control) throws Exception;
    }

    static final class Result<T> {
        final T value;

        /** Whether the value came from a load that another consumer had started. */
        final boolean joined;

        Result(T value, boolean joined) {
            this.value = value;
            this.joined = joined;
        }
    }

    private static final Map<String, Flight<?>> flights = new HashMap<>();
    private static final ThreadPoolExecutor IO = pool(2, "CaptionSharedSourceIO");
    private static final ThreadPoolExecutor CLOSE = pool(1, "CaptionSourceDisconnect");

    private SourceLoadFlights() {}

    private static ThreadPoolExecutor pool(int threads, String name) {
        return new ThreadPoolExecutor(
                threads,
                threads,
                0,
                TimeUnit.MILLISECONDS,
                new ArrayBlockingQueue<>(8),
                runnable -> {
                    Thread thread = new Thread(runnable, name);
                    thread.setDaemon(true);
                    return thread;
                },
                new ThreadPoolExecutor.AbortPolicy());
    }

    private static final class Flight<T> implements CaptionSourceControl {
        final FutureTask<T> task;
        int consumers;
        volatile boolean cancelled, started;
        volatile HttpURLConnection connection;

        Flight(Loader<T> loader) {
            task =
                    new FutureTask<>(
                            () -> {
                                started = true;
                                RawCaptionSource.checkActive(this);
                                return loader.load(this);
                            });
        }

        public boolean isCancelled() {
            return cancelled;
        }

        public void onConnection(HttpURLConnection connection) {
            this.connection = connection;
            // Called on the transport worker, never under a UI or lifecycle monitor.
            if (connection != null && cancelled) connection.disconnect();
        }

        /** Stops the load: it is taken off the queue, or its connection is closed. */
        void abandon() {
            cancelled = true;
            if (!started && IO.remove(task)) task.cancel(false);
            HttpURLConnection open = connection;
            if (open != null) {
                try {
                    CLOSE.execute(open::disconnect);
                } catch (RejectedExecutionException full) {
                    // The running load keeps its slot until its timeout closes the connection.
                }
            }
        }
    }

    /**
     * The value of the load [key]: started with [loader] if no one has, otherwise shared. A
     * consumer waits at most [waitMs] and is released at once when [consumer] is cancelled.
     */
    @SuppressWarnings("unchecked")
    static <T> Result<T> load(
            String key, int waitMs, CaptionSourceControl consumer, Loader<T> loader)
            throws Exception {
        RawCaptionSource.checkActive(consumer);
        Flight<T> flight;
        boolean joined;
        synchronized (flights) {
            flight = (Flight<T>) flights.get(key);
            joined = flight != null;
            if (!joined) {
                flight = new Flight<>(loader);
                flights.put(key, flight);
                try {
                    IO.execute(flight.task);
                } catch (RejectedExecutionException full) {
                    flights.remove(key);
                    throw new IOException("source_flight_capacity", full);
                }
            }
            flight.consumers++;
        }
        long deadline = System.nanoTime() + TimeUnit.MILLISECONDS.toNanos(Math.max(1, waitMs));
        try {
            while (true) {
                RawCaptionSource.checkActive(consumer);
                long left = deadline - System.nanoTime();
                if (left <= 0) throw new InterruptedIOException("source_consumer_deadline");
                try {
                    T value =
                            flight.task.get(
                                    Math.min(left, TimeUnit.MILLISECONDS.toNanos(20)),
                                    TimeUnit.NANOSECONDS);
                    RawCaptionSource.checkActive(consumer);
                    return new Result<>(value, joined);
                } catch (TimeoutException pending) {
                    // Check this consumer again; the shared load goes on.
                } catch (ExecutionException failure) {
                    Throwable cause = failure.getCause();
                    if (cause instanceof Exception) throw (Exception) cause;
                    if (cause instanceof Error) throw (Error) cause;
                    throw new IllegalStateException(cause);
                }
            }
        } finally {
            boolean last;
            synchronized (flights) {
                last = --flight.consumers == 0;
                if (last && flights.get(key) == flight) flights.remove(key);
            }
            // Never disconnect while holding the registry or a session monitor.
            if (last && !flight.task.isDone()) flight.abandon();
        }
    }

    static int consumers(String key) {
        synchronized (flights) {
            Flight<?> flight = flights.get(key);
            return flight == null ? 0 : flight.consumers;
        }
    }

    static int activeFlights() {
        synchronized (flights) {
            return flights.size();
        }
    }

    static int physicalWorkers() {
        return IO.getActiveCount();
    }

    static int queuedFlights() {
        return IO.getQueue().size();
    }
}
