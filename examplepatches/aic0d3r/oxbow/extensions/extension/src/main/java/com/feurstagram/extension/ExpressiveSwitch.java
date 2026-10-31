package com.feurstagram.extension;

import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.animation.PathInterpolator;
import android.widget.CompoundButton;

/** Resource-free Material 3 switch, using the shared monochrome settings palette. */
final class ExpressiveSwitch extends CompoundButton {
    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RectF track = new RectF();
    private final Path check = new Path();
    private float position;
    private float press;
    private ValueAnimator movement;
    private ValueAnimator pressure;

    ExpressiveSwitch(Context context) {
        super(context);
        setButtonDrawable(null);
        setBackground(null);
        setPadding(0, 0, 0, 0);
        setClickable(true);
        setFocusable(true);
    }

    @Override
    protected void onMeasure(int widthSpec, int heightSpec) {
        setMeasuredDimension(resolveSize(dp(64), widthSpec), resolveSize(dp(48), heightSpec));
    }

    @Override
    public void setChecked(boolean checked) {
        super.setChecked(checked);
        float target = isChecked() ? 1f : 0f;
        if (movement != null) movement.cancel();
        if (!isLaidOut() || !isAttachedToWindow() || !ValueAnimator.areAnimatorsEnabled()) {
            position = target;
            invalidate();
            return;
        }
        movement = animateValue(position, target, value -> position = value);
    }

    @Override
    public void setPressed(boolean pressed) {
        super.setPressed(pressed);
        if (pressure != null) pressure.cancel();
        float target = pressed && isEnabled() ? 1f : 0f;
        if (!isLaidOut() || !ValueAnimator.areAnimatorsEnabled()) {
            press = target;
            invalidate();
        } else {
            pressure = animateValue(press, target, value -> press = value);
        }
    }

    private interface Frame { void apply(float value); }

    private ValueAnimator animateValue(float from, float to, Frame frame) {
        ValueAnimator animator = ValueAnimator.ofFloat(from, to);
        animator.setDuration(200L);
        animator.setInterpolator(new PathInterpolator(0.2f, 0f, 0f, 1f));
        animator.addUpdateListener(value -> {
            frame.apply((float) value.getAnimatedValue());
            invalidate();
        });
        animator.start();
        return animator;
    }

    @Override
    protected void onDraw(Canvas canvas) {
        float scale = getResources().getDisplayMetrics().density;
        float left = (getWidth() - 52f * scale) / 2f;
        float centerY = getHeight() / 2f;
        track.set(left, centerY - 16f * scale, left + 52f * scale, centerY + 16f * scale);
        paint.setStyle(Paint.Style.FILL);
        paint.setColor(blend(Settings.SURFACE_CONTAINER_HIGH, Settings.PRIMARY, position));
        canvas.drawRoundRect(track, 16f * scale, 16f * scale, paint);
        paint.setStyle(Paint.Style.STROKE);
        paint.setStrokeWidth(2f * scale);
        paint.setColor(blend(Settings.OUTLINE, Settings.PRIMARY, position));
        track.inset(scale, scale);
        canvas.drawRoundRect(track, 15f * scale, 15f * scale, paint);

        float offset = getLayoutDirection() == LAYOUT_DIRECTION_RTL ? 1f - position : position;
        float centerX = left + (16f + 20f * offset) * scale;
        paint.setStyle(Paint.Style.FILL);
        if (press > 0f || isFocused()) {
            paint.setColor(Color.argb((int) (31f * Math.max(press, isFocused() ? 1f : 0f)), 255, 255, 255));
            canvas.drawCircle(centerX, centerY, 20f * scale, paint);
        }
        float diameter = 16f + 8f * position;
        diameter += (28f - diameter) * press;
        paint.setColor(blend(Settings.OUTLINE, Settings.ON_PRIMARY, position));
        canvas.drawCircle(centerX, centerY, diameter * scale / 2f, paint);

        if (position > 0f) {
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(2f * scale);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
            paint.setColor(Color.argb((int) (255f * position), 255, 255, 255));
            check.reset();
            check.moveTo(centerX - 4f * scale, centerY);
            check.lineTo(centerX - scale, centerY + 3f * scale);
            check.lineTo(centerX + 5f * scale, centerY - 4f * scale);
            canvas.drawPath(check, paint);
        }
    }

    @Override
    public CharSequence getAccessibilityClassName() {
        return "android.widget.Switch";
    }

    @Override
    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo info) {
        super.onInitializeAccessibilityNodeInfo(info);
        info.setCheckable(true);
        info.setChecked(isChecked());
    }

    @Override
    public void jumpDrawablesToCurrentState() {
        super.jumpDrawablesToCurrentState();
        if (movement != null) movement.cancel();
        if (pressure != null) pressure.cancel();
        position = isChecked() ? 1f : 0f;
        press = isPressed() ? 1f : 0f;
        invalidate();
    }

    @Override
    protected void onDetachedFromWindow() {
        if (movement != null) movement.cancel();
        if (pressure != null) pressure.cancel();
        super.onDetachedFromWindow();
    }

    private int dp(int value) { return Settings.dp(getContext(), value); }

    private static int blend(int from, int to, float amount) {
        return Color.rgb(
                (int) (Color.red(from) + (Color.red(to) - Color.red(from)) * amount),
                (int) (Color.green(from) + (Color.green(to) - Color.green(from)) * amount),
                (int) (Color.blue(from) + (Color.blue(to) - Color.blue(from)) * amount));
    }
}
