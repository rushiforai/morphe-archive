package io.github.liongalahad.nuviotv.extension.settings;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.IdentityHashMap;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;

/** Native Compose action used by Nuvio's own switch row. */
@SuppressWarnings({"unused", "JavaReflectionMemberAccess"})
public final class MorpheComposeToggleAction implements Function0<Unit> {
    private final Function0<?> originalAction;

    private MorpheComposeToggleAction(Function0<?> originalAction) {
        this.originalAction = originalAction;
    }

    public static Function0<Unit> wrap(Function0<?> originalAction) {
        return new MorpheComposeToggleAction(originalAction);
    }

    @Override
    public Unit invoke() {
        MorpheSettingsRuntime.toggleRemoveSdhEnabled();
        pulseCapturedComposeState(originalAction);
        return Unit.INSTANCE;
    }

    /**
     * The original Nuvio card action captures the pane's remembered Boolean state.
     * Pulse it back to its original value to invalidate the native Compose scope
     * without executing the original Experience-mode action or opening a dialog.
     */
    static void pulseCapturedComposeState(Object action) {
        pulseCapturedComposeState(action, 0, new IdentityHashMap<>());
    }

    private static boolean pulseCapturedComposeState(
            Object candidate,
            int depth,
            IdentityHashMap<Object, Boolean> visited
    ) {
        if (candidate == null || depth > 3 || visited.put(candidate, Boolean.TRUE) != null) {
            return false;
        }
        Method getValue = findMethod(candidate.getClass(), "getValue");
        Method setValue = findMethod(candidate.getClass(), "setValue", Object.class);
        if (getValue != null && setValue != null) {
            try {
                Object current = getValue.invoke(candidate);
                if (current instanceof Boolean) {
                    setValue.invoke(candidate, !((Boolean) current));
                    setValue.invoke(candidate, current);
                    return true;
                }
            } catch (Throwable ignored) {
                // Continue through captured fields.
            }
        }
        for (Class<?> type = candidate.getClass(); type != null && type != Object.class;
             type = type.getSuperclass()) {
            for (Field field : type.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers())) continue;
                try {
                    field.setAccessible(true);
                    if (pulseCapturedComposeState(field.get(candidate), depth + 1, visited)) {
                        return true;
                    }
                } catch (Throwable ignored) {
                    // Continue until the captured Compose Boolean state is found.
                }
            }
        }
        return false;
    }

    private static Method findMethod(Class<?> type, String name, Class<?>... parameters) {
        for (Class<?> current = type; current != null && current != Object.class;
             current = current.getSuperclass()) {
            try {
                Method method = current.getDeclaredMethod(name, parameters);
                method.setAccessible(true);
                return method;
            } catch (NoSuchMethodException ignored) {
                // Search the next superclass.
            }
        }
        return null;
    }
}
