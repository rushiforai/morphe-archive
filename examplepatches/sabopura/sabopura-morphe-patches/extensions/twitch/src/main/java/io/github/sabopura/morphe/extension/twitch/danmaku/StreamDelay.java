package io.github.sabopura.morphe.extension.twitch.danmaku;

/**
 * How long a live comment waits before it flows. Chat arrives at once while the video is some
 * seconds behind the broadcast, so a reaction can flow before the moment it reacts to. The people
 * chatting are behind too, so only the part beyond their usual delay is waited. Pure Java for tests.
 */
final class StreamDelay {
    /** How far behind chatters usually are, on low latency. */
    static final long TYPICAL_MS = 3_000L;
    /** A reading beyond this is a paused or stalled player, not a delay worth matching. */
    static final long MAX_MS = 30_000L;

    private StreamDelay() {
    }

    /** @param latencyMs how far the video is behind the broadcast; 0 or less when unknown */
    static long hold(long latencyMs) {
        return latencyMs <= TYPICAL_MS ? 0L : Math.min(latencyMs - TYPICAL_MS, MAX_MS);
    }
}
