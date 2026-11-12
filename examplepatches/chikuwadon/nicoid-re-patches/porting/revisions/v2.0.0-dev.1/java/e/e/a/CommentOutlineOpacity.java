package e.e.a;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;

/** Composite the fill and outline together before blending the comment into the video. */
final class CommentOutlineOpacity {
    private static final ThreadLocal<Outline> OUTLINES = new ThreadLocal<>();

    private static final class Outline {
        final Paint paint = new Paint();
        final Rect bounds = new Rect();
        String text;
        float x, y;
    }

    // The settings preview and both native comment renderers pass the outline immediately before the fill.
    static boolean drawPass(Canvas canvas, String text, float x, float y, Paint paint,
                            int opacity, float strokeWidth, int shadowMode) {
        if (shadowMode != 0 || opacity >= 100 || strokeWidth <= 0) return false;
        if (opacity <= 0) return true;
        return captureOrComposite(canvas, text, x, y, paint, opacity, strokeWidth);
    }

    static void drawCustom(Canvas canvas, String text, float x, float y, Paint paint) {
        int alpha = paint.getAlpha();
        if (alpha == 0) return;
        if (alpha == 255 || !captureOrComposite(canvas, text, x, y, paint, 100, paint.getStrokeWidth())) {
            canvas.drawText(text, x, y, paint);
        }
    }

    private static boolean captureOrComposite(Canvas canvas, String text, float x, float y, Paint paint,
                                              int opacity, float strokeWidth) {
        Outline outline = OUTLINES.get();
        if (outline == null) {
            outline = new Outline();
            OUTLINES.set(outline);
        }
        if (paint.getStyle() == Paint.Style.STROKE) {
            outline.paint.set(paint);
            outline.paint.setStrokeWidth(strokeWidth);
            outline.text = text;
            outline.x = x;
            outline.y = y;
            return true;
        }
        boolean paired = x == outline.x && y == outline.y && text.equals(outline.text);
        outline.text = null;
        if (!paired) return false;
        paint.clearShadowLayer();
        composite(canvas, text, x, y, outline.paint, paint, opacity, outline.bounds);
        return true;
    }

    static void drawLive(Canvas canvas, String text, float x, float y, Paint outline, Paint fill) {
        int alpha = fill.getAlpha();
        if (alpha == 255) {
            canvas.drawText(text, x, y, outline);
            canvas.drawText(text, x, y, fill);
        } else if (alpha > 0) {
            Outline scratch = OUTLINES.get();
            if (scratch == null) {
                scratch = new Outline();
                OUTLINES.set(scratch);
            }
            composite(canvas, text, x, y, outline, fill, 100, scratch.bounds);
        }
    }

    private static void composite(Canvas canvas, String text, float x, float y, Paint outline, Paint fill,
                                  int opacity, Rect bounds) {
        int fillAlpha = fill.getAlpha(), outlineAlpha = outline.getAlpha();
        int base = Math.max(fillAlpha, outlineAlpha);
        int alpha = Math.round(base * opacity / 100f);
        if (alpha == 0) return;
        fill.getTextBounds(text, 0, text.length(), bounds);
        // The extra pixels cover the antialiasing fringe and miter joins.
        float margin = outline.getStrokeWidth() * Math.max(1f, outline.getStrokeMiter()) + 2f;
        float offset = fill.getTextAlign() == Paint.Align.LEFT ? 0 :
            fill.measureText(text) * (fill.getTextAlign() == Paint.Align.CENTER ? .5f : 1f);
        int layer = canvas.saveLayerAlpha(x - offset + bounds.left - margin, y + bounds.top - margin,
                x - offset + bounds.right + margin, y + bounds.bottom + margin, alpha);
        try {
            outline.setAlpha(Math.round(outlineAlpha * 255f / base));
            fill.setAlpha(Math.round(fillAlpha * 255f / base));
            canvas.drawText(text, x, y, outline);
            canvas.drawText(text, x, y, fill);
        } finally {
            outline.setAlpha(outlineAlpha);
            fill.setAlpha(fillAlpha);
            canvas.restoreToCount(layer);
        }
    }
}
