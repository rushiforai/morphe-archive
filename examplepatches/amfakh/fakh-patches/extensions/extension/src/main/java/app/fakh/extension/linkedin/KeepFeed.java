package app.fakh.extension.linkedin;

/** Injection point of "Keep feed on reopen". */
@SuppressWarnings("unused")
public final class KeepFeed {
    private KeepFeed() {
    }

    /**
     * Injected where the feeds read when the app last went to the background. With Keep feed on reopen the answer is
     * "just now", so neither the server driven feed's rule nor the classic 7 minute rule reloads the feed.
     */
    public static long feedBackgroundTime(long timestamp) {
        return Settings.keepFeed() && timestamp > 0 ? System.currentTimeMillis() : timestamp;
    }
}
