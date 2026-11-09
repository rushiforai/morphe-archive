package app.hushmessenger.extension;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.widget.Toast;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Chats picked with Hide from chat list in the chat list's long-press menu (#139). Each read of the chat list leaves
 * them out, so a new message doesn't bring one back. Search reads chats on its own path and still finds them. The picks
 * are kept per account on this phone, and Off, Pause and safe mode hand the list back as Messenger made it while keeping
 * the picks for later.
 */
public final class ChatHiding {
    static final String KEY = Settings.HIDDEN_CHATS;
    /** "HU" and a 1. Messenger's own rows use small ids, so this one can't be mistaken for any of them. */
    static final int ROW_ID = 0x48550001;
    private static final String SAVED = "hidden_chat_keys_";
    private static final String ROW_NAME = "hush_hide_chat";
    private static final long RELOAD_MILLIS = 2000;

    /** Null until a patched build's route is read, and always null in a build that didn't prove one. */
    static Route route;
    /** Null until an account's hidden chats are read: each chat's key and the name it had when it was hidden. */
    private static LinkedHashMap<String, String> hidden;
    private static String savedUnder;
    /** Until when "no account yet" stands, so the chat list's reads don't each list the database folder. */
    private static long noAccountUntil;
    /** Messenger keeps a handful of list suppliers, so a list with identity checks is enough. */
    private static final List<WeakReference<Object>> suppliers = new ArrayList<>();

    private ChatHiding() {}

    static synchronized void resetForTests() {
        route = null;
        hidden = null;
        savedUnder = null;
        noAccountUntil = 0;
        suppliers.clear();
    }

    /** The patched items read hands over its supplier and the chats its filters kept, and walks what comes back. */
    public static Object inboxRows(Object supplier, Object rows) {
        try {
            Route target = route();
            if (target == null || supplier == null || !(rows instanceof List)) return rows;
            List<?> list = (List<?>) rows;
            synchronized (ChatHiding.class) {
                remember(supplier);
                Map<String, String> saved = saved();
                if (saved.isEmpty() || list.isEmpty() || !Settings.enabled(KEY)) return rows;
                List<Object> kept = new ArrayList<>(list.size());
                for (Object row : list) {
                    if (!target.summary.isInstance(row) || !saved.containsKey(target.key(row))) kept.add(row);
                }
                return kept.size() == list.size() ? rows : target.copyOf(kept);
            }
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Can't hide chosen chats", error);
            return rows;
        }
    }

    /**
     * The chat menu's finished rows. Messenger pads the list with empty slots up to the count it expected, but its menu
     * reads every entry and usually gets a full list, so the row takes the first empty slot when there is one and goes on
     * the end otherwise.
     */
    public static void menuRows(Object menu, ArrayList<Object> rows) {
        try {
            Route target = route();
            if (target == null || rows == null || !target.menu.isInstance(menu) || !Settings.wouldUse(KEY)) return;
            int slot = rows.indexOf(null);
            Object summary = target.menuSummary.get(menu);
            if (!target.summary.isInstance(summary)) return;
            boolean shown;
            synchronized (ChatHiding.class) {
                shown = !asked().containsKey(target.key(summary));
            }
            Object row = target.row(label(shown ? "hidden_chats_hide" : "hidden_chats_show"), shown ? "EYE_CROSS" : "EYE");
            if (row == null) return;
            if (slot < 0) rows.add(row);
            else rows.set(slot, row);
            Settings.enabled(KEY);
        } catch (Throwable error) {
            Settings.hookFailed(KEY, "Can't add Hide from chat list", error);
        }
    }

    /** The chat menu's tap asks this first. False for Messenger's own rows, which it then handles as before. */
    public static boolean menuTapped(Object menu, int id) {
        if (id != ROW_ID) return false;
        try {
            Route target = route();
            if (target == null || !target.menu.isInstance(menu) || !Settings.enabled(KEY)) return true;
            Object summary = target.menuSummary.get(menu);
            if (!target.summary.isInstance(summary)) return true;
            String key = target.key(summary);
            boolean hiding;
            synchronized (ChatHiding.class) {
                Map<String, String> saved = asked();
                if (savedUnder == null) {
                    changed(target, "hidden_chats_failed");
                    return true;
                }
                hiding = saved.remove(key) == null;
                if (hiding) saved.put(key, target.name(summary, savedUnder));
                save();
            }
            changed(target, hiding ? "hidden_chats_hidden" : "hidden_chats_shown");
        } catch (Throwable error) {
            Settings.hookFailed(KEY, "Can't hide this chat", error);
        }
        return true;
    }

    /** This account's hidden chats for settings, in the order they were hidden, each as {key, name}. */
    static List<String[]> chosen() {
        List<String[]> chats = new ArrayList<>();
        synchronized (ChatHiding.class) {
            for (Map.Entry<String, String> chat : asked().entrySet()) chats.add(new String[] {chat.getKey(), chat.getValue()});
        }
        return chats;
    }

    /** Settings' Unhide. The chat list reads itself again, and settings says what happened. */
    static boolean unhide(String key) {
        synchronized (ChatHiding.class) {
            if (asked().remove(key) == null) return false;
            save();
        }
        try {
            Route target = route();
            if (target != null) changed(target, null);
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Can't refresh the chat list", error);
        }
        return true;
    }

    /** Runs each list's own subscribe again, which reads it back through {@link #inboxRows}, then says what happened. */
    private static void changed(Route target, String message) {
        List<Object> live = new ArrayList<>();
        synchronized (ChatHiding.class) {
            for (Iterator<WeakReference<Object>> it = suppliers.iterator(); it.hasNext(); ) {
                Object supplier = it.next().get();
                if (supplier == null) it.remove();
                else live.add(supplier);
            }
        }
        new Handler(Looper.getMainLooper()).post(() -> {
            for (Object supplier : live) {
                try {
                    InboxRefresh.Route.of(target.refresh, supplier.getClass()).subscribe(supplier);
                } catch (Throwable error) {
                    Settings.hookFailedPrivately(KEY, "Can't refresh the chat list", error);
                }
            }
            Context context = Settings.appContext;
            if (message != null && context != null) Toast.makeText(context, new SettingsText(context).get(message), Toast.LENGTH_SHORT).show();
        });
    }

    private static void remember(Object supplier) {
        for (Iterator<WeakReference<Object>> it = suppliers.iterator(); it.hasNext(); ) {
            Object known = it.next().get();
            if (known == null) it.remove();
            else if (known == supplier) return;
        }
        suppliers.add(new WeakReference<>(supplier));
    }

    private static String label(String key) {
        Context context = Settings.appContext;
        return context == null ? SettingsText.ENGLISH.get(key) : new SettingsText(context).get(key);
    }

    /** The hidden chats for a menu, a tap or settings. Someone acting on a chat asks for the account at once; the pause is for reads. */
    private static Map<String, String> asked() {
        noAccountUntil = 0;
        return saved();
    }

    /** This account's hidden chats. Empty, and not kept, until the account can be told, which is asked at most every RELOAD_MILLIS. */
    private static Map<String, String> saved() {
        if (hidden != null) return hidden;
        long now = android.os.SystemClock.uptimeMillis();
        if (now < noAccountUntil) return new LinkedHashMap<>();
        Context context = Settings.appContext;
        String user = context == null ? null : LocalSearchStore.currentUser(context.getDatabasePath(KEY).getParentFile());
        if (user == null || Settings.preferences == null) {
            noAccountUntil = now + RELOAD_MILLIS;
            return new LinkedHashMap<>();
        }
        LinkedHashMap<String, String> read = new LinkedHashMap<>();
        for (String line : Settings.preferences.getString(SAVED + user, "").split("\n")) {
            int tab = line.indexOf('\t');
            if (tab > 0) read.put(line.substring(0, tab), line.substring(tab + 1));
            else if (!line.isEmpty()) read.put(line, "");
        }
        savedUnder = user;
        hidden = read;
        return read;
    }

    private static void save() {
        if (savedUnder == null) return;
        List<String> lines = new ArrayList<>();
        for (Map.Entry<String, String> chat : hidden.entrySet()) lines.add(chat.getKey() + "\t" + chat.getValue());
        Settings.preferences.edit().putString(SAVED + savedUnder, String.join("\n", lines)).apply();
    }

    private static Route route() throws ReflectiveOperationException {
        if (route != null) return route;
        String text = HostScreens.hiddenChatRoute();
        if (text == null || text.isEmpty()) return null;
        route = Route.of(text, ChatHiding.class.getClassLoader());
        return route;
    }

    /**
     * What the patch proved, as "|"-joined parts: the chat's key, name and people, each person's info, account key and
     * id, the info's name and the text inside it, the menu's chat, then the row builder's factory, id, icon, title,
     * description and build, and the chat list's "subscribe|listed". Fields are "Lowner;->name:type" and calls
     * "Lowner;->name(params)return".
     */
    static final class Route {
        final Class<?> summary;
        final Class<?> menu;
        final Field key;
        final Field name;
        final Field participants;
        final Field participant;
        final Field user;
        final Field userId;
        final Field secretName;
        final Field secretText;
        final Field menuSummary;
        final Method factory;
        final Field id;
        final Method icon;
        final Method title;
        final Field description;
        final Method build;
        final String refresh;
        private final Method copyOf;

        private Route(Field[] fields, Method[] calls, String refresh) throws NoSuchMethodException {
            key = fields[0];
            name = fields[1];
            participants = fields[2];
            participant = fields[3];
            user = fields[4];
            userId = fields[5];
            secretName = fields[6];
            secretText = fields[7];
            menuSummary = fields[8];
            id = fields[9];
            description = fields[10];
            factory = calls[0];
            icon = calls[1];
            title = calls[2];
            build = calls[3];
            summary = key.getDeclaringClass();
            menu = menuSummary.getDeclaringClass();
            this.refresh = refresh;
            copyOf = participants.getType().getMethod("copyOf", Collection.class);
            if (!Modifier.isStatic(factory.getModifiers()) || !Modifier.isStatic(build.getModifiers()) || id.getType() != int.class
                    || icon.getParameterTypes().length != 1 || build.getParameterTypes().length != 2) {
                throw new IllegalStateException("The hidden chat route has the wrong shape");
            }
        }

        static Route of(String text, ClassLoader loader) throws ReflectiveOperationException {
            String[] parts = text.split("\\|", -1);
            if (parts.length != 17) throw shape();
            Field[] fields = new Field[11];
            for (int i = 0; i < 9; i++) fields[i] = field(parts[i], loader);
            fields[9] = field(parts[10], loader);
            fields[10] = field(parts[13], loader);
            Method[] calls = {method(parts[9], loader), method(parts[11], loader), method(parts[12], loader), method(parts[14], loader)};
            return new Route(fields, calls, parts[15] + "|" + parts[16]);
        }

        String key(Object chat) throws IllegalAccessException {
            return String.valueOf(key.get(chat));
        }

        /** The chat's own name, or else the names of everyone in it but this account, for the settings list. */
        String name(Object chat, String self) throws IllegalAccessException {
            Object own = name.get(chat);
            if (own instanceof String && !((String) own).trim().isEmpty()) return clean((String) own);
            List<String> people = new ArrayList<>();
            Object everyone = participants.get(chat);
            if (everyone instanceof Iterable) {
                for (Object person : (Iterable<?>) everyone) {
                    if (!participant.getDeclaringClass().isInstance(person)) continue;
                    Object info = participant.get(person);
                    if (info == null) continue;
                    Object account = user.get(info);
                    if (account != null && String.valueOf(userId.get(account)).equals(self)) continue;
                    Object secret = secretName.get(info);
                    Object text = secret == null ? null : secretText.get(secret);
                    if (text instanceof String && !((String) text).trim().isEmpty()) people.add(((String) text).trim());
                }
            }
            return clean(String.join(", ", people));
        }

        private static String clean(String text) {
            return text.replace('\t', ' ').replace('\n', ' ').replace('\r', ' ').trim();
        }

        /** A new row from Messenger's own builder, with the icon named [icon] from its enum. */
        Object row(String text, String iconName) throws Throwable {
            Object constant = null;
            Class<?> icons = icon.getParameterTypes()[0];
            for (Field field : icons.getDeclaredFields()) {
                if (!Modifier.isStatic(field.getModifiers()) || field.getType() != icons) continue;
                field.setAccessible(true);
                Object value = field.get(null);
                if (value instanceof Enum && ((Enum<?>) value).name().equals(iconName)) constant = value;
            }
            if (constant == null) return null;
            Object builder = call(factory, null);
            id.setInt(builder, ROW_ID);
            call(icon, builder, constant);
            call(title, builder, text);
            description.set(builder, text);
            return call(build, null, builder, ROW_NAME);
        }

        Object copyOf(List<Object> rows) throws Throwable {
            return call(copyOf, null, rows);
        }

        private static Object call(Method method, Object on, Object... arguments) throws Throwable {
            try {
                return method.invoke(on, arguments);
            } catch (InvocationTargetException error) {
                throw error.getCause() != null ? error.getCause() : error;
            }
        }

        private static IllegalStateException shape() {
            return new IllegalStateException("The hidden chat route has the wrong shape");
        }

        static Field field(String reference, ClassLoader loader) throws ReflectiveOperationException {
            int arrow = reference.indexOf(";->");
            int colon = reference.indexOf(':', arrow);
            if (!reference.startsWith("L") || arrow < 0 || colon < 0) throw shape();
            Field field = type(reference.substring(0, arrow + 1), loader).getDeclaredField(reference.substring(arrow + 3, colon));
            if (!type(reference.substring(colon + 1), loader).equals(field.getType())) throw shape();
            field.setAccessible(true);
            return field;
        }

        static Method method(String reference, ClassLoader loader) throws ReflectiveOperationException {
            int arrow = reference.indexOf(";->");
            int open = reference.indexOf('(', arrow);
            int close = reference.indexOf(')', open);
            if (!reference.startsWith("L") || arrow < 0 || open < 0 || close < 0) throw shape();
            List<Class<?>> parameters = new ArrayList<>();
            String list = reference.substring(open + 1, close);
            for (int at = 0; at < list.length(); ) {
                int end = at;
                while (end < list.length() && list.charAt(end) == '[') end++;
                if (end == list.length()) throw shape();
                end = list.charAt(end) == 'L' ? list.indexOf(';', end) + 1 : end + 1;
                if (end <= at) throw shape();
                parameters.add(type(list.substring(at, end), loader));
                at = end;
            }
            Method method = type(reference.substring(0, arrow + 1), loader)
                .getDeclaredMethod(reference.substring(arrow + 3, open), parameters.toArray(new Class<?>[0]));
            if (!type(reference.substring(close + 1), loader).equals(method.getReturnType())) throw shape();
            method.setAccessible(true);
            return method;
        }

        private static Class<?> type(String descriptor, ClassLoader loader) throws ClassNotFoundException {
            switch (descriptor) {
                case "V": return void.class;
                case "Z": return boolean.class;
                case "B": return byte.class;
                case "S": return short.class;
                case "C": return char.class;
                case "I": return int.class;
                case "J": return long.class;
                case "F": return float.class;
                case "D": return double.class;
                default: break;
            }
            if (descriptor.startsWith("[")) return Class.forName(descriptor.replace('/', '.'), false, loader);
            if (descriptor.length() < 3 || !descriptor.startsWith("L") || !descriptor.endsWith(";")) throw shape();
            return Class.forName(descriptor.substring(1, descriptor.length() - 1).replace('/', '.'), false, loader);
        }
    }
}
