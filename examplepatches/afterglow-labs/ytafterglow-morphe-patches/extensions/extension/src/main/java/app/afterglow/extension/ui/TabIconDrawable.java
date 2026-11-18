package app.afterglow.extension.ui;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;

/**
 * Small code-drawn stand-ins for the SF Symbols the iOS tab editor shows
 * (Settings.x:1194-1213). The extension ships without resources, so each
 * symbol is a few filled shapes on a 24-unit grid, tinted Afterglow pink;
 * details are cut out in the row background color.
 */
final class TabIconDrawable extends Drawable {
    private final String symbol;
    private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint hole = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final int size;

    TabIconDrawable(String symbol, int tint, int background, int sizePx) {
        this.symbol = symbol == null ? "" : symbol;
        this.size = sizePx;
        fill.setColor(tint);
        fill.setStyle(Paint.Style.FILL);
        hole.setColor(background);
        hole.setStyle(Paint.Style.FILL);
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
    public void draw(Canvas canvas) {
        canvas.save();
        canvas.translate(getBounds().left, getBounds().top);
        float scale = Math.min(getBounds().width(), getBounds().height()) / 24f;
        canvas.scale(scale, scale);
        switch (symbol) {
            case "house.fill":
                canvas.drawPath(poly(12, 3, 22, 11.5f, 19, 11.5f, 19, 21, 5, 21, 5, 11.5f, 2, 11.5f), fill);
                canvas.drawRect(10, 14, 14, 21, hole);
                break;
            case "play.square.fill":
                canvas.drawRoundRect(new RectF(3, 3, 21, 21), 4, 4, fill);
                canvas.drawPath(poly(10, 8, 16, 12, 10, 16), hole);
                break;
            case "play.rectangle.on.rectangle.fill":
                canvas.drawRoundRect(new RectF(6, 3, 22, 14), 2.5f, 2.5f, fill);
                canvas.drawRoundRect(new RectF(2, 8, 18, 21), 2.5f, 2.5f, hole);
                canvas.drawRoundRect(new RectF(3, 9, 17, 20), 2.5f, 2.5f, fill);
                canvas.drawPath(poly(8, 11.5f, 13, 14.5f, 8, 17.5f), hole);
                break;
            case "books.vertical.fill":
                canvas.drawRoundRect(new RectF(3, 5, 7.5f, 21), 1, 1, fill);
                canvas.drawRoundRect(new RectF(9, 3, 13.5f, 21), 1, 1, fill);
                canvas.save();
                canvas.rotate(-15, 18, 21);
                canvas.drawRoundRect(new RectF(15.5f, 5, 20, 21), 1, 1, fill);
                canvas.restore();
                break;
            case "bolt.fill":
                canvas.drawPath(poly(14, 2, 5, 13.5f, 11, 13.5f, 9.5f, 22, 19, 10, 13, 10), fill);
                break;
            case "clock.fill":
                canvas.drawCircle(12, 12, 9.5f, fill);
                canvas.drawRect(11.2f, 6, 12.8f, 12.8f, hole);
                canvas.drawRect(11.2f, 11.2f, 16.5f, 12.8f, hole);
                break;
            case "bookmark.fill":
                canvas.drawPath(poly(6, 3, 18, 3, 18, 21, 12, 16.5f, 6, 21), fill);
                break;
            case "text.bubble.fill":
                canvas.drawRoundRect(new RectF(2.5f, 3.5f, 21.5f, 17), 4, 4, fill);
                canvas.drawPath(poly(6, 16, 11, 16, 6, 21), fill);
                canvas.drawRect(6.5f, 8, 17.5f, 9.4f, hole);
                canvas.drawRect(6.5f, 11.2f, 14, 12.6f, hole);
                break;
            case "bubble.left.and.bubble.right.fill":
                canvas.drawRoundRect(new RectF(2, 3, 15, 12.5f), 3.5f, 3.5f, fill);
                canvas.drawPath(poly(4.5f, 11.5f, 8, 11.5f, 4, 15), fill);
                canvas.drawRoundRect(new RectF(8.5f, 9.5f, 22, 19), 3.5f, 3.5f, hole);
                canvas.drawRoundRect(new RectF(9.5f, 10.5f, 21, 18.5f), 3, 3, fill);
                canvas.drawPath(poly(19.5f, 18, 16, 18, 20, 21.5f), fill);
                break;
            case "plus.app.fill":
                canvas.drawRoundRect(new RectF(3, 3, 21, 21), 4, 4, fill);
                canvas.drawRect(11.1f, 7, 12.9f, 17, hole);
                canvas.drawRect(7, 11.1f, 17, 12.9f, hole);
                break;
            case "sparkles":
                canvas.drawPath(sparklesPath(), fill);
                break;
            default:
                canvas.drawCircle(12, 12, 6, fill);
                break;
        }
        canvas.restore();
    }

    private static Path poly(float... points) {
        Path path = new Path();
        path.moveTo(points[0], points[1]);
        for (int i = 2; i < points.length; i += 2) path.lineTo(points[i], points[i + 1]);
        path.close();
        return path;
    }

    /**
     * SF Symbol "sparkles" stand-in on the 24-unit grid: a large, a medium and a small
     * four-point star with concave curved sides. The settings patch draws the YouTube
     * entry icon (res/drawable/ytafterglow_sparkles_24.xml) from the same three stars.
     */
    static Path sparklesPath() {
        Path path = new Path();
        addSparkle(path, 9.5f, 14f, 8f);
        addSparkle(path, 18f, 5.5f, 4.2f);
        addSparkle(path, 19.5f, 17.5f, 2.6f);
        return path;
    }

    /** One star: tips at the radius, sides pulled toward the centre (control points at 16 %). */
    private static void addSparkle(Path path, float cx, float cy, float r) {
        float k = 0.16f * r;
        path.moveTo(cx, cy - r);
        path.quadTo(cx + k, cy - k, cx + r, cy);
        path.quadTo(cx + k, cy + k, cx, cy + r);
        path.quadTo(cx - k, cy + k, cx - r, cy);
        path.quadTo(cx - k, cy - k, cx, cy - r);
        path.close();
    }

    @Override
    public void setAlpha(int alpha) {
        fill.setAlpha(alpha);
        hole.setAlpha(alpha);
    }

    @Override
    public void setColorFilter(ColorFilter colorFilter) {
        fill.setColorFilter(colorFilter);
    }

    @Override
    public int getOpacity() {
        return PixelFormat.TRANSLUCENT;
    }
}
