/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.Context;
import android.content.SharedPreferences;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.style.ForegroundColorSpan;
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
import java.util.concurrent.ConcurrentHashMap;

/**
 * When someone else deletes a message, the server tells the app and Telegram removes it from the
 * phone. With the switch on, that one kind of deletion is held back: the message stays in the local
 * database and in the open chat, and the time under it reads "deleted 9:41 PM". A second switch
 * shows that word in red (#25).
 *
 * Only deletions that arrive as a server update or a push come here. Your own deletes, clearing a
 * history, scheduled and quick-reply messages never do, so they stay exactly as Telegram does them.
 * Whatever isn't kept, and whatever goes wrong while deciding, is handed to Telegram's own deletion
 * unchanged. Kept messages are remembered per account and survive a restart. Turning the switch off
 * doesn't purge them; Clear kept messages in settings hands them all to Telegram's own deletion.
 *
 * <p>A message is only kept once the list naming it has reached the disk; a list that can't be
 * saved leaves the message to Telegram's own deletion. A message on its way back to Telegram (a
 * clear, or one past the cap) moves off the list and onto a second one in the same commit, and
 * comes off that only after Telegram's deletion, which Telegram queues behind ours on the account's
 * storage queue, has run. A restart in between hands it back again, and deleting a message that's
 * already gone finds nothing. The account is read again right before each deletion, so a slot that
 * was signed out or now holds another account deletes none of the first one's messages.
 *
 * <p>Delete for them ({@link DeleteForThem}) puts your own messages on the same list. A message on
 * the list stays when a deletion comes in for it, even with this switch off, and with this switch
 * off nothing else is held back.
 */
public final class KeepDeleted {
    private KeepDeleted() {}

    /** Newest messages remembered per account. Past it, the oldest go to Telegram's own deletion. */
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
        /** The stored message itself, for its photo or file, or null when it couldn't be read. */
        final Object message;

        Row(long dialog, int id, boolean mine, boolean timed, boolean guarded) {
            this(dialog, id, mine, timed, guarded, null);
        }

        Row(long dialog, int id, boolean mine, boolean timed, boolean guarded, Object message) {
            this.dialog = dialog;
            this.id = id;
            this.mine = mine;
            this.timed = timed;
            this.guarded = guarded;
            this.message = message;
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

        /**
         * Starts downloading the photo or file of each stored message in [messages], the way
         * Telegram's own auto-download does.
         *
         * @return how many downloads were asked for
         */
        int saveMedia(List<Object> messages) throws Exception;
    }

    /** The accounts signed in to this Telegram, each as its own [Source]. */
    interface Accounts {
        List<Source> signedIn() throws Exception;
    }

    /** Where the remembered messages live between runs. */
    interface Persist {
        String read(String key);

        /**
         * Writes every entry in one commit, so all of them reach the disk or none do.
         *
         * @return whether they reached the disk
         */
        boolean write(Map<String, String> entries);
    }

    /** Reads a message's owner account, chat and ID. */
    interface Keys {
        long[] of(Object message) throws Exception;
    }

    /** True on the thread that is handing messages to Telegram's own deletion, so it isn't asked again. */
    static final ThreadLocal<Boolean> STOCK = new ThreadLocal<>();

    /** The saved lists' format. 1 had only the kept list; 2 adds the messages being handed back and this number. */
    static final int VERSION = 2;

    /** The red of the deleted label, readable on light and dark bubbles alike. */
    static final int RED = 0xFFE53935;

    /** The label a measuring put in front of the time, and how long its word is. */
    private static final class Label {
        final String text;
        final int word;

        Label(String text, int word) {
            this.text = text;
            this.word = word;
        }
    }

    private static final ThreadLocal<Object> MEASURING = new ThreadLocal<>();
    /** Set while a bubble's measuring has put the label in, until its time text is handed to {@link #painted}. */
    private static final ThreadLocal<Label> LABELLED = new ThreadLocal<>();
    // A set in these two is never changed once it's in the map, only replaced, so a bubble can read
    // it without waiting on a save.
    private static final Map<Long, LinkedHashSet<String>> KEPT = new ConcurrentHashMap<>();
    /**
     * Per account, the messages taken off the kept list for Telegram's own deletion that Telegram
     * hasn't finished deleting. Saved with the kept list in one commit.
     */
    private static final Map<Long, LinkedHashSet<String>> HANDING = new ConcurrentHashMap<>();
    /** Of those, the ones given to Telegram in this run and not finished yet. A restart empties it. */
    private static final Map<Long, LinkedHashSet<String>> DISPATCHED = new HashMap<>();
    /** Whether the saved lists come from a newer HushTelegram, which this one only reads. Null until read. */
    private static Boolean newer;
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
        boolean others = on();
        if (!others && !DeleteForThem.on()) return false;
        try {
            if (ids == null || ids.isEmpty()) return false;
            ArrayList<Integer> list = ints(ids);
            Source source = KeepDeletedBridge.of(controller);
            if (!others && !holds(source.self(), list)) return false;
            return start(source, dialogId, list, channelId, others);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "push", failure);
            return false;
        }
    }

    /** {@link #push(Object, long, ArrayList, long)} for a build whose push deletion takes the IDs last (13.2). */
    public static boolean pushIdsLast(Object controller, long dialogId, long channelId, ArrayList<?> ids) {
        return push(controller, dialogId, ids, channelId);
    }

    /** Told which message the bubble is measuring, so the next time it formats can carry the label. */
    public static void measuring(Object message) {
        LABELLED.remove();
        try {
            MEASURING.set(on() || DeleteForThem.on() ? message : null);
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
            String word = L10n.t("deleted");
            String text = word + " " + time;
            LABELLED.set(new Label(text, word.length()));
            return text;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "label", failure);
            return time;
        }
    }

    /**
     * The bubble's finished time text, handed over right before its measuring returns. With the red
     * label switch on, and a label put in by this measuring, the word comes back red; the text and its
     * width stay the same. Anything else comes back as it was.
     */
    public static CharSequence painted(CharSequence text) {
        Label label = LABELLED.get();
        if (label == null) return text;
        LABELLED.remove();
        try {
            if (text == null || !Utils.settingsReady() || !Settings.RED_DELETED_LABEL.get()) return text;
            // Telegram builds the time text around the label: an edited mark, views, a signature.
            int at = text.toString().indexOf(label.text);
            if (at < 0) return text;
            SpannableString red = new SpannableString(text);
            red.setSpan(new ForegroundColorSpan(RED), at, at + label.word, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            HookStatus.counted(FamilyNames.KEEP_DELETED_MESSAGES, "label shown in red");
            return red;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "red label", failure);
            return text;
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
        boolean others = on();
        if (!others && !DeleteForThem.on()) return false;
        try {
            ArrayList<Integer> ids = ints(KeepDeletedBridge.messages(update));
            long channelId = channel ? KeepDeletedBridge.channel(update) : 0;
            if (ids.isEmpty() || (channel && channelId == 0)) return false;
            Source source = KeepDeletedBridge.of(controller);
            if (!others && !holds(source.self(), ids)) return false;
            return start(source, channel ? -channelId : 0, ids, channelId, others);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "update", failure);
            return false;
        }
    }

    /** Hands the decision to the storage queue. False means nothing was taken and Telegram deletes as usual. */
    static boolean start(Source source, long dialogId, ArrayList<Integer> ids, long channelId) {
        return start(source, dialogId, ids, channelId, true);
    }

    /** {@link #start(Source, long, ArrayList, long)}, holding back others' messages only when [others] is set. */
    static boolean start(Source source, long dialogId, ArrayList<Integer> ids, long channelId, boolean others) {
        try {
            source.post(() -> decide(source, dialogId, ids, channelId, others));
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "queue", failure);
            return false;
        }
    }

    /** Keeps what may be kept and gives the rest to Telegram's own deletion. */
    static void decide(Source source, long dialogId, ArrayList<Integer> ids, long channelId) {
        decide(source, dialogId, ids, channelId, true);
    }

    /**
     * {@link #decide(Source, long, ArrayList, long)}. A message already on the list stays either way;
     * someone else's new one is kept only when [others] is set.
     */
    static void decide(Source source, long dialogId, ArrayList<Integer> ids, long channelId, boolean others) {
        ArrayList<Integer> release = new ArrayList<>(ids);
        ArrayList<long[]> kept = new ArrayList<>();
        ArrayList<Object> media = new ArrayList<>();
        List<String> overflow = Collections.emptyList();
        long self = 0;
        try {
            self = source.self();
            // With no account to keep it for, nothing could find it again to clear it.
            if (self <= 0) throw new IllegalStateException("no signed-in account");
            for (Row row : source.rows(dialogId, ids)) {
                boolean keep = others ? keeps(row, self) || held(self, row) : held(self, row);
                if (!keep || !release.remove(Integer.valueOf(row.id))) continue;
                kept.add(new long[] {row.dialog, row.id});
                if (row.message != null) media.add(row.message);
            }
            List<String> dropped = remember(self, kept);
            // Unsaved, a kept message would outlive a restart in the database with nothing naming it.
            if (dropped == null) throw new IllegalStateException("the kept messages weren't saved");
            overflow = dropped;
            if (!kept.isEmpty()) HookStatus.counted(FamilyNames.KEEP_DELETED_MESSAGES, "deleted messages kept");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "decision", failure);
            release = new ArrayList<>(ids);
            kept.clear();
            media.clear();
        }
        // Forgotten past the cap, a kept message would stay in the database with no label, out of
        // reach of Clear kept messages, so it goes to Telegram's own deletion now instead, with
        // anything a restart left on its way back.
        if (!overflow.isEmpty()) HookStatus.counted(FamilyNames.KEEP_DELETED_MESSAGES, "oldest kept messages handed back");
        if (self > 0) handBackWaiting(source, self, false);
        redraw(source, self, kept);
        saveMedia(source, media);
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

    /** Already on [owner]'s kept list, such as your own message after Delete for them. */
    static synchronized boolean held(long owner, Row row) {
        return load(owner).contains(key(row.dialog, row.id));
    }

    /** Whether any of [ids] might be on [owner]'s kept list. A deletion update names no chat, so this goes by ID alone. */
    static synchronized boolean holds(long owner, List<Integer> ids) {
        if (owner <= 0) return false;
        for (String key : load(owner)) {
            if (ids.contains(Integer.valueOf(key.substring(key.lastIndexOf(':') + 1)))) return true;
        }
        return false;
    }

    /**
     * Delete for them: [owner]'s own [messages] go on the kept list before the deletion for everyone
     * else goes out, and any pushed past the cap go back to Telegram's own deletion.
     *
     * @return false when the list couldn't be saved, and nothing changed
     */
    static boolean keepOwn(Source source, long owner, List<long[]> messages) {
        List<String> dropped = remember(owner, messages);
        if (dropped == null) return false;
        if (!dropped.isEmpty()) HookStatus.counted(FamilyNames.KEEP_DELETED_MESSAGES, "oldest kept messages handed back");
        handBackWaiting(source, owner, false);
        return true;
    }

    /** Takes [messages] off [owner]'s kept list again, after a Delete for them that couldn't go out. */
    static synchronized void forget(long owner, List<long[]> messages) {
        LinkedHashSet<String> kept = new LinkedHashSet<>(load(owner));
        for (long[] message : messages) kept.remove(key(message[0], message[1]));
        commit(owner, kept, new LinkedHashSet<>(handing(owner)));
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

    /**
     * A kept photo or file that wasn't downloaded yet would spin in its bubble for good (#2): the
     * download needs the file reference stored with the message, which expires, and Telegram gets a
     * fresh one by asking the server for the message, which is gone now. So the download starts the
     * moment the message is kept, while that reference still works. One that's already on the phone
     * costs nothing.
     */
    static void saveMedia(Source source, List<Object> messages) {
        if (messages.isEmpty()) return;
        try {
            if (source.saveMedia(messages) > 0) HookStatus.counted(FamilyNames.KEEP_DELETED_MESSAGES, "kept media downloaded");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "kept media download", failure);
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
     * or paused too, since the tap is the request. The work runs on each account's storage queue,
     * away from the screen, and a toast says how many went once Telegram has deleted them. What
     * can't be handed over stays remembered, label and all, so a later tap can try again.
     *
     * @return how many messages are on their way
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
        int queued = 0;
        for (Source source : signedIn) {
            try {
                queued += clearAccount(source);
            } catch (Throwable failure) {
                HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "clearing kept messages", failure);
            }
        }
        if (queued > 0) HookStatus.counted(FamilyNames.KEEP_DELETED_MESSAGES, "kept messages cleared");
        return queued;
    }

    /** One account's part of [clear]. Only counts here; nothing moves until the queue runs it. */
    private static int clearAccount(Source source) throws Exception {
        long owner = source.self();
        if (owner <= 0) return 0;
        int count = waiting(owner);
        if (count == 0) return 0;
        source.post(() -> clearOnQueue(source, owner));
        return count;
    }

    /** How many of [owner]'s messages a clear would hand back: the kept ones, and any not already on their way. */
    static synchronized int waiting(long owner) {
        LinkedHashSet<String> all = new LinkedHashSet<>(load(owner));
        all.addAll(handing(owner));
        all.removeAll(dispatched(owner));
        return all.size();
    }

    /** Runs on the account's storage queue for [clear]. */
    static void clearOnQueue(Source source, long owner) {
        if (!stillOwner(source, owner)) return;
        // Not saved, nothing moved, and every message stays kept with its label.
        if (!beginHandBack(owner)) return;
        handBackWaiting(source, owner, true);
    }

    /** What the row says right after a clear of [count] messages, which are still on their way. */
    public static String clearedMessage(int count) {
        if (count <= 0) return L10n.t("There are no kept messages to clear.");
        return L10n.quantity(count, "Removing %1$d kept message.", "Removing %1$d kept messages.", count);
    }

    /** Hands [owner]'s messages waiting for Telegram's deletion to it, those not already on their way. */
    static void handBackWaiting(Source source, long owner, boolean announce) {
        List<String> waiting;
        synchronized (KeepDeleted.class) {
            waiting = new ArrayList<>(handing(owner));
            waiting.removeAll(dispatched(owner));
        }
        if (!waiting.isEmpty()) handBack(source, owner, waiting, announce);
    }

    /**
     * Runs on the account's storage queue. Each chat's messages go together, the way a push
     * deletes them: a channel or supergroup by its own ID, and anything else with 0. Right before
     * each chat the account is read again, and once it isn't [owner] nothing more is deleted; the
     * rest waits for [owner]. A chat whose deletion can't start goes back on the kept list. The
     * others come off the list of messages on their way only after Telegram's deletion has run.
     */
    static void handBack(Source source, long owner, List<String> messages, boolean announce) {
        Map<Long, ArrayList<Integer>> byChat = new LinkedHashMap<>();
        List<String> done = new ArrayList<>();
        for (String message : messages) {
            try {
                int colon = message.lastIndexOf(':');
                long dialog = Long.parseLong(message.substring(0, colon));
                ArrayList<Integer> ids = byChat.get(dialog);
                if (ids == null) byChat.put(dialog, ids = new ArrayList<>());
                ids.add(Integer.valueOf(message.substring(colon + 1)));
            } catch (RuntimeException unreadable) {
                HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "reading kept messages", unreadable);
                // Nothing can be deleted by it, so it only comes off the list.
                done.add(message);
            }
        }
        int deleted = 0;
        List<String> back = new ArrayList<>();
        for (Map.Entry<Long, ArrayList<Integer>> chat : byChat.entrySet()) {
            if (!stillOwner(source, owner)) break;
            long dialog = chat.getKey();
            long channel;
            try {
                channel = dialog < 0 ? source.channel(dialog) : 0;
                source.stock(dialog, new ArrayList<>(chat.getValue()), channel);
            } catch (Throwable failure) {
                HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "clearing kept messages", failure);
                for (Integer id : chat.getValue()) back.add(key(dialog, id));
                continue;
            }
            for (Integer id : chat.getValue()) done.add(key(dialog, id));
            deleted += chat.getValue().size();
            // A kept message's notification was left in place when its deletion was taken over.
            try {
                source.clearNotifications(new ArrayList<>(chat.getValue()), channel);
            } catch (Throwable failure) {
                HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "notification cleanup", failure);
            }
        }
        if (!back.isEmpty()) returnToKept(owner, back);
        if (done.isEmpty()) return;
        int announced = announce ? deleted : 0;
        synchronized (KeepDeleted.class) {
            dispatched(owner).addAll(done);
        }
        try {
            // Telegram's deletion queued its database work on this same queue, so this runs after it.
            source.post(() -> retire(owner, done, announced));
        } catch (Throwable refused) {
            // They stay on the list of messages on their way, and a later run hands them back again.
            HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "clearing kept messages", refused);
            synchronized (KeepDeleted.class) {
                dispatched(owner).removeAll(done);
            }
        }
    }

    /** Whether [source] is still signed in as [owner]. A slot signed out, or holding another account, isn't. */
    private static boolean stillOwner(Source source, long owner) {
        try {
            if (source.self() == owner) return true;
        } catch (Throwable unreadable) {
            HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "accounts", unreadable);
            return false;
        }
        HookStatus.counted(FamilyNames.KEEP_DELETED_MESSAGES, "kept messages left for their own account");
        return false;
    }

    /**
     * Runs on the storage queue after Telegram's deletion of [done]: they come off [owner]'s list of
     * messages on their way, and the toast says how many went when [announced] isn't 0. Unsaved, they
     * stay on it and a later run deletes them again, which finds nothing.
     */
    static void retire(long owner, List<String> done, int announced) {
        synchronized (KeepDeleted.class) {
            dispatched(owner).removeAll(done);
            LinkedHashSet<String> handing = new LinkedHashSet<>(handing(owner));
            handing.removeAll(done);
            commit(owner, load(owner), handing);
        }
        if (announced > 0) {
            Utils.showToastLong(L10n.quantity(announced, "Removed %1$d kept message.", "Removed %1$d kept messages.", announced));
        }
    }

    /**
     * Remembers [messages] for [owner] as the newest, and moves the oldest past {@link #LIMIT} onto
     * the list of messages on their way back, in one commit.
     *
     * @return the ones moved, or null when the commit failed and nothing changed
     */
    static synchronized List<String> remember(long owner, List<long[]> messages) {
        if (messages.isEmpty()) return Collections.emptyList();
        LinkedHashSet<String> set = new LinkedHashSet<>(load(owner));
        for (long[] message : messages) {
            String key = key(message[0], message[1]);
            set.remove(key);
            set.add(key);
        }
        List<String> dropped = new ArrayList<>();
        for (Iterator<String> oldest = set.iterator(); set.size() > LIMIT && oldest.hasNext(); ) {
            dropped.add(oldest.next());
            oldest.remove();
        }
        LinkedHashSet<String> handing = new LinkedHashSet<>(handing(owner));
        handing.addAll(dropped);
        return commit(owner, set, handing) ? dropped : null;
    }

    /** Kept, or on its way back and not gone yet, so its bubble keeps the label until Telegram removes it. */
    static boolean isKept(long owner, long dialog, long id) {
        String key = key(dialog, id);
        return load(owner).contains(key) || handing(owner).contains(key);
    }

    /** A copy of what [owner] keeps, oldest first. */
    static List<String> keptBy(long owner) {
        return Collections.unmodifiableList(new ArrayList<>(load(owner)));
    }

    /** A copy of [owner]'s messages on their way back to Telegram, oldest first. */
    static List<String> handingBy(long owner) {
        return Collections.unmodifiableList(new ArrayList<>(handing(owner)));
    }

    /** Moves everything [owner] keeps onto the list of messages on their way back, in one commit. */
    static synchronized boolean beginHandBack(long owner) {
        LinkedHashSet<String> kept = load(owner);
        if (kept.isEmpty()) return true;
        LinkedHashSet<String> handing = new LinkedHashSet<>(handing(owner));
        handing.addAll(kept);
        return commit(owner, new LinkedHashSet<>(), handing);
    }

    /**
     * Puts [messages] back on [owner]'s kept list after a hand-back that couldn't start. They go
     * back as the oldest, so they're the next to leave: as the newest, a chat whose deletion keeps
     * failing would push real kept messages out ahead of their turn. Unsaved, they stay on their
     * way back and a later run tries again.
     */
    static synchronized void returnToKept(long owner, List<String> messages) {
        LinkedHashSet<String> current = load(owner);
        LinkedHashSet<String> kept = new LinkedHashSet<>();
        for (String message : messages) if (!current.contains(message)) kept.add(message);
        kept.addAll(current);
        LinkedHashSet<String> handing = new LinkedHashSet<>(handing(owner));
        handing.removeAll(messages);
        commit(owner, kept, handing);
    }

    /**
     * Writes [owner]'s two lists in one commit, and keeps them in memory only once that reached the
     * disk, so what's remembered never runs ahead of what a restart reads. Run under the class lock.
     */
    private static boolean commit(long owner, LinkedHashSet<String> kept, LinkedHashSet<String> handing) {
        if (newer()) {
            HookStatus.counted(FamilyNames.KEEP_DELETED_MESSAGES, "kept messages saved by a newer version");
            return false;
        }
        Map<String, String> entries = new LinkedHashMap<>();
        entries.put(VERSION_KEY, String.valueOf(VERSION));
        entries.put(keptKey(owner), String.join(",", kept));
        entries.put(handingKey(owner), String.join(",", handing));
        try {
            if (!persist.write(entries)) throw new IllegalStateException("the kept messages didn't reach the disk");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "saving kept messages", failure);
            return false;
        }
        KEPT.put(owner, kept);
        HANDING.put(owner, handing);
        return true;
    }

    /**
     * Whether the saved lists come from a newer HushTelegram. Their kept messages still show the
     * label, but nothing is saved over them, so a new message is left to Telegram's own deletion.
     */
    private static synchronized boolean newer() {
        if (newer == null) {
            try {
                String saved = persist.read(VERSION_KEY);
                newer = saved != null && !saved.isEmpty() && Integer.parseInt(saved.trim()) > VERSION;
            } catch (NumberFormatException unknown) {
                newer = true;
            } catch (Throwable unreadable) {
                HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "reading kept messages", unreadable);
                return true;
            }
        }
        return newer;
    }

    static synchronized void forgetAllForTests() {
        KEPT.clear();
        HANDING.clear();
        DISPATCHED.clear();
        newer = null;
        synchronized (SHOWN) {
            SHOWN.clear();
        }
    }

    private static LinkedHashSet<String> load(long owner) {
        return KEPT.computeIfAbsent(owner, account -> read(keptKey(account)));
    }

    private static LinkedHashSet<String> handing(long owner) {
        return HANDING.computeIfAbsent(owner, account -> read(handingKey(account)));
    }

    /** Run under the class lock. */
    private static LinkedHashSet<String> dispatched(long owner) {
        LinkedHashSet<String> set = DISPATCHED.get(owner);
        if (set == null) DISPATCHED.put(owner, set = new LinkedHashSet<>());
        return set;
    }

    private static LinkedHashSet<String> read(String key) {
        LinkedHashSet<String> set = new LinkedHashSet<>();
        try {
            String saved = persist.read(key);
            if (saved != null && !saved.isEmpty()) {
                for (String part : saved.split(",")) if (!part.isEmpty()) set.add(part);
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "reading kept messages", failure);
        }
        return set;
    }

    private static final String VERSION_KEY = "version";

    private static String key(long dialog, long id) { return dialog + ":" + id; }

    private static String shownKey(long owner, long dialog, long id) { return owner + ":" + key(dialog, id); }

    private static String keptKey(long owner) { return "kept_" + owner; }

    private static String handingKey(long owner) { return "handing_" + owner; }

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

        // A commit rather than an apply, so a failed write is known before a message counts as kept.
        // Every write runs on a storage queue.
        @Override public boolean write(Map<String, String> entries) {
            SharedPreferences.Editor edit = prefs().edit();
            for (Map.Entry<String, String> entry : entries.entrySet()) edit.putString(entry.getKey(), entry.getValue());
            return edit.commit();
        }
    }
}
