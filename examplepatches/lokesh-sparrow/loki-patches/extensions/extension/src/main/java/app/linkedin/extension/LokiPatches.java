package app.linkedin.extension;

/** Injection points of Keep feed on reopen and Anonymous profile viewing. */
@SuppressWarnings("unused")
public final class LokiPatches {
    private LokiPatches() {
    }

    /**
     * Injection point, where the feeds read when the app last went to the background. With Keep feed on reopen
     * the answer is "just now", so neither the server driven feed's rule nor the classic 7 minute rule reloads it.
     */
    public static long feedBackgroundTime(long timestamp) {
        return Settings.keepFeed() && timestamp > 0 ? System.currentTimeMillis() : timestamp;
    }

    /**
     * Injection point, at the start of ProfileTrackingFeatureImpl.sendCustomProfileViewEvent: the event behind
     * "Who viewed your profile". Skipping it doesn't send the visit, so it doesn't change your own privacy mode.
     */
    public static boolean skipProfileViewEvent() {
        boolean skip = Settings.anonymousProfileViewing();
        if (skip) Settings.debugLog("profile view event not sent");
        return skip;
    }
}
