package app.hushmessenger.extension;

import android.content.SharedPreferences;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Hide chat menu items (#153). The menu you get when you press and hold a chat in the chat list leaves out the items
 * picked in settings. Each item is known by Messenger's own name for it ("mute", "mark read" and so on), which is the
 * same in every language, and settings list it under the words Messenger last showed on it. Off, Pause and safe mode
 * hand the menu back whole, and a menu never loses all of Messenger's items.
 * Public, since the call comes from Messenger's own menu class in another package.
 */
public final class ChatMenuItems {
    static final String KEY = "chat_menu_items";
    private static final String HIDDEN = "chat_menu_items_hidden", SEEN = "chat_menu_items_seen", LABEL = "chat_menu_items_label_";
    /** Rows HushMessenger adds itself, like Hide from chat list, which have switches of their own. */
    private static final String OWN = "hush_";
    private static final String PROBE_TITLE = "hush_probe_title", PROBE_DESCRIPTION = "hush_probe_description", PROBE_NAME = "hush_probe_name";
    /** More than any menu shows, so a stale name drops off the list in time. */
    private static final int REMEMBERED = 60;

    /** Null until the first menu, and again whenever the patched build hands over a different route. */
    private static volatile Rows shape;
    /** The labels already saved this run, so an unchanged menu writes nothing. */
    private static final Map<String, String> savedLabels = new ConcurrentHashMap<>();

    private ChatMenuItems() {}

    static void resetForTests() {
        shape = null;
        savedLabels.clear();
    }

    /**
     * The menu's finished rows, just before the menu hands them back. Rows picked in settings come out and the list gets
     * shorter. No empty slot is left in their place: the code that draws the menu reads every entry without a null check.
     */
    public static void rows(ArrayList<Object> rows, String route) {
        try {
            if (rows == null || route == null || !Settings.wouldUse(KEY)) return;
            Rows known = shape(route);
            List<String> names = new ArrayList<>(rows.size());
            for (Object row : rows) names.add(known.name(row));
            remember(rows, names, known);
            Set<String> hidden = hidden();
            if (hidden.isEmpty()) return;
            int keep = 0, drop = 0;
            for (String name : names) {
                if (name == null || name.startsWith(OWN)) continue;
                if (hidden.contains(name)) drop++;
                else keep++;
            }
            // Never an empty menu: with every one of Messenger's items picked, the menu shows them all.
            if (drop == 0 || keep == 0) return;
            for (int i = rows.size() - 1; i >= 0; i--) {
                String name = names.get(i);
                if (name != null && !name.startsWith(OWN) && hidden.contains(name)) rows.remove(i);
            }
            Settings.enabled(KEY);
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Can't hide chat menu items", error);
        }
    }

    /** The items seen so far, in the order Messenger first showed them. */
    static List<String> seen() {
        return split(Settings.preferences.getString(SEEN, ""));
    }

    static Set<String> hidden() {
        return new LinkedHashSet<>(split(Settings.preferences.getString(HIDDEN, "")));
    }

    static void setHidden(String name, boolean hide) {
        Set<String> now = hidden();
        if (hide ? !now.add(name) : !now.remove(name)) return;
        Settings.preferences.edit().putString(HIDDEN, String.join("\n", now)).apply();
    }

    /** The words Messenger last showed on an item, or its own name for it in plain words until it does. */
    static String label(String name) {
        String saved = Settings.preferences.getString(LABEL + name, "");
        if (!saved.isEmpty()) return saved;
        String words = name.replace('_', ' ').trim();
        return words.isEmpty() ? name : Character.toUpperCase(words.charAt(0)) + words.substring(1);
    }

    /** Notes new items and any label that changed, in one write, and only then. */
    private static void remember(List<Object> rows, List<String> names, Rows known) throws IllegalAccessException {
        SharedPreferences prefs = Settings.preferences;
        List<String> seen = seen();
        SharedPreferences.Editor edit = null;
        boolean added = false;
        for (int i = 0; i < rows.size(); i++) {
            String name = names.get(i);
            if (name == null || name.isEmpty() || name.startsWith(OWN) || name.indexOf('\n') >= 0) continue;
            if (!seen.contains(name)) {
                seen.add(name);
                added = true;
            }
            String title = known.title(rows.get(i));
            if (title == null || title.equals(savedLabels.get(name))) continue;
            savedLabels.put(name, title);
            if (title.equals(prefs.getString(LABEL + name, ""))) continue;
            if (edit == null) edit = prefs.edit();
            edit.putString(LABEL + name, title);
        }
        if (added) {
            while (seen.size() > REMEMBERED) seen.remove(0);
            if (edit == null) edit = prefs.edit();
            edit.putString(SEEN, String.join("\n", seen));
        }
        if (edit != null) edit.apply();
    }

    private static Rows shape(String route) throws Throwable {
        Rows known = shape;
        if (known != null && known.route.equals(route)) return known;
        known = Rows.of(route, ChatMenuItems.class.getClassLoader());
        shape = known;
        return known;
    }

    static List<String> split(String joined) {
        List<String> parts = new ArrayList<>();
        if (joined == null) return parts;
        for (String part : joined.split("\n")) if (!part.isEmpty() && !parts.contains(part)) parts.add(part);
        return parts;
    }

    /**
     * Which of a row's fields hold its name and its title. The patch hands over how Messenger builds a row,
     * "factory|title|description|build"; one throwaway row built that way shows the fields by the words put in.
     */
    static final class Rows {
        final String route;
        final Class<?> type;
        final Field name;
        final Field title;

        private Rows(String route, Class<?> type, Field name, Field title) {
            this.route = route;
            this.type = type;
            this.name = name;
            this.title = title;
        }

        static Rows of(String route, ClassLoader loader) throws Throwable {
            String[] parts = route.split("\\|", -1);
            if (parts.length != 4) throw new IllegalStateException("The chat menu route has the wrong shape");
            Method factory = ChatHiding.Route.method(parts[0], loader);
            Method title = ChatHiding.Route.method(parts[1], loader);
            ChatHiding.Route.Setter description = ChatHiding.Route.Setter.of(parts[2], loader);
            Method build = ChatHiding.Route.method(parts[3], loader);
            Object builder = call(factory, null);
            call(title, builder, PROBE_TITLE);
            description.set(builder, PROBE_DESCRIPTION);
            Object probe = call(build, null, builder, PROBE_NAME);
            if (probe == null) throw new IllegalStateException("The chat menu built no row");
            Field name = null, label = null;
            for (Field field : probe.getClass().getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers())) continue;
                field.setAccessible(true);
                Object value = field.get(probe);
                if (field.getType() == String.class && PROBE_NAME.equals(value)) {
                    if (name != null) throw new IllegalStateException("The chat menu row has two names");
                    name = field;
                }
                if (field.getType() == CharSequence.class && value != null && PROBE_TITLE.equals(value.toString())) {
                    if (label != null) throw new IllegalStateException("The chat menu row has two titles");
                    label = field;
                }
            }
            if (name == null || label == null) throw new IllegalStateException("The chat menu row keeps no name or title");
            return new Rows(route, probe.getClass(), name, label);
        }

        /** Messenger's name for the row, or null for an empty slot or anything else. */
        String name(Object row) throws IllegalAccessException {
            if (!type.isInstance(row)) return null;
            Object value = name.get(row);
            return value instanceof String ? (String) value : null;
        }

        /** The words the row shows, on one line, or null. */
        String title(Object row) throws IllegalAccessException {
            if (!type.isInstance(row)) return null;
            Object value = title.get(row);
            if (value == null) return null;
            String text = value.toString().replace('\n', ' ').replace('\r', ' ').trim();
            return text.isEmpty() || text.length() > 60 ? null : text;
        }

        private static Object call(Method method, Object on, Object... arguments) throws Throwable {
            try {
                return method.invoke(on, arguments);
            } catch (InvocationTargetException error) {
                throw error.getCause() != null ? error.getCause() : error;
            }
        }
    }
}
