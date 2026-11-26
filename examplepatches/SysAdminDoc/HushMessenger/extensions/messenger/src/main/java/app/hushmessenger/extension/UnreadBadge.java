package app.hushmessenger.extension;

import android.content.SharedPreferences;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * The badge on Messenger's icon and on its Chats tab, for Mark chats read on this phone and Mark as read stays on this
 * phone. Messenger counts the chats it has as unread, and a chat read only on this phone still is one to Messenger, so
 * the chats the chat list was told are read here, though Messenger has them unread, come off its total. They're kept
 * across launches: Messenger counts again whenever a message comes in, often with no chat list on screen.
 */
public final class UnreadBadge {
    private UnreadBadge() {
    }

    /** Chats held read here, as "chat key:newest message time" when the chat list last asked. */
    static final String HELD_CHATS = "local_read_held";
    private static final Object LOCK = new Object();
    /** Null until the first read, and set back to null by a test standing in for the next launch. */
    static volatile ConcurrentHashMap<String, Long> held;
    private static volatile Count last;
    private static volatile Method counter;
    private static final AtomicBoolean queued = new AtomicBoolean();
    static long recountDelayMillis = 300L;
    private static final ScheduledExecutorService WORKER = Executors.newSingleThreadScheduledExecutor(runnable -> {
        Thread thread = new Thread(runnable, "HushUnreadBadge");
        thread.setDaemon(true);
        return thread;
    });
    private static final Class<?>[] COUNT_SHAPE =
        {String.class, String.class, int.class, int.class, int.class, int.class, int.class};

    /** One badge count as Messenger made it, kept so the badge can be counted again after a chat is read here. */
    private static final class Count {
        final WeakReference<Object> calculator;
        final String trigger;
        final String source;
        final int group;
        final int total;
        final int open;
        final int e2ee;
        final int extra;

        Count(Object calculator, String trigger, String source, int group, int total, int open, int e2ee, int extra) {
            this.calculator = new WeakReference<>(calculator);
            this.trigger = trigger;
            this.source = source;
            this.group = group;
            this.total = total;
            this.open = open;
            this.e2ee = e2ee;
            this.extra = extra;
        }
    }

    /**
     * Messenger's badge count, on its way in. The total is the unread chats Messenger counted. With either switch on
     * the chats held read here come off it, and the count goes on with what's left.
     */
    public static int total(Object calculator, String trigger, String source, int group, int total, int open, int e2ee,
                            int extra) {
        try {
            if (calculator != null) last = new Count(calculator, trigger, source, group, total, open, e2ee, extra);
            if (!Settings.readHereOn()) return total;
            return Math.max(0, total - heldNow());
        } catch (RuntimeException error) {
            Settings.hookFailed(Settings.LOCAL_READ_KEY, "Can't take chats read on this phone off the badge", error);
            return total;
        }
    }

    /** Read back once per launch, keeping only the chats whose mark is still there, then kept in memory. */
    static ConcurrentHashMap<String, Long> heldChats() {
        ConcurrentHashMap<String, Long> chats = held;
        if (chats != null) return chats;
        synchronized (LOCK) {
            if (held != null) return held;
            ConcurrentHashMap<String, Long> read = new ConcurrentHashMap<>();
            SharedPreferences prefs = Settings.preferences;
            if (prefs != null) {
                Map<String, Long> marks = Settings.localReadMarks();
                for (String entry : prefs.getStringSet(HELD_CHATS, Collections.emptySet())) {
                    int at = entry.lastIndexOf(':');
                    if (at <= 0) continue;
                    try {
                        String key = entry.substring(0, at);
                        long newest = Long.parseLong(entry.substring(at + 1));
                        Long marked = marks.get(key);
                        if (marked != null && marked >= newest) read.put(key, newest);
                    } catch (NumberFormatException ignored) {
                    }
                }
            }
            held = read;
            return read;
        }
    }

    /** The chats held read here whose mark still covers their newest message. */
    static int heldNow() {
        Map<String, Long> marks = Settings.localReadMarks();
        int count = 0;
        for (Map.Entry<String, Long> chat : heldChats().entrySet()) {
            Long marked = marks.get(chat.getKey());
            if (marked != null && marked >= chat.getValue()) count++;
        }
        return count;
    }

    /**
     * The chat list just asked about a chat. It's held when Messenger has it unread and it was read here after its
     * newest message. A change either way counts the badge again.
     */
    static void note(String key, long newest, boolean heldHere) {
        ConcurrentHashMap<String, Long> chats = heldChats();
        if (heldHere) {
            Long before = chats.put(key, newest);
            if (before != null && before == newest) return;
            store(chats);
            // A newer message the mark still covers changes what's kept, not what the badge shows.
            if (before == null) recount();
        } else if (chats.remove(key) != null) {
            store(chats);
            recount();
        }
    }

    /** Mark as unread on a chat read here: it's Messenger's again, so it goes back on the badge. */
    static void drop(String key) {
        ConcurrentHashMap<String, Long> chats = heldChats();
        if (chats.remove(key) != null) store(chats);
        recount();
    }

    private static void store(ConcurrentHashMap<String, Long> chats) {
        synchronized (LOCK) {
            Set<String> kept = new HashSet<>();
            for (Map.Entry<String, Long> chat : chats.entrySet()) kept.add(chat.getKey() + ":" + chat.getValue());
            SharedPreferences prefs = Settings.preferences;
            if (prefs != null) prefs.edit().putStringSet(HELD_CHATS, kept).apply();
        }
    }

    /** Counts the badge again a moment from now, once for any number of changes in that moment. */
    static void recount() {
        if (last == null || !queued.compareAndSet(false, true)) return;
        WORKER.schedule(() -> {
            queued.set(false);
            countAgain();
        }, recountDelayMillis, TimeUnit.MILLISECONDS);
    }

    /**
     * Messenger's own count, made again with the total it last had. Its total doesn't change when a chat is read
     * here, since Messenger never hears about it, so only what comes off it does.
     */
    static void countAgain() {
        Count count = last;
        Object calculator = count == null ? null : count.calculator.get();
        if (calculator == null) return;
        try {
            Method method = counter(calculator.getClass());
            if (method == null) return;
            method.invoke(calculator, count.trigger, count.source, count.group, count.total, count.open, count.e2ee,
                count.extra);
        } catch (ReflectiveOperationException | RuntimeException error) {
            Settings.hookFailed(Settings.LOCAL_READ_KEY, "Can't count the badge again", error);
        }
    }

    /** The patch proved the count is the only method of its shape on its class. */
    private static Method counter(Class<?> type) {
        Method cached = counter;
        if (cached != null && cached.getDeclaringClass() == type) return cached;
        Method found = null;
        for (Method method : type.getDeclaredMethods()) {
            if (Modifier.isStatic(method.getModifiers()) || method.getReturnType() != void.class
                || !Arrays.equals(method.getParameterTypes(), COUNT_SHAPE)) continue;
            if (found != null) return null;
            found = method;
        }
        if (found == null) return null;
        found.setAccessible(true);
        counter = found;
        return found;
    }

    /** A test standing in for the next launch. */
    static void resetForTests() {
        held = null;
        last = null;
        counter = null;
        queued.set(false);
    }
}
