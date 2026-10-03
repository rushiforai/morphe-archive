/*
* Copyright 2026 De-Vanced
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
*/

package app.morphe.extension.facebook.media;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.ActionMode;
import android.view.HapticFeedbackConstants;
import android.view.KeyEvent;
import android.view.KeyboardShortcutGroup;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.SearchEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.Window;
import android.view.WindowManager;
import android.view.accessibility.AccessibilityEvent;

import app.morphe.extension.facebook.settings.DeVancedSettings;

import java.lang.ref.WeakReference;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

/** Observes right-side Reels presses without changing normal touch delivery. */
public final class ReelsGestureController {
    private static final int STATE_IDLE = 0;
    private static final int STATE_ARMED = 1;
    private static final int STATE_HELD = 2;
    private static final float RIGHT_REGION_FRACTION = 0.30f;

    private static final AtomicBoolean REGISTERED = new AtomicBoolean();
    private static final Runnable ACTIVATE_GESTURE =
            ReelsGestureController::activateIfStillArmed;

    private static volatile Handler handler;
    private static volatile WeakReference<Activity> currentActivity =
            new WeakReference<>(null);
    private static int state = STATE_IDLE;
    private static int pointerId = -1;
    private static float downX;
    private static float downY;
    private static float lastX;
    private static float lastY;
    private static boolean lockedThisGesture;

    private ReelsGestureController() {
    }

    public static void initialize(Application app) {
        if (app == null || !REGISTERED.compareAndSet(false, true)) return;
        try {
            app.registerActivityLifecycleCallbacks(new LifecycleCallbacks());
        } catch (Throwable ignored) {
            REGISTERED.set(false);
        }
    }

    public static void cancelForSettingChange() {
        cancelGesture();
    }

    private static void onActivityResumed(Activity activity) {
        currentActivity = new WeakReference<>(activity);
        installCallback(activity);
    }

    private static void onActivityPaused(Activity activity) {
        Activity current = currentActivity == null
                ? null
                : currentActivity.get();
        if (current != activity) return;
        cancelGesture();
        currentActivity = new WeakReference<>(null);
    }

    private static void installCallback(Activity activity) {
        try {
            Window window = activity.getWindow();
            if (window == null) return;
            Window.Callback callback = window.getCallback();
            if (callback instanceof GestureWindowCallback) return;
            window.setCallback(new GestureWindowCallback(callback, activity));
        } catch (Throwable ignored) {
        }
    }

    private static boolean dispatchTouchEvent(
            Activity activity,
            MotionEvent event
    ) {
        if (activity == null || event == null) return false;
        Activity current = currentActivity == null
                ? null
                : currentActivity.get();
        if (current != activity) return false;
        return onTouchEvent(activity, event);
    }

    private static boolean onTouchEvent(
            Activity activity,
            MotionEvent event
    ) {
        if (!ReelsPlaybackSpeed.isGestureAvailable()) return false;

        switch (event.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                if (state != STATE_IDLE || !isRightRegion(activity, event)) {
                    return false;
                }
                state = STATE_ARMED;
                pointerId = event.getPointerId(0);
                downX = lastX = event.getRawX();
                downY = lastY = event.getRawY();
                lockedThisGesture = false;
                scheduleActivation(activity);
                return false;

            case MotionEvent.ACTION_MOVE:
                if (state == STATE_IDLE || !isSamePointer(event)) return false;
                lastX = event.getRawX();
                lastY = event.getRawY();
                float slop = ViewConfiguration.get(activity)
                        .getScaledTouchSlop();
                if (state == STATE_ARMED) {
                    if (Math.abs(lastX - downX) > slop * 2.0f) {
                        cancelGesture();
                        return false;
                    }
                    return false;
                }
                if (state == STATE_HELD) {
                    if (Math.abs(lastX - downX) > slop * 3.0f) {
                        cancelGesture();
                        return true;
                    }
                    if (!lockedThisGesture &&
                            lastY - downY >= slop * 3.0f &&
                            ReelsPlaybackSpeed.lockCurrentPlayer()) {
                        lockedThisGesture = true;
                        hapticFeedback(activity);
                    }
                    return true;
                }
                return false;

            case MotionEvent.ACTION_POINTER_DOWN:
                cancelGesture();
                return false;

            case MotionEvent.ACTION_POINTER_UP: {
                int actionIndex = event.getActionIndex();
                if (event.getPointerId(actionIndex) != pointerId) return false;
                if (state == STATE_HELD) {
                    finishGesture();
                    return true;
                }
                cancelGesture();
                return false;
            }

            case MotionEvent.ACTION_UP:
                if (state == STATE_HELD) {
                    finishGesture();
                    return true;
                }
                cancelGesture();
                return false;

            case MotionEvent.ACTION_CANCEL:
                cancelGesture();
                return false;

            default:
                return false;
        }
    }

    private static boolean isSamePointer(MotionEvent event) {
        return pointerId >= 0 && event.findPointerIndex(pointerId) >= 0;
    }

    private static boolean isRightRegion(
            Activity activity,
            MotionEvent event
    ) {
        return isRightRegion(
                activity,
                event.getRawX(),
                event.getRawY()
        );
    }

    private static boolean isRightRegion(
            Activity activity,
            float rawX,
            float rawY
    ) {
        View decor = activity.getWindow() == null
                ? null
                : activity.getWindow().getDecorView();
        if (decor == null || decor.getWidth() <= 0 || decor.getHeight() <= 0) {
            return false;
        }
        return rawX >= decor.getWidth() * (1.0f - RIGHT_REGION_FRACTION) &&
                rawY >= decor.getHeight() * 0.08f &&
                rawY <= decor.getHeight() * 0.94f;
    }

    private static void scheduleActivation(Activity activity) {
        Handler main = getHandler();
        main.removeCallbacks(ACTIVATE_GESTURE);
        main.postDelayed(
                ACTIVATE_GESTURE,
                ViewConfiguration.getLongPressTimeout()
        );
    }

    private static void activateIfStillArmed() {
        Activity activity = currentActivity == null
                ? null
                : currentActivity.get();
        if (state != STATE_ARMED ||
                activity == null ||
                !ReelsPlaybackSpeed.isGestureAvailable() ||
                !isRightRegion(activity, lastX, lastY)) {
            cancelGesture();
            return;
        }
        state = STATE_HELD;
        ReelsPlaybackSpeed.setGestureHeld(true);
        hapticFeedback(activity);
    }

    private static void finishGesture() {
        if (state == STATE_HELD && !lockedThisGesture) {
            ReelsPlaybackSpeed.setGestureHeld(false);
        }
        state = STATE_IDLE;
        pointerId = -1;
        lockedThisGesture = false;
        removeActivation();
    }

    private static void cancelGesture() {
        if (state == STATE_HELD && !lockedThisGesture) {
            ReelsPlaybackSpeed.setGestureHeld(false);
        }
        state = STATE_IDLE;
        pointerId = -1;
        lockedThisGesture = false;
        removeActivation();
    }

    private static void removeActivation() {
        Handler main = handler;
        if (main != null) main.removeCallbacks(ACTIVATE_GESTURE);
    }

    private static Handler getHandler() {
        Handler main = handler;
        if (main == null) {
            main = new Handler(Looper.getMainLooper());
            handler = main;
        }
        return main;
    }

    private static void hapticFeedback(Activity activity) {
        if (DeVancedSettings.isHapticsDisabled()) return;
        View decor = activity.getWindow() == null
                ? null
                : activity.getWindow().getDecorView();
        if (decor != null) {
            decor.performHapticFeedback(
                    HapticFeedbackConstants.LONG_PRESS,
                    HapticFeedbackConstants.FLAG_IGNORE_GLOBAL_SETTING
            );
        }
    }

    private static final class LifecycleCallbacks
            implements Application.ActivityLifecycleCallbacks {
        @Override public void onActivityCreated(
                Activity activity,
                Bundle state
        ) {
        }

        @Override public void onActivityStarted(Activity activity) {
        }

        @Override public void onActivityResumed(Activity activity) {
            ReelsGestureController.onActivityResumed(activity);
        }

        @Override public void onActivityPaused(Activity activity) {
            ReelsGestureController.onActivityPaused(activity);
        }

        @Override public void onActivityStopped(Activity activity) {
        }

        @Override public void onActivitySaveInstanceState(
                Activity activity,
                Bundle state
        ) {
        }

        @Override public void onActivityDestroyed(Activity activity) {
        }
    }

    private static final class GestureWindowCallback
            implements Window.Callback {
        private final Window.Callback delegate;
        private final Activity activity;

        GestureWindowCallback(
                Window.Callback delegate,
                Activity activity
        ) {
            this.delegate = delegate;
            this.activity = activity;
        }

        @Override
        public boolean dispatchTouchEvent(MotionEvent event) {
            if (ReelsGestureController.dispatchTouchEvent(activity, event)) {
                return true;
            }
            return delegate != null && delegate.dispatchTouchEvent(event);
        }

        @Override
        public boolean dispatchKeyEvent(KeyEvent event) {
            return delegate != null && delegate.dispatchKeyEvent(event);
        }

        @Override
        public boolean dispatchKeyShortcutEvent(KeyEvent event) {
            return delegate != null &&
                    delegate.dispatchKeyShortcutEvent(event);
        }

        @Override
        public boolean dispatchPopulateAccessibilityEvent(
                AccessibilityEvent event
        ) {
            return delegate != null &&
                    delegate.dispatchPopulateAccessibilityEvent(event);
        }

        @Override
        public boolean dispatchTrackballEvent(MotionEvent event) {
            return delegate != null && delegate.dispatchTrackballEvent(event);
        }

        @Override
        public boolean dispatchGenericMotionEvent(MotionEvent event) {
            return delegate != null &&
                    delegate.dispatchGenericMotionEvent(event);
        }

        @Override public void onActionModeStarted(ActionMode mode) {
            if (delegate != null) delegate.onActionModeStarted(mode);
        }

        @Override public void onActionModeFinished(ActionMode mode) {
            if (delegate != null) delegate.onActionModeFinished(mode);
        }

        @Override public void onAttachedToWindow() {
            if (delegate != null) delegate.onAttachedToWindow();
        }

        @Override public void onContentChanged() {
            if (delegate != null) delegate.onContentChanged();
        }

        @Override public boolean onCreatePanelMenu(
                int featureId,
                Menu menu
        ) {
            return delegate != null &&
                    delegate.onCreatePanelMenu(featureId, menu);
        }

        @Override public View onCreatePanelView(int featureId) {
            return delegate == null
                    ? null
                    : delegate.onCreatePanelView(featureId);
        }

        @Override public void onDetachedFromWindow() {
            if (delegate != null) delegate.onDetachedFromWindow();
        }

        @Override public boolean onMenuItemSelected(
                int featureId,
                MenuItem item
        ) {
            return delegate != null &&
                    delegate.onMenuItemSelected(featureId, item);
        }

        @Override public boolean onMenuOpened(int featureId, Menu menu) {
            return delegate != null &&
                    delegate.onMenuOpened(featureId, menu);
        }

        @Override public void onPanelClosed(int featureId, Menu menu) {
            if (delegate != null) delegate.onPanelClosed(featureId, menu);
        }

        @Override public boolean onSearchRequested() {
            return delegate != null && delegate.onSearchRequested();
        }

        @Override public boolean onSearchRequested(SearchEvent event) {
            return delegate != null && delegate.onSearchRequested(event);
        }

        @Override public void onWindowAttributesChanged(
                WindowManager.LayoutParams attrs
        ) {
            if (delegate != null) {
                delegate.onWindowAttributesChanged(attrs);
            }
        }

        @Override public void onWindowFocusChanged(boolean hasFocus) {
            if (delegate != null) delegate.onWindowFocusChanged(hasFocus);
        }

        @Override public ActionMode onWindowStartingActionMode(
                ActionMode.Callback callback
        ) {
            return delegate == null
                    ? null
                    : delegate.onWindowStartingActionMode(callback);
        }

        @Override public ActionMode onWindowStartingActionMode(
                ActionMode.Callback callback,
                int type
        ) {
            return delegate == null
                    ? null
                    : delegate.onWindowStartingActionMode(callback, type);
        }

        @Override public void onPointerCaptureChanged(boolean hasCapture) {
            if (delegate != null) {
                delegate.onPointerCaptureChanged(hasCapture);
            }
        }

        @Override public void onProvideKeyboardShortcuts(
                List<KeyboardShortcutGroup> data,
                Menu menu,
                int deviceId
        ) {
            if (delegate != null) {
                delegate.onProvideKeyboardShortcuts(data, menu, deviceId);
            }
        }

        @Override public boolean onPreparePanel(
                int featureId,
                View view,
                Menu menu
        ) {
            return delegate != null &&
                    delegate.onPreparePanel(featureId, view, menu);
        }
    }
}
