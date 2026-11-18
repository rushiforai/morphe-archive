package io.github.sabopura.morphe.extension.twitch.original;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.graphics.Shader;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.View;

import static io.github.sabopura.morphe.extension.twitch.ui.Text.label;

/**
 * A faint sparkline of chat speed in the corner of the player. It redraws when a new bucket is due and only
 * while it can be seen; there is no animation loop. Touches pass straight through.
 */
public final class HypeMeterView extends View {
    private static final long TICK_MS = 2000, BUCKET_MS = HypeSeries.BUCKET_MS;
    private static final long PILL_MS = 4000, SPIKE_COOLDOWN_MS = 60_000;

    private final Paint line = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint ghost = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint dot = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint pillFace = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint pillText = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Path curve = new Path(), under = new Path();
    private final RectF rect = new RectF();
    private final float density;
    private final Runnable tick = this::tick;
    private int[] series = new int[HypeSeries.POINTS];
    private boolean ticking;
    private long pillUntil, cooledAt;
    private int pillRatio;

    public HypeMeterView(Context context, AttributeSet attrs) {
        super(context, attrs);
        density = context.getResources().getDisplayMetrics().density;
        setVisibility(GONE);
        setClickable(false);
        setFocusable(false);
        setWillNotDraw(false);
        line.setStyle(Paint.Style.STROKE);
        line.setStrokeWidth(1.5f * density);
        line.setStrokeJoin(Paint.Join.ROUND);
        line.setColor(0xFF3EE08F);
        ghost.setStyle(Paint.Style.STROKE);
        ghost.setStrokeWidth(density);
        ghost.setColor(0x24FFFFFF);
        dot.setColor(Color.WHITE);
        pillFace.setColor(0xCCB23CFF);
        pillText.setColor(Color.WHITE);
        pillText.setTextSize(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_SP, 11, context.getResources().getDisplayMetrics()));
        pillText.setFakeBoldText(true);
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        sync();
    }

    @Override
    protected void onDetachedFromWindow() {
        stop();
        super.onDetachedFromWindow();
    }

    @Override
    protected void onWindowVisibilityChanged(int visibility) {
        super.onWindowVisibilityChanged(visibility);
        sync();
    }

    @Override
    public void onWindowFocusChanged(boolean hasWindowFocus) {
        super.onWindowFocusChanged(hasWindowFocus);
        sync();
    }

    @Override
    public void onVisibilityAggregated(boolean isVisible) {
        super.onVisibilityAggregated(isVisible);
        sync();
    }

    /** Runs only while switched on, on screen and big enough to read. */
    private void sync() {
        boolean wanted = HypeMeter.enabled() && isAttachedToWindow() && getWindowVisibility() == VISIBLE;
        if (wanted != (getVisibility() == VISIBLE)) setVisibility(wanted ? VISIBLE : GONE);
        if (wanted && isShown()) start();
        else stop();
    }

    private void start() {
        if (ticking) return;
        ticking = true;
        removeCallbacks(tick);
        post(tick);
    }

    private void stop() {
        ticking = false;
        removeCallbacks(tick);
    }

    private void tick() {
        if (!ticking) return;
        long now = System.currentTimeMillis();
        int[] latest = HypeMeter.SERIES.snapshot(now);
        boolean changed = !java.util.Arrays.equals(latest, series);
        series = latest;
        int ratio = HypeSeries.spikeRatio(series);
        if (ratio > 0 && now >= cooledAt) {
            pillRatio = ratio;
            pillUntil = now + PILL_MS;
            cooledAt = now + SPIKE_COOLDOWN_MS;
            changed = true;
        }
        if (pillUntil != 0 && now >= pillUntil) {
            pillUntil = 0;
            changed = true;
        }
        if (changed) invalidate();
        postDelayed(tick, pillUntil != 0 ? TICK_MS : Math.min(TICK_MS * 2, BUCKET_MS - now % BUCKET_MS + 50));
    }

    @Override
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        fill.setShader(new LinearGradient(0, 0, 0, h, 0x663EE08F, 0x003EE08F, Shader.TileMode.CLAMP));
    }

    @Override
    protected void onDraw(Canvas canvas) {
        int width = getWidth(), height = getHeight();
        if (width == 0 || height == 0) return;
        float inset = 3 * density, chartTop = 18 * density;
        float chartHeight = height - chartTop - inset;
        canvas.drawLine(0, height - inset, width, height - inset, ghost);
        int max = 4;
        for (int value : series) max = Math.max(max, value);
        curve.rewind();
        under.rewind();
        float step = (width - 2 * inset) / (HypeSeries.POINTS - 1);
        float x = inset, lastX = x, lastY = height - inset;
        for (int i = 0; i < series.length; i++, x += step) {
            float y = height - inset - chartHeight * series[i] / max;
            if (i == 0) {
                curve.moveTo(x, y);
                under.moveTo(x, height - inset);
                under.lineTo(x, y);
            } else {
                curve.lineTo(x, y);
                under.lineTo(x, y);
            }
            lastX = x;
            lastY = y;
        }
        under.lineTo(lastX, height - inset);
        under.close();
        canvas.drawPath(under, fill);
        canvas.drawPath(curve, line);
        canvas.drawCircle(lastX, lastY, 2 * density, dot);
        if (pillUntil != 0) drawPill(canvas, width);
    }

    private void drawPill(Canvas canvas, int width) {
        String text = label("盛り上がり ×" + pillRatio, "Hype ×" + pillRatio);
        float textWidth = pillText.measureText(text);
        float padX = 7 * density, height = 16 * density;
        float left = Math.max(0, (width - textWidth - 2 * padX) / 2);
        rect.set(left, 0, left + textWidth + 2 * padX, height);
        canvas.drawRoundRect(rect, height / 2, height / 2, pillFace);
        canvas.drawText(text, left + padX, height - 4.5f * density, pillText);
    }
}
