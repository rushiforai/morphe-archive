/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 */
package app.morphe.extension.music.patches.downloads;

import androidx.annotation.Nullable;

import com.google.protobuf.MessageLite;

import java.io.ByteArrayOutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Serializes the model a list row was bound with. Most rows are bound with a protobuf, but Music also binds rows
 * with a small wrapper class that holds the protobuf in a field (the playlist page rows do, next to some state).
 * The wrapper is found by the type of its fields, never by an obfuscated name, so the same code serves every version.
 */
final class DownloadedModels {
    private static final Field[] NO_FIELDS = new Field[0];
    private static final Map<Class<?>, Field[]> protoFields = new ConcurrentHashMap<>();

    private DownloadedModels() {}

    /** The serialized protobuf of a row model, those of its protobuf fields for a wrapper, or null if it has none. */
    @Nullable
    static byte[] serialize(@Nullable Object model) {
        if (model == null) return null;
        if (model instanceof MessageLite message) return message.toByteArray();

        Field[] fields = protoFields.computeIfAbsent(model.getClass(), DownloadedModels::findProtoFields);
        ByteArrayOutputStream bytes = null;
        for (Field field : fields) {
            try {
                if (!(field.get(model) instanceof MessageLite message)) continue;

                if (bytes == null) bytes = new ByteArrayOutputStream();
                bytes.write(message.toByteArray());
            } catch (IllegalAccessException | java.io.IOException ignored) {
                // A field that cannot be read is not part of the model.
            }
        }
        return bytes == null ? null : bytes.toByteArray();
    }

    private static Field[] findProtoFields(Class<?> type) {
        List<Field> found = new ArrayList<>();
        for (Class<?> current = type; current != null && current != Object.class; current = current.getSuperclass()) {
            for (Field field : current.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) || !MessageLite.class.isAssignableFrom(field.getType())) {
                    continue;
                }
                field.setAccessible(true);
                found.add(field);
            }
        }
        return found.isEmpty() ? NO_FIELDS : found.toArray(new Field[0]);
    }
}
