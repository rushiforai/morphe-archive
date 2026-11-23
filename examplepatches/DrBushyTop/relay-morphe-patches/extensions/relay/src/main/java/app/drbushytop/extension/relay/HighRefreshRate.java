package app.drbushytop.extension.relay;

import android.annotation.TargetApi;
import android.app.Activity;
import android.app.Application;
import android.os.Build;
import android.os.Bundle;
import android.os.SystemClock;
import android.util.Log;
import android.view.ActionMode;
import android.view.Display;
import android.view.KeyEvent;
import android.view.KeyboardShortcutGroup;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.SearchEvent;
import android.view.View;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.view.WindowManager;
import android.view.accessibility.AccessibilityEvent;

import java.lang.ref.WeakReference;
import java.util.List;
import java.util.WeakHashMap;

/**
 * Asks for the display's highest refresh rate while a Relay window moves because of the user
 * (scrolling, flinging, the animations a tap starts), and drops the request once it has been still
 * for a moment, so the phone can lower the rate again for static content.
 *
 * <p>Relay never asks for a refresh rate, and on adaptive refresh rate phones the system then
 * keeps it at 60 Hz, scrolling included.
 *
 * <p>Only draws soon after a touch or key press count. Videos (Relay plays them in a TextureView,
 * which redraws the window for every video frame), GIFs and loading spinners draw on their own for
 * as long as they run, and the top rate would be held all that time for content that needs 30 or
 * 60 frames a second.
 */
@SuppressWarnings("unused")
public final class HighRefreshRate {
    private static final String TAG = "RelayRefreshRate";
    /** How long a window must not draw before it stops asking for the high rate. */
    private static final long IDLE_MS = 600;
    /**
     * Changing the request makes the window lay out and draw again. Draws this soon after a
     * change are that, not the user, so they do not count.
     */
    private static final long OWN_DRAW_MS = 150;
    /**
     * How long after the last touch or key press draws still count as the user's: long enough for
     * a fast fling to slow down.
     */
    private static final long INPUT_MS = 3000;

    private static final WeakHashMap<Activity, Booster> BOOSTERS = new WeakHashMap<>();
    private static boolean installed;

    private HighRefreshRate() {
    }

    /** Hook: Relay's Application#onCreate. */
    public static void install(Application application) {
        try {
            if (application == null || installed) return;
            installed = true;
            application.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
                @Override
                public void onActivityResumed(Activity activity) {
                    attach(activity);
                }

                @Override
                public void onActivityPaused(Activity activity) {
                    Booster booster = BOOSTERS.get(activity);
                    if (booster != null) booster.lower();
                }

                @Override
                public void onActivityDestroyed(Activity activity) {
                    Booster booster = BOOSTERS.remove(activity);
                    if (booster != null) booster.detach();
                }

                @Override public void onActivityCreated(Activity activity, Bundle savedInstanceState) {}
                @Override public void onActivityStarted(Activity activity) {}
                @Override public void onActivityStopped(Activity activity) {}
                @Override public void onActivitySaveInstanceState(Activity activity, Bundle outState) {}
            });
        } catch (Throwable t) {
            Log.e(TAG, "install", t);
        }
    }

    private static void attach(Activity activity) {
        try {
            if (BOOSTERS.containsKey(activity)) return;
            Window window = activity.getWindow();
            if (window == null) return;
            Window.Callback callback = window.getCallback();
            if (callback == null) return;
            Booster booster = new Booster(activity, window.getDecorView());
            BOOSTERS.put(activity, booster);
            window.setCallback(new InputWatcher(callback, booster));
            window.getDecorView().getViewTreeObserver().addOnDrawListener(booster);
        } catch (Throwable t) {
            Log.e(TAG, "attach", t);
        }
    }

    /** Watches one window's draws and raises or lowers its refresh rate request. */
    private static final class Booster implements ViewTreeObserver.OnDrawListener {
        private final WeakReference<Activity> activity;
        private final View decor;
        private boolean high;
        private long lastDraw;
        private long lastInput = Long.MIN_VALUE / 2;
        private long changedAt;
        private boolean idleCheckPosted;

        private final Runnable raise = new Runnable() {
            @Override
            public void run() {
                request(highestRefreshRate());
            }
        };

        private final Runnable idleCheck = new Runnable() {
            @Override
            public void run() {
                idleCheckPosted = false;
                if (!high) return;
                long still = SystemClock.uptimeMillis() - lastDraw;
                if (still >= IDLE_MS) {
                    lower();
                } else {
                    decor.postDelayed(this, IDLE_MS - still);
                    idleCheckPosted = true;
                }
            }
        };

        Booster(Activity activity, View decor) {
            this.activity = new WeakReference<>(activity);
            this.decor = decor;
        }

        void onInput() {
            lastInput = SystemClock.uptimeMillis();
        }

        @Override
        public void onDraw() {
            long now = SystemClock.uptimeMillis();
            if (now - changedAt < OWN_DRAW_MS) return;
            if (now - lastInput > INPUT_MS) return;
            lastDraw = now;
            if (!high) {
                high = true;
                // The view tree must not change while it draws.
                decor.post(raise);
            }
            if (!idleCheckPosted) {
                decor.postDelayed(idleCheck, IDLE_MS);
                idleCheckPosted = true;
            }
        }

        void lower() {
            high = false;
            decor.removeCallbacks(raise);
            request(0f);
        }

        void detach() {
            decor.removeCallbacks(raise);
            decor.removeCallbacks(idleCheck);
            try {
                Activity owner = activity.get();
                Window window = owner == null ? null : owner.getWindow();
                if (window != null && window.getCallback() instanceof InputWatcher) {
                    window.setCallback(((InputWatcher) window.getCallback()).delegate);
                }
            } catch (Throwable ignored) {
            }
            try {
                decor.getViewTreeObserver().removeOnDrawListener(this);
            } catch (Throwable ignored) {
            }
        }

        /** Sets the window's refresh rate request; 0 means none, so the system decides. */
        private void request(float rate) {
            try {
                Activity owner = activity.get();
                if (owner == null) return;
                Window window = owner.getWindow();
                WindowManager.LayoutParams attributes = window.getAttributes();
                if (Math.abs(attributes.preferredRefreshRate - rate) < 0.01f) return;
                attributes.preferredRefreshRate = rate;
                changedAt = SystemClock.uptimeMillis();
                window.setAttributes(attributes);
                if (Log.isLoggable(TAG, Log.DEBUG)) {
                    Log.d(TAG, owner.getClass().getSimpleName() + ": refresh rate request " + rate);
                }
            } catch (Throwable t) {
                Log.e(TAG, "request", t);
            }
        }

        /** The highest refresh rate the window's display offers at its current resolution. */
        @SuppressWarnings("deprecation")
        private float highestRefreshRate() {
            try {
                Activity owner = activity.get();
                if (owner == null) return 0f;
                Display display = Build.VERSION.SDK_INT >= 30
                        ? owner.getDisplay()
                        : owner.getWindowManager().getDefaultDisplay();
                if (display == null) return 0f;
                Display.Mode current = display.getMode();
                float highest = 0f;
                for (Display.Mode mode : display.getSupportedModes()) {
                    if (mode.getPhysicalWidth() == current.getPhysicalWidth()
                            && mode.getPhysicalHeight() == current.getPhysicalHeight()) {
                        highest = Math.max(highest, mode.getRefreshRate());
                    }
                }
                return highest;
            } catch (Throwable t) {
                Log.e(TAG, "highestRefreshRate", t);
                return 0f;
            }
        }
    }

    /**
     * Passes everything on to the window's own callback (the activity, wrapped by AppCompat), and
     * tells the booster about touches, key presses and scroll wheel moves on the way.
     */
    private static final class InputWatcher implements Window.Callback {
        final Window.Callback delegate;
        private final Booster booster;

        InputWatcher(Window.Callback delegate, Booster booster) {
            this.delegate = delegate;
            this.booster = booster;
        }

        @Override
        public boolean dispatchTouchEvent(MotionEvent event) {
            booster.onInput();
            return delegate.dispatchTouchEvent(event);
        }

        @Override
        public boolean dispatchKeyEvent(KeyEvent event) {
            booster.onInput();
            return delegate.dispatchKeyEvent(event);
        }

        @Override
        public boolean dispatchGenericMotionEvent(MotionEvent event) {
            booster.onInput();
            return delegate.dispatchGenericMotionEvent(event);
        }

        @Override
        public boolean dispatchTrackballEvent(MotionEvent event) {
            booster.onInput();
            return delegate.dispatchTrackballEvent(event);
        }

        @Override
        public boolean dispatchKeyShortcutEvent(KeyEvent event) {
            return delegate.dispatchKeyShortcutEvent(event);
        }

        @Override
        public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent event) {
            return delegate.dispatchPopulateAccessibilityEvent(event);
        }

        @Override
        public View onCreatePanelView(int featureId) {
            return delegate.onCreatePanelView(featureId);
        }

        @Override
        public boolean onCreatePanelMenu(int featureId, Menu menu) {
            return delegate.onCreatePanelMenu(featureId, menu);
        }

        @Override
        public boolean onPreparePanel(int featureId, View view, Menu menu) {
            return delegate.onPreparePanel(featureId, view, menu);
        }

        @Override
        public boolean onMenuOpened(int featureId, Menu menu) {
            return delegate.onMenuOpened(featureId, menu);
        }

        @Override
        public boolean onMenuItemSelected(int featureId, MenuItem item) {
            return delegate.onMenuItemSelected(featureId, item);
        }

        @Override
        public void onWindowAttributesChanged(WindowManager.LayoutParams attrs) {
            delegate.onWindowAttributesChanged(attrs);
        }

        @Override
        public void onContentChanged() {
            delegate.onContentChanged();
        }

        @Override
        public void onWindowFocusChanged(boolean hasFocus) {
            delegate.onWindowFocusChanged(hasFocus);
        }

        @Override
        public void onAttachedToWindow() {
            delegate.onAttachedToWindow();
        }

        @Override
        public void onDetachedFromWindow() {
            delegate.onDetachedFromWindow();
        }

        @Override
        public void onPanelClosed(int featureId, Menu menu) {
            delegate.onPanelClosed(featureId, menu);
        }

        @Override
        public boolean onSearchRequested() {
            return delegate.onSearchRequested();
        }

        @Override
        public boolean onSearchRequested(SearchEvent searchEvent) {
            return delegate.onSearchRequested(searchEvent);
        }

        @Override
        public ActionMode onWindowStartingActionMode(ActionMode.Callback callback) {
            return delegate.onWindowStartingActionMode(callback);
        }

        @Override
        public ActionMode onWindowStartingActionMode(ActionMode.Callback callback, int type) {
            return delegate.onWindowStartingActionMode(callback, type);
        }

        @Override
        public void onActionModeStarted(ActionMode mode) {
            delegate.onActionModeStarted(mode);
        }

        @Override
        public void onActionModeFinished(ActionMode mode) {
            delegate.onActionModeFinished(mode);
        }

        @Override
        @TargetApi(24) // Only called from Android 7 on.
        public void onProvideKeyboardShortcuts(List<KeyboardShortcutGroup> data, Menu menu,
                                               int deviceId) {
            delegate.onProvideKeyboardShortcuts(data, menu, deviceId);
        }

        @Override
        @TargetApi(26) // Only called from Android 8 on.
        public void onPointerCaptureChanged(boolean hasCapture) {
            delegate.onPointerCaptureChanged(hasCapture);
        }
    }
}
