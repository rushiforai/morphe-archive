package app.southstar21.extension.instagram.settings;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;

/** Icons for the menu, drawn in code so the extension needs no resources. */
public final class Icons {
    private Icons() {
    }

    public enum Glyph {
        /** Generic patch: a puzzle-like four-square grid. */
        PATCH,
        /** A floating tab bar pill with a selected capsule. */
        GLASS,
        /** Circular arrow. */
        RESTART,
        /** Counter-clockwise arrow with a dot, for resetting. */
        RESET,
        /** A shield, for security related patches. */
        SHIELD,
        /** A tab bar with one empty slot, for hiding tabs. */
        TABS,
        /** A play button crossed out, for removing Reels. */
        NO_REELS,
        /** A portrait in a frame, for profile pictures. */
        PICTURE,
        /** An "Ad" badge crossed out, for removing ads. */
        NO_ADS,
    }

    /** A white glyph on a rounded square filled with a soft gradient of {@code color}. */
    static Drawable tile(Glyph glyph, int color, float density) {
        return new Tile(glyph, color, density);
    }

    /** A thin "›" in {@code color}. */
    static Drawable chevron(int color, float density, boolean pointsLeft) {
        return new Chevron(color, density, pointsLeft);
    }

    private abstract static class Base extends Drawable {
        @Override
        public void setAlpha(int alpha) {
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    private static final class Tile extends Base {
        private final Glyph glyph;
        private final int color;
        private final float density;
        private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint stroke = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint solid = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF rect = new RectF();
        private final Path path = new Path();

        Tile(Glyph glyph, int color, float density) {
            this.glyph = glyph;
            this.color = color;
            this.density = density;
            stroke.setStyle(Paint.Style.STROKE);
            stroke.setStrokeCap(Paint.Cap.ROUND);
            stroke.setStrokeJoin(Paint.Join.ROUND);
            stroke.setColor(0xFFFFFFFF);
            solid.setColor(0xFFFFFFFF);
        }

        @Override
        public void draw(Canvas canvas) {
            float w = getBounds().width();
            float h = getBounds().height();
            float s = Math.min(w, h);
            canvas.save();
            canvas.translate(getBounds().left + (w - s) / 2f, getBounds().top + (h - s) / 2f);

            fill.setShader(new LinearGradient(0, 0, 0, s, lighten(color, 0.18f), color, Shader.TileMode.CLAMP));
            rect.set(0, 0, s, s);
            float corner = s * 0.26f;
            canvas.drawRoundRect(rect, corner, corner, fill);

            stroke.setStrokeWidth(Math.max(1.5f * density, s * 0.075f));
            drawGlyph(canvas, s);
            canvas.restore();
        }

        private void drawGlyph(Canvas canvas, float s) {
            switch (glyph) {
                case GLASS: {
                    rect.set(s * 0.18f, s * 0.36f, s * 0.82f, s * 0.64f);
                    canvas.drawRoundRect(rect, rect.height() / 2f, rect.height() / 2f, stroke);
                    rect.set(s * 0.25f, s * 0.42f, s * 0.47f, s * 0.58f);
                    canvas.drawRoundRect(rect, rect.height() / 2f, rect.height() / 2f, solid);
                    break;
                }
                case RESTART: {
                    rect.set(s * 0.27f, s * 0.27f, s * 0.73f, s * 0.73f);
                    canvas.drawArc(rect, -60, 290, false, stroke);
                    // Head at the arc's end (230°), pointing along its clockwise travel.
                    arrowHead(canvas, s * 0.352f, s * 0.324f, s, 320);
                    break;
                }
                case RESET: {
                    rect.set(s * 0.27f, s * 0.27f, s * 0.73f, s * 0.73f);
                    canvas.drawArc(rect, 200, -290, false, stroke);
                    // Head at the arc's end (top), pointing along its counter-clockwise travel.
                    arrowHead(canvas, s * 0.5f, s * 0.27f, s, 180);
                    canvas.drawCircle(s * 0.5f, s * 0.5f, s * 0.05f, solid);
                    break;
                }
                case SHIELD: {
                    path.reset();
                    path.moveTo(s * 0.5f, s * 0.2f);
                    path.lineTo(s * 0.75f, s * 0.3f);
                    path.cubicTo(s * 0.75f, s * 0.58f, s * 0.65f, s * 0.72f, s * 0.5f, s * 0.8f);
                    path.cubicTo(s * 0.35f, s * 0.72f, s * 0.25f, s * 0.58f, s * 0.25f, s * 0.3f);
                    path.close();
                    canvas.drawPath(path, stroke);
                    break;
                }
                case TABS: {
                    rect.set(s * 0.18f, s * 0.36f, s * 0.82f, s * 0.64f);
                    canvas.drawRoundRect(rect, rect.height() / 2f, rect.height() / 2f, stroke);
                    float r = s * 0.045f;
                    canvas.drawCircle(s * 0.34f, s * 0.5f, r, solid);
                    canvas.drawCircle(s * 0.66f, s * 0.5f, r, solid);
                    break;
                }
                case NO_REELS: {
                    rect.set(s * 0.24f, s * 0.24f, s * 0.76f, s * 0.76f);
                    canvas.drawRoundRect(rect, s * 0.12f, s * 0.12f, stroke);
                    path.reset();
                    path.moveTo(s * 0.44f, s * 0.39f);
                    path.lineTo(s * 0.61f, s * 0.5f);
                    path.lineTo(s * 0.44f, s * 0.61f);
                    path.close();
                    canvas.drawPath(path, solid);
                    canvas.drawLine(s * 0.2f, s * 0.8f, s * 0.8f, s * 0.2f, stroke);
                    break;
                }
                case PICTURE: {
                    rect.set(s * 0.24f, s * 0.24f, s * 0.76f, s * 0.76f);
                    canvas.drawRoundRect(rect, s * 0.12f, s * 0.12f, stroke);
                    canvas.drawCircle(s * 0.5f, s * 0.43f, s * 0.08f, solid);
                    path.reset();
                    path.moveTo(s * 0.34f, s * 0.68f);
                    path.cubicTo(s * 0.36f, s * 0.57f, s * 0.64f, s * 0.57f, s * 0.66f, s * 0.68f);
                    path.close();
                    canvas.drawPath(path, solid);
                    break;
                }
                case NO_ADS: {
                    rect.set(s * 0.22f, s * 0.3f, s * 0.78f, s * 0.7f);
                    canvas.drawRoundRect(rect, s * 0.1f, s * 0.1f, stroke);
                    solid.setTextSize(s * 0.24f);
                    solid.setTextAlign(Paint.Align.CENTER);
                    solid.setTypeface(Typeface.DEFAULT_BOLD);
                    canvas.drawText("Ad", s * 0.5f, s * 0.5f - (solid.ascent() + solid.descent()) / 2f, solid);
                    canvas.drawLine(s * 0.2f, s * 0.8f, s * 0.8f, s * 0.2f, stroke);
                    break;
                }
                case PATCH:
                default: {
                    float a = s * 0.25f, b = s * 0.53f, size = s * 0.22f, r = s * 0.06f;
                    rect.set(a, a, a + size, a + size);
                    canvas.drawRoundRect(rect, r, r, solid);
                    rect.set(b, a, b + size, a + size);
                    canvas.drawRoundRect(rect, r, r, stroke);
                    rect.set(a, b, a + size, b + size);
                    canvas.drawRoundRect(rect, r, r, stroke);
                    rect.set(b, b, b + size, b + size);
                    canvas.drawRoundRect(rect, r, r, solid);
                    break;
                }
            }
        }

        /** Small open arrow head at (x, y) pointing along {@code angle} degrees. */
        private void arrowHead(Canvas canvas, float x, float y, float s, float angle) {
            float len = s * 0.12f;
            double a = Math.toRadians(angle);
            double left = a + Math.toRadians(150), right = a - Math.toRadians(150);
            path.reset();
            path.moveTo(x + (float) Math.cos(left) * len, y + (float) Math.sin(left) * len);
            path.lineTo(x, y);
            path.lineTo(x + (float) Math.cos(right) * len, y + (float) Math.sin(right) * len);
            canvas.drawPath(path, stroke);
        }

        private static int lighten(int color, float amount) {
            int r = (color >> 16) & 0xFF, g = (color >> 8) & 0xFF, b = color & 0xFF;
            r += Math.round((255 - r) * amount);
            g += Math.round((255 - g) * amount);
            b += Math.round((255 - b) * amount);
            return (color & 0xFF000000) | (r << 16) | (g << 8) | b;
        }
    }

    private static final class Chevron extends Base {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path path = new Path();
        private final boolean pointsLeft;

        Chevron(int color, float density, boolean pointsLeft) {
            this.pointsLeft = pointsLeft;
            paint.setColor(color);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
            paint.setStrokeWidth((pointsLeft ? 2.4f : 2f) * density);
        }

        @Override
        public void draw(Canvas canvas) {
            float w = getBounds().width(), h = getBounds().height();
            float cx = getBounds().left + w / 2f, cy = getBounds().top + h / 2f;
            float dx = Math.min(w, h) * 0.18f, dy = Math.min(w, h) * 0.36f;
            if (pointsLeft) dx = -dx;
            path.reset();
            path.moveTo(cx - dx, cy - dy);
            path.lineTo(cx + dx, cy);
            path.lineTo(cx - dx, cy + dy);
            canvas.drawPath(path, paint);
        }
    }
}
