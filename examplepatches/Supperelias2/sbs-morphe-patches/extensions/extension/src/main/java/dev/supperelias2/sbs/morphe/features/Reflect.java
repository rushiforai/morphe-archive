package dev.supperelias2.sbs.morphe.features;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.concurrent.ConcurrentHashMap;

/** Reflection only targets public app/player APIs and the verified SBS fields. */
public final class Reflect {
    private static final ConcurrentHashMap<String, Method> METHODS = new ConcurrentHashMap<>();
    private static final ConcurrentHashMap<String, Field> FIELDS = new ConcurrentHashMap<>();

    private Reflect() {}

    public static Object call(Object target, String name, Object... args) {
        if (target == null) return null;
        try {
            String key = target.getClass().getName() + '#' + name + '/' + args.length;
            Method method = METHODS.get(key);
            if (method == null || !compatible(method.getParameterTypes(), args)) {
                method = find(target.getClass(), name, args);
                if (method == null) return null;
                method.setAccessible(true);
                METHODS.put(key, method);
            }
            return method.invoke(target, args);
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            return null;
        }
    }

    private static Method find(Class<?> type, String name, Object[] args) {
        for (Class<?> cursor = type; cursor != null; cursor = cursor.getSuperclass()) {
            for (Method method : cursor.getDeclaredMethods()) {
                if (method.getName().equals(name) && compatible(method.getParameterTypes(), args)) return method;
            }
        }
        for (Method method : type.getMethods()) {
            if (method.getName().equals(name) && compatible(method.getParameterTypes(), args)) return method;
        }
        return null;
    }

    private static boolean compatible(Class<?>[] types, Object[] args) {
        if (types.length != args.length) return false;
        for (int i = 0; i < types.length; i++) {
            Class<?> type = types[i];
            if (args[i] == null) {
                if (type.isPrimitive()) return false;
                continue;
            }
            if (type.isPrimitive()) {
                if (type == boolean.class) type = Boolean.class;
                else if (type == int.class) type = Integer.class;
                else if (type == long.class) type = Long.class;
                else if (type == float.class) type = Float.class;
                else if (type == double.class) type = Double.class;
                else if (type == short.class) type = Short.class;
                else if (type == byte.class) type = Byte.class;
                else if (type == char.class) type = Character.class;
            }
            if (!type.isInstance(args[i])) return false;
        }
        return true;
    }

    public static Object field(Object target, String name) {
        if (target == null) return null;
        try {
            String key = target.getClass().getName() + '#' + name;
            Field field = FIELDS.get(key);
            if (field == null) {
                for (Class<?> cursor = target.getClass(); cursor != null; cursor = cursor.getSuperclass()) {
                    try {
                        field = cursor.getDeclaredField(name);
                        break;
                    } catch (NoSuchFieldException ignored) {
                        // Keep searching the superclass chain.
                    }
                }
                if (field == null) return null;
                field.setAccessible(true);
                FIELDS.put(key, field);
            }
            return field.get(target);
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            return null;
        }
    }

    public static Object value(Object state) { return call(state, "getValue"); }
    public static boolean bool(Object state) { return Boolean.TRUE.equals(value(state)); }
    public static long number(Object value, long fallback) { return value instanceof Number ? ((Number) value).longValue() : fallback; }

    public static Object player(Object manager) {
        Object player = call(manager, "get_player");
        return player != null ? player : call(manager, "getPlayer");
    }

    public static Object viewModel(Object owner) { return field(owner, "parentViewModel"); }
}
