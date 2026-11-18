package io.github.sabopura.morphe.extension.twitch.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;

/** Line icons drawn with {@link Path} on a 24-unit grid, the same whatever the device's font. */
public final class Icons {
    public enum Kind {
        SEARCH, CLOSE, BACK, CHEVRON, CHECK, RADIO_ON, RADIO_OFF, SETTINGS, SUN, VOLUME, MUTED, MINUS, PLUS, UNDO, RESET,
        SHIELD, CHAT, DANMAKU, PLAY, HOME, LOCK, INFO, WARNING, RELOAD, CHART, CLOCK, PERSON, LIST, REWIND, FORWARD,
        BACKSPACE
    }

    private Icons() {
    }

    public static Path path(Kind kind) {
        Path p = new Path();
        switch (kind) {
            case SEARCH:
                p.addCircle(10.6f, 10.6f, 7f, Path.Direction.CW);
                p.moveTo(15.6f, 15.6f);
                p.lineTo(20.5f, 20.5f);
                break;
            case CLOSE:
                p.moveTo(6, 6);
                p.lineTo(18, 18);
                p.moveTo(18, 6);
                p.lineTo(6, 18);
                break;
            case BACK:
                p.moveTo(19, 12);
                p.lineTo(5, 12);
                p.moveTo(12, 19);
                p.lineTo(5, 12);
                p.lineTo(12, 5);
                break;
            case CHEVRON:
                p.moveTo(9, 6);
                p.lineTo(15, 12);
                p.lineTo(9, 18);
                break;
            case CHECK:
                p.moveTo(5, 12.5f);
                p.lineTo(10, 17.5f);
                p.lineTo(19, 6.5f);
                break;
            case RADIO_ON:
                p.addCircle(12, 12, 8.5f, Path.Direction.CW);
                p.addCircle(12, 12, 3f, Path.Direction.CW);
                break;
            case RADIO_OFF:
                p.addCircle(12, 12, 8.5f, Path.Direction.CW);
                break;
            case SETTINGS:
                p.addCircle(12, 12, 3.2f, Path.Direction.CW);
                p.addCircle(12, 12, 7f, Path.Direction.CW);
                spokes(p, 7f, 9.5f);
                break;
            case SUN:
                p.addCircle(12, 12, 4f, Path.Direction.CW);
                spokes(p, 7.5f, 9.8f);
                break;
            case VOLUME:
                speaker(p);
                p.addArc(new RectF(9.5f, 7.5f, 18.5f, 16.5f), -55, 110);
                p.addArc(new RectF(6.5f, 3.5f, 21.5f, 20.5f), -55, 110);
                break;
            case MUTED:
                speaker(p);
                p.moveTo(15, 9.5f);
                p.lineTo(20, 14.5f);
                p.moveTo(20, 9.5f);
                p.lineTo(15, 14.5f);
                break;
            case MINUS:
                p.moveTo(5, 12);
                p.lineTo(19, 12);
                break;
            case PLUS:
                p.moveTo(5, 12);
                p.lineTo(19, 12);
                p.moveTo(12, 5);
                p.lineTo(12, 19);
                break;
            case UNDO:
                p.moveTo(8.5f, 13.5f);
                p.lineTo(4, 9);
                p.lineTo(8.5f, 4.5f);
                p.moveTo(4, 9);
                p.lineTo(14.5f, 9);
                p.addArc(new RectF(8.5f, 9, 20.5f, 21), -90, 180);
                break;
            case RESET:
                p.moveTo(3.5f, 4);
                p.lineTo(3.5f, 9.5f);
                p.lineTo(9, 9.5f);
                p.addArc(new RectF(3.5f, 3.5f, 20.5f, 20.5f), 200, 320);
                break;
            case SHIELD:
                p.moveTo(12, 3);
                p.lineTo(19, 5.8f);
                p.lineTo(19, 11.5f);
                p.cubicTo(19, 16, 16, 19.5f, 12, 21);
                p.cubicTo(8, 19.5f, 5, 16, 5, 11.5f);
                p.lineTo(5, 5.8f);
                p.close();
                p.moveTo(8.8f, 12);
                p.lineTo(11.2f, 14.4f);
                p.lineTo(15.4f, 9.6f);
                break;
            case CHAT:
                p.addRoundRect(new RectF(3.5f, 4.5f, 20.5f, 16.5f), 3.5f, 3.5f, Path.Direction.CW);
                p.moveTo(8, 16.5f);
                p.lineTo(8, 20.5f);
                p.lineTo(12.5f, 16.5f);
                break;
            case DANMAKU:
                p.moveTo(3.5f, 7);
                p.lineTo(12.5f, 7);
                p.moveTo(16, 7);
                p.lineTo(20.5f, 7);
                p.moveTo(8, 12);
                p.lineTo(20.5f, 12);
                p.moveTo(3.5f, 17);
                p.lineTo(9, 17);
                p.moveTo(12.5f, 17);
                p.lineTo(18, 17);
                break;
            case PLAY:
                p.addCircle(12, 12, 8.5f, Path.Direction.CW);
                p.moveTo(10.2f, 8.6f);
                p.lineTo(15.4f, 12);
                p.lineTo(10.2f, 15.4f);
                p.close();
                break;
            case HOME:
                p.moveTo(3.5f, 11.5f);
                p.lineTo(12, 4.2f);
                p.lineTo(20.5f, 11.5f);
                p.moveTo(6.2f, 9.8f);
                p.lineTo(6.2f, 19.5f);
                p.lineTo(17.8f, 19.5f);
                p.lineTo(17.8f, 9.8f);
                break;
            case LOCK:
                p.addRoundRect(new RectF(5.5f, 10.5f, 18.5f, 20), 2.5f, 2.5f, Path.Direction.CW);
                p.moveTo(8.5f, 10.5f);
                p.lineTo(8.5f, 8);
                p.addArc(new RectF(8.5f, 4.5f, 15.5f, 11.5f), 180, 180);
                p.moveTo(15.5f, 8);
                p.lineTo(15.5f, 10.5f);
                break;
            case INFO:
                p.addCircle(12, 12, 8.5f, Path.Direction.CW);
                p.moveTo(12, 11);
                p.lineTo(12, 16.5f);
                p.moveTo(12, 7.7f);
                p.lineTo(12, 7.8f);
                break;
            case WARNING:
                p.moveTo(12, 4);
                p.lineTo(21, 19.5f);
                p.lineTo(3, 19.5f);
                p.close();
                p.moveTo(12, 10);
                p.lineTo(12, 14);
                p.moveTo(12, 16.7f);
                p.lineTo(12, 16.8f);
                break;
            case RELOAD:
                p.moveTo(20.5f, 4);
                p.lineTo(20.5f, 9.5f);
                p.lineTo(15, 9.5f);
                p.addArc(new RectF(3.5f, 3.5f, 20.5f, 20.5f), -20, -320);
                break;
            case CHART:
                p.moveTo(6, 20);
                p.lineTo(6, 13);
                p.moveTo(12, 20);
                p.lineTo(12, 5);
                p.moveTo(18, 20);
                p.lineTo(18, 9.5f);
                break;
            case CLOCK:
                p.addCircle(12, 12, 8.5f, Path.Direction.CW);
                p.moveTo(12, 7.5f);
                p.lineTo(12, 12);
                p.lineTo(15, 14);
                break;
            case PERSON:
                p.addCircle(12, 8.3f, 3.6f, Path.Direction.CW);
                p.moveTo(5, 20);
                p.cubicTo(5, 16, 8, 14, 12, 14);
                p.cubicTo(16, 14, 19, 16, 19, 20);
                break;
            case LIST:
                for (float y = 7; y <= 17; y += 5) {
                    p.moveTo(4.5f, y);
                    p.lineTo(4.6f, y);
                    p.moveTo(9, y);
                    p.lineTo(20, y);
                }
                break;
            case REWIND:
                p.moveTo(11.5f, 7);
                p.lineTo(6.5f, 12);
                p.lineTo(11.5f, 17);
                p.moveTo(17.5f, 7);
                p.lineTo(12.5f, 12);
                p.lineTo(17.5f, 17);
                break;
            case BACKSPACE:
                p.moveTo(8.5f, 5.5f);
                p.lineTo(20.5f, 5.5f);
                p.lineTo(20.5f, 18.5f);
                p.lineTo(8.5f, 18.5f);
                p.lineTo(3, 12);
                p.close();
                p.moveTo(11.5f, 9.5f);
                p.lineTo(16.5f, 14.5f);
                p.moveTo(16.5f, 9.5f);
                p.lineTo(11.5f, 14.5f);
                break;
            case FORWARD:
                p.moveTo(6.5f, 7);
                p.lineTo(11.5f, 12);
                p.lineTo(6.5f, 17);
                p.moveTo(12.5f, 7);
                p.lineTo(17.5f, 12);
                p.lineTo(12.5f, 17);
                break;
            default:
                break;
        }
        return p;
    }

    private static void speaker(Path p) {
        p.moveTo(11, 5);
        p.lineTo(6, 9);
        p.lineTo(2.5f, 9);
        p.lineTo(2.5f, 15);
        p.lineTo(6, 15);
        p.lineTo(11, 19);
        p.close();
    }

    private static void spokes(Path p, float inner, float outer) {
        for (int i = 0; i < 8; i++) {
            double angle = Math.PI / 4 * i;
            float s = (float) Math.sin(angle), c = (float) Math.cos(angle);
            p.moveTo(12 + s * inner, 12 - c * inner);
            p.lineTo(12 + s * outer, 12 - c * outer);
        }
    }

    public static Drawable drawable(Context context, Kind kind, int color, float sizeDp) {
        return new IconDrawable(kind, color, Ui.dp(context, sizeDp));
    }

    private static final class IconDrawable extends Drawable {
        private final Path source;
        private final Path scaled = new Path();
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Matrix matrix = new Matrix();
        private final int size;

        IconDrawable(Kind kind, int color, int size) {
            source = path(kind);
            this.size = size;
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
            paint.setStrokeWidth(2f * size / 24f);
            paint.setColor(color);
        }

        @Override
        public void draw(Canvas canvas) {
            float scale = Math.min(getBounds().width(), getBounds().height()) / 24f;
            matrix.setScale(scale, scale);
            matrix.postTranslate(getBounds().exactCenterX() - 12 * scale, getBounds().exactCenterY() - 12 * scale);
            source.transform(matrix, scaled);
            canvas.drawPath(scaled, paint);
        }

        @Override
        public int getIntrinsicWidth() {
            return size;
        }

        @Override
        public int getIntrinsicHeight() {
            return size;
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
