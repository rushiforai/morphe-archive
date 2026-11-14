package e.e.a;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.drawable.Drawable;
import android.text.style.ReplacementSpan;

/**
 * Aligns live viewer/comment glyphs to the vertical center of the actual
 * numeric font metrics instead of ImageSpan.ALIGN_BASELINE (too high).
 * Does not change row height, text size, color or the existing icon artwork.
 */
final class NicoliveStatSpan202 extends ReplacementSpan {
    private final Drawable icon;

    NicoliveStatSpan202(Drawable drawable) {
        icon=drawable;
    }

    @Override public int getSize(Paint paint, CharSequence text, int start, int end,
                                 Paint.FontMetricsInt metrics) {
        return icon.getBounds().width();
    }

    @Override public void draw(Canvas canvas, CharSequence text, int start, int end,
                               float x, int top, int y, int bottom, Paint paint) {
        Paint.FontMetrics f=paint.getFontMetrics();
        int width=icon.getBounds().width(), height=icon.getBounds().height();
        // Paint ascent/descent include the actual glyph position around the text baseline.
        float center=y+(f.ascent+f.descent)/2f;
        canvas.save();
        canvas.translate(x,Math.round(center-height/2f));
        icon.setBounds(0,0,width,height);
        icon.draw(canvas);
        canvas.restore();
    }
}
