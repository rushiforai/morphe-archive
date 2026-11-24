package app.voidhack.extension.applemusic.sing;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.SeekBar;

import java.util.function.IntConsumer;

final class SingMixSlider extends View {
    private static final int MIN_MIX = -100;
    private static final int MAX_MIX = 100;
    private static final int MIX_STEP = 10;
    private static final int NO_POINTER = -1;

    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Path clip = new Path();
    private final RectF track = new RectF();
    private final int trackColor;
    private final int fillColor;
    private final int centerColor;
    private final float density;

    private IntConsumer listener;
    private int mix;
    private int pointer = NO_POINTER;

    SingMixSlider(Context context, int trackColor, int fillColor, int centerColor) {
        super(context);
        this.trackColor = trackColor;
        this.fillColor = fillColor;
        this.centerColor = centerColor;
        density = context.getResources().getDisplayMetrics().density;
        setMinimumWidth(Math.round(48 * density));
        setMinimumHeight(Math.round(48 * density));
        setFocusable(true);
        setClickable(true);
        setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_YES);
    }

    void setOnMixChanged(IntConsumer listener) {
        this.listener = listener;
    }

    void setMix(int mix) {
        updateMix(mix);
    }

    @Override
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        track.set(getPaddingLeft(), getPaddingTop(),
                getWidth() - getPaddingRight(), getHeight() - getPaddingBottom());
        if (track.isEmpty()) return;

        float radius = Math.min(24 * density, Math.min(track.width(), track.height()) / 2);
        setPaintColor(trackColor);
        canvas.drawRoundRect(track, radius, radius, paint);

        if (mix > MIN_MIX) {
            clip.rewind();
            clip.addRoundRect(track, radius, radius, Path.Direction.CW);
            int state = canvas.save();
            canvas.clipPath(clip);
            float fraction = (mix - MIN_MIX) / (float) (MAX_MIX - MIN_MIX);
            setPaintColor(fillColor);
            canvas.drawRect(track.left, track.bottom - fraction * track.height(),
                    track.right, track.bottom, paint);
            canvas.restoreToCount(state);
        }

        float mark = Math.min(6 * density, track.width() / 4);
        float thickness = density / 2;
        setPaintColor(centerColor);
        canvas.drawRoundRect(track.centerX() - mark, track.centerY() - thickness,
                track.centerX() + mark, track.centerY() + thickness, thickness, thickness, paint);
    }

    private void setPaintColor(int color) {
        paint.setColor(color);
        if (!isEnabled()) paint.setAlpha(paint.getAlpha() / 2);
    }

    @Override
    protected void drawableStateChanged() {
        super.drawableStateChanged();
        invalidate();
    }

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        if (!isEnabled()) {
            stopTracking();
            return false;
        }
        switch (event.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                pointer = event.getPointerId(0);
                setPressed(true);
                disallowParentIntercept(true);
                setMixFromTouch(event.getY());
                return true;
            case MotionEvent.ACTION_MOVE:
                updatePointerPosition(event);
                return pointer != NO_POINTER;
            case MotionEvent.ACTION_POINTER_UP:
                int lifted = event.getActionIndex();
                if (pointer == event.getPointerId(lifted)) {
                    pointer = event.getPointerId(lifted == 0 ? 1 : 0);
                }
                return pointer != NO_POINTER;
            case MotionEvent.ACTION_UP:
                if (pointer == NO_POINTER) return false;
                updatePointerPosition(event);
                stopTracking();
                performClick();
                return true;
            case MotionEvent.ACTION_CANCEL:
                stopTracking();
                return true;
            default:
                return pointer != NO_POINTER;
        }
    }

    private void updatePointerPosition(MotionEvent event) {
        int index = event.findPointerIndex(pointer);
        if (index >= 0) setMixFromTouch(event.getY(index));
    }

    private void stopTracking() {
        if (pointer == NO_POINTER) return;
        pointer = NO_POINTER;
        setPressed(false);
        disallowParentIntercept(false);
    }

    private void disallowParentIntercept(boolean disallow) {
        ViewParent parent = getParent();
        if (parent != null) parent.requestDisallowInterceptTouchEvent(disallow);
    }

    private void setMixFromTouch(float y) {
        int bottom = getHeight() - getPaddingBottom();
        int height = bottom - getPaddingTop();
        if (height > 0) {
            float fraction = (bottom - y) / height;
            int value = Math.round(MIN_MIX + (MAX_MIX - MIN_MIX) * fraction);
            changeMix(Math.abs(value) < 4 ? 0 : value);
        }
    }

    @Override
    public boolean performClick() {
        super.performClick();
        return true;
    }

    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (isEnabled()) {
            if (keyCode == KeyEvent.KEYCODE_DPAD_UP && changeMix(mix + MIX_STEP)) return true;
            if (keyCode == KeyEvent.KEYCODE_DPAD_DOWN && changeMix(mix - MIX_STEP)) return true;
        }
        return super.onKeyDown(keyCode, event);
    }

    @Override
    public CharSequence getAccessibilityClassName() {
        return SeekBar.class.getName();
    }

    @Override
    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo info) {
        super.onInitializeAccessibilityNodeInfo(info);
        info.setClickable(false);
        info.removeAction(AccessibilityNodeInfo.AccessibilityAction.ACTION_CLICK);
        info.setRangeInfo(AccessibilityNodeInfo.RangeInfo.obtain(
                AccessibilityNodeInfo.RangeInfo.RANGE_TYPE_INT, MIN_MIX, MAX_MIX, mix));
        if (!isEnabled()) return;
        info.addAction(AccessibilityNodeInfo.AccessibilityAction.ACTION_SET_PROGRESS);
        if (mix < MAX_MIX) info.addAction(AccessibilityNodeInfo.AccessibilityAction.ACTION_SCROLL_FORWARD);
        if (mix > MIN_MIX) info.addAction(AccessibilityNodeInfo.AccessibilityAction.ACTION_SCROLL_BACKWARD);
    }

    @Override
    public boolean performAccessibilityAction(int action, Bundle args) {
        if (isEnabled()) {
            if (action == AccessibilityNodeInfo.ACTION_SCROLL_FORWARD) return changeMix(mix + MIX_STEP);
            if (action == AccessibilityNodeInfo.ACTION_SCROLL_BACKWARD) return changeMix(mix - MIX_STEP);
            if (action == AccessibilityNodeInfo.AccessibilityAction.ACTION_SET_PROGRESS.getId()
                    && args != null && args.containsKey(AccessibilityNodeInfo.ACTION_ARGUMENT_PROGRESS_VALUE)) {
                float requested = args.getFloat(AccessibilityNodeInfo.ACTION_ARGUMENT_PROGRESS_VALUE);
                return Float.isFinite(requested) && changeMix(Math.round(requested));
            }
        }
        return super.performAccessibilityAction(action, args);
    }

    private boolean changeMix(int value) {
        if (!updateMix(value)) return false;
        if (listener != null) listener.accept(mix);
        return true;
    }

    private boolean updateMix(int value) {
        int bounded = Math.min(MAX_MIX, Math.max(MIN_MIX, value));
        if (bounded == mix) return false;
        mix = bounded;
        invalidate();
        return true;
    }
}
