package com.anime.witcher;

import android.app.Activity;
import android.app.Application;
import android.app.Dialog;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.Window;
import android.widget.AbsListView;

/**
 * TV D-pad support for Anime Witcher.
 *
 * Makes clickable rows/buttons focusable so they can be selected and clicked with a remote,
 * only the outermost clickable element of a clickable chain becomes focusable, register for
 * hierarchy changes so late-added rows are covered, and routes D-pad presses out of the
 * app's top bar into the content rows. Everything is wrapped in try/catch so this can
 * never crash the app.
 */
public class TvFocusHelper implements Application.ActivityLifecycleCallbacks,
        ViewGroup.OnHierarchyChangeListener {

    static final int CONTENT_Y_THRESHOLD = 0x9c;

    public View contentTarget;

    public TvFocusHelper() {
    }

    private static void makeListItemsFocusable(AbsListView list) {
        try {
            java.lang.reflect.Method method = AbsListView.class.getMethod("setItemsCanFocus", boolean.class);
            method.invoke(list, true);
        } catch (Throwable t) {
        }
    }

    private boolean makeFocusableRecursive(View view, boolean clickableParent) {
        boolean hasFocusableChild = false;
        boolean clickable = false;
        try {
            clickable = view.isClickable();
            if (view instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) view;
                group.setDescendantFocusability(ViewGroup.FOCUS_AFTER_DESCENDANTS);
                group.setOnHierarchyChangeListener(this);
                if (group instanceof AbsListView) {
                    makeListItemsFocusable((AbsListView) group);
                }
                int childCount = group.getChildCount();
                for (int i = 0; i < childCount; i++) {
                    View child = group.getChildAt(i);
                    hasFocusableChild |= makeFocusableRecursive(child, clickableParent || clickable);
                }
                if (!clickable && !hasFocusableChild) {
                    if (view.isFocusable()) {
                        view.setFocusable(false);
                    }
                    if (view.isFocusableInTouchMode()) {
                        view.setFocusableInTouchMode(false);
                    }
                }
            }
            if (clickable && !clickableParent) {
                if (!view.isFocusable()) {
                    view.setFocusable(true);
                }
                if (!view.isFocusableInTouchMode()) {
                    view.setFocusableInTouchMode(true);
                }
                if (contentTarget == null) {
                    int[] location = new int[2];
                    view.getLocationInWindow(location);
                    if (location[1] >= CONTENT_Y_THRESHOLD) {
                        contentTarget = view;
                    }
                }
            }
            boolean result = clickableParent ? false : clickable;
            result |= hasFocusableChild;
            return result;
        } catch (Throwable t) {
            return false;
        }
    }

    private void applyToActivity(Activity activity) {
        try {
            Window window = activity.getWindow();
            if (window == null) {
                return;
            }
            View decor = window.getDecorView();
            if (decor == null) {
                return;
            }
            contentTarget = null;
            makeFocusableRecursive(decor, false);
            View target = contentTarget;
            if (target == null) {
                return;
            }
            Window.Callback wrapped = window.getCallback();
            if (wrapped != null && !(wrapped instanceof TvWindowCallback)) {
                window.setCallback(new TvWindowCallback(wrapped, target, decor));
            }
            View focus = decor.findFocus();
            if (focus != null) {
                int[] location = new int[2];
                focus.getLocationInWindow(location);
                if (location[1] >= CONTENT_Y_THRESHOLD) {
                    return;
                }
            }
            target.requestFocus();
        } catch (Throwable t) {
        }
    }

    public static void fixDialog(Dialog dialog) {
        try {
            TvFocusHelper helper = new TvFocusHelper();
            Window window = dialog.getWindow();
            if (window == null) {
                return;
            }
            View decor = window.getDecorView();
            if (decor == null) {
                return;
            }
            helper.makeFocusableRecursive(decor, false);
            View target = helper.contentTarget;
            if (target == null) {
                return;
            }
            Window.Callback wrapped = window.getCallback();
            if (wrapped != null && !(wrapped instanceof TvWindowCallback)) {
                window.setCallback(new TvWindowCallback(wrapped, target, decor));
            }
            target.requestFocus();
        } catch (Throwable t) {
        }
    }

    public static View scanContent(View view) {
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
                    View result = scanContent(child);
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

    public static boolean redirectMod(Activity activity, KeyEvent event) {
        try {
            if (event == null || event.getAction() != KeyEvent.ACTION_DOWN) {
                return false;
            }
            int keyCode = event.getKeyCode();
            if (keyCode != KeyEvent.KEYCODE_DPAD_UP
                    && keyCode != KeyEvent.KEYCODE_DPAD_DOWN
                    && keyCode != KeyEvent.KEYCODE_DPAD_LEFT
                    && keyCode != KeyEvent.KEYCODE_DPAD_RIGHT) {
                return false;
            }
            Window window = activity.getWindow();
            if (window == null) {
                return false;
            }
            View decor = window.getDecorView();
            if (decor == null) {
                return false;
            }
            View focus = decor.findFocus();
            if (focus != null) {
                int[] location = new int[2];
                focus.getLocationInWindow(location);
                if (location[1] >= CONTENT_Y_THRESHOLD) {
                    return false;
                }
            }
            View target = scanContent(decor);
            if (target == null || !target.requestFocus() || !target.hasFocus()) {
                return false;
            }
            return true;
        } catch (Throwable t) {
            return false;
        }
    }

    @Override
    public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
        applyToActivity(activity);
    }

    @Override
    public void onActivityStarted(Activity activity) {
        applyToActivity(activity);
    }

    @Override
    public void onActivityResumed(Activity activity) {
        applyToActivity(activity);
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

    @Override
    public void onChildViewAdded(View parent, View child) {
        makeFocusableRecursive(child, false);
        View view = parent;
        for (int i = 0; i < 8; i++) {
            if (view == null) {
                break;
            }
            makeFocusableRecursive(view, false);
            ViewParent parentView = view.getParent();
            if (!(parentView instanceof View)) {
                break;
            }
            view = (View) parentView;
        }
    }

    @Override
    public void onChildViewRemoved(View parent, View child) {
    }
}