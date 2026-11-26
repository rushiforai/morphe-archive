package android.os;

public final class SystemClock {
    private static final long BASE_UPTIME_MILLIS = 1_000_000L;

    private SystemClock() {}

    public static long uptimeMillis() {
        return BASE_UPTIME_MILLIS + Handler.nowMillisForTest();
    }

    public static long elapsedRealtime() {
        return uptimeMillis();
    }
}
