package app.onlynazril.extension.tiktokHandle.internal;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Minimal reflection helper — no HookStatus dependency to keep extension
 * standalone (always-on patch doesn't need diagnostic counters).
 */
public final class Reflect {
    private static final Map<String, Method> METHOD_CACHE = new ConcurrentHashMap<>();
    private static final Map<String, Field> FIELD_CACHE = new ConcurrentHashMap<>();
    private static final Object MISSING = new Object();

    private Reflect() {}

    private static String key(Class<?> c, String n) { return c.getName() + "#" + n; }

    public static Method method(Class<?> type, String name) {
        String k = key(type, name);
        Method cached = METHOD_CACHE.get(k);
        if (cached != null) return cached;
        for (Class<?> cur = type; cur != null && cur != Object.class; cur = cur.getSuperclass()) {
            try {
                Method m = cur.getDeclaredMethod(name);
                m.setAccessible(true);
                METHOD_CACHE.put(k, m);
                return m;
            } catch (NoSuchMethodException ignored) {}
        }
        try {
            Method m = type.getMethod(name);
            m.setAccessible(true);
            METHOD_CACHE.put(k, m);
            return m;
        } catch (Exception ignored) { return null; }
    }

    public static Field field(Class<?> type, String name) {
        String k = key(type, name);
        Field cached = FIELD_CACHE.get(k);
        if (cached != null) return cached;
        for (Class<?> cur = type; cur != null && cur != Object.class; cur = cur.getSuperclass()) {
            try {
                Field f = cur.getDeclaredField(name);
                f.setAccessible(true);
                FIELD_CACHE.put(k, f);
                return f;
            } catch (NoSuchFieldException ignored) {}
        }
        return null;
    }

    public static Object property(Object obj, String getter, String field) {
        if (obj == null) return null;
        Method m = method(obj.getClass(), getter);
        if (m != null) {
            try { return m.invoke(obj); } catch (Exception ignored) {}
        }
        Field f = field(obj.getClass(), field);
        if (f != null) {
            try { return f.get(obj); } catch (Exception ignored) {}
        }
        return null;
    }

    public static String string(Object obj, String getter, String field) {
        Object v = property(obj, getter, field);
        return v instanceof String ? (String) v : null;
    }

    public static Object readField(Object obj, String field) {
        if (obj == null) return null;
        Field f = field(obj.getClass(), field);
        if (f != null) try { return f.get(obj); } catch (Exception ignored) {}
        return null;
    }
}
