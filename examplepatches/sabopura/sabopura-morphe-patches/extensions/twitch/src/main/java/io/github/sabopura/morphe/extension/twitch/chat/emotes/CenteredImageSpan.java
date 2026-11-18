// Adapted from Hooman's patches, GPL-3.0; see NOTICE for source and revision.
package io.github.sabopura.morphe.extension.twitch.chat.emotes;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.text.style.DynamicDrawableSpan;
import android.widget.TextView;

/**
 * Draws an image centred on the text line. The drawable may be shared between rows, so its own
 * bounds stay at its natural size and each span scales it to the size this row needs.
 */
final class CenteredImageSpan extends DynamicDrawableSpan {
    private final Drawable drawable;
    private final int width, height;
    private final Paint.FontMetricsInt paintMetrics = new Paint.FontMetricsInt();

    CenteredImageSpan(TextView textView, Drawable drawable, float scale) {
        super(ALIGN_BOTTOM);
        this.drawable = drawable;
        height = Math.max(1, Math.round(textView.getTextSize() * 1.25f * scale));
        int intrinsicHeight = drawable.getIntrinsicHeight();
        int intrinsicWidth = drawable.getIntrinsicWidth();
        width = intrinsicHeight > 0 && intrinsicWidth > 0
                ? Math.max(1, Math.round((float) intrinsicWidth * height / intrinsicHeight))
                : height;
        if (drawable.getBounds().isEmpty()) {
            drawable.setBounds(0, 0, Math.max(1, intrinsicWidth), Math.max(1, intrinsicHeight));
        }
    }

    int width() {
        return width;
    }

    @Override
    public Drawable getDrawable() {
        return drawable;
    }

    @Override
    public int getSize(
            Paint paint, CharSequence text, int start, int end, Paint.FontMetricsInt metrics) {
        if (metrics != null) {
            paint.getFontMetricsInt(paintMetrics);
            int center = (paintMetrics.ascent + paintMetrics.descent) / 2;
            int halfHeight = height / 2;
            metrics.ascent = center - halfHeight;
            metrics.top = metrics.ascent;
            metrics.descent = center + halfHeight;
            metrics.bottom = metrics.descent;
        }
        return width;
    }

    @Override
    public void draw(
            Canvas canvas,
            CharSequence text,
            int start,
            int end,
            float x,
            int top,
            int baseline,
            int bottom,
            Paint paint) {
        paint.getFontMetricsInt(paintMetrics);
        int textCenter = baseline + (paintMetrics.ascent + paintMetrics.descent) / 2;
        Rect natural = drawable.getBounds();
        canvas.save();
        canvas.translate(x, textCenter - height / 2f);
        canvas.scale((float) width / natural.width(), (float) height / natural.height());
        drawable.draw(canvas);
        canvas.restore();
    }
}
