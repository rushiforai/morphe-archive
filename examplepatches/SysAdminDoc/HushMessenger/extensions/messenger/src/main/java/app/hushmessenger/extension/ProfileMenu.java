package app.hushmessenger.extension;

import android.view.Menu;
import android.view.MenuItem;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

/**
 * Hide profile menu items (#201): the menu on someone's picture beside their message in a chat. Messenger hands over the
 * popup with every row in its menu, just before it shows. Rows picked in settings are hidden, not removed: Messenger
 * runs a row by its position in its own list, so the positions have to stay as they were. Each row's title is what's
 * remembered and what settings lists, since these rows have no other name.
 */
public final class ProfileMenu {
    static final String KEY = "profile_menu_items";
    static final String HIDDEN = "profile_menu_items_hidden";
    private static final String SEEN = "profile_menu_items_seen";
    /** Enough for every row Messenger has, with room for the titles of a language switched away from. */
    private static final int REMEMBERED = 60;
    /** A row title is a few words. Anything longer isn't one, so it's never saved. */
    private static final int LONGEST_TITLE = 60;

    private ProfileMenu() { }

    /** The popup about to show. Never throws. */
    public static void showing(Object popup) {
        try {
            if (popup == null || !Settings.wouldUse(KEY)) return;
            Menu menu = menuOf(popup);
            if (menu == null) throw new IllegalStateException("No menu in " + popup.getClass().getName());
            Set<String> hidden = hidden();
            List<String> titles = new ArrayList<>();
            List<MenuItem> drop = new ArrayList<>();
            int keep = 0;
            for (int i = 0; i < menu.size(); i++) {
                MenuItem item = menu.getItem(i);
                if (!item.isVisible()) continue;
                String title = title(item);
                if (title != null) titles.add(title);
                if (title != null && hidden.contains(title)) drop.add(item);
                else keep++;
            }
            remember(titles);
            // Never an empty menu: with every row picked, the menu shows them all.
            if (drop.isEmpty() || keep == 0) return;
            for (MenuItem item : drop) item.setVisible(false);
            Settings.enabled(KEY);
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Can't hide profile menu items", error);
        }
    }

    static List<String> seen() {
        return ChatMenuItems.split(Settings.preferences.getString(SEEN, ""));
    }

    static Set<String> hidden() {
        return new LinkedHashSet<>(ChatMenuItems.split(Settings.preferences.getString(HIDDEN, "")));
    }

    static void setHidden(String title, boolean hide) {
        Set<String> now = hidden();
        if (hide) now.add(title);
        else now.remove(title);
        Settings.preferences.edit().putString(HIDDEN, String.join("\n", now)).apply();
    }

    private static String title(MenuItem item) {
        CharSequence title = item.getTitle();
        if (title == null) return null;
        String text = title.toString().replace('\n', ' ').trim();
        return text.isEmpty() || text.length() > LONGEST_TITLE ? null : text;
    }

    private static void remember(List<String> titles) {
        List<String> seen = seen();
        boolean changed = false;
        for (String title : titles) {
            if (seen.contains(title)) continue;
            seen.add(title);
            changed = true;
        }
        if (!changed) return;
        while (seen.size() > REMEMBERED) seen.remove(0);
        Settings.preferences.edit().putString(SEEN, String.join("\n", seen)).apply();
    }

    /** The one menu the popup holds, in a field of its own class or one it extends. Null when there isn't exactly one. */
    private static Menu menuOf(Object popup) throws IllegalAccessException {
        Menu found = null;
        for (Class<?> type = popup.getClass(); type != null && type != Object.class; type = type.getSuperclass()) {
            for (Field field : type.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) || !Menu.class.isAssignableFrom(field.getType())) continue;
                field.setAccessible(true);
                Menu held = (Menu) field.get(popup);
                if (held == null || held == found) continue;
                if (found != null) return null;
                found = held;
            }
        }
        return found;
    }
}
