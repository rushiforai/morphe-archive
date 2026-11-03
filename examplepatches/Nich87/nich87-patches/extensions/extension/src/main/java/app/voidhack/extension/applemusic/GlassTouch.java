package app.voidhack.extension.applemusic;

import android.content.Context;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.accessibility.AccessibilityManager;

final class GlassTouch implements View.OnTouchListener {
    private final GlassController controller;
    private final int slop;
    private final int[] location = new int[2];
    private View heldItem;
    private VelocityTracker tracker;
    private float downX;
    private float downY;
    private boolean dragging;
    private boolean cancelled;

    GlassTouch(GlassController controller) {
        this.controller = controller;
        slop = ViewConfiguration.get(controller.navigation.getContext()).getScaledTouchSlop();
    }

    boolean active() { return heldItem != null; }

    void cancel() {
        if (heldItem != null) {
            heldItem.setPressed(false);
            if (heldItem.getParent() != null) heldItem.getParent().requestDisallowInterceptTouchEvent(false);
        }
        heldItem = null;
        if (tracker != null) tracker.recycle();
        tracker = null;
        dragging = false;
        cancelled = false;
    }

    private float speed() {
        if (tracker == null) return 0f;
        tracker.computeCurrentVelocity(1000, 8000f * controller.material.density);
        return tracker.getXVelocity();
    }

    private View itemAt(float rawX) {
        View nearest = null;
        float distance = Float.MAX_VALUE;
        for (int i = 0; i < controller.menu.getChildCount(); i++) {
            View item = controller.menu.getChildAt(i);
            if (item.getVisibility() != View.VISIBLE || !item.isEnabled()) continue;
            item.getLocationOnScreen(location);
            float delta = Math.abs(rawX - location[0] - item.getWidth() / 2f);
            if (delta < distance) { distance = delta; nearest = item; }
        }
        return nearest;
    }

    @Override public boolean onTouch(View view, MotionEvent event) {
        AccessibilityManager accessibility = (AccessibilityManager)
                view.getContext().getSystemService(Context.ACCESSIBILITY_SERVICE);
        if (accessibility != null && accessibility.isTouchExplorationEnabled()) return false;
        switch (event.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                cancel();
                heldItem = view;
                tracker = VelocityTracker.obtain();
                tracker.addMovement(event);
                downX = event.getRawX();
                downY = event.getRawY();
                view.getParent().requestDisallowInterceptTouchEvent(true);
                controller.press(view);
                return true;
            case MotionEvent.ACTION_MOVE:
                if (heldItem == null) return true;
                tracker.addMovement(event);
                float dx = event.getRawX() - downX;
                float dy = event.getRawY() - downY;
                if (!dragging && Math.abs(dy) > slop && Math.abs(dy) > Math.abs(dx)) {
                    if (!cancelled) controller.release(0f);
                    cancelled = true;
                    view.setPressed(false);
                    view.getParent().requestDisallowInterceptTouchEvent(false);
                }
                if (cancelled) return true;
                if (!dragging && Math.abs(dx) > slop && Math.abs(dx) > Math.abs(dy)) {
                    dragging = true;
                    view.setPressed(false);
                }
                if (dragging) {
                    controller.navigation.getLocationOnScreen(location);
                    controller.drag(event.getRawX() - location[0], speed());
                }
                return true;
            case MotionEvent.ACTION_UP:
                if (heldItem == null) return true;
                tracker.addMovement(event);
                controller.navigation.getLocationOnScreen(location);
                boolean inside = event.getRawX() >= location[0] - slop
                        && event.getRawX() <= location[0] + controller.navigation.getWidth() + slop
                        && event.getRawY() >= location[1] - slop
                        && event.getRawY() <= location[1] + controller.navigation.getHeight() + slop;
                float releaseDx = event.getRawX() - downX;
                float releaseDy = event.getRawY() - downY;
                dragging |= Math.abs(releaseDx) > slop && Math.abs(releaseDx) > Math.abs(releaseDy);
                View destination = !cancelled && (dragging || inside)
                        ? (dragging ? itemAt(event.getRawX()) : heldItem) : null;
                float velocity = speed();
                cancel();
                if (destination != null) destination.performClick();
                controller.release(velocity);
                return true;
            case MotionEvent.ACTION_CANCEL:
            case MotionEvent.ACTION_POINTER_DOWN:
                cancel();
                controller.release(0f);
                return true;
            default:
                return heldItem != null;
        }
    }
}
