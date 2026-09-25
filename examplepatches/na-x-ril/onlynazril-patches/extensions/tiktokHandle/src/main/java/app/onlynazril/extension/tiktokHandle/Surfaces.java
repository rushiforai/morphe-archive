package app.onlynazril.extension.tiktokHandle;

/**
 * The places a name is rendered. Each carries its own switch, so a surface that misbehaves can be
 * turned off without losing the others; a surface switch stops every element on that surface, while
 * the master switch is only the @handle stamp.
 *
 * A surface is recognised by the class on the stack while its name is rendered. That is exact and
 * per-thread — unlike a timed marker, it cannot leak into the next render on the same thread — and
 * it does not depend on which obfuscated method happens to call the getter. Detection never consults
 * a switch: which class drew a name is a property of the build, not of the settings.
 */
public final class Surfaces {
    public static final String FEED = "feed";
    public static final String COMMENTS = "comments";

    /** Any class under these prefixes on the stack means the comment surface. */
    public static final String[] COMMENT_CLASSES = {
        "com.ss.android.ugc.now.interaction.assem.Comment",
        "com.ss.android.ugc.aweme.comment",
        "com.ss.android.ugc.aweme.commentv2",
    };

    /** Fragments of the feed bind path, the surface with no single owning class. */
    public static final String[] FEED_HINTS = {
        "videoauthorinfo", "FeedBaseViewModel", "VideoItemParams",
    };

    private Surfaces() {}

    /** Only the feed is on out of the box; the rest are opt-in. */
    public static boolean defaultEnabled(String surface) {
        return FEED.equals(surface);
    }
}
