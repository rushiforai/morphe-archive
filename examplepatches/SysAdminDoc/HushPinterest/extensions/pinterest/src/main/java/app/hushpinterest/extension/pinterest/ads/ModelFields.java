/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ads;

import androidx.annotation.Nullable;

import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Reads a Pinterest model's fields by the JSON names its server uses.
 *
 * <p>Pinterest's models are renamed in every build, but each field keeps the JSON name Gson reads
 * it under, in an annotation that stays in the app at run time. The annotation's own class is
 * renamed too, so it's recognized by its shape: one {@code String value()}. Each model class is read
 * once and kept, so a feed page costs one map lookup per item.
 */
public final class ModelFields {
    private ModelFields() {}

    private static final Map<Class<?>, Map<String, Field>> CACHE = new ConcurrentHashMap<>();

    /** Every field of [type] and its superclasses that has a JSON name, by that name; empty when none has one. */
    public static Map<String, Field> of(Class<?> type) {
        Map<String, Field> known = CACHE.get(type);
        if (known != null) return known;
        Map<String, Field> found = new HashMap<>();
        for (Class<?> at = type; at != null && at != Object.class; at = at.getSuperclass()) {
            for (Field field : at.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers())) continue;
                String name = jsonName(field);
                if (name == null || found.containsKey(name)) continue;
                try {
                    field.setAccessible(true);
                    found.put(name, field);
                } catch (RuntimeException inaccessible) {
                    // A field the runtime won't open is one this reader can't use; the rest still work.
                }
            }
        }
        Map<String, Field> fixed = found.isEmpty() ? Collections.emptyMap() : Collections.unmodifiableMap(found);
        CACHE.put(type, fixed);
        return fixed;
    }

    /** The JSON name on [field]'s Gson annotation, or null when it has none. */
    @Nullable
    public static String jsonName(Field field) {
        for (Annotation annotation : field.getDeclaredAnnotations()) {
            Class<? extends Annotation> kind = annotation.annotationType();
            try {
                Method value = kind.getDeclaredMethod("value");
                if (value.getReturnType() != String.class) continue;
                Object name = value.invoke(annotation);
                if (name instanceof String && !((String) name).isEmpty()) return (String) name;
            } catch (ReflectiveOperationException | RuntimeException notGson) {
                // Not the annotation that names JSON fields.
            }
        }
        return null;
    }

    /** True when [model]'s field named [json] holds Boolean true. */
    public static boolean isTrue(Map<String, Field> fields, Object model, String json) {
        return Boolean.TRUE.equals(read(fields, model, json));
    }

    /** True when [model]'s field named [json] holds a string with any text in it. */
    public static boolean hasText(Map<String, Field> fields, Object model, String json) {
        Object value = read(fields, model, json);
        return value instanceof String && !((String) value).trim().isEmpty();
    }

    /** True when [model]'s field named [json] holds anything at all. */
    public static boolean isSet(Map<String, Field> fields, Object model, String json) {
        return read(fields, model, json) != null;
    }

    /** True when [model]'s field named [json] holds a list with at least one entry. */
    public static boolean hasEntries(Map<String, Field> fields, Object model, String json) {
        Object value = read(fields, model, json);
        return value instanceof List && !((List<?>) value).isEmpty();
    }

    @Nullable
    public static Object read(Map<String, Field> fields, Object model, String json) {
        Field field = fields.get(json);
        if (field == null) return null;
        try {
            return field.get(model);
        } catch (IllegalAccessException | RuntimeException unreadable) {
            return null;
        }
    }

    /** Forgets every class read so far. */
    static void clearForTests() {
        CACHE.clear();
    }
}
