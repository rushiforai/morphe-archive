package e.e.a;

/** Coalesce network pages without using a timer or independent refresh thread. */
public final class CommentBatchPolicy121 {
    public static final int MIN_COMMENTS = 1000;
    public static final int SLOW_COMMENTS = 500;
    public static final long MIN_INTERVAL_MS = 3000L;
    public static final long SLOW_INTERVAL_MS = 5000L;
    private CommentBatchPolicy121() { }
    public static boolean ready(int pending, long elapsedMs, boolean first) {
        if (pending <= 0) return false;
        if (first) return pending >= MIN_COMMENTS;
        return pending >= MIN_COMMENTS && elapsedMs >= MIN_INTERVAL_MS
            || pending >= SLOW_COMMENTS && elapsedMs >= SLOW_INTERVAL_MS;
    }
}
