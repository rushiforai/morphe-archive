package app.yydarlinker.deepseekcaptions;

import java.net.HttpURLConnection;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * A total I/O deadline, not a new retry. Stops header waits and slow-drip response bodies.
 *
 * <p>N36 adds an auditable fact: the timer records whether it really fired this deadline on this
 * connection. A deadline-derived {@code SocketException} can then be reported as an actual deadline
 * rather than as a generic wire failure, and a normal {@link #close()} never counts as an expiry.</p>
 */
final class NetworkDeadline implements AutoCloseable {
    private static final ScheduledThreadPoolExecutor TIMER=new ScheduledThreadPoolExecutor(2,r->{
        Thread t=new Thread(r,"CaptionHttpDeadline");t.setDaemon(true);return t;
    });
    static { TIMER.setRemoveOnCancelPolicy(true); }
    private final ScheduledFuture<?> task;
    private final long deadlineNanos;
    private final AtomicBoolean fired=new AtomicBoolean();
    NetworkDeadline(HttpURLConnection connection,long deadlineNanos) {
        this.deadlineNanos=deadlineNanos;
        task=TIMER.schedule(()->{fired.set(true);try{connection.disconnect();}catch(Exception ignored){}},
                Math.max(0,deadlineNanos-System.nanoTime()),TimeUnit.NANOSECONDS);
    }

    /**
     * True only when this deadline's own timer ran. A completed or cancelled timer reports false, so a
     * normal close is never mistaken for an expiry and an expiry is never mistaken for a wire fault.
     */
    boolean timerFired(){return fired.get();}

    /** Milliseconds left on this deadline at the moment of the call; never negative. */
    long remainingMs(){return Math.max(0,TimeUnit.NANOSECONDS.toMillis(deadlineNanos-System.nanoTime()));}

    public void close(){task.cancel(false);}
}
