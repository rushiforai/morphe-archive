package app.hushmessenger.extension;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.widget.Toast;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.Executor;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;

/**
 * Remove contact, back in the menu you get by holding a person in People, your contacts or search (#253). Messenger took
 * the row out but kept the removal behind it, which fetches the contact and queues its delete_contact operation. Each of
 * those menus hands its finished rows here, and a person who isn't a friend gets a Remove contact row. Its tap starts
 * Messenger's own removal with the menu's screen, account and person, and a toast says how it went once the delete is
 * done. Friends, pages and a friendship Messenger hasn't worked out yet get no row, and neither does search's menu for
 * people who aren't contacts at all. It never blocks or unfriends anyone.
 */
public final class RemoveContact {
    static final String KEY = "remove_contact";
    static final String ROW = "remove_contact_row";
    static final String DONE = "remove_contact_done";
    static final String FAILED = "remove_contact_failed";
    /** "Hu" and the issue number. Messenger's own rows use small ids, so this one can't be mistaken for any of them. */
    static final int ROW_ID = 0x48750253;
    /** Where search's menu for people who aren't your contacts says it came from. There's nothing to remove there. */
    static final String NONCONTACT = "universal_search_noncontact_long_click";
    /** How long the contact's fetch, and then the delete, each get before the toast says it didn't work. */
    static final long WAIT_SECONDS = 60;

    private static final String CONTEXT = "android.content.Context";
    private static final String SESSION = "com.facebook.auth.usersession.FbUserSession";
    private static final String USER = "com.facebook.user.model.User";
    private static final String USER_KEY = "com.facebook.user.model.UserKey";
    /** Icons for the row, best first, by their names in Messenger's icon enum. */
    private static final String[] ICONS = {"FRIEND_GENERIC_MINUS", "MINUS_CIRCLE"};
    /** The word in a row's set that says it draws its own icon. */
    private static final String ICON = "icon";

    private RemoveContact() { }

    /** Messenger's removal. Tests swap it. */
    interface Removal {
        /** Starts the removal. Answers the future the delete finishes, then the contact's fetch. */
        Object[] start(Object screen, Object session, String userId);
    }

    static Removal removal = new Removal() {
        @Override public Object[] start(Object screen, Object session, String userId) { return startRemoval(screen, session, userId); }
    };

    /** Where the waits for Messenger's answer run. Tests swap it. */
    static Executor worker = task -> {
        Thread thread = new Thread(task, "HushRemoveContact");
        thread.setDaemon(true);
        thread.start();
    };

    /**
     * Messenger's own removal start, with the screen, the account and the person's id: it fetches the contact and queues
     * delete_contact with it. Answers the future the delete finishes and the fetch's. The patch writes its body.
     */
    static Object[] startRemoval(Object screen, Object session, Object userId) { return null; }

    /** A contact menu's rows, just before the menu returns them. A person who isn't a friend gets the Remove contact row. */
    public static void contactRows(Object socket, Object rows) {
        try {
            if (socket == null || !(rows instanceof List) || !Settings.enabled(KEY) || fromNoncontactSearch(socket)) return;
            Object person = StrangerSend.held(socket, USER);
            if (person == null || !StrangerSend.stranger(person) || userId(person) == null) return;
            @SuppressWarnings("unchecked") List<Object> list = (List<Object>) rows;
            Object sample = null;
            for (Object present : list) {
                if (present == null) continue;
                if (rowId(present) == ROW_ID) return;
                if (sample == null) sample = present;
            }
            if (sample == null) return;
            list.add(row(sample.getClass(), label()));
        } catch (Throwable error) {
            Settings.hookFailed(KEY, "Can't add the Remove contact row", error);
        }
    }

    /** A contact menu's tap, asked first. False for Messenger's own rows, which it then handles as before. True for ours. */
    public static boolean contactTapped(Object socket, int id) {
        if (id != ROW_ID) return false;
        Context context = Settings.appContext;
        try {
            if (socket == null || !Settings.enabled(KEY)) return false;
            Object screen = StrangerSend.held(socket, CONTEXT);
            Object session = StrangerSend.held(socket, SESSION);
            String them = userId(StrangerSend.held(socket, USER));
            if (screen == null || session == null || them == null) throw new IllegalStateException("The contact menu has no screen, account or person");
            Object[] started = removal.start(screen, session, them);
            if (started == null || started.length != 2 || !(started[0] instanceof Future) || !(started[1] instanceof Future))
                throw new IllegalStateException("Messenger's removal didn't start");
            Future<?> removed = (Future<?>) started[0];
            Future<?> fetched = (Future<?>) started[1];
            worker.execute(() -> done(context, waitFor(fetched, removed)));
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Can't start removing a contact", error);
            done(context, false);
        }
        return true;
    }

    /**
     * Whether Messenger's removal went through: the contact's fetch, then the delete it queued. A fetch that fails never
     * finishes the delete's future, so that one is waited on first.
     */
    static boolean waitFor(Future<?> fetched, Future<?> removed) {
        try {
            fetched.get(WAIT_SECONDS, TimeUnit.SECONDS);
            removed.get(WAIT_SECONDS, TimeUnit.SECONDS);
            return true;
        } catch (InterruptedException stopped) {
            Thread.currentThread().interrupt();
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Messenger didn't remove a contact", error);
        }
        return false;
    }

    /** Search's menu for people who aren't contacts keeps where it came from in a String, as every contact menu does. */
    private static boolean fromNoncontactSearch(Object socket) throws IllegalAccessException {
        for (Class<?> at = socket.getClass(); at != null && at != Object.class; at = at.getSuperclass()) {
            for (Field field : at.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) || field.getType() != String.class) continue;
                field.setAccessible(true);
                if (NONCONTACT.equals(field.get(socket))) return true;
            }
        }
        return false;
    }

    private static String userId(Object person) throws IllegalAccessException {
        return StrangerSend.userId(StrangerSend.held(person, USER_KEY));
    }

    /** A row's id: the one int its class keeps, or -1 when it keeps some other number of them. */
    private static int rowId(Object row) throws IllegalAccessException {
        Field id = null;
        for (Field field : row.getClass().getDeclaredFields()) {
            if (Modifier.isStatic(field.getModifiers()) || field.getType() != int.class) continue;
            if (id != null) return -1;
            id = field;
        }
        if (id == null) return -1;
        id.setAccessible(true);
        return id.getInt(row);
    }

    /**
     * A row of the menu's own class: its icon, its spoken text and its title, the set that says whether it has an icon,
     * its id and the flag Hide contact's row sets too.
     */
    private static Object row(Class<?> type, String label) throws ReflectiveOperationException {
        for (Constructor<?> made : type.getDeclaredConstructors()) {
            Class<?>[] takes = made.getParameterTypes();
            if (takes.length != 6 || !Enum.class.isAssignableFrom(takes[0]) || takes[1] != String.class || takes[2] != String.class
                || takes[3] != Set.class || takes[4] != int.class || takes[5] != boolean.class) continue;
            Object icon = icon(takes[0]);
            Set<String> parts = new HashSet<>();
            if (icon != null) parts.add(ICON);
            made.setAccessible(true);
            return made.newInstance(icon, label, label, parts, ROW_ID, true);
        }
        throw new IllegalStateException("The contact menu's rows have no constructor this row can use");
    }

    /** The row's icon, read from the enum's static fields by name, since Redex can drop the values() method. */
    private static Object icon(Class<?> kinds) throws IllegalAccessException {
        for (String name : ICONS) {
            for (Field constant : kinds.getDeclaredFields()) {
                if (!Modifier.isStatic(constant.getModifiers()) || constant.getType() != kinds) continue;
                constant.setAccessible(true);
                Object value = constant.get(null);
                if (value != null && ((Enum<?>) value).name().equals(name)) return value;
            }
        }
        return null;
    }

    private static String label() {
        Context context = Settings.appContext;
        return context == null ? SettingsText.ENGLISH.get(ROW) : new SettingsText(context).get(ROW);
    }

    private static void done(Context context, boolean removed) {
        if (context == null) return;
        new Handler(Looper.getMainLooper()).post(() ->
            Toast.makeText(context, new SettingsText(context).get(removed ? DONE : FAILED), Toast.LENGTH_SHORT).show());
    }
}
