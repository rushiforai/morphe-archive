package app.linkedin.extension;

import java.lang.reflect.Field;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * LinkedIn's Pegasus models keep their field names, so the extension reads them
 * reflectively instead of compiling against app classes.
 */
final class Reflect {
    private static final Field MISSING;
    private static final Map<String, Field> CACHE = new ConcurrentHashMap<>();

    static {
        try {
            MISSING = Reflect.class.getDeclaredField("MISSING");
        } catch (NoSuchFieldException e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    private Reflect() {
    }

    /** Returns the value of a field declared on the object's class or a superclass, or null. */
    static Object get(Object obj, String name) {
        if (obj == null) return null;
        Class<?> cls = obj.getClass();
        String key = cls.getName() + '#' + name;
        Field field = CACHE.get(key);
        if (field == null) {
            field = find(cls, name);
            CACHE.put(key, field);
        }
        if (field == MISSING) return null;
        try {
            return field.get(obj);
        } catch (IllegalAccessException e) {
            return null;
        }
    }

    /** A field declared on the class or a superclass, made accessible, or null. */
    static Field field(Class<?> cls, String name) {
        Field f = find(cls, name);
        return f == MISSING ? null : f;
    }

    private static Field find(Class<?> cls, String name) {
        for (Class<?> c = cls; c != null && c != Object.class; c = c.getSuperclass()) {
            try {
                Field f = c.getDeclaredField(name);
                f.setAccessible(true);
                return f;
            } catch (NoSuchFieldException ignored) {
            }
        }
        return MISSING;
    }

    static int asInt(Object value) {
        return value instanceof Number ? ((Number) value).intValue() : 0;
    }
}
