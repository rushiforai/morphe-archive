package app.voidhack.extension.applemusic.library;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Proxy;

final class MusicReflection {
    private MusicReflection() {}

    interface Action { void run() throws ReflectiveOperationException; }

    static Object action(Action action) throws ReflectiveOperationException {
        Class<?> function = Class.forName("pi.a");
        Object unit = Class.forName("kotlin.Unit").getField("a").get(null);
        return Proxy.newProxyInstance(function.getClassLoader(), new Class<?>[]{function}, (proxy, method, args) -> {
            switch (method.getName()) {
                case "invoke": action.run(); return unit;
                case "equals": return proxy == args[0];
                case "hashCode": return System.identityHashCode(proxy);
                case "toString": return "Apple Music library action";
                default: throw new UnsupportedOperationException(method.getName());
            }
        });
    }

    static Object create(String name, Object... arguments) throws ReflectiveOperationException {
        for (Constructor<?> constructor : Class.forName(name).getConstructors()) {
            if (matches(constructor.getParameterTypes(), arguments)) return constructor.newInstance(arguments);
        }
        throw new NoSuchMethodException(name + " constructor");
    }

    static Object call(Object target, String name, Object... arguments) throws ReflectiveOperationException {
        Class<?> type = target instanceof Class<?> ? (Class<?>) target : target.getClass();
        for (Method method : type.getMethods()) {
            if (method.getName().equals(name) && matches(method.getParameterTypes(), arguments)
                    && (!(target instanceof Class<?>) || Modifier.isStatic(method.getModifiers()))) {
                try {
                    return method.invoke(target instanceof Class<?> ? null : target, arguments);
                } catch (InvocationTargetException exception) {
                    Throwable cause = exception.getCause();
                    if (cause instanceof RuntimeException) throw (RuntimeException) cause;
                    if (cause instanceof Error) throw (Error) cause;
                    throw exception;
                }
            }
        }
        throw new NoSuchMethodException(type.getName() + "." + name);
    }

    static Object invoke(String type, String name, Object... arguments) throws ReflectiveOperationException {
        return call(Class.forName(type), name, arguments);
    }

    private static boolean matches(Class<?>[] types, Object[] arguments) {
        if (types.length != arguments.length) return false;
        for (int i = 0; i < types.length; i++) {
            Class<?> type = types[i];
            Object argument = arguments[i];
            if (argument == null) {
                if (type.isPrimitive()) return false;
            } else if (type.isPrimitive()) {
                if (!(type == int.class && argument instanceof Integer)
                        && !(type == long.class && argument instanceof Long)
                        && !(type == boolean.class && argument instanceof Boolean)) return false;
            } else if (!type.isInstance(argument)) return false;
        }
        return true;
    }

    static String text(Object item, String getter) throws ReflectiveOperationException {
        Object value = call(item, getter);
        return value == null ? "" : value.toString();
    }

    static final class Handle implements AutoCloseable {
        final Object value;

        Handle(Object value) { this.value = value; }

        Object get() throws ReflectiveOperationException { return call(value, "get"); }

        @Override public void close() throws ReflectiveOperationException { call(value, "deallocate"); }
    }
}
