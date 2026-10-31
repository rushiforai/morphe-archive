package app.morphed.extension.twitch.settings;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.util.List;

/**
 * Creates on/off rows for Twitch's settings screens without knowing their obfuscated class names.
 * <p>
 * A settings screen keeps its rows in a list; an on/off row is built with
 * {@code (String title, String description, SpannableString, boolean checked, boolean enabled, Enum key, int defaultsMask)}.
 * A copy of an existing row's class with our own title and no key is ignored by Twitch's own handler.
 */
public final class ToggleItems {
    private static final String SPANNABLE_STRING = "android.text.SpannableString";

    private ToggleItems() {
    }

    /** The settings row list of {@code screen}: the first non-empty list field holding an on/off row. */
    @SuppressWarnings("unchecked")
    public static List<Object> rowsOf(Object screen) {
        for (Class<?> type = screen.getClass(); type != null && type != Object.class; type = type.getSuperclass()) {
            for (Field field : type.getDeclaredFields()) {
                if (!List.class.isAssignableFrom(field.getType())) continue;
                try {
                    field.setAccessible(true);
                    Object value = field.get(screen);
                    if (value instanceof List && toggleConstructor((List<Object>) value) != null) return (List<Object>) value;
                } catch (ReflectiveOperationException | RuntimeException ignored) {
                    // Not accessible: try the next field.
                }
            }
        }
        return null;
    }

    /** The first field of {@code screen} (or its superclasses) holding an instance of {@code type}. */
    public static <T> T fieldOfType(Object screen, Class<T> type) {
        for (Class<?> c = screen.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
            for (Field field : c.getDeclaredFields()) {
                try {
                    field.setAccessible(true);
                    Object value = field.get(screen);
                    if (type.isInstance(value)) return type.cast(value);
                } catch (ReflectiveOperationException | RuntimeException ignored) {
                    // Try the next field.
                }
            }
        }
        return null;
    }

    /** The constructor of the on/off row class among {@code rows}, or null if there is none. */
    static Constructor<?> toggleConstructor(List<Object> rows) {
        for (Object row : rows) {
            if (row == null) continue;
            for (Constructor<?> constructor : row.getClass().getDeclaredConstructors()) {
                if (isToggleConstructor(constructor.getParameterTypes())) return constructor;
            }
        }
        return null;
    }

    static boolean isToggleConstructor(Class<?>[] types) {
        return types.length == 7
                && types[0] == String.class
                && types[1] == String.class
                && types[2].getName().equals(SPANNABLE_STRING)
                && types[3] == boolean.class
                && types[4] == boolean.class
                && types[5].isEnum()
                && types[6] == int.class;
    }

    /** Adds an on/off row to the end of {@code rows}; returns it, or null when no row class was found. */
    public static Object addToggle(List<Object> rows, String title, String description, boolean checked) {
        Constructor<?> constructor = toggleConstructor(rows);
        if (constructor == null) return null;
        try {
            constructor.setAccessible(true);
            // Mask 0: every argument is taken as given. No key, so Twitch's handler skips the row.
            Object row = constructor.newInstance(title, description, null, checked, true, null, 0);
            rows.add(row);
            return row;
        } catch (ReflectiveOperationException | RuntimeException e) {
            return null;
        }
    }
}
