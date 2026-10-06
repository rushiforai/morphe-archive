package app.yydarlinker.deepseekcaptions;

import android.graphics.Paint;
import android.graphics.Rect;

final class SubtitleStyleMetrics {
    // Use the two measured anchor glyphs separately, rather than a line box or view height.
    private static final String[] GLYPHS = {"经", "频"};
    private static final float PROBE_EM_PX = 1024f;

    static int alpha(int opacity){return Math.round(255f*Math.max(0,Math.min(100,opacity))/100f);}

    static float targetGlyphHeightPx(int tier,float screenWidthPx,boolean fullScreen) {
        return screenWidthPx * (fullScreen
                ? CaptionFontSize.fullScreenRatio(tier) : CaptionFontSize.detailRatio(tier));
    }

    static float renderedGlyphHeightPx(int tier,float screenWidthPx,boolean fullScreen,
            float videoWidthPx,float normalVideoWidthPx) {
        float target = targetGlyphHeightPx(tier,screenWidthPx,fullScreen);
        if (normalVideoWidthPx > 0 && videoWidthPx < normalVideoWidthPx * .8f)
            target *= videoWidthPx / normalVideoWidthPx;
        return target;
    }

    /** Measure the active font (including CJK fallback) at a large em to limit pixel rounding. */
    static float textSizePxForGlyphHeight(Paint paint,float targetGlyphHeightPx) {
        Paint probe = new Paint(paint);
        probe.setTextSize(PROBE_EM_PX);
        float measured = measuredGlyphHeightPx(probe);
        if (!(measured > 0)) throw new IllegalStateException("Font has no measurable caption glyphs");
        float candidate = targetGlyphHeightPx * PROBE_EM_PX / measured;
        float best = candidate, bestError = Float.POSITIVE_INFINITY;
        float low = 0, high = candidate * 2;
        // Bounds at the final small size are pixel-quantized. Correct against those
        // actual bounds as well; keep the nearest attainable mean instead of oscillating.
        for (int i = 0; i < 16; i++) {
            probe.setTextSize(candidate);
            measured = measuredGlyphHeightPx(probe);
            float error = Math.abs(measured - targetGlyphHeightPx);
            if (error < bestError) { best = candidate; bestError = error; }
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
            paint.getTextBounds(glyph,0,glyph.length(),bounds);
            height += bounds.height();
        }
        return height / GLYPHS.length;
    }

    /** FontMetrics line height is recorded separately: it is not glyph ink height. */
    static float fontMetricsHeightPx(Paint paint) {
        Paint.FontMetrics fm = paint.getFontMetrics();
        return fm.descent - fm.ascent;
    }

    static float previewGlyphHeightPx(int tier,float previewWidth) {
        return CaptionFontSize.fullScreenRatio(tier) * previewWidth;
    }
}
