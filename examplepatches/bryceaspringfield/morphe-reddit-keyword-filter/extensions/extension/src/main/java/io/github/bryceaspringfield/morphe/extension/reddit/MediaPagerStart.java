package io.github.bryceaspringfield.morphe.extension.reddit;

import static io.github.bryceaspringfield.morphe.extension.reddit.FilterSettings.TAG;

import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@SuppressWarnings("unused")
public final class MediaPagerStart {

    private static Object pages;

    private static final Map<Class<?>, List<Field>> STRING_FIELDS = new HashMap<>();

    private MediaPagerStart() {
    }

    public static void pages(Object list) {
        pages = list;
    }

    public static int start(Object request) {
        Object list = pages;
        pages = null;
        int fallback = -1;
        try {
            Object link = null;
            for (Field field : request.getClass().getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers())) continue;
                field.setAccessible(true);
                if (field.getType() == int.class) fallback = field.getInt(request);
                else if (field.getType().getName().endsWith(".Link")) link = field.get(request);
            }
            if (link == null || !(list instanceof List)) return fallback;
            String id = (String) link.getClass().getMethod("getId").invoke(link);
            String kindWithId = (String) link.getClass().getMethod("getKindWithId").invoke(link);
            List<?> items = (List<?>) list;
            for (int i = 0; i < items.size(); i++) {
                if (names(items.get(i), id, kindWithId)) {
                    if (i != fallback) Log.i(TAG, "media viewer: opened at " + i + " in place of " + fallback);
                    return i;
                }
            }
        } catch (Throwable e) {
            Log.w(TAG, "media viewer start", e);
        }
        return fallback;
    }

    private static boolean names(Object item, String id, String kindWithId) throws IllegalAccessException {
        if (item == null) return false;
        for (Field field : stringFields(item.getClass())) {
            Object value = field.get(item);
            if (value != null && (value.equals(kindWithId) || value.equals(id))) return true;
        }
        return false;
    }

    private static List<Field> stringFields(Class<?> type) {
        synchronized (STRING_FIELDS) {
            List<Field> fields = STRING_FIELDS.get(type);
            if (fields != null) return fields;
            fields = new ArrayList<>();
            for (Class<?> c = type; c != null && c != Object.class; c = c.getSuperclass()) {
                for (Field field : c.getDeclaredFields()) {
                    if (field.getType() != String.class || Modifier.isStatic(field.getModifiers())) continue;
                    field.setAccessible(true);
                    fields.add(field);
                }
            }
            STRING_FIELDS.put(type, fields);
            return fields;
        }
    }
}
