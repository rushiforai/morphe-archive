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
    /** Where events go when they're not the lens's: the window, or a view's own dispatch. */
    interface Dispatch {
        boolean dispatch(MotionEvent event);
    }

    private final Window.Callback window;
    private final Dispatch original;
    private final LiquidGlassLens lens;
    private final int[] location = new int[2];
    private boolean tracking;
    private boolean dragging;
    private float downX;
    // Vertical travel of a gesture on the content, for minimizing the bar on scroll.
    private float lastRawX, lastRawY, scrollDx, scrollDy;

    private TouchRouter(Window.Callback window, LiquidGlassLens lens) {
        this.window = window;
        this.original = window::dispatchTouchEvent;
        this.lens = lens;
    }

    /**
     * A router for a view (the settings preview) rather than a window: the view calls
     * {@link #dispatchTouchEvent} from its own, with {@code original} its super method.
     */
    TouchRouter(Dispatch original, LiquidGlassLens lens) {
        this.window = null;
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
            return method.invoke(window, args);
        } catch (InvocationTargetException e) {
            throw e.getCause();
        }
    }

    boolean dispatchTouchEvent(MotionEvent event) {
        int action = event.getActionMasked();
        if (action == MotionEvent.ACTION_DOWN) {
            tracking = false;
            dragging = false;
            lens.claimedDown = false;
            lastRawX = event.getRawX();
            lastRawY = event.getRawY();
            scrollDx = scrollDy = 0f;
            // Instagram gets the down as usual; the lens only notes whether it was on the pill.
            boolean handled = original.dispatch(event);
            if (lens.claimedDown) {
                tracking = true;
                downX = localX(event);
                lens.beginPress(downX);
            }
            return handled;
        }
        if (!tracking) {
            if (action == MotionEvent.ACTION_MOVE) trackContentScroll(event);
            return original.dispatch(event);
        }

        float x = localX(event);
        switch (action) {
            case MotionEvent.ACTION_MOVE:
                if (!dragging && lens.shouldStartDrag(downX, x)) {
                    dragging = true;
                    // From here on the gesture is ours: Instagram must not see a tap or a swipe.
                    MotionEvent cancel = MotionEvent.obtain(event);
                    cancel.setAction(MotionEvent.ACTION_CANCEL);
                    original.dispatch(cancel);
                    cancel.recycle();
                }
                if (dragging) {
                    lens.dragTo(x);
                    return true;
                }
                // Held back: Instagram only needs the down and the up for its taps, double taps
                // and long presses. Seeing the finger start to move would let its swipe
                // navigation (left on the home feed opens Messages) measure a fling, which it
                // then finishes when the drag cancels it, opening another tab.
                return true;
            case MotionEvent.ACTION_UP:
                tracking = false;
                if (dragging) {
                    lens.endDrag(x);
                    return true;
                }
                lens.release();
                return original.dispatch(event);
            case MotionEvent.ACTION_CANCEL:
                tracking = false;
                lens.release();
                return dragging || original.dispatch(event);
            default:
                return dragging || original.dispatch(event);
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
