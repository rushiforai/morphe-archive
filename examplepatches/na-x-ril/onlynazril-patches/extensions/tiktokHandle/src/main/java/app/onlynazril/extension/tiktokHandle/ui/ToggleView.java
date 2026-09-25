package app.onlynazril.extension.tiktokHandle.ui;

import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.view.View;
import android.view.animation.PathInterpolator;

/**
 * A toggle drawn from scratch rather than styled platform chrome: one pill and one dot, no
 * elevation, no ripple of its own, nothing that changes shape between Android versions.
 *
 * Drawing it here is what keeps the screen monochrome — an {@code android.widget.Switch} brings
 * its own track, thumb and state colours that have to be fought with tint lists.
 */
public final class ToggleView extends View {
    private static final float TRACK_WIDTH_DP = 56f;
    private static final float TRACK_HEIGHT_DP = 32f;
    private static final float THUMB_DP = 26f;
    private static final long ANIMATION_MS = 140L;

    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RectF track = new RectF();

    private boolean checked;
    private float position;
    private ValueAnimator animator;

    public interface OnCheckedChangeListener {
        void onCheckedChanged(boolean checked);
    }

    private OnCheckedChangeListener listener;

    public ToggleView(Context context) {
        super(context);
        setClickable(true);
        setFocusable(true);
    }

    public void setOnCheckedChangeListener(OnCheckedChangeListener value) {
        listener = value;
    }

    public boolean isChecked() {
        return checked;
    }

    /** Sets the state without notifying the listener (used for the initial read from prefs). */
    public void setChecked(boolean value) {
        if (checked == value) return;
        checked = value;
        cancelAnimation();
        position = value ? 1f : 0f;
        invalidate();
    }

    @Override
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        setMeasuredDimension(
                resolveSize(Tokens.dp(getContext(), TRACK_WIDTH_DP), widthMeasureSpec),
                resolveSize(Tokens.dp(getContext(), TRACK_HEIGHT_DP), heightMeasureSpec));
    }

    @Override
    public boolean performClick() {
        super.performClick();
        if (!isEnabled()) return false;
        checked = !checked;
        animateTo(checked ? 1f : 0f);
        if (listener != null) listener.onCheckedChanged(checked);
        return true;
    }

    private void animateTo(float target) {
        cancelAnimation();
        animator = ValueAnimator.ofFloat(position, target);
        animator.setDuration(ANIMATION_MS);
        animator.setInterpolator(new PathInterpolator(0.2f, 0f, 0f, 1f));
        animator.addUpdateListener(animation -> {
            position = (float) animation.getAnimatedValue();
            invalidate();
        });
        animator.start();
    }

    private void cancelAnimation() {
        if (animator != null) {
            animator.cancel();
            animator = null;
        }
    }

    @Override
    protected void onDetachedFromWindow() {
        cancelAnimation();
        super.onDetachedFromWindow();
    }

    @Override
    protected void onDraw(Canvas canvas) {
        float width = getWidth();
        float height = getHeight();
        float radius = height / 2f;
        track.set(0f, 0f, width, height);

        paint.setStyle(Paint.Style.FILL);
        if (!isEnabled()) {
            paint.setColor(Tokens.TRACK_DISABLED);
        } else {
            paint.setColor(checked ? Tokens.TRACK_ON : Tokens.TRACK_OFF);
        }
        canvas.drawRoundRect(track, radius, radius, paint);

        float thumbRadius = Tokens.dpFloat(getContext(), THUMB_DP) / 2f;
        float inset = (height - thumbRadius * 2f) / 2f;
        float travel = width - height;
        float centerX = inset + thumbRadius + travel * clamp(position);

        if (!isEnabled()) {
            paint.setColor(Tokens.THUMB_DISABLED);
        } else {
            paint.setColor(checked ? Tokens.THUMB_ON : Tokens.THUMB_OFF);
        }
        canvas.drawCircle(centerX, height / 2f, thumbRadius, paint);
    }

    private static float clamp(float value) {
        if (value < 0f) return 0f;
        if (value > 1f) return 1f;
        return value;
    }
}
