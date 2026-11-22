package io.github.daydreamfix.ext;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/** Small stand-in for XposedHelpers, so the Xposed hook bodies port nearly verbatim. */
final class Reflect {
    private Reflect() {}

    static Field field(Class<?> c, String name) throws NoSuchFieldException {
        for (Class<?> k = c; k != null; k = k.getSuperclass()) {
            try {
                Field f = k.getDeclaredField(name);
                f.setAccessible(true);
                return f;
            } catch (NoSuchFieldException ignored) { }
        }
        throw new NoSuchFieldException(c.getName() + "#" + name);
    }

    static Object get(Object o, String name) {
        try { return field(o.getClass(), name).get(o); }
        catch (ReflectiveOperationException e) { throw new IllegalStateException(e); }
    }

    static int getInt(Object o, String name) {
        try { return field(o.getClass(), name).getInt(o); }
        catch (ReflectiveOperationException e) { throw new IllegalStateException(e); }
    }

    static void set(Object o, String name, Object value) {
        try { field(o.getClass(), name).set(o, value); }
        catch (ReflectiveOperationException e) { throw new IllegalStateException(e); }
    }

    static void setBoolean(Object o, String name, boolean value) {
        try { field(o.getClass(), name).setBoolean(o, value); }
        catch (ReflectiveOperationException e) { throw new IllegalStateException(e); }
    }

    static Method method(Class<?> c, String name, Class<?>... params) throws NoSuchMethodException {
        for (Class<?> k = c; k != null; k = k.getSuperclass()) {
            try {
                Method m = k.getDeclaredMethod(name, params);
                m.setAccessible(true);
                return m;
            } catch (NoSuchMethodException ignored) { }
        }
        throw new NoSuchMethodException(c.getName() + "#" + name);
    }

    /** Calls a method and lets whatever it throws come out as itself. */
    static Object call(Object o, String name, Class<?>[] params, Object... args) {
        try {
            return method(o.getClass(), name, params).invoke(o, args);
        } catch (InvocationTargetException e) {
            Throwable cause = e.getCause();
            if (cause instanceof RuntimeException) throw (RuntimeException) cause;
            if (cause instanceof Error) throw (Error) cause;
            throw new IllegalStateException(cause);
        } catch (ReflectiveOperationException e) {
            throw new IllegalStateException(e);
        }
    }

    static Object call(Object o, String name) {
        return call(o, name, new Class<?>[0]);
    }
}
