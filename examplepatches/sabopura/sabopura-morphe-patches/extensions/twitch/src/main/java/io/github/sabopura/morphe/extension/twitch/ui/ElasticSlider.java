package io.github.sabopura.morphe.extension.twitch.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.os.Bundle;
import android.text.TextPaint;
import android.util.TypedValue;
import android.view.HapticFeedbackConstants;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.accessibility.AccessibilityNodeInfo;

import java.util.function.IntConsumer;
import java.util.function.IntFunction;

/**
 * Bencho's Elastic slider with the settings screen's value bubble and default-value mark. Pulling past
 * either end stretches the pill, and the spring returns it with one small overshoot. The value itself
 * never leaves its range, only the pill gives.
 */
final class ElasticSlider extends View implements Motion.Step {
    /** The source's Stretch knob at 0: a pull must stay inside the row's 16 dp padding. */
    private static final float MAX_STRETCH_DP = 14;
    private static final float BOUNCE = .5f;
    private static final float K = (float) Math.pow(2 * Math.PI * 3.4, 2);
    private static final float C = (float) (2 * Math.sqrt(K) * (.75f - BOUNCE * .55f));
    private static final int FILL_MS = 90;
    private static final int BUBBLE_MS = 100;

    private final int min, max, mark;
    private final IntFunction<String> format;
    private final IntConsumer preview, commit;
    private final Spring over = new Spring(0).tune(K, C, 1);
    private final Motion.Loop loop = new Motion.Loop(this, this);
    private final Paint pill = new Paint(Paint.ANTI_ALIAS_FLAG), fill = new Paint(Paint.ANTI_ALIAS_FLAG),
            notch = new Paint(Paint.ANTI_ALIAS_FLAG), bubble = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final TextPaint bubbleText = new TextPaint(Paint.ANTI_ALIAS_FLAG);
    private final RectF rect = new RectF();
    private final Path tail = new Path();
    private final Paint.FontMetrics bubbleMetrics = new Paint.FontMetrics();
    private final float density;
    private final int slop;
    private String shownText;

    private int value;
    private float shown, fillFrom;
    private long fillStart = -1;
    private int side = 1;
    private boolean dragging;
    private float downX, downY;
    private float bubbleAlpha;
    private long bubbleStart = -1;
    private boolean bubbleShown;

    ElasticSlider(Context context, Ui ui, int min, int max, int value, int mark, IntFunction<String> format,
                  IntConsumer preview, IntConsumer commit) {
        super(context);
        this.min = min;
        this.max = max;
        this.mark = mark;
        this.format = format;
        this.preview = preview;
        this.commit = commit;
        this.value = clamp(value);
        shown = this.value;
        density = context.getResources().getDisplayMetrics().density;
        slop = ViewConfiguration.get(context).getScaledTouchSlop();
        pill.setColor(ui.dark ? 0x1AFFFFFF : 0x12000000);
        fill.setColor(ui.accent);
        notch.setColor(ui.dark ? 0x99FFFFFF : 0x88000000);
        bubble.setColor(ui.dark ? 0xFFEFEFF1 : 0xFF18181B);
        bubbleText.setColor(ui.dark ? 0xFF0E0E10 : 0xFFFFFFFF);
        bubbleText.setTextSize(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_SP, 13,
                context.getResources().getDisplayMetrics()));
        bubbleText.setFakeBoldText(true);
        bubbleText.setTextAlign(Paint.Align.CENTER);
        setClickable(true);
        setFocusable(true);
        spoken(false);
    }

    /** The value in words, kept for the bubble and TalkBack; formatted once per change, not per frame. */
    private void spoken(boolean announce) {
        shownText = format.apply(value);
        Ui.setSpokenState(this, shownText, announce);
    }

    private int clamp(int v) {
        return Math.max(min, Math.min(max, v));
    }

    private float maxStretch() {
        return MAX_STRETCH_DP * density;
    }

    private int span() {
        return Math.max(1, getWidth());
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

    /** Sets by a step from a button, the keyboard or TalkBack; saved at once. */
    void nudge(int delta) {
        int next = clamp(value + delta);
        if (next == value) {
            side = delta > 0 ? 1 : -1;
            over.value = 10 * density;
            release();
            return;
        }
        change(next);
        commit.accept(value);
        spoken(true);
    }

    private void change(int next) {
        if (next == value) return;
        value = next;
        fillFrom = shown;
        fillStart = 0;
        preview.accept(value);
        spoken(false);
        loop.start();
    }

    private void track(float x) {
        int w = span();
        int v = clamp(min + Math.round(x / w * (max - min)));
        if (PortMath.landedOn(value, v, mark)) performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
        if (v != value) {
            value = v;
            preview.accept(value);
            spoken(false);
        }
        shown = value;
        fillStart = -1;
        float past = x < 0 ? x : x > w ? x - w : 0;
        side = past < 0 ? -1 : 1;
        over.value = PortMath.rubber(past, maxStretch());
        over.velocity = 0;
        invalidate();
    }

    private void showBubble(boolean visible) {
        if (bubbleShown == visible) return;
        bubbleShown = visible;
        bubbleStart = 0;
        loop.start();
    }

    private void release() {
        over.target = 0;
        over.tune(K, C, 1);
        loop.start();
    }

    @Override
    public boolean frame(float seconds, long nowMs) {
        boolean moving = dragging;
        if (!dragging) moving = over.step(Math.min(.033f, seconds), 4, .05f * density, density);
        if (fillStart == 0) fillStart = nowMs;
        if (fillStart > 0) {
            float t = Math.min(1, (nowMs - fillStart) / (float) FILL_MS);
            shown = fillFrom + (value - fillFrom) * t;
            if (t >= 1) fillStart = -1;
            else moving = true;
        }
        if (bubbleStart == 0) bubbleStart = nowMs;
        if (bubbleStart > 0) {
            float t = Math.min(1, (nowMs - bubbleStart) / (float) BUBBLE_MS);
            bubbleAlpha = bubbleShown ? t : 1 - t;
            if (t >= 1) bubbleStart = -1;
            else moving = true;
        }
        return moving;
    }

    @Override
    public void snap() {
        over.jump(0);
        shown = value;
        fillStart = -1;
        bubbleStart = -1;
        bubbleAlpha = bubbleShown ? 1 : 0;
    }

    @Override
    protected void onDraw(Canvas canvas) {
        int w = getWidth();
        float height = 40 * density, top = (getHeight() - height) / 2;
        canvas.save();
        canvas.scale(1 + over.value / w, PortMath.rubberThin(over.value, maxStretch()),
                side > 0 ? 0 : w, getHeight() / 2f);
        rect.set(0, top, w, top + height);
        canvas.drawRoundRect(rect, height / 2, height / 2, pill);
        float fraction = (shown - min) / (float) Math.max(1, max - min);
        float edge = Math.max(height, fraction * w);
        if (fraction > 0) {
            rect.set(0, top, edge, top + height);
            canvas.drawRoundRect(rect, height / 2, height / 2, fill);
        }
        if (mark >= min && mark <= max) {
            float at = (mark - min) / (float) Math.max(1, max - min) * w;
            float half = 1.25f * density, inset = 10 * density;
            float cx = Math.max(height / 2, Math.min(w - height / 2, at));
            rect.set(cx - half, top + inset, cx + half, top + height - inset);
            canvas.drawRoundRect(rect, half, half, notch);
        }
        canvas.restore();
        if (bubbleAlpha > 0) drawBubble(canvas, Math.max(height / 2, Math.min(w - height / 2, fraction * w)), top);
    }

    private void drawBubble(Canvas canvas, float cx, float pillTop) {
        String text = shownText;
        Paint.FontMetrics metrics = bubbleMetrics;
        bubbleText.getFontMetrics(metrics);
        float pad = 9 * density, gap = 6 * density, tailSize = 4 * density;
        float height = metrics.descent - metrics.ascent + 8 * density;
        float width = bubbleText.measureText(text) + pad * 2;
        float left = Math.max(0, Math.min(getWidth() - width, cx - width / 2));
        float bottom = pillTop - gap, top = bottom - height;
        int alpha = Math.round(bubbleAlpha * 255);
        bubble.setAlpha(alpha);
        bubbleText.setAlpha(alpha);
        rect.set(left, top, left + width, bottom);
        canvas.drawRoundRect(rect, height / 2, height / 2, bubble);
        tail.reset();
        tail.moveTo(cx - tailSize, bottom);
        tail.lineTo(cx, bottom + tailSize);
        tail.lineTo(cx + tailSize, bottom);
        tail.close();
        canvas.drawPath(tail, bubble);
        canvas.drawText(text, left + width / 2, top + (height - metrics.descent - metrics.ascent) / 2, bubbleText);
    }

    /** The drag waits for the finger to choose horizontal, so a vertical swipe still scrolls the list. */
    @Override
    public boolean onTouchEvent(MotionEvent e) {
        if (!isEnabled()) return false;
        switch (e.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                downX = e.getX();
                downY = e.getY();
                dragging = false;
                loop.stop();
                over.velocity = 0;
                return true;
            case MotionEvent.ACTION_MOVE:
                if (!dragging) {
                    float dx = e.getX() - downX, dy = e.getY() - downY;
                    if (Math.abs(dx) <= slop || Math.abs(dx) < Math.abs(dy)) return true;
                    dragging = true;
                    getParent().requestDisallowInterceptTouchEvent(true);
                    showBubble(true);
                }
                track(e.getX());
                return true;
            case MotionEvent.ACTION_UP:
                if (!dragging) track(e.getX());
                finish();
                return true;
            case MotionEvent.ACTION_CANCEL:
                if (dragging) finish();
                return true;
            default:
                return true;
        }
    }

    private void finish() {
        dragging = false;
        showBubble(false);
        commit.accept(value);
        spoken(true);
        release();
        performClick();
    }

    /** A stock SeekBar's step: a twentieth of the range. */
    private int step() {
        return Math.max(1, (max - min) / 20);
    }

    /** Left and right move it; up and down stay free to move the focus along the list. */
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        int direction = PortMath.keyStep(keyCode);
        if (direction != 0 && isEnabled()) {
            nudge(direction * step());
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
        Ui.describeSlider(this, info, AccessibilityNodeInfo.RangeInfo.RANGE_TYPE_INT, min, max, value, shownText);
    }

    @Override
    public boolean performAccessibilityAction(int action, Bundle arguments) {
        if (isEnabled()) {
            int direction = PortMath.actionStep(action);
            if (direction != 0) {
                nudge(direction * step());
                return true;
            }
            float to = Ui.progressArgument(action, arguments);
            if (!Float.isNaN(to)) {
                int next = clamp(Math.round(to));
                if (next != value) {
                    change(next);
                    commit.accept(value);
                    spoken(true);
                }
                return true;
            }
        }
        return super.performAccessibilityAction(action, arguments);
    }
}
