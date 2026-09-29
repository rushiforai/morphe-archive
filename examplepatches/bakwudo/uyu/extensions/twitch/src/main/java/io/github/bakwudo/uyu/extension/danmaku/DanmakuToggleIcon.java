package io.github.bakwudo.uyu.extension.danmaku;

import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;

/**
 * A speech bubble with two lines of text, crossed out while danmaku is off. Drawn in code so
 * no resources are added to the app.
 */
final class DanmakuToggleIcon extends Drawable {
    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Path path = new Path();
    private final RectF bubble = new RectF();
    private final int intrinsicSize;
    private ColorStateList tint = ColorStateList.valueOf(0xFFFFFFFF);
    private int alpha = 255;
    private boolean on;

    DanmakuToggleIcon(int intrinsicSize) {
        this.intrinsicSize = intrinsicSize;
        paint.setStyle(Paint.Style.STROKE);
        paint.setStrokeCap(Paint.Cap.ROUND);
        paint.setStrokeJoin(Paint.Join.ROUND);
    }

    void setOn(boolean on) {
        this.on = on;
        invalidateSelf();
    }

    @Override
    public void draw(Canvas canvas) {
        Rect bounds = getBounds();
        float size = Math.min(bounds.width(), bounds.height());
        float left = bounds.exactCenterX() - size / 2;
        float top = bounds.exactCenterY() - size / 2;
        float unit = size / 24f;

        int color = tint.getColorForState(getState(), tint.getDefaultColor());
        paint.setColor(color);
        paint.setAlpha(Color.alpha(color) * alpha / 255);
        paint.setStrokeWidth(2 * unit);

        // Bubble from (3, 4) to (21, 17), with a tail down to (7, 21).
        bubble.set(left + 3 * unit, top + 4 * unit, left + 21 * unit, top + 17 * unit);
        path.reset();
        path.addRoundRect(bubble, 3 * unit, 3 * unit, Path.Direction.CW);
        canvas.drawPath(path, paint);
        path.reset();
        path.moveTo(left + 7 * unit, top + 17 * unit);
        path.lineTo(left + 7 * unit, top + 21 * unit);
        path.lineTo(left + 11.5f * unit, top + 17 * unit);
        canvas.drawPath(path, paint);

        // Two lines of text.
        canvas.drawLine(left + 7 * unit, top + 9 * unit, left + 17 * unit, top + 9 * unit, paint);
        canvas.drawLine(left + 7 * unit, top + 12.5f * unit, left + 14 * unit, top + 12.5f * unit, paint);

        if (!on) {
            canvas.drawLine(left + 2.5f * unit, top + 2.5f * unit, left + 21.5f * unit, top + 21.5f * unit, paint);
        }
    }

    @Override
    public void setTintList(ColorStateList tint) {
        this.tint = tint == null ? ColorStateList.valueOf(0xFFFFFFFF) : tint;
        invalidateSelf();
    }

    @Override
    public boolean isStateful() {
        return tint.isStateful();
    }

    @Override
    protected boolean onStateChange(int[] state) {
        invalidateSelf();
        return tint.isStateful();
    }

    @Override
    public int getIntrinsicWidth() {
        return intrinsicSize;
    }

    @Override
    public int getIntrinsicHeight() {
        return intrinsicSize;
    }

    @Override
    public void setAlpha(int alpha) {
        this.alpha = alpha;
        invalidateSelf();
    }

    @Override
    public void setColorFilter(ColorFilter colorFilter) {
        paint.setColorFilter(colorFilter);
        invalidateSelf();
    }

    @Override
    public int getOpacity() {
        return PixelFormat.TRANSLUCENT;
    }
}
