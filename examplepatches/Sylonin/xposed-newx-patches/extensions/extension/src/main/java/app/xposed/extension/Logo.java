package app.xposed.extension;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;

/** X-Posed's logo (icons/logo.svg, MIT, see NOTICE), for the post card's footer. 128x128 viewBox. */
final class Logo extends Drawable {
    private static final Path TILE = new Path();
    private static final Path GLOBE = new Path();
    private static final Path MERIDIAN = new Path();
    private static final Path EQUATOR = Glyphs.svg("M17.6 61.5C38 73 90 73 110.4 61.5");
    private static final Path RIBBONS = new Path();

    static {
        TILE.addRoundRect(new RectF(4, 4, 124, 124), 27, 27, Path.Direction.CW);
        GLOBE.addCircle(64, 64, 47, Path.Direction.CW);
        MERIDIAN.addOval(new RectF(64 - 13.2f, 64 - 47, 64 + 13.2f, 64 + 47), Path.Direction.CW);
        Path ribbon = Glyphs.svg("M22 24H39.4C44.4 24 47.2 25.9 50.8 30L61 43C64.1 46.4 64 49.1 61 51.8L51.7 60.2"
                + "C49.1 62.7 46.8 63.8 43.4 61.7L39.3 59C34.9 56 32.9 52.8 30.5 48.2L18.5 28C17.1 25.6 18.4 24 22 24Z");
        // The four mirrored copies of logo.svg's <use> elements.
        float[][] mirrors = {{1, 1, 0, 0}, {-1, 1, 128, 0}, {1, -1, 0, 128}, {-1, -1, 128, 128}};
        Matrix m = new Matrix();
        for (float[] f : mirrors) {
            m.setScale(f[0], f[1]);
            m.postTranslate(f[2], f[3]);
            RIBBONS.addPath(ribbon, m);
        }
    }

    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);

    @Override
    public void draw(Canvas canvas) {
        Rect b = getBounds();
        canvas.save();
        canvas.translate(b.left, b.top);
        float scale = Math.min(b.width(), b.height()) / 128f;
        canvas.scale(scale, scale);
        paint.setStyle(Paint.Style.FILL);
        paint.setColor(0xFF191C20);
        canvas.drawPath(TILE, paint);
        paint.setStyle(Paint.Style.STROKE);
        paint.setStrokeCap(Paint.Cap.ROUND);
        paint.setStrokeJoin(Paint.Join.ROUND);
        paint.setColor(0xFF568579);
        paint.setStrokeWidth(2.2f);
        canvas.drawPath(GLOBE, paint);
        paint.setStrokeWidth(1.7f);
        canvas.drawPath(MERIDIAN, paint);
        canvas.drawPath(EQUATOR, paint);
        paint.setStyle(Paint.Style.FILL);
        paint.setColor(0xFF91D2C2);
        canvas.drawPath(RIBBONS, paint);
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
