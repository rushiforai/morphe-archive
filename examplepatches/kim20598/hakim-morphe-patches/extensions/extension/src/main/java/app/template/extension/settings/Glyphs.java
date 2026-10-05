package app.template.extension.settings;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;

/**
 * Small vector glyphs drawn straight onto a {@link Canvas}, so the Mod-settings dialogs use real
 * icons instead of Unicode characters (which rendered at the font's mercy and never matched the
 * app's line weight). Same approach as {@code StreamingButton.PlayGlyph}.
 */
final class Glyphs {

    private Glyphs() {}

    static Drawable check(int color, float density) {
        return new Stroked(color, 2f * density) {
            @Override void path(Path p, Rect b) {
                float w = b.width(), h = b.height();
                p.moveTo(b.left + w * 0.22f, b.top + h * 0.52f);
                p.lineTo(b.left + w * 0.42f, b.top + h * 0.72f);
                p.lineTo(b.left + w * 0.80f, b.top + h * 0.30f);
            }
        };
    }

    static Drawable chevron(int color, float density, boolean up) {
        return new Stroked(color, 1.8f * density) {
            @Override void path(Path p, Rect b) {
                float w = b.width(), h = b.height();
                float y0 = up ? b.top + h * 0.64f : b.top + h * 0.38f;
                float y1 = up ? b.top + h * 0.38f : b.top + h * 0.64f;
                p.moveTo(b.left + w * 0.24f, y0);
                p.lineTo(b.left + w * 0.5f, y1);
                p.lineTo(b.left + w * 0.76f, y0);
            }
        };
    }

    /** A clock face with two hands — Letterboxd's watchlist glyph, drawn so nothing can strip its
     *  colour (a tinted VectorDrawable loses its tint to BottomNavigationView's null icon tint). */
    static Drawable clock(final int color, final float density) {
        return new Drawable() {
            private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);

            @Override public void draw(Canvas c) {
                Rect b = getBounds();
                float cx = b.exactCenterX(), cy = b.exactCenterY();
                float r = Math.min(b.width(), b.height()) * 0.42f;
                paint.setColor(color);
                paint.setStyle(Paint.Style.STROKE);
                paint.setStrokeWidth(2f * density);
                paint.setStrokeCap(Paint.Cap.ROUND);
                c.drawCircle(cx, cy, r, paint);
                // hands: one to 12, one to ~4 o'clock, like Material's access_time
                c.drawLine(cx, cy, cx, cy - r * 0.55f, paint);
                c.drawLine(cx, cy, cx + r * 0.5f, cy + r * 0.3f, paint);
            }

            @Override public void setAlpha(int a) { paint.setAlpha(a); }
            @Override public void setColorFilter(ColorFilter cf) { paint.setColorFilter(cf); }
            @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
            @Override public int getIntrinsicWidth() { return Math.round(24 * density); }
            @Override public int getIntrinsicHeight() { return Math.round(24 * density); }
        };
    }

    static Drawable back(int color, float density) {
        return new Stroked(color, 2f * density) {
            @Override void path(Path p, Rect b) {
                float w = b.width(), h = b.height();
                p.moveTo(b.left + w * 0.58f, b.top + h * 0.24f);
                p.lineTo(b.left + w * 0.32f, b.top + h * 0.5f);
                p.lineTo(b.left + w * 0.58f, b.top + h * 0.76f);
                p.moveTo(b.left + w * 0.32f, b.top + h * 0.5f);
                p.lineTo(b.left + w * 0.74f, b.top + h * 0.5f);
            }
        };
    }

    /** An empty rounded box, or a filled one with a tick. */
    static Drawable checkbox(int color, float density, boolean checked) {
        final float stroke = 1.8f * density;
        final float radius = 4f * density;
        return new Drawable() {
            private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
            private final Path tick = new Path();

            @Override public void draw(Canvas c) {
                Rect b = getBounds();
                float inset = stroke / 2f + 1f;
                float l = b.left + inset, t = b.top + inset, r = b.right - inset, bo = b.bottom - inset;

                if (checked) {
                    paint.setStyle(Paint.Style.FILL);
                    paint.setColor(color);
                    c.drawRoundRect(l, t, r, bo, radius, radius, paint);

                    paint.setStyle(Paint.Style.STROKE);
                    paint.setStrokeWidth(2f * density);
                    paint.setStrokeCap(Paint.Cap.ROUND);
                    paint.setStrokeJoin(Paint.Join.ROUND);
                    paint.setColor(0xFF10120F);
                    float w = b.width(), h = b.height();
                    tick.reset();
                    tick.moveTo(b.left + w * 0.28f, b.top + h * 0.52f);
                    tick.lineTo(b.left + w * 0.44f, b.top + h * 0.68f);
                    tick.lineTo(b.left + w * 0.74f, b.top + h * 0.32f);
                    c.drawPath(tick, paint);
                } else {
                    paint.setStyle(Paint.Style.STROKE);
                    paint.setStrokeWidth(stroke);
                    paint.setColor(color);
                    c.drawRoundRect(l, t, r, bo, radius, radius, paint);
                }
            }

            @Override public void setAlpha(int a) { paint.setAlpha(a); }
            @Override public void setColorFilter(ColorFilter cf) { paint.setColorFilter(cf); }
            @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
        };
    }

    /** A stroked open path (line cap/join rounded), shape supplied by {@link #path}. */
    private abstract static class Stroked extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path p = new Path();

        Stroked(int color, float strokeWidth) {
            paint.setStyle(Paint.Style.STROKE);
            paint.setColor(color);
            paint.setStrokeWidth(strokeWidth);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
        }

        abstract void path(Path p, Rect bounds);

        @Override public void draw(Canvas c) {
            p.reset();
            path(p, getBounds());
            c.drawPath(p, paint);
        }

        @Override public void setAlpha(int a) { paint.setAlpha(a); }
        @Override public void setColorFilter(ColorFilter cf) { paint.setColorFilter(cf); }
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }
}
