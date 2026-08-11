package io.github.liongalahad.nuviotv.extension.settings;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function3;

/** Shared renderer for every control placed inside a Morphe settings category. */
final class MorpheSettingsRows {
    private static final int NATIVE_CATEGORY_LIST_DEFAULT_MASK = 510 & ~16;

    private static volatile Method nativeCardMethod;
    private static volatile Method nativeSwitchMethod;
    private static volatile Method nativeCollapsibleSectionMethod;
    private static volatile Method nativeLazyColumnMethod;
    private static volatile Method nativeLazyItemMethod;
    private static volatile Method composableLambdaFactoryMethod;
    private static volatile Method mutableStateFactoryMethod;
    private static volatile Method composerShouldComposeMethod;
    private static volatile Method composerSkipMethod;
    private static volatile Object nativeCategoryArrangement;

    private MorpheSettingsRows() {}

    static boolean beginComposition(Object composer, Object flags) {
        int changedFlags = flags instanceof Number ? ((Number) flags).intValue() : 0;
        try {
            Method method = composerShouldComposeMethod;
            if (method == null) {
                method = composer.getClass().getDeclaredMethod("U", Integer.TYPE, Boolean.TYPE);
                method.setAccessible(true);
                composerShouldComposeMethod = method;
            }
            boolean compose = (Boolean) method.invoke(composer, changedFlags & 1, true);
            if (!compose) skipComposition(composer);
            return compose;
        } catch (ReflectiveOperationException error) {
            throw new IllegalStateException("Unable to enter the native settings composition", error);
        }
    }

    static void switchRow(
            Object modifier,
            Object composer,
            String title,
            String description,
            boolean selected,
            Function0<?> action
    ) {
        try {
            Method method = nativeSwitchMethod;
            if (method == null) {
                method = findNativeMethod(composer, true);
                nativeSwitchMethod = method;
            }
            if (method.getParameterCount() == 7) {
                method.invoke(null, title, description, selected, action, (Function0<Unit>) () -> Unit.INSTANCE,
                        composer, 0);
            } else {
                method.invoke(null, title, description, selected, action, modifier, null, true, composer, 0, 112);
            }
        } catch (ReflectiveOperationException error) {
            throw new IllegalStateException("Unable to render a native Morphe switch row", error);
        }
    }

    static void selectorRow(
            Object modifier,
            Object composer,
            String title,
            String value,
            Function0<?> action
    ) {
        try {
            Method method = nativeCardMethod;
            if (method == null) {
                method = findNativeMethod(composer, false);
                nativeCardMethod = method;
            }
            method.invoke(
                    null, title, value, null, action, modifier, null, false, null, null,
                    0L, null, null, 0.0f, 0L, composer, 0, 0, 0x3fe0
            );
        } catch (ReflectiveOperationException error) {
            throw new IllegalStateException("Unable to render a native Morphe selector row", error);
        }
    }

    static Object rememberBooleanState(Object composer, boolean initialValue) {
        try {
            Method readSlot = composer.getClass().getDeclaredMethod("R");
            readSlot.setAccessible(true);
            Object state = readSlot.invoke(composer);
            if (!isMutableState(state)) {
                Method factory = mutableStateFactoryMethod;
                if (factory == null) {
                    Class<?> stateHelpers = Class.forName("e1.j", false, composer.getClass().getClassLoader());
                    for (Method candidate : stateHelpers.getDeclaredMethods()) {
                        if (Modifier.isStatic(candidate.getModifiers()) &&
                                candidate.getParameterCount() == 1 &&
                                candidate.getParameterTypes()[0] == Object.class &&
                                candidate.getReturnType() != Void.TYPE) {
                            candidate.setAccessible(true);
                            factory = candidate;
                            break;
                        }
                    }
                    if (factory == null) throw new NoSuchMethodException("Compose mutable-state factory");
                    mutableStateFactoryMethod = factory;
                }
                state = factory.invoke(null, initialValue);
                Method writeSlot = composer.getClass().getDeclaredMethod("o0", Object.class);
                writeSlot.setAccessible(true);
                writeSlot.invoke(composer, state);
            }
            return state;
        } catch (ReflectiveOperationException error) {
            throw new IllegalStateException("Unable to remember Morphe section state", error);
        }
    }

    static Object rememberFocusRequester(Object composer) {
        try {
            Method readSlot = composer.getClass().getDeclaredMethod("R");
            readSlot.setAccessible(true);
            Object requester = readSlot.invoke(composer);
            if (requester == null || !"z1.y".equals(requester.getClass().getName())) {
                Class<?> requesterClass = Class.forName(
                        "z1.y", false, composer.getClass().getClassLoader()
                );
                requester = requesterClass.getDeclaredConstructor().newInstance();
                Method writeSlot = composer.getClass().getDeclaredMethod("o0", Object.class);
                writeSlot.setAccessible(true);
                writeSlot.invoke(composer, requester);
            }
            return requester;
        } catch (ReflectiveOperationException error) {
            throw new IllegalStateException("Unable to remember Morphe section focus", error);
        }
    }

    static boolean booleanStateValue(Object state) {
        try {
            Method getter = state.getClass().getMethod("getValue");
            getter.setAccessible(true);
            return Boolean.TRUE.equals(getter.invoke(state));
        } catch (ReflectiveOperationException error) {
            throw new IllegalStateException("Unable to read Morphe section state", error);
        }
    }

    static Function0<Unit> booleanStateToggle(Object state) {
        return () -> {
            try {
                Method getter = state.getClass().getMethod("getValue");
                Method setter = state.getClass().getMethod("setValue", Object.class);
                getter.setAccessible(true);
                setter.setAccessible(true);
                setter.invoke(state, !Boolean.TRUE.equals(getter.invoke(state)));
                return Unit.INSTANCE;
            } catch (ReflectiveOperationException error) {
                throw new IllegalStateException("Unable to toggle Morphe section state", error);
            }
        };
    }

    static void lazyColumn(Object modifier, Object composer, Function1<Object, Unit> content) {
        try {
            Method method = nativeLazyColumnMethod;
            if (method == null) {
                Class<?> verticalArrangementClass = Class.forName(
                        "c0.h", false, composer.getClass().getClassLoader()
                );
                for (String className : new String[]{"t6.a", "a.a"}) {
                    Class<?> lazyColumnClass;
                    try {
                        lazyColumnClass = Class.forName(
                                className, false, composer.getClass().getClassLoader()
                        );
                    } catch (ClassNotFoundException ignored) {
                        continue;
                    }
                    for (Method candidate : lazyColumnClass.getDeclaredMethods()) {
                        Class<?>[] parameters = candidate.getParameterTypes();
                        if (Modifier.isStatic(candidate.getModifiers()) &&
                                candidate.getReturnType() == Void.TYPE && parameters.length == 12 &&
                                parameters[3] == verticalArrangementClass &&
                                Function1.class.isAssignableFrom(parameters[8]) &&
                                parameters[10] == Integer.TYPE && parameters[11] == Integer.TYPE) {
                            candidate.setAccessible(true);
                            method = candidate;
                            break;
                        }
                    }
                    if (method != null) break;
                }
                if (method == null) throw new NoSuchMethodException("Native LazyColumn");
                nativeLazyColumnMethod = method;
            }
            Object arrangement = nativeCategoryArrangement(composer, method.getParameterTypes()[3]);
            // Nuvio's Layout Settings category list uses the medium spacing token as an
            // explicit vertical arrangement. Keep every other optional parameter native-defaulted.
            method.invoke(
                    null, modifier, null, null, arrangement, null, null, false, null,
                    content, composer, 0, NATIVE_CATEGORY_LIST_DEFAULT_MASK
            );
        } catch (ReflectiveOperationException error) {
            throw new IllegalStateException("Unable to render the native Morphe category list", error);
        }
    }

    static int categoryListDefaultMaskForTesting() {
        return NATIVE_CATEGORY_LIST_DEFAULT_MASK;
    }

    static void lazyItem(Object lazyListScope, Object key, Function3<Object, Object, Object, Unit> content) {
        try {
            Method method = nativeLazyItemMethod;
            if (method == null) {
                method = lazyListScope.getClass().getDeclaredMethod(
                        "o", Object.class, String.class, Function3.class
                );
                method.setAccessible(true);
                nativeLazyItemMethod = method;
            }
            method.invoke(lazyListScope, key, null, content);
        } catch (ReflectiveOperationException error) {
            throw new IllegalStateException("Unable to add a native Morphe category item", error);
        }
    }

    static void collapsibleSection(
            Object composer,
            String title,
            String description,
            boolean expanded,
            Function0<?> toggle,
            Object focusRequester,
            Function0<?> onFocused,
            Function3<Object, Object, Object, Unit> content
    ) {
        try {
            Method method = nativeCollapsibleSectionMethod;
            if (method == null) {
                for (String className : new String[]{"sa.v", "sa.u"}) {
                    Class<?> settingsClass;
                    try {
                        settingsClass = Class.forName(className, false, composer.getClass().getClassLoader());
                    } catch (ClassNotFoundException ignored) {
                        continue;
                    }
                    for (Method candidate : settingsClass.getDeclaredMethods()) {
                        Class<?>[] parameters = candidate.getParameterTypes();
                        if (Modifier.isStatic(candidate.getModifiers()) &&
                                candidate.getReturnType() == Void.TYPE && parameters.length == 9 &&
                                parameters[0] == String.class && parameters[1] == String.class &&
                                parameters[2] == Boolean.TYPE &&
                                Function0.class.isAssignableFrom(parameters[3]) &&
                                "z1.y".equals(parameters[4].getName()) &&
                                Function0.class.isAssignableFrom(parameters[5]) &&
                                Function3.class.isAssignableFrom(parameters[6]) &&
                                parameters[8] == Integer.TYPE) {
                            candidate.setAccessible(true);
                            method = candidate;
                            break;
                        }
                    }
                    if (method != null) break;
                }
                if (method == null) throw new NoSuchMethodException("Native CollapsibleSectionCard");
                nativeCollapsibleSectionMethod = method;
            }
            Object nativeContent = composableLambda(
                    composer,
                    title.hashCode() ^ 0x4d4f5250,
                    content
            );
            method.invoke(
                    null, title, description, expanded, toggle, focusRequester,
                    onFocused, nativeContent, composer, 0
            );
        } catch (ReflectiveOperationException error) {
            throw new IllegalStateException("Unable to render a native Morphe category", error);
        }
    }

    private static void skipComposition(Object composer) throws ReflectiveOperationException {
        Method method = composerSkipMethod;
        if (method == null) {
            method = composer.getClass().getDeclaredMethod("X");
            method.setAccessible(true);
            composerSkipMethod = method;
        }
        method.invoke(composer);
    }

    private static boolean isMutableState(Object candidate) {
        if (candidate == null) return false;
        try {
            candidate.getClass().getMethod("getValue");
            candidate.getClass().getMethod("setValue", Object.class);
            return true;
        } catch (NoSuchMethodException ignored) {
            return false;
        }
    }

    private static Object composableLambda(
            Object composer,
            int key,
            Function3<Object, Object, Object, Unit> content
    ) throws ReflectiveOperationException {
        Method method = composableLambdaFactoryMethod;
        if (method == null) {
            for (String className : new String[]{"o1.x", "o1.y"}) {
                Class<?> factoryClass;
                try {
                    factoryClass = Class.forName(
                            className, false, composer.getClass().getClassLoader()
                    );
                } catch (ClassNotFoundException ignored) {
                    continue;
                }
                for (Method candidate : factoryClass.getDeclaredMethods()) {
                    Class<?>[] parameters = candidate.getParameterTypes();
                    if (Modifier.isStatic(candidate.getModifiers()) &&
                            parameters.length == 3 && parameters[0] == Integer.TYPE &&
                            kotlin.Function.class.isAssignableFrom(parameters[1]) &&
                            Function3.class.isAssignableFrom(candidate.getReturnType())) {
                        candidate.setAccessible(true);
                        method = candidate;
                        break;
                    }
                }
                if (method != null) break;
            }
            if (method == null) throw new NoSuchMethodException("Native composable-lambda factory");
            composableLambdaFactoryMethod = method;
        }
        return method.invoke(null, key, content, composer);
    }

    private static Object nativeCategoryArrangement(Object composer, Class<?> expectedType)
            throws ReflectiveOperationException {
        Object cached = nativeCategoryArrangement;
        if (cached != null) return cached;

        ClassLoader loader = composer.getClass().getClassLoader();
        Class<?> spacingHolder = Class.forName("va.m0", false, loader);
        Class<?> spacingTokens = Class.forName("va.n0", false, loader);
        Field tokenField = null;
        for (Field candidate : spacingHolder.getDeclaredFields()) {
            if (Modifier.isStatic(candidate.getModifiers()) && candidate.getType() == spacingTokens) {
                candidate.setAccessible(true);
                tokenField = candidate;
                break;
            }
        }
        if (tokenField == null) throw new NoSuchFieldException("Native Nuvio spacing tokens");
        Object tokens = tokenField.get(null);
        Method mediumSpacing = spacingTokens.getDeclaredMethod("c");
        mediumSpacing.setAccessible(true);
        float spacing = ((Number) mediumSpacing.invoke(tokens)).floatValue();

        Method factory = null;
        for (String className : new String[]{"c0.i", "c0.j"}) {
            Class<?> arrangementHelpers;
            try {
                arrangementHelpers = Class.forName(className, false, loader);
            } catch (ClassNotFoundException ignored) {
                continue;
            }
            for (Method candidate : arrangementHelpers.getDeclaredMethods()) {
                Class<?>[] parameters = candidate.getParameterTypes();
                if (Modifier.isStatic(candidate.getModifiers()) && parameters.length == 1 &&
                        parameters[0] == Float.TYPE &&
                        expectedType.isAssignableFrom(candidate.getReturnType())) {
                    candidate.setAccessible(true);
                    factory = candidate;
                    break;
                }
            }
            if (factory != null) break;
        }
        if (factory == null) throw new NoSuchMethodException("Native spaced category arrangement");
        Object arrangement = factory.invoke(null, spacing);
        nativeCategoryArrangement = arrangement;
        return arrangement;
    }

    private static Method findNativeMethod(Object composer, boolean switchRow)
            throws ReflectiveOperationException {
        ClassLoader loader = composer.getClass().getClassLoader();
        String[] classNames = switchRow
                ? new String[]{"sa.v", "sa.ic"}
                : new String[]{"sa.nc", "sa.ic"};
        for (String className : classNames) {
            Class<?> settingsClass;
            try {
                settingsClass = Class.forName(className, false, loader);
            } catch (ClassNotFoundException ignored) {
                continue;
            }
            for (Method method : settingsClass.getDeclaredMethods()) {
                Class<?>[] parameters = method.getParameterTypes();
                if (!Modifier.isStatic(method.getModifiers()) || method.getReturnType() != Void.TYPE ||
                        parameters.length != (switchRow && className.equals("sa.v") ? 7 : switchRow ? 10 : 18) ||
                        parameters[0] != String.class || parameters[1] != String.class) {
                    continue;
                }
                if (switchRow) {
                    if (parameters[2] != Boolean.TYPE ||
                            !Function0.class.isAssignableFrom(parameters[3])) continue;
                } else if (parameters[2] != String.class ||
                        !Function0.class.isAssignableFrom(parameters[3])) {
                    continue;
                }
                method.setAccessible(true);
                return method;
            }
        }
        throw new NoSuchMethodException("Native Nuvio settings row method");
    }
}
