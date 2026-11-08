package com.anderson.applemusic.one.widget;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;

/**
 * Hand-drawn icon set (play, pause, prev, next, search, account, chevrons, close,
 * check, refresh, plus, home, radio, library, note, more, download) built with
 * {@link Path} on a 24x24 grid. Nothing from {@code android.R.drawable}: the framework
 * set is generic and would break the Apple Music identity.
 */
public final class Icons {

    public static final int PLAY = 1;
    public static final int PAUSE = 2;
    public static final int PREV = 3;
    public static final int NEXT = 4;
    public static final int SEARCH = 5;
    public static final int ACCOUNT = 6;
    public static final int CHEVRON_RIGHT = 7;
    public static final int CHEVRON_LEFT = 8;
    public static final int CLOSE = 9;
    public static final int CHECK = 10;
    public static final int REFRESH = 11;
    public static final int PLUS = 12;
    public static final int HOME = 13;
    public static final int RADIO = 14;
    public static final int LIBRARY = 15;
    public static final int NOTE = 16;
    public static final int MORE = 17;
    public static final int DOWNLOAD = 18;
    public static final int QUEUE = 19;

    private static final float GRID = 24f;

    private Icons() {
    }

    private static boolean filled(int icon) {
        return icon == PLAY || icon == PAUSE || icon == PREV || icon == NEXT
                || icon == NOTE || icon == MORE || icon == QUEUE;
    }

    private static Path build(int icon) {
        Path path = new Path();
        switch (icon) {
            case PLAY:
                path.moveTo(8f, 5.2f);
                path.lineTo(19f, 12f);
                path.lineTo(8f, 18.8f);
                path.close();
                break;
            case PAUSE:
                path.addRoundRect(new RectF(6.4f, 5f, 10.1f, 19f), 1.6f, 1.6f,
                        Path.Direction.CW);
                path.addRoundRect(new RectF(13.9f, 5f, 17.6f, 19f), 1.6f, 1.6f,
                        Path.Direction.CW);
                break;
            case PREV:
                path.addRoundRect(new RectF(4.6f, 5f, 7.1f, 19f), 1.2f, 1.2f,
                        Path.Direction.CW);
                path.moveTo(18.8f, 5.4f);
                path.lineTo(9.6f, 12f);
                path.lineTo(18.8f, 18.6f);
                path.close();
                break;
            case NEXT:
                path.addRoundRect(new RectF(16.9f, 5f, 19.4f, 19f), 1.2f, 1.2f,
                        Path.Direction.CW);
                path.moveTo(5.2f, 5.4f);
                path.lineTo(14.4f, 12f);
                path.lineTo(5.2f, 18.6f);
                path.close();
                break;
            case SEARCH:
                path.addCircle(10.8f, 10.8f, 6.3f, Path.Direction.CW);
                path.moveTo(15.5f, 15.5f);
                path.lineTo(20.4f, 20.4f);
                break;
            case ACCOUNT:
                path.addCircle(12f, 8.3f, 3.8f, Path.Direction.CW);
                path.moveTo(5.4f, 19.8f);
                path.cubicTo(5.4f, 16f, 8.4f, 14.5f, 12f, 14.5f);
                path.cubicTo(15.6f, 14.5f, 18.6f, 16f, 18.6f, 19.8f);
                break;
            case CHEVRON_RIGHT:
                path.moveTo(9.6f, 4.8f);
                path.lineTo(16.8f, 12f);
                path.lineTo(9.6f, 19.2f);
                break;
            case CHEVRON_LEFT:
                path.moveTo(14.4f, 4.8f);
                path.lineTo(7.2f, 12f);
                path.lineTo(14.4f, 19.2f);
                break;
            case CLOSE:
                path.moveTo(6f, 6f);
                path.lineTo(18f, 18f);
                path.moveTo(18f, 6f);
                path.lineTo(6f, 18f);
                break;
            case CHECK:
                path.moveTo(4.8f, 12.6f);
                path.lineTo(9.6f, 17.4f);
                path.lineTo(19.2f, 6.6f);
                break;
            case REFRESH:
                path.addArc(new RectF(4.8f, 4.8f, 19.2f, 19.2f), 200f, 250f);
                path.moveTo(18.2f, 4.2f);
                path.lineTo(19.4f, 10.2f);
                path.lineTo(13.4f, 9.2f);
                break;
            case PLUS:
                path.moveTo(12f, 5f);
                path.lineTo(12f, 19f);
                path.moveTo(5f, 12f);
                path.lineTo(19f, 12f);
                break;
            case HOME:
                path.moveTo(4.2f, 11.4f);
                path.lineTo(12f, 4.4f);
                path.lineTo(19.8f, 11.4f);
                path.moveTo(6.4f, 10.4f);
                path.lineTo(6.4f, 19.6f);
                path.lineTo(17.6f, 19.6f);
                path.lineTo(17.6f, 10.4f);
                break;
            case RADIO:
                path.addCircle(12f, 12f, 2.1f, Path.Direction.CW);
                path.addArc(new RectF(7.4f, 7.4f, 16.6f, 16.6f), -55f, 110f);
                path.addArc(new RectF(3.8f, 3.8f, 20.2f, 20.2f), -48f, 96f);
                break;
            case LIBRARY:
                path.addRoundRect(new RectF(5f, 4f, 8.2f, 20f), 1.4f, 1.4f,
                        Path.Direction.CW);
                path.addRoundRect(new RectF(10.4f, 4f, 13.6f, 20f), 1.4f, 1.4f,
                        Path.Direction.CW);
                path.addRoundRect(new RectF(15.8f, 4f, 19f, 20f), 1.4f, 1.4f,
                        Path.Direction.CW);
                break;
            case NOTE:
                path.addCircle(7.6f, 18f, 2.6f, Path.Direction.CW);
                path.addCircle(16.4f, 16.2f, 2.6f, Path.Direction.CW);
                path.addRoundRect(new RectF(9.4f, 5.2f, 11f, 18f), 0.8f, 0.8f,
                        Path.Direction.CW);
                path.addRoundRect(new RectF(18.2f, 3.4f, 19.8f, 16.2f), 0.8f, 0.8f,
                        Path.Direction.CW);
                path.addRoundRect(new RectF(9.4f, 4.4f, 19.8f, 7.2f), 1f, 1f,
                        Path.Direction.CW);
                break;
            case MORE:
                path.addCircle(4.6f, 12f, 1.9f, Path.Direction.CW);
                path.addCircle(12f, 12f, 1.9f, Path.Direction.CW);
                path.addCircle(19.4f, 12f, 1.9f, Path.Direction.CW);
                break;
            case DOWNLOAD:
                path.moveTo(12f, 4.4f);
                path.lineTo(12f, 15.2f);
                path.moveTo(7.4f, 10.8f);
                path.lineTo(12f, 15.4f);
                path.lineTo(16.6f, 10.8f);
                path.moveTo(5.2f, 19.4f);
                path.lineTo(18.8f, 19.4f);
                break;
            case QUEUE:
                path.addRoundRect(new RectF(4.2f, 5.4f, 13.6f, 7f), 0.8f, 0.8f,
                        Path.Direction.CW);
                path.addRoundRect(new RectF(4.2f, 11.2f, 13.6f, 12.8f), 0.8f, 0.8f,
                        Path.Direction.CW);
                path.addRoundRect(new RectF(4.2f, 17f, 13.6f, 18.6f), 0.8f, 0.8f,
                        Path.Direction.CW);
                path.moveTo(16.4f, 8.6f);
                path.lineTo(20.4f, 12f);
                path.lineTo(16.4f, 15.4f);
                path.close();
                break;
            default:
                break;
        }
        return path;
    }

    /** Drawable that paints one icon in a solid colour at any size. */
    public static final class IconDrawable extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private int icon;
        private int color;

        public IconDrawable(int icon, int color) {
            this.icon = icon;
            this.color = color;
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
        }

        public void setIcon(int icon) {
            this.icon = icon;
            invalidateSelf();
        }

        public void setColor(int color) {
            this.color = color;
            invalidateSelf();
        }

        @Override
        public void draw(Canvas canvas) {
            Rect bounds = getBounds();
            float size = Math.min(bounds.width(), bounds.height());
            if (size <= 0f) return;
            float left = bounds.left + (bounds.width() - size) / 2f;
            float top = bounds.top + (bounds.height() - size) / 2f;
            boolean fill = filled(icon);
            paint.setColor(color);
            paint.setStyle(fill ? Paint.Style.FILL : Paint.Style.STROKE);
            paint.setStrokeWidth(fill ? 0f : 2.1f);
            canvas.save();
            canvas.translate(left, top);
            canvas.scale(size / GRID, size / GRID);
            canvas.drawPath(build(icon), paint);
            canvas.restore();
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(ColorFilter filter) {
            paint.setColorFilter(filter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }
}
