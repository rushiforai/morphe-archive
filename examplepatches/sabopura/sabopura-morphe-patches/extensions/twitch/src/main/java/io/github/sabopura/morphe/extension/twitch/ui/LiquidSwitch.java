/*
 * Ported from Bencho's liq-toggle block (Toggle.tsx), MIT License.
 * Copyright (c) 2026 Lorenzo Cabra
 */
package io.github.sabopura.morphe.extension.twitch.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.RectF;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;

import java.util.function.Consumer;

/**
 * A switch whose droplet lengthens along its travel. The whole calculation runs in the source's
 * 92-unit track so its speeds and thresholds keep their meaning; only drawing scales it to fit a row.
 */
final class LiquidSwitch extends View implements Motion.Step {
    private static final float TRACK = 92, HEIGHT = 46, THUMB = 36, PAD = (HEIGHT - THUMB) / 2;
    private static final float SHUT_X = PAD, OPEN_X = TRACK - THUMB - PAD, MID_X = (SHUT_X + OPEN_X) / 2;
    private static final float STRETCH = .36f;
    private static final float HOT_SWELL = 1.035f;
    private static final int COLOUR_MS = 420;
    private static final float DRAWN_WIDTH_DP = 56;
    private static final String SWITCH = "android.widget.Switch";

    private final Spring x = new Spring(SHUT_X).tune(170, 21.5f, .9f);
    private final Spring eased = new Spring(0).tune(380, 34, .6f);
    private final Spring swell = new Spring(1).tune(380, 34, .6f);
    private final Motion.Loop loop = new Motion.Loop(this, this);
    private final Paint track = new Paint(Paint.ANTI_ALIAS_FLAG), thumb = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RectF rect = new RectF();
    private final int trackOff, trackOn, thumbOff, thumbOn;
    private final float units;
    private final int slop;
    private Consumer<Boolean> listener;
    private View speaker;
    private boolean on, held, moved;
    private float prevX = SHUT_X, grab, downX, downY;
    private float colour = 1;
    private long colourStart = -1;

    LiquidSwitch(Context context, Ui ui) {
        super(context);
        trackOff = ui.dark ? 0x55FFFFFF : 0x33000000;
        trackOn = ui.accent;
        thumbOff = ui.dark ? 0xFFBDBDC6 : 0xFFF4F4F6;
        thumbOn = ui.onAccent;
        units = Ui.dp(context, DRAWN_WIDTH_DP) / TRACK;
        slop = ViewConfiguration.get(context).getScaledTouchSlop();
        setClickable(true);
        setFocusable(true);
    }

    void setListener(Consumer<Boolean> listener) {
        this.listener = listener;
    }

    /** A row read as this switch, with the row's own words; a caller may extend it with the row's own actions. */
    static class Voice extends AccessibilityDelegate {
        private final LiquidSwitch toggle;

        Voice(LiquidSwitch toggle) {
            this.toggle = toggle;
        }

        @Override
        public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
            super.onInitializeAccessibilityNodeInfo(host, info);
            info.setClassName(SWITCH);
            info.setCheckable(true);
            info.setChecked(toggle.on);
        }

        @Override
        public void onInitializeAccessibilityEvent(View host, AccessibilityEvent event) {
            super.onInitializeAccessibilityEvent(host, event);
            event.setClassName(SWITCH);
            event.setChecked(toggle.on);
        }
    }

    /**
     * Makes {@code row} the one stop for TalkBack and the keyboard: it reads as this switch with the row's
     * own words, and clicking it is the caller's toggle. The switch itself still takes a tap or a drag.
     */
    void speakThrough(View row) {
        speakThrough(row, new Voice(this));
    }

    void speakThrough(View row, Voice voice) {
        speaker = row;
        setFocusable(false);
        setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
        row.setAccessibilityDelegate(voice);
        speak();
    }

    /** Sets the state without telling the listener. */
    void setChecked(boolean checked, boolean animate) {
        if (on == checked) return;
        on = checked;
        stateChanged();
        if (animate) {
            x.target = on ? OPEN_X : SHUT_X;
            loop.start();
        } else {
            loop.stop();
            snap();
            invalidate();
        }
    }

    void toggle() {
        on = !on;
        stateChanged();
        x.target = on ? OPEN_X : SHUT_X;
        loop.start();
        if (listener != null) listener.accept(on);
    }

    /** The colour eases to the new state, and the row says it. */
    private void stateChanged() {
        colourStart = 0;
        speak();
    }

    /** The state Switch itself says, given to the row for Android 11+ to read out when it changes. */
    private void speak() {
        if (speaker != null) Ui.setSpokenState(speaker, on ? Text.label("オン", "On") : Text.label("オフ", "Off"));
    }

    @Override
    protected void onMeasure(int widthSpec, int heightSpec) {
        setMeasuredDimension(Ui.dp(getContext(), DRAWN_WIDTH_DP), Ui.dp(getContext(), 48));
    }

    @Override
    protected void onDetachedFromWindow() {
        loop.stop();
        snap();
        super.onDetachedFromWindow();
    }

    @Override
    public boolean frame(float seconds, long nowMs) {
        boolean moving = held;
        if (!held) moving = x.step(seconds, 4, .01f, .05f);
        float raw = (x.value - prevX) / seconds;
        prevX = x.value;
        eased.target = raw;
        moving |= eased.step(seconds, 4, .1f, 1f);
        moving |= swell.step(seconds, 4, .001f, .01f);
        if (colourStart == 0) colourStart = nowMs;
        if (colourStart > 0) {
            float t = (nowMs - colourStart) / (float) COLOUR_MS;
            colour = Ease.bezier(Ease.EASE, Math.min(1, t));
            if (t >= 1) colourStart = -1;
            else moving = true;
        }
        return moving;
    }

    @Override
    public void snap() {
        x.jump(on ? OPEN_X : SHUT_X);
        prevX = x.value;
        eased.jump(0);
        swell.jump(1);
        colourStart = -1;
        colour = 1;
    }

    private float lengthen() {
        return 1 + Math.min(.4f, Math.abs(eased.value) / 600f) * STRETCH;
    }

    @Override
    protected void onDraw(Canvas canvas) {
        float top = (getHeight() - HEIGHT * units) / 2;
        float mix = on ? colour : 1 - colour;
        track.setColor(blend(trackOff, trackOn, mix));
        rect.set(0, top, TRACK * units, top + HEIGHT * units);
        canvas.drawRoundRect(rect, rect.height() / 2, rect.height() / 2, track);
        thumb.setColor(blend(thumbOff, thumbOn, mix));
        float wide = lengthen() * swell.value, tall = swell.value / lengthen();
        float cx = (x.value + THUMB / 2) * units, cy = getHeight() / 2f;
        float rx = THUMB / 2 * units * wide, ry = THUMB / 2 * units * tall;
        rect.set(cx - rx, cy - ry, cx + rx, cy + ry);
        canvas.drawOval(rect, thumb);
    }

    private static int blend(int from, int to, float t) {
        return Color.argb(
                Math.round(Color.alpha(from) + (Color.alpha(to) - Color.alpha(from)) * t),
                Math.round(Color.red(from) + (Color.red(to) - Color.red(from)) * t),
                Math.round(Color.green(from) + (Color.green(to) - Color.green(from)) * t),
                Math.round(Color.blue(from) + (Color.blue(to) - Color.blue(from)) * t));
    }

    /** A press that never travelled is a click; a drag owns the thumb and flips at the middle. */
    @Override
    public boolean onTouchEvent(MotionEvent e) {
        if (!isEnabled()) return false;
        switch (e.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                downX = e.getX();
                downY = e.getY();
                moved = false;
                held = true;
                swell.target = HOT_SWELL;
                loop.start();
                return true;
            case MotionEvent.ACTION_MOVE:
                if (!moved) {
                    float dx = e.getX() - downX, dy = e.getY() - downY;
                    if (Math.abs(dx) <= slop || Math.abs(dx) <= Math.abs(dy)) return true;
                    moved = true;
                    getParent().requestDisallowInterceptTouchEvent(true);
                    grab = e.getX() / units - x.value;
                }
                float next = clamp(e.getX() / units - grab);
                x.jump(next);
                boolean past = next > MID_X;
                if (past != on) {
                    on = past;
                    stateChanged();
                    if (listener != null) listener.accept(on);
                }
                return true;
            case MotionEvent.ACTION_UP:
            case MotionEvent.ACTION_CANCEL:
                held = false;
                swell.target = 1;
                if (!moved && e.getActionMasked() == MotionEvent.ACTION_UP) {
                    performClick();
                } else {
                    x.target = on ? OPEN_X : SHUT_X;
                    loop.start();
                }
                return true;
            default:
                return true;
        }
    }

    private static float clamp(float value) {
        return Math.max(SHUT_X, Math.min(OPEN_X, value));
    }

    @Override
    public boolean performClick() {
        toggle();
        return super.performClick();
    }

    @Override
    public CharSequence getAccessibilityClassName() {
        return SWITCH;
    }

    @Override
    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo info) {
        super.onInitializeAccessibilityNodeInfo(info);
        info.setCheckable(true);
        info.setChecked(on);
    }

    @Override
    public void onInitializeAccessibilityEvent(AccessibilityEvent event) {
        super.onInitializeAccessibilityEvent(event);
        event.setChecked(on);
    }
}
