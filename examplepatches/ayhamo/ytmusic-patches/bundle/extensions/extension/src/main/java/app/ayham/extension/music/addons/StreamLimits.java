package app.ayham.extension.music.addons;

import java.util.ArrayDeque;
import java.util.HashMap;
import java.util.Map;

/**
 * §4a: the /stream budget per addon. TorBox-backed addons allow about 5 /stream calls a minute
 * and 60 uncached answers an hour; the manifest's limits field can say otherwise. A 429 teaches
 * the per-minute count (what got through before it, at least 1) and closes the addon until its
 * Retry-After (default 60 s, kept within 1 s to 1 h) has passed. A call over budget is not made.
 */
public final class StreamLimits {
    /** Milliseconds, injectable for tests. */
    public interface Clock {
        long nowMs();
    }

    static final long MINUTE_MS = 60_000L, HOUR_MS = 3_600_000L;

    private static final class Budget {
        final ArrayDeque<Long> calls = new ArrayDeque<>();
        final ArrayDeque<Long> uncached = new ArrayDeque<>();
        Integer perMinute;   // learnt from a 429
        long until;          // closed until (a 429's Retry-After)
    }

    private final Clock clock;
    private final Map<String, Budget> budgets = new HashMap<>();

    public StreamLimits(Clock clock) {
        this.clock = clock;
    }

    private Budget budget(String base) {
        Budget b = budgets.get(base);
        if (b == null) {
            b = new Budget();
            budgets.put(base, b);
        }
        long t = clock.nowMs();
        while (!b.calls.isEmpty() && b.calls.peekFirst() <= t - MINUTE_MS) b.calls.pollFirst();
        while (!b.uncached.isEmpty() && b.uncached.peekFirst() <= t - HOUR_MS) b.uncached.pollFirst();
        return b;
    }

    private long waitOf(Budget b, Protocol.Limits limits) {
        if (limits == null) limits = Protocol.DEFAULT_LIMITS;
        long t = clock.nowMs();
        int perMinute = Math.min(limits.streamsPerMinute, b.perMinute != null ? b.perMinute : Integer.MAX_VALUE);
        if (b.until > t) return b.until - t;
        if (b.calls.size() >= perMinute) return b.calls.peekFirst() + MINUTE_MS - t;
        if (b.uncached.size() >= limits.uncachedPerHour) return b.uncached.peekFirst() + HOUR_MS - t;
        return 0;
    }

    /** How long until a /stream call to this addon is allowed (0: now). */
    public synchronized long waitMs(String base, Protocol.Limits limits) {
        return waitOf(budget(base), limits);
    }

    /** Counts a /stream call when it is allowed and returns 0; else returns the wait and counts nothing. */
    public synchronized long tryStart(String base, Protocol.Limits limits) {
        Budget b = budget(base);
        long wait = waitOf(b, limits);
        if (wait > 0) return wait;
        b.calls.addLast(clock.nowMs());
        return 0;
    }

    /** The answer to a counted call: an uncached one counts against the hour. */
    public synchronized void answered(String base, boolean cached) {
        if (!cached) budget(base).uncached.addLast(clock.nowMs());
    }

    /** A 429 on /stream: the per-minute count becomes what got through before it; returns that count. */
    public synchronized int rateLimited(String base, Double retryAfterSec) {
        Budget b = budget(base);
        b.perMinute = Math.max(1, b.calls.size() - 1);
        double sec = Math.max(1, Math.min(3600, retryAfterSec != null ? retryAfterSec : 60));
        b.until = clock.nowMs() + (long) (sec * 1000);
        return b.perMinute;
    }
}
