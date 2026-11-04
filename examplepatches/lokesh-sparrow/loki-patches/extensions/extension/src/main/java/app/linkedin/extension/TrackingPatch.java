package app.linkedin.extension;

/** Analytics blocking: MetricQueue.queueMetric returns early when this is true. */
@SuppressWarnings("unused")
public final class TrackingPatch {
    private static int blocked;

    public static boolean blockTracking() {
        boolean block = Settings.blockTracking();
        // Log only now and then: tracking events are very frequent.
        if (block && (blocked++ % 50) == 0) Settings.debugLog("tracking events blocked: " + blocked);
        return block;
    }
}
