package app.hushmessenger.extension;

import android.content.Context;
import android.content.SharedPreferences;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Your own order for the actions you get by holding a message, and the ones you'd rather not see, kept apart for messages
 * you sent and messages you got (#144). Messenger makes the whole list of a message's actions, then puts the first few in
 * the bar under the message and the rest under More. The patch hands the list here just before that split, so the bar
 * takes the first ones of your order that the message has. The More sheet keeps your order too, where Messenger would
 * otherwise move a few of its own picks to the top.
 *
 * Each action is known by its name in Messenger's code (REPLY, FORWARD, PIN), read off the action with Enum.name(), and
 * settings show it with the words Messenger puts on it, saved the first time it comes by. Off, Pause and safe mode hand
 * the list back as Messenger made it, and keep the order for later.
 */
public final class MessageActions {
    static final String KEY = "message_actions";
    static final String SENT = "sent", GOT = "got";
    static final List<String> SIDES = List.of(SENT, GOT);
    private static final String ORDER = "message_actions_order_", HIDDEN = "message_actions_hidden_", SEEN = "message_actions_seen_";
    private static final String LABEL = "message_actions_label_";
    /** Messenger's own More, which it adds after the split. It never reaches this list, but a later build could change that. */
    static final String MORE = "MORE";
    /** More than any message's menu holds, so a long list can't make the More sheet keep a list this big alive. */
    private static final int REMEMBERED = 40;

    /**
     * The actions of the menu arranged last and whose side it was. The More sheet gets the same action objects, so it
     * knows its side by finding one of them here. Weak, so a closed menu doesn't keep its chat's screen alive.
     */
    private static volatile Menu last;
    /** Per action class: its type's field and its title's field, or an empty array when the class doesn't read as an action. */
    private static final Map<Class<?>, Field[]> fields = new ConcurrentHashMap<>();
    /** Titles already saved this run, so a long press writes settings only when something new or renamed comes by. */
    private static final Map<String, String> savedLabels = new ConcurrentHashMap<>();

    private static final class Menu {
        final List<WeakReference<Object>> items;
        final String side;

        Menu(List<?> items, String side) {
            int count = Math.min(items.size(), REMEMBERED);
            this.items = new ArrayList<>(count);
            for (int i = 0; i < count; i++) this.items.add(new WeakReference<>(items.get(i)));
            this.side = side;
        }

        boolean holds(Object item) {
            for (WeakReference<Object> kept : items) if (item != null && kept.get() == item) return true;
            return false;
        }
    }

    private MessageActions() {}

    static void resetForTests() {
        last = null;
        fields.clear();
        savedLabels.clear();
    }

    /**
     * The patched menu builder's finished list, before Messenger splits it into the bar and More. Takes 1 for a message you
     * sent, 0 for one you got, and -1 when the patch couldn't tell, which leaves the menu as Messenger made it. Hands back
     * the same list when nothing changes, and a new one otherwise, which the patch copies into the kind of list Messenger
     * expects.
     */
    public static List<?> arrange(List<?> items, int sent) {
        try {
            if (items == null || items.isEmpty()) return items;
            if (sent < 0) {
                last = null;
                return items;
            }
            String side = sent != 0 ? SENT : GOT;
            last = new Menu(items, side);
            if (!Settings.enabled(KEY)) return items;
            List<String> names = names(items);
            remember(side, items, names);
            if (!customized(side)) return items;
            List<Object> arranged = order(items, names, order(side), hidden(side));
            return same(arranged, items) ? items : arranged;
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Can't arrange the message's actions", error);
            return items;
        }
    }

    /**
     * The More sheet's list after Messenger's own reordering, and the list as the menu handed it over. When your order is
     * in use for the message the sheet came from, the sheet keeps it.
     */
    public static List<?> more(List<?> reordered, List<?> handed) {
        try {
            if (handed == null || handed.isEmpty() || !Settings.enabled(KEY)) return reordered;
            String side = sideOf(handed);
            if (side == null || !customized(side)) return reordered;
            List<Object> kept = order(handed, names(handed), order(side), hidden(side));
            return reordered != null && same(kept, reordered) ? reordered : kept;
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Can't keep the More sheet's order", error);
            return reordered;
        }
    }

    /** The side of the menu these actions came from, or null when they aren't the last menu's. */
    static String sideOf(List<?> handed) {
        Menu menu = last;
        if (menu == null) return null;
        for (Object item : handed) if (menu.holds(item)) return menu.side;
        return null;
    }

    private static List<String> names(List<?> items) throws IllegalAccessException {
        List<String> names = new ArrayList<>(items.size());
        for (Object item : items) names.add(name(item));
        return names;
    }

    /**
     * The items in your order: first the ones you placed, by their place, then any you haven't placed yet in Messenger's
     * order, and none you hid. An item whose name can't be read stays where Messenger put it among the rest.
     */
    static List<Object> order(List<?> items, List<String> names, List<String> order, Set<String> hidden) {
        List<Integer> kept = new ArrayList<>(items.size());
        for (int i = 0; i < items.size(); i++) {
            String name = names.get(i);
            if (name == null || MORE.equals(name) || !hidden.contains(name)) kept.add(i);
        }
        // A stable sort, so two of one kind and everything not placed yet keep Messenger's order among themselves.
        kept.sort((a, b) -> Integer.compare(rank(names.get(a), order), rank(names.get(b), order)));
        List<Object> arranged = new ArrayList<>(kept.size());
        for (int i : kept) arranged.add(items.get(i));
        return arranged;
    }

    /** An action's place in your order, with everything you haven't placed after all of it. */
    private static int rank(String name, List<String> order) {
        int at = name == null || MORE.equals(name) ? -1 : order.indexOf(name);
        return at < 0 ? order.size() : at;
    }

    /** The same items in the same order, by identity: Messenger's actions may compare equal to each other. */
    static boolean same(List<?> one, List<?> other) {
        if (one.size() != other.size()) return false;
        for (int i = 0; i < one.size(); i++) if (one.get(i) != other.get(i)) return false;
        return true;
    }

    /** Whether you changed anything for this side. Until then Messenger's own order stands, even with the switch on. */
    static boolean customized(String side) {
        SharedPreferences prefs = Settings.preferences;
        return prefs != null && (!prefs.getString(ORDER + side, "").isEmpty() || !prefs.getString(HIDDEN + side, "").isEmpty());
    }

    /** Your order for this side, or empty when you haven't moved anything. */
    static List<String> order(String side) { return split(Settings.preferences.getString(ORDER + side, "")); }

    static Set<String> hidden(String side) { return new LinkedHashSet<>(split(Settings.preferences.getString(HIDDEN + side, ""))); }

    /** The actions seen on this side so far, in the order Messenger first showed them. */
    static List<String> seen(String side) { return split(Settings.preferences.getString(SEEN + side, "")); }

    /** The list settings show: your order, then anything seen since, in Messenger's order. */
    static List<String> shown(String side) {
        List<String> all = new ArrayList<>(order(side));
        for (String name : seen(side)) if (!all.contains(name)) all.add(name);
        return all;
    }

    /** Moves one action a place up (-1) or down (1) in the list settings show, and keeps that as your order. */
    static boolean move(String side, String name, int by) {
        List<String> all = shown(side);
        int from = all.indexOf(name), to = from + by;
        if (from < 0 || to < 0 || to >= all.size()) return false;
        Collections.swap(all, from, to);
        Settings.preferences.edit().putString(ORDER + side, String.join(",", all)).apply();
        return true;
    }

    static void setHidden(String side, String name, boolean hide) {
        Set<String> now = hidden(side);
        if (hide ? !now.add(name) : !now.remove(name)) return;
        Settings.preferences.edit().putString(HIDDEN + side, String.join(",", now)).apply();
    }

    /** Your order and hidden actions for this side, as they were, for Undo. */
    static String[] saved(String side) {
        SharedPreferences prefs = Settings.preferences;
        return new String[] {prefs.getString(ORDER + side, ""), prefs.getString(HIDDEN + side, "")};
    }

    static void restore(String side, String[] saved) {
        Settings.preferences.edit().putString(ORDER + side, saved[0]).putString(HIDDEN + side, saved[1]).apply();
    }

    /** Back to Messenger's order with nothing hidden. The actions seen stay listed. */
    static void reset(String side) {
        Settings.preferences.edit().remove(ORDER + side).remove(HIDDEN + side).apply();
    }

    /** The words Messenger shows on an action, or its code name in plain words when it hasn't come by with them yet. */
    static String label(String name) {
        String saved = Settings.preferences.getString(LABEL + name, "");
        if (!saved.isEmpty()) return saved;
        String words = name.replace('_', ' ').toLowerCase(Locale.ROOT);
        return words.isEmpty() ? name : Character.toUpperCase(words.charAt(0)) + words.substring(1);
    }

    /** Notes this side's new actions and any title that changed, in one write, and only then. */
    private static void remember(String side, List<?> items, List<String> names) {
        SharedPreferences prefs = Settings.preferences;
        List<String> seen = seen(side);
        SharedPreferences.Editor edit = null;
        boolean added = false;
        for (int i = 0; i < items.size(); i++) {
            String name = names.get(i);
            if (name == null || MORE.equals(name)) continue;
            if (!seen.contains(name)) { seen.add(name); added = true; }
            String title = title(items.get(i));
            if (title == null || title.equals(savedLabels.get(name))) continue;
            savedLabels.put(name, title);
            if (title.equals(prefs.getString(LABEL + name, ""))) continue;
            if (edit == null) edit = prefs.edit();
            edit.putString(LABEL + name, title);
        }
        if (added) {
            if (edit == null) edit = prefs.edit();
            edit.putString(SEEN + side, String.join(",", seen));
        }
        if (edit != null) edit.apply();
    }

    /** The action's kind by its enum constant's name, or null when the item isn't one of Messenger's actions. */
    static String name(Object item) throws IllegalAccessException {
        if (item == null) return null;
        Field[] found = fieldsOf(item.getClass());
        if (found.length == 0) return null;
        Object kind = found[0].get(item);
        return kind instanceof Enum ? ((Enum<?>) kind).name() : null;
    }

    /** The title Messenger shows on the action, in the phone's language, or null. */
    private static String title(Object item) {
        Context app = Settings.appContext;
        if (item == null || app == null) return null;
        Field[] found = fieldsOf(item.getClass());
        if (found.length == 0) return null;
        try {
            android.content.res.Resources resources = app.getResources();
            if (found[1] == null) {
                found[1] = titleField(item, resources);
                if (found[1] == null) return null;
            }
            String title = String.valueOf(resources.getText(found[1].getInt(item))).trim().replace('\n', ' ');
            return title.isEmpty() || title.length() > 60 ? null : title;
        } catch (IllegalAccessException | RuntimeException error) {
            return null;
        }
    }

    /** The item's one int field that holds a string resource right now, or null when none or several do. */
    private static Field titleField(Object item, android.content.res.Resources resources) throws IllegalAccessException {
        Field title = null;
        for (Field field : item.getClass().getDeclaredFields()) {
            if (Modifier.isStatic(field.getModifiers()) || field.getType() != int.class) continue;
            field.setAccessible(true);
            int value = field.getInt(item);
            // Resource ids sit far above the small counts and flags the other ints hold.
            if ((value >>> 24) == 0) continue;
            String type;
            try { type = resources.getResourceTypeName(value); }
            catch (android.content.res.Resources.NotFoundException missing) { continue; }
            if (!"string".equals(type)) continue;
            if (title != null) return null;
            title = field;
        }
        return title;
    }

    /**
     * The action's one enum field whose type has REPLY and MORE, read once per class, and a slot for its title field, which
     * only shows on a real item. A class with no such enum field, or two, isn't taken for an action.
     */
    private static Field[] fieldsOf(Class<?> type) {
        Field[] known = fields.get(type);
        if (known != null) return known;
        Field kind = null;
        int kinds = 0;
        for (Field field : type.getDeclaredFields()) {
            if (Modifier.isStatic(field.getModifiers())) continue;
            if (field.getType().isEnum() && hasConstants(field.getType(), "REPLY", MORE)) { kind = field; kinds++; }
        }
        Field[] answer = new Field[0];
        if (kinds == 1) {
            kind.setAccessible(true);
            answer = new Field[] {kind, null};
        }
        Field[] raced = fields.putIfAbsent(type, answer);
        return raced != null ? raced : answer;
    }

    private static boolean hasConstants(Class<?> type, String... wanted) {
        Object[] constants = type.getEnumConstants();
        if (constants == null) return false;
        List<String> names = new ArrayList<>();
        for (Object constant : constants) names.add(((Enum<?>) constant).name());
        return names.containsAll(Arrays.asList(wanted));
    }

    static List<String> split(String joined) {
        List<String> parts = new ArrayList<>();
        if (joined == null) return parts;
        for (String part : joined.split(",")) if (!part.isEmpty() && !parts.contains(part)) parts.add(part);
        return parts;
    }
}
