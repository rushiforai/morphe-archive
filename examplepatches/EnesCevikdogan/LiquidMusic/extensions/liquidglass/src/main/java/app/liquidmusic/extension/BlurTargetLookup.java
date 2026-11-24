package app.liquidmusic.extension;

import android.graphics.RenderNode;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Safely locates the {@code BlurTarget} and its recorded {@link RenderNode} for a {@code BlurView}.
 * Every lookup is cached and null-safe so callers can fall back to Apple's original blur.
 */
final class BlurTargetLookup {

    private static final String BLUR_TARGET_CLASS = "eightbitlab.com.blurview.BlurTarget";

    private static final Map<Class<?>, Field> CONTROLLER_FIELD_CACHE = new ConcurrentHashMap<>();
    private static final Map<Class<?>, Field> TARGET_FIELD_CACHE = new ConcurrentHashMap<>();
    private static final Map<Class<?>, Field> RENDER_NODE_FIELD_CACHE = new ConcurrentHashMap<>();
    private static final Field SENTINEL_NONE;

    static {
        try {
            SENTINEL_NONE = BlurTargetLookup.class.getDeclaredField("SENTINEL_NONE");
        } catch (NoSuchFieldException e) {
            throw new AssertionError(e);
        }
    }

    private BlurTargetLookup() {
    }

    static View findBlurTarget(View blurView) {
        View target = fromController(blurView);
        return target != null ? target : fromHierarchy(blurView);
    }

    static RenderNode getRenderNode(View blurTarget) {
        if (blurTarget == null) return null;
        Field field = findFieldByType(
                RENDER_NODE_FIELD_CACHE,
                blurTarget.getClass(),
                "android.graphics.RenderNode",
                false
        );
        if (field == null) return null;
        try {
            Object value = field.get(blurTarget);
            return value instanceof RenderNode ? (RenderNode) value : null;
        } catch (Throwable t) {
            return null;
        }
    }

    /**
     * Computes (dx, dy) of {@code view} relative to {@code target} in window coordinates.
     */
    static boolean computeOffset(View view, View target, int[] outOffset) {
        if (view == null || target == null || outOffset == null || outOffset.length < 2) {
            return false;
        }
        int[] viewLoc = new int[2];
        int[] targetLoc = new int[2];
        view.getLocationInWindow(viewLoc);
        target.getLocationInWindow(targetLoc);
        outOffset[0] = viewLoc[0] - targetLoc[0];
        outOffset[1] = viewLoc[1] - targetLoc[1];
        return true;
    }

    private static View fromController(View blurView) {
        try {
            Field controllerField = findFieldByType(
                    CONTROLLER_FIELD_CACHE,
                    blurView.getClass(),
                    null,
                    true
            );
            if (controllerField == null) return null;
            Object controller = controllerField.get(blurView);
            if (controller == null) return null;

            Field targetField = findFieldByType(
                    TARGET_FIELD_CACHE,
                    controller.getClass(),
                    BLUR_TARGET_CLASS,
                    false
            );
            if (targetField == null) return null;
            Object target = targetField.get(controller);
            return target instanceof View ? (View) target : null;
        } catch (Throwable t) {
            return null;
        }
    }

    private static View fromHierarchy(View blurView) {
        View current = blurView;
        ViewParent parent = blurView.getParent();
        while (parent instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) parent;
            if (BLUR_TARGET_CLASS.equals(group.getClass().getName())) {
                return group;
            }
            for (int i = 0, count = group.getChildCount(); i < count; i++) {
                View sibling = group.getChildAt(i);
                if (sibling != current && BLUR_TARGET_CLASS.equals(sibling.getClass().getName())) {
                    return sibling;
                }
            }
            current = group;
            parent = group.getParent();
        }
        return null;
    }

    private static Field findFieldByType(
            Map<Class<?>, Field> cache,
            Class<?> owner,
            String exactTypeName,
            boolean interfaceMatch
    ) {
        Field cached = cache.get(owner);
        if (cached != null) {
            return cached == SENTINEL_NONE ? null : cached;
        }

        Class<?> cls = owner;
        while (cls != null && cls != Object.class) {
            for (Field f : cls.getDeclaredFields()) {
                if (Modifier.isStatic(f.getModifiers())) continue;
                Class<?> type = f.getType();
                boolean matches = interfaceMatch
                        ? type.isInterface()
                        : type.getName().equals(exactTypeName);
                if (matches) {
                    f.setAccessible(true);
                    cache.put(owner, f);
                    return f;
                }
            }
            cls = cls.getSuperclass();
        }

        cache.put(owner, SENTINEL_NONE);
        return null;
    }
}
