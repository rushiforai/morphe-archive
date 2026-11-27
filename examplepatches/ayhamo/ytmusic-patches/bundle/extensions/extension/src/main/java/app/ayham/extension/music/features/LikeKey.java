package app.ayham.extension.music.features;

import java.util.Locale;

/** Reads YT's like state from its media session's like action (its id and icon name, not its translated label). */
final class LikeKey {
    private LikeKey() {
    }

    /** Whether this custom action ("id icon") is the like one, not dislike. YT 9.30: thumbs_up_action. */
    static boolean isLike(String key) {
        String k = key.toLowerCase(Locale.ROOT);
        return k.contains("thumbs_up") || k.contains("thumb_up") || (k.contains("like") && !k.contains("dislike"));
    }

    /**
     * A liked song's like action shows a filled thumb (YT 9.30: yt_fill_experimental_thumb_up_vd_theme_24,
     * yt_outline_... when not liked), or undoes it.
     */
    static boolean liked(String key) {
        String k = key.toLowerCase(Locale.ROOT);
        return k.contains("fill") || k.contains("unlike") || k.contains("remove") || k.contains("undo");
    }
}
