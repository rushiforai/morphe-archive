package app.morphed.extension.twitch.adblock;

/**
 * Timing of the video player's requests between two status lines of the detailed log, to show
 * whether the connection itself is slow.
 */
public final class RequestStats {
    /** Requests slower than this are counted separately. */
    static final long SLOW_MS = 3_000;

    private static int count;
    private static int failed;
    private static int slow;
    private static long totalMs;
    private static long maxMs;

    private RequestStats() {
    }

    public static synchronized void record(long ms, boolean ok) {
        count++;
        if (!ok) failed++;
        if (ms >= SLOW_MS) slow++;
        totalMs += ms;
        maxMs = Math.max(maxMs, ms);
    }

    public static synchronized String summaryAndReset() {
        String summary = count == 0
                ? "player requests: none"
                : "player requests: " + count + ", failed " + failed + ", slow " + slow
                + ", average " + (totalMs / count) + "ms, max " + maxMs + "ms";
        count = 0;
        failed = 0;
        slow = 0;
        totalMs = 0;
        maxMs = 0;
        return summary;
    }
}
