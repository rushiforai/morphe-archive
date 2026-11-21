package app.keyboardspeed.extension.reddit;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;
import android.os.SystemClock;
import android.util.Log;
import android.view.ActionMode;
import android.view.InputDevice;
import android.view.KeyEvent;
import android.view.KeyboardShortcutGroup;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.SearchEvent;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.view.accessibility.AccessibilityEvent;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;

import java.util.List;

/**
 * Mouse and keyboard swiping for Reddit, such as between the images of a post.
 * <p>
 * Reddit is made with Jetpack Compose, whose swipeable lists and pagers ignore dragging with a mouse.
 * Dragging with the primary mouse button is given to the app as a finger instead, and the left and right arrow keys
 * swipe once under the mouse pointer, so a gallery moves one image per press.
 */
@SuppressWarnings("unused")
public final class MouseSwipePatch {
    private static final String TAG = "MouseSwipe";

    /**
     * Length of the swipe of an arrow key.
     */
    private static final float ARROW_SWIPE_DP = 120;

    /**
     * Duration of the swipe of an arrow key, fast enough to fling a pager to the next page.
     */
    private static final int ARROW_SWIPE_MS = 60;
    private static final int ARROW_SWIPE_STEPS = 6;

    private MouseSwipePatch() {
    }

    /**
     * Injection point.
     */
    public static void onApplicationCreate(Application application) {
        try {
            application.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
                @Override
                public void onActivityPostCreated(Activity activity, Bundle savedInstanceState) {
                    wrap(activity);
                }

                @Override
                public void onActivityResumed(Activity activity) {
                    wrap(activity); // In case the app replaced the window callback after it was created.
                }

                @Override
                public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
                }

                @Override
                public void onActivityStarted(Activity activity) {
                }

                @Override
                public void onActivityPaused(Activity activity) {
                }

                @Override
                public void onActivityStopped(Activity activity) {
                }

                @Override
                public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
                }

                @Override
                public void onActivityDestroyed(Activity activity) {
                }
            });
        } catch (Exception ex) {
            Log.e(TAG, "onApplicationCreate failure", ex);
        }
    }

    private static void wrap(Activity activity) {
        try {
            Window window = activity.getWindow();
            Window.Callback callback = window == null ? null : window.getCallback();
            if (callback != null && !(callback instanceof SwipeCallback)) {
                window.setCallback(new SwipeCallback(activity, callback));
            }
        } catch (Exception ex) {
            Log.e(TAG, "wrap failure", ex);
        }
    }

    private static final class SwipeCallback implements Window.Callback {
        private final Activity activity;
        private final Window.Callback delegate;

        /**
         * If the mouse button that is down is given to the app as a finger.
         */
        private boolean mouseAsFinger;

        /**
         * Last position of the mouse pointer in the window, or NaN if not known.
         */
        private float pointerX = Float.NaN;
        private float pointerY = Float.NaN;

        /**
         * If the first press of an arrow key swiped, so its repeats and its release are consumed too.
         */
        private boolean consumingArrowKey;

        /**
         * Key code of the arrow key whose press came here, or 0.
         */
        private int pressedArrowKey;

        SwipeCallback(Activity activity, Window.Callback delegate) {
            this.activity = activity;
            this.delegate = delegate;
        }

        private static boolean isMouse(MotionEvent event) {
            return event.getPointerCount() == 1
                    && event.getToolType(0) == MotionEvent.TOOL_TYPE_MOUSE
                    && event.isFromSource(InputDevice.SOURCE_MOUSE);
        }

        @Override
        public boolean dispatchTouchEvent(MotionEvent event) {
            try {
                if (isMouse(event)) {
                    final int action = event.getActionMasked();
                    if (action == MotionEvent.ACTION_DOWN) {
                        // Only the primary button (or none, as some input injection does):
                        // a right-click keeps its mouse action.
                        final int buttons = event.getButtonState();
                        mouseAsFinger = buttons == 0 || (buttons & MotionEvent.BUTTON_PRIMARY) != 0;
                    }
                    pointerX = event.getX();
                    pointerY = event.getY();

                    if (mouseAsFinger) {
                        if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) {
                            mouseAsFinger = false;
                        }
                        MotionEvent finger = asFinger(event);
                        try {
                            return delegate.dispatchTouchEvent(finger);
                        } finally {
                            finger.recycle();
                        }
                    }
                }
            } catch (Exception ex) {
                Log.e(TAG, "dispatchTouchEvent failure", ex);
            }
            return delegate.dispatchTouchEvent(event);
        }

        @Override
        public boolean dispatchGenericMotionEvent(MotionEvent event) {
            try {
                if (isMouse(event)) {
                    final int action = event.getActionMasked();
                    if (action == MotionEvent.ACTION_HOVER_MOVE || action == MotionEvent.ACTION_HOVER_ENTER) {
                        pointerX = event.getX();
                        pointerY = event.getY();
                    } else if ((action == MotionEvent.ACTION_BUTTON_PRESS
                            || action == MotionEvent.ACTION_BUTTON_RELEASE)
                            && event.getActionButton() == MotionEvent.BUTTON_PRIMARY) {
                        // The press is given to the app as a finger, so not also as a mouse button.
                        return true;
                    }
                }
            } catch (Exception ex) {
                Log.e(TAG, "dispatchGenericMotionEvent failure", ex);
            }
            return delegate.dispatchGenericMotionEvent(event);
        }

        @Override
        public boolean dispatchKeyEvent(KeyEvent event) {
            try {
                final int keyCode = event.getKeyCode();
                if (keyCode == KeyEvent.KEYCODE_DPAD_LEFT || keyCode == KeyEvent.KEYCODE_DPAD_RIGHT) {
                    final boolean next = keyCode == KeyEvent.KEYCODE_DPAD_RIGHT;
                    if (event.getAction() == KeyEvent.ACTION_DOWN) {
                        if (event.getRepeatCount() == 0) {
                            pressedArrowKey = keyCode;
                            consumingArrowKey = event.hasNoModifiers() && !isTyping() && swipe(next);
                        }
                        if (consumingArrowKey) {
                            return true;
                        }
                    } else if (event.getAction() == KeyEvent.ACTION_UP) {
                        final boolean pressSeen = pressedArrowKey == keyCode;
                        pressedArrowKey = 0;
                        if (!pressSeen) {
                            // After a click, Android uses the press of an arrow key to leave touch mode, and
                            // only its release comes here. Swipe on the release, so each press swipes once.
                            if (event.hasNoModifiers() && !isTyping() && swipe(next)) {
                                return true;
                            }
                        } else if (consumingArrowKey) {
                            consumingArrowKey = false;
                            return true;
                        }
                    }
                }
            } catch (Exception ex) {
                Log.e(TAG, "dispatchKeyEvent failure", ex);
            }
            return delegate.dispatchKeyEvent(event);
        }

        /**
         * @return If a text field has the focus, such as a comment, where the arrow keys move the cursor.
         */
        private boolean isTyping() {
            if (activity.getCurrentFocus() instanceof EditText) {
                return true;
            }
            // Text fields of Compose aren't an EditText, but are connected to the keyboard while focused.
            InputMethodManager manager = activity.getSystemService(InputMethodManager.class);
            View focus = activity.getCurrentFocus();
            return manager != null && focus != null && manager.isActive(focus) && manager.isAcceptingText();
        }

        /**
         * Swipes once under the mouse pointer, like a finger.
         *
         * @param next If the swipe shows the next item (to the right), or else the previous one.
         * @return If the mouse pointer is known, so the swipe was made.
         */
        private boolean swipe(boolean next) {
            if (Float.isNaN(pointerX)) {
                return false;
            }
            View decor = activity.getWindow().getDecorView();
            final int width = decor.getWidth();
            final float distance = Math.min(ARROW_SWIPE_DP * decor.getResources().getDisplayMetrics().density,
                    width / 3f);
            // A finger moves left to show the next item. Keep the swipe in the window.
            float startX = Math.max(1, Math.min(width - 2, pointerX));
            final float direction = next ? -1 : 1;
            if (startX + direction * distance < 1 || startX + direction * distance > width - 2) {
                startX = next ? distance + 1 : width - 2 - distance;
            }
            final float y = pointerY;

            final long downTime = SystemClock.uptimeMillis() - ARROW_SWIPE_MS;
            dispatchFinger(downTime, downTime, MotionEvent.ACTION_DOWN, startX, y);
            for (int step = 1; step <= ARROW_SWIPE_STEPS; step++) {
                final float fraction = step / (float) ARROW_SWIPE_STEPS;
                dispatchFinger(downTime, downTime + ARROW_SWIPE_MS * step / ARROW_SWIPE_STEPS,
                        MotionEvent.ACTION_MOVE, startX + direction * distance * fraction, y);
            }
            dispatchFinger(downTime, downTime + ARROW_SWIPE_MS, MotionEvent.ACTION_UP,
                    startX + direction * distance, y);
            Log.d(TAG, "Swiped " + (next ? "to the next item" : "to the previous item") + " at " + startX + "," + y);
            return true;
        }

        private void dispatchFinger(long downTime, long eventTime, int action, float x, float y) {
            MotionEvent.PointerProperties properties = new MotionEvent.PointerProperties();
            properties.id = 0;
            properties.toolType = MotionEvent.TOOL_TYPE_FINGER;
            MotionEvent.PointerCoords coords = new MotionEvent.PointerCoords();
            coords.x = x;
            coords.y = y;
            coords.pressure = 1;
            coords.size = 1;
            MotionEvent event = MotionEvent.obtain(downTime, eventTime, action, 1,
                    new MotionEvent.PointerProperties[]{properties}, new MotionEvent.PointerCoords[]{coords},
                    0, 0, 1, 1, 0, 0, InputDevice.SOURCE_TOUCHSCREEN, 0);
            try {
                delegate.dispatchTouchEvent(event);
            } finally {
                event.recycle();
            }
        }

        private static MotionEvent asFinger(MotionEvent event) {
            MotionEvent.PointerProperties properties = new MotionEvent.PointerProperties();
            event.getPointerProperties(0, properties);
            properties.toolType = MotionEvent.TOOL_TYPE_FINGER;
            MotionEvent.PointerCoords coords = new MotionEvent.PointerCoords();
            event.getPointerCoords(0, coords);
            return MotionEvent.obtain(event.getDownTime(), event.getEventTime(), event.getActionMasked(), 1,
                    new MotionEvent.PointerProperties[]{properties}, new MotionEvent.PointerCoords[]{coords},
                    event.getMetaState(), 0, event.getXPrecision(), event.getYPrecision(), event.getDeviceId(),
                    event.getEdgeFlags(), InputDevice.SOURCE_TOUCHSCREEN, event.getFlags());
        }

        // region Delegated to the callback of the app.

        @Override
        public boolean dispatchKeyShortcutEvent(KeyEvent event) {
            return delegate.dispatchKeyShortcutEvent(event);
        }

        @Override
        public boolean dispatchTrackballEvent(MotionEvent event) {
            return delegate.dispatchTrackballEvent(event);
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
        public void onProvideKeyboardShortcuts(List<KeyboardShortcutGroup> data, Menu menu, int deviceId) {
            delegate.onProvideKeyboardShortcuts(data, menu, deviceId);
        }

        @Override
        public void onPointerCaptureChanged(boolean hasCapture) {
            delegate.onPointerCaptureChanged(hasCapture);
        }

        // endregion
    }
}
