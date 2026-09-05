package app.template.extension.settings;

import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.RectF;
import android.view.MotionEvent;
import android.view.View;
import android.view.animation.DecelerateInterpolator;

/** A rounded pill switch: grey track when off, accent-filled when on, with a springy thumb. */
final class PillToggle extends View {

    interface OnToggle {
        void onToggle(boolean checked);
    }

    private final float density;
    private final Paint track = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint thumb = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RectF rect = new RectF();

    private boolean checked;
    private boolean enabledLook = true;
    private int accent = 0xFF00E054;
    private float pos;       // 0 = off, 1 = on
    private float pressScale = 1f;
    private OnToggle listener;
    private ValueAnimator animator;

    PillToggle(Context c) {
        super(c);
        this.density = c.getResources().getDisplayMetrics().density;
        setClickable(true);
    }

    void setAccent(int argb) {
        this.accent = 0xFF000000 | argb;
        invalidate();
    }

    void setChecked(boolean value, boolean animate) {
        checked = value;
        if (animate) {
            animateTo(value ? 1f : 0f);
        } else {
            pos = value ? 1f : 0f;
            invalidate();
        }
    }

    boolean isChecked() {
        return checked;
    }

    void setEnabledLook(boolean value) {
        enabledLook = value;
        setClickable(value);
        setAlpha(value ? 1f : 0.4f);
        invalidate();
    }

    void setOnToggle(OnToggle l) {
        this.listener = l;
    }

    @Override
    protected void onMeasure(int wSpec, int hSpec) {
        setMeasuredDimension(Math.round(52 * density), Math.round(32 * density));
    }

    @Override
    protected void onDraw(Canvas canvas) {
        int w = getWidth();
        int h = getHeight();
        float r = h / 2f;

        int off = 0xFF3A3A3A;
        track.setColor(blend(off, accent, pos));
        rect.set(0, 0, w, h);
        canvas.drawRoundRect(rect, r, r, track);

        float pad = h * 0.14f;
        float tr = (h / 2f - pad) * pressScale;
        float cx = pad + tr / pressScale + pos * (w - 2f * (pad + tr / pressScale));
        thumb.setColor(blend(0xFF8A8A8A, 0xFFFFFFFF, pos));
        canvas.drawCircle(cx, h / 2f, tr, thumb);
    }

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        if (!enabledLook) return false;
        switch (event.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                setPressScale(1.14f);
                return true;
            case MotionEvent.ACTION_UP:
                setPressScale(1f);
                toggle();
                performClick();
                return true;
            case MotionEvent.ACTION_CANCEL:
                setPressScale(1f);
                return true;
        }
        return super.onTouchEvent(event);
    }

    private void toggle() {
        checked = !checked;
        animateTo(checked ? 1f : 0f);
        if (listener != null) listener.onToggle(checked);
    }

    private void animateTo(float target) {
        if (animator != null) animator.cancel();
        animator = ValueAnimator.ofFloat(pos, target);
        animator.setDuration(190);
        animator.setInterpolator(new DecelerateInterpolator(1.6f));
        animator.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() {
            @Override public void onAnimationUpdate(ValueAnimator a) {
                pos = (float) a.getAnimatedValue();
                invalidate();
            }
        });
        animator.start();
    }

    private void setPressScale(float s) {
        ValueAnimator a = ValueAnimator.ofFloat(pressScale, s);
        a.setDuration(120);
        a.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() {
            @Override public void onAnimationUpdate(ValueAnimator v) {
                pressScale = (float) v.getAnimatedValue();
                invalidate();
            }
        });
        a.start();
    }

    private static int blend(int from, int to, float t) {
        t = t < 0 ? 0 : (t > 1 ? 1 : t);
        int a = 0xFF;
        int r = lerp(Color.red(from), Color.red(to), t);
        int g = lerp(Color.green(from), Color.green(to), t);
        int b = lerp(Color.blue(from), Color.blue(to), t);
        return (a << 24) | (r << 16) | (g << 8) | b;
    }

    private static int lerp(int a, int b, float t) {
        return Math.round(a + (b - a) * t);
    }
}
