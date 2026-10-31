package app.southstar21.extension.instagram.liquidglass;

import android.view.MotionEvent;
import android.view.Window;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

/**
 * Instagram's swipe navigation (feed / camera / DMs) intercepts horizontal drags at the
 * activity level and ignores requestDisallowInterceptTouchEvent, so a drag on the tab bar
 * would page the whole app instead of gliding the lens.
 * <p>
 * Everything goes through Instagram normally, so taps, double taps and long presses on the
 * tabs behave exactly as before, and anything covering the bar (bottom sheets) keeps working.
 * Only when a gesture that started on the pill turns into a horizontal drag does this cancel
 * Instagram's half of it and hand the rest to the lens.
 */
final class TouchRouter implements InvocationHandler {
    private final Window.Callback original;
    private final LiquidGlassLens lens;
    private final int[] location = new int[2];
    private boolean tracking;
    private boolean dragging;
    private float downX;
    // Vertical travel of a gesture on the content, for minimizing the bar on scroll.
    private float lastRawX, lastRawY, scrollDx, scrollDy;

    private TouchRouter(Window.Callback original, LiquidGlassLens lens) {
        this.original = original;
        this.lens = lens;
    }

    static void install(Window window, LiquidGlassLens lens) {
        Window.Callback original = window.getCallback();
        if (original == null || Proxy.isProxyClass(original.getClass())) return;
        window.setCallback((Window.Callback) Proxy.newProxyInstance(
                Window.Callback.class.getClassLoader(),
                new Class<?>[]{Window.Callback.class},
                new TouchRouter(original, lens)));
    }

    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        if ("dispatchTouchEvent".equals(method.getName()) && args != null && args.length == 1) {
            return dispatchTouchEvent((MotionEvent) args[0]);
        }
        try {
            return method.invoke(original, args);
        } catch (InvocationTargetException e) {
            throw e.getCause();
        }
    }

    private boolean dispatchTouchEvent(MotionEvent event) {
        int action = event.getActionMasked();
        if (action == MotionEvent.ACTION_DOWN) {
            tracking = false;
            dragging = false;
            lens.claimedDown = false;
            lastRawX = event.getRawX();
            lastRawY = event.getRawY();
            scrollDx = scrollDy = 0f;
            // Instagram gets the down as usual; the lens only notes whether it was on the pill.
            boolean handled = original.dispatchTouchEvent(event);
            if (lens.claimedDown) {
                tracking = true;
                downX = localX(event);
                lens.beginPress(downX);
            }
            return handled;
        }
        if (!tracking) {
            if (action == MotionEvent.ACTION_MOVE) trackContentScroll(event);
            return original.dispatchTouchEvent(event);
        }

        float x = localX(event);
        switch (action) {
            case MotionEvent.ACTION_MOVE:
                if (!dragging && lens.shouldStartDrag(downX, x)) {
                    dragging = true;
                    // From here on the gesture is ours: Instagram must not see a tap or a swipe.
                    MotionEvent cancel = MotionEvent.obtain(event);
                    cancel.setAction(MotionEvent.ACTION_CANCEL);
                    original.dispatchTouchEvent(cancel);
                    cancel.recycle();
                }
                if (dragging) {
                    lens.dragTo(x);
                    return true;
                }
                return original.dispatchTouchEvent(event);
            case MotionEvent.ACTION_UP:
                tracking = false;
                if (dragging) {
                    lens.endDrag(x);
                    return true;
                }
                lens.release();
                return original.dispatchTouchEvent(event);
            case MotionEvent.ACTION_CANCEL:
                tracking = false;
                lens.release();
                return dragging || original.dispatchTouchEvent(event);
            default:
                return dragging || original.dispatchTouchEvent(event);
        }
    }

    private void trackContentScroll(MotionEvent event) {
        scrollDx += event.getRawX() - lastRawX;
        scrollDy += event.getRawY() - lastRawY;
        lastRawX = event.getRawX();
        lastRawY = event.getRawY();
        float threshold = 24 * lens.getResources().getDisplayMetrics().density;
        if (Math.abs(scrollDy) > threshold && Math.abs(scrollDy) > Math.abs(scrollDx) * 1.5f) {
            // Finger moving up scrolls the content down.
            lens.onContentScroll(scrollDy);
            scrollDx = scrollDy = 0f;
        } else if (Math.abs(scrollDx) > threshold) {
            scrollDx = scrollDy = 0f;
        }
    }

    private float localX(MotionEvent event) {
        lens.getLocationOnScreen(location);
        return event.getRawX() - location[0];
    }
}
