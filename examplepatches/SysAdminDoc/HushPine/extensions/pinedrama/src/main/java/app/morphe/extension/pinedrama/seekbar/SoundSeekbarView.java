/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.pinedrama.seekbar;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Shader;
import android.os.Build;
import android.os.Bundle;
import android.os.SystemClock;
import android.util.TypedValue;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.SeekBar;

import androidx.annotation.Nullable;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.pinedrama.settings.L10n;

/**
 * The line {@link SoundSeekbar} puts along the bottom of a sound's cover.
 *
 * <p>It asks the preview player every {@link #TICK_MS} while it's in a window, and shows only while
 * the preview plays with a length the player knows: a soft shade, the time played and the
 * preview's length, and a thin line with the part played filled in. A tap on it seeks there, and a
 * sideways drag seeks where it lets go. A drag up or down is handed back to the page around the
 * cover, and a touch while the line is hidden never reaches it.
 *
 * <p>A seek that should have moved the preview by more than {@link #CHECKED_JUMP_MS} is checked
 * {@link #CHECK_AFTER_MS} later. When the preview is nearer where it would have been without the
 * seek, its stream can't be moved, and the line stays hidden for that sound.
 */
final class SoundSeekbarView extends View {
    private static final int SHADE = 0x99000000;
    private static final int TRACK = 0x59FFFFFF;
    private static final int FILL = 0xF2FFFFFF;
    private static final int TEXT = 0xFFFFFFFF;

    static final float STRIP_DP = 28f;
    private static final float INSET_DP = 8f;
    private static final float LINE_FROM_BOTTOM_DP = 6f;
    private static final float LINE_DP = 2f;
    private static final float DRAG_LINE_DP = 3f;
    private static final float HANDLE_DP = 5f;
    private static final float LABEL_GAP_DP = 4f;
    private static final float TEXT_SP = 10f;

    /** How often the player is asked. */
    static final long TICK_MS = 250L;
    /** How far an accessibility scroll moves the preview. */
    static final long STEP_MS = 5_000L;
    /** After a seek the line keeps the new spot until the player reports near it, or this long. */
    static final long HOLD_MS = 1_000L;
    /** A position this close to the spot a seek asked for is the seek having landed. */
    static final long NEAR_MS = 1_500L;
    /** A seek moving the preview further than this is checked, to find a stream that can't seek. */
    static final long CHECKED_JUMP_MS = 3_000L;
    /** How long after a checked seek the check is made. */
    static final long CHECK_AFTER_MS = 1_500L;

    private final SoundSeekbar.Cover cover;
    private final Paint shade = new Paint();
    private final Paint track = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint played = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint handle = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint text = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final int slop;
    private final Runnable tick = this::tick;
    private boolean ticking;

    /** The sound the line shows, as the model names it. */
    @Nullable private String sound;
    private boolean unseekable;
    private long positionMs;
    private long totalMs;
    private long heldMs = -1L;
    private long heldUntil;
    private long checkFromMs = -1L;
    private long checkToMs;
    private long checkAt;

    private boolean tracking;
    private boolean dragging;
    private float downX;
    private float downY;
    private float dragFraction;
    /** The sound playing when the touch began, the only one its seek may move. */
    @Nullable private String touchSound;

    SoundSeekbarView(Context context, SoundSeekbar.Cover cover) {
        super(context);
        this.cover = cover;
        slop = ViewConfiguration.get(context).getScaledTouchSlop();
        for (Paint paint : new Paint[]{track, played}) {
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeCap(Paint.Cap.ROUND);
        }
        track.setColor(TRACK);
        played.setColor(FILL);
        handle.setColor(FILL);
        text.setColor(TEXT);
        text.setTextSize(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_SP, TEXT_SP,
                getResources().getDisplayMetrics()));
        setContentDescription(L10n.t("Sound position"));
        setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_YES);
        setVisibility(GONE);
    }

    int stripHeight() {
        return Math.round(dp(STRIP_DP));
    }

    @Nullable
    String sound() {
        return sound;
    }

    long positionMs() {
        return positionMs;
    }

    long totalMs() {
        return totalMs;
    }

    long shownMs() {
        return heldMs >= 0L ? heldMs : positionMs;
    }

    boolean isUnseekable() {
        return unseekable;
    }

    boolean isTicking() {
        return ticking;
    }

    boolean isDragging() {
        return dragging;
    }

    /**
     * The cover sizes itself to its picture: a line the full width it is offered would widen it.
     * Unless the cover hands it an exact width, the line takes the widest of the cover's other
     * views, which the cover has measured just before it, since it's the cover's last view. A
     * cover with one full-width view doesn't measure it again, so 0 would leave it at nothing.
     */
    @Override
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int widthMode = MeasureSpec.getMode(widthMeasureSpec);
        int widthSize = MeasureSpec.getSize(widthMeasureSpec);
        int width = widthMode == MeasureSpec.EXACTLY ? widthSize
                : widthMode == MeasureSpec.AT_MOST ? Math.min(widthSize, siblingsWidth()) : siblingsWidth();
        int heightMode = MeasureSpec.getMode(heightMeasureSpec);
        int heightSize = MeasureSpec.getSize(heightMeasureSpec);
        int height = heightMode == MeasureSpec.EXACTLY ? heightSize
                : heightMode == MeasureSpec.AT_MOST ? Math.min(stripHeight(), heightSize) : stripHeight();
        setMeasuredDimension(width, height);
    }

    private int siblingsWidth() {
        ViewParent parent = getParent();
        if (!(parent instanceof ViewGroup)) return 0;
        ViewGroup group = (ViewGroup) parent;
        int widest = 0;
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (child == this || child.getVisibility() == GONE) continue;
            int width = child.getMeasuredWidth();
            ViewGroup.LayoutParams params = child.getLayoutParams();
            if (params instanceof ViewGroup.MarginLayoutParams) {
                ViewGroup.MarginLayoutParams margins = (ViewGroup.MarginLayoutParams) params;
                width += margins.leftMargin + margins.rightMargin;
            }
            widest = Math.max(widest, width);
        }
        return widest;
    }

    @Override
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        shade.setShader(new LinearGradient(0f, 0f, 0f, h, 0x00000000, SHADE, Shader.TileMode.CLAMP));
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        ticking = true;
        removeCallbacks(tick);
        post(tick);
    }

    @Override
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        // The page is gone or covered: nothing is asked of the player until it's back.
        ticking = false;
        removeCallbacks(tick);
        endGesture();
    }

    /** Out of the cover for good: no more ticks. */
    void stop() {
        ticking = false;
        removeCallbacks(tick);
        endGesture();
    }

    void tick() {
        removeCallbacks(tick);
        if (!ticking) return;
        if (!SoundSeekbar.isEnabled()) {
            leave();
            return;
        }
        try {
            refresh(SystemClock.uptimeMillis());
        } catch (RuntimeException failure) {
            HookStatus.threw(SoundSeekbar.FAMILY, "sound preview", failure);
            leave();
            return;
        }
        if (ticking) postDelayed(tick, TICK_MS);
    }

    /** Reads the preview player and shows or hides the line to match. */
    void refresh(long now) {
        Object model = cover.viewModel();
        String playing = model == null ? null : SoundSeekbar.previewSound(model);
        if (playing == null || !SoundSeekbar.previewPlaying(model)) {
            hideLine();
            return;
        }
        if (!playing.equals(sound)) startSound(playing);
        if (unseekable) {
            hideLine();
            return;
        }
        int duration = SoundSeekbar.previewDuration(model);
        if (duration <= 0) {
            hideLine();
            return;
        }
        int limit = SoundSeekbar.previewLimit(model);
        totalMs = limit > 0 ? Math.min(limit, duration) : duration;
        long position = Math.max(0L, Math.min(totalMs, SoundSeekbar.previewPosition(model)));
        if (checkFromMs >= 0L && now - checkAt >= CHECK_AFTER_MS) {
            long went = now - checkAt;
            long without = checkFromMs + went;
            long with = checkToMs + went;
            checkFromMs = -1L;
            if (Math.abs(position - without) < Math.abs(position - with)) {
                unseekable = true;
                String which = sound;
                Logger.printDebug(() -> "Sound seek bar: the preview of " + which + " didn't move, hiding the line");
                hideLine();
                return;
            }
        }
        if (heldMs >= 0L && (now >= heldUntil || Math.abs(position - heldMs) <= NEAR_MS)) heldMs = -1L;
        positionMs = position;
        if (getVisibility() != VISIBLE) setVisibility(VISIBLE);
        if (!dragging) invalidate();
    }

    private void startSound(String playing) {
        sound = playing;
        unseekable = false;
        heldMs = -1L;
        checkFromMs = -1L;
        positionMs = 0L;
        totalMs = 0L;
        endGesture();
    }

    private void hideLine() {
        endGesture();
        heldMs = -1L;
        if (getVisibility() != GONE) setVisibility(GONE);
    }

    private void leave() {
        stop();
        if (cover.line.get() == this) SoundSeekbar.detach(cover);
    }

    /** Seeks the preview to this many ms in and shows it there. False when the seek was refused. */
    boolean seekToMs(long ms, @Nullable String forSound, long now) {
        if (totalMs <= 0L || unseekable || forSound == null || !forSound.equals(sound)) return false;
        long target = SoundSeekbar.seekTarget(ms, totalMs);
        long from = shownMs();
        if (!SoundSeekbar.seek(cover, cover.viewModel(), forSound, target)) return false;
        heldMs = target;
        heldUntil = now + HOLD_MS;
        if (Math.abs(target - from) > CHECKED_JUMP_MS) {
            checkFromMs = from;
            checkToMs = target;
            checkAt = now;
        } else {
            checkFromMs = -1L;
        }
        invalidate();
        return true;
    }

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        switch (event.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                return down(event);
            case MotionEvent.ACTION_MOVE:
                move(event);
                return tracking;
            case MotionEvent.ACTION_UP:
                up(event);
                return true;
            case MotionEvent.ACTION_CANCEL:
                endGesture();
                return true;
            default:
                return tracking;
        }
    }

    private boolean down(MotionEvent event) {
        endGesture();
        if (getVisibility() != VISIBLE || totalMs <= 0L || sound == null || unseekable) return false;
        tracking = true;
        touchSound = sound;
        downX = event.getX();
        downY = event.getY();
        dragFraction = fractionAt(event.getX());
        ViewParent parent = getParent();
        if (parent != null) parent.requestDisallowInterceptTouchEvent(true);
        return true;
    }

    private void move(MotionEvent event) {
        if (!tracking) return;
        if (dragging) {
            dragTo(event.getX());
            return;
        }
        float dx = Math.abs(event.getX() - downX);
        float dy = Math.abs(event.getY() - downY);
        if (dx > slop && dx > dy) {
            dragging = true;
            dragTo(event.getX());
        } else if (dy > slop) {
            // A scroll of the page, not a seek.
            endGesture();
        }
    }

    private void up(MotionEvent event) {
        if (!tracking) return;
        float fraction = dragging ? fractionAt(event.getX()) : dragFraction;
        String forSound = touchSound;
        endGesture();
        seekToMs(Math.round(totalMs * (double) fraction), forSound, SystemClock.uptimeMillis());
    }

    private void dragTo(float x) {
        dragFraction = fractionAt(x);
        invalidate();
    }

    private float fractionAt(float x) {
        float inset = dp(INSET_DP);
        float span = getWidth() - 2f * inset;
        return span <= 0f ? 0f : clamp((x - inset) / span);
    }

    private void endGesture() {
        boolean redraw = dragging;
        boolean held = tracking;
        tracking = false;
        dragging = false;
        touchSound = null;
        if (held) {
            ViewParent parent = getParent();
            if (parent != null) parent.requestDisallowInterceptTouchEvent(false);
        }
        if (redraw) invalidate();
    }

    @Override
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (totalMs <= 0L) return;
        float inset = dp(INSET_DP);
        float left = inset;
        float right = getWidth() - inset;
        if (right <= left) return;
        canvas.drawRect(0f, 0f, getWidth(), getHeight(), shade);

        float y = getHeight() - dp(LINE_FROM_BOTTOM_DP);
        float fraction = dragging ? dragFraction : clamp(shownMs() / (float) totalMs);
        float x = left + (right - left) * fraction;
        float width = dp(dragging ? DRAG_LINE_DP : LINE_DP);
        track.setStrokeWidth(width);
        played.setStrokeWidth(width);
        canvas.drawLine(left, y, right, y, track);
        if (x > left) canvas.drawLine(left, y, x, y, played);
        if (dragging) canvas.drawCircle(x, y, dp(HANDLE_DP), handle);

        String label = label(fraction);
        if (text.measureText(label) <= right - left) {
            canvas.drawText(label, left, y - dp(LABEL_GAP_DP) - text.descent(), text);
        }
    }

    /** "0:12 / 0:45": the time at this fraction of the preview and the preview's length. */
    String label(float fraction) {
        return SeekbarTime.readout(fraction * 100f, totalMs);
    }

    @Override
    public CharSequence getAccessibilityClassName() {
        return SeekBar.class.getName();
    }

    @Override
    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo info) {
        super.onInitializeAccessibilityNodeInfo(info);
        if (totalMs <= 0L) return;
        int total = seconds(totalMs);
        int now = Math.min(total, seconds(shownMs()));
        info.setRangeInfo(AccessibilityNodeInfo.RangeInfo.obtain(
                AccessibilityNodeInfo.RangeInfo.RANGE_TYPE_INT, 0, total, now));
        if (now > 0) info.addAction(AccessibilityNodeInfo.AccessibilityAction.ACTION_SCROLL_BACKWARD);
        if (now < total) info.addAction(AccessibilityNodeInfo.AccessibilityAction.ACTION_SCROLL_FORWARD);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            info.addAction(AccessibilityNodeInfo.AccessibilityAction.ACTION_SET_PROGRESS);
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            info.setStateDescription(L10n.f("%1$s of %2$s",
                    SeekbarTime.clock(now), SeekbarTime.clock(total)));
        }
    }

    @Override
    public boolean performAccessibilityAction(int action, @Nullable Bundle arguments) {
        if (totalMs > 0L && SoundSeekbar.isEnabled()) {
            long now = SystemClock.uptimeMillis();
            if (action == AccessibilityNodeInfo.ACTION_SCROLL_FORWARD) return seekToMs(shownMs() + STEP_MS, sound, now);
            if (action == AccessibilityNodeInfo.ACTION_SCROLL_BACKWARD) return seekToMs(shownMs() - STEP_MS, sound, now);
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N
                    && action == android.R.id.accessibilityActionSetProgress
                    && arguments != null
                    && arguments.containsKey(AccessibilityNodeInfo.ACTION_ARGUMENT_PROGRESS_VALUE)) {
                float seconds = arguments.getFloat(AccessibilityNodeInfo.ACTION_ARGUMENT_PROGRESS_VALUE);
                return seekToMs(Math.round(seconds * 1000.0), sound, now);
            }
        }
        return super.performAccessibilityAction(action, arguments);
    }

    private static int seconds(long ms) {
        return (int) Math.min(Integer.MAX_VALUE, Math.round(Math.max(0L, ms) / 1000.0));
    }

    private static float clamp(float fraction) {
        if (Float.isNaN(fraction)) return 0f;
        return Math.max(0f, Math.min(1f, fraction));
    }

    private float dp(float value) {
        return TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value, getResources().getDisplayMetrics());
    }
}
