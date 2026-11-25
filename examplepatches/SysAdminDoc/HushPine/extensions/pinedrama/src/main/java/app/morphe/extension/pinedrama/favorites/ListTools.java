/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.pinedrama.favorites;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.Rect;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.Window;

import app.morphe.extension.pinedrama.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.diagnostics.HookStatus;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Issue #11: the lists on the profile (History and Favorites, and their Dramas and Posts tabs).
 *
 * <p>Tapping the tab you're already on takes the list under it back to its first row, and a
 * search bar above the list finds a title anywhere in it ({@link ListSearch}).
 *
 * <p>Each of these pages hands its list to one small refresh gate as it's built, which is where
 * the patch calls {@link #attach}. The My list bottom tab some accounts get builds its History and
 * Favorites pages without that gate, and those call {@link #attach} each time they come into view. The tabs themselves are two different widgets on the two pages
 * and get renamed on every PineDrama build, so a tap is recognized by what it lands on instead:
 * a selected, clickable view sitting in a row of other clickable views, above a list this class
 * knows. Taps are watched from the window, the one place every touch passes through, and only
 * watched: each one still reaches PineDrama exactly as it would have.
 */
public final class ListTools {
    /** The Hook status family this reports under. */
    static final String FAMILY = "list tools";
    /** How far a tab's row can sit above the tab itself. */
    private static final int MAX_ROW_LEVELS = 3;
    /** How far from the watched view to look for its list. */
    private static final int MAX_LIST_LEVELS = 6;
    private static final String RECYCLER_VIEW = "androidx.recyclerview.widget.RecyclerView";

    /** Every list a page has handed over, for as long as it exists. */
    private static final Map<View, Boolean> LISTS = Collections.synchronizedMap(new WeakHashMap<>());
    /** Windows already watched, so a page built twice doesn't stack a second watcher. */
    private static final Map<Window, Boolean> WATCHED = Collections.synchronizedMap(new WeakHashMap<>());

    private ListTools() {}

    /** A History or Favorites page is setting up {@code watched}, its list or something around it. */
    public static void attach(View watched) {
        try {
            HookStatus.bound(FAMILY, "list");
            View list = findList(watched);
            if (list == null) return;
            LISTS.put(list, Boolean.TRUE);
            // The page is built before it joins the screen, and both the window and the row the
            // search bar goes in are only there once it has.
            if (list.isAttachedToWindow()) {
                list.post(() -> settle(list));
            } else {
                list.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
                    @Override public void onViewAttachedToWindow(View view) {
                        view.removeOnAttachStateChangeListener(this);
                        view.post(() -> settle(view));
                    }

                    @Override public void onViewDetachedFromWindow(View view) {}
                });
            }
        } catch (Throwable error) {
            Logger.printException(() -> "List tools could not take the list", error);
        }
    }

    private static void settle(View list) {
        try {
            watch(activityOf(list.getContext()));
            if (Settings.LIST_SEARCH.get()) ListSearch.addBar(list);
        } catch (Throwable error) {
            Logger.printException(() -> "List tools could not set up the list", error);
        }
    }

    // Finding the list.

    static boolean isList(Object view) {
        for (Class<?> type = view.getClass(); type != null && type != Object.class; type = type.getSuperclass()) {
            if (RECYCLER_VIEW.equals(type.getName())) return true;
        }
        return false;
    }

    /** The list itself, inside the watched view or around it, or null. */
    static View findList(View watched) {
        if (watched == null) return null;
        View inside = listInside(watched, MAX_LIST_LEVELS);
        if (inside != null) return inside;
        ViewParent parent = watched.getParent();
        for (int level = 0; level < MAX_LIST_LEVELS && parent instanceof View; level++) {
            if (isList(parent)) return (View) parent;
            parent = parent.getParent();
        }
        return null;
    }

    private static View listInside(View view, int depth) {
        if (isList(view)) return view;
        if (depth == 0 || !(view instanceof ViewGroup)) return null;
        ViewGroup group = (ViewGroup) view;
        for (int index = 0; index < group.getChildCount(); index++) {
            View found = listInside(group.getChildAt(index), depth - 1);
            if (found != null) return found;
        }
        return null;
    }

    /** The lists handed over so far that are still around. */
    static List<View> lists() {
        synchronized (LISTS) {
            return new ArrayList<>(LISTS.keySet());
        }
    }

    static Activity activityOf(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            context = ((ContextWrapper) context).getBaseContext();
        }
        return null;
    }

    // Watching taps.

    private static void watch(Activity activity) {
        if (activity == null) return;
        Window window = activity.getWindow();
        if (window == null || WATCHED.containsKey(window)) return;
        Window.Callback original = window.getCallback();
        if (original == null) return;
        TapWatcher watcher = new TapWatcher(window, original);
        window.setCallback((Window.Callback) Proxy.newProxyInstance(
                Window.Callback.class.getClassLoader(), new Class<?>[]{Window.Callback.class}, watcher));
        WATCHED.put(window, Boolean.TRUE);
        HookStatus.bound(FAMILY, "tab tap");
    }

    /** Passes every call through, and notes a tap that lands on the tab you're already on. */
    private static final class TapWatcher implements InvocationHandler {
        private final Window window;
        private final Window.Callback original;
        private View pressed;
        private float downX;
        private float downY;
        private long downAt;

        TapWatcher(Window window, Window.Callback original) {
            this.window = window;
            this.original = original;
        }

        @Override public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
            MotionEvent event = null;
            if ("dispatchTouchEvent".equals(method.getName()) && args != null && args.length == 1
                    && args[0] instanceof MotionEvent) {
                event = (MotionEvent) args[0];
                try {
                    before(event);
                } catch (Throwable error) {
                    pressed = null;
                    Logger.printException(() -> "List tools could not read a tap", error);
                }
            }
            try {
                return method.invoke(original, args);
            } catch (InvocationTargetException error) {
                throw error.getCause() == null ? error : error.getCause();
            }
        }

        private void before(MotionEvent event) {
            switch (event.getActionMasked()) {
                case MotionEvent.ACTION_DOWN: {
                    pressed = null;
                    if (!Settings.LIST_TAB_TO_TOP.get()) return;
                    View decor = window.peekDecorView();
                    if (decor == null) return;
                    View hit = clickableAt(decor, event.getRawX(), event.getRawY());
                    if (hit != null && hit.isSelected() && isTab(hit)) {
                        pressed = hit;
                        downX = event.getRawX();
                        downY = event.getRawY();
                        downAt = event.getEventTime();
                    }
                    return;
                }
                case MotionEvent.ACTION_MOVE: {
                    if (pressed != null && moved(event)) pressed = null;
                    return;
                }
                case MotionEvent.ACTION_UP: {
                    View tab = pressed;
                    pressed = null;
                    if (tab == null || moved(event)
                            || event.getEventTime() - downAt > ViewConfiguration.getLongPressTimeout()) {
                        return;
                    }
                    // After PineDrama has handled the tap: a tab you weren't on is selected by then
                    // only if this was it, and a tab you were on is still selected.
                    tab.post(() -> {
                        if (tab.isSelected() && tab.isShown()) toTop(tab);
                    });
                    return;
                }
                case MotionEvent.ACTION_CANCEL:
                    pressed = null;
                    return;
                default:
            }
        }

        private boolean moved(MotionEvent event) {
            int slop = ViewConfiguration.get(window.getContext()).getScaledTouchSlop();
            return Math.abs(event.getRawX() - downX) > slop || Math.abs(event.getRawY() - downY) > slop;
        }
    }

    /** The deepest clickable view on screen under the point, or null. */
    static View clickableAt(View view, float x, float y) {
        if (view.getVisibility() != View.VISIBLE || !contains(view, x, y)) return null;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int index = group.getChildCount() - 1; index >= 0; index--) {
                View hit = clickableAt(group.getChildAt(index), x, y);
                if (hit != null) return hit;
            }
        }
        return view.isClickable() && view.isEnabled() ? view : null;
    }

    private static boolean contains(View view, float x, float y) {
        int[] at = new int[2];
        view.getLocationOnScreen(at);
        return x >= at[0] && x < at[0] + view.getWidth() && y >= at[1] && y < at[1] + view.getHeight();
    }

    /** Whether the view sits in a row of at least two things to tap, the way a tab does. */
    static boolean isTab(View view) {
        ViewParent parent = view.getParent();
        for (int level = 0; level < MAX_ROW_LEVELS && parent instanceof ViewGroup; level++) {
            ViewGroup row = (ViewGroup) parent;
            int tappable = 0;
            for (int index = 0; index < row.getChildCount(); index++) {
                View child = row.getChildAt(index);
                if (child.getVisibility() == View.VISIBLE && hasClickable(child, 2)) tappable++;
            }
            if (tappable >= 2) return true;
            parent = row.getParent();
        }
        return false;
    }

    private static boolean hasClickable(View view, int depth) {
        if (view.isClickable()) return true;
        if (depth == 0 || !(view instanceof ViewGroup)) return false;
        ViewGroup group = (ViewGroup) view;
        for (int index = 0; index < group.getChildCount(); index++) {
            if (hasClickable(group.getChildAt(index), depth - 1)) return true;
        }
        return false;
    }

    /** Takes every known list on screen under the tab back to its first row. */
    static void toTop(View tab) {
        Rect tabRect = new Rect();
        if (!tab.getGlobalVisibleRect(tabRect)) return;
        int tolerance = Math.round(4 * tab.getResources().getDisplayMetrics().density);
        for (View list : lists()) {
            if (!list.isShown() || list.getRootView() != tab.getRootView()) continue;
            Rect listRect = new Rect();
            if (!list.getGlobalVisibleRect(listRect)) continue;
            if (listRect.top < tabRect.bottom - tolerance) continue;
            if (listRect.right <= tabRect.left || listRect.left >= tabRect.right) continue;
            if (!list.canScrollVertically(-1)) continue;
            scrollToTop(list);
            Logger.printDebug(() -> "List tools: the tab you're on took its list back to the top");
        }
    }

    static void scrollToTop(View list) {
        call(list, "stopScroll");
        call(list, "scrollToPosition", 0);
    }

    /** One of RecyclerView's public methods, which keep their names on every build. */
    static Object call(View list, String name, int... args) {
        try {
            Method method;
            if (args.length == 0) {
                method = list.getClass().getMethod(name);
                return method.invoke(list);
            }
            Class<?>[] types = new Class<?>[args.length];
            Object[] values = new Object[args.length];
            for (int index = 0; index < args.length; index++) {
                types[index] = int.class;
                values[index] = args[index];
            }
            method = list.getClass().getMethod(name, types);
            return method.invoke(list, values);
        } catch (Throwable error) {
            Logger.printDebug(() -> "List tools: the list has no " + name, error instanceof Exception ? (Exception) error : null);
            return null;
        }
    }

    /** The list's adapter position for one of its rows, or -1. */
    static int positionOf(View list, View row) {
        try {
            Object position = list.getClass().getMethod("getChildAdapterPosition", View.class).invoke(list, row);
            return position instanceof Integer ? (Integer) position : -1;
        } catch (Throwable error) {
            return -1;
        }
    }
}
