// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;

import android.app.Activity;
import android.app.ActivityManager;
import android.content.Context;
import android.graphics.Rect;
import android.graphics.Outline;
import android.graphics.Path;
import android.os.Build;
import android.text.TextUtils;
import android.view.Display;
import android.view.View;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowManager;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.accessibility.AccessibilityNodeInfo.AccessibilityAction;
import java.util.Map;
import java.util.List;
import java.util.Collections;
import java.util.WeakHashMap;
import java.util.Locale;
import java.text.NumberFormat;

/** Display lookup without linking Android 11's Context.getDisplay on Android 10. */
public final class PlatformCompat {
    private static final Map<View, CharSequence> legacyStates = new WeakHashMap<>();
    private static final String STATE_DESCRIPTION_KEY = "androidx.view.accessibility.AccessibilityNodeInfoCompat.STATE_DESCRIPTION_KEY";
    public static Display getDisplay(Context context) {
        if (context == null) return null;
        if (Build.VERSION.SDK_INT >= 30) return Api30.getDisplay(context);
        // The Activity's manager belongs to its window/display. Looking up the
        // application's manager or assuming display 0 would misidentify the cluster.
        WindowManager manager = windowManager(context);
        return manager == null ? null : manager.getDefaultDisplay();
    }

    /** Android 10 has no WindowMetrics. Prefer the actual Activity window once laid out. */
    public static Rect getWindowBounds(Context context) {
        if (context == null) throw new IllegalArgumentException("Context is required");
        WindowManager manager = windowManager(context);
        if (manager == null) throw new IllegalStateException("WindowManager unavailable");
        if (Build.VERSION.SDK_INT >= 30) return Api30.getWindowBounds(manager);
        if (context instanceof Activity) {
            Window window = ((Activity) context).getWindow();
            View decor = window == null ? null : window.peekDecorView();
            if (decor != null && decor.isLaidOut() && decor.getWidth() > 0 && decor.getHeight() > 0) {
                int[] origin = new int[2];
                decor.getLocationOnScreen(origin);
                return new Rect(origin[0], origin[1], origin[0] + decor.getWidth(), origin[1] + decor.getHeight());
            }
        }
        return getWindowBounds(manager);
    }

    public static Rect getWindowBounds(WindowManager manager) {
        if (manager == null) throw new IllegalStateException("WindowManager unavailable");
        if (Build.VERSION.SDK_INT >= 30) return Api30.getWindowBounds(manager);
        Display display = manager.getDefaultDisplay();
        if (display == null) throw new IllegalStateException("Display unavailable");
        Rect bounds = new Rect();
        display.getRectSize(bounds);
        return bounds;
    }

    /** Native caller provides whole percentage points, e.g. 91, rather than a fraction. */
    public static String formatWholePercent(int value) {
        return NumberFormat.getPercentInstance(Locale.getDefault()).format(value / 100.0);
    }

    /** On API29 setConvexPath already supports arbitrary paths; setPath is its API30 rename. */
    @SuppressWarnings("deprecation")
    public static void setOutlinePath(Outline outline, Path path) {
        if (Build.VERSION.SDK_INT >= 30) Api30.setOutlinePath(outline, path);
        else outline.setConvexPath(path);
    }

    private static WindowManager windowManager(Context context) {
        return context instanceof Activity ? ((Activity) context).getWindowManager()
            : (WindowManager) context.getSystemService(Context.WINDOW_SERVICE);
    }

    public static String getAttributionTag(Context context) {
        return Build.VERSION.SDK_INT >= 30 ? Api30.getAttributionTag(context) : null;
    }

    public static int getExtensionVersion(int extension) {
        return Build.VERSION.SDK_INT >= 30 ? Api30.getExtensionVersion(extension) : 0;
    }

    public static void setDecorFitsSystemWindows(Window window, boolean fits) {
        if (Build.VERSION.SDK_INT >= 30) { Api30.setDecorFitsSystemWindows(window, fits); return; }
        View decor = window.getDecorView();
        // AndroidX WindowCompat's legacy layout flags. Preserve unrelated UI flags.
        final int layout = View.SYSTEM_UI_FLAG_LAYOUT_STABLE
            | View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION | View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN;
        int flags = decor.getSystemUiVisibility();
        decor.setSystemUiVisibility(fits ? flags & ~layout : flags | layout);
    }

    public static WindowInsets consumedWindowInsets() {
        if (Build.VERSION.SDK_INT >= 30) return Api30.consumedWindowInsets();
        return new WindowInsets.Builder().build().consumeDisplayCutout().consumeStableInsets().consumeSystemWindowInsets();
    }

    public static CharSequence getStateDescription(View view) {
        if (Build.VERSION.SDK_INT >= 30) return Api30.getStateDescription(view);
        if (view == null) throw new NullPointerException("View is required");
        synchronized (legacyStates) { return legacyStates.get(view); }
    }

    public static void setStateDescription(View view, CharSequence description) {
        if (Build.VERSION.SDK_INT >= 30) { Api30.setStateDescription(view, description); return; }
        if (view == null) throw new NullPointerException("View is required");
        synchronized (legacyStates) {
            if (TextUtils.equals(legacyStates.get(view), description)) return;
            if (description == null) legacyStates.remove(view); else legacyStates.put(view, description);
        }
        view.sendAccessibilityEvent(AccessibilityEvent.TYPE_WINDOW_CONTENT_CHANGED);
    }

    public static AccessibilityAction actionPressAndHold() {
        return Build.VERSION.SDK_INT >= 30 ? Api30.actionPressAndHold() : new AccessibilityAction(16908362, null);
    }

    public static AccessibilityAction actionImeEnter() {
        return Build.VERSION.SDK_INT >= 30 ? Api30.actionImeEnter() : new AccessibilityAction(16908372, null);
    }

    /** Android 10 provides no historical exit records; an empty result means unavailable. */
    public static List<?> getHistoricalProcessExitReasons(ActivityManager manager, String packageName, int pid, int maxNum) {
        return Build.VERSION.SDK_INT >= 30 ? Api30.getHistoricalProcessExitReasons(manager, packageName, pid, maxNum)
            : Collections.emptyList();
    }

    public static void setProcessStateSummary(ActivityManager manager, byte[] summary) {
        if (Build.VERSION.SDK_INT >= 30) Api30.setProcessStateSummary(manager, summary);
    }

    public static CharSequence getStateDescription(AccessibilityNodeInfo node) {
        return Build.VERSION.SDK_INT >= 30 ? Api30.getStateDescription(node)
            : node.getExtras().getCharSequence(STATE_DESCRIPTION_KEY);
    }

    public static void setStateDescription(AccessibilityNodeInfo node, CharSequence description) {
        if (Build.VERSION.SDK_INT >= 30) Api30.setStateDescription(node, description);
        else node.getExtras().putCharSequence(STATE_DESCRIPTION_KEY, description);
    }

    /** Compose layout-bounds debug overlay; API 29 has no View query, so it is off (stock debug default). */
    public static boolean isShowingLayoutBounds(View view) {
        if (Build.VERSION.SDK_INT >= 30) return Api30.isShowingLayoutBounds(view);
        if (view == null) throw new NullPointerException("View is required");
        return false;
    }

    /** Separate class keeps the newer method reference out of the API 29 path. */
    private static final class Api30 {
        static void setOutlinePath(Outline outline, Path path) { outline.setPath(path); }
        static Display getDisplay(Context context) { return context.getDisplay(); }
        static Rect getWindowBounds(WindowManager manager) { return manager.getCurrentWindowMetrics().getBounds(); }
        static String getAttributionTag(Context context) { return context.getAttributionTag(); }
        static int getExtensionVersion(int extension) { return android.os.ext.SdkExtensions.getExtensionVersion(extension); }
        static void setDecorFitsSystemWindows(Window window, boolean fits) { window.setDecorFitsSystemWindows(fits); }
        static WindowInsets consumedWindowInsets() { return WindowInsets.CONSUMED; }
        static CharSequence getStateDescription(View view) { return view.getStateDescription(); }
        static void setStateDescription(View view, CharSequence value) { view.setStateDescription(value); }
        static AccessibilityAction actionPressAndHold() { return AccessibilityAction.ACTION_PRESS_AND_HOLD; }
        static AccessibilityAction actionImeEnter() { return AccessibilityAction.ACTION_IME_ENTER; }
        static List<?> getHistoricalProcessExitReasons(ActivityManager manager, String packageName, int pid, int maxNum) {
            return manager.getHistoricalProcessExitReasons(packageName, pid, maxNum);
        }
        static void setProcessStateSummary(ActivityManager manager, byte[] summary) { manager.setProcessStateSummary(summary); }
        static CharSequence getStateDescription(AccessibilityNodeInfo node) { return node.getStateDescription(); }
        static void setStateDescription(AccessibilityNodeInfo node, CharSequence description) { node.setStateDescription(description); }
        static boolean isShowingLayoutBounds(View view) { return view.isShowingLayoutBounds(); }
    }

    private PlatformCompat() {}
}
