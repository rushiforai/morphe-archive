package app.noam.extension.spotify.home;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import app.noam.extension.spotify.Utils;
import app.noam.extension.spotify.localserver.ServerConfig;

/**
 * Keeps chosen shortcuts at the front of Spotify's home grid.
 *
 * The grid itself is filled by the server, so nothing is added or fetched here: the list Spotify is
 * about to render is simply reordered on the way past, using names kept on the device. If the model
 * does not look the way this expects, the list is left exactly as it came.
 */
public final class HomePins {

    public static final String KEY_PINS = "home_pins";

    /** The shortcut names last seen on Home, so the settings can offer them to pin. */
    public static final String KEY_SEEN = "home_seen";

    /** Marks a pinned shortcut in the grid, since Spotify draws no pin there itself. */
    private static final String PIN_MARK = "\uD83D\uDCCC ";

    private HomePins() {}

    public static Set<String> pinned() {
        Set<String> names = new LinkedHashSet<>();
        for (String line : ServerConfig.getString(KEY_PINS, "").split("\n")) {
            String name = line.trim();
            if (!name.isEmpty()) names.add(name.toLowerCase());
        }
        return names;
    }

    public static void setPinned(String text) {
        ServerConfig.putString(KEY_PINS, text == null ? "" : text);
    }

    /** Called as the home shortcuts grid is about to render. */
    public static void reorder(Object model) {
        try {
            Set<String> pins = pinned();
            Utils.log("Home pins: grid rendering, " + pins.size() + " pinned, model "
                    + (model == null ? "null" : model.getClass().getName()));
            if (pins.isEmpty() || model == null) return;

            Field[] fields = model.getClass().getDeclaredFields();
            StringBuilder shape = new StringBuilder();
            for (Field f : fields) shape.append(f.getName()).append(':').append(f.getType().getSimpleName()).append(' ');
            Utils.log("Home pins: model fields = " + shape);

            for (Field field : fields) {
                if (!List.class.isAssignableFrom(field.getType())) continue;

                field.setAccessible(true);
                Object value = field.get(model);
                if (!(value instanceof List)) continue;

                @SuppressWarnings("unchecked")
                List<Object> items = (List<Object>) value;
                if (items.size() < 2) continue;

                List<Object> front = new ArrayList<>();
                List<Object> rest = new ArrayList<>();
                for (Object item : items) {
                    if (isPinned(item, pins)) {
                        front.add(item);
                    } else {
                        rest.add(item);
                    }
                }

                rememberNames(items);

                Utils.log("Home pins: list field " + field.getName() + " has " + items.size()
                        + " items, " + front.size() + " matched");
                if (front.isEmpty() || front.size() == items.size()) continue;

                for (Object item : front.subList(0, front.size() - rest.size() >= 0
                        ? front.size() - rest.size() : front.size())) {
                    markPinned(item);
                }

                front.addAll(rest);
                try {
                    items.clear();
                    items.addAll(front);
                } catch (UnsupportedOperationException immutable) {
                    field.set(model, front);
                }
                Utils.log("Home pins: moved " + (items.size() - rest.size()) + " shortcuts to the front");
                return;
            }
        } catch (Throwable ex) {
            Utils.logError("Could not reorder the home shortcuts", ex);
        }
    }

    /** Records the names on the grid, so the settings screen can list them to pin. */
    private static void rememberNames(List<Object> items) {
        StringBuilder names = new StringBuilder();
        for (Object item : items) {
            for (String text : textOf(item)) {
                String name = text.trim();
                if (name.isEmpty() || name.startsWith("spotify:") || name.length() > 60) continue;
                names.append(name.replace(PIN_MARK, "")).append('\n');
                break;
            }
        }
        ServerConfig.putString(KEY_SEEN, names.toString());
    }

    private static boolean reportedShape;

    /** Puts a pin in front of a pinned shortcut's title, so it reads as pinned on the grid. */
    private static void markPinned(Object item) {
        try {
            if (!reportedShape) {
                reportedShape = true;
                StringBuilder shape = new StringBuilder("Home pins: shortcut "
                        + item.getClass().getName() + " -> ");
                for (Field f : item.getClass().getDeclaredFields()) {
                    f.setAccessible(true);
                    Object v = f.get(item);
                    shape.append(f.getName()).append('=')
                            .append(v == null ? "null"
                                    : v instanceof String ? "\"" + v + "\""
                                    : v.getClass().getSimpleName())
                            .append(' ');
                }
                Utils.log(shape.toString());
            }

            // The shortcut's text lives inside a nested model rather than on the item itself.
            if (markIn(item)) return;
            for (Field field : item.getClass().getDeclaredFields()) {
                field.setAccessible(true);
                Object value = field.get(item);
                if (value != null && !isPlain(value) && markIn(value)) return;
            }
        } catch (Throwable ex) {
            // The shortcut simply renders without the marker.
            Utils.log("Home pins: could not mark a shortcut: " + ex);
        }
    }

    /** Prefixes the first title-looking String on this object. */
    private static boolean markIn(Object holder) throws IllegalAccessException {
        for (Field field : holder.getClass().getDeclaredFields()) {
            if (field.getType() != String.class) continue;

            field.setAccessible(true);
            Object value = field.get(holder);
            if (!(value instanceof String)) continue;

            String text = (String) value;
            if (text.isEmpty() || text.length() > 60 || text.startsWith("spotify:")
                    || text.startsWith(PIN_MARK) || text.contains("://")) {
                continue;
            }

            field.set(holder, PIN_MARK + text);
            Utils.log("Home pins: marked \"" + text + "\"");
            return true;
        }
        return false;
    }

    /** A shortcut counts as pinned when any of its text carries a pinned name. */
    private static boolean isPinned(Object item, Set<String> pins) {
        if (item == null) return false;

        for (String text : textOf(item)) {
            String lower = text.toLowerCase();
            for (String pin : pins) {
                if (lower.equals(pin) || lower.contains(pin)) return true;
            }
        }
        return false;
    }

    /** Collects the strings a shortcut carries, one level deep. */
    private static List<String> textOf(Object item) {
        List<String> texts = new ArrayList<>();
        try {
            for (Field field : item.getClass().getDeclaredFields()) {
                field.setAccessible(true);
                Object value = field.get(item);

                if (value instanceof String) {
                    texts.add((String) value);
                } else if (value != null && !isPlain(value)) {
                    for (Field inner : value.getClass().getDeclaredFields()) {
                        inner.setAccessible(true);
                        Object nested = inner.get(value);
                        if (nested instanceof String) texts.add((String) nested);
                    }
                }
            }
        } catch (Throwable ignored) {
            // A shortcut whose fields cannot be read simply never matches.
        }
        return texts;
    }

    private static boolean isPlain(Object value) {
        if (value instanceof Number || value instanceof Boolean || value instanceof Character) {
            return true;
        }
        String type = value.getClass().getName();
        return type.startsWith("java.") || type.startsWith("kotlin.") || type.startsWith("android.");
    }
}
