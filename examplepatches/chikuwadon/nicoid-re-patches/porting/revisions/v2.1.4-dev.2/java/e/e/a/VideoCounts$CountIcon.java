package e.e.a;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.text.style.ReplacementSpan;

/** Immutable icon geometry shared across list cells, with scratch paint owned by each span. */
final class VideoCounts$CountIcon extends ReplacementSpan {
    private static final Path[] SHAPES = {shape(0), shape(1), shape(2), shape(3), new Path()};
    private final Path shape;
    private final int color;
    private Paint paint;
    private Paint.FontMetrics metrics;
    VideoCounts$CountIcon(int kind, int color) { this.shape = SHAPES[kind >= 0 && kind < 4 ? kind : 4]; this.color = color; }

    @Override public int getSize(Paint paint, CharSequence text, int start, int end, Paint.FontMetricsInt fm) {
        return (int) Math.ceil(paint.getTextSize());
    }

    @Override public void draw(Canvas canvas, CharSequence text, int start, int end,
            float x, int top, int baseline, int bottom, Paint textPaint) {
        if (paint == null) {
            paint = new Paint();
            metrics = new Paint.FontMetrics();
        }
        paint.set(textPaint);
        paint.setColor(color);
        paint.setStyle(Paint.Style.FILL);
        paint.setAntiAlias(true);
        float size = textPaint.getTextSize();
        textPaint.getFontMetrics(metrics);
        float center = baseline + (metrics.ascent + metrics.descent) / 2;
        int saved = canvas.save();
        canvas.translate(x, center - size / 2);
        canvas.scale(size / 24, size / 24);
        canvas.drawPath(shape, paint);
        canvas.restoreToCount(saved);
    }

    private static Path shape(int kind) {
        Path path = new Path();
        if (kind == 0) { // Play triangle.
            path.moveTo(5, 3); path.lineTo(22, 12); path.lineTo(5, 21); path.close();
        } else if (kind == 1) { // Comment bubble with tail.
            path.moveTo(3, 3); path.lineTo(21, 3); path.lineTo(21, 17);
            path.lineTo(11, 17); path.lineTo(6, 22); path.lineTo(6, 17); path.lineTo(3, 17); path.close();
        } else if (kind == 2) { // Heart.
            path.moveTo(12, 21);
            path.cubicTo(10, 19, 2, 13, 2, 8);
            path.cubicTo(2, 2, 9, 1, 12, 6);
            path.cubicTo(15, 1, 22, 2, 22, 8);
            path.cubicTo(22, 13, 14, 19, 12, 21); path.close();
        } else if (kind == 3) { // Mylist folder.
            path.moveTo(2, 4); path.lineTo(10, 4); path.lineTo(13, 7);
            path.lineTo(22, 7); path.lineTo(22, 21); path.lineTo(2, 21); path.close();
        }
        return path;
    }
}
