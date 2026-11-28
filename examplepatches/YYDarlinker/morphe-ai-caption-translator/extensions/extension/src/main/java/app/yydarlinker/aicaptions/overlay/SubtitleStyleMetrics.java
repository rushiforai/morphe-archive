package app.yydarlinker.aicaptions.overlay;

import android.graphics.Paint;
import android.graphics.Rect;

public final class SubtitleStyleMetrics {
    // Use the two measured anchor glyphs separately, rather than a line box or view height.
    private static final String[] GLYPHS = {"经", "频"};
    private static final float PROBE_EM_PX = 1024f;

    static int alpha(int opacity) {
        return Math.round(255f * Math.max(0, Math.min(100, opacity)) / 100f);
    }

    /**
     * The one caption-size contract: glyph ink height is a function of the player mode and the
     * display width only. The video plane may be letterboxed, scaled or covered while the mode
     * stays the same (a comment sheet, a panel, a transition frame); none of that is a new reading
     * size, so none of it scales the text. Geometry still decides the box width, line breaks and
     * page projection, which is where a narrower video legitimately shows fewer columns.
     */
    static float targetGlyphHeightPx(int tier, float screenWidthPx, boolean fullScreen) {
        return screenWidthPx * modeRatio(tier, fullScreen);
    }

    /** Measure the active font (including CJK fallback) at a large em to limit pixel rounding. */
    static float textSizePxForGlyphHeight(Paint paint, float targetGlyphHeightPx) {
        Paint probe = new Paint(paint);
        probe.setTextSize(PROBE_EM_PX);
        float measured = measuredGlyphHeightPx(probe);
        if (!(measured > 0))
            throw new IllegalStateException("Font has no measurable caption glyphs");
        float candidate = targetGlyphHeightPx * PROBE_EM_PX / measured;
        float best = candidate, bestError = Float.POSITIVE_INFINITY;
        float low = 0, high = candidate * 2;
        // Bounds at the final small size are pixel-quantized. Correct against those
        // actual bounds as well; keep the nearest attainable mean instead of oscillating.
        for (int i = 0; i < 16; i++) {
            probe.setTextSize(candidate);
            measured = measuredGlyphHeightPx(probe);
            float error = Math.abs(measured - targetGlyphHeightPx);
            if (error < bestError) {
                best = candidate;
                bestError = error;
            }
            if (error <= .25f) break;
            if (measured < targetGlyphHeightPx) low = candidate;
            else high = candidate;
            candidate = (low + high) / 2;
        }
        return best;
    }

    /** Mean ink bounds of the two calibration glyphs; integer bounds can round by a pixel. */
    static float measuredGlyphHeightPx(Paint paint) {
        Rect bounds = new Rect();
        float height = 0;
        for (String glyph : GLYPHS) {
            paint.getTextBounds(glyph, 0, glyph.length(), bounds);
            height += bounds.height();
        }
        return height / GLYPHS.length;
    }

    /** FontMetrics line height is recorded separately: it is not glyph ink height. */
    static float fontMetricsHeightPx(Paint paint) {
        Paint.FontMetrics fm = paint.getFontMetrics();
        return fm.descent - fm.ascent;
    }

    static float previewGlyphHeightPx(int tier, float previewWidth) {
        return fullScreenRatio(tier) * previewWidth;
    }

    public static final int COUNT = 5;
    public static final int DEFAULT_TIER = 2;
    private static final float DETAIL_SCREEN_WIDTH_PX = 1264f;
    private static final float FULL_SCREEN_WIDTH_PX = 2736f;
    private static final float FULL_SCREEN_SCALE = 55.5f / 44.5f;
    private static final float[] DETAIL_GLYPH_HEIGHTS_PX = {34f, 39f, 44.5f, 50f, 56f};

    public static int clampTier(int tier) {
        return Math.max(0, Math.min(COUNT - 1, tier));
    }

    public static float detailGlyphHeightPx(int tier) {
        return DETAIL_GLYPH_HEIGHTS_PX[clampTier(tier)];
    }

    static float fullScreenGlyphHeightPx(int tier) {
        return detailGlyphHeightPx(tier) * FULL_SCREEN_SCALE;
    }

    static float detailRatio(int tier) {
        return detailGlyphHeightPx(tier) / DETAIL_SCREEN_WIDTH_PX;
    }

    static float fullScreenRatio(int tier) {
        return fullScreenGlyphHeightPx(tier) / FULL_SCREEN_WIDTH_PX;
    }

    /**
     * The glyph/display-width ratio of a player mode. Full screen and detail differ by 55.5/44.5 at
     * their reference widths, which is the only size change a mode switch may cause; a transient
     * video rectangle inside the same mode is not a mode.
     */
    static float modeRatio(int tier, boolean fullScreen) {
        return fullScreen ? fullScreenRatio(tier) : detailRatio(tier);
    }

    public static int nearestTierForDetailGlyphHeight(float glyphHeightPx) {
        if (Float.isNaN(glyphHeightPx)) return DEFAULT_TIER;
        int nearest = 0;
        float distance = Math.abs(glyphHeightPx - DETAIL_GLYPH_HEIGHTS_PX[0]);
        for (int tier = 1; tier < COUNT; tier++) {
            float candidate = Math.abs(glyphHeightPx - DETAIL_GLYPH_HEIGHTS_PX[tier]);
            // Strict comparison makes an exact midpoint choose the smaller tier.
            if (candidate < distance) {
                nearest = tier;
                distance = candidate;
            }
        }
        return nearest;
    }
}
