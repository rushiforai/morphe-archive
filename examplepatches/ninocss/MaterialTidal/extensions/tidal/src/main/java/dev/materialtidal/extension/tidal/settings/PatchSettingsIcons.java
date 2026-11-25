package dev.materialtidal.extension.tidal.settings;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;

/**
 * Crisp 24dp-grid vector icon kit for the MaterialTidal Settings screen.
 * Drawn purely with Android {@link Canvas}/{@link Path} primitives so zero XML drawable
 * resources or AndroidX vector dependencies are required at runtime.
 */
public final class PatchSettingsIcons {

    public static final int ICON_BACK = 1;
    public static final int ICON_RESET = 2;
    public static final int ICON_CHEVRON_RIGHT = 3;
    public static final int ICON_CHECK = 4;
    public static final int ICON_SPARKLE = 5;
    public static final int ICON_RELOAD = 6;
    public static final int ICON_RESTART = 7;

    public static final int ICON_OVERVIEW = 8;
    public static final int ICON_PALETTE = 9;
    public static final int ICON_SUN_MOON = 10;
    public static final int ICON_AMOLED = 11;
    public static final int ICON_BLUR = 12;
    public static final int ICON_SHAPES = 13;
    public static final int ICON_PLAYER = 14;
    public static final int ICON_WAVEFORM = 15;
    public static final int ICON_LYRICS = 16;
    public static final int ICON_CROSSFADE = 17;
    public static final int ICON_NAVBAR = 18;
    public static final int ICON_SWIPE = 19;
    public static final int ICON_HOME = 20;
    public static final int ICON_PLAYLIST = 21;
    public static final int ICON_MEDIA = 22;
    public static final int ICON_SEARCH = 23;
    public static final int ICON_SHEETS = 24;
    public static final int ICON_SPEAKER_WIFI = 25;

    public static final int ICON_COVER_SWIPE = 26;
    public static final int ICON_SQUIGGLY = 27;
    public static final int ICON_QUEUE = 28;
    public static final int ICON_TABLET = 29;
    public static final int ICON_PULSE = 30;
    public static final int ICON_HAPTIC = 31;
    public static final int ICON_SLIDER = 32;
    public static final int ICON_EYE_OFF = 33;
    public static final int ICON_REFRESH = 34;
    public static final int ICON_ARTIST = 35;
    public static final int ICON_HEART = 36;
    public static final int ICON_GRID = 37;
    public static final int ICON_NETWORK = 38;
    public static final int ICON_POWER = 39;

    private PatchSettingsIcons() {
    }

    public static SettingsVectorDrawable create(int iconId, int sizePx, int tintColor) {
        return new SettingsVectorDrawable(iconId, Math.max(16, sizePx), tintColor);
    }

    public static final class SettingsVectorDrawable extends Drawable {
        private final int iconId;
        private final int sizePx;
        private final Paint strokePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint fillPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path path = new Path();
        private final RectF arcRect = new RectF();

        private int tintColor;
        private int alpha = 255;
        private ColorFilter externalFilter;

        SettingsVectorDrawable(int iconId, int sizePx, int tintColor) {
            this.iconId = iconId;
            this.sizePx = sizePx;
            this.tintColor = tintColor;

            strokePaint.setStyle(Paint.Style.STROKE);
            strokePaint.setStrokeCap(Paint.Cap.ROUND);
            strokePaint.setStrokeJoin(Paint.Join.ROUND);
            strokePaint.setStrokeWidth(2.0f);

            fillPaint.setStyle(Paint.Style.FILL);
        }

        public void setTintColor(int color) {
            if (this.tintColor != color) {
                this.tintColor = color;
                invalidateSelf();
            }
        }

        @Override
        public int getIntrinsicWidth() {
            return sizePx;
        }

        @Override
        public int getIntrinsicHeight() {
            return sizePx;
        }

        @Override
        public void setAlpha(int alpha) {
            this.alpha = Math.max(0, Math.min(255, alpha));
            invalidateSelf();
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            this.externalFilter = colorFilter;
            invalidateSelf();
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            int w = b.width();
            int h = b.height();
            if (w <= 0 || h <= 0) {
                return;
            }
            int effAlpha = Math.round(((tintColor >>> 24) & 0xFF) * (alpha / 255f));
            int drawColor = (tintColor & 0x00FFFFFF) | (effAlpha << 24);
            strokePaint.setColor(drawColor);
            fillPaint.setColor(drawColor);
            strokePaint.setColorFilter(externalFilter);
            fillPaint.setColorFilter(externalFilter);

            float s = Math.min(w, h) / 24f;
            float ox = b.left + (w - 24f * s) * 0.5f;
            float oy = b.top + (h - 24f * s) * 0.5f;

            canvas.save();
            canvas.translate(ox, oy);
            canvas.scale(s, s);
            drawGlyph(canvas);
            canvas.restore();
        }

        private void drawGlyph(Canvas c) {
            path.reset();
            switch (iconId) {
                case ICON_BACK:
                    path.moveTo(19f, 12f);
                    path.lineTo(5f, 12f);
                    path.moveTo(11f, 6f);
                    path.lineTo(5f, 12f);
                    path.lineTo(11f, 18f);
                    c.drawPath(path, strokePaint);
                    break;

                case ICON_RESET:
                    arcRect.set(4.5f, 4.5f, 19.5f, 19.5f);
                    path.addArc(arcRect, -135f, 290f);
                    c.drawPath(path, strokePaint);
                    path.reset();
                    path.moveTo(4.5f, 5.5f);
                    path.lineTo(4.5f, 10.2f);
                    path.lineTo(9.2f, 10.2f);
                    c.drawPath(path, strokePaint);
                    break;

                case ICON_CHEVRON_RIGHT:
                    path.moveTo(9.5f, 6.5f);
                    path.lineTo(15f, 12f);
                    path.lineTo(9.5f, 17.5f);
                    c.drawPath(path, strokePaint);
                    break;

                case ICON_CHECK:
                    strokePaint.setStrokeWidth(2.35f);
                    path.moveTo(5.2f, 12.6f);
                    path.lineTo(9.8f, 17.2f);
                    path.lineTo(18.8f, 7.6f);
                    c.drawPath(path, strokePaint);
                    strokePaint.setStrokeWidth(2.0f);
                    break;

                case ICON_SPARKLE:
                    // Four-point expressive Gemini/M3 star + small accent star
                    path.moveTo(11f, 2.8f);
                    path.quadTo(11.4f, 10.6f, 19.2f, 11f);
                    path.quadTo(11.4f, 11.4f, 11f, 19.2f);
                    path.quadTo(10.6f, 11.4f, 2.8f, 11f);
                    path.quadTo(10.6f, 10.6f, 11f, 2.8f);
                    path.close();
                    c.drawPath(path, fillPaint);
                    path.reset();
                    path.moveTo(18.5f, 15f);
                    path.quadTo(18.7f, 18.3f, 21.5f, 18.5f);
                    path.quadTo(18.7f, 18.7f, 18.5f, 21.5f);
                    path.quadTo(18.3f, 18.7f, 15f, 18.5f);
                    path.quadTo(18.3f, 18.3f, 18.5f, 15f);
                    path.close();
                    c.drawPath(path, fillPaint);
                    break;

                case ICON_RELOAD:
                case ICON_REFRESH:
                    arcRect.set(4.5f, 4.5f, 19.5f, 19.5f);
                    path.addArc(arcRect, -45f, 290f);
                    c.drawPath(path, strokePaint);
                    path.reset();
                    path.moveTo(15.2f, 5.2f);
                    path.lineTo(19.6f, 5.4f);
                    path.lineTo(19.2f, 9.8f);
                    c.drawPath(path, strokePaint);
                    break;

                case ICON_RESTART:
                case ICON_POWER:
                    arcRect.set(5f, 5.5f, 19f, 19.5f);
                    path.addArc(arcRect, -55f, 290f);
                    path.moveTo(12f, 3.5f);
                    path.lineTo(12f, 10.5f);
                    c.drawPath(path, strokePaint);
                    break;

                case ICON_OVERVIEW:
                case ICON_GRID:
                    arcRect.set(4f, 4f, 10.5f, 10.5f);
                    c.drawRoundRect(arcRect, 2.5f, 2.5f, strokePaint);
                    arcRect.set(13.5f, 4f, 20f, 10.5f);
                    c.drawRoundRect(arcRect, 2.5f, 2.5f, strokePaint);
                    arcRect.set(4f, 13.5f, 10.5f, 20f);
                    c.drawRoundRect(arcRect, 2.5f, 2.5f, strokePaint);
                    arcRect.set(13.5f, 13.5f, 20f, 20f);
                    c.drawRoundRect(arcRect, 4f, 4f, fillPaint);
                    break;

                case ICON_PALETTE:
                    path.moveTo(12f, 3.5f);
                    path.cubicTo(7.2f, 3.5f, 3.5f, 7.1f, 3.5f, 11.8f);
                    path.cubicTo(3.5f, 16.5f, 7.1f, 20.3f, 11.4f, 20.3f);
                    path.cubicTo(13.1f, 20.3f, 14f, 19.3f, 14f, 18.1f);
                    path.cubicTo(14f, 17.5f, 13.7f, 17f, 13.4f, 16.6f);
                    path.cubicTo(13.1f, 16.1f, 13.4f, 15.3f, 14.3f, 15.3f);
                    path.lineTo(16.6f, 15.3f);
                    path.cubicTo(19f, 15.3f, 20.5f, 13.6f, 20.5f, 11.3f);
                    path.cubicTo(20.5f, 6.8f, 16.7f, 3.5f, 12f, 3.5f);
                    path.close();
                    c.drawPath(path, strokePaint);
                    c.drawCircle(8.2f, 10.6f, 1.35f, fillPaint);
                    c.drawCircle(11.6f, 7.8f, 1.35f, fillPaint);
                    c.drawCircle(15.6f, 9.6f, 1.35f, fillPaint);
                    break;

                case ICON_SUN_MOON:
                    c.drawCircle(12f, 12f, 4.2f, strokePaint);
                    c.drawLine(12f, 3.2f, 12f, 5.2f, strokePaint);
                    c.drawLine(12f, 18.8f, 12f, 20.8f, strokePaint);
                    c.drawLine(3.2f, 12f, 5.2f, 12f, strokePaint);
                    c.drawLine(18.8f, 12f, 20.8f, 12f, strokePaint);
                    c.drawLine(5.8f, 5.8f, 7.2f, 7.2f, strokePaint);
                    c.drawLine(16.8f, 16.8f, 18.2f, 18.2f, strokePaint);
                    c.drawLine(18.2f, 5.8f, 16.8f, 7.2f, strokePaint);
                    c.drawLine(7.2f, 16.8f, 5.8f, 18.2f, strokePaint);
                    break;

                case ICON_AMOLED:
                    path.moveTo(15.6f, 4.4f);
                    path.cubicTo(10.5f, 4.9f, 6.6f, 9.1f, 6.6f, 14.2f);
                    path.cubicTo(6.6f, 17.6f, 8.6f, 20.1f, 12.2f, 20.4f);
                    path.cubicTo(15.8f, 20.7f, 19.2f, 18.3f, 20f, 14.9f);
                    path.cubicTo(15.5f, 16.1f, 12.1f, 12.7f, 13.4f, 8.2f);
                    path.cubicTo(13.8f, 6.7f, 14.6f, 5.4f, 15.6f, 4.4f);
                    path.close();
                    c.drawPath(path, strokePaint);
                    break;

                case ICON_BLUR:
                    // Layered frosted glass tiles + soft wave
                    arcRect.set(4f, 5f, 15.5f, 15.5f);
                    c.drawRoundRect(arcRect, 3.5f, 3.5f, strokePaint);
                    arcRect.set(8.5f, 8.5f, 20f, 19f);
                    c.drawRoundRect(arcRect, 3.5f, 3.5f, strokePaint);
                    c.drawCircle(11.8f, 11.8f, 1.3f, fillPaint);
                    c.drawCircle(14.6f, 14.6f, 1.3f, fillPaint);
                    break;

                case ICON_SHAPES:
                    arcRect.set(3.8f, 4.2f, 13.2f, 13.6f);
                    c.drawRoundRect(arcRect, 3.6f, 3.6f, strokePaint);
                    c.drawCircle(15.5f, 15.5f, 4.7f, strokePaint);
                    break;

                case ICON_PLAYER:
                    c.drawCircle(12f, 12f, 8.5f, strokePaint);
                    path.moveTo(10f, 8.6f);
                    path.lineTo(16f, 12f);
                    path.lineTo(10f, 15.4f);
                    path.close();
                    c.drawPath(path, fillPaint);
                    break;

                case ICON_WAVEFORM:
                    c.drawLine(4.5f, 10f, 4.5f, 14f, strokePaint);
                    c.drawLine(8.2f, 6.5f, 8.2f, 17.5f, strokePaint);
                    c.drawLine(12f, 4.2f, 12f, 19.8f, strokePaint);
                    c.drawLine(15.8f, 7.5f, 15.8f, 16.5f, strokePaint);
                    c.drawLine(19.5f, 9.8f, 19.5f, 14.2f, strokePaint);
                    break;

                case ICON_LYRICS:
                    c.drawLine(4.5f, 7f, 15.5f, 7f, strokePaint);
                    c.drawLine(4.5f, 12f, 18.5f, 12f, strokePaint);
                    c.drawLine(4.5f, 17f, 12.5f, 17f, strokePaint);
                    c.drawCircle(18.5f, 17f, 1.7f, fillPaint);
                    break;

                case ICON_CROSSFADE:
                    path.moveTo(4f, 7.5f);
                    path.cubicTo(9.5f, 7.5f, 14.5f, 16.5f, 20f, 16.5f);
                    path.moveTo(4f, 16.5f);
                    path.cubicTo(9.5f, 16.5f, 14.5f, 7.5f, 20f, 7.5f);
                    c.drawPath(path, strokePaint);
                    path.reset();
                    path.moveTo(17.2f, 5.2f);
                    path.lineTo(20f, 7.5f);
                    path.lineTo(17.2f, 9.8f);
                    path.moveTo(17.2f, 14.2f);
                    path.lineTo(20f, 16.5f);
                    path.lineTo(17.2f, 18.8f);
                    c.drawPath(path, strokePaint);
                    break;

                case ICON_NAVBAR:
                    arcRect.set(3.2f, 4.5f, 20.8f, 19.5f);
                    c.drawRoundRect(arcRect, 3.8f, 3.8f, strokePaint);
                    arcRect.set(5.4f, 13.8f, 18.6f, 17.4f);
                    c.drawRoundRect(arcRect, 1.8f, 1.8f, fillPaint);
                    break;

                case ICON_SWIPE:
                case ICON_COVER_SWIPE:
                    path.moveTo(4f, 8.5f);
                    path.lineTo(19f, 8.5f);
                    path.moveTo(15.5f, 5.5f);
                    path.lineTo(19f, 8.5f);
                    path.lineTo(15.5f, 11.5f);
                    path.moveTo(20f, 15.5f);
                    path.lineTo(5f, 15.5f);
                    path.moveTo(8.5f, 12.5f);
                    path.lineTo(5f, 15.5f);
                    path.lineTo(8.5f, 18.5f);
                    c.drawPath(path, strokePaint);
                    break;

                case ICON_HOME:
                    path.moveTo(4.2f, 11f);
                    path.lineTo(12f, 4.4f);
                    path.lineTo(19.8f, 11f);
                    path.lineTo(19.8f, 19.2f);
                    path.lineTo(14.5f, 19.2f);
                    path.lineTo(14.5f, 13.8f);
                    path.lineTo(9.5f, 13.8f);
                    path.lineTo(9.5f, 19.2f);
                    path.lineTo(4.2f, 19.2f);
                    path.close();
                    c.drawPath(path, strokePaint);
                    break;

                case ICON_PLAYLIST:
                    c.drawLine(4.5f, 7f, 14f, 7f, strokePaint);
                    c.drawLine(4.5f, 12f, 14f, 12f, strokePaint);
                    c.drawLine(4.5f, 17f, 10.5f, 17f, strokePaint);
                    path.moveTo(16.5f, 16.5f);
                    path.lineTo(16.5f, 7.5f);
                    path.lineTo(20.2f, 8.8f);
                    c.drawPath(path, strokePaint);
                    c.drawCircle(14.8f, 16.8f, 1.9f, fillPaint);
                    break;

                case ICON_MEDIA:
                    c.drawCircle(12f, 12f, 8.2f, strokePaint);
                    c.drawCircle(12f, 12f, 2.3f, strokePaint);
                    arcRect.set(7.4f, 7.4f, 16.6f, 16.6f);
                    c.drawArc(arcRect, 200f, 65f, false, strokePaint);
                    break;

                case ICON_SEARCH:
                    c.drawCircle(10.8f, 10.8f, 6.2f, strokePaint);
                    c.drawLine(15.4f, 15.4f, 19.8f, 19.8f, strokePaint);
                    break;

                case ICON_SHEETS:
                    arcRect.set(4.5f, 11f, 19.5f, 19.5f);
                    c.drawRoundRect(arcRect, 3.2f, 3.2f, strokePaint);
                    c.drawLine(7f, 7.5f, 17f, 7.5f, strokePaint);
                    c.drawLine(9.5f, 4.5f, 14.5f, 4.5f, strokePaint);
                    break;

                case ICON_SPEAKER_WIFI:
                    arcRect.set(4.5f, 5.5f, 13.5f, 19f);
                    c.drawRoundRect(arcRect, 2.6f, 2.6f, strokePaint);
                    c.drawCircle(9f, 14.2f, 2.2f, strokePaint);
                    c.drawCircle(9f, 9f, 1.1f, fillPaint);
                    arcRect.set(14f, 7.5f, 19.5f, 14.5f);
                    c.drawArc(arcRect, -55f, 110f, false, strokePaint);
                    arcRect.set(16f, 5.2f, 22f, 16.8f);
                    c.drawArc(arcRect, -55f, 110f, false, strokePaint);
                    break;

                case ICON_SQUIGGLY:
                    path.moveTo(3.5f, 12f);
                    path.cubicTo(5.8f, 7f, 8.2f, 7f, 10.5f, 12f);
                    path.cubicTo(12.8f, 17f, 15.2f, 17f, 17.5f, 12f);
                    path.lineTo(20.5f, 12f);
                    c.drawPath(path, strokePaint);
                    break;

                case ICON_QUEUE:
                    c.drawLine(4.5f, 6.8f, 19.5f, 6.8f, strokePaint);
                    c.drawLine(4.5f, 12f, 19.5f, 12f, strokePaint);
                    c.drawLine(4.5f, 17.2f, 13f, 17.2f, strokePaint);
                    path.moveTo(16f, 15f);
                    path.lineTo(19.8f, 17.2f);
                    path.lineTo(16f, 19.4f);
                    path.close();
                    c.drawPath(path, fillPaint);
                    break;

                case ICON_TABLET:
                    arcRect.set(3.2f, 5f, 20.8f, 19f);
                    c.drawRoundRect(arcRect, 2.8f, 2.8f, strokePaint);
                    c.drawLine(14f, 5f, 14f, 19f, strokePaint);
                    break;

                case ICON_PULSE:
                    path.moveTo(3.5f, 12.5f);
                    path.lineTo(7.2f, 12.5f);
                    path.lineTo(9.8f, 6.2f);
                    path.lineTo(13.8f, 18.2f);
                    path.lineTo(16.6f, 10.5f);
                    path.lineTo(18.2f, 12.5f);
                    path.lineTo(20.5f, 12.5f);
                    c.drawPath(path, strokePaint);
                    break;

                case ICON_HAPTIC:
                    arcRect.set(7.8f, 4.5f, 16.2f, 19.5f);
                    c.drawRoundRect(arcRect, 2.2f, 2.2f, strokePaint);
                    c.drawLine(4.6f, 8.2f, 4.6f, 15.8f, strokePaint);
                    c.drawLine(19.4f, 8.2f, 19.4f, 15.8f, strokePaint);
                    break;

                case ICON_SLIDER:
                    c.drawLine(4f, 8f, 20f, 8f, strokePaint);
                    c.drawCircle(14.5f, 8f, 2.3f, fillPaint);
                    c.drawLine(4f, 16f, 20f, 16f, strokePaint);
                    c.drawCircle(9.5f, 16f, 2.3f, fillPaint);
                    break;

                case ICON_EYE_OFF:
                    path.moveTo(3.8f, 12f);
                    path.cubicTo(6.5f, 7.2f, 17.5f, 7.2f, 20.2f, 12f);
                    path.cubicTo(17.5f, 16.8f, 6.5f, 16.8f, 3.8f, 12f);
                    c.drawPath(path, strokePaint);
                    c.drawCircle(12f, 12f, 2.1f, fillPaint);
                    c.drawLine(5f, 19f, 19f, 5f, strokePaint);
                    break;

                case ICON_ARTIST:
                    c.drawCircle(12f, 8.2f, 3.5f, strokePaint);
                    path.moveTo(5.5f, 19.5f);
                    path.cubicTo(5.5f, 15.2f, 18.5f, 15.2f, 18.5f, 19.5f);
                    c.drawPath(path, strokePaint);
                    break;

                case ICON_HEART:
                    path.moveTo(12f, 19.2f);
                    path.cubicTo(6.5f, 15.4f, 4f, 12f, 4f, 8.8f);
                    path.cubicTo(4f, 6.3f, 6f, 4.6f, 8.4f, 4.6f);
                    path.cubicTo(10f, 4.6f, 11.3f, 5.5f, 12f, 6.8f);
                    path.cubicTo(12.7f, 5.5f, 14f, 4.6f, 15.6f, 4.6f);
                    path.cubicTo(18f, 4.6f, 20f, 6.3f, 20f, 8.8f);
                    path.cubicTo(20f, 12f, 17.5f, 15.4f, 12f, 19.2f);
                    path.close();
                    c.drawPath(path, strokePaint);
                    break;

                case ICON_NETWORK:
                    c.drawCircle(12f, 12f, 8f, strokePaint);
                    c.drawLine(4.4f, 12f, 19.6f, 12f, strokePaint);
                    arcRect.set(8.2f, 4f, 15.8f, 20f);
                    c.drawOval(arcRect, strokePaint);
                    break;

                default:
                    c.drawCircle(12f, 12f, 6f, strokePaint);
                    break;
            }
        }
    }
}
