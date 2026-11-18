package app.afterglow.extension.playback;

import java.util.List;

/** Presentation policy for iOS's singleton-VOD transport replacement. */
public final class PaddlePolicy {
    public static final int NATIVE = 0, SEEK = 1, HIDDEN = 2;
    private PaddlePolicy() {}

    public static boolean singletonVod(String style, String videoId, String playlistId,
                                       List<?> videoIds) {
        // These are the stock style names, not inferred from duration or hasNext.
        if (!("YOUTUBE".equals(style) || "YOUTUBE_LARGE_CONTROLS".equals(style)
                || "DIBS".equals(style))) return false;
        if (videoId == null || videoId.isEmpty()) return false;
        if (playlistId != null && !playlistId.isEmpty()) return false;
        // Native playback can also carry an explicit queue without a playlist ID.
        return videoIds == null || videoIds.isEmpty()
                || (videoIds.size() == 1 && videoId.equals(videoIds.get(0)));
    }

    public static int mode(boolean enabled, boolean eligible, boolean hidden) {
        return !enabled || !eligible ? NATIVE : hidden ? HIDDEN : SEEK;
    }

    public static boolean nextPaddles(boolean original, int mode) {
        return mode == NATIVE && original;
    }

    public static boolean seekPaddles(boolean original, int mode) {
        return mode == NATIVE ? original : mode == SEEK;
    }
}
