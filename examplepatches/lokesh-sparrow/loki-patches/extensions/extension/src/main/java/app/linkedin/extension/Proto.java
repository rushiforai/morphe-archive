/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.extension;

import java.lang.reflect.Method;
import java.util.Map;
import java.util.Optional;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Reads LinkedIn's SDUI protobuf-lite messages through their generated getters.
 *
 * <p>Those classes ship with the app, so they cannot be imported; their getter names are stable
 * though, which makes a cached reflective lookup the cheapest way in. Every method here treats a
 * missing getter and a throwing getter the same: no value.
 */
final class Proto {
    /** "class#getter" to the method, or empty when this build has no such getter. */
    private static final Map<String, Optional<Method>> GETTERS = new ConcurrentHashMap<>();

    private Proto() {
    }

    /** Result of a no-argument getter, or null when it is missing, throws, or the object is null. */
    static Object call(Object message, String getter) {
        if (message == null) return null;
        Class<?> type = message.getClass();
        String key = type.getName() + '#' + getter;
        Optional<Method> handle = GETTERS.computeIfAbsent(key, ignored -> find(type, getter));
        if (!handle.isPresent()) return null;
        Method method = handle.get();
        try {
            return method.invoke(message);
        } catch (Throwable unmappable) {
            // Generated getters do not throw, but a patched or newer build might.
            return null;
        }
    }

    private static Optional<Method> find(Class<?> type, String getter) {
        try {
            Method method = type.getMethod(getter);
            return Optional.of(method);
        } catch (NoSuchMethodException renamed) {
            return Optional.empty();
        }
    }

    /** A boolean getter such as hasTitle(): only a literal Boolean.TRUE counts as true. */
    static boolean is(Object message, String getter) {
        Object value = call(message, getter);
        return Boolean.TRUE.equals(value);
    }

    /** A string getter, with "" for a missing or non-string value. */
    static String string(Object message, String getter) {
        Object value = call(message, getter);
        if (!(value instanceof String)) return "";
        return (String) value;
    }
}
