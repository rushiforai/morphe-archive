package software.santodan.extension.nuviomenu;

import software.santodan.nuvio.NuvioNative;
import java.lang.reflect.*;
import java.util.*;
import static software.santodan.extension.nuviomenu.NuvioDateLabelStyle.*;

/** Reuses the reviewed native field, focus border and keyboard callbacks. */
final class NuvioLabelTextInput {
    private static Object value(Object object,String name) throws Exception { return field(object.getClass(),name).get(object); }
    static Constructor<?> nativeConstructor(ClassLoader loader, String reference) throws Exception {
        String parameters = reference.substring(reference.indexOf('(') + 1, reference.indexOf(')'));
        List<Class<?>> types = new ArrayList<>();
        for (int index = 0; index < parameters.length();) {
            char type = parameters.charAt(index++);
            if (type == 'L') {
                int end = parameters.indexOf(';', index);
                types.add(loader.loadClass(parameters.substring(index, end).replace('/', '.')));
                index = end + 1;
            } else if (type == 'I') types.add(int.class);
            else throw new IllegalArgumentException("Unsupported native constructor parameter: " + reference);
        }
        return loader.loadClass(referenceOwner(reference)).getDeclaredConstructor(types.toArray(new Class<?>[0]));
    }
    static void render(Object composer, Object text, Object focus, Object focused) throws Exception {
        ClassLoader loader = composer.getClass().getClassLoader();
        Object modifier = method(loader.loadClass("androidx.compose.foundation.layout.b"), "f", 2)
            .invoke(null, loader.loadClass(NuvioNative.EMPTY_MODIFIER_NAME).getField("b").get(null), 1f);
        Object changedFocus = nativeConstructor(loader, NuvioNative.REF_INPUT_FOCUS_INIT).newInstance(Integer.parseInt(NuvioNative.INPUT_FOCUS_BRANCH), focused);
        modifier = method(loader.loadClass(NuvioNative.FOCUS_MODIFIERS_NAME), "i", 2).invoke(null, modifier, changedFocus);
        Object colors = method(loader.loadClass(NuvioNative.POSTER_STYLE_NAME), NuvioNative.POSTER_COLORS_METHOD, 1).invoke(null, composer);
        long elevated = (Long)value(colors, "b");
        Object cardColors = method(loader.loadClass("y5.m"), "b", 5).invoke(null, elevated, elevated, composer, 0, 58);
        Object spacing = staticValue(loader, NuvioNative.NATIVE_SPACING_LOCAL_NAME, "a");
        Object stroke = method(loader.loadClass("x.m"), "a", 2).invoke(null, (Long)value(colors, "x"), (Float)value(spacing, "b"));
        Object focusRing = method(loader.loadClass(NuvioNative.POSTER_STYLE_NAME), NuvioNative.POSTER_FOCUS_METHOD, 1).invoke(null, composer);
        Object focusedStroke = method(focusRing.getClass(), "a", 2).invoke(focusRing, (Float)value(spacing, "c"), 1f);
        Object shape = method(loader.loadClass("k0.g"), "b", 1).invoke(null, 10f);
        Constructor<?> borderConstructor = nativeConstructor(loader, NuvioNative.REF_INPUT_BORDER_INIT);
        Object border = method(loader.loadClass("y5.m"), "a", 4).invoke(null, borderConstructor.newInstance(stroke, shape, 2),
            borderConstructor.newInstance(focusedStroke, shape, 2), composer, 4);
        Object cardShape = method(loader.loadClass("y5.m"), "e", 2).invoke(null, shape, 6);
        Object scale = method(loader.loadClass("y5.m"), "d", 2).invoke(null, 1f, 5);
        Object onClick = loader.loadClass(NuvioNative.INPUT_CLICK_NAME).getDeclaredConstructor(loader.loadClass(NuvioNative.FOCUS_REQUESTER_NAME), int.class).newInstance(focus, 0);
        Object keyboard = method(composer.getClass(), "j", 1).invoke(composer, staticValue(loader, "x2.l1", "q"));
        Object input = nativeConstructor(loader, NuvioNative.REF_INPUT_FIELD_INIT).newInstance(focus, keyboard, text, focused, 0);
        Object content = loader.loadClass(NuvioNative.COMPOSABLE_LAMBDA_NAME).getDeclaredConstructor(int.class, Object.class, boolean.class).newInstance(0x53494306, input, true);
        method(loader.loadClass("y5.h1"), "c", 13).invoke(null, onClick, modifier, null, cardShape, cardColors, scale, border,
            null, null, content, composer, 0, 388);
    }
}
