package app.threadripper.extension.youtube;

/**
 * Injection points in the app's LoadControl.shouldStartPlayback ({@code alkg.g(cus)} in
 * 21.16.256). The app starts the first playback once 1.6 s of video is buffered but, after a
 * stall, waits for 5 s (server defaults). When enabled, playback resumes after a stall once
 * {@code rebuffer_ms} is buffered. It only ever turns "wait" into "start"; it never delays playback.
 *
 * {@link #enter} runs at the start of the method, where the parameter register still holds the
 * Parameters object (the method reuses it as a local later), and {@link #shouldStartPlayback} at
 * each return. Each player calls LoadControl from its own playback thread, and the app can run
 * several players, so the parameters are kept per thread.
 */
@SuppressWarnings("unused")
public final class StallRecovery {
    /** {bufferedUs, rebuffering ? 1 : 0} of the call in progress on this thread. */
    private static final ThreadLocal<long[]> current = ThreadLocal.withInitial(() -> new long[2]);

    private StallRecovery() {
    }

    /**
     * Injection point: start of shouldStartPlayback.
     *
     * @param buffered    buffered media duration ahead of the playback position
     * @param rebuffering true when resuming after a stall (false for the first start)
     */
    public static void enter(long buffered, boolean rebuffering) {
        long[] c = current.get();
        c[0] = buffered;
        c[1] = rebuffering ? 1 : 0;
    }

    /**
     * Injection point: each return of shouldStartPlayback.
     *
     * @param decision the app's decision
     * @return whether playback should start
     */
    public static boolean shouldStartPlayback(boolean decision) {
        if (decision) return true;
        long[] c = current.get();
        long bufferedUs = c[0];
        if (c[1] == 0) return false;
        try {
            Config config = Config.cached();
            if (config.rebufferUs > 0 && bufferedUs >= config.rebufferUs) {
                if (config.log) Log.i("Resume after stall at buffered=" + (bufferedUs / 1000) + "ms");
                return true;
            }
        } catch (Exception ex) {
            Log.e("shouldStartPlayback failure", ex);
        }
        return decision;
    }
}
