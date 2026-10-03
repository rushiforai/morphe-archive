/*
* Copyright 2026 De-Vanced
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
*/

package app.morphe.extension.facebook;

import android.app.Activity;
import android.graphics.Rect;
import android.os.Bundle;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.accessibility.AccessibilityNodeProvider;

import java.lang.reflect.Method;
import java.lang.reflect.Field;
import java.util.Locale;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * Repairs Facebook rows whose accessibility action exists but whose touch
 * action is not mounted after repackaging.
 */
public final class NavigationTouchRepair {
    private static final String TAG = "DeVancedNavigation";
    private static final int MAX_NODE_VISITS = 512;
    private static final ConcurrentHashMap<Class<?>, HostAccess> HOST_ACCESS =
            new ConcurrentHashMap<>();
    private static final ConcurrentHashMap<Class<?>, Field> CONTENT_FIELDS =
            new ConcurrentHashMap<>();
    private static final ConcurrentHashMap<Class<?>, TouchAccess> TOUCH_ACCESS =
            new ConcurrentHashMap<>();
    private static final AtomicBoolean TOUCH_ERROR_LOGGED =
            new AtomicBoolean();

    private static volatile long lastEventTime;
    private static volatile int lastActivityIdentity;

    private NavigationTouchRepair() {
    }

    public static boolean dispatchMountedTouch(
            View host,
            MotionEvent event
    ) {
        if (host == null || event == null || !host.isEnabled()) return false;
        try {
            HostAccess hostAccess = HOST_ACCESS.computeIfAbsent(
                    host.getClass(),
                    HostAccess::create
            );
            Object[] items = hostAccess.getMountedItems(host);
            if (items == null) return false;

            for (int index = items.length - 1; index >= 0; index--) {
                Object item = items[index];
                if (item == null) continue;
                Object content = getContent(item);
                if (content == null) continue;

                TouchAccess touchAccess = TOUCH_ACCESS.computeIfAbsent(
                        content.getClass(),
                        TouchAccess::create
                );
                if (!touchAccess.valid()) continue;
                if (!Boolean.TRUE.equals(
                        touchAccess.hitTest.invoke(content, event)
                )) {
                    continue;
                }
                if (Boolean.TRUE.equals(
                        touchAccess.dispatch.invoke(content, host, event)
                )) {
                    Log.i(
                            TAG,
                            "rendercore handled content=" +
                                    content.getClass().getName() +
                                    " action=" + event.getActionMasked()
                    );
                    return true;
                }
            }
        } catch (Throwable throwable) {
            if (TOUCH_ERROR_LOGGED.compareAndSet(false, true)) {
                Log.w(TAG, "RenderCore touch repair failed", throwable);
            }
        }
        return false;
    }

    private static Object getContent(Object item) throws Exception {
        Field field = CONTENT_FIELDS.computeIfAbsent(
                item.getClass(),
                NavigationTouchRepair::findContentField
        );
        return field == MissingFieldHolder.FIELD
                ? null
                : field.get(item);
    }

    private static Field findContentField(Class<?> type) {
        Class<?> current = type;
        while (current != null && current != Object.class) {
            try {
                Field field = current.getDeclaredField("A05");
                field.setAccessible(true);
                return field;
            } catch (NoSuchFieldException ignored) {
                current = current.getSuperclass();
            }
        }
        return MissingFieldHolder.FIELD;
    }

    public static void onDispatchTouchEvent(
            Activity activity,
            MotionEvent event
    ) {
        if (activity == null ||
                event == null ||
                event.getActionMasked() != MotionEvent.ACTION_UP) {
            return;
        }

        long eventTime = event.getEventTime();
        int activityIdentity = System.identityHashCode(activity);
        if (lastEventTime == eventTime &&
                lastActivityIdentity == activityIdentity) {
            return;
        }
        lastEventTime = eventTime;
        lastActivityIdentity = activityIdentity;

        View decor = activity.getWindow() == null
                ? null
                : activity.getWindow().getDecorView();
        if (decor == null) return;

        int rawX = Math.round(event.getRawX());
        int rawY = Math.round(event.getRawY());
        NodeTarget before = findTarget(decor, rawX, rawY, null);
        if (before == null) return;

        String label = before.label;
        boolean repairable = isRepairableLabel(label);
        before.recycle();
        if (!repairable) return;

        decor.postDelayed(() -> {
            if (activity.isFinishing() || activity.isDestroyed()) return;

            NodeTarget after = findTarget(decor, rawX, rawY, label);
            if (after == null) {
                // Native dispatch changed the surface, so it worked.
                return;
            }

            boolean clicked = after.performClick();
            Log.i(
                    TAG,
                    "fallback label=" + label +
                            " host=" + after.host.getClass().getName() +
                            " provider=" +
                            (after.provider == null
                                    ? "none"
                                    : after.provider.getClass().getName()) +
                            " result=" + clicked
            );
            after.recycle();
        }, 150L);
    }

    private static boolean isRepairableLabel(String label) {
        if (label == null) return false;
        String normalized = normalize(label);
        return normalized.contains(" followers") ||
                normalized.equals("dark mode") ||
                normalized.startsWith("dark mode,");
    }

    private static NodeTarget findTarget(
            View root,
            int rawX,
            int rawY,
            String expectedLabel
    ) {
        ScanState state = new ScanState(rawX, rawY, expectedLabel);
        scanView(root, state, 0);
        return state.best;
    }

    private static void scanView(
            View view,
            ScanState state,
            int depth
    ) {
        if (view == null ||
                depth > 40 ||
                state.visits >= MAX_NODE_VISITS ||
                view.getVisibility() != View.VISIBLE) {
            return;
        }
        Rect visibleBounds = new Rect();
        if (!view.getGlobalVisibleRect(visibleBounds) ||
                !visibleBounds.contains(state.rawX, state.rawY)) {
            return;
        }

        AccessibilityNodeInfo root = null;
        try {
            root = view.createAccessibilityNodeInfo();
            scanNode(
                    root,
                    view,
                    view.getAccessibilityNodeProvider(),
                    state,
                    0
            );
        } catch (Throwable ignored) {
        } finally {
            recycle(root);
        }

        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int index = 0;
                 index < group.getChildCount() &&
                         state.visits < MAX_NODE_VISITS;
                 index++) {
                scanView(group.getChildAt(index), state, depth + 1);
            }
        }
    }

    @SuppressWarnings("deprecation")
    private static void scanNode(
            AccessibilityNodeInfo node,
            View host,
            AccessibilityNodeProvider provider,
            ScanState state,
            int depth
    ) {
        if (node == null ||
                depth > 12 ||
                state.visits++ >= MAX_NODE_VISITS) {
            return;
        }

        String label = nodeLabel(node);
        Rect bounds = new Rect();
        node.getBoundsInScreen(bounds);
        boolean containsPoint =
                bounds.contains(state.rawX, state.rawY);
        if (node.isClickable() &&
                containsPoint &&
                labelMatches(label, state.expectedLabel)) {
            long area = Math.max(
                    1L,
                    (long) bounds.width() * bounds.height()
            );
            if (state.best == null || area < state.best.area) {
                if (state.best != null) state.best.recycle();
                state.best = new NodeTarget(
                        host,
                        provider,
                        AccessibilityNodeInfo.obtain(node),
                        label,
                        area
                );
            }
        }

        if (!containsPoint && !bounds.isEmpty()) return;

        int childCount = Math.min(node.getChildCount(), 64);
        for (int index = 0;
             index < childCount && state.visits < MAX_NODE_VISITS;
             index++) {
            AccessibilityNodeInfo child = null;
            try {
                child = node.getChild(index);
                scanNode(child, host, provider, state, depth + 1);
            } catch (Throwable ignored) {
            } finally {
                recycle(child);
            }
        }
    }

    private static boolean labelMatches(
            String label,
            String expectedLabel
    ) {
        if (label == null || label.isEmpty()) return false;
        return expectedLabel == null ||
                normalize(label).equals(normalize(expectedLabel));
    }

    private static String nodeLabel(AccessibilityNodeInfo node) {
        CharSequence description = node.getContentDescription();
        if (description != null && description.length() > 0) {
            return description.toString();
        }
        CharSequence text = node.getText();
        return text == null ? null : text.toString();
    }

    private static String normalize(String value) {
        return value
                .replace('\u00a0', ' ')
                .replaceAll("\\s+", " ")
                .trim()
                .toLowerCase(Locale.US);
    }

    private static void recycle(AccessibilityNodeInfo node) {
        if (node == null) return;
        try {
            node.recycle();
        } catch (Throwable ignored) {
        }
    }

    private static final class ScanState {
        final int rawX;
        final int rawY;
        final String expectedLabel;
        int visits;
        NodeTarget best;

        ScanState(int rawX, int rawY, String expectedLabel) {
            this.rawX = rawX;
            this.rawY = rawY;
            this.expectedLabel = expectedLabel;
        }
    }

    private static final class NodeTarget {
        final View host;
        final AccessibilityNodeProvider provider;
        final AccessibilityNodeInfo node;
        final String label;
        final long area;

        NodeTarget(
                View host,
                AccessibilityNodeProvider provider,
                AccessibilityNodeInfo node,
                String label,
                long area
        ) {
            this.host = host;
            this.provider = provider;
            this.node = node;
            this.label = label;
            this.area = area;
        }

        boolean performClick() {
            try {
                if (node.performAction(AccessibilityNodeInfo.ACTION_CLICK)) {
                    return true;
                }
            } catch (Throwable ignored) {
            }

            if (provider != null) {
                try {
                    Method method = AccessibilityNodeInfo.class
                            .getDeclaredMethod("getSourceNodeId");
                    method.setAccessible(true);
                    long sourceNodeId =
                            ((Number) method.invoke(node)).longValue();
                    if (provider.performAction(
                            (int) sourceNodeId,
                            AccessibilityNodeInfo.ACTION_CLICK,
                            (Bundle) null
                    )) {
                        return true;
                    }
                } catch (Throwable ignored) {
                }
            }

            try {
                return host.performClick();
            } catch (Throwable ignored) {
                return false;
            }
        }

        void recycle() {
            NavigationTouchRepair.recycle(node);
        }
    }

    private static final class HostAccess {
        private final Field mountedItems;

        private HostAccess(Field mountedItems) {
            this.mountedItems = mountedItems;
        }

        static HostAccess create(Class<?> type) {
            Class<?> current = type;
            while (current != null && current != View.class) {
                try {
                    Field field = current.getDeclaredField("A04");
                    if (field.getType().isArray()) {
                        field.setAccessible(true);
                        return new HostAccess(field);
                    }
                } catch (NoSuchFieldException ignored) {
                }
                current = current.getSuperclass();
            }
            return new HostAccess(null);
        }

        Object[] getMountedItems(View host) throws Exception {
            return mountedItems == null
                    ? null
                    : (Object[]) mountedItems.get(host);
        }
    }

    private static final class TouchAccess {
        private final Method hitTest;
        private final Method dispatch;

        private TouchAccess(Method hitTest, Method dispatch) {
            this.hitTest = hitTest;
            this.dispatch = dispatch;
        }

        static TouchAccess create(Class<?> type) {
            Method hitTest = null;
            Method dispatch = null;
            for (Method method : type.getMethods()) {
                Class<?>[] parameters = method.getParameterTypes();
                if ("EvM".equals(method.getName()) &&
                        parameters.length == 1 &&
                        MotionEvent.class.isAssignableFrom(parameters[0])) {
                    hitTest = method;
                } else if ("E8N".equals(method.getName()) &&
                        parameters.length == 2 &&
                        View.class.isAssignableFrom(parameters[0]) &&
                        MotionEvent.class.isAssignableFrom(parameters[1])) {
                    dispatch = method;
                }
            }
            return new TouchAccess(hitTest, dispatch);
        }

        boolean valid() {
            return hitTest != null && dispatch != null;
        }
    }

    private static final class MissingFieldHolder {
        private static final Field FIELD;

        static {
            try {
                FIELD = MissingFieldHolder.class.getDeclaredField("FIELD");
            } catch (NoSuchFieldException exception) {
                throw new ExceptionInInitializerError(exception);
            }
        }
    }
}
