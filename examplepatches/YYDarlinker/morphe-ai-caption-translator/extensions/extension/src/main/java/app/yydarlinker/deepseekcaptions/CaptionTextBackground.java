package app.yydarlinker.deepseekcaptions;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Outline;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.text.Layout;
import android.widget.TextView;

/** Paint only behind the laid-out lines, without changing their wrapping or the player's anchor. */
final class CaptionTextBackground extends Drawable {
    private final TextView view;
    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final float radius;

    CaptionTextBackground(TextView view, int opacity, float radius) {
        this.view = view;
        this.radius = radius;
        paint.setColor(Color.argb(SubtitleStyleMetrics.alpha(opacity), 0, 0, 0));
    }

    RectF textBounds() {
        Layout layout = view.getLayout();
        if (layout == null) return new RectF();
        float left = Float.POSITIVE_INFINITY;
        float right = Float.NEGATIVE_INFINITY;
        int count = Math.min(layout.getLineCount(), view.getMaxLines());
        for (int i = 0; i < count; i++) {
            if (layout.getLineMax(i) <= 0f) continue;
            left = Math.min(left, layout.getLineLeft(i));
            right = Math.max(right, layout.getLineRight(i));
        }
        return contentBounds(getBounds(), left, right, view.getCompoundPaddingLeft(),
                view.getCompoundPaddingRight(), view.getScrollX());
    }

    static RectF contentBounds(Rect area, float lineLeft, float lineRight,
                               int paddingLeft, int paddingRight, int scrollX) {
        if (!Float.isFinite(lineLeft) || !Float.isFinite(lineRight) || lineRight <= lineLeft)
            return new RectF();
        // Layout coordinates start after compound padding; keep the original side padding.
        float left = Math.max(area.left, area.left + lineLeft - scrollX);
        float right = Math.min(area.right, area.left + lineRight + paddingLeft + paddingRight - scrollX);
        return right > left ? new RectF(left, area.top, right, area.bottom) : new RectF();
    }

    @Override public void draw(Canvas canvas) {
        RectF box = textBounds();
        if (!box.isEmpty()) canvas.drawRoundRect(box, radius, radius, paint);
    }

    @Override public void getOutline(Outline outline) {
        RectF box = textBounds();
        if (box.isEmpty()) { outline.setEmpty(); return; }
        outline.setRoundRect((int)Math.floor(box.left), (int)Math.floor(box.top),
                (int)Math.ceil(box.right), (int)Math.ceil(box.bottom), radius);
        outline.setAlpha(paint.getAlpha() / 255f);
    }

    @Override public void setAlpha(int alpha) { paint.setAlpha(alpha); invalidateSelf(); }
    @Override public void setColorFilter(ColorFilter filter) { paint.setColorFilter(filter); invalidateSelf(); }
    @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
}
