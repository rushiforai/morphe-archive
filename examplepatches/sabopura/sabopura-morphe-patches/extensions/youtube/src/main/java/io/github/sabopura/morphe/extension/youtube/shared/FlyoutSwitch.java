package io.github.sabopura.morphe.extension.youtube.shared;

import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.RectF;
import android.view.View;

/**
 * The on/off switch of YouTube's own player-menu rows ("Loop video", "Ambient mode"). Those rows
 * are drawn by Litho and have no reusable view, so the same shape is drawn here: a 37 x 22 dp
 * track with an 18 dp thumb. The colours were measured on the real rows in the light and dark
 * themes: the track is the row's text colour at 94 % (on) or 42 % (off) opacity, so it also
 * follows themes that recolour the text, and the thumb is white (light) or #282828 (dark).
 */
final class FlyoutSwitch extends View {
    private static final float WIDTH_DP = 37f;
    private static final float HEIGHT_DP = 22f;
    private static final float INSET_DP = 2f;
    private static final long SLIDE_MS = 150L;

    private final Paint trackPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint thumbPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RectF track = new RectF();
    private final float density;
    private int textColor = Color.BLACK;
    private boolean checked;
    /** 0 = off (thumb left), 1 = on (thumb right). */
    private float position;
    private ValueAnimator animator;

    FlyoutSwitch(Context context) {
        super(context);
        density = context.getResources().getDisplayMetrics().density;
        setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
        setClickable(false);
        setFocusable(false);
    }

    void setTextColor(int color) {
        textColor = color;
        invalidate();
    }

    void setChecked(boolean value, boolean animate) {
        if (animator != null) animator.cancel();
        checked = value;
        float target = value ? 1f : 0f;
        if (!animate || !isAttachedToWindow()) {
            position = target;
            invalidate();
            return;
        }
        animator = ValueAnimator.ofFloat(position, target);
        animator.setDuration(SLIDE_MS);
        animator.addUpdateListener(animation -> {
            position = (float) animation.getAnimatedValue();
            invalidate();
        });
        animator.start();
    }

    boolean isChecked() {
        return checked;
    }

    @Override protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        setMeasuredDimension(Math.round(WIDTH_DP * density), Math.round(HEIGHT_DP * density));
    }

    @Override protected void onDraw(Canvas canvas) {
        float width = getWidth();
        float height = getHeight();
        float radius = height / 2f;
        trackPaint.setColor(withAlpha(textColor, 0.42f + (0.94f - 0.42f) * position));
        track.set(0, 0, width, height);
        canvas.drawRoundRect(track, radius, radius, trackPaint);

        float inset = INSET_DP * density;
        float thumbRadius = radius - inset;
        float left = inset + thumbRadius;
        float right = width - inset - thumbRadius;
        thumbPaint.setColor(isDark(textColor) ? 0xFF282828 : Color.WHITE);
        canvas.drawCircle(left + (right - left) * position, radius, thumbRadius, thumbPaint);
    }

    @Override protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        if (animator != null) animator.cancel();
    }

    private static int withAlpha(int color, float alpha) {
        return Color.argb(Math.round(Color.alpha(color) * alpha),
                Color.red(color), Color.green(color), Color.blue(color));
    }

    /** Light text means a dark menu. */
    private static boolean isDark(int textColor) {
        return Color.red(textColor) * 299 + Color.green(textColor) * 587
                + Color.blue(textColor) * 114 > 128_000;
    }
}
