package io.github.sabopura.morphe.extension.twitch.danmaku;

/**
 * Tells live messages from the history Twitch replays when joining a channel. A message is live
 * when sent within the last 15 seconds, by the server's clock: the device clock may run fast, so
 * once the replay is over the smallest gap seen gives the clock's error. Pure Java for tests.
 */
final class LiveAgeGate {
    private static final long MAX_AGE_MS = 15_000L;
    /** Twitch replays history in a burst on joining; later messages show the clock's true error. */
    private static final long JOIN_SETTLE_MS = 5_000L;

    private long joinedAt = -1L;
    private long smallestGap = Long.MAX_VALUE;

    synchronized void reset() {
        joinedAt = -1L;
        smallestGap = Long.MAX_VALUE;
    }

    synchronized boolean isLive(long sentAtMs, long nowMs) {
        if (joinedAt < 0L) joinedAt = nowMs;
        long gap = nowMs - sentAtMs;
        if (nowMs - joinedAt >= JOIN_SETTLE_MS) smallestGap = Math.min(smallestGap, gap);
        long clockAhead = smallestGap == Long.MAX_VALUE ? 0L : Math.max(0L, smallestGap);
        return gap - clockAhead <= MAX_AGE_MS;
    }
}
