/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.extension;

import java.lang.reflect.Field;
import java.util.Map;
import java.util.Optional;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Field access for LinkedIn's Pegasus models.
 *
 * <p>Those classes ship inside the app, so the extension cannot link against them. Their field
 * names are stable across releases, which makes lookup by name the cheapest option; the result is
 * remembered per class so the walk up the hierarchy happens once.
 */
final class Reflect {
    private static final Map<String, Optional<Field>> LOOKUP = new ConcurrentHashMap<>();

    private Reflect() {
    }

    /** The value of {@code name} on the object (or a superclass), or null if there is no such field. */
    static Object get(Object target, String name) {
        if (target == null) return null;
        Optional<Field> handle = handleFor(target.getClass(), name);
        if (!handle.isPresent()) return null;
        try {
            return handle.get().get(target);
        } catch (IllegalAccessException unreachable) {
            // setAccessible(true) was already applied, so this cannot normally happen.
            return null;
        }
    }

    /** The same field as a writable handle, or null when this build has no field of that name. */
    static Field field(Class<?> type, String name) {
        Optional<Field> handle = handleFor(type, name);
        return handle.isPresent() ? handle.get() : null;
    }

    private static Optional<Field> handleFor(Class<?> type, String name) {
        String key = type.getName() + '#' + name;
        return LOOKUP.computeIfAbsent(key, ignored -> locate(type, name));
    }

    /** Searches the class and then its superclasses; Object is skipped, nothing is declared there. */
    private static Optional<Field> locate(Class<?> type, String name) {
        Class<?> current = type;
        while (current != null && current != Object.class) {
            try {
                Field declared = current.getDeclaredField(name);
                declared.setAccessible(true);
                return Optional.of(declared);
            } catch (NoSuchFieldException notHere) {
                current = current.getSuperclass();
            }
        }
        return Optional.empty();
    }

    /** Numeric field value as an int; anything else counts as 0. */
    static int asInt(Object value) {
        if (!(value instanceof Number)) return 0;
        return ((Number) value).intValue();
    }
}
