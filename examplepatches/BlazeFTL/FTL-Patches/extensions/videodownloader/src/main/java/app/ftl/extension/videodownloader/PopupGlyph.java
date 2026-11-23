package app.ftl.extension.videodownloader;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;

final class PopupGlyph extends Drawable {
    static final int SEARCH = 0;
    static final int CLOSE = 1;
    static final int BLOCK = 2;

    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final int type;

    PopupGlyph(int type, int color) {
        this.type = type;
        paint.setStyle(Paint.Style.STROKE);
        paint.setStrokeCap(Paint.Cap.ROUND);
        paint.setStrokeWidth(2.2f);
        paint.setColor(color);
    }

    @Override
    public void draw(Canvas canvas) {
        Rect b = getBounds();
        float s = Math.min(b.width(), b.height()) / 24f;
        canvas.save();
        canvas.translate(b.left + (b.width() - 24f * s) / 2f, b.top + (b.height() - 24f * s) / 2f);
        canvas.scale(s, s);
        if (type == SEARCH) {
            canvas.drawCircle(10.5f, 10.5f, 6.5f, paint);
            canvas.drawLine(15.4f, 15.4f, 20f, 20f, paint);
        } else if (type == BLOCK) {
            canvas.drawCircle(12f, 12f, 9f, paint);
            canvas.drawLine(5.64f, 18.36f, 18.36f, 5.64f, paint);
        } else {
            canvas.drawLine(6f, 6f, 18f, 18f, paint);
            canvas.drawLine(18f, 6f, 6f, 18f, paint);
        }
        canvas.restore();
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
