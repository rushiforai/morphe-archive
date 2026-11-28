package app.template.extension.zalo.ui;

import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.widget.CompoundButton;

/** Fallback drawn to Zalo's Switch.Medium spec: 40x24dp pill track, 20dp thumb, 2dp inset. */
public final class ZaloToggle extends CompoundButton {
    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RectF track = new RectF();
    private final int onColor;
    private final int offColor;
    private final int thumbColor;
    private float progress;
    private ValueAnimator animator;

    ZaloToggle(Context context, boolean darkMode) {
        super(context);
        onColor = ZaloUi.attrColor(context, "switch_on_track", ZaloUi.BLUE);
        offColor = darkMode ? 0xFF4A4D52 : ZaloUi.attrColor(context, "switch_off_track", 0xFFC4C9CF);
        thumbColor = ZaloUi.attrColor(context, "switch_handle", 0xFFFFFFFF);
        setButtonDrawable(null);
        setBackground(null);
        setClickable(true);
        progress = isChecked() ? 1f : 0f;
    }

    @Override public CharSequence getAccessibilityClassName() {
        return android.widget.Switch.class.getName();
    }

    @Override protected void onMeasure(int widthSpec, int heightSpec) {
        setMeasuredDimension(ZaloUi.dp(getContext(), 40), ZaloUi.dp(getContext(), 24));
    }

    @Override public void setChecked(boolean checked) {
        boolean changed = checked != isChecked();
        super.setChecked(checked);
        if (!changed) return;
        float target = checked ? 1f : 0f;
        if (animator != null) animator.cancel();
        if (!isAttachedToWindow()) {
            progress = target;
            invalidate();
            return;
        }
        animator = ValueAnimator.ofFloat(progress, target);
        animator.setDuration(180);
        animator.addUpdateListener(animation -> {
            progress = (float) animation.getAnimatedValue();
            invalidate();
        });
        animator.start();
    }

    @Override protected void onDraw(Canvas canvas) {
        float width = getWidth();
        float height = getHeight();
        float radius = height / 2f;
        paint.setColor(blend(offColor, onColor, progress));
        if (!isEnabled()) paint.setAlpha(110);
        track.set(0, 0, width, height);
        canvas.drawRoundRect(track, radius, radius, paint);
        float inset = ZaloUi.dp(getContext(), 2);
        float thumbRadius = radius - inset;
        float start = inset + thumbRadius;
        float end = width - inset - thumbRadius;
        paint.setColor(thumbColor);
        paint.setShadowLayer(inset, 0, inset / 2f, 0x33000000);
        canvas.drawCircle(start + (end - start) * progress, radius, thumbRadius, paint);
        paint.clearShadowLayer();
    }

    private static int blend(int from, int to, float ratio) {
        int a = (int) (((from >>> 24) & 0xFF) + (((to >>> 24) & 0xFF) - ((from >>> 24) & 0xFF)) * ratio);
        int r = (int) (((from >> 16) & 0xFF) + (((to >> 16) & 0xFF) - ((from >> 16) & 0xFF)) * ratio);
        int g = (int) (((from >> 8) & 0xFF) + (((to >> 8) & 0xFF) - ((from >> 8) & 0xFF)) * ratio);
        int b = (int) ((from & 0xFF) + ((to & 0xFF) - (from & 0xFF)) * ratio);
        return (a << 24) | (r << 16) | (g << 8) | b;
    }
}
