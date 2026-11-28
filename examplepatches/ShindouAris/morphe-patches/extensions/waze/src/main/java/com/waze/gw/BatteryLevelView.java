package com.waze.gw;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.Rect;
import android.graphics.RectF;
import android.view.View;

/** Battery outline asset with a live, left-to-right percentage fill. */
public final class BatteryLevelView extends View {
    private final Paint fillPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint outlinePaint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG);
    private final Rect source = new Rect(40, 130, 472, 382);
    private final RectF target = new RectF();
    private final RectF fill = new RectF();
    private Bitmap outline;
    private int percent = -1;

    public BatteryLevelView(Context context) {
        super(context);
        outlinePaint.setColorFilter(new PorterDuffColorFilter(0xFFE7E9ED, PorterDuff.Mode.SRC_IN));
        java.io.InputStream stream = null;
        try {
            stream = context.getAssets().open("wz_ui_icon/batterry_placeholder.png");
            outline = BitmapFactory.decodeStream(stream);
        } catch (Throwable ignored) {
            outline = null;
        } finally {
            if (stream != null) try { stream.close(); } catch (Throwable ignored) { }
        }
        setPercent(-1);
    }

    public void setPercent(int value) {
        int next = value >= 0 && value <= 100 ? value : -1;
        if (next == percent) return;
        percent = next;
        setContentDescription(percent >= 0 ? I18n.f("ui.phone_battery_0", percent) : I18n.tr("ui.battery_level_unavailable"));
        invalidate();
    }

    @Override protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        float w = getWidth();
        float h = getHeight();
        if (w <= 0f || h <= 0f) return;

        // Inner transparent chamber of the supplied outline, normalized to the cropped artwork.
        if (percent > 0) {
            float innerLeft = w * 0.093f;
            float innerRight = w * 0.760f;
            float innerTop = h * 0.183f;
            float innerBottom = h * 0.813f;
            float filledRight = innerLeft + (innerRight - innerLeft) * percent / 100f;
            fill.set(innerLeft, innerTop, filledRight, innerBottom);
            fillPaint.setColor(percent <= 15 ? 0xFFFF5964
                    : percent <= 35 ? 0xFFFFC247 : 0xFF45E6B1);
            canvas.drawRoundRect(fill, h * 0.10f, h * 0.10f, fillPaint);
        }

        if (outline != null) {
            target.set(0f, 0f, w, h);
            canvas.drawBitmap(outline, source, target, outlinePaint);
        }
    }
}
