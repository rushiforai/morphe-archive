package app.hushmessenger.extension;

import android.content.Context;
import android.content.SharedPreferences;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

/**
 * The Menu tab's own rows (#189): the ones picked in settings stay out of it, and Log out can sit in it. Each row is
 * known by the class of the folder key it carries, which is the same in every language, and settings list it under the
 * words Messenger last showed on it. The Settings row and HushMessenger's own copies of it are never offered, and a
 * menu never loses every row.
 */
final class MenuRows {
    /** The Log out row's switch, under the Menu row in the settings App tab. */
    static final String LOG_OUT = "menu_log_out";
    static final String HIDDEN = "menu_rows_hidden";
    private static final String SEEN = "menu_rows_seen", LABEL = "menu_rows_label_";
    /** More than the Menu tab shows, so a row Messenger drops falls off the list in time. */
    private static final int REMEMBERED = 40;
    /** How much of a folder key's own value goes into the name. Enough to tell two rows apart, short enough to store. */
    private static final int VALUE = 48;

    private MenuRows() { }

    /**
     * Messenger's name for the row, or null when it carries no folder key of its own, or carries the Settings one that
     * HushMessenger's rows copy. A key with values of its own, like one shortcut of several, keeps them in the name.
     */
    static String name(Object row) {
        if (row == null) return null;
        try {
            Object key = folderKey(row);
            if (key == null) return null;
            String type = key.getClass().getName();
            int dot = type.lastIndexOf('.');
            String named = dot < 0 ? type : type.substring(dot + 1);
            if (named.isEmpty() || named.endsWith("SettingsFolderKey")) return null;
            StringBuilder name = new StringBuilder(named);
            for (Field field : key.getClass().getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers())) continue;
                field.setAccessible(true);
                String value = own(field.get(key));
                if (value != null) name.append('#').append(value);
            }
            return name.toString();
        } catch (ReflectiveOperationException | RuntimeException | LinkageError error) {
            return null;
        }
    }

    /** A folder key's own value as plain text, or null for anything that isn't one it was built with. */
    private static String own(Object value) {
        if (!(value instanceof String) && !(value instanceof Number) && !(value instanceof Boolean)
                && !(value instanceof Character) && !(value instanceof Enum)) return null;
        String text = value instanceof Enum ? ((Enum<?>) value).name() : String.valueOf(value);
        text = text.replace('\n', ' ').replace('\r', ' ').replace('#', ' ').trim();
        if (text.isEmpty()) return null;
        return text.length() > VALUE ? text.substring(0, VALUE) : text;
    }

    /** The row's own folder key, read from the field Messenger declares it in. */
    private static Object folderKey(Object row) throws IllegalAccessException {
        for (Field field : row.getClass().getDeclaredFields()) {
            if (Modifier.isStatic(field.getModifiers()) || !field.getType().getName().endsWith("DrawerFolderKey")) continue;
            field.setAccessible(true);
            return field.get(row);
        }
        return null;
    }

    /** The words on the row, on one line, or null when it shows none. */
    static String title(Object row) {
        if (row == null) return null;
        try {
            String found = null;
            int titles = 0;
            for (Field field : row.getClass().getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) || field.getType() != String.class) continue;
                field.setAccessible(true);
                titles++;
                Object value = field.get(row);
                if (value instanceof String) found = (String) value;
            }
            // One title per row: a second String field means this isn't the shape the Menu tab builds.
            if (titles != 1 || found == null) return null;
            String text = found.replace('\n', ' ').replace('\r', ' ').trim();
            return text.isEmpty() || text.length() > 60 ? null : text;
        } catch (ReflectiveOperationException | RuntimeException | LinkageError error) {
            return null;
        }
    }

    /** Notes the rows the Menu tab shows, and the words on each, in one write and only when something changed. */
    static void remember(List<?> rows) {
        SharedPreferences prefs = Settings.preferences;
        if (prefs == null || rows == null || !Settings.running()) return;
        List<String> seen = seen();
        SharedPreferences.Editor edit = null;
        boolean added = false;
        for (Object row : rows) {
            String name = name(row);
            String title = title(row);
            // Offer only what the Menu tab's own shape hands over: a folder key of its own and the words on it.
            if (name == null || title == null) continue;
            if (!seen.contains(name)) {
                seen.add(name);
                added = true;
            }
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

    /**
     * Takes the picked rows out of [rows]. Nothing comes out while every row is picked, so the Menu tab is never empty,
     * and the Settings row stays whatever is picked. Returns how many rows came out.
     */
    static int hide(List<?> rows) {
        // Paused or in safe mode the Menu tab is Messenger's own again, picked rows included.
        if (rows == null || rows.isEmpty() || !Settings.running()) return 0;
        Set<String> hidden = hidden();
        if (hidden.isEmpty()) return 0;
        List<String> names = new ArrayList<>(rows.size());
        int drop = 0, keep = 0;
        for (Object row : rows) {
            String name = name(row);
            names.add(name);
            if (name == null) continue;
            if (hidden.contains(name)) drop++;
            else keep++;
        }
        if (drop == 0 || keep == 0) return 0;
        for (int i = rows.size() - 1; i >= 0; i--) {
            String name = names.get(i);
            if (name != null && hidden.contains(name)) rows.remove(i);
        }
        return drop;
    }

    /** The rows seen so far, in the order the Menu tab first showed them. */
    static List<String> seen() {
        SharedPreferences prefs = Settings.preferences;
        return ChatMenuItems.split(prefs == null ? "" : prefs.getString(SEEN, ""));
    }

    static Set<String> hidden() {
        SharedPreferences prefs = Settings.preferences;
        return new LinkedHashSet<>(ChatMenuItems.split(prefs == null ? "" : prefs.getString(HIDDEN, "")));
    }

    static void setHidden(String name, boolean hide) {
        SharedPreferences prefs = Settings.preferences;
        if (prefs == null) return;
        Set<String> now = hidden();
        if (hide ? !now.add(name) : !now.remove(name)) return;
        prefs.edit().putString(HIDDEN, String.join("\n", now)).apply();
    }

    /** The words Messenger last showed on a row, or the class it was named after until it shows them. */
    static String label(String name) {
        SharedPreferences prefs = Settings.preferences;
        String saved = prefs == null ? "" : prefs.getString(LABEL + name, "");
        if (!saved.isEmpty()) return saved;
        int hash = name.indexOf('#');
        String type = hash < 0 ? name : name.substring(0, hash);
        String words = type.replace("DrawerFolderKey", "").replace("FolderKey", "").replace("$", " ")
            .replaceAll("(?<=[a-z])(?=[A-Z])", " ").replaceAll("\\s+", " ").trim();
        return words.isEmpty() ? name : words;
    }

    /** Whether the Menu tab gets a Log out row: the switch is on and this build has Messenger's own Log out. */
    static boolean logOutInMenu() {
        SharedPreferences prefs = Settings.preferences;
        return prefs != null && Settings.running() && prefs.getBoolean(LOG_OUT, false) && LogOut.available();
    }

    /** The words the Log out row shows, in the phone's language. */
    static String logOutLabel(Context context) {
        return new SettingsText(context).get("log_out");
    }
}
