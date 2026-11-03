package app.tikkamasalla.stremio.tuning;

import java.util.List;

/**
 * What LateSubs has on screen, for the SubtitleView.setCues hook that every build runs: while it draws, cues
 * from the player's own selected track must not replace it. No Media3 reference, so no build fails on it.
 */
public final class LateSubsCues {
    /** Null: not drawing. */
    @SuppressWarnings("rawtypes")
    static volatile List drawing;

    private LateSubsCues() {
    }

    /** True while late subtitles are drawn, so sound notes in them follow the same cleanup setting. */
    public static boolean isDrawing() {
        return drawing != null;
    }

    @SuppressWarnings("rawtypes")
    public static List pick(List cues) {
        List now = drawing;
        return now == null ? cues : now;
    }
}
