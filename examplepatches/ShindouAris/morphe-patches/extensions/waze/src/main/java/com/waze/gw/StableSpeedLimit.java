package com.waze.gw;

/** Monotonic-time debounce; callback frequency must never shorten the settling period. */
final class StableSpeedLimit {
    static final long SETTLE_MS = 1500L;
    /**
     * A limit that leaves the last spoken value and comes back within this long was a short
     * editor segment (1-5 m at 120 inside an 80 road, or a gap with no limit), not a real change.
     */
    static final long EXCURSION_MS = 10_000L;
    private int candidate = Integer.MIN_VALUE;
    private int committed = -1;
    private long committedAt = -1L;
    private int lastSpoken = -1;
    private boolean quickReturn;
    private long since;
    private long lastSample = -1L;

    synchronized boolean update(int limit, long now) {
        if (limit != candidate || lastSample < 0L || now < lastSample
                || now - lastSample > SETTLE_MS * 2) {
            candidate = limit;
            since = now;
        }
        lastSample = now;
        if (limit == committed || now - since < SETTLE_MS) return false;
        // The previous value held from committedAt until now. If it was silent (or never
        // spoken) and the spoken value is back quickly, the road did not really change.
        quickReturn = limit == lastSpoken && committedAt >= 0L && now >= committedAt
                && now - committedAt < EXCURSION_MS;
        committed = limit;
        committedAt = now;
        return true;
    }

    /** True when the limit just committed by {@link #update} is a quick return to the spoken one. */
    synchronized boolean isQuickReturn() {
        return quickReturn;
    }

    /** Record that {@code limit} was actually announced. */
    synchronized void markSpoken(int limit) {
        lastSpoken = limit;
    }

    synchronized boolean isCurrent(int limit, long now) {
        return candidate == limit && committed == limit && lastSample >= 0L
                && now >= lastSample && now - lastSample <= SETTLE_MS * 2
                && now - since >= SETTLE_MS;
    }
}
