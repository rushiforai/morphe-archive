/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 *
 * Modified for HushGram (Instagram), 2026.
 * Modified for HushMessenger (Messenger), 2026.
 */
package app.hushmessenger.extension;

import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.view.View;

/**
 * A chevron drawn in code, since Messenger's APK gives the patch no resource for one. It points
 * the way the row reads, so it mirrors in a right-to-left layout, and it dims with its row.
 */
final class Chevron extends Drawable {
    final int color;
    /** 0 points along the row; 1 points down and -1 up, for a heading that folds. */
    final int direction;
    private final ColorStateList colors;
    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Path path = new Path();

    Chevron(int color, float stroke) { this(color, stroke, 0); }

    Chevron(int color, float stroke, int direction) {
        this.color = color;
        this.direction = direction;
        colors = SettingsUi.dimmedWhenDisabled(color);
        paint.setStyle(Paint.Style.STROKE);
        paint.setStrokeWidth(stroke);
        paint.setStrokeCap(Paint.Cap.ROUND);
        paint.setStrokeJoin(Paint.Join.ROUND);
        paint.setColor(color);
    }

    /** The three points of the stroke: start, tip, end. */
    float[] points() {
        Rect bounds = getBounds();
        float half = bounds.height() * 0.19f;
        float reach = getLayoutDirection() == View.LAYOUT_DIRECTION_RTL ? -half / 2 : half / 2;
        float x = bounds.exactCenterX();
        float y = bounds.exactCenterY();
        if (direction != 0) {
            float tip = half / 2 * direction;
            return new float[] {x - half, y - tip, x, y + tip, x + half, y - tip};
        }
        return new float[] {x - reach, y - half, x + reach, y, x - reach, y + half};
    }

    int currentColor() { return paint.getColor(); }

    @Override public void draw(Canvas canvas) {
        float[] at = points();
        path.rewind();
        path.moveTo(at[0], at[1]);
        path.lineTo(at[2], at[3]);
        path.lineTo(at[4], at[5]);
        canvas.drawPath(path, paint);
    }

    @Override public boolean isAutoMirrored() { return true; }

    @Override public boolean onLayoutDirectionChanged(int layoutDirection) {
        invalidateSelf();
        return true;
    }

    @Override public boolean isStateful() { return true; }

    @Override protected boolean onStateChange(int[] state) {
        int now = colors.getColorForState(state, color);
        if (now == paint.getColor()) return false;
        paint.setColor(now);
        invalidateSelf();
        return true;
    }

    @Override public void setAlpha(int alpha) {
        paint.setAlpha(alpha);
        invalidateSelf();
    }

    @Override public void setColorFilter(ColorFilter filter) {
        paint.setColorFilter(filter);
        invalidateSelf();
    }

    @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
}
