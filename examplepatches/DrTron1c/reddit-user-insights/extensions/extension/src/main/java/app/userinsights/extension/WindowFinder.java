package app.userinsights.extension;

import android.app.Activity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

/**
 * Finds the window the user is looking at. Reddit shows some screens (such as a post with its
 * comments) in their own window above the activity, like a dialog or a sheet. The pills must be
 * drawn in that window, or they would be hidden underneath it.
 */
final class WindowFinder {
    private static Object windowManagerGlobal;
    private static Field rootViewsField;
    private static boolean rootViewsUnavailable;

    private WindowFinder() {
    }

    /** The root view of the focused window of this app, or the activity's own if unsure. */
    static ViewGroup targetHost(Activity activity) {
        Window activityWindow = activity.getWindow();
        View decor = activityWindow == null ? null : activityWindow.getDecorView();
        ViewGroup fallback = decor instanceof ViewGroup ? (ViewGroup) decor : null;
        if (decor != null && decor.hasWindowFocus()) {
            return fallback;
        }

        List<View> roots = rootViews();
        for (int i = roots.size() - 1; i >= 0; i--) {
            View root = roots.get(i);
            if (!(root instanceof ViewGroup) || !root.isAttachedToWindow()
                    || root.getVisibility() != View.VISIBLE || !root.hasWindowFocus()) {
                continue;
            }
            ViewGroup.LayoutParams params = root.getLayoutParams();
            if (params instanceof WindowManager.LayoutParams) {
                int type = ((WindowManager.LayoutParams) params).type;
                // Activity and dialog windows only; skip popups, toasts and system windows.
                if (type < WindowManager.LayoutParams.FIRST_APPLICATION_WINDOW
                        || type > WindowManager.LayoutParams.LAST_APPLICATION_WINDOW) {
                    continue;
                }
            }
            if (root.getWidth() <= 0 || root.getHeight() <= 0) {
                continue;
            }
            return (ViewGroup) root;
        }
        return fallback;
    }

    /** The Window of a root view (for watching its touches), or null. */
    static Window windowOf(Activity activity, View root) {
        Window activityWindow = activity.getWindow();
        if (activityWindow != null && activityWindow.getDecorView() == root) {
            return activityWindow;
        }
        try {
            for (Class<?> type = root.getClass(); type != null && type != View.class; type = type.getSuperclass()) {
                try {
                    Field field = type.getDeclaredField("mWindow");
                    field.setAccessible(true);
                    Object window = field.get(root);
                    if (window instanceof Window) {
                        return (Window) window;
                    }
                } catch (NoSuchFieldException ignored) {
                    // Try the superclass.
                }
            }
        } catch (Throwable ignored) {
            // Not available on this Android version.
        }
        return null;
    }

    @SuppressWarnings("unchecked")
    private static List<View> rootViews() {
        if (rootViewsUnavailable) {
            return new ArrayList<>();
        }
        try {
            if (rootViewsField == null) {
                Class<?> globalClass = Class.forName("android.view.WindowManagerGlobal");
                Method getInstance = globalClass.getMethod("getInstance");
                windowManagerGlobal = getInstance.invoke(null);
                rootViewsField = globalClass.getDeclaredField("mViews");
                rootViewsField.setAccessible(true);
            }
            Object views = rootViewsField.get(windowManagerGlobal);
            if (views instanceof List) {
                return new ArrayList<>((List<View>) views);
            }
        } catch (Throwable t) {
            rootViewsUnavailable = true;
        }
        return new ArrayList<>();
    }
}
