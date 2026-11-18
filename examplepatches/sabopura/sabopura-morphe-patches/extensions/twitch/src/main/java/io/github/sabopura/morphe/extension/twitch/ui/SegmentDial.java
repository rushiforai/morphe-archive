package io.github.sabopura.morphe.extension.twitch.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.os.Bundle;
import android.os.SystemClock;
import android.util.TypedValue;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.accessibility.AccessibilityNodeInfo;

import java.util.Locale;
import java.util.function.IntConsumer;

/**
 * Bencho's Segment timer as the sleep-timer dial: one tick a minute round to 120, and the lit ticks are
 * what is left. Only the ring takes a drag, so a swipe over the middle still scrolls the menu.
 */
final class SegmentDial extends View implements Motion.Step {
    private static final int TICKS = 120;
    private static final int LONG_EVERY = 15;
    private static final float SIZE = 220;
    private static final float R = 96;
    private static final float[] POP = {.24f, 1.45f, .38f, 1f};
    private static final float[] DIGIT_POP = {.34f, 1.45f, .64f, 1f};
    private static final int SWEEP_MS = 520;
    /** The ring's free middle as a share of the side, with room to spare: its long ticks reach in 14 of 220. */
    private static final float CLOCK_ROOM = 2 * (R - 14) / SIZE * .9f;
    private static final int LEAST_DP = 176;

    private final Paint base = new Paint(Paint.ANTI_ALIAS_FLAG), lit = new Paint(Paint.ANTI_ALIAS_FLAG),
            time = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Motion.Loop loop = new Motion.Loop(this, this);
    private final float[] armNow = new float[TICKS], armFrom = new float[TICKS], armTo = new float[TICKS];
    private final long[] armStart = new long[TICKS];
    private final long[] popAt = new long[8];
    private final float strokeDp;
    private final IntConsumer onSet;
    private String off;
    private final float clockSize, widest;
    private long clockKey = Long.MIN_VALUE;
    private String clockText;
    private int minutes;
    private long leftMs;
    private boolean dragging, running, touched;
    private int previousMinute;
    private long sweepStart = -1, sweepFrom, sweepTo;
    private int sweepMinutes;
    private String shown = "";

    SegmentDial(Context context, Ui ui, long leftMs, IntConsumer onSet) {
        super(context);
        this.onSet = onSet;
        this.leftMs = Math.max(0, leftMs);
        minutes = (int) Math.ceil(this.leftMs / 60000.0);
        running = leftMs > 0;
        off = Text.label("オフ", "Off");
        strokeDp = 1.5f * context.getResources().getDisplayMetrics().density;
        base.setColor(ui.dark ? 0x38FFFFFF : 0x30000000);
        base.setStrokeCap(Paint.Cap.ROUND);
        lit.setColor(ui.accent);
        lit.setStrokeCap(Paint.Cap.ROUND);
        time.setColor(ui.text);
        time.setTextAlign(Paint.Align.LEFT);
        time.setFakeBoldText(true);
        clockSize = TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_SP, 26,
                context.getResources().getDisplayMetrics());
        time.setTextSize(clockSize);
        widest = Math.max(time.measureText("120:00"), time.measureText(off));
        setFocusable(true);
        setClickable(true);
        setContentDescription(Text.label("スリープタイマー", "Sleep timer"));
        retarget(SystemClock.uptimeMillis());
        snapArms();
        spoken(false);
    }

    private String minutesText() {
        return minutes == 0 ? off : Text.label(minutes + " 分", minutes == 1 ? "1 minute" : minutes + " minutes");
    }

    private void spoken(boolean announce) {
        Ui.setSpokenState(this, minutesText(), announce);
    }

    /** What the dial reads while no time is set: "Off", or what else the timer waits for. */
    void idleLabel(String text) {
        if (text.equals(off)) return;
        off = text;
        clockKey = Long.MIN_VALUE;
        invalidate();
    }

    /** The timer's remaining time, once a second while the menu is open. */
    void update(long remainingMs) {
        if (dragging || sweepStart != -1) return;
        leftMs = Math.max(0, remainingMs);
        running = leftMs > 0;
        minutes = (int) Math.ceil(leftMs / 60000.0);
        spoken(false);
        invalidate();
    }

    void sweepTo(int toMinutes) {
        touched = true;
        sweepFrom = leftMs;
        sweepTo = toMinutes * 60000L;
        sweepMinutes = toMinutes;
        sweepStart = 0;
        loop.start();
    }

    /** A large font widens the dial as far as the row allows, so the clock keeps its size and stays inside the ring. */
    @Override
    protected void onMeasure(int widthSpec, int heightSpec) {
        int most = MeasureSpec.getMode(widthSpec) == MeasureSpec.UNSPECIFIED ? Integer.MAX_VALUE : MeasureSpec.getSize(widthSpec);
        int size = PortMath.dialSide(widest, CLOCK_ROOM, Ui.dp(getContext(), LEAST_DP), most);
        setMeasuredDimension(resolveSize(size, widthSpec), size);
    }

    /** Where the row is too narrow for that, the clock shrinks to fit the ring instead of crossing it. */
    @Override
    protected void onSizeChanged(int w, int h, int oldW, int oldH) {
        super.onSizeChanged(w, h, oldW, oldH);
        float room = CLOCK_ROOM * Math.min(w, h);
        time.setTextSize(widest > room ? clockSize * room / widest : clockSize);
    }

    @Override
    protected void onDetachedFromWindow() {
        loop.stop();
        super.onDetachedFromWindow();
    }

    private void set(int minute) {
        touched = true;
        minutes = minute;
        leftMs = minute * 60000L;
        spoken(false);
        invalidate();
        retarget(SystemClock.uptimeMillis());
    }

    private void retarget(long now) {
        double run = leftMs / 60000.0;
        int full = (int) Math.floor(run);
        for (int i = 0; i < TICKS; i++) {
            float to = dragging ? (float) Math.exp(-((i - full) * (i - full)) / 8.0) * .6f : running && i == full ? .25f : 0;
            if (to == armTo[i]) continue;
            armFrom[i] = armNow[i];
            armTo[i] = to;
            armStart[i] = now;
        }
        loop.start();
    }

    private void snapArms() {
        for (int i = 0; i < TICKS; i++) {
            armNow[i] = armTo[i];
            armStart[i] = 0;
        }
    }

    @Override
    public boolean frame(float seconds, long nowMs) {
        long uptime = SystemClock.uptimeMillis();
        boolean more = false;
        int duration = dragging ? 220 : 420;
        for (int i = 0; i < TICKS; i++) {
            if (armStart[i] == 0) continue;
            float t = Math.min(1, (uptime - armStart[i]) / (float) duration);
            armNow[i] = armFrom[i] + (armTo[i] - armFrom[i]) * Ease.bezier(POP, t);
            if (t >= 1) armStart[i] = 0;
            else more = true;
        }
        if (sweepStart == 0) sweepStart = uptime;
        if (sweepStart > 0) {
            float t = Math.min(1, (uptime - sweepStart) / (float) SWEEP_MS);
            leftMs = sweepFrom + (long) ((sweepTo - sweepFrom) * Ease.quartOut(t));
            if (t >= 1) {
                sweepStart = -1;
                leftMs = sweepTo;
                minutes = sweepMinutes;
                spoken(false);
            } else {
                more = true;
            }
        }
        more |= animatingDigits(uptime);
        return more;
    }

    private boolean animatingDigits(long uptime) {
        for (long at : popAt) if (at != 0 && uptime - at < 500) return true;
        return false;
    }

    @Override
    public void snap() {
        snapArms();
        if (sweepStart != -1) {
            sweepStart = -1;
            leftMs = sweepTo;
            minutes = sweepMinutes;
            spoken(false);
        }
        java.util.Arrays.fill(popAt, 0);
    }

    /** The clock's words, formatted only when the second shown changes rather than on every frame. */
    private String label() {
        long key = -1;
        if (leftMs > 0 || dragging || sweepStart != -1) {
            long ms = sweepStart != -1 ? (long) Math.ceil(leftMs / 60000.0) * 60000 : leftMs;
            key = (long) Math.ceil(ms / 1000.0);
        }
        if (key != clockKey) {
            clockKey = key;
            clockText = key < 0 ? off : String.format(Locale.ROOT, "%02d:%02d", key / 60, key % 60);
        }
        return clockText;
    }

    @Override
    protected void onDraw(Canvas canvas) {
        float centerX = getWidth() / 2f, centerY = getHeight() / 2f;
        float scale = getHeight() / SIZE;
        float radius = R * scale;
        double run = leftMs / 60000.0;
        int full = (int) Math.floor(run);
        double part = run - full;
        for (int i = 0; i < TICKS; i++) {
            double a = (i + .5) / TICKS * Math.PI * 2;
            float len = (i % LONG_EVERY == LONG_EVERY - 1 ? 14 : 10) * scale;
            float grow = 1 + armNow[i];
            float sx = centerX + (float) Math.sin(a) * radius, sy = centerY - (float) Math.cos(a) * radius;
            float ex = centerX + (float) Math.sin(a) * (radius - len * grow);
            float ey = centerY - (float) Math.cos(a) * (radius - len * grow);
            float stroke = strokeDp * grow;
            base.setStrokeWidth(stroke);
            canvas.drawLine(sx, sy, ex, ey, base);
            double strength = i < full ? 1 : i == full ? part : 0;
            if (strength > 0) {
                lit.setStrokeWidth(stroke);
                lit.setAlpha((int) Math.round(strength * 255));
                canvas.drawLine(sx, sy, ex, ey, lit);
            }
        }
        drawTime(canvas, centerX, centerY);
    }

    private void drawTime(Canvas canvas, float cx, float cy) {
        String text = label();
        long uptime = SystemClock.uptimeMillis();
        if (!text.equals(shown)) {
            if (!running && touched && text.length() <= popAt.length) {
                for (int i = 0; i < text.length(); i++) {
                    if (i >= shown.length() || text.charAt(i) != shown.charAt(i)) popAt[i] = uptime + i * 40L;
                }
                loop.start();
            }
            shown = text;
        }
        float width = 0;
        for (int i = 0; i < text.length(); i++) width += time.measureText(text, i, i + 1);
        float x = cx - width / 2;
        float baseline = cy - (time.descent() + time.ascent()) / 2;
        float em = time.getTextSize();
        for (int i = 0; i < text.length(); i++) {
            float rise = 0;
            int alpha = 255;
            if (i < popAt.length && popAt[i] != 0) {
                float t = Math.min(1, Math.max(0, (uptime - popAt[i]) / 500f));
                float e = Ease.bezier(DIGIT_POP, t);
                rise = (1 - e) * .18f * em;
                alpha = Math.round(Math.max(0, Math.min(1, e)) * 255);
                if (t >= 1) popAt[i] = 0;
            }
            time.setAlpha(alpha);
            canvas.drawText(text, i, i + 1, x, baseline + rise, time);
            x += time.measureText(text, i, i + 1);
        }
        time.setAlpha(255);
    }

    @Override
    public boolean onTouchEvent(MotionEvent e) {
        if (!isEnabled()) return false;
        float dx = e.getX() - getWidth() / 2f, dy = e.getY() - getHeight() / 2f;
        switch (e.getActionMasked()) {
            case MotionEvent.ACTION_DOWN: {
                float reach = R * getHeight() / SIZE;
                double distance = Math.hypot(dx, dy);
                if (distance < reach * .45f || distance > reach * 1.25f) return false;
                getParent().requestDisallowInterceptTouchEvent(true);
                sweepStart = -1;
                dragging = true;
                running = false;
                previousMinute = minutes > 0 ? minutes : TICKS / 2;
                previousMinute = PortMath.minuteAt(dx, dy, previousMinute, TICKS);
                set(previousMinute);
                return true;
            }
            case MotionEvent.ACTION_MOVE:
                if (!dragging) return false;
                previousMinute = PortMath.minuteAt(dx, dy, previousMinute, TICKS);
                set(previousMinute);
                return true;
            case MotionEvent.ACTION_UP:
            case MotionEvent.ACTION_CANCEL:
                if (!dragging) return false;
                dragging = false;
                running = true;
                retarget(SystemClock.uptimeMillis());
                onSet.accept(minutes);
                spoken(true);
                performClick();
                return true;
            default:
                return true;
        }
    }

    private void moveTo(int minute) {
        int next = Math.max(1, Math.min(TICKS, minute));
        set(next);
        onSet.accept(next);
        spoken(true);
    }

    /** Left and right move a minute; up and down stay free to move the focus through the menu. */
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        int direction = PortMath.keyStep(keyCode);
        if (direction != 0 && isEnabled()) {
            moveTo(minutes + direction);
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
        Ui.describeSlider(this, info, AccessibilityNodeInfo.RangeInfo.RANGE_TYPE_INT, 1, TICKS, Math.max(1, minutes),
                minutesText());
    }

    @Override
    public boolean performAccessibilityAction(int action, Bundle arguments) {
        if (isEnabled()) {
            int step = PortMath.actionStep(action);
            float to = step != 0 ? minutes + step : Ui.progressArgument(action, arguments);
            if (!Float.isNaN(to)) {
                moveTo(Math.round(to));
                return true;
            }
        }
        return super.performAccessibilityAction(action, arguments);
    }
}
