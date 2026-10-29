package android.os;

public final class SystemClock {
    private SystemClock() {}
    public static long elapsedRealtime() { return System.nanoTime() / 1_000_000L; }
    public static long uptimeMillis() { return System.nanoTime() / 1_000_000L; }
    public static void sleep(long ms) {
        try { Thread.sleep(ms); } catch (InterruptedException ignored) { Thread.currentThread().interrupt(); }
    }
}
