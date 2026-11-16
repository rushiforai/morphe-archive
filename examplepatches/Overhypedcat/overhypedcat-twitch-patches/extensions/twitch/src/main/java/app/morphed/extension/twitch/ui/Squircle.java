package app.morphed.extension.twitch.ui;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Outline;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;

/**
 * A squircle (a superellipse corner, smoother than a rounded rectangle): fill and an optional hairline border,
 * drawn anti-aliased so its edges stay smooth at any size and over any background.
 */
public final class Squircle extends Drawable {
    private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint stroke = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Path path = new Path();
    private final float radius;
    private float strokeWidth;

    public Squircle(int color, float radius) {
        this.radius = radius;
        fill.setStyle(Paint.Style.FILL);
        fill.setColor(color);
        stroke.setStyle(Paint.Style.STROKE);
    }

    public Squircle border(int color, float width) {
        stroke.setColor(color);
        strokeWidth = width;
        stroke.setStrokeWidth(width);
        return this;
    }

    /** A squircle path in bounds with corner size r (superellipse, exponent 4, per corner). */
    public static Path path(RectF bounds, float r, Path out) {
        out.reset();
        float rr = Math.min(r, Math.min(bounds.width(), bounds.height()) / 2);
        if (rr <= 0) {
            out.addRect(bounds, Path.Direction.CW);
            return out;
        }
        int steps = 24;
        float[][] corners = {
                {bounds.right - rr, bounds.top + rr, 0},
                {bounds.right - rr, bounds.bottom - rr, 1},
                {bounds.left + rr, bounds.bottom - rr, 2},
                {bounds.left + rr, bounds.top + rr, 3}};
        boolean first = true;
        for (float[] corner : corners) {
            int quadrant = (int) corner[2];
            for (int i = 0; i <= steps; i++) {
                double t = (quadrant - 1 + (double) i / steps) * Math.PI / 2; // from -pi/2 around clockwise
                double c = Math.cos(t), s = Math.sin(t);
                // superellipse |x|^n + |y|^n = 1 with n = 4
                double x = Math.signum(c) * Math.pow(Math.abs(c), 0.5);
                double y = Math.signum(s) * Math.pow(Math.abs(s), 0.5);
                float px = (float) (corner[0] + x * rr), py = (float) (corner[1] + y * rr);
                if (first) {
                    out.moveTo(px, py);
                    first = false;
                } else {
                    out.lineTo(px, py);
                }
            }
        }
        out.close();
        return out;
    }

    @Override
    protected void onBoundsChange(Rect bounds) {
        RectF area = new RectF(bounds);
        if (strokeWidth > 0) area.inset(strokeWidth / 2, strokeWidth / 2);
        path(area, radius, path);
    }

    @Override
    public void draw(Canvas canvas) {
        canvas.drawPath(path, fill);
        if (strokeWidth > 0) canvas.drawPath(path, stroke);
    }

    @Override
    public void getOutline(Outline outline) {
        // A path outline clips only from Android 13; before, the near-identical rounded rectangle does.
        if (android.os.Build.VERSION.SDK_INT >= 33) outline.setPath(path);
        else outline.setRoundRect(getBounds(), radius);
    }

    @Override
    public void setAlpha(int alpha) {
        fill.setAlpha(alpha);
        stroke.setAlpha(alpha);
        invalidateSelf();
    }

    @Override
    public void setColorFilter(ColorFilter filter) {
        fill.setColorFilter(filter);
        stroke.setColorFilter(filter);
    }

    @Override
    public int getOpacity() {
        return PixelFormat.TRANSLUCENT;
    }
}
