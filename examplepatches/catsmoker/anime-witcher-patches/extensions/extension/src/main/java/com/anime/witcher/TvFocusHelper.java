package com.anime.witcher;

import android.app.Activity;
import android.app.Application;
import android.app.Dialog;
import android.os.Build;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.Window;
import android.widget.AbsListView;

import java.util.ArrayList;
import java.util.List;

/**
 * TV D-pad support for Anime Witcher.
 *
 * Makes every actionable view focusable so that no button is unreachable from the remote,
 * including buttons that live inside a clickable parent (e.g. the "choose server" button in
 * a clickable row, the "..." menu on a video row, or the player's on-screen controls inside
 * the clickable player surface). Focusability is only ever added, never removed. Default
 * focus highlights are enabled so focused elements are visible on screen. A content target
 * under the top bar is remembered and D-pad presses that land above it are routed down into
 * the content area (request focus is only ever consumed when it actually succeeded).
 * Everything is wrapped in try/catch so this can never crash the app.
 */
public class TvFocusHelper implements Application.ActivityLifecycleCallbacks,
        ViewGroup.OnHierarchyChangeListener {

    static final int CONTENT_Y_THRESHOLD = 0x9c;

    static final int MAX_REDIRECT_CANDIDATES = 64;

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

    private static boolean isActionable(View view) {
        try {
            if (!view.isEnabled() || view.getVisibility() != View.VISIBLE) {
                return false;
            }
            return view.isClickable() || view.isLongClickable();
        } catch (Throwable t) {
            return false;
        }
    }

    private static boolean isBelowTopBar(View view) {
        try {
            int[] location = new int[2];
            view.getLocationInWindow(location);
            return location[1] >= CONTENT_Y_THRESHOLD;
        } catch (Throwable t) {
            return false;
        }
    }

    private static void enableFocusHighlight(View view) {
        try {
            if (Build.VERSION.SDK_INT >= 26) {
                view.setDefaultFocusHighlightEnabled(true);
            }
        } catch (Throwable t) {
        }
    }

    private void ensureFocusable(View view) {
        try {
            if (!view.isFocusable()) {
                view.setFocusable(true);
            }
            if (!view.isFocusableInTouchMode()) {
                view.setFocusableInTouchMode(true);
            }
            enableFocusHighlight(view);
        } catch (Throwable t) {
        }
    }

    private boolean makeFocusableRecursive(View view) {
        boolean any = false;
        try {
            if (isActionable(view)) {
                ensureFocusable(view);
                if (contentTarget == null && isBelowTopBar(view)) {
                    contentTarget = view;
                }
                any = true;
            }
            if (view instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) view;
                group.setOnHierarchyChangeListener(this);
                if (group instanceof AbsListView) {
                    makeListItemsFocusable((AbsListView) group);
                }
                int childCount = group.getChildCount();
                for (int i = 0; i < childCount; i++) {
                    View child = group.getChildAt(i);
                    if (makeFocusableRecursive(child)) {
                        any = true;
                    }
                }
            }
            return any;
        } catch (Throwable t) {
            return any;
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
            makeFocusableRecursive(decor);
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
            if (target.isShown() && target.requestFocus() && target.hasFocus()) {
                return;
            }
            List<View> targets = new ArrayList<View>();
            collectContentTargets(decor, targets);
            for (View candidate : targets) {
                if (candidate.isAttachedToWindow() && candidate.isShown()
                        && candidate.requestFocus() && candidate.hasFocus()) {
                    break;
                }
            }
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
            // A dialog is never the app's top bar: any actionable view inside it is fair
            // game for the D-pad regardless of its vertical position on screen, so the
            // CONTENT_Y_THRESHOLD rule does not apply here.
            helper.makeFocusableRecursive(decor);
            List<View> targets = new ArrayList<View>();
            collectTargets(decor, targets, false);
            if (targets.isEmpty()) {
                return;
            }
            View target = targets.get(0);
            Window.Callback wrapped = window.getCallback();
            if (wrapped != null && !(wrapped instanceof TvWindowCallback)) {
                window.setCallback(new TvWindowCallback(wrapped, target, decor, false));
            }
            focusFirstActionable(decor, targets);
        } catch (Throwable t) {
        }
    }

    private static void focusFirstActionable(View decor, List<View> targets) {
        try {
            if (decor.findFocus() != null) {
                return;
            }
            for (View candidate : targets) {
                if (candidate.isAttachedToWindow() && candidate.isShown()
                        && candidate.requestFocus() && candidate.hasFocus()) {
                    break;
                }
            }
        } catch (Throwable t) {
        }
    }

    public static List<View> collectContentTargets(View view, List<View> out) {
        return collectTargets(view, out, true);
    }

    public static List<View> collectTargets(View view, List<View> out, boolean belowBarOnly) {
        if (out.size() >= MAX_REDIRECT_CANDIDATES) {
            return out;
        }
        try {
            if (isActionable(view) && (!belowBarOnly || isBelowTopBar(view))) {
                out.add(view);
                if (out.size() >= MAX_REDIRECT_CANDIDATES) {
                    return out;
                }
            }
            if (view instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) view;
                int childCount = group.getChildCount();
                for (int i = 0; i < childCount; i++) {
                    View child = group.getChildAt(i);
                    collectTargets(child, out, belowBarOnly);
                    if (out.size() >= MAX_REDIRECT_CANDIDATES) {
                        return out;
                    }
                }
            }
        } catch (Throwable t) {
        }
        return out;
    }

    public static View scanContent(View view) {
        try {
            if (isActionable(view) && isBelowTopBar(view)) {
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
            List<View> targets = new ArrayList<View>();
            collectContentTargets(decor, targets);
            for (View target : targets) {
                if (target.isAttachedToWindow() && target.isShown()
                        && target.requestFocus() && target.hasFocus()) {
                    return true;
                }
            }
            return false;
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
        makeFocusableRecursive(child);
        View view = parent;
        for (int i = 0; i < 8; i++) {
            if (view == null) {
                break;
            }
            makeFocusableRecursive(view);
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