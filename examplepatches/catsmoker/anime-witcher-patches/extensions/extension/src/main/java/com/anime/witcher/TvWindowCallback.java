package com.anime.witcher;

import android.view.ActionMode;
import android.view.KeyEvent;
import android.view.KeyboardShortcutGroup;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.SearchEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.view.accessibility.AccessibilityEvent;

import java.util.List;

/**
 * Window callback wrapper for TV D-pad support.
 *
 * Intercepts D-pad key events before the app's own window callback so the remote can move
 * focus out of the app's top bar into the content rows, and delegates everything else to
 * the wrapped callback. The stored content target heals itself by re-scanning when it is
 * no longer attached, focusable, or below the top bar.
 */
public class TvWindowCallback implements Window.Callback {

    private static final int CONTENT_Y_THRESHOLD = 0x9c;

    public View contentTarget;
    public View decorView;

    private final Window.Callback wrapped;

    public TvWindowCallback(Window.Callback wrapped, View contentTarget, View decorView) {
        this.wrapped = wrapped;
        this.contentTarget = contentTarget;
        this.decorView = decorView;
    }

    private View getFocusTarget(View decor) {
        try {
            View target = contentTarget;
            if (target != null && target.isAttachedToWindow() && target.isFocusable()) {
                int[] location = new int[2];
                target.getLocationInWindow(location);
                if (location[1] >= CONTENT_Y_THRESHOLD) {
                    return target;
                }
            }
            View scanned = scanForContent(decor);
            if (scanned != null) {
                contentTarget = scanned;
            }
            return scanned;
        } catch (Throwable t) {
            return null;
        }
    }

    private View scanForContent(View view) {
        try {
            int[] location = new int[2];
            view.getLocationInWindow(location);
            if (location[1] >= CONTENT_Y_THRESHOLD && view.isClickable() && view.isFocusable()) {
                return view;
            }
            if (view instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) view;
                int childCount = group.getChildCount();
                for (int i = 0; i < childCount; i++) {
                    View child = group.getChildAt(i);
                    View result = scanForContent(child);
                    if (result != null) {
                        return result;
                    }
                }
            }
            return null;
        } catch (Throwable t) {
            return null;
        }
    }

    @Override
    public boolean dispatchKeyEvent(KeyEvent event) {
        try {
            if (event.getAction() != KeyEvent.ACTION_DOWN || decorView == null) {
                return wrapped.dispatchKeyEvent(event);
            }
            int keyCode = event.getKeyCode();
            if (keyCode != KeyEvent.KEYCODE_DPAD_UP
                    && keyCode != KeyEvent.KEYCODE_DPAD_DOWN
                    && keyCode != KeyEvent.KEYCODE_DPAD_LEFT
                    && keyCode != KeyEvent.KEYCODE_DPAD_RIGHT) {
                return wrapped.dispatchKeyEvent(event);
            }
            View focus = decorView.findFocus();
            if (focus != null) {
                int[] location = new int[2];
                focus.getLocationInWindow(location);
                if (location[1] >= CONTENT_Y_THRESHOLD) {
                    return wrapped.dispatchKeyEvent(event);
                }
            }
            View target = getFocusTarget(decorView);
            if (target != null && target.requestFocus() && target.hasFocus()) {
                return true;
            }
            return wrapped.dispatchKeyEvent(event);
        } catch (Throwable t) {
            return wrapped.dispatchKeyEvent(event);
        }
    }

    @Override
    public boolean dispatchKeyShortcutEvent(KeyEvent event) {
        return wrapped.dispatchKeyShortcutEvent(event);
    }

    @Override
    public boolean dispatchTouchEvent(MotionEvent event) {
        return wrapped.dispatchTouchEvent(event);
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
    public void onProvideKeyboardShortcuts(
            List<KeyboardShortcutGroup> data, Menu menu, int deviceId) {
        wrapped.onProvideKeyboardShortcuts(data, menu, deviceId);
    }

    @Override
    public void onPointerCaptureChanged(boolean hasCapture) {
        wrapped.onPointerCaptureChanged(hasCapture);
    }
}