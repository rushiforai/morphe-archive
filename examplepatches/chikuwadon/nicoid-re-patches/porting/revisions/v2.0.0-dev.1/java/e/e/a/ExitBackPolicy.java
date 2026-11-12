package e.e.a;

/** Lightweight, monotonic double-Back timing rule. */
public final class ExitBackPolicy {
    public static final long WINDOW_MS = 2000L;
    private ExitBackPolicy() {}
    public static boolean isSecondPress(long first, long now) {
        return first > 0 && now >= first && now - first <= WINDOW_MS;
    }
}
