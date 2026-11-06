/*
 * LiquidMusic - Liquid Glass for Apple Music (patches compatible with Morphe).
 * Licensed under the GNU General Public License v3.0, see LICENSE.
 */
package app.liquidmusic.extension;

import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.HashMap;
import java.util.Map;

/**
 * Reads the state of BlurView v3 (eightbitlab.com.blurview) bundled in Apple Music.
 * <p>
 * Only {@code BlurView} and {@code BlurTarget} keep their names in the app (they are referenced
 * by layouts). Their fields are obfuscated, so they are found by type instead of by name:
 * <ul>
 *   <li>the blur controller is the only field of {@code BlurView} declared with an interface type;</li>
 *   <li>the controller keeps the {@code BlurTarget} it was set up with in a field of that type;</li>
 *   <li>{@code BlurTarget} records its children in an {@code android.graphics.RenderNode} field.</li>
 * </ul>
 * Every lookup returns null instead of throwing, so the caller falls back to the original blur.
 */
final class BlurViewAccess {

    static final String BLUR_TARGET_CLASS = "eightbitlab.com.blurview.BlurTarget";

    private static final Map<Class<?>, Field> CONTROLLER_FIELDS = new HashMap<>();
    private static final Map<Class<?>, Field> TARGET_FIELDS = new HashMap<>();
    private static final Map<Class<?>, Field> RENDER_NODE_FIELDS = new HashMap<>();

    private BlurViewAccess() {
    }

    /**
     * The BlurTarget the app set this BlurView up with, or the closest BlurTarget around it.
     */
    static View findBlurTarget(View blurView) {
        View target = targetFromController(blurView);
        return target != null ? target : targetFromHierarchy(blurView);
    }

    /**
     * The RenderNode that BlurTarget records its children into on every frame (Android 12+).
     */
    static Object recordedNodeOf(View blurTarget) {
        Field field = findField(RENDER_NODE_FIELDS, blurTarget.getClass(), "android.graphics.RenderNode", false);
        if (field == null) return null;
        try {
            return field.get(blurTarget);
        } catch (IllegalAccessException e) {
            return null;
        }
    }

    private static View targetFromController(View blurView) {
        try {
            Field controllerField = findField(CONTROLLER_FIELDS, blurView.getClass(), null, true);
            if (controllerField == null) return null;
            Object controller = controllerField.get(blurView);
            if (controller == null) return null;
            Field targetField = findField(TARGET_FIELDS, controller.getClass(), BLUR_TARGET_CLASS, false);
            if (targetField == null) return null;
            Object target = targetField.get(controller);
            return target instanceof View ? (View) target : null;
        } catch (Throwable t) {
            return null;
        }
    }

    private static View targetFromHierarchy(View blurView) {
        View child = blurView;
        ViewParent parent = blurView.getParent();
        while (parent instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) parent;
            for (int i = 0, count = group.getChildCount(); i < count; i++) {
                View sibling = group.getChildAt(i);
                if (sibling != child && BLUR_TARGET_CLASS.equals(sibling.getClass().getName())) {
                    return sibling;
                }
            }
            child = group;
            parent = group.getParent();
        }
        return null;
    }

    /**
     * Finds an instance field of {@code type} (by class name), or the first instance field
     * declared with an interface type when {@code anyInterface} is set. Framework classes are
     * skipped, so View's own private fields are never touched.
     */
    private static Field findField(Map<Class<?>, Field> cache, Class<?> owner, String type, boolean anyInterface) {
        if (cache.containsKey(owner)) return cache.get(owner);
        Field found = null;
        for (Class<?> c = owner; c != null && found == null; c = c.getSuperclass()) {
            String name = c.getName();
            if (name.startsWith("android.") || name.startsWith("java.")) break;
            for (Field field : c.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers())) continue;
                Class<?> fieldType = field.getType();
                boolean matches = anyInterface
                        ? fieldType.isInterface()
                        : fieldType.getName().equals(type);
                if (matches) {
                    field.setAccessible(true);
                    found = field;
                    break;
                }
            }
        }
        cache.put(owner, found);
        return found;
    }
}
