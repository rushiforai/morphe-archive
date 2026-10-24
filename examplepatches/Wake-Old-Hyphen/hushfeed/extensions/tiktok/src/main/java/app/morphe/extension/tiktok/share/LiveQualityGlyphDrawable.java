/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.share;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

/** The LIVE recording quality row's symbol, a ring with a record dot in it, drawn like the cover glyph. */
public final class LiveQualityGlyphDrawable extends Drawable {
    private static final float RADIUS_FRACTION = 0.32f;

    private final Paint ring = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint dot = new Paint(Paint.ANTI_ALIAS_FLAG);

    public LiveQualityGlyphDrawable(int color, float strokeWidthPx) {
        ring.setStyle(Paint.Style.STROKE);
        ring.setColor(color);
        ring.setStrokeWidth(strokeWidthPx);
        dot.setStyle(Paint.Style.FILL);
        dot.setColor(color);
    }

    @Override
    public void draw(@NonNull Canvas canvas) {
        Rect bounds = getBounds();
        if (bounds.isEmpty()) {
            return;
        }
        float radius = Math.min(bounds.width(), bounds.height()) * RADIUS_FRACTION;
        canvas.drawCircle(bounds.exactCenterX(), bounds.exactCenterY(), radius, ring);
        canvas.drawCircle(bounds.exactCenterX(), bounds.exactCenterY(), radius * 0.45f, dot);
    }

    @Override
    public void setAlpha(int alpha) {
        ring.setAlpha(alpha);
        dot.setAlpha(alpha);
        invalidateSelf();
    }

    @Override
    public void setColorFilter(@Nullable ColorFilter colorFilter) {
        ring.setColorFilter(colorFilter);
        dot.setColorFilter(colorFilter);
        invalidateSelf();
    }

    @Override
    public int getOpacity() {
        return PixelFormat.TRANSLUCENT;
    }
}
