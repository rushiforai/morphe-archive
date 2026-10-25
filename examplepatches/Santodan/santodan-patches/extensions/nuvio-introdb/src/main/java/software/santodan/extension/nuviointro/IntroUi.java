package software.santodan.extension.nuviointro;

import software.santodan.nuvio.NuvioNative;

import java.lang.reflect.*;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

/** Uses the target APK's existing themed Compose controls, dialog and text editor. */
final class IntroUi {
    // Compose calls this bridge repeatedly while controls are visible.
    private static final Map<Class<?>, Map<String, Method>> methods = new ConcurrentHashMap<>();
    interface Callback { Object invoke(Object[] args) throws Exception; }
    interface Action { void run() throws Exception; }
    interface Content { void render(Object composer) throws Exception; }
    static Method method(Class<?> owner, String name, int count) throws Exception {
        Map<String, Method> cache = methods.computeIfAbsent(owner, ignored -> new ConcurrentHashMap<>());
        String key = name + ':' + count;
        Method cached = cache.get(key);
        if (cached != null) return cached;
        Method result = null;
        for (Method candidate : owner.getDeclaredMethods()) if (candidate.getName().equals(name) && candidate.getParameterCount() == count) {
            if (result != null) throw new NoSuchMethodException("Ambiguous " + owner.getName() + '.' + name);
            result = candidate;
        }
        if (result == null) throw new NoSuchMethodException(owner.getName() + '.' + name);
        result.setAccessible(true);
        Method previous = cache.putIfAbsent(key, result);
        return previous == null ? result : previous;
    }
    static Object field(Object value, String name) throws Exception {
        Field field = value.getClass().getDeclaredField(name); field.setAccessible(true); return field.get(value);
    }
    static Object constant(ClassLoader loader, String owner, String name) throws Exception {
        Field field = loader.loadClass(owner).getDeclaredField(name); field.setAccessible(true); return field.get(null);
    }
    static Object unit(ClassLoader loader) throws Exception { return loader.loadClass("kotlin.Unit").getField("INSTANCE").get(null); }
    static Object callback(ClassLoader loader, String type, Callback callback) throws Exception {
        return Proxy.newProxyInstance(loader, new Class<?>[]{loader.loadClass("kotlin.jvm.functions." + type)}, (p,m,a) -> {
            if (m.getName().equals("invoke")) return callback.invoke(a);
            if (m.getName().equals("hashCode")) return System.identityHashCode(p);
            if (m.getName().equals("equals")) return p == a[0];
            return "IntroDB callback";
        });
    }
    static Object click(ClassLoader loader, Action action) throws Exception {
        return callback(loader, "Function0", args -> { action.run(); return unit(loader); });
    }
    static Object content(ClassLoader loader, int key, Content content) throws Exception {
        return loader.loadClass(NuvioNative.COMPOSABLE_LAMBDA_NAME).getDeclaredConstructor(int.class, Object.class, boolean.class).newInstance(key,
            callback(loader, "Function3", args -> { content.render(args[1]); return unit(loader); }), true);
    }
    static Object state(ClassLoader loader, Object initial) throws Exception { return method(loader.loadClass(NuvioNative.COMPOSE_FACTORY_NAME), NuvioNative.STATE_FACTORY_METHOD, 1).invoke(null, initial); }
    static Object get(Object state) throws Exception { return method(state.getClass(), "getValue", 0).invoke(state); }
    static void set(Object state, Object value) throws Exception { method(state.getClass(), "setValue", 1).invoke(state, value); }
    static void label(Object composer, String text) throws Exception {
        ClassLoader loader = composer.getClass().getClassLoader();
        method(loader.loadClass(NuvioNative.SETTINGS_SECTION_NAME), "b", 6).invoke(null, text, loader.loadClass(NuvioNative.EMPTY_MODIFIER_NAME).getField("b").get(null), null, composer, 0, 6);
    }
    static void action(Object composer, String title, boolean enabled, Action action) throws Exception {
        ClassLoader loader = composer.getClass().getClassLoader();
        method(loader.loadClass(NuvioNative.SETTINGS_ROWS_NAME), "e", 5).invoke(null, null, content(loader, 0x53494301, nested ->
            method(loader.loadClass(NuvioNative.SETTINGS_ROWS_NAME), "d", 7).invoke(null, title, click(loader, action), false, enabled, nested, 0, 0)), composer, 0, 1);
    }
    static void row(Object composer, String title, String subtitle, String value, Action action) throws Exception {
        ClassLoader loader = composer.getClass().getClassLoader();
        method(loader.loadClass(NuvioNative.SETTINGS_ROWS_NAME), "a", 18).invoke(null, title, subtitle, value, click(loader, action),
            null, null, false, null, null, 0L, null, null, 0f, 0L, composer, 0, 0, 16368);
    }
    static void dialog(Object composer, String title, String subtitle, Action dismiss, Content content) throws Exception {
        ClassLoader loader = composer.getClass().getClassLoader();
        method(loader.loadClass(NuvioNative.LIBRARY_CONTENT_NAME), "z", 19).invoke(null, click(loader, dismiss), title, subtitle, 640f,
            0, false, false, null, null, 0f, 0f, 0f, 0f, null, content(loader, 0x53494302, content), composer, 0, 24576, 16336);
    }
    static void actions(Object composer, String submitTitle, boolean enabled, Action submit, String cancelTitle, Action cancel) throws Exception {
        ClassLoader loader = composer.getClass().getClassLoader();
        method(loader.loadClass(NuvioNative.SETTINGS_ROWS_NAME), "e", 5).invoke(null, null, content(loader, 0x53494307, nested -> {
            method(loader.loadClass(NuvioNative.SETTINGS_ROWS_NAME), "d", 7).invoke(null, submitTitle, click(loader, submit), true, enabled, nested, 0, 0);
            method(loader.loadClass(NuvioNative.SETTINGS_ROWS_NAME), "d", 7).invoke(null, cancelTitle, click(loader, cancel), false, true, nested, 0, 0);
        }), composer, 0, 1);
    }
    static void dropdown(Object composer, String selected, boolean expanded, boolean enabled,
            java.util.function.Consumer<Boolean> expand, java.util.function.Consumer<String> select) throws Exception {
        ClassLoader loader = composer.getClass().getClassLoader();
        Constructor<?> constructor = loader.loadClass(NuvioNative.DROPDOWN_OPTION_NAME).getDeclaredConstructor(String.class, String.class);
        List<Object> options = new ArrayList<>();
        for (String type : List.of("intro", "recap", "outro")) options.add(constructor.newInstance(type, type));
        method(loader.loadClass(NuvioNative.DROPDOWN_NAME), "b", 11).invoke(null, constant(loader, NuvioNative.EMPTY_MODIFIER_NAME, "b"), "Segment type", selected, selected,
            expanded && enabled, options,
            callback(loader, "Function1", args -> { if (enabled) expand.accept((Boolean)args[0]); return unit(loader); }),
            callback(loader, "Function1", args -> { if (enabled) select.accept((String)field(args[0], "b")); return unit(loader); }),
            !enabled, composer, 0);
    }
    static void editor(Object composer, Object text, Object focus, Object focused, Action save, Action clear, Action dismiss) throws Exception {
        ClassLoader loader = composer.getClass().getClassLoader();
        Object body = content(loader, 0x53494303, nested -> {
            animeInput(nested, text, focus, focused);
            method(loader.loadClass(NuvioNative.SETTINGS_ROWS_NAME), "e", 5).invoke(null, null, content(loader, 0x53494304, row -> {
                Object colors = method(loader.loadClass(NuvioNative.POSTER_IMAGE_NAME), "y", 1).invoke(null, row);
                long background = (Long)field(colors, "b"), card = (Long)field(colors, "c"), foreground = (Long)field(colors, "l");
                nativeButton(row, dismiss, background, foreground, constant(loader, NuvioNative.SETTINGS_BUTTON_LABELS_NAME, "a"));
                nativeButton(row, clear, background, foreground, constant(loader, NuvioNative.SETTINGS_BUTTON_LABELS_NAME, "b"));
                Object saveText = loader.loadClass(NuvioNative.INPUT_SAVE_LABEL_NAME).getDeclaredConstructor(loader.loadClass(NuvioNative.COMPOSE_STATE_VALUE_NAME), int.class)
                    .newInstance(state(loader, false), 0);
                Object saveContent = loader.loadClass(NuvioNative.COMPOSABLE_LAMBDA_NAME).getDeclaredConstructor(int.class, Object.class, boolean.class).newInstance(0x53494305, saveText, true);
                nativeButton(row, save, card, foreground, saveContent);
            }), nested, 0, 1);
        });
        method(loader.loadClass(NuvioNative.LIBRARY_CONTENT_NAME), "z", 19).invoke(null, click(loader, dismiss), "IntroDB API key", "Enter your IntroDB API key. Clear the field and Save to remove it.",
            700f, 0, false, false, null, null, 0f, 0f, 0f, 0f, null, body, composer, 0, 24576, 16368);
    }
    private static void nativeButton(Object composer, Action action, long background, long foreground, Object text) throws Exception {
        ClassLoader loader = composer.getClass().getClassLoader();
        Object colors = method(loader.loadClass("y5.f"), "b", 8).invoke(null, background, foreground, 0L, 0L, 0L, 0L, composer, 252);
        method(loader.loadClass("y5.g1"), "a", 13).invoke(null, click(loader, action), null, false, null, null, colors,
            null, null, text, composer, 0, 0, 3966);
    }
    /** Same native single-line Card, focused border, cursor and keyboard callbacks as Anime Skip. */
    private static void animeInput(Object composer, Object text, Object focus, Object focused) throws Exception {
        ClassLoader loader = composer.getClass().getClassLoader();
        Object modifier = method(loader.loadClass("androidx.compose.foundation.layout.b"), "f", 2)
            .invoke(null, loader.loadClass(NuvioNative.EMPTY_MODIFIER_NAME).getField("b").get(null), 1f);
        Object changedFocus = loader.loadClass(NuvioNative.INPUT_FOCUS_NAME).getDeclaredConstructor(int.class, loader.loadClass(NuvioNative.COMPOSE_MUTABLE_STATE_NAME)).newInstance(2, focused);
        modifier = method(loader.loadClass(NuvioNative.FOCUS_MODIFIERS_NAME), "i", 2).invoke(null, modifier, changedFocus);
        Object colors = method(loader.loadClass(NuvioNative.POSTER_IMAGE_NAME), "y", 1).invoke(null, composer);
        long elevated = (Long)field(colors, "b");
        Object cardColors = method(loader.loadClass("y5.m"), "b", 5).invoke(null, elevated, elevated, composer, 0, 58);
        Object spacing = constant(loader, NuvioNative.NATIVE_SPACING_LOCAL_NAME, "a");
        Object stroke = method(loader.loadClass("y.m"), "a", 2).invoke(null, (Long)field(colors, "x"), (Float)field(spacing, "b"));
        Object focusRing = method(loader.loadClass(NuvioNative.POSTER_IMAGE_NAME), "A", 1).invoke(null, composer);
        Object focusedStroke = method(focusRing.getClass(), "a", 2).invoke(focusRing, (Float)field(spacing, "c"), 1f);
        Object shape = method(loader.loadClass("l0.g"), "b", 1).invoke(null, 10f);
        Constructor<?> borderConstructor = loader.loadClass("y5.c").getDeclaredConstructor(loader.loadClass("y.u"), loader.loadClass("e2.w0"), int.class);
        Object border = method(loader.loadClass("y5.m"), "a", 4).invoke(null, borderConstructor.newInstance(stroke, shape, 2),
            borderConstructor.newInstance(focusedStroke, shape, 2), composer, 4);
        Object cardShape = method(loader.loadClass("y5.m"), "e", 2).invoke(null, shape, 6);
        Object scale = method(loader.loadClass("y5.m"), "d", 2).invoke(null, 1f, 5);
        Object onClick = loader.loadClass(NuvioNative.INPUT_CLICK_NAME).getDeclaredConstructor(loader.loadClass(NuvioNative.FOCUS_REQUESTER_NAME), int.class).newInstance(focus, 0);
        Object keyboard = method(composer.getClass(), "j", 1).invoke(composer, constant(loader, "y2.l1", "q"));
        Object input = loader.loadClass(NuvioNative.INPUT_FIELD_NAME).getDeclaredConstructor(loader.loadClass(NuvioNative.FOCUS_REQUESTER_NAME), loader.loadClass("y2.m2"),
            loader.loadClass(NuvioNative.COMPOSE_MUTABLE_STATE_NAME), loader.loadClass(NuvioNative.COMPOSE_MUTABLE_STATE_NAME), int.class).newInstance(focus, keyboard, text, focused, 0);
        Object content = loader.loadClass(NuvioNative.COMPOSABLE_LAMBDA_NAME).getDeclaredConstructor(int.class, Object.class, boolean.class).newInstance(0x53494306, input, true);
        method(loader.loadClass("y5.g1"), "c", 13).invoke(null, onClick, modifier, null, cardShape, cardColors, scale, border,
            null, null, content, composer, 0, 388);
    }
}
