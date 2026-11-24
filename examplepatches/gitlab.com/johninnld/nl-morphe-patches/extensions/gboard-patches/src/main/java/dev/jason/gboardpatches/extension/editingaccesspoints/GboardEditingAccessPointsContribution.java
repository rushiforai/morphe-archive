package dev.jason.gboardpatches.extension.editingaccesspoints;

import android.content.Context;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.function.Predicate;

/** Four normal draggable APs, sharing the existing catalog/controller hook pair. */
public final class GboardEditingAccessPointsContribution {
    public static final GboardEditingAccessPointsContribution INSTANCE =
            new GboardEditingAccessPointsContribution();
    private static volatile Handles handles;

    private GboardEditingAccessPointsContribution() {}

    public Object extendOrderCatalog(Context context, Object original) {
        try {
            if (!(original instanceof Collection<?> stock)) return original;
            prepare(context.getClassLoader());
            List<String> result = extend(stock,
                    action -> GboardEditingAccessPointsRuntime.enabled(context, action));
            Class<?> catalog = Class.forName("auco", false, original.getClass().getClassLoader());
            Method copy = catalog.getDeclaredMethod("n", Collection.class);
            copy.setAccessible(true);
            return copy.invoke(null, result);
        } catch (Throwable ignored) {
            return original;
        }
    }

    static List<String> extend(Collection<?> stock, Predicate<EditorAction> enabled) {
        List<String> result = new ArrayList<>();
        if (stock != null) {
            for (Object value : stock) {
                if (value instanceof String token && !result.contains(token)) result.add(token);
            }
        }
        for (EditorAction action : EditorAction.values()) {
            if (enabled.test(action) && !result.contains(action.token)) result.add(action.token);
        }
        return result;
    }

    public static synchronized void prepare(ClassLoader loader) throws ReflectiveOperationException {
        if (handles == null || handles.loader != loader) handles = new Handles(loader);
    }

    public void register(Object controller, Context context) throws Throwable {
        if (controller == null || context == null) return;
        prepare(controller.getClass().getClassLoader());
        Handles binding = handles;
        for (EditorAction action : EditorAction.values()) {
            if (GboardEditingAccessPointsRuntime.enabled(context, action)) {
                int icon = icon(action);
                // Reject missing/wrong resource types before admitting the descriptor.
                if (!"drawable".equals(context.getResources().getResourceTypeName(icon))) continue;
                String label = label(action);
                binding.register(controller, action, icon, label,
                        () -> GboardEditingAccessPointsRuntime.click(action));
            }
        }
    }

    // Gboard 18.8.0.1022711984-beta drawables, all theme-tinted like stock Access Point icons.
    // Copy/Cut/Paste are the stock editing-panel icons (layouts 0x7f0e0147/0x7f0e0148/0x7f0e014c,
    // labels "Copy"/"Cut"/"Paste"); Select All uses the panel's "Select" icon (layout 0x7f0e014f),
    // since 18.8 ships no tinted select-all drawable. The previous ids came from an older build.
    static int icon(EditorAction action) {
        return switch (action) {
            case SELECT_ALL -> 0x7f0804d1;
            case COPY -> 0x7f080435;
            case CUT -> 0x7f080436;
            case PASTE -> 0x7f080438;
        };
    }

    // Access Menu labels stay English regardless of the target Context locale.
    static String label(EditorAction action) {
        return switch (action) {
            case SELECT_ALL -> "Select All";
            case COPY -> "Copy";
            case CUT -> "Cut";
            case PASTE -> "Paste";
        };
    }

    static final class Handles {
        final ClassLoader loader;
        final Method factory, token, icon, runnable, build, register;
        final Field title;

        Handles(ClassLoader loader) throws ReflectiveOperationException {
            this.loader = loader;
            // 18.8.0 API: AccessPoint.m() is the static factory (returns the abstract builder),
            // the concrete AutoValue builder declares q(String)/l(int)/a():AccessPoint,
            // the click action setter is the base-class v(Runnable), and the label is field d.
            Class<?> descriptor = Class.forName("aadr", false, loader);
            Class<?> builder = Class.forName("aaej", false, loader);
            Class<?> builderBase = Class.forName("aadm", false, loader);
            Class<?> controller = Class.forName("aajh", false, loader);
            factory = method(descriptor, "m", builderBase, true);
            token = method(builder, "q", void.class, false, String.class);
            icon = method(builder, "l", void.class, false, int.class);
            runnable = method(builderBase, "v", void.class, false, Runnable.class);
            // aadm.b() copies the action set (including the v(Runnable) PRESS action) into the
            // descriptor before calling a(); calling aaej.a() directly builds a button that
            // ignores taps. Stock 18.8 access points (e.g. kej) build through b().
            build = method(builderBase, "b", descriptor, false);
            register = method(controller, "g", void.class, false, descriptor, boolean.class);
            title = field(builder, "d");
        }

        void register(Object controller, EditorAction action, int iconId,
                String text, Runnable callback) throws ReflectiveOperationException {
            Object builder = factory.invoke(null);
            token.invoke(builder, action.token);
            icon.invoke(builder, iconId);
            title.set(builder, text);
            runnable.invoke(builder, callback);
            register.invoke(controller, build.invoke(builder), false);
        }

        private static Field field(Class<?> owner, String name) throws ReflectiveOperationException {
            Field field = owner.getDeclaredField(name);
            if (field.getType() != String.class || Modifier.isStatic(field.getModifiers())) {
                throw new NoSuchFieldException(name);
            }
            field.setAccessible(true);
            return field;
        }

        private static Method method(Class<?> owner, String name, Class<?> result,
                boolean isStatic, Class<?>... args) throws ReflectiveOperationException {
            Method method = owner.getDeclaredMethod(name, args);
            if (method.getReturnType() != result
                    || Modifier.isStatic(method.getModifiers()) != isStatic) {
                throw new NoSuchMethodException(name);
            }
            method.setAccessible(true);
            return method;
        }
    }
}
