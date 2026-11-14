package app.hushmessenger.extension;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.text.format.DateUtils;
import android.widget.Toast;
import java.io.File;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.function.LongSupplier;

/**
 * Special contacts (#163). Track this person in a one-to-one chat's long-press menu keeps a history of when they came
 * online, went offline, typed to you and changed their name, which settings lists. It only reads what Messenger already
 * received: presence from PresenceItem's constructor and typing from the presence managers' typing handlers. Nothing is
 * sent, and Off, Pause and safe mode write nothing.
 */
public final class SpecialContacts {
    static final String KEY = "special_contacts";
    /** "HU" and a 2, next to Hide from chat list's 1. */
    static final int ROW_ID = 0x48550002;
    private static final String ROW_NAME = "hush_track_person";
    private static final String USER_KEY = "com.facebook.user.model.UserKey";
    private static final String FOLDER = "hush_special_contacts";
    private static final long ACCOUNT_CHECK_MILLIS = 30_000;
    private static final long NAMES_MILLIS = 60_000;

    private static final ExecutorService WORK = Executors.newSingleThreadExecutor(work -> {
        Thread thread = new Thread(work, "HushSpecialContacts");
        thread.setDaemon(true);
        return thread;
    });
    /** The history is written one change at a time, off the thread that saw it. Tests run it in place. */
    static Executor work = WORK;
    static LongSupplier clock = System::currentTimeMillis;

    /** Everyone tracked under the account in use, read on every presence update without a lock. */
    static volatile Set<String> tracked = Collections.emptySet();
    private static volatile long nextCheck;
    private static volatile long nextNames;
    private static volatile Field userId;
    /** Guarded by the class. Null until an account is read. */
    private static SpecialContactsStore store;

    private SpecialContacts() {}

    static synchronized void resetForTests() {
        store = null;
        tracked = Collections.emptySet();
        nextCheck = 0;
        nextNames = 0;
        userId = null;
        work = WORK;
        clock = System::currentTimeMillis;
    }

    /** PresenceItem's constructor hands over what it stored, the active flag as an int. */
    public static void presence(Object user, Long capabilities, Long proxy, String correlation, String publish, int clients,
            long lastActive, int active) {
        try {
            checkSoon();
            Set<String> ids = tracked;
            if (ids.isEmpty()) return;
            String id = idOf(user);
            if (id == null || !ids.contains(id) || !Settings.enabled(KEY)) return;
            long now = clock.getAsLong();
            boolean on = active != 0;
            work.execute(() -> record(people(), current -> current.presence(id, on, lastActive, now)));
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Can't read presence", error);
        }
    }

    /**
     * A presence manager's typing handler hands over its Intent before reading it. The extras are read from a copy, so
     * Messenger's own read finds them as they were.
     */
    public static void typing(Intent intent) {
        try {
            checkSoon();
            if (tracked.isEmpty() || intent == null) return;
            Bundle extras = intent.getExtras();
            if (extras == null) return;
            extras.setClassLoader(SpecialContacts.class.getClassLoader());
            if (!isTyping(extras.getInt("extra_new_state", -1))) return;
            String id = idOf(extras.get("extra_user_key"));
            if (id == null) {
                for (String name : extras.keySet()) {
                    id = idOf(extras.get(name));
                    if (id != null) break;
                }
            }
            String who = id;
            if (who == null || !tracked.contains(who) || !Settings.enabled(KEY)) return;
            long now = clock.getAsLong();
            work.execute(() -> record(people(), current -> current.typing(who, now)));
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Can't read typing", error);
        }
    }

    /** Messenger's typing states: typing in a chat and in a thread, each with its two attributions. */
    static boolean isTyping(int state) {
        return state == 1 || state == 2 || state == 5 || state == 6 || state == 11 || state == 12;
    }

    /** The chat menu's Track this person row, on one-to-one chats only. */
    static void menuRow(ChatHiding.Route target, Object chat, ArrayList<Object> rows) {
        try {
            if (!Settings.wouldUse(KEY)) return;
            SpecialContactsStore people = current();
            String[] other = people == null ? null : target.other(chat, people.account);
            if (other == null) return;
            boolean on = people.ids().contains(other[0]);
            Object row = on ? target.row(ROW_ID, ROW_NAME, label("special_contacts_untrack"), "STAR_CROSS", "EYE_CROSS")
                : target.row(ROW_ID, ROW_NAME, label("special_contacts_track"), "STAR", "EYE");
            if (row == null) return;
            ChatHiding.place(rows, row);
            Settings.enabled(KEY);
        } catch (Throwable error) {
            Settings.hookFailed(KEY, "Can't add Track this person", error);
        }
    }

    /** Track this person, or stop when they're tracked already. The toast says which. */
    static void menuTapped(ChatHiding.Route target, Object menu) {
        try {
            if (!target.menu.isInstance(menu) || !Settings.enabled(KEY)) return;
            Object chat = target.menuSummary.get(menu);
            if (!target.summary.isInstance(chat)) return;
            SpecialContactsStore people = current();
            String[] other = people == null ? null : target.other(chat, people.account);
            if (other == null) {
                toast("special_contacts_failed");
                return;
            }
            long now = clock.getAsLong();
            work.execute(() -> {
                String message;
                try {
                    if (people.untrack(other[0])) message = "special_contacts_untracked";
                    else {
                        SpecialContactsStore.Result result = people.track(other[0], other[1], now);
                        message = result == SpecialContactsStore.Result.FULL ? "special_contacts_full"
                            : result == SpecialContactsStore.Result.FAILED ? "special_contacts_failed" : "special_contacts_tracked";
                    }
                    published(people);
                } catch (Throwable error) {
                    Settings.hookFailed(KEY, "Can't track this person", error);
                    message = "special_contacts_failed";
                }
                toast(message);
            });
        } catch (Throwable error) {
            Settings.hookFailed(KEY, "Can't track this person", error);
        }
    }

    /** The chat list as it's read: a tracked person's new name goes in their history. Looked at once a minute. */
    static void chats(ChatHiding.Route target, List<?> rows) {
        try {
            if (tracked.isEmpty()) return;
            long now = SystemClock.uptimeMillis();
            if (now < nextNames) return;
            nextNames = now + NAMES_MILLIS;
            if (!Settings.wouldUse(KEY)) return;
            SpecialContactsStore people = people();
            if (people == null) return;
            Set<String> ids = people.ids();
            List<String[]> seen = new ArrayList<>();
            for (Object row : rows) {
                if (!target.summary.isInstance(row)) continue;
                String[] other = target.other(row, people.account);
                if (other != null && ids.contains(other[0]) && !other[1].isEmpty()) seen.add(other);
            }
            if (seen.isEmpty()) return;
            long at = clock.getAsLong();
            work.execute(() -> record(people, current -> {
                boolean any = false;
                for (String[] person : seen) any |= current.named(person[0], person[1], at);
                return any;
            }));
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Can't read a special contact's name", error);
        }
    }

    /** Settings' list of everyone tracked under the account in use. */
    static List<SpecialContactsStore.Person> list() {
        SpecialContactsStore people = current();
        return people == null ? Collections.emptyList() : people.people();
    }

    static List<SpecialContactsStore.Event> history(String id) {
        SpecialContactsStore people = current();
        return people == null ? Collections.emptyList() : people.history(id);
    }

    static boolean stopTracking(String id) {
        SpecialContactsStore people = current();
        if (people == null || !people.untrack(id)) return false;
        published(people);
        return true;
    }

    static boolean clearHistory(String id) {
        SpecialContactsStore people = current();
        return people != null && people.clearHistory(id);
    }

    /** One line of history: what happened and when. */
    static String describe(Context context, SettingsText text, SpecialContactsStore.Event event) {
        String when = when(context, event.at);
        switch (event.kind) {
            case SpecialContactsStore.ONLINE: return text.get("special_contacts_online", when);
            case SpecialContactsStore.TYPING: return text.get("special_contacts_typing", when);
            case SpecialContactsStore.TRACKED: return text.get("special_contacts_since", when);
            case SpecialContactsStore.NAME: {
                int split = event.detail.indexOf('\n');
                return text.get("special_contacts_renamed", when, split < 0 ? event.detail : event.detail.substring(split + 1));
            }
            default: {
                long last = parse(event.detail);
                return last > 0 ? text.get("special_contacts_offline_at", when, when(context, last)) : text.get("special_contacts_offline", when);
            }
        }
    }

    /** The time alone for today, with the date before that. */
    static String when(Context context, long at) {
        Calendar then = Calendar.getInstance();
        then.setTimeInMillis(at);
        Calendar today = Calendar.getInstance();
        today.setTimeInMillis(clock.getAsLong());
        boolean sameDay = then.get(Calendar.YEAR) == today.get(Calendar.YEAR) && then.get(Calendar.DAY_OF_YEAR) == today.get(Calendar.DAY_OF_YEAR);
        int flags = DateUtils.FORMAT_SHOW_TIME | (sameDay ? 0 : DateUtils.FORMAT_SHOW_DATE | DateUtils.FORMAT_ABBREV_MONTH);
        return DateUtils.formatDateTime(context, at, flags);
    }

    private static long parse(String number) {
        try {
            return Long.parseLong(number);
        } catch (NumberFormatException notANumber) {
            return 0;
        }
    }

    private interface Change {
        boolean apply(SpecialContactsStore store) throws Exception;
    }

    private static void record(SpecialContactsStore people, Change change) {
        try {
            if (people != null) change.apply(people);
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Can't save a special contact's history", error);
        }
    }

    /** UserKey's id, the same number the chat's people carry. Null for anything else. */
    static String idOf(Object user) throws ReflectiveOperationException {
        if (user == null) return null;
        Field field = userId;
        if (field == null || field.getDeclaringClass() != user.getClass()) {
            if (!USER_KEY.equals(user.getClass().getName())) return null;
            field = user.getClass().getDeclaredField("id");
            if (field.getType() != String.class) return null;
            field.setAccessible(true);
            userId = field;
        }
        Object id = field.get(user);
        return id instanceof String ? (String) id : null;
    }

    /** The account's store as it was last read, or read now when there's none yet. */
    private static SpecialContactsStore people() {
        synchronized (SpecialContacts.class) {
            if (store != null) return store;
        }
        return current();
    }

    /** The store for the account in use, read again when the account changed. Null with no account. */
    static SpecialContactsStore current() {
        Context context = Settings.appContext;
        File databases = context == null ? null : context.getDatabasePath(KEY).getParentFile();
        String user = databases == null ? null : LocalSearchStore.currentUser(databases);
        synchronized (SpecialContacts.class) {
            if (user == null) {
                store = null;
                tracked = Collections.emptySet();
                return null;
            }
            if (store == null || !user.equals(store.account)) {
                SpecialContactsStore next = new SpecialContactsStore(new File(new File(context.getNoBackupFilesDir(), FOLDER), user));
                next.load();
                store = next;
            }
            tracked = store.ids();
            return store;
        }
    }

    private static void published(SpecialContactsStore people) {
        synchronized (SpecialContacts.class) {
            if (store == people) tracked = people.ids();
        }
    }

    /** Every so often the hooks look at which account is in use, off their own thread. */
    private static void checkSoon() {
        long now = SystemClock.uptimeMillis();
        if (now < nextCheck) return;
        nextCheck = now + ACCOUNT_CHECK_MILLIS;
        if (!Settings.wouldUse(KEY)) return;
        work.execute(() -> {
            try {
                current();
            } catch (Throwable error) {
                Settings.hookFailedPrivately(KEY, "Can't read special contacts", error);
            }
        });
    }

    private static String label(String key) {
        Context context = Settings.appContext;
        return context == null ? SettingsText.ENGLISH.get(key) : new SettingsText(context).get(key);
    }

    private static void toast(String message) {
        Context context = Settings.appContext;
        if (context == null) return;
        new Handler(Looper.getMainLooper()).post(() ->
            Toast.makeText(context, new SettingsText(context).get(message), Toast.LENGTH_SHORT).show());
    }
}
