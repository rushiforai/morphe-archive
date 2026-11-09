package app.voidhack.extension.applemusic;

import android.content.Context;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.accessibility.AccessibilityManager;

final class GlassMiniTouch implements View.OnTouchListener {
    private final GlassSurfaceMotion motion;
    private final int slop;
    private View owner;
    private float downX;
    private float downY;
    private boolean dragging;
    private boolean cancelled;

    GlassMiniTouch(View content, GlassSurfaceMotion motion) {
        this.motion = motion;
        slop = ViewConfiguration.get(content.getContext()).getScaledTouchSlop();
    }

    void cancel() {
        if (owner == null) return;
        if (owner != null && owner.getParent() != null) owner.getParent().requestDisallowInterceptTouchEvent(false);
        owner = null;
        dragging = cancelled = false;
        motion.release();
    }

    @Override public boolean onTouch(View view, MotionEvent event) {
        AccessibilityManager accessibility = (AccessibilityManager) view.getContext().getSystemService(Context.ACCESSIBILITY_SERVICE);
        if (accessibility != null && accessibility.isTouchExplorationEnabled()) return false;
        switch (event.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                cancel();
                owner = view;
                downX = event.getRawX();
                downY = event.getRawY();
                motion.press(downX);
                return false;
            case MotionEvent.ACTION_MOVE:
                if (owner == null) return false;
                if (cancelled) return true;
                float dx = event.getRawX() - downX;
                float dy = event.getRawY() - downY;
                if (!dragging && Math.abs(dy) > slop && Math.abs(dy) > Math.abs(dx)) {
                    cancel();
                    return false;
                }
                if (!dragging && Math.abs(dx) > slop && Math.abs(dx) > Math.abs(dy)) {
                    dragging = true;
                    cancelNative(view, event);
                    view.getParent().requestDisallowInterceptTouchEvent(true);
                }
                motion.move(event.getRawX());
                return dragging;
            case MotionEvent.ACTION_POINTER_DOWN:
                if (owner == null) return false;
                cancelNative(view, event);
                cancelled = true;
                motion.release();
                return true;
            case MotionEvent.ACTION_UP:
            case MotionEvent.ACTION_CANCEL:
                boolean consumed = dragging || cancelled;
                cancel();
                return consumed;
            default:
                return dragging || cancelled;
        }
    }

    private static void cancelNative(View view, MotionEvent event) {
        MotionEvent cancel = MotionEvent.obtain(event);
        cancel.setAction(MotionEvent.ACTION_CANCEL);
        view.onTouchEvent(cancel);
        cancel.recycle();
    }
}
