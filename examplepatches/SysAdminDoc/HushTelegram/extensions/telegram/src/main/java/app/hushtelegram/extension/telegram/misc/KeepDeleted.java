/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.Context;
import android.content.SharedPreferences;
import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;

/**
 * When someone else deletes a message, the server tells the app and Telegram removes it from the
 * phone. With the switch on, that one kind of deletion is held back: the message stays in the local
 * database and in the open chat, and the time under it reads "deleted 9:41 PM".
 *
 * Only deletions that arrive as a server update or a push come here. Your own deletes, clearing a
 * history, scheduled and quick-reply messages never do, so they stay exactly as Telegram does them.
 * Whatever isn't kept, and whatever goes wrong while deciding, is handed to Telegram's own deletion
 * unchanged. Kept messages are remembered per account and survive a restart. Turning the switch off
 * doesn't purge them; Clear kept messages in settings hands them all to Telegram's own deletion.
 */
public final class KeepDeleted {
    private KeepDeleted() {}

    /** Newest messages remembered per account. Older ones lose the label first. */
    static final int LIMIT = 5000;

    /** Bubbles measured lately, which a chat on screen can be asked to draw again. */
    static final int SHOWN_LIMIT = 300;

    /** One stored message, with what the decision needs to know about it. */
    static final class Row {
        final long dialog;
        final int id;
        final boolean mine;
        final boolean timed;
        final boolean guarded;

        Row(long dialog, int id, boolean mine, boolean timed, boolean guarded) {
            this.dialog = dialog;
            this.id = id;
            this.mine = mine;
            this.timed = timed;
            this.guarded = guarded;
        }
    }

    /** Telegram's side of one account. Reads the local database on its storage queue. */
    interface Source {
        /** The account's own user ID. */
        long self() throws Exception;

        /** Runs [work] on the storage queue, or throws when the queue won't take it. */
        void post(Runnable work) throws Exception;

        /** The stored messages among [ids], in [dialogId] or, for 0, in any chat that isn't a channel. */
        List<Row> rows(long dialogId, List<Integer> ids) throws Exception;

        /** Telegram's own deletion of [ids]. */
        void stock(long dialogId, ArrayList<Integer> ids, long channelId) throws Exception;

        /** Telegram's notification cleanup for deleted [ids], which its update path runs and its push deletion doesn't. */
        void clearNotifications(ArrayList<Integer> ids, long channelId) throws Exception;

        /** The channel ID of [dialogId] when it's a channel or a supergroup, and 0 for anything else. */
        long channel(long dialogId) throws Exception;

        /** Asks a chat showing [messages] of [dialogId] to draw their bubbles again, on the main thread. */
        void redraw(long dialogId, ArrayList<Object> messages) throws Exception;
    }

    /** The accounts signed in to this Telegram, each as its own [Source]. */
    interface Accounts {
        List<Source> signedIn() throws Exception;
    }

    /** Where the remembered messages live between runs. */
    interface Persist {
        String read(String key);

        void write(String key, String value);
    }

    /** Reads a message's owner account, chat and ID. */
    interface Keys {
        long[] of(Object message) throws Exception;
    }

    /** True on the thread that is handing messages to Telegram's own deletion, so it isn't asked again. */
    static final ThreadLocal<Boolean> STOCK = new ThreadLocal<>();

    private static final ThreadLocal<Object> MEASURING = new ThreadLocal<>();
    private static final Map<Long, LinkedHashSet<String>> KEPT = new HashMap<>();
    /** "account:chat:id" of each bubble measured lately, newest last. Weak, so a closed chat's messages can go. */
    private static final LinkedHashMap<String, WeakReference<Object>> SHOWN =
            new LinkedHashMap<String, WeakReference<Object>>(64, 0.75f, true) {
                @Override protected boolean removeEldestEntry(Map.Entry<String, WeakReference<Object>> eldest) {
                    return size() > SHOWN_LIMIT;
                }
            };

    static Persist persist = new Prefs();
    static Keys keys = KeepDeletedBridge::keyOf;
    static Accounts accounts = KeepDeletedBridge::signedIn;

    /**
     * Asked in place of a "messages deleted" update for chats that aren't channels.
     *
     * @param update the update, with the deleted message IDs
     * @param controller Telegram's message controller
     * @return true when the deletion is taken over and Telegram should skip it
     */
    public static boolean userUpdate(Object update, Object controller) {
        return take(update, controller, false);
    }

    /** [userUpdate] for a channel's update. */
    public static boolean channelUpdate(Object update, Object controller) {
        return take(update, controller, true);
    }

    /**
     * Asked first when a push says messages were deleted.
     *
     * @return true when the deletion is taken over and Telegram should skip it
     */
    public static boolean push(Object controller, long dialogId, ArrayList<?> ids, long channelId) {
        if (Boolean.TRUE.equals(STOCK.get())) return false;
        if (!on()) return false;
        try {
            if (ids == null || ids.isEmpty()) return false;
            return start(KeepDeletedBridge.of(controller), dialogId, ints(ids), channelId);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "push", failure);
            return false;
        }
    }

    /** Told which message the bubble is measuring, so the next time it formats can carry the label. */
    public static void measuring(Object message) {
        try {
            MEASURING.set(on() ? message : null);
        } catch (Throwable failure) {
            MEASURING.remove();
        }
    }

    /** The time the bubble formats, with the label in front when the message is a kept one. */
    public static String labelled(String time) {
        Object message = MEASURING.get();
        if (message == null || time == null) return time;
        try {
            long[] key = keys.of(message);
            if (!isKept(key[0], key[1], (int) key[2])) {
                shown(key[0], key[1], key[2], message);
                return time;
            }
            HookStatus.counted(FamilyNames.KEEP_DELETED_MESSAGES, "label shown");
            return L10n.t("deleted") + " " + time;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "label", failure);
            return time;
        }
    }

    /** Whether the switch is on and HushTelegram isn't paused. */
    public static boolean on() {
        HookStatus.invoked(FamilyNames.KEEP_DELETED_MESSAGES);
        try {
            return Utils.settingsReady() && Settings.KEEP_DELETED_MESSAGES.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "switch", failure);
            return false;
        }
    }

    private static boolean take(Object update, Object controller, boolean channel) {
        if (!on()) return false;
        try {
            ArrayList<Integer> ids = ints(KeepDeletedBridge.messages(update));
            long channelId = channel ? KeepDeletedBridge.channel(update) : 0;
            if (ids.isEmpty() || (channel && channelId == 0)) return false;
            return start(KeepDeletedBridge.of(controller), channel ? -channelId : 0, ids, channelId);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "update", failure);
            return false;
        }
    }

    /** Hands the decision to the storage queue. False means nothing was taken and Telegram deletes as usual. */
    static boolean start(Source source, long dialogId, ArrayList<Integer> ids, long channelId) {
        try {
            source.post(() -> decide(source, dialogId, ids, channelId));
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "queue", failure);
            return false;
        }
    }

    /** Keeps what may be kept and gives the rest to Telegram's own deletion. */
    static void decide(Source source, long dialogId, ArrayList<Integer> ids, long channelId) {
        ArrayList<Integer> release = new ArrayList<>(ids);
        ArrayList<long[]> kept = new ArrayList<>();
        long self = 0;
        try {
            self = source.self();
            for (Row row : source.rows(dialogId, ids)) {
                if (!keeps(row, self) || !release.remove(Integer.valueOf(row.id))) continue;
                kept.add(new long[] {row.dialog, row.id});
            }
            remember(self, kept);
            if (!kept.isEmpty()) HookStatus.counted(FamilyNames.KEEP_DELETED_MESSAGES, "deleted messages kept");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "decision", failure);
            release = new ArrayList<>(ids);
            kept.clear();
        }
        redraw(source, self, kept);
        if (release.isEmpty()) return;
        try {
            source.stock(dialogId, release, channelId);
            HookStatus.counted(FamilyNames.KEEP_DELETED_MESSAGES, "left to Telegram");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "stock deletion", failure);
            return;
        }
        // Taking an update skipped the notification cleanup Telegram runs for it, and the push deletion
        // runs none, so a message that still goes would leave its notification behind. A push has
        // already cleared its own, and clearing them again finds nothing.
        try {
            source.clearNotifications(new ArrayList<>(release), channelId);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "notification cleanup", failure);
        }
    }

    /** Someone else's plain message in a chat that allows saving. Anything else goes the stock way. */
    static boolean keeps(Row row, long self) {
        return !row.mine && !row.timed && !row.guarded && row.dialog != self;
    }

    /**
     * A bubble on screen measured its time before its message was kept, so it shows no label yet.
     * Each one measured lately is asked to draw again, the way Telegram redraws an edited message,
     * and the label comes with its new measuring. A chat that isn't open has nothing to draw.
     */
    static void redraw(Source source, long self, List<long[]> kept) {
        if (kept.isEmpty()) return;
        Map<Long, ArrayList<Object>> byChat = new LinkedHashMap<>();
        synchronized (SHOWN) {
            for (long[] message : kept) {
                WeakReference<Object> bubble = SHOWN.remove(shownKey(self, message[0], message[1]));
                Object shown = bubble == null ? null : bubble.get();
                if (shown == null) continue;
                ArrayList<Object> chat = byChat.get(message[0]);
                if (chat == null) byChat.put(message[0], chat = new ArrayList<>());
                chat.add(shown);
            }
        }
        for (Map.Entry<Long, ArrayList<Object>> chat : byChat.entrySet()) {
            try {
                source.redraw(chat.getKey(), chat.getValue());
                HookStatus.counted(FamilyNames.KEEP_DELETED_MESSAGES, "kept message drawn again");
            } catch (Throwable failure) {
                HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "redraw", failure);
            }
        }
    }

    private static void shown(long owner, long dialog, long id, Object message) {
        synchronized (SHOWN) {
            SHOWN.put(shownKey(owner, dialog, id), new WeakReference<>(message));
        }
    }

    /**
     * The Clear kept messages row: every message each signed-in account remembers goes to
     * Telegram's own deletion, chat by chat, and the account forgets it. Works with the switch off
     * or paused too, since the tap is the request. What can't be handed over stays remembered,
     * label and all, so a later tap can try again.
     *
     * @return how many messages were handed over
     */
    public static int clear() {
        HookStatus.invoked(FamilyNames.KEEP_DELETED_MESSAGES);
        List<Source> signedIn;
        try {
            signedIn = accounts.signedIn();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "accounts", failure);
            return 0;
        }
        int cleared = 0;
        for (Source source : signedIn) {
            try {
                cleared += clearAccount(source);
            } catch (Throwable failure) {
                HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "clearing kept messages", failure);
            }
        }
        if (cleared > 0) HookStatus.counted(FamilyNames.KEEP_DELETED_MESSAGES, "kept messages cleared");
        return cleared;
    }

    /** One account's part of [clear]. Forgets first, so a deletion that fails on the queue can put its messages back. */
    private static int clearAccount(Source source) throws Exception {
        long owner = source.self();
        List<String> messages = keptBy(owner);
        if (messages.isEmpty()) return 0;
        forget(owner, messages);
        try {
            source.post(() -> handBack(source, owner, messages));
        } catch (Throwable refused) {
            restore(owner, messages);
            throw refused;
        }
        return messages.size();
    }

    /** What the row says after a clear of [count] messages. */
    public static String clearedMessage(int count) {
        if (count <= 0) return L10n.t("There are no kept messages to clear.");
        return L10n.quantity(count, "Removed %1$d kept message.", "Removed %1$d kept messages.", count);
    }

    /**
     * Runs on the account's storage queue. Each chat's messages go together, the way a push
     * deletes them: a channel or supergroup by its own ID, and anything else with 0. A chat whose
     * deletion can't start is remembered again.
     */
    static void handBack(Source source, long owner, List<String> messages) {
        Map<Long, ArrayList<Integer>> byChat = new LinkedHashMap<>();
        for (String message : messages) {
            try {
                int colon = message.lastIndexOf(':');
                long dialog = Long.parseLong(message.substring(0, colon));
                ArrayList<Integer> ids = byChat.get(dialog);
                if (ids == null) byChat.put(dialog, ids = new ArrayList<>());
                ids.add(Integer.valueOf(message.substring(colon + 1)));
            } catch (RuntimeException unreadable) {
                HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "reading kept messages", unreadable);
            }
        }
        for (Map.Entry<Long, ArrayList<Integer>> chat : byChat.entrySet()) {
            long dialog = chat.getKey();
            long channel;
            try {
                channel = dialog < 0 ? source.channel(dialog) : 0;
                source.stock(dialog, new ArrayList<>(chat.getValue()), channel);
            } catch (Throwable failure) {
                HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "clearing kept messages", failure);
                List<String> back = new ArrayList<>();
                for (Integer id : chat.getValue()) back.add(key(dialog, id));
                restore(owner, back);
                continue;
            }
            // A kept message's notification was left in place when its deletion was taken over.
            try {
                source.clearNotifications(new ArrayList<>(chat.getValue()), channel);
            } catch (Throwable failure) {
                HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "notification cleanup", failure);
            }
        }
    }

    static synchronized void remember(long owner, List<long[]> messages) {
        if (messages.isEmpty()) return;
        LinkedHashSet<String> set = load(owner);
        for (long[] message : messages) {
            String key = key(message[0], message[1]);
            set.remove(key);
            set.add(key);
        }
        for (Iterator<String> oldest = set.iterator(); set.size() > LIMIT && oldest.hasNext(); ) {
            oldest.next();
            oldest.remove();
        }
        try {
            persist.write(prefsKey(owner), String.join(",", set));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "saving kept messages", failure);
        }
    }

    static synchronized boolean isKept(long owner, long dialog, long id) {
        return load(owner).contains(key(dialog, id));
    }

    /** A copy of what [owner] remembers, oldest first. */
    static synchronized List<String> keptBy(long owner) {
        return Collections.unmodifiableList(new ArrayList<>(load(owner)));
    }

    /** Drops [messages] from what [owner] remembers, and saves the rest. */
    static synchronized void forget(long owner, List<String> messages) {
        LinkedHashSet<String> set = load(owner);
        set.removeAll(messages);
        save(owner, set);
    }

    /** Puts [messages] back in what [owner] remembers, after a clear that couldn't hand them over. */
    static synchronized void restore(long owner, List<String> messages) {
        LinkedHashSet<String> set = load(owner);
        set.addAll(messages);
        save(owner, set);
    }

    private static void save(long owner, LinkedHashSet<String> set) {
        try {
            persist.write(prefsKey(owner), String.join(",", set));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "saving kept messages", failure);
        }
    }

    static synchronized void forgetAllForTests() {
        KEPT.clear();
        synchronized (SHOWN) {
            SHOWN.clear();
        }
    }

    private static LinkedHashSet<String> load(long owner) {
        LinkedHashSet<String> set = KEPT.get(owner);
        if (set != null) return set;
        set = new LinkedHashSet<>();
        try {
            String saved = persist.read(prefsKey(owner));
            if (saved != null && !saved.isEmpty()) {
                for (String part : saved.split(",")) if (!part.isEmpty()) set.add(part);
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "reading kept messages", failure);
        }
        KEPT.put(owner, set);
        return set;
    }

    private static String key(long dialog, long id) { return dialog + ":" + id; }

    private static String shownKey(long owner, long dialog, long id) { return owner + ":" + key(dialog, id); }

    private static String prefsKey(long owner) { return "kept_" + owner; }

    private static ArrayList<Integer> ints(List<?> list) {
        ArrayList<Integer> out = new ArrayList<>(list.size());
        for (Object item : list) {
            if (!(item instanceof Integer)) throw new IllegalArgumentException("a message ID that isn't a number");
            out.add((Integer) item);
        }
        return out;
    }

    /** The kept messages, in the app's own private preferences. */
    private static final class Prefs implements Persist {
        private SharedPreferences prefs() {
            return Utils.getContext().getSharedPreferences("hushtelegram_kept_deleted", Context.MODE_PRIVATE);
        }

        @Override public String read(String key) { return prefs().getString(key, ""); }

        @Override public void write(String key, String value) { prefs().edit().putString(key, value).apply(); }
    }
}
