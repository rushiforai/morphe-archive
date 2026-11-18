/*
 * Ported from Bencho's rolling-counter block (Counter.tsx), MIT License.
 * Copyright (c) 2026 Lorenzo Cabra
 */
package io.github.sabopura.morphe.extension.twitch.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.Shader;
import android.os.SystemClock;
import android.util.TypedValue;
import android.view.View;

import java.util.ArrayDeque;

/**
 * Digits on strips that roll to the blocked-ads count like an odometer. A column's target is the
 * whole tens, hundreds... in the value, so a carry rolls forward and ripples up the columns in turn.
 * The source's blur is left out: it is a per-frame filter for a smear only just visible at this size.
 */
final class RollingCounter extends View implements Motion.Step {
    private static final int PLACES = 5;
    private static final int STAGGER_MS = 45;
    private static final double TUNE = 45;
    private static final float[] WIDTH_CURVE = {.3f, 1.2f, .4f, 1f};
    private static final int WIDTH_MS = 320;
    private static final String[] DIGITS = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"};

    private static final class Column {
        final FrameSpring spring;
        final ArrayDeque<long[]> due = new ArrayDeque<>();
        float width;
        float widthFrom;
        long widthStart = -1;

        Column(double start) {
            spring = new FrameSpring(start);
        }
    }

    private final Column[] columns = new Column[PLACES];
    private final Paint digit = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint mask = new Paint();
    private final Paint.FontMetrics metrics = new Paint.FontMetrics();
    private final Motion.Loop loop = new Motion.Loop(this, this);
    private final float cell, charWidth;
    private int value;

    RollingCounter(Context context, int color, int start) {
        super(context);
        value = Math.max(0, start);
        digit.setColor(color);
        digit.setTextAlign(Paint.Align.CENTER);
        digit.setFakeBoldText(true);
        digit.setTextSize(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_SP, 20,
                context.getResources().getDisplayMetrics()));
        digit.getFontMetrics(metrics);
        // 28 dp at the default font size; a larger font gets a taller strip rather than clipped digits.
        cell = Math.max(Ui.dp(context, 28), (float) Math.ceil((metrics.descent - metrics.ascent) * 1.2f));
        charWidth = digit.getTextSize() * .64f;
        mask.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.DST_IN));
        for (int p = 0; p < PLACES; p++) {
            columns[p] = new Column(wholeTens(value, p));
            columns[p].width = p < shownDigits() ? charWidth : 0;
        }
        setContentDescription(String.valueOf(value));
    }

    private static long wholeTens(int value, int place) {
        return (long) Math.floor(value / Math.pow(10, place));
    }

    private int shownDigits() {
        return Math.max(1, String.valueOf(value).length());
    }

    void setValue(int next) {
        next = Math.max(0, Math.min(99999, next));
        if (next == value) return;
        value = next;
        setContentDescription(String.valueOf(value));
        long now = SystemClock.uptimeMillis();
        int digits = shownDigits();
        for (int p = 0; p < PLACES; p++) {
            Column column = columns[p];
            column.due.add(new long[]{now + (long) p * STAGGER_MS, wholeTens(value, p)});
            float wanted = p < digits ? charWidth : 0;
            if (wanted != column.width && column.widthStart == -1) {
                column.widthFrom = column.width;
                column.widthStart = 0;
            }
        }
        loop.start();
    }

    @Override
    protected void onMeasure(int widthSpec, int heightSpec) {
        setMeasuredDimension(Math.round(charWidth * PLACES), Math.round(cell));
    }

    @Override
    protected void onSizeChanged(int w, int h, int oldW, int oldH) {
        super.onSizeChanged(w, h, oldW, oldH);
        mask.setShader(new LinearGradient(0, 0, 0, h,
                new int[]{0, 0xFF000000, 0xFF000000, 0}, new float[]{0, .2f, .8f, 1}, Shader.TileMode.CLAMP));
    }

    @Override
    protected void onDetachedFromWindow() {
        loop.stop();
        super.onDetachedFromWindow();
    }

    @Override
    public boolean frame(float seconds, long nowMs) {
        double frames = Math.max(0, Math.min(2.5, seconds * 1000 / 16.67));
        double k = FrameSpring.stiffnessOf(TUNE), d = FrameSpring.decayOf(TUNE);
        long uptime = SystemClock.uptimeMillis();
        boolean busy = false;
        int digits = shownDigits();
        for (int p = 0; p < PLACES; p++) {
            Column c = columns[p];
            while (!c.due.isEmpty() && c.due.peekFirst()[0] <= uptime) c.spring.target = c.due.pollFirst()[1];
            if (!c.due.isEmpty()) busy = true;
            double gap = c.spring.target - c.spring.position;
            if (Math.abs(gap) > 24) c.spring.position += Math.round((gap - Math.signum(gap) * 24) / 10) * 10;
            busy |= c.spring.step(frames, k, d, .004);
            if (c.widthStart == 0) c.widthStart = uptime;
            if (c.widthStart > 0) {
                float t = Math.min(1, (uptime - c.widthStart) / (float) WIDTH_MS);
                float wanted = p < digits ? charWidth : 0;
                c.width = c.widthFrom + (wanted - c.widthFrom) * Ease.bezier(WIDTH_CURVE, t);
                if (t >= 1) c.widthStart = -1;
                else busy = true;
            }
        }
        return busy;
    }

    @Override
    public void snap() {
        int digits = shownDigits();
        for (int p = 0; p < PLACES; p++) {
            columns[p].due.clear();
            columns[p].spring.target = wholeTens(value, p);
            columns[p].spring.position = columns[p].spring.target;
            columns[p].spring.velocity = 0;
            columns[p].widthStart = -1;
            columns[p].width = p < digits ? charWidth : 0;
        }
    }

    @Override
    protected void onDraw(Canvas canvas) {
        int saved = canvas.saveLayer(0, 0, getWidth(), getHeight(), null);
        float right = getWidth();
        float baseline = cell / 2 - (metrics.ascent + metrics.descent) / 2;
        for (int p = 0; p < PLACES; p++) {
            Column c = columns[p];
            if (c.width < .5f) continue;
            double m = ((c.spring.position % 10) + 10) % 10;
            int low = (int) Math.floor(m);
            float offset = (float) (m - low);
            float cx = right - c.width / 2;
            digit.setAlpha(Math.round(255 * Math.min(1, c.width / charWidth)));
            canvas.drawText(DIGITS[low % 10], cx, baseline - offset * cell, digit);
            if (offset > 0) canvas.drawText(DIGITS[(low + 1) % 10], cx, baseline + (1 - offset) * cell, digit);
            right -= c.width;
        }
        canvas.drawRect(0, 0, getWidth(), getHeight(), mask);
        canvas.restoreToCount(saved);
    }

    @Override
    public CharSequence getAccessibilityClassName() {
        return "android.widget.TextView";
    }
}
