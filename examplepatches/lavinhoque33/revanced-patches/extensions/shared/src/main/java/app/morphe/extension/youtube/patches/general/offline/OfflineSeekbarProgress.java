/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-24.
 */
package app.morphe.extension.youtube.patches.general.offline;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.LinearGradient;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;
import android.view.View;

import app.morphe.extension.youtube.patches.player.SeekbarColorPatch;

/** Draws the gradient over the played segment rather than clipping a full-width gradient. */
final class OfflineSeekbarProgress extends Drawable {
    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Matrix transform = new Matrix();
    private final LinearGradient gradient;

    OfflineSeekbarProgress(int primary) {
        paint.setColor(primary);
        int[] colors = SeekbarColorPatch.getPlayerLinearGradient(new int[]{primary, primary});
        if (colors[0] == colors[1]) {
            gradient = null;
        } else {
            float[] stops = {0.7f, 1f};
            SeekbarColorPatch.setSeekbarGradientPositions(stops);
            gradient = new LinearGradient(0f, 0f, 1f, 0f, colors, stops, Shader.TileMode.CLAMP);
            paint.setShader(gradient);
        }
    }

    @Override
    public void draw(Canvas canvas) {
        Rect bounds = getBounds();
        float width = bounds.width() * (getLevel() / 10_000f);
        if (width <= 0f) return;

        boolean rtl = getLayoutDirection() == View.LAYOUT_DIRECTION_RTL;
        float start = rtl ? bounds.right : bounds.left;
        float left = rtl ? start - width : start;
        if (gradient != null) {
            transform.setScale(rtl ? -width : width, 1f);
            transform.postTranslate(start, 0f);
            gradient.setLocalMatrix(transform);
        }
        float radius = bounds.height() / 2f;
        canvas.drawRoundRect(left, bounds.top, left + width, bounds.bottom, radius, radius, paint);
    }

    @Override
    protected boolean onLevelChange(int level) {
        invalidateSelf();
        return true;
    }

    @Override
    public void setAlpha(int alpha) {
        paint.setAlpha(alpha);
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
