package app.ahmedyarub.extension.x;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import app.morphe.extension.shared.Logger;

/**
 * Detects X timeline items whose server entry id starts with "who-to-follow".
 *
 * X 12.31 models timeline entries as obfuscated classes under
 * com.x.models.timelines.items. Their entry-id field names are not stable, but the value is a
 * String carried directly by each item. Cache the instance String/CharSequence fields per class
 * and match the server id by value instead of by obfuscated field name.
 */
@SuppressWarnings("unused")
public final class WhoToFollow {
    private static final String WHO_TO_FOLLOW_PREFIX = "who-to-follow";
    private static final String TOP_PEOPLE_SEARCH_PREFIX = "toptabsrpusermodule";
    private static final Map<Class<?>, Field[]> STRING_FIELDS = new ConcurrentHashMap<>();

    private WhoToFollow() {
    }

    public static boolean isWhoToFollow(Object item) {
        return hasEntryIdPrefix(item, WHO_TO_FOLLOW_PREFIX);
    }

    public static boolean isTopPeopleSearch(Object item) {
        return hasEntryIdPrefix(item, TOP_PEOPLE_SEARCH_PREFIX);
    }

    private static boolean hasEntryIdPrefix(Object item, String prefix) {
        if (item == null) return false;

        try {
            for (Field field : STRING_FIELDS.computeIfAbsent(item.getClass(), WhoToFollow::stringFields)) {
                Object value = field.get(item);
                if (value instanceof CharSequence && value.toString().startsWith(prefix)) {
                    return true;
                }
            }
        } catch (Exception ex) {
            Logger.printException(() -> "Recommendation module filter failure", ex);
        }

        return false;
    }

    private static Field[] stringFields(Class<?> itemClass) {
        List<Field> fields = new ArrayList<>();

        for (Class<?> type = itemClass; type != null && type != Object.class; type = type.getSuperclass()) {
            for (Field field : type.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers())) continue;

                Class<?> fieldType = field.getType();
                if (fieldType != String.class && !CharSequence.class.isAssignableFrom(fieldType)) continue;

                try {
                    field.setAccessible(true);
                    fields.add(field);
                } catch (RuntimeException ignored) {
                    // If Android blocks reflective access to one field, the remaining fields can
                    // still contain the entry id. A total miss leaves the item unchanged.
                }
            }
        }

        return fields.toArray(new Field[0]);
    }
}
