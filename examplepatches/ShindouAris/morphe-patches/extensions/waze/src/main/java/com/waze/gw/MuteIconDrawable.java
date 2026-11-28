package com.waze.gw;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;

/** Speaker with a red slash, drawn in code so it stays crisp at any density and needs no resource. */
final class MuteIconDrawable extends Drawable {
    private static final int SPEAKER = 0xFFFFFFFF;
    private static final int SLASH = 0xFFFF3B30;

    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Path body = new Path();
    private final RectF wave = new RectF();
    private final int sizePx;

    MuteIconDrawable(int sizePx) {
        this.sizePx = sizePx;
    }

    @Override public void draw(Canvas canvas) {
        float unit = Math.min(getBounds().width(), getBounds().height()) / 24f;
        float ox = getBounds().exactCenterX() - 12f * unit;
        float oy = getBounds().exactCenterY() - 12f * unit;

        // Speaker cone on a 24-unit grid.
        body.reset();
        body.moveTo(ox + 3f * unit, oy + 9f * unit);
        body.lineTo(ox + 7f * unit, oy + 9f * unit);
        body.lineTo(ox + 12f * unit, oy + 4.5f * unit);
        body.lineTo(ox + 12f * unit, oy + 19.5f * unit);
        body.lineTo(ox + 7f * unit, oy + 15f * unit);
        body.lineTo(ox + 3f * unit, oy + 15f * unit);
        body.close();
        paint.setStyle(Paint.Style.FILL);
        paint.setColor(SPEAKER);
        canvas.drawPath(body, paint);

        paint.setStyle(Paint.Style.STROKE);
        paint.setStrokeCap(Paint.Cap.ROUND);
        paint.setStrokeWidth(1.8f * unit);
        wave.set(ox + 8f * unit, oy + 7.5f * unit, ox + 17f * unit, oy + 16.5f * unit);
        canvas.drawArc(wave, -50f, 100f, false, paint);
        wave.set(ox + 6f * unit, oy + 4.5f * unit, ox + 21f * unit, oy + 19.5f * unit);
        canvas.drawArc(wave, -50f, 100f, false, paint);

        paint.setColor(SLASH);
        paint.setStrokeWidth(2.6f * unit);
        canvas.drawLine(ox + 3.5f * unit, oy + 3.5f * unit, ox + 20.5f * unit, oy + 20.5f * unit, paint);
    }

    @Override public int getIntrinsicWidth() { return sizePx; }
    @Override public int getIntrinsicHeight() { return sizePx; }
    @Override public void setAlpha(int alpha) { paint.setAlpha(alpha); }
    @Override public void setColorFilter(ColorFilter colorFilter) { paint.setColorFilter(colorFilter); }
    @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
}
