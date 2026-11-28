package app.yydarlinker.aicaptions;

import java.net.HttpURLConnection;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * A total I/O deadline, not a new retry. Stops header waits and slow-drip response bodies.
 *
 * <p>The timer records whether it really fired this deadline on this
 * connection. A deadline-derived {@code SocketException} can then be reported as an actual deadline
 * rather than as a generic wire failure, and a normal {@link #close()} never counts as an expiry.
 */
public final class NetworkDeadline implements AutoCloseable {
    private static final ScheduledThreadPoolExecutor TIMER =
            new ScheduledThreadPoolExecutor(
                    2,
                    r -> {
                        Thread t = new Thread(r, "CaptionHttpDeadline");
                        t.setDaemon(true);
                        return t;
                    });

    static {
        TIMER.setRemoveOnCancelPolicy(true);
    }

    private final ScheduledFuture<?> task;
    private final long deadlineNanos;
    private final AtomicBoolean fired = new AtomicBoolean();

    public NetworkDeadline(HttpURLConnection connection, long deadlineNanos) {
        this.deadlineNanos = deadlineNanos;
        task =
                TIMER.schedule(
                        () -> {
                            fired.set(true);
                            try {
                                connection.disconnect();
                            } catch (Exception ignored) {
                            }
                        },
                        Math.max(0, deadlineNanos - System.nanoTime()),
                        TimeUnit.NANOSECONDS);
    }

    /**
     * True only when this deadline's own timer ran. A completed or cancelled timer reports false,
     * so a normal close is never mistaken for an expiry and an expiry is never mistaken for a wire
     * fault.
     */
    boolean timerFired() {
        return fired.get();
    }

    /** Milliseconds left on this deadline at the moment of the call; never negative. */
    long remainingMs() {
        return Math.max(0, TimeUnit.NANOSECONDS.toMillis(deadlineNanos - System.nanoTime()));
    }

    public void close() {
        task.cancel(false);
    }
}

/** HTTP backoff in either delta seconds or an absolute date, never shortened before retry. */
final class RetryAfter {
    static long delayMs(String value, long now) {
        if (value == null) return 0;
        value = value.trim();
        if (value.isEmpty()) return 0;
        long seconds = 0;
        boolean digits = true;
        for (int i = 0; i < value.length(); i++) {
            char c = value.charAt(i);
            if (c < '0' || c > '9') {
                digits = false;
                break;
            }
            int digit = c - '0';
            seconds =
                    seconds > (Long.MAX_VALUE - digit) / 10
                            ? Long.MAX_VALUE : seconds * 10 + digit;
        }
        if (digits) return seconds > Long.MAX_VALUE / 1000 ? Long.MAX_VALUE : seconds * 1000;
        try {
            long at =
                    java.time.ZonedDateTime.parse(
                                    value,
                                    java.time.format.DateTimeFormatter.RFC_1123_DATE_TIME)
                            .toInstant()
                            .toEpochMilli();
            if (at <= now) return 0;
            return now < 0 && at > Long.MAX_VALUE + now ? Long.MAX_VALUE : at - now;
        } catch (RuntimeException invalid) {
            return 0;
        }
    }

    static long after(long now, long delay) {
        delay = Math.max(0, delay);
        return now > Long.MAX_VALUE - delay ? Long.MAX_VALUE : now + delay;
    }
}
