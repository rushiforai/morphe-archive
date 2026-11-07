package app.fakh.extension.linkedin;

/** Analytics blocking: MetricQueue.queueMetric returns early when one of these is true. */
@SuppressWarnings("unused")
public final class TrackingPatch {
    private static int blocked;

    /**
     * Injected at the start of MetricQueue.queueMetric, with its arguments: the adapter of an event, the
     * tracker and the builder of an event built by hand. The app reports a profile visit as a ProfileViewEvent
     * and as the page view of its profile screens (p_flagship3_profile_view, p_flagship3_profile_view_base), and
     * a visit is only listed in "Who viewed your profile" when it is reported, so these are dropped.
     */
    public static boolean dropProfileView(Object adapter, Object tracker, Object event) {
        if (!Settings.anonymousProfileViewing()) return false;
        Object subject = event != null ? event : adapter;
        if (subject == null) return false;
        String name = subject.getClass().getName();
        boolean drop = name.endsWith("ProfileViewEvent$Builder")
                || name.endsWith(".PageViewEvent") && String.valueOf(Reflect.get(subject, "pageKey")).contains("profile_view");
        if (drop) Settings.debugLog("profile visit not reported: " + name);
        return drop;
    }

    public static boolean blockTracking() {
        boolean block = Settings.blockTracking();
        // Log only now and then: tracking events are very frequent.
        if (block && (blocked++ % 50) == 0) Settings.debugLog("tracking events blocked: " + blocked);
        return block;
    }
}
