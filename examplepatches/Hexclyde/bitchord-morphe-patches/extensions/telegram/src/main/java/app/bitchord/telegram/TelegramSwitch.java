package app.bitchord.telegram;

import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.Checkable;

/**
 * A switch drawn the way BitChord's own settings and Sources screens draw theirs (Material 3 with
 * BitChord's colours): a 52×32dp pill, filled with the primary colour and a large dark thumb when
 * on, outlined with a small thumb when off.
 */
final class TelegramSwitch extends View implements Checkable {
    interface Listener {
        void changed(TelegramSwitch view, boolean checked);
    }

    private final TelegramStyle style;
    private final int uncheckedTrack;
    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RectF track = new RectF();
    private boolean checked;
    private float position; // 0 = off, 1 = on
    private ValueAnimator animator;
    private Listener listener;

    TelegramSwitch(Context context, TelegramStyle style) {
        super(context);
        this.style = style;
        // Material 3's surfaceContainerHighest, which BitChord's colour scheme leaves at its
        // default.
        uncheckedTrack = style.dark ? 0xff36343b : 0xffe6e0e9;
        setClickable(true);
        setFocusable(true);
        setOnClickListener(v -> toggle());
    }

    void setListener(Listener listener) {
        this.listener = listener;
    }

    @Override
    protected void onMeasure(int widthSpec, int heightSpec) {
        setMeasuredDimension(style.dp(52), style.dp(32));
    }

    @Override
    public boolean isChecked() {
        return checked;
    }

    @Override
    public void setChecked(boolean value) {
        set(value, false, false);
    }

    @Override
    public void toggle() {
        set(!checked, true, true);
    }

    private void set(boolean value, boolean animate, boolean notify) {
        if (value == checked && animator == null) {
            position = value ? 1 : 0;
            invalidate();
            return;
        }
        checked = value;
        if (animator != null) animator.cancel();
        if (animate && isAttachedToWindow()) {
            animator = ValueAnimator.ofFloat(position, value ? 1 : 0);
            animator.setDuration(150);
            animator.addUpdateListener(
                    a -> {
                        position = (float) a.getAnimatedValue();
                        invalidate();
                    });
            animator.start();
        } else {
            animator = null;
            position = value ? 1 : 0;
            invalidate();
        }
        sendAccessibilityEvent(AccessibilityEvent.TYPE_VIEW_CLICKED);
        if (notify && listener != null) listener.changed(this, value);
    }

    @Override
    protected void onDraw(Canvas canvas) {
        float w = getWidth(), h = getHeight(), radius = h / 2f, border = style.dp(2);
        track.set(0, 0, w, h);
        paint.setStyle(Paint.Style.FILL);
        paint.setColor(blend(uncheckedTrack, style.foreground, position));
        canvas.drawRoundRect(track, radius, radius, paint);
        if (position < 1) {
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(border);
            paint.setColor(blend(style.outline, style.foreground, position));
            track.inset(border / 2f, border / 2f);
            canvas.drawRoundRect(track, radius - border / 2f, radius - border / 2f, paint);
        }
        // Thumb: 16dp off, 24dp on, centred 16dp from its end of the track.
        float size = style.dp(16) + (style.dp(24) - style.dp(16)) * position;
        float x = radius + (w - 2 * radius) * position;
        paint.setStyle(Paint.Style.FILL);
        paint.setColor(blend(style.outline, style.background, position));
        canvas.drawCircle(x, h / 2f, size / 2f, paint);
    }

    @Override
    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo info) {
        super.onInitializeAccessibilityNodeInfo(info);
        info.setClassName("android.widget.Switch");
        info.setCheckable(true);
        info.setChecked(checked);
    }

    private static int blend(int from, int to, float t) {
        int a =
                (int)
                        (((from >>> 24) & 0xff)
                                + (((to >>> 24) & 0xff) - ((from >>> 24) & 0xff)) * t);
        int r = (int) (((from >> 16) & 0xff) + (((to >> 16) & 0xff) - ((from >> 16) & 0xff)) * t);
        int g = (int) (((from >> 8) & 0xff) + (((to >> 8) & 0xff) - ((from >> 8) & 0xff)) * t);
        int b = (int) ((from & 0xff) + ((to & 0xff) - (from & 0xff)) * t);
        return a << 24 | r << 16 | g << 8 | b;
    }
}
