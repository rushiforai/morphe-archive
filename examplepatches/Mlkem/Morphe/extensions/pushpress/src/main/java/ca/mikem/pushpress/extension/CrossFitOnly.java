package ca.mikem.pushpress.extension;

import android.app.Activity;
import android.graphics.Rect;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.accessibility.AccessibilityNodeProvider;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

/**
 * PushPress is a Flutter application and its Class type values are loaded from the API.
 * This helper enables Flutter semantics locally, watches only the Workouts/Class type control,
 * and taps the exact "CrossFit class" semantics node after the dropdown opens.
 */
@SuppressWarnings({"unused", "JavaReflectionMemberAccess"})
public final class CrossFitOnly {
    private static final String TAG = "PushPressCrossFitOnly";
    private static final String TARGET_TEXT = "crossfit class";
    private static final String WORKOUTS_TEXT = "workouts";
    private static final String CLASS_TYPE_TEXT = "class type";

    private static final long INSTALL_RETRY_MS = 250L;
    private static final long SCAN_INTERVAL_MS = 175L;
    private static final long WORKOUTS_GRACE_MS = 8_000L;
    private static final long ARMED_WINDOW_MS = 2_000L;
    private static final long TAP_COOLDOWN_MS = 900L;

    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private static WeakReference<Activity> activityRef = new WeakReference<>(null);
    private static WeakReference<View> flutterViewRef = new WeakReference<>(null);
    private static AccessibilityNodeProvider nodeProvider;

    private static boolean installed;
    private static boolean semanticsEnabled;
    private static long workoutsActiveUntil;
    private static long armedUntil;
    private static long lastTapAt;
    private static List<Rect> targetRectsBeforeTouch = Collections.emptyList();

    private CrossFitOnly() {
    }

    public static synchronized void install(Activity activity) {
        if (activity == null) return;

        activityRef = new WeakReference<>(activity);
        if (installed) return;
        installed = true;

        MAIN.post(INSTALL);
    }

    private static final Runnable INSTALL = new Runnable() {
        @Override
        public void run() {
            Activity activity = activityRef.get();
            if (!isActivityUsable(activity)) return;

            View root = activity.getWindow() == null
                    ? null
                    : activity.getWindow().getDecorView();
            View flutterView = findFlutterView(root);

            if (flutterView == null || !flutterView.isAttachedToWindow()) {
                MAIN.postDelayed(this, INSTALL_RETRY_MS);
                return;
            }

            flutterViewRef = new WeakReference<>(flutterView);
            enableFlutterSemantics(flutterView);
            nodeProvider = flutterView.getAccessibilityNodeProvider();

            flutterView.setOnTouchListener((view, event) -> {
                if (event == null) return false;

                if (event.getActionMasked() == MotionEvent.ACTION_DOWN) {
                    refreshWorkoutsState();
                    targetRectsBeforeTouch = findExactTextRects(TARGET_TEXT);
                } else if (event.getActionMasked() == MotionEvent.ACTION_UP) {
                    if (isWorkoutsContext()) {
                        armedUntil = SystemClock.uptimeMillis() + ARMED_WINDOW_MS;
                        MAIN.removeCallbacks(SCAN);
                        MAIN.postDelayed(SCAN, 60L);
                    }
                }

                // Do not consume the event; Flutter receives the original touch normally.
                return false;
            });

            Log.i(TAG, "Installed for PushPress Workouts/Class type");
            MAIN.post(SCAN);
        }
    };

    private static final Runnable SCAN = new Runnable() {
        @Override
        public void run() {
            Activity activity = activityRef.get();
            View flutterView = flutterViewRef.get();
            if (!isActivityUsable(activity) || flutterView == null) return;

            if (!semanticsEnabled) enableFlutterSemantics(flutterView);
            if (nodeProvider == null) nodeProvider = flutterView.getAccessibilityNodeProvider();

            refreshWorkoutsState();

            long now = SystemClock.uptimeMillis();
            if (now <= armedUntil && isWorkoutsContext() && now - lastTapAt >= TAP_COOLDOWN_MS) {
                List<Rect> currentTargets = findExactTextRects(TARGET_TEXT);
                Rect newTarget = findNewRect(currentTargets, targetRectsBeforeTouch);

                if (newTarget != null && tapScreenRect(flutterView, newTarget)) {
                    lastTapAt = now;
                    armedUntil = 0L;
                    targetRectsBeforeTouch = currentTargets;
                    Log.i(TAG, "Selected CrossFit class");
                }
            }

            MAIN.postDelayed(this, SCAN_INTERVAL_MS);
        }
    };

    private static void refreshWorkoutsState() {
        long now = SystemClock.uptimeMillis();

        // Preferred signal: selected Workouts navigation semantics.
        if (hasSelectedExactText(WORKOUTS_TEXT)) {
            workoutsActiveUntil = now + WORKOUTS_GRACE_MS;
            return;
        }

        // Fallback signal specific to the requested dropdown.
        if (hasTextContaining(CLASS_TYPE_TEXT)) {
            workoutsActiveUntil = now + WORKOUTS_GRACE_MS;
        }
    }

    private static boolean isWorkoutsContext() {
        return SystemClock.uptimeMillis() <= workoutsActiveUntil;
    }

    private static boolean hasSelectedExactText(String normalizedText) {
        for (AccessibilityNodeInfo node : findNodes(normalizedText)) {
            try {
                if (matchesExact(node, normalizedText) && node.isSelected()) return true;
            } finally {
                recycle(node);
            }
        }
        return false;
    }

    private static boolean hasTextContaining(String normalizedText) {
        for (AccessibilityNodeInfo node : findNodes(normalizedText)) {
            try {
                if (matchesContaining(node, normalizedText)) return true;
            } finally {
                recycle(node);
            }
        }
        return false;
    }

    private static List<Rect> findExactTextRects(String normalizedText) {
        List<Rect> result = new ArrayList<>();
        for (AccessibilityNodeInfo node : findNodes(normalizedText)) {
            try {
                if (!matchesExact(node, normalizedText)) continue;
                Rect rect = new Rect();
                node.getBoundsInScreen(rect);
                if (!rect.isEmpty()) result.add(rect);
            } finally {
                recycle(node);
            }
        }
        return result;
    }

    private static List<AccessibilityNodeInfo> findNodes(String text) {
        AccessibilityNodeProvider provider = nodeProvider;
        if (provider == null) return Collections.emptyList();

        try {
            List<AccessibilityNodeInfo> nodes =
                    provider.findAccessibilityNodeInfosByText(text, View.NO_ID);
            return nodes == null ? Collections.emptyList() : nodes;
        } catch (Throwable error) {
            Log.w(TAG, "Flutter semantics search failed", error);
            return Collections.emptyList();
        }
    }

    private static boolean matchesExact(AccessibilityNodeInfo node, String expected) {
        if (node == null) return false;
        return expected.equals(normalize(node.getText()))
                || expected.equals(normalize(node.getContentDescription()));
    }

    private static boolean matchesContaining(AccessibilityNodeInfo node, String expected) {
        if (node == null) return false;
        return normalize(node.getText()).contains(expected)
                || normalize(node.getContentDescription()).contains(expected);
    }

    private static String normalize(CharSequence text) {
        if (text == null) return "";
        return text.toString().trim().replaceAll("\\s+", " ").toLowerCase(Locale.ROOT);
    }

    private static Rect findNewRect(List<Rect> current, List<Rect> previous) {
        if (current == null || current.isEmpty()) return null;
        if (previous == null) previous = Collections.emptyList();

        // Dropdown routes normally add a second/new semantics rectangle while leaving
        // the closed field beneath it. Prefer a rectangle that did not exist at touch-down.
        for (Rect candidate : current) {
            if (!containsApproximate(previous, candidate)) return candidate;
        }

        // Some Flutter dropdown implementations replace the closed semantics node instead.
        // If its position changed materially, treat the replacement as the menu item.
        if (current.size() == 1 && previous.size() == 1) {
            Rect candidate = current.get(0);
            if (!approximatelyEqual(candidate, previous.get(0))) return candidate;
        }

        return null;
    }

    private static boolean containsApproximate(List<Rect> rects, Rect candidate) {
        for (Rect rect : rects) {
            if (approximatelyEqual(rect, candidate)) return true;
        }
        return false;
    }

    private static boolean approximatelyEqual(Rect a, Rect b) {
        if (a == null || b == null) return false;
        final int tolerance = 6;
        return Math.abs(a.left - b.left) <= tolerance
                && Math.abs(a.top - b.top) <= tolerance
                && Math.abs(a.right - b.right) <= tolerance
                && Math.abs(a.bottom - b.bottom) <= tolerance;
    }

    private static boolean tapScreenRect(View flutterView, Rect screenRect) {
        if (flutterView == null || screenRect == null || screenRect.isEmpty()) return false;

        int[] location = new int[2];
        flutterView.getLocationOnScreen(location);

        float x = screenRect.exactCenterX() - location[0];
        float y = screenRect.exactCenterY() - location[1];
        if (x < 0 || y < 0 || x > flutterView.getWidth() || y > flutterView.getHeight()) {
            return false;
        }

        long downTime = SystemClock.uptimeMillis();
        MotionEvent down = MotionEvent.obtain(
                downTime, downTime, MotionEvent.ACTION_DOWN, x, y, 0
        );
        MotionEvent up = MotionEvent.obtain(
                downTime, downTime + 35L, MotionEvent.ACTION_UP, x, y, 0
        );

        try {
            flutterView.dispatchTouchEvent(down);
            flutterView.dispatchTouchEvent(up);
            return true;
        } finally {
            down.recycle();
            up.recycle();
        }
    }

    private static View findFlutterView(View view) {
        if (view == null) return null;

        Class<?> type = view.getClass();
        if ("Mf.A".equals(type.getName()) || hasPublicNoArgMethod(type, "getAttachedFlutterEngine")) {
            return view;
        }

        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                View found = findFlutterView(group.getChildAt(i));
                if (found != null) return found;
            }
        }

        return null;
    }

    private static boolean hasPublicNoArgMethod(Class<?> type, String name) {
        try {
            type.getMethod(name);
            return true;
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static void enableFlutterSemantics(View flutterView) {
        try {
            Method getEngine = flutterView.getClass().getMethod("getAttachedFlutterEngine");
            Object engine = getEngine.invoke(flutterView);
            if (engine == null) return;

            Field flutterJniField = null;
            for (Field field : engine.getClass().getDeclaredFields()) {
                if ("io.flutter.embedding.engine.FlutterJNI".equals(field.getType().getName())) {
                    flutterJniField = field;
                    break;
                }
            }
            if (flutterJniField == null) return;

            flutterJniField.setAccessible(true);
            Object flutterJni = flutterJniField.get(engine);
            if (flutterJni == null) return;

            Method setSemanticsEnabled =
                    flutterJni.getClass().getMethod("setSemanticsEnabled", boolean.class);
            setSemanticsEnabled.invoke(flutterJni, true);
            semanticsEnabled = true;
        } catch (Throwable error) {
            Log.w(TAG, "Unable to enable Flutter semantics yet", error);
        }
    }

    private static boolean isActivityUsable(Activity activity) {
        if (activity == null || activity.isFinishing()) return false;
        return Build.VERSION.SDK_INT < Build.VERSION_CODES.JELLY_BEAN_MR1 || !activity.isDestroyed();
    }

    private static void recycle(AccessibilityNodeInfo node) {
        if (node == null) return;
        if (Build.VERSION.SDK_INT < 33) {
            try {
                node.recycle();
            } catch (Throwable ignored) {
                // recycle() became unnecessary/deprecated on newer Android versions.
            }
        }
    }
}
