package app.userinsights.extension;

import android.app.Activity;
import android.os.SystemClock;
import android.view.ActionMode;
import android.view.Choreographer;
import android.view.KeyEvent;
import android.view.KeyboardShortcutGroup;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.SearchEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.Window;
import android.view.WindowManager;
import android.view.accessibility.AccessibilityEvent;
import android.widget.OverScroller;

import java.util.List;

/**
 * Moves the pills together with the content while scrolling, so they never disappear or lag behind.
 *
 * It watches the touches of the Reddit window (without changing them): while dragging, the pills
 * follow the finger; after a fling, they follow the same deceleration curve that Compose lists use.
 * When scrolling stops, a screen scan puts every pill exactly in place.
 */
final class ScrollTracker implements Window.Callback {
    private static boolean tracking;
    private static long trackingEndedAt;

    private final Activity activity;
    /** Root view of the watched window, where its pills are drawn. */
    private final android.view.ViewGroup host;
    private final Window.Callback wrapped;
    private final int touchSlop;
    private final int minFlingVelocity;
    private final int maxFlingVelocity;
    private final OverScroller scroller;

    private VelocityTracker velocityTracker;
    private float downX;
    private float downY;
    private float lastY;
    private boolean dragging;
    private boolean ignoreGesture;
    private boolean flinging;
    private int lastFlingY;
    private long flingStartedAt;
    private long lastMidScanAt;

    private ScrollTracker(Activity activity, android.view.ViewGroup host, Window.Callback wrapped) {
        this.activity = activity;
        this.host = host;
        this.wrapped = wrapped;
        ViewConfiguration configuration = ViewConfiguration.get(activity);
        touchSlop = configuration.getScaledTouchSlop();
        minFlingVelocity = configuration.getScaledMinimumFlingVelocity();
        maxFlingVelocity = configuration.getScaledMaximumFlingVelocity();
        scroller = new OverScroller(activity);
    }

    /** Watches the touches of the activity's own window. */
    static void install(Activity activity) {
        Window window = activity.getWindow();
        if (window != null && window.getDecorView() instanceof android.view.ViewGroup) {
            install(activity, window, (android.view.ViewGroup) window.getDecorView());
        }
    }

    /** Watches the touches of a window of the activity (its own, or a dialog or sheet above it). */
    static void install(Activity activity, Window window, android.view.ViewGroup host) {
        try {
            if (window == null || host == null) {
                return;
            }
            Window.Callback callback = window.getCallback();
            if (callback == null || callback instanceof ScrollTracker) {
                return;
            }
            window.setCallback(new ScrollTracker(activity, host, callback));
        } catch (Throwable t) {
            android.util.Log.w(UserInsights.TAG, "Could not install scroll tracker", t);
        }
    }

    private static long lastContentScrollAt;
    private static boolean contentScrolledThisGesture;

    /** True while the user drags or a fling runs, and briefly after. */
    static boolean isTracking() {
        return tracking || SystemClock.uptimeMillis() - trackingEndedAt < 120;
    }

    /** True only while the user drags or a fling runs. */
    static boolean isGestureActive() {
        return tracking;
    }

    /** Called when Reddit reports that its content scrolled. */
    static void onContentScrolled() {
        lastContentScrollAt = SystemClock.uptimeMillis();
        contentScrolledThisGesture = true;
    }

    private void observe(MotionEvent event) {
        switch (event.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                stopFling();
                downX = event.getX();
                downY = event.getY();
                lastY = downY;
                dragging = false;
                // Touches on our own views (pills, the hidden-activity panel) are not Reddit scrolling.
                ignoreGesture = OverlayManager.isOnOverlay(host, downX, downY);
                if (velocityTracker != null) {
                    velocityTracker.clear();
                } else {
                    velocityTracker = VelocityTracker.obtain();
                }
                velocityTracker.addMovement(event);
                break;

            case MotionEvent.ACTION_POINTER_DOWN:
                // Pinch or two-finger gestures: let the scan after the gesture place the pills.
                if (dragging) {
                    OverlayManager.hideTemporarily(host);
                }
                ignoreGesture = true;
                break;

            case MotionEvent.ACTION_MOVE:
                if (ignoreGesture || velocityTracker == null) {
                    break;
                }
                velocityTracker.addMovement(event);
                float y = event.getY();
                if (!dragging) {
                    float dy = y - downY;
                    float dx = event.getX() - downX;
                    if (Math.abs(dx) > touchSlop && Math.abs(dx) > Math.abs(dy)) {
                        // Sideways swipe (such as to the next post): hide until it settles.
                        ignoreGesture = true;
                        OverlayManager.hideTemporarily(host);
                        InsightsAccessibilityService.requestScan(250);
                        break;
                    }
                    if (Math.abs(dy) <= touchSlop) {
                        break;
                    }
                    dragging = true;
                    tracking = true;
                    contentScrolledThisGesture = false;
                    // Compose starts scrolling after the slop, by the distance beyond it.
                    lastY = downY + Math.signum(dy) * touchSlop;
                }
                OverlayManager.shiftRows(host, y - lastY);
                lastY = y;
                maybeScanWhileMoving();
                break;

            case MotionEvent.ACTION_UP:
                if (dragging && !ignoreGesture && velocityTracker != null) {
                    velocityTracker.addMovement(event);
                    velocityTracker.computeCurrentVelocity(1000, maxFlingVelocity);
                    float velocity = velocityTracker.getYVelocity();
                    if (Math.abs(velocity) >= minFlingVelocity) {
                        startFling((int) velocity);
                        break;
                    }
                }
                endGesture();
                break;

            case MotionEvent.ACTION_CANCEL:
                endGesture();
                break;

            default:
                break;
        }
    }

    private void maybeScanWhileMoving() {
        // Adds pills for comments that scroll into view, if scans are cheap enough not to stutter.
        long now = SystemClock.uptimeMillis();
        if (now - lastMidScanAt > 280 && InsightsAccessibilityService.isScanCheap()) {
            lastMidScanAt = now;
            InsightsAccessibilityService.requestScan(0);
        }
    }

    private void startFling(int velocity) {
        flinging = true;
        tracking = true;
        lastFlingY = 0;
        flingStartedAt = SystemClock.uptimeMillis();
        scroller.fling(0, 0, 0, velocity, 0, 0, -1_000_000, 1_000_000);
        Choreographer.getInstance().postFrameCallback(flingFrame);
    }

    private final Choreographer.FrameCallback flingFrame = new Choreographer.FrameCallback() {
        @Override
        public void doFrame(long frameTimeNanos) {
            if (!flinging) {
                return;
            }
            long now = SystemClock.uptimeMillis();
            // The list reached its end and stopped early (only judged if Reddit reports scrolling at all).
            boolean contentStopped = contentScrolledThisGesture
                    && now - flingStartedAt > 200 && now - lastContentScrollAt > 220;
            if (activity.isFinishing() || contentStopped || !scroller.computeScrollOffset()) {
                flinging = false;
                scroller.forceFinished(true);
                endGesture();
                return;
            }
            int y = scroller.getCurrY();
            OverlayManager.shiftRows(host, y - lastFlingY);
            lastFlingY = y;
            maybeScanWhileMoving();
            Choreographer.getInstance().postFrameCallback(this);
        }
    };

    private void stopFling() {
        if (flinging) {
            flinging = false;
            scroller.forceFinished(true);
            Choreographer.getInstance().removeFrameCallback(flingFrame);
        }
    }

    private void endGesture() {
        boolean wasTracking = dragging || flinging || tracking;
        dragging = false;
        tracking = false;
        trackingEndedAt = SystemClock.uptimeMillis();
        if (wasTracking) {
            // Put every pill exactly in place (small corrections are animated).
            InsightsAccessibilityService.requestScan(0);
        }
    }

    // Window.Callback: everything goes to Reddit's own callback unchanged.

    @Override
    public boolean dispatchTouchEvent(MotionEvent event) {
        try {
            observe(event);
        } catch (Throwable ignored) {
            // Never break Reddit's touch handling.
        }
        return wrapped.dispatchTouchEvent(event);
    }

    @Override
    public boolean dispatchKeyEvent(KeyEvent event) {
        return wrapped.dispatchKeyEvent(event);
    }

    @Override
    public boolean dispatchKeyShortcutEvent(KeyEvent event) {
        return wrapped.dispatchKeyShortcutEvent(event);
    }

    @Override
    public boolean dispatchTrackballEvent(MotionEvent event) {
        return wrapped.dispatchTrackballEvent(event);
    }

    @Override
    public boolean dispatchGenericMotionEvent(MotionEvent event) {
        return wrapped.dispatchGenericMotionEvent(event);
    }

    @Override
    public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent event) {
        return wrapped.dispatchPopulateAccessibilityEvent(event);
    }

    @Override
    public View onCreatePanelView(int featureId) {
        return wrapped.onCreatePanelView(featureId);
    }

    @Override
    public boolean onCreatePanelMenu(int featureId, Menu menu) {
        return wrapped.onCreatePanelMenu(featureId, menu);
    }

    @Override
    public boolean onPreparePanel(int featureId, View view, Menu menu) {
        return wrapped.onPreparePanel(featureId, view, menu);
    }

    @Override
    public boolean onMenuOpened(int featureId, Menu menu) {
        return wrapped.onMenuOpened(featureId, menu);
    }

    @Override
    public boolean onMenuItemSelected(int featureId, MenuItem item) {
        return wrapped.onMenuItemSelected(featureId, item);
    }

    @Override
    public void onWindowAttributesChanged(WindowManager.LayoutParams attrs) {
        wrapped.onWindowAttributesChanged(attrs);
    }

    @Override
    public void onContentChanged() {
        wrapped.onContentChanged();
    }

    @Override
    public void onWindowFocusChanged(boolean hasFocus) {
        wrapped.onWindowFocusChanged(hasFocus);
    }

    @Override
    public void onAttachedToWindow() {
        wrapped.onAttachedToWindow();
    }

    @Override
    public void onDetachedFromWindow() {
        wrapped.onDetachedFromWindow();
    }

    @Override
    public void onPanelClosed(int featureId, Menu menu) {
        wrapped.onPanelClosed(featureId, menu);
    }

    @Override
    public boolean onSearchRequested() {
        return wrapped.onSearchRequested();
    }

    @Override
    public boolean onSearchRequested(SearchEvent searchEvent) {
        return wrapped.onSearchRequested(searchEvent);
    }

    @Override
    public ActionMode onWindowStartingActionMode(ActionMode.Callback callback) {
        return wrapped.onWindowStartingActionMode(callback);
    }

    @Override
    public ActionMode onWindowStartingActionMode(ActionMode.Callback callback, int type) {
        return wrapped.onWindowStartingActionMode(callback, type);
    }

    @Override
    public void onActionModeStarted(ActionMode mode) {
        wrapped.onActionModeStarted(mode);
    }

    @Override
    public void onActionModeFinished(ActionMode mode) {
        wrapped.onActionModeFinished(mode);
    }

    @Override
    public void onProvideKeyboardShortcuts(List<KeyboardShortcutGroup> data, Menu menu, int deviceId) {
        wrapped.onProvideKeyboardShortcuts(data, menu, deviceId);
    }

    @Override
    public void onPointerCaptureChanged(boolean hasCapture) {
        wrapped.onPointerCaptureChanged(hasCapture);
    }
}
