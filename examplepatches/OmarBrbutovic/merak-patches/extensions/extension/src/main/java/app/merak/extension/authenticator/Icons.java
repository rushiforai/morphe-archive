package app.merak.extension.authenticator;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;

/**
 * Simple outlined icons drawn in a 24 x 24 unit space, for actions the app has no icon for.
 * Where the app has a matching icon it is used instead (see {@link Ui#appIcon}).
 */
final class Icons {

    private Icons() {
    }

    interface Painter {
        void paint(Canvas canvas, Paint stroke, Paint fill);
    }

    /** Draws a {@link Painter} scaled from a 24 unit grid to the drawable bounds. */
    static final class Glyph extends Drawable {
        private final Painter painter;
        private final Paint stroke = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);

        Glyph(int color, Painter painter) {
            this.painter = painter;
            stroke.setStyle(Paint.Style.STROKE);
            stroke.setStrokeWidth(2f);
            stroke.setStrokeCap(Paint.Cap.ROUND);
            stroke.setStrokeJoin(Paint.Join.ROUND);
            stroke.setColor(color);
            fill.setStyle(Paint.Style.FILL);
            fill.setColor(color);
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            int save = canvas.save();
            canvas.translate(b.left, b.top);
            canvas.scale(b.width() / 24f, b.height() / 24f);
            painter.paint(canvas, stroke, fill);
            canvas.restoreToCount(save);
        }

        @Override
        public void setAlpha(int alpha) {
            stroke.setAlpha(alpha);
            fill.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(ColorFilter filter) {
            stroke.setColorFilter(filter);
            fill.setColorFilter(filter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }

        @Override
        public int getIntrinsicWidth() {
            return 72;
        }

        @Override
        public int getIntrinsicHeight() {
            return 72;
        }
    }

    static Drawable delete(int color) {
        return new Glyph(color, (c, s, f) -> {
            c.drawLine(4, 6.5f, 20, 6.5f, s);
            c.drawLine(9.5f, 3.5f, 14.5f, 3.5f, s);
            Path body = new Path();
            body.moveTo(6, 6.5f);
            body.lineTo(7, 19);
            body.quadTo(7.2f, 20.5f, 8.7f, 20.5f);
            body.lineTo(15.3f, 20.5f);
            body.quadTo(16.8f, 20.5f, 17, 19);
            body.lineTo(18, 6.5f);
            c.drawPath(body, s);
            c.drawLine(10, 10.5f, 10, 16.5f, s);
            c.drawLine(14, 10.5f, 14, 16.5f, s);
        });
    }

    static Drawable palette(int color) {
        return new Glyph(color, (c, s, f) -> {
            Path outline = new Path();
            outline.moveTo(12, 3);
            outline.cubicTo(7, 3, 3, 7, 3, 12);
            outline.cubicTo(3, 17, 7, 21, 12, 21);
            outline.cubicTo(13.2f, 21, 13.8f, 20.2f, 13.5f, 19.2f);
            outline.cubicTo(13.1f, 17.9f, 13.6f, 16.5f, 15.4f, 16.5f);
            outline.lineTo(17, 16.5f);
            outline.cubicTo(19.2f, 16.5f, 21, 14.7f, 21, 12.5f);
            outline.cubicTo(21, 7.3f, 17, 3, 12, 3);
            outline.close();
            c.drawPath(outline, s);
            c.drawCircle(7.5f, 11.5f, 1.4f, f);
            c.drawCircle(10, 7.5f, 1.4f, f);
            c.drawCircle(14.5f, 7.5f, 1.4f, f);
            c.drawCircle(17, 11.5f, 1.4f, f);
        });
    }

    static Drawable checklist(int color) {
        return new Glyph(color, (c, s, f) -> {
            Path check = new Path();
            check.moveTo(3.5f, 7);
            check.lineTo(5.5f, 9);
            check.lineTo(9, 5);
            check.moveTo(3.5f, 16);
            check.lineTo(5.5f, 18);
            check.lineTo(9, 14);
            c.drawPath(check, s);
            c.drawLine(12.5f, 7.5f, 20.5f, 7.5f, s);
            c.drawLine(12.5f, 16.5f, 20.5f, 16.5f, s);
        });
    }

    static Drawable cards(int color) {
        return new Glyph(color, (c, s, f) -> {
            RectF rect = new RectF(4, 4, 20, 10.5f);
            c.drawRoundRect(rect, 2.5f, 2.5f, s);
            rect.set(4, 13.5f, 20, 20);
            c.drawRoundRect(rect, 2.5f, 2.5f, s);
        });
    }

    static Drawable folder(int color) {
        return new Glyph(color, (c, s, f) -> {
            Path path = new Path();
            path.moveTo(3.5f, 7);
            path.quadTo(3.5f, 5, 5.5f, 5);
            path.lineTo(9.5f, 5);
            path.lineTo(11.5f, 7.5f);
            path.lineTo(18.5f, 7.5f);
            path.quadTo(20.5f, 7.5f, 20.5f, 9.5f);
            path.lineTo(20.5f, 17);
            path.quadTo(20.5f, 19, 18.5f, 19);
            path.lineTo(5.5f, 19);
            path.quadTo(3.5f, 19, 3.5f, 17);
            path.close();
            c.drawPath(path, s);
        });
    }

    static Drawable info(int color) {
        return new Glyph(color, (c, s, f) -> {
            c.drawCircle(12, 12, 9, s);
            c.drawLine(12, 11, 12, 16.5f, s);
            c.drawCircle(12, 7.75f, 1.2f, f);
        });
    }

    static Drawable add(int color) {
        return new Glyph(color, (c, s, f) -> {
            c.drawLine(12, 5, 12, 19, s);
            c.drawLine(5, 12, 19, 12, s);
        });
    }

    static Drawable check(int color) {
        return new Glyph(color, (c, s, f) -> {
            Path path = new Path();
            path.moveTo(5, 12.5f);
            path.lineTo(9.5f, 17);
            path.lineTo(19, 7.5f);
            c.drawPath(path, s);
        });
    }

    /** Chevron pointing up or down. */
    static Drawable chevron(int color, boolean up) {
        return new Glyph(color, (c, s, f) -> {
            Path path = new Path();
            if (up) {
                path.moveTo(7, 14.5f);
                path.lineTo(12, 9.5f);
                path.lineTo(17, 14.5f);
            } else {
                path.moveTo(7, 9.5f);
                path.lineTo(12, 14.5f);
                path.lineTo(17, 9.5f);
            }
            c.drawPath(path, s);
        });
    }

    static Drawable chevronEnd(int color) {
        return new Glyph(color, (c, s, f) -> {
            Path path = new Path();
            path.moveTo(9.5f, 7);
            path.lineTo(14.5f, 12);
            path.lineTo(9.5f, 17);
            c.drawPath(path, s);
        });
    }

    /** Circle, square and triangle: "choose an icon". */
    static Drawable shapes(int color) {
        return new Glyph(color, (c, s, f) -> {
            c.drawCircle(7.5f, 7.5f, 4, s);
            c.drawRoundRect(new RectF(13, 3.5f, 21, 11.5f), 1.5f, 1.5f, s);
            Path triangle = new Path();
            triangle.moveTo(12, 13.5f);
            triangle.lineTo(17, 20.5f);
            triangle.lineTo(7, 20.5f);
            triangle.close();
            c.drawPath(triangle, s);
        });
    }

    /** App icon if it exists, otherwise the given fallback. */
    static Drawable appOr(Context context, String name, int tint, Drawable fallback) {
        Drawable icon = Ui.appIcon(context, name, tint);
        return icon != null ? icon : fallback;
    }
}
