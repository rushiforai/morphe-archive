package app.template.extension.zalo.call;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.drawable.Drawable;

/** Record glyph: a ring with a centre dot; the dot is red while recording. */
final class RecordIconDrawable extends Drawable {
    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private boolean active;

    void setActive(boolean value) {
        if (active != value) {
            active = value;
            invalidateSelf();
        }
    }

    @Override public void draw(Canvas canvas) {
        float cx = getBounds().exactCenterX();
        float cy = getBounds().exactCenterY();
        float unit = Math.min(getBounds().width(), getBounds().height()) / 24f;
        paint.setStyle(Paint.Style.STROKE);
        paint.setStrokeWidth(1.8f * unit);
        paint.setColor(active ? 0xFFFF3B30 : 0xFFFFFFFF);
        canvas.drawCircle(cx, cy, 9 * unit, paint);
        paint.setStyle(Paint.Style.FILL);
        canvas.drawCircle(cx, cy, 5 * unit, paint);
    }

    @Override public void setAlpha(int alpha) { paint.setAlpha(alpha); }
    @Override public void setColorFilter(android.graphics.ColorFilter filter) { paint.setColorFilter(filter); }
    @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
}
