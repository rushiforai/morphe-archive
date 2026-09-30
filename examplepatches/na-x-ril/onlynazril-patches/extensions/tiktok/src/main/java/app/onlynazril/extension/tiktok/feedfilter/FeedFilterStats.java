package app.onlynazril.extension.tiktok.feedfilter;

/**
 * What the filter has seen this process, in one line the Tweaks screen can show.
 *
 * A log is the right place for detail and the wrong place for the only answer: the app's own log can
 * be dropped by the platform, `adb` is not always at hand, and "the filter never ran" and "it ran and
 * matched nothing" produce the same empty screen. Read off the settings screen instead, they do not.
 *
 * Only the running process writes here, on the feed's thread, and only the screen reads it.
 */
public final class FeedFilterStats {
    private static volatile String last = "no list seen this run";
    private static volatile int calls;
    private static volatile int dropped;

    private FeedFilterStats() {}

    static void record(String line, int removedNow) {
        last = line;
        calls++;
        dropped += removedNow;
    }

    /** For the Tweaks screen: how much the filter saw, and what it did with the last call. */
    public static String summary() {
        if (calls == 0) return last;
        return calls + " call(s), " + dropped + " dropped \u00b7 " + last;
    }
}
