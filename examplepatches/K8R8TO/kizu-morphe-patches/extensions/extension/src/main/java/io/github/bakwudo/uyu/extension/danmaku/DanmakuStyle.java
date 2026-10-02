package io.github.bakwudo.uyu.extension.danmaku;

import android.graphics.Typeface;

import io.github.bakwudo.uyu.extension.settings.Settings;

/**
 * The danmaku settings at one point in time.
 */
final class DanmakuStyle {
    /** The video height is divided into this many rows. */
    final int rows;
    /** Rows comments may use, counted from the top. */
    final int usableRows;
    /** Comments shown at once. Messages beyond this are not shown. */
    final int maxComments;
    final int durationMs;
    final Typeface typeface;
    final int textColor;
    final int outlineColor;
    /** Outline stroke width as a fraction of the text size. */
    final float outlineRatio;
    final float opacity;

    private DanmakuStyle() {
        rows = Settings.DANMAKU_ROWS.get();
        usableRows = Math.max(1, rows * Settings.DANMAKU_AREA.get() / 100);
        maxComments = Settings.DANMAKU_MAX_COMMENTS.get();
        durationMs = Settings.DANMAKU_DURATION.get();
        typeface = DanmakuFonts.typeface(Settings.DANMAKU_FONT.get(), Settings.DANMAKU_FONT_WEIGHT.get());
        textColor = Settings.DANMAKU_TEXT_COLOR.get();
        outlineColor = Settings.DANMAKU_OUTLINE_COLOR.get();
        outlineRatio = Settings.DANMAKU_OUTLINE_WIDTH.get() / 100f;
        opacity = Settings.DANMAKU_OPACITY.get() / 100f;
    }

    static DanmakuStyle fromSettings() {
        return new DanmakuStyle();
    }
}
