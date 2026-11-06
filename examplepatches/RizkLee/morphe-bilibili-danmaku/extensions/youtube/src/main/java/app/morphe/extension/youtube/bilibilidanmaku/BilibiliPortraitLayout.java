package app.morphe.extension.youtube.bilibilidanmaku;

/** Geometry for the tall portrait fullscreen player; all inputs and results are physical pixels. */
final class BilibiliPortraitLayout {
    static final int MAX_ROWS = 40;

    private BilibiliPortraitLayout() {}

    /** Below the fullscreen title row (and a display cutout, if YouTube lays out under it). */
    static float top(float height, float density, float safeTop) {
        return Math.max(Math.max(88f * density, safeTop + 64f * density), height * .1f);
    }

    /** Above the seek bar, time / fullscreen row and the quick action buttons. */
    static float bottom(float height, float density) {
        return Math.max(140f * density, height * .16f);
    }

    /**
     * Tracks start below the title and cover {@code areaPercent} of the player height, but never
     * reach into the bottom controls. Tracks use the same line height as landscape playback.
     */
    static float areaHeight(float height, float top, float bottom, int areaPercent, float lineHeight) {
        float available = height - top - bottom;
        return Math.max(lineHeight, Math.min(available, height * areaPercent / 100f));
    }

    static int rowCount(float areaHeight, float lineHeight) {
        if (lineHeight <= 0) return 1;
        return Math.max(1, Math.min(MAX_ROWS, (int) (areaHeight / lineHeight)));
    }
}
