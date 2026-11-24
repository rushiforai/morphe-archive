package app.template.extension.zalo.ui;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.drawable.Drawable;

/** Minimal stroked icons used when Zalo's own drawables are unavailable. */
public final class LineIcon extends Drawable {
    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final int kind;

    LineIcon(int color, int kind) {
        paint.setColor(color);
        paint.setStyle(Paint.Style.STROKE);
        paint.setStrokeWidth(2);
        paint.setStrokeCap(Paint.Cap.ROUND);
        this.kind = kind;
    }

    @Override public void draw(Canvas canvas) {
        float cx = getBounds().exactCenterX();
        float cy = getBounds().exactCenterY();
        float scale = Math.min(getBounds().width(), getBounds().height()) / 24f;
        paint.setStrokeWidth(1.8f * scale);
        if (kind == 1) {
            canvas.drawLine(cx - 3 * scale, cy - 5 * scale, cx + 2 * scale, cy, paint);
            canvas.drawLine(cx + 2 * scale, cy, cx - 3 * scale, cy + 5 * scale, paint);
            return;
        }
        if (kind == 2) {
            canvas.drawRoundRect(cx - 9 * scale, cy - 7 * scale, cx + 9 * scale,
                    cy + 5 * scale, 4 * scale, 4 * scale, paint);
            canvas.drawLine(cx - 4 * scale, cy + 5 * scale, cx - 7 * scale, cy + 9 * scale, paint);
            canvas.drawLine(cx - 7 * scale, cy + 9 * scale, cx + 1 * scale, cy + 5 * scale, paint);
            return;
        }
        canvas.drawCircle(cx, cy, 8 * scale, paint);
        canvas.drawCircle(cx, cy, 3 * scale, paint);
        for (int spoke = 0; spoke < 8; spoke++) {
            double angle = spoke * Math.PI / 4;
            canvas.drawLine(cx + (float) Math.cos(angle) * 8 * scale,
                    cy + (float) Math.sin(angle) * 8 * scale,
                    cx + (float) Math.cos(angle) * 10 * scale,
                    cy + (float) Math.sin(angle) * 10 * scale, paint);
        }
    }

    @Override public void setAlpha(int alpha) { paint.setAlpha(alpha); }
    @Override public void setColorFilter(android.graphics.ColorFilter filter) { paint.setColorFilter(filter); }
    @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
}
