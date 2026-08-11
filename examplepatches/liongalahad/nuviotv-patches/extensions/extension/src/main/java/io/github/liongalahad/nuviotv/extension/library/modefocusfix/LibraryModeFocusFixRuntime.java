package io.github.liongalahad.nuviotv.extension.library.modefocusfix;

import android.util.Log;
import android.view.KeyEvent;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.Map;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;

/** Runtime bridge for Nuvio's setting-free Library mode focus correction. */
public final class LibraryModeFocusFixRuntime {
    private static final String TAG = "MorpheLibraryFocus";

    private static final Map<Object, Object> MODE_FOCUS_REQUESTERS =
            Collections.synchronizedMap(new IdentityHashMap<>());
    private static volatile Object activeModeFocusRequester;
    private static volatile Constructor<?> focusRequesterConstructor;
    private static volatile Method focusRequesterModifierMethod;
    private static volatile Method focusPropertiesModifierMethod;
    private static volatile Method keyEventModifierMethod;
    private static volatile Method focusUpMethod;
    private static volatile Method requestFocusMethod;
    private static volatile Field nativeKeyEventField;

    private static final Function1<Object, Boolean> RESTORE_MODE_ON_UP_KEY = event -> {
        try {
            if (event == null) return false;
            Field field = nativeKeyEventField;
            if (field == null || !field.getDeclaringClass().isInstance(event)) {
                field = event.getClass().getDeclaredFields()[0];
                field.setAccessible(true);
                nativeKeyEventField = field;
            }
            KeyEvent keyEvent = (KeyEvent) field.get(event);
            if (keyEvent == null || keyEvent.getAction() != KeyEvent.ACTION_DOWN ||
                    keyEvent.getKeyCode() != KeyEvent.KEYCODE_DPAD_UP) return false;
            Object requester = activeModeFocusRequester;
            if (requester == null) return false;
            Method method = requestFocusMethod;
            if (method == null || !method.getParameterTypes()[0].isInstance(requester)) {
                method = requester.getClass().getDeclaredMethod("a", requester.getClass());
                method.setAccessible(true);
                requestFocusMethod = method;
            }
            boolean moved = Boolean.TRUE.equals(method.invoke(null, requester));
            return moved;
        } catch (Throwable error) {
            Log.e(TAG, "Unable to handle Library Up", error);
            return false;
        }
    };

    private static Unit setUpTarget(Object focusProperties, Object requester) {
        if (requester == null || focusProperties == null) return Unit.INSTANCE;
        try {
            Method setter = focusUpMethod;
            if (setter == null || !setter.getDeclaringClass().isInstance(focusProperties) ||
                    !setter.getParameterTypes()[0].isInstance(requester)) {
                setter = focusProperties.getClass().getMethod("a", requester.getClass());
                setter.setAccessible(true);
                focusUpMethod = setter;
            }
            setter.invoke(focusProperties, requester);
        } catch (Throwable error) {
            Log.e(TAG, "Unable to set the active Library mode as the Up target", error);
        }
        return Unit.INSTANCE;
    }

    private LibraryModeFocusFixRuntime() {}

    /** Records which native Library mode is currently selected. */
    public static void rememberActiveLibraryMode(Object mode) {
        if (mode == null) return;
        activeModeFocusRequester = MODE_FOCUS_REQUESTERS.get(mode);
    }

    /** Attaches one stable requester to every Library mode button. */
    public static Object attachModeFocusRequester(Object mode, boolean selected, Object modifier) {
        if (mode == null || modifier == null) return modifier;
        try {
            ClassLoader loader = modifier.getClass().getClassLoader();
            Object requester = MODE_FOCUS_REQUESTERS.get(mode);
            if (requester == null) {
                synchronized (MODE_FOCUS_REQUESTERS) {
                    requester = MODE_FOCUS_REQUESTERS.get(mode);
                    if (requester == null) {
                        Constructor<?> constructor = focusRequesterConstructor;
                        if (constructor == null) {
                            constructor = Class.forName("z1.y", false, loader).getDeclaredConstructor();
                            constructor.setAccessible(true);
                            focusRequesterConstructor = constructor;
                        }
                        requester = constructor.newInstance();
                        MODE_FOCUS_REQUESTERS.put(mode, requester);
                    }
                }
            }
            if (selected) {
                activeModeFocusRequester = requester;
            }

            Method method = focusRequesterModifierMethod;
            if (method == null || !method.getParameterTypes()[0].isInstance(modifier) ||
                    !method.getParameterTypes()[1].isInstance(requester)) {
                Class<?> modifierType = Class.forName("u1.q", false, loader);
                Class<?> requesterType = Class.forName("z1.y", false, loader);
                Class<?> focusModifiers = Class.forName("z1.d", false, loader);
                method = focusModifiers.getDeclaredMethod("d", modifierType, requesterType);
                method.setAccessible(true);
                focusRequesterModifierMethod = method;
            }
            return method.invoke(null, modifier, requester);
        } catch (Throwable error) {
            Log.e(TAG, "Unable to attach a Library mode focus target", error);
            return modifier;
        }
    }

    /** Makes a native top filter return to the currently selected Library mode. */
    public static Object restoreActiveModeOnUp(Object modifier) {
        if (modifier == null) return null;
        try {
            Function1<Object, Unit> restoreModeOnUp =
                    focusProperties -> setUpTarget(focusProperties, activeModeFocusRequester);
            Method method = focusPropertiesModifierMethod;
            if (method == null || !method.getParameterTypes()[0].isInstance(modifier)) {
                ClassLoader loader = modifier.getClass().getClassLoader();
                Class<?> modifierType = Class.forName("u1.q", false, loader);
                Class<?> focusModifiers = Class.forName("z1.d", false, loader);
                method = focusModifiers.getDeclaredMethod("b", modifierType, Function1.class);
                method.setAccessible(true);
                focusPropertiesModifierMethod = method;
            }
            Object corrected = method.invoke(null, modifier, restoreModeOnUp);
            Method keyMethod = keyEventModifierMethod;
            if (keyMethod == null || !keyMethod.getParameterTypes()[0].isInstance(corrected)) {
                ClassLoader loader = modifier.getClass().getClassLoader();
                Class<?> modifierType = Class.forName("u1.q", false, loader);
                Class<?> keyModifiers = Class.forName("m2.d", false, loader);
                keyMethod = keyModifiers.getDeclaredMethod("e", modifierType, Function1.class);
                keyMethod.setAccessible(true);
                keyEventModifierMethod = keyMethod;
            }
            return keyMethod.invoke(null, corrected, RESTORE_MODE_ON_UP_KEY);
        } catch (Throwable error) {
            Log.e(TAG, "Unable to apply the Library mode focus correction", error);
            return modifier;
        }
    }
}
