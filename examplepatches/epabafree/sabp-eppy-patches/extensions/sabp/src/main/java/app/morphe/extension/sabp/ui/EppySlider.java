package app.morphe.extension.sabp.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;

import app.morphe.extension.sabp.EppyTheme;

/**
 * Material 3 Expressive style seek slider: a thick rounded track split by a tall bar thumb with a
 * gap on both sides. Optional static "waveform" look (off by default, no animation).
 * Supports touch, D-pad/arrow keys and TalkBack (range info + scroll actions).
 */
public class EppySlider extends View {
    public interface OnSeekListener {
        void onSeekPreview(long ms);

        void onSeek(long ms);
    }

    private final Paint active = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint inactive = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint thumb = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RectF r = new RectF();
    private long max = 1, value;
    private boolean dragging;
    private boolean waveform;
    private boolean enabled = true;
    private OnSeekListener listener;
    private float[] bars;

    public EppySlider(Context c) {
        super(c);
        setFocusable(true);
        setMinimumHeight(Ui.dp(c, 48));
        setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_YES);
    }

    public void apply(EppyTheme t, boolean waveform) {
        active.setColor(t.progressColor != 0 ? t.progressColor : t.primary);
        inactive.setColor(t.dark ? t.surfaceContainerHighest : t.secondaryContainer);
        thumb.setColor(t.progressColor != 0 ? t.progressColor : t.primary);
        this.waveform = waveform;
        invalidate();
    }

    public void setListener(OnSeekListener l) {
        listener = l;
    }

    public void setSeekEnabled(boolean e) {
        enabled = e;
        setAlpha(e ? 1f : 0.6f);
    }

    public void setProgress(long valueMs, long maxMs) {
        if (dragging) return;
        long newMax = Math.max(1, maxMs);
        if (newMax != max) bars = null;
        max = newMax;
        value = Math.max(0, Math.min(valueMs, max));
        invalidate();
    }

    public long getValue() {
        return value;
    }

    @Override
    protected void onMeasure(int w, int h) {
        setMeasuredDimension(getDefaultSize(getSuggestedMinimumWidth(), w), resolveSize(Ui.dp(getContext(), 48), h));
    }

    @Override
    protected void onDraw(Canvas canvas) {
        float pad = Ui.dp(getContext(), 4);
        float w = getWidth() - pad * 2;
        float cy = getHeight() / 2f;
        float frac = value / (float) max;
        float x = pad + w * frac;
        float gap = Ui.dp(getContext(), 6);
        if (waveform) {
            drawWaveform(canvas, pad, w, cy, x);
        } else {
            float th = Ui.dp(getContext(), 16);
            float rad = th / 2f;
            float inner = Ui.dp(getContext(), 2);
            // Active part: rounded on the outer end, small radius at the thumb gap.
            if (x - gap > pad) {
                r.set(pad, cy - th / 2, x - gap, cy + th / 2);
                canvas.drawRoundRect(r, Math.min(rad, (x - gap - pad) / 2f), Math.min(rad, (x - gap - pad) / 2f), active);
                if (x - gap - pad > rad * 2) {
                    r.set(x - gap - rad, cy - th / 2, x - gap, cy + th / 2);
                    canvas.drawRoundRect(r, inner, inner, active);
                }
            }
            if (x + gap < pad + w) {
                r.set(x + gap, cy - th / 2, pad + w, cy + th / 2);
                canvas.drawRoundRect(r, rad, rad, inactive);
                if (pad + w - x - gap > rad * 2) {
                    r.set(x + gap, cy - th / 2, x + gap + rad, cy + th / 2);
                    canvas.drawRoundRect(r, inner, inner, inactive);
                }
                // Stop indicator at the end of the track.
                float dot = Ui.dp(getContext(), 2);
                canvas.drawCircle(pad + w - rad, cy, dot, active);
            }
        }
        float tw = Ui.dp(getContext(), dragging ? 3 : 4);
        float tH = Ui.dp(getContext(), 44);
        r.set(x - tw / 2, cy - tH / 2, x + tw / 2, cy + tH / 2);
        canvas.drawRoundRect(r, tw / 2, tw / 2, thumb);
    }

    private void drawWaveform(Canvas canvas, float pad, float w, float cy, float x) {
        int count = Math.max(24, (int) (w / Ui.dp(getContext(), 6)));
        if (bars == null || bars.length != count) {
            bars = new float[count];
            // Deterministic pseudo-random heights seeded by length so it does not jump around.
            long seed = max * 31 + 7;
            for (int i = 0; i < count; i++) {
                seed = (seed * 6364136223846793005L + 1442695040888963407L);
                float rnd = ((seed >>> 33) % 1000) / 1000f;
                float env = (float) (0.55 + 0.45 * Math.sin(i * 0.37) * Math.sin(i * 0.11 + 1));
                bars[i] = 0.25f + 0.75f * Math.abs(rnd * env);
            }
        }
        float step = w / count;
        float bw = Math.max(2f, step * 0.45f);
        float maxH = Ui.dp(getContext(), 36);
        for (int i = 0; i < count; i++) {
            float bx = pad + i * step + step / 2f;
            float bh = Math.max(Ui.dp(getContext(), 4), bars[i] * maxH);
            r.set(bx - bw / 2, cy - bh / 2, bx + bw / 2, cy + bh / 2);
            canvas.drawRoundRect(r, bw / 2, bw / 2, bx <= x ? active : inactive);
        }
    }

    @Override
    public boolean onTouchEvent(MotionEvent e) {
        if (!enabled) return false;
        float pad = Ui.dp(getContext(), 4);
        float frac = (e.getX() - pad) / (getWidth() - pad * 2);
        long v = (long) (Math.max(0f, Math.min(1f, frac)) * max);
        switch (e.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                dragging = true;
                getParent().requestDisallowInterceptTouchEvent(true);
                value = v;
                if (listener != null) listener.onSeekPreview(value);
                invalidate();
                return true;
            case MotionEvent.ACTION_MOVE:
                value = v;
                if (listener != null) listener.onSeekPreview(value);
                invalidate();
                return true;
            case MotionEvent.ACTION_UP:
                value = v;
                dragging = false;
                if (listener != null) listener.onSeek(value);
                invalidate();
                return true;
            case MotionEvent.ACTION_CANCEL:
                dragging = false;
                invalidate();
                return true;
            default:
                return super.onTouchEvent(e);
        }
    }

    private void step(int direction) {
        long stepMs = 10_000;
        value = Math.max(0, Math.min(max, value + direction * stepMs));
        if (listener != null) listener.onSeek(value);
        invalidate();
        sendAccessibilityEvent(AccessibilityEvent.TYPE_VIEW_SELECTED);
    }

    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (enabled && keyCode == KeyEvent.KEYCODE_DPAD_LEFT) {
            step(-1);
            return true;
        }
        if (enabled && keyCode == KeyEvent.KEYCODE_DPAD_RIGHT) {
            step(1);
            return true;
        }
        return super.onKeyDown(keyCode, event);
    }

    @Override
    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo info) {
        super.onInitializeAccessibilityNodeInfo(info);
        info.setClassName("android.widget.SeekBar");
        info.setRangeInfo(AccessibilityNodeInfo.RangeInfo.obtain(
                AccessibilityNodeInfo.RangeInfo.RANGE_TYPE_INT, 0, max / 1000f, value / 1000f));
        info.setStateDescription(Ui.time(value) + " of " + Ui.time(max));
        if (enabled) {
            info.addAction(AccessibilityNodeInfo.AccessibilityAction.ACTION_SCROLL_FORWARD);
            info.addAction(AccessibilityNodeInfo.AccessibilityAction.ACTION_SCROLL_BACKWARD);
        }
    }

    @Override
    public boolean performAccessibilityAction(int action, Bundle args) {
        if (action == AccessibilityNodeInfo.ACTION_SCROLL_FORWARD) {
            step(1);
            return true;
        }
        if (action == AccessibilityNodeInfo.ACTION_SCROLL_BACKWARD) {
            step(-1);
            return true;
        }
        return super.performAccessibilityAction(action, args);
    }
}
