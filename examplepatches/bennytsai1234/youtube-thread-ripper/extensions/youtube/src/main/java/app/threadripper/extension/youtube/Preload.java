package app.threadripper.extension.youtube;

import android.os.SystemClock;

/**
 * Injection point at the end of the app's LoadControl.shouldContinueLoading. The app stops
 * loading at a byte limit (the buffer allocator's size) or a time limit (seconds of media time,
 * not scaled by playback speed). When preload is enabled this keeps loading until
 * {@code preload_s} of media is buffered, as long as the allocator holds less than
 * {@code preload_mib}, so the buffer stays near the target instead of draining to the app's
 * restart point. Loading works in whole segments, so the buffer overshoots by up to one segment.
 */
@SuppressWarnings("unused")
public final class Preload {
    private static final long LOG_INTERVAL_MS = 2000;

    private static long lastLogMs;
    private static boolean lastOriginal;
    private static boolean lastResult;

    private Preload() {
    }

    /**
     * @param decision       the app's decision
     * @param allocatedBytes bytes held by the player's buffer allocator
     * @param byteLimit      the app's allocator limit (0 before tracks are selected)
     * @param bufferedUs     buffered media duration ahead of the playback position
     * @param speed          playback speed
     * @return whether the player should continue loading
     */
    public static boolean shouldContinueLoading(boolean decision, int allocatedBytes, int byteLimit,
                                                long bufferedUs, float speed) {
        try {
            Config config = Config.cached();
            boolean result = decision;
            if (!decision && bufferedUs < config.preloadUs && allocatedBytes < config.preloadCapBytes) {
                result = true;
            }
            if (config.log) log(decision, result, allocatedBytes, byteLimit, bufferedUs, speed);
            return result;
        } catch (Exception ex) {
            Log.e("shouldContinueLoading failure", ex);
            return decision;
        }
    }

    private static synchronized void log(boolean decision, boolean result, int allocatedBytes, int byteLimit,
                                         long bufferedUs, float speed) {
        long now = SystemClock.elapsedRealtime();
        if (decision == lastOriginal && result == lastResult && now - lastLogMs < LOG_INTERVAL_MS) return;
        lastLogMs = now;
        lastOriginal = decision;
        lastResult = result;
        Runtime rt = Runtime.getRuntime();
        Log.i(String.format(java.util.Locale.ROOT,
                "Load app=%b result=%b buffered=%.1fs speed=%.2f alloc=%.1fMiB limit=%.1fMiB heap=%dMiB/%dMiB",
                decision, result, bufferedUs / 1e6, speed, allocatedBytes / 1048576.0, byteLimit / 1048576.0,
                (rt.totalMemory() - rt.freeMemory()) >> 20, rt.maxMemory() >> 20));
    }
}
