package app.linkedin.extension;

import java.lang.reflect.Method;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Reflective access to LinkedIn's SDUI protobuf-lite messages (package proto.sdui).
 * Generated getters keep their names, so they are called by name.
 */
final class Proto {
    private static final Method MISSING;
    private static final Map<String, Method> CACHE = new ConcurrentHashMap<>();

    static {
        try {
            MISSING = Proto.class.getDeclaredMethod("missing");
        } catch (NoSuchMethodException e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    private Proto() {
    }

    @SuppressWarnings("unused")
    private static void missing() {
    }

    /** Calls a no-arg public method, returning null if it does not exist or throws. */
    static Object call(Object obj, String name) {
        if (obj == null) return null;
        Class<?> cls = obj.getClass();
        String key = cls.getName() + '#' + name;
        Method method = CACHE.get(key);
        if (method == null) {
            try {
                method = cls.getMethod(name);
            } catch (NoSuchMethodException e) {
                method = MISSING;
            }
            CACHE.put(key, method);
        }
        if (method == MISSING) return null;
        try {
            return method.invoke(obj);
        } catch (Throwable t) {
            return null;
        }
    }

    /** Calls a no-arg boolean method such as hasX(), false if unavailable. */
    static boolean is(Object obj, String name) {
        return Boolean.TRUE.equals(call(obj, name));
    }

    static String string(Object obj, String name) {
        Object value = call(obj, name);
        return value instanceof String ? (String) value : "";
    }
}
