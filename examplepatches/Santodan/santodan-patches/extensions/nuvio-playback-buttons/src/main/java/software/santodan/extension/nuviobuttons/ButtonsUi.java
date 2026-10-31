package software.santodan.extension.nuviobuttons;

import software.santodan.nuvio.NuvioNative;

import java.lang.reflect.Proxy;
import java.util.*;

/** Original beta.7 picker and action controls; no dependency on another optional patch. */
final class ButtonsUi {
    interface Action { void run() throws Exception; }
    interface Select { void accept(String value) throws Exception; }
    interface Callback { Object invoke(Object[] args) throws Exception; }
    static Object unit(ClassLoader loader) throws Exception { return loader.loadClass("kotlin.Unit").getField("INSTANCE").get(null); }
    static Object callback(ClassLoader loader, String name, Callback action) throws Exception {
        return Proxy.newProxyInstance(loader, new Class<?>[]{loader.loadClass("kotlin.jvm.functions." + name)}, (proxy, called, args) -> {
            if (called.getName().equals("invoke")) return action.invoke(args);
            if (called.getName().equals("hashCode")) return System.identityHashCode(proxy);
            if (called.getName().equals("equals")) return proxy == args[0];
            return "SantodanPlaybackSettings";
        });
    }
    static void action(Object composer, String title, Action action) throws Exception {
        ClassLoader loader = composer.getClass().getClassLoader();
        Object content = loader.loadClass(NuvioNative.COMPOSABLE_LAMBDA_NAME).getDeclaredConstructor(int.class, Object.class, boolean.class).newInstance(
            0x53425501, callback(loader, "Function3", args -> {
                NuvioPlaybackButtons.method(loader.loadClass(NuvioNative.SETTINGS_ROWS_NAME), "d", 7).invoke(null, title,
                    callback(loader, "Function0", ignored -> { action.run(); return unit(loader); }), false, true, args[1], 0, 0);
                return unit(loader);
            }), true);
        NuvioPlaybackButtons.method(loader.loadClass(NuvioNative.SETTINGS_ROWS_NAME), "e", 5).invoke(null, null, content, composer, 0, 1);
    }
    static void picker(Object composer, String title, List<String> ids, List<String> labels, String selected,
            Select select, Action dismiss) throws Exception {
        ClassLoader loader = composer.getClass().getClassLoader();
        java.lang.reflect.Constructor<?> constructor = null;
        for (java.lang.reflect.Constructor<?> candidate : loader.loadClass(NuvioNative.SETTINGS_PICKER_NAME).getDeclaredConstructors()) {
            if (candidate.getParameterTypes().length != 6) continue;
            if (constructor != null) throw new IllegalStateException("Ambiguous picker option");
            constructor = candidate;
        }
        if (constructor == null) throw new IllegalStateException("Missing picker option constructor");
        constructor.setAccessible(true);
        List<Object> options = new ArrayList<>();
        for (int i = 0; i < ids.size(); i++) options.add(constructor.newInstance(ids.get(i), labels.get(i), null, null, null, 28));
        NuvioPlaybackButtons.method(loader.loadClass(NuvioNative.SETTINGS_ROWS_NAME), "j", 11).invoke(null, title, options, selected,
            callback(loader, "Function1", args -> { select.accept((String)args[0]); return unit(loader); }),
            callback(loader, "Function0", args -> { dismiss.run(); return unit(loader); }), null, 560f, 420f, composer, 0, 32);
    }
    interface Key { boolean press(String id, Object event, Object listState) throws Exception; }
    static void iconPicker(Object composer, String title, List<String> ids, List<String> labels,
            String focusId, String movingId, Key key, Select select, Action dismiss) throws Exception {
        ClassLoader loader = composer.getClass().getClassLoader();
        int initial = Math.max(0, ids.indexOf(focusId));
        Object body = loader.loadClass(NuvioNative.COMPOSABLE_LAMBDA_NAME).getDeclaredConstructor(int.class, Object.class, boolean.class).newInstance(
            0x53425502, callback(loader, "Function3", args -> {
                Object nested = args[1];
                Object focus;
                NuvioPlaybackButtons.method(nested.getClass(), "d0", 1).invoke(nested, 0x53425510);
                try {
                    focus = NuvioPlaybackButtons.method(nested.getClass(), "R", 0).invoke(nested);
                    java.lang.reflect.Field empty = loader.loadClass(NuvioNative.COMPOSE_EMPTY_NAME).getDeclaredField("a"); empty.setAccessible(true);
                    // h1.j.f is only the initializer: it writes the last-read slot itself.
                    // Calling it without R(), or when already remembered, corrupts adjacent slots.
                    if (focus == empty.get(null)) focus = NuvioPlaybackButtons.method(loader.loadClass(NuvioNative.FOCUS_INITIALIZER_NAME), NuvioNative.FOCUS_INITIALIZER_METHOD, 1).invoke(null, nested);
                } finally { NuvioPlaybackButtons.method(nested.getClass(), "p", 1).invoke(nested, false); }
                Object rowFocus = focus;
                Object state;
                NuvioPlaybackButtons.method(nested.getClass(), "d0", 1).invoke(nested, 0x53425511);
                try { state = NuvioPlaybackButtons.method(loader.loadClass(NuvioNative.LAZY_LIST_FACTORY_NAME), "b", 5).invoke(null, initial, 0, nested, 0, 2); }
                finally { NuvioPlaybackButtons.method(nested.getClass(), "p", 1).invoke(nested, false); }
                Object request = loader.loadClass(NuvioNative.FOCUS_EFFECT_NAME).getDeclaredConstructor(int.class, loader.loadClass(NuvioNative.FOCUS_REQUESTER_NAME),
                    loader.loadClass("kotlin.coroutines.Continuation")).newInstance(4, focus, null);
                NuvioPlaybackButtons.method(nested.getClass(), "d0", 1).invoke(nested, 0x53425512);
                try { NuvioPlaybackButtons.method(loader.loadClass(NuvioNative.COMPOSE_EFFECT_NAME), "d", 3).invoke(null, nested, focusId, request); }
                finally { NuvioPlaybackButtons.method(nested.getClass(), "p", 1).invoke(nested, false); }
                Object items = callback(loader, "Function1", scope -> {
                    Object content = loader.loadClass(NuvioNative.COMPOSABLE_LAMBDA_NAME).getDeclaredConstructor(int.class, Object.class, boolean.class).newInstance(
                        0x53425503, callback(loader, "Function4", item -> {
                            int index = ((Number)item[1]).intValue();
                            String id = ids.get(index);
                            Object rowComposer = item[2];
                            Object modifier = loader.loadClass(NuvioNative.EMPTY_MODIFIER_NAME).getField("b").get(null);
                            modifier = NuvioPlaybackButtons.method(loader.loadClass(NuvioNative.KEY_MODIFIERS_NAME), "e", 2).invoke(null, modifier,
                                callback(loader, "Function1", event -> {
                                    java.lang.reflect.Field nativeEvent = event[0].getClass().getDeclaredField("a");
                                    nativeEvent.setAccessible(true);
                                    return key.press(id, nativeEvent.get(event[0]), state);
                                }));
                            if (id.equals(focusId)) modifier = NuvioPlaybackButtons.method(loader.loadClass(NuvioNative.FOCUS_MODIFIERS_NAME), "d", 2).invoke(null, modifier, rowFocus);
                            NuvioPlaybackButtons.method(loader.loadClass(NuvioNative.SETTINGS_ROWS_NAME), "a", 18).invoke(null,
                                labels.get(index), null, null, callback(loader, "Function0", ignored -> { select.accept(id); return unit(loader); }),
                                modifier, null, true, null, null, 0L, ButtonsIcons.icon(loader, id), null, 0f, 0L, rowComposer, 0, 0, 15328);
                            return unit(loader);
                        }), true);
                    // Stable IDs keep the focused row and its native state attached to the button while moving.
                    NuvioPlaybackButtons.method(loader.loadClass(NuvioNative.LAZY_LIST_SCOPE_NAME), "q", 4).invoke(scope[0], ids.size(),
                        callback(loader, "Function1", index -> ids.get(((Number)index[0]).intValue())),
                        callback(loader, "Function1", index -> null), content);
                    return unit(loader);
                });
                Object modifier = loader.loadClass(NuvioNative.EMPTY_MODIFIER_NAME).getField("b").get(null);
                modifier = NuvioPlaybackButtons.method(loader.loadClass("androidx.compose.foundation.layout.b"), "i", 4)
                    .invoke(null, modifier, 0f, 360f, 1);
                Object padding = loader.loadClass("e0.o1").getDeclaredConstructor(float.class, float.class, float.class, float.class)
                    .newInstance(0f, 4f, 0f, 4f);
                Object spacing = NuvioPlaybackButtons.method(loader.loadClass("e0.i"), "g", 1).invoke(null, 8f);
                NuvioPlaybackButtons.method(loader.loadClass(NuvioNative.LAZY_LIST_NAME), NuvioNative.LAZY_LIST_METHOD, 12).invoke(null,
                    modifier, state, padding, spacing, null, null, true, null, items, nested, 0, 488);
                return unit(loader);
            }), true);
        NuvioPlaybackButtons.method(loader.loadClass(NuvioNative.LIBRARY_CONTENT_NAME), "z", 19).invoke(null,
            callback(loader, "Function0", args -> { dismiss.run(); return unit(loader); }), title,
            movingId.isEmpty() ? "Hold OK to move a button. Press OK for visibility and group." :
                "Up/Down to move within this group. OK to save; Back to cancel.", 640f,
            0, false, false, null, null, 0f, 0f, 16f, 8f, null, body, composer, 0, 24576, 10192);
    }
}
