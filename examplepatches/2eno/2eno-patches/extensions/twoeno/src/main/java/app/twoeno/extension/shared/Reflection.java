package app.twoeno.extension.shared;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

/**
 * Small reflection helpers. App classes are never referenced directly by the extension,
 * so the same code works in a patched app and in an Xposed module class loader.
 */
public final class Reflection {
    private Reflection() {
    }

    /**
     * Finds a method by name and parameter type names in the class, any superclass or any interface.
     *
     * @param parameterTypes Fully qualified type names, e.g. {@code java.lang.String} or {@code int}.
     */
    public static Method findMethod(Class<?> clazz, String name, String... parameterTypes) throws NoSuchMethodException {
        Method method = findMethodOrNull(clazz, name, parameterTypes);
        if (method == null) throw new NoSuchMethodException(clazz.getName() + "." + name);
        method.setAccessible(true);
        return method;
    }

    private static Method findMethodOrNull(Class<?> clazz, String name, String[] parameterTypes) {
        for (Class<?> current = clazz; current != null; current = current.getSuperclass()) {
            for (Method method : current.getDeclaredMethods()) {
                if (method.getName().equals(name) && parametersMatch(method.getParameterTypes(), parameterTypes)) {
                    return method;
                }
            }
            for (Class<?> anInterface : current.getInterfaces()) {
                Method method = findMethodOrNull(anInterface, name, parameterTypes);
                if (method != null) return method;
            }
        }
        return null;
    }

    private static boolean parametersMatch(Class<?>[] types, String[] names) {
        if (types.length != names.length) return false;
        for (int i = 0; i < types.length; i++) {
            if (!types[i].getName().equals(names[i])) return false;
        }
        return true;
    }

    /**
     * Finds a field by name in the class or any superclass.
     */
    public static Field findField(Class<?> clazz, String name) throws NoSuchFieldException {
        for (Class<?> current = clazz; current != null; current = current.getSuperclass()) {
            try {
                Field field = current.getDeclaredField(name);
                field.setAccessible(true);
                return field;
            } catch (NoSuchFieldException ignored) {
            }
        }
        throw new NoSuchFieldException(clazz.getName() + "." + name);
    }

    /**
     * Finds the first instance field with the exact type in the class or any superclass.
     */
    public static Field findFirstFieldByType(Class<?> clazz, Class<?> type) throws NoSuchFieldException {
        for (Class<?> current = clazz; current != null; current = current.getSuperclass()) {
            for (Field field : current.getDeclaredFields()) {
                if (field.getType() == type && !Modifier.isStatic(field.getModifiers())) {
                    field.setAccessible(true);
                    return field;
                }
            }
        }
        throw new NoSuchFieldException(clazz.getName() + " has no field of type " + type.getName());
    }

    public static Object getField(Object instance, String name) throws ReflectiveOperationException {
        return findField(instance.getClass(), name).get(instance);
    }

    public static int getIntField(Object instance, String name) throws ReflectiveOperationException {
        return findField(instance.getClass(), name).getInt(instance);
    }

    public static Object call(Object instance, String name) throws ReflectiveOperationException {
        return findMethod(instance.getClass(), name).invoke(instance);
    }

    /**
     * Protobuf lite lists are immutable once built. They contain a single boolean
     * "isMutable" flag, which is set so the list can be filtered in place.
     */
    public static void makeProtobufListMutable(Object list) {
        try {
            findFirstFieldByType(list.getClass(), boolean.class).setBoolean(list, true);
        } catch (Throwable ignored) {
            // Not a protobuf list, or already mutable.
        }
    }
}
