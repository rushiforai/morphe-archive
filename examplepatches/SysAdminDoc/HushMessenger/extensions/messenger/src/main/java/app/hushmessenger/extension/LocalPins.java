package app.hushmessenger.extension;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.widget.Toast;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

/**
 * Facebook's servers refuse a pin past the account's cap whatever the app sends (three on one account, five on another),
 * so a pin past it, or on a chat Messenger doesn't offer Pin for, stays on this phone. Each read of the chat list marks
 * those rows as pinned and moves them up under the server's pins, in the order they were pinned. Off, Pause and safe
 * mode put the list back as Messenger had it and keep the saved pins for later.
 */
public final class LocalPins {
    static final String KEY = Settings.PINNED_CHATS;
    private static final String SAVED = "local_pins_";
    private static final long RELOAD_MILLIS = 2000;

    /** Null until a patched build's route is read, and always null in a build that didn't prove one. */
    static Route route;
    /** Null until an account's saved pins are read. Another account's keys match none of this one's rows. */
    private static LinkedHashSet<String> pins;
    private static String savedUnder;
    /** Chats whose Pin row is there only because of this class: their pin can't go to the server. */
    private static final Set<String> offered = new HashSet<>();
    /** Rows this class marked. Identity only: a chat row's hash reads the flag being changed. */
    private static final List<WeakReference<Object>> marked = new ArrayList<>();
    /** Messenger keeps a handful of list suppliers, so a list with identity checks is enough. */
    private static final List<WeakReference<Object>> suppliers = new ArrayList<>();
    /** Suppliers already reloaded for a saved pin, see {@link #arrange}. */
    private static final List<WeakReference<Object>> reloaded = new ArrayList<>();

    private LocalPins() {}

    static synchronized void resetForTests() {
        route = null;
        pins = null;
        savedUnder = null;
        offered.clear();
        marked.clear();
        suppliers.clear();
        reloaded.clear();
    }

    /**
     * The patched items read calls this with its supplier, on whichever thread is reading. Messenger's first list after a
     * cold start has no flag on its own pins until something reloads it, which would leave saved pins above them, so the
     * first read that finds a saved pin reloads the list once.
     */
    public static void arrange(Object supplier) {
        try {
            Route target = route();
            if (target == null || supplier == null) return;
            synchronized (LocalPins.class) {
                remember(suppliers, supplier);
                Set<String> saved = saved();
                Set<String> showing = !saved.isEmpty() && Settings.enabled(KEY) ? saved : Collections.<String>emptySet();
                settle(target, showing);
                if (!showing.isEmpty() && reorder(target, supplier, showing) && remember(reloaded, supplier)) {
                    new Handler(Looper.getMainLooper()).postDelayed(() -> subscribe(target, supplier), RELOAD_MILLIS);
                }
            }
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Can't arrange pinned chats", error);
        }
    }

    /** Takes the mark off every row that's no longer pinned here. */
    private static void settle(Route target, Set<String> showing) throws ReflectiveOperationException {
        for (Iterator<WeakReference<Object>> it = marked.iterator(); it.hasNext(); ) {
            Object row = it.next().get();
            if (row == null) {
                it.remove();
            } else if (!showing.contains(target.key(row))) {
                target.flag.setBoolean(row, false);
                it.remove();
            }
        }
    }

    /** True when a saved pin is on the list. */
    private static boolean reorder(Route target, Object supplier, Set<String> showing) throws ReflectiveOperationException {
        List<?> rows = (List<?>) target.list.get(supplier);
        if (rows == null || rows.isEmpty()) return false;
        List<Object> server = new ArrayList<>();
        List<Object> rest = new ArrayList<>();
        List<Object> local = new ArrayList<>();
        for (Object row : rows) {
            if (!target.summary.isInstance(row)) {
                rest.add(row);
            } else if (showing.contains(target.key(row))) {
                local.add(row);
                if (!target.flag.getBoolean(row)) {
                    target.flag.setBoolean(row, true);
                    marked.add(new WeakReference<>(row));
                }
            } else if (target.flag.getBoolean(row) || target.otherFlag.getBoolean(row)) {
                server.add(row);
            } else {
                rest.add(row);
            }
        }
        if (local.isEmpty()) return false;
        List<String> order = new ArrayList<>(showing);
        List<Object> sorted = new ArrayList<>(local);
        Collections.sort(sorted, (a, b) -> {
            try {
                return order.indexOf(target.key(a)) - order.indexOf(target.key(b));
            } catch (IllegalAccessException error) {
                throw new IllegalStateException(error);
            }
        });
        List<Object> ordered = new ArrayList<>(rows.size());
        ordered.addAll(server);
        ordered.addAll(sorted);
        ordered.addAll(rest);
        if (!ordered.equals(rows)) target.list.set(supplier, target.copyOf(ordered));
        return true;
    }

    /** A chat menu's Pin row asks this with Messenger's own answer. */
    public static boolean pinRow(boolean stock, Object summary) {
        try {
            Route target = route();
            if (target == null || !target.summary.isInstance(summary) || !Settings.wouldUse(KEY)) return stock;
            String key = target.key(summary);
            synchronized (LocalPins.class) {
                if (saved().contains(key)) return false;
                if (stock) {
                    offered.remove(key);
                    return true;
                }
                if (target.flag.getBoolean(summary) || target.otherFlag.getBoolean(summary)) return false;
                offered.add(key);
            }
            Settings.enabled(KEY);
            return true;
        } catch (Throwable error) {
            Settings.hookFailed(KEY, "Can't check a chat's Pin row", error);
            return stock;
        }
    }

    /** A chat menu's Unpin row asks this with Messenger's own answer. */
    public static boolean unpinRow(boolean stock, Object summary) {
        try {
            Route target = route();
            if (stock || target == null || !target.summary.isInstance(summary) || !Settings.wouldUse(KEY)) return stock;
            String key = target.key(summary);
            synchronized (LocalPins.class) {
                return saved().contains(key);
            }
        } catch (Throwable error) {
            Settings.hookFailed(KEY, "Can't check a chat's Unpin row", error);
            return stock;
        }
    }

    /** Messenger's pin call asks this first. True means the chat was kept here and the call stops. */
    public static boolean pinning(Object threadKey) {
        try {
            Route target = route();
            if (target == null || threadKey == null || !Settings.enabled(KEY)) return false;
            String key = String.valueOf(threadKey);
            synchronized (LocalPins.class) {
                if (!offered.remove(key)) return false;
            }
            return keep(target, key);
        } catch (Throwable error) {
            Settings.hookFailed(KEY, "Can't pin this chat", error);
            return false;
        }
    }

    /** Messenger's own count found the account's pins full. True means the chat was kept here, with no dialog. */
    public static boolean pinFull(Object threadKey) {
        try {
            Route target = route();
            if (target == null || threadKey == null || !Settings.enabled(KEY)) return false;
            return keep(target, String.valueOf(threadKey));
        } catch (Throwable error) {
            Settings.hookFailed(KEY, "Can't pin this chat", error);
            return false;
        }
    }

    /** Messenger's unpin call asks this first. True means the chat was pinned here and the call stops. */
    public static boolean unpinning(Object threadKey) {
        try {
            Route target = route();
            if (target == null || threadKey == null || !Settings.enabled(KEY)) return false;
            synchronized (LocalPins.class) {
                if (!saved().remove(String.valueOf(threadKey))) return false;
                save();
            }
            changed(target, "local_pin_removed");
            return true;
        } catch (Throwable error) {
            Settings.hookFailed(KEY, "Can't unpin this chat", error);
            return false;
        }
    }

    private static boolean keep(Route target, String key) throws Throwable {
        synchronized (LocalPins.class) {
            saved();
            if (savedUnder == null) return false;
            pins.add(key);
            save();
        }
        changed(target, "local_pin_kept");
        return true;
    }

    /** Runs the list's own subscribe again, which reads it back through {@link #arrange}, and says what happened. */
    private static void changed(Route target, String message) {
        List<Object> live = new ArrayList<>();
        synchronized (LocalPins.class) {
            for (Iterator<WeakReference<Object>> it = suppliers.iterator(); it.hasNext(); ) {
                Object supplier = it.next().get();
                if (supplier == null) it.remove();
                else live.add(supplier);
            }
        }
        new Handler(Looper.getMainLooper()).post(() -> {
            for (Object supplier : live) subscribe(target, supplier);
            Context context = Settings.appContext;
            if (context != null) Toast.makeText(context, new SettingsText(context).get(message), Toast.LENGTH_SHORT).show();
        });
    }

    private static void subscribe(Route target, Object supplier) {
        try {
            InboxRefresh.Route.of(target.refresh, supplier.getClass()).subscribe(supplier);
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Can't refresh the chat list", error);
        }
    }

    /** False when this supplier was already there. */
    private static boolean remember(List<WeakReference<Object>> seen, Object supplier) {
        for (Iterator<WeakReference<Object>> it = seen.iterator(); it.hasNext(); ) {
            Object known = it.next().get();
            if (known == null) it.remove();
            else if (known == supplier) return false;
        }
        seen.add(new WeakReference<>(supplier));
        return true;
    }

    /** This account's pins in the order they were pinned. Empty, and not kept, until the account can be told. */
    private static Set<String> saved() {
        if (pins != null) return pins;
        Context context = Settings.appContext;
        String user = context == null ? null : LocalSearchStore.currentUser(context.getDatabasePath(KEY).getParentFile());
        if (user == null || Settings.preferences == null) return new LinkedHashSet<>();
        LinkedHashSet<String> read = new LinkedHashSet<>();
        String text = Settings.preferences.getString(SAVED + user, "");
        for (String key : text.split("\n")) if (!key.isEmpty()) read.add(key);
        savedUnder = user;
        pins = read;
        return read;
    }

    private static void save() {
        if (savedUnder != null) Settings.preferences.edit().putString(SAVED + savedUnder, String.join("\n", pins)).apply();
    }

    private static Route route() throws ReflectiveOperationException {
        if (route != null) return route;
        String text = HostScreens.pinnedChatRoute();
        if (text == null || text.isEmpty()) return null;
        route = Route.of(text, LocalPins.class.getClassLoader());
        return route;
    }

    /** What the patch proved, "key|flag|otherFlag|list|subscribe|listed", with each field as "Lowner;->name:type". */
    static final class Route {
        final Class<?> summary;
        final Field key;
        final Field flag;
        final Field otherFlag;
        final Field list;
        final String refresh;
        private final Method copyOf;

        private Route(Field key, Field flag, Field otherFlag, Field list, String refresh) throws NoSuchMethodException {
            this.summary = key.getDeclaringClass();
            this.key = key;
            this.flag = flag;
            this.otherFlag = otherFlag;
            this.list = list;
            this.refresh = refresh;
            this.copyOf = list.getType().getMethod("copyOf", Collection.class);
        }

        static Route of(String text, ClassLoader loader) throws ReflectiveOperationException {
            String[] parts = text.split("\\|", -1);
            if (parts.length != 6) throw new IllegalStateException("The pinned chat route has the wrong shape");
            return new Route(field(parts[0], loader), field(parts[1], loader), field(parts[2], loader), field(parts[3], loader),
                parts[4] + "|" + parts[5]);
        }

        private static Field field(String reference, ClassLoader loader) throws ReflectiveOperationException {
            int arrow = reference.indexOf(";->");
            int colon = reference.indexOf(':', arrow);
            if (!reference.startsWith("L") || arrow < 0 || colon < 0) throw new IllegalStateException("The pinned chat route has the wrong shape");
            String owner = reference.substring(1, arrow).replace('/', '.');
            Field field = Class.forName(owner, false, loader).getDeclaredField(reference.substring(arrow + 3, colon));
            field.setAccessible(true);
            return field;
        }

        String key(Object row) throws IllegalAccessException {
            return String.valueOf(key.get(row));
        }

        Object copyOf(List<Object> rows) throws ReflectiveOperationException {
            try {
                return copyOf.invoke(null, rows);
            } catch (InvocationTargetException error) {
                if (error.getCause() instanceof RuntimeException) throw (RuntimeException) error.getCause();
                throw error;
            }
        }
    }
}
