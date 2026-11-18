package io.github.sabopura.morphe.extension.twitch.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.os.Bundle;
import android.util.TypedValue;
import android.view.HapticFeedbackConstants;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.accessibility.AccessibilityNodeInfo;

import java.util.Locale;
import java.util.function.Consumer;

/**
 * Bencho's Tape: fine playback-speed control on a track you can see run. The chips give the quarter
 * steps, so this one settles on twentieths. The reel only moves while a finger holds it: nothing here
 * may keep moving over the video.
 */
final class TapeSlider extends View implements Motion.Step {
    private static final float MIN = .25f, MAX = 2f;
    private static final float KNOB_DP = 34;
    private static final float[] NOTCHES = {.5f, 1f, 1.5f};
    private static final float BEND_K = 420;
    private static final float BEND_C = (float) (2 * Math.sqrt(420) * .5);
    private static final int ONE_X = 20;
    private static final float STEP = .05f;

    private final float density;
    private final Paint track = new Paint(Paint.ANTI_ALIAS_FLAG), fill = new Paint(Paint.ANTI_ALIAS_FLAG),
            hairline = new Paint(Paint.ANTI_ALIAS_FLAG), notch = new Paint(Paint.ANTI_ALIAS_FLAG),
            grip = new Paint(Paint.ANTI_ALIAS_FLAG), text = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RectF rect = new RectF();
    private final Path gripPath = new Path();
    private final Motion.Loop loop = new Motion.Loop(this, this);
    private final Consumer<Float> onSettle;
    private final int slop;
    private final float reserve;
    private String shownText, spokenText;
    private int shownHundredths = -1;
    private float value;
    private float reel, bend, bendVelocity;
    private boolean dragging, pressed;
    private float downX, downY;
    private int lastTwentieth;

    TapeSlider(Context context, Ui ui, float value, Consumer<Float> onSettle) {
        super(context);
        this.onSettle = onSettle;
        this.value = clamp(value);
        lastTwentieth = Math.round(this.value * 20);
        density = context.getResources().getDisplayMetrics().density;
        slop = ViewConfiguration.get(context).getScaledTouchSlop();
        track.setColor(ui.dark ? 0x1AFFFFFF : 0x12000000);
        fill.setColor(ui.accent);
        hairline.setColor(ui.onAccent & 0x33FFFFFF);
        hairline.setStrokeWidth(density);
        notch.setColor(ui.dark ? 0x33FFFFFF : 0x33000000);
        grip.setColor(ui.onAccent);
        grip.setStyle(Paint.Style.STROKE);
        grip.setStrokeCap(Paint.Cap.ROUND);
        grip.setStrokeWidth(2.5f * density);
        text.setColor(ui.text);
        text.setFakeBoldText(true);
        text.setTextSize(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_SP, 14,
                context.getResources().getDisplayMetrics()));
        text.setTextAlign(Paint.Align.RIGHT);
        reserve = text.measureText("0.00×") + 12 * density;
        setClickable(true);
        setFocusable(true);
        setContentDescription(Text.label("再生速度の微調整", "Fine playback speed"));
        shown(false);
    }

    /** The readout and what TalkBack says, made once per change rather than once per frame. */
    private void shown(boolean announce) {
        int hundredths = Math.round(value * 100);
        if (hundredths != shownHundredths) {
            shownHundredths = hundredths;
            shownText = String.format(Locale.ROOT, "%.2f×", value);
            String rate = PortMath.rateText(value);
            spokenText = Text.label(rate + " 倍", rate + " times");
        }
        Ui.setSpokenState(this, spokenText, announce);
    }

    private static float clamp(float v) {
        return Math.max(MIN, Math.min(MAX, v));
    }

    private static float toP(float v) {
        return (v - MIN) / (MAX - MIN);
    }

    void setValue(float next) {
        if (dragging) return;
        next = clamp(next);
        if (next == value) return;
        value = next;
        shown(false);
        invalidate();
    }

    private float trackWidth() {
        return getWidth() - reserve;
    }

    @Override
    protected void onMeasure(int widthSpec, int heightSpec) {
        setMeasuredDimension(MeasureSpec.getSize(widthSpec), Ui.dp(getContext(), 48));
    }

    @Override
    protected void onDetachedFromWindow() {
        loop.stop();
        super.onDetachedFromWindow();
    }

    private float fromX(float x) {
        float k = KNOB_DP * density;
        float p = (x - k / 2) / (trackWidth() - k);
        return clamp(MIN + Math.min(1, Math.max(0, p)) * (MAX - MIN));
    }

    private void set(float next) {
        value = next;
        int twentieth = Math.round(next * 20);
        if (PortMath.landedOn(lastTwentieth, twentieth, ONE_X)) performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
        lastTwentieth = twentieth;
        shown(false);
        invalidate();
    }

    private void settle() {
        value = clamp(Math.round(value * 20) / 20f);
        lastTwentieth = Math.round(value * 20);
        onSettle.accept(value);
        shown(true);
        invalidate();
    }

    @Override
    public boolean frame(float seconds, long nowMs) {
        if (dragging) {
            reel -= Math.min(.064f, seconds) * value * 26 * density;
            reel %= 8 * density;
        }
        float want = dragging ? Math.min(1, Math.max(0, (toP(value) - .9f) / .1f)) : 0;
        float dt = Math.min(.032f, seconds);
        bendVelocity += (BEND_K * (want - bend) - BEND_C * bendVelocity) * dt;
        bend += bendVelocity * dt;
        boolean bendRest = Math.abs(want - bend) < .002f && Math.abs(bendVelocity) < .02f;
        if (bendRest) {
            bend = want;
            bendVelocity = 0;
        }
        return dragging || !bendRest;
    }

    @Override
    public void snap() {
        bend = dragging ? Math.min(1, Math.max(0, (toP(value) - .9f) / .1f)) : 0;
        bendVelocity = 0;
    }

    private void buildGrip(float cx, float cy, float halfLength) {
        float r = KNOB_DP / 2;
        float o = -9;
        float b = Math.max(-.25f, bend);
        float a = halfLength / r;
        float ex = (float) (o + r * Math.cos(a)) * b;
        float ey = (float) (halfLength + (r * Math.sin(a) - halfLength) * b);
        float qx = (float) (o + r / Math.cos(a)) * b;
        gripPath.reset();
        gripPath.moveTo(cx + ex * density, cy - ey * density);
        gripPath.quadTo(cx + qx * density, cy, cx + ex * density, cy + ey * density);
    }

    @Override
    protected void onDraw(Canvas canvas) {
        float knob = KNOB_DP * density, w = trackWidth();
        float top = (getHeight() - knob) / 2, cy = getHeight() / 2f;
        rect.set(0, top, w, top + knob);
        canvas.drawRoundRect(rect, knob / 2, knob / 2, track);
        for (float n : NOTCHES) {
            float x = knob / 2 + toP(n) * (w - knob);
            canvas.drawCircle(x, cy, 1.5f * density, notch);
        }
        float right = knob + toP(value) * (w - knob);
        rect.set(0, top, right, top + knob);
        canvas.drawRoundRect(rect, knob / 2, knob / 2, fill);
        if (dragging) {
            int saved = canvas.save();
            canvas.clipRect(rect);
            float pitch = 8 * density;
            for (float x = reel; x < right; x += pitch) canvas.drawLine(x, top + 6 * density, x, top + knob - 6 * density, hairline);
            canvas.restoreToCount(saved);
        }
        buildGrip(right - knob / 2, cy, pressed ? 9 : 7);
        canvas.drawPath(gripPath, grip);
        canvas.drawText(shownText, getWidth(), cy - (text.descent() + text.ascent()) / 2, text);
    }

    @Override
    public boolean onTouchEvent(MotionEvent e) {
        if (!isEnabled()) return false;
        switch (e.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                downX = e.getX();
                downY = e.getY();
                pressed = true;
                invalidate();
                return true;
            case MotionEvent.ACTION_MOVE:
                if (!dragging) {
                    float dx = e.getX() - downX, dy = e.getY() - downY;
                    if (Math.abs(dx) <= slop || Math.abs(dx) < Math.abs(dy)) return true;
                    dragging = true;
                    getParent().requestDisallowInterceptTouchEvent(true);
                    loop.start();
                }
                set(fromX(e.getX()));
                return true;
            case MotionEvent.ACTION_UP:
                if (!dragging) set(fromX(e.getX()));
                end();
                return true;
            case MotionEvent.ACTION_CANCEL:
                if (dragging) end();
                pressed = false;
                return true;
            default:
                return true;
        }
    }

    private void end() {
        pressed = false;
        dragging = false;
        settle();
        loop.start();
        performClick();
    }

    /** One twentieth per key, settled at once; up and down stay free to move the focus. */
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        int direction = PortMath.keyStep(keyCode);
        if (direction != 0 && isEnabled() && !dragging) {
            value = clamp(value + direction * STEP);
            settle();
            return true;
        }
        return super.onKeyDown(keyCode, event);
    }

    @Override
    public CharSequence getAccessibilityClassName() {
        return "android.widget.SeekBar";
    }

    @Override
    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo info) {
        super.onInitializeAccessibilityNodeInfo(info);
        Ui.describeSlider(this, info, AccessibilityNodeInfo.RangeInfo.RANGE_TYPE_FLOAT, MIN, MAX, value, spokenText);
    }

    @Override
    public boolean performAccessibilityAction(int action, Bundle arguments) {
        if (isEnabled() && !dragging) {
            int direction = PortMath.actionStep(action);
            float to = direction != 0 ? value + direction * STEP : Ui.progressArgument(action, arguments);
            if (!Float.isNaN(to)) {
                value = clamp(to);
                settle();
                return true;
            }
        }
        return super.performAccessibilityAction(action, arguments);
    }
}
