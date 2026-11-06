package io.github.bryceaspringfield.morphe.extension.reddit;

import static io.github.bryceaspringfield.morphe.extension.reddit.FilterSettings.TAG;

import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * The page the full-screen media viewer opens on from a search's Media tab. Reddit opens it at the tapped post's
 * position in its search cache, while the viewer shows that list less the posts it leaves out (hidden, removed,
 * promoted, and a just-blocked account's posts). Each post left out before the tapped one shifts the viewer to a
 * neighbor of the tapped post. Here the viewer opens on the tapped post's own position in the list it shows.
 */
@SuppressWarnings("unused")
public final class MediaPagerStart {

    /** The viewer's list of pages, stored just before Reddit reads the start position. */
    private static Object pages;

    private static final Map<Class<?>, List<Field>> STRING_FIELDS = new HashMap<>();

    private MediaPagerStart() {
    }

    /** Injection point: the list of pages the viewer is about to show. */
    public static void pages(Object list) {
        pages = list;
    }

    /**
     * Injection point: the start position for the viewer, from Reddit's start request (the cached list, the tapped
     * post, and its position in the cached list). Returns Reddit's position when the tapped post is not in the list.
     */
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

    /** Whether a page's own text fields name the post. */
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
