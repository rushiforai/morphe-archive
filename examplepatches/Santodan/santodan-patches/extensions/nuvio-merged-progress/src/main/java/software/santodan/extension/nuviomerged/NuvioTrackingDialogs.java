package software.santodan.extension.nuviomerged;

import software.santodan.nuvio.NuvioNative;

import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.LinkedHashSet;
import java.util.function.Consumer;

/** Original beta.7 Compose controls, rendered inside the app's current theme. */
public final class NuvioTrackingDialogs {
    private NuvioTrackingDialogs() {}

    public static void picker(Object composer, String title, List<String> ids, List<String> labels,
            String selected, Consumer<String> select, Runnable dismiss) throws Exception {
        ClassLoader loader = composer.getClass().getClassLoader();
        var constructors = java.util.Arrays.stream(loader.loadClass(NuvioNative.SETTINGS_PICKER_NAME).getDeclaredConstructors())
            .filter(candidate -> candidate.getParameterCount() == 6).toArray(java.lang.reflect.Constructor<?>[]::new);
        if (constructors.length != 1) throw new IllegalStateException("Native picker option changed");
        var constructor = constructors[0];
        constructor.setAccessible(true);
        List<Object> options = new ArrayList<>();
        for (int index = 0; index < ids.size(); index++)
            options.add(constructor.newInstance(ids.get(index), labels.get(index), null, null, null, 28));
        method(loader.loadClass(NuvioNative.SETTINGS_ROWS_NAME), "j", 11).invoke(null, title, options, selected,
            callback(loader, "Function1", args -> { select.accept((String) args[0]); return unit(loader); }),
            click(loader, dismiss), null, 520f, 320f, composer, 0, 32);
    }

    public static void dialog(Object composer, String title, String subtitle, Runnable dismiss,
            Consumer<Object> render) throws Exception {
        ClassLoader loader = composer.getClass().getClassLoader();
        method(loader.loadClass(NuvioNative.LIBRARY_CONTENT_NAME), "z", 19).invoke(null,
            click(loader, dismiss), title, subtitle, 560f, 0, false, false, null, null,
            0f, 0f, 0f, 0f, null, content(loader, 0x534d4744, render), composer, 0, 24576, 16336);
    }

    public static void services(Object composer, List<String> ids, List<String> labels,
            List<String> selected, String main, Consumer<Set<String>> select, Runnable dismiss) throws Exception {
        ClassLoader loader = composer.getClass().getClassLoader();
        var constructors = java.util.Arrays.stream(loader.loadClass(NuvioNative.SETTINGS_PICKER_NAME).getDeclaredConstructors())
            .filter(candidate -> candidate.getParameterCount() == 6).toArray(java.lang.reflect.Constructor<?>[]::new);
        if (constructors.length != 1) throw new IllegalStateException("Native picker option changed");
        constructors[0].setAccessible(true);
        ArrayList<Object> options = new ArrayList<>();
        for (int index = 0; index < ids.size(); index++) if (!ids.get(index).equals(main))
            options.add(constructors[0].newInstance(ids.get(index), labels.get(index), null, null, null, 28));
        String mainLabel = labels.get(ids.indexOf(main));
        List<String> optional = new ArrayList<>(selected); optional.remove(main);
        method(loader.loadClass(NuvioNative.SETTINGS_ROWS_NAME), "g", 12).invoke(null,
            "Services to merge", options, optional,
            callback(loader, "Function1", args -> {
                Set<String> values = new LinkedHashSet<>();
                values.add(main);
                for (Object item : (List<?>) args[0]) if (ids.contains(item)) values.add((String) item);
                select.accept(values); return unit(loader);
            }), click(loader, dismiss), "Main service: " + mainLabel + " (always included). Only connected accounts are synced.",
            560f, 280f, null, composer, 0, 0);
    }

    public static void action(Object composer, String title, Runnable action) throws Exception {
        ClassLoader loader = composer.getClass().getClassLoader();
        method(loader.loadClass(NuvioNative.SETTINGS_ROWS_NAME), "e", 5).invoke(null, null,
            content(loader, 0x534d4741, nested -> {
                try { method(loader.loadClass(NuvioNative.SETTINGS_ROWS_NAME), "d", 7).invoke(null,
                    title, click(loader, action), false, true, nested, 0, 0); }
                catch (Exception error) { throw new IllegalStateException("Native dialog action failed", error); }
            }), composer, 0, 1);
    }

    public static void label(Object composer, String text) throws Exception {
        ClassLoader loader = composer.getClass().getClassLoader();
        method(loader.loadClass(NuvioNative.SETTINGS_SECTION_NAME), "b", 6).invoke(null, text, value(loader, NuvioNative.EMPTY_MODIFIER_NAME, "b"), null, composer, 0, 6);
    }

    /** A non-interactive bar built from the same theme colors, rounded shape and Box primitives. */
    public static void progress(Object composer, int step, int total) throws Exception {
        ClassLoader loader = composer.getClass().getClassLoader();
        Object colors = method(composer.getClass(), "j", 1).invoke(composer, value(loader, NuvioNative.NATIVE_COLOR_LOCAL_NAME, "a"));
        var accentField = colors.getClass().getDeclaredField("h");
        var trackField = colors.getClass().getDeclaredField("e");
        accentField.setAccessible(true); trackField.setAccessible(true);
        long accent = accentField.getLong(colors), track = trackField.getLong(colors);
        float fraction = Math.max(0f, Math.min(1f, step / (float) Math.max(1, total)));
        Object modifier = bar(loader, 1f, track);
        // beta.7's optimized BoxWithConstraints remembers its content using only the
        // track modifier. Replace that remembered scope when the captured fill changes.
        int fillKey = 31 * Float.floatToIntBits(fraction) + Long.hashCode(accent);
        method(composer.getClass(), "d0", 1).invoke(composer, fillKey);
        try {
            method(loader.loadClass("d0.b"), "a", 6).invoke(null, modifier, null,
                content(loader, 0x534d4742, nested -> {
                    if (fraction <= 0f) return;
                    try { method(loader.loadClass("d0.q"), "a", 3).invoke(null, bar(loader, fraction, accent), nested, 0); }
                    catch (Exception error) { throw new IllegalStateException("Native progress fill failed", error); }
                }), composer, 0, 2);
        } finally {
            method(composer.getClass(), "p", 1).invoke(composer, false);
        }
    }

    private static Object bar(ClassLoader loader, float fraction, long color) throws Exception {
        Class<?> size = loader.loadClass("androidx.compose.foundation.layout.b");
        Object modifier = method(size, "f", 2).invoke(null, value(loader, NuvioNative.EMPTY_MODIFIER_NAME, "b"), fraction);
        modifier = method(size, "h", 2).invoke(null, modifier, 6f);
        Object shape = method(loader.loadClass("k0.g"), "b", 1).invoke(null, 3f);
        return method(loader.loadClass("x.m"), "g", 3).invoke(null, modifier, color, shape);
    }

    private static Object content(ClassLoader loader, int key, Consumer<Object> render) throws Exception {
        return loader.loadClass(NuvioNative.COMPOSABLE_LAMBDA_NAME).getDeclaredConstructor(int.class, Object.class, boolean.class)
            .newInstance(key, callback(loader, "Function3", args -> { render.accept(args[1]); return unit(loader); }), true);
    }
    private static Object click(ClassLoader loader, Runnable action) throws Exception {
        return callback(loader, "Function0", args -> { action.run(); return unit(loader); });
    }
    private interface Callback { Object invoke(Object[] args) throws Exception; }
    private static Object callback(ClassLoader loader, String function, Callback action) throws Exception {
        return Proxy.newProxyInstance(loader, new Class<?>[]{loader.loadClass("kotlin.jvm.functions." + function)}, (proxy, method, args) -> {
            if (method.getName().equals("invoke")) return action.invoke(args);
            if (method.getName().equals("hashCode")) return System.identityHashCode(proxy);
            if (method.getName().equals("equals")) return proxy == args[0];
            return "SantodanTrackingDialogCallback";
        });
    }
    private static Object unit(ClassLoader loader) throws Exception {
        return loader.loadClass("kotlin.Unit").getField("INSTANCE").get(null);
    }
    private static Object value(ClassLoader loader, String owner, String name) throws Exception {
        var field = loader.loadClass(owner).getDeclaredField(name); field.setAccessible(true); return field.get(null);
    }
    private static Method method(Class<?> owner, String name, int count) throws Exception {
        List<Method> matches = new ArrayList<>();
        for (Method candidate : owner.getDeclaredMethods())
            if (candidate.getName().equals(name) && candidate.getParameterCount() == count) matches.add(candidate);
        if (matches.size() != 1) throw new NoSuchMethodException(owner.getName() + '.' + name + '/' + count);
        Method result = matches.get(0); result.setAccessible(true); return result;
    }
}
