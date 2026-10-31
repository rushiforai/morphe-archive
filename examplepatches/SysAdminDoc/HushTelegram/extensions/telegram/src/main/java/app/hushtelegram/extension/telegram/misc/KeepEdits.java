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
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Keep edit history, a second switch under Keep deleted messages. When someone else edits a message
 * this phone already has, the text it had before is kept, and Message details in the message's menu
 * lists it with the time of the edit. Telegram's own "edited" mark next to the time stays as it is.
 *
 * <p>The update loop hands each edit over before Telegram stores it. The stored copy is read on the
 * account's storage queue, where Telegram's own write of the edit is queued behind this read, so the
 * read still finds the text from before. Your own messages, disappearing ones, chats that don't allow
 * saving, and edits that leave the text alone (a reaction, a new media caption on an empty one) keep
 * nothing. Only the copies kept here are touched: Telegram's message and its database stay stock.
 * Clear edit history forgets them all, in every account, with the switch on or off.
 */
public final class KeepEdits {
    private KeepEdits() {}

    /** Edited messages remembered per account. Past it, the oldest is forgotten. */
    static final int LIMIT = 500;

    /** Earlier texts remembered per message: the first one, and the newest after it. */
    static final int VERSIONS = 5;

    /** One earlier text, and when it was replaced, in seconds. */
    public static final class Version {
        public final String text;
        public final int replaced;

        Version(String text, int replaced) {
            this.text = text;
            this.replaced = replaced;
        }
    }

    /** The stored copy of a message, with what the decision needs to know about it. */
    static final class Stored {
        final String text;
        final boolean mine;
        final boolean timed;
        final boolean guarded;

        Stored(String text, boolean mine, boolean timed, boolean guarded) {
            this.text = text;
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

        /** The stored copy of [id] in [dialogId], or null when the phone has none. */
        Stored stored(long dialogId, int id) throws Exception;
    }

    /** What an edit update's message carries. */
    interface Edits {
        /** The chat, the ID, the new text and the edit time, in seconds. Null for a message to leave alone. */
        Object[] of(Object message) throws Exception;
    }

    /** Where the kept texts live between runs. */
    interface Persist {
        String read(String key);

        /** Writes every entry in one commit, a null value removing its key. */
        boolean write(Map<String, String> entries);

        /** Forgets every kept text. @return how many messages had some, or -1 when it didn't reach the disk */
        int clear();
    }

    private static final Map<Long, LinkedHashSet<String>> ORDER = new ConcurrentHashMap<>();

    static Persist persist = new Prefs();
    static Edits edits = KeepDeletedBridge::editOf;
    static Sources sources = KeepDeletedBridge::of;

    /** The account behind a message controller. */
    interface Sources {
        Source of(Object controller) throws Exception;
    }

    /**
     * Asked by the update loop as it reads an edit's new message, before Telegram stores it.
     *
     * @param message the edited message, as the server sent it
     * @param controller Telegram's message controller
     */
    public static void edited(Object message, Object controller) {
        if (!on()) return;
        try {
            Object[] edit = edits.of(message);
            if (edit == null) return;
            start(sources.of(controller), (Long) edit[0], (Integer) edit[1], (String) edit[2], (Integer) edit[3]);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "edit", failure);
        }
    }

    /** Whether the switch is on and HushTelegram isn't paused. */
    public static boolean on() {
        try {
            HookStatus.invoked(FamilyNames.KEEP_DELETED_MESSAGES);
            return Utils.settingsReady() && Settings.KEEP_EDIT_HISTORY.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "edit history switch", failure);
            return false;
        }
    }

    /** Hands the read of the stored copy to the storage queue, ahead of Telegram's own write. */
    static void start(Source source, long dialog, int id, String text, int replaced) throws Exception {
        if (dialog == 0 || id <= 0) return;
        source.post(() -> decide(source, dialog, id, text, replaced));
    }

    /** Keeps the stored text when the edit changed it on someone else's message. */
    static void decide(Source source, long dialog, int id, String text, int replaced) {
        try {
            long self = source.self();
            if (self <= 0 || dialog == self) return;
            Stored stored = source.stored(dialog, id);
            if (stored == null || stored.mine || stored.timed || stored.guarded) return;
            String before = stored.text == null ? "" : stored.text;
            if (before.isEmpty() || before.equals(text == null ? "" : text)) return;
            int when = replaced > 0 ? replaced : (int) (System.currentTimeMillis() / 1000);
            if (remember(self, dialog, id, before, when)) HookStatus.counted(FamilyNames.KEEP_DELETED_MESSAGES, "earlier text kept");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "edit decision", failure);
        }
    }

    /**
     * Adds [before] to what [owner] keeps for the message, keeping its first text and the newest
     * after it, and forgets the oldest message past {@link #LIMIT}, in one commit.
     *
     * @return whether a new earlier text reached the disk
     */
    static synchronized boolean remember(long owner, long dialog, int id, String before, int replaced) {
        String key = key(dialog, id);
        List<Version> versions;
        try {
            versions = new ArrayList<>(versions(owner, key));
        } catch (IllegalArgumentException unreadable) {
            // Text that can't be read never will be: start this message's history again.
            HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "reading earlier text", unreadable);
            versions = new ArrayList<>();
        }
        // Two edits in one batch both read the text from before the first.
        if (!versions.isEmpty() && before.equals(versions.get(versions.size() - 1).text)) return false;
        versions.add(new Version(before, replaced));
        while (versions.size() > VERSIONS) versions.remove(1);
        LinkedHashSet<String> order = new LinkedHashSet<>(order(owner));
        order.remove(key);
        order.add(key);
        Map<String, String> entries = new LinkedHashMap<>();
        for (Iterator<String> oldest = order.iterator(); order.size() > LIMIT && oldest.hasNext(); ) {
            entries.put(messageKey(owner, oldest.next()), null);
            oldest.remove();
        }
        entries.put(messageKey(owner, key), encode(versions));
        entries.put(orderKey(owner), String.join(",", order));
        try {
            if (!persist.write(entries)) throw new IllegalStateException("the earlier text didn't reach the disk");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "saving earlier text", failure);
            return false;
        }
        ORDER.put(owner, order);
        return true;
    }

    /** What [owner] keeps for [id] in [dialog], oldest first. Empty with the switch off. */
    public static List<Version> earlier(long owner, long dialog, long id) {
        if (!on()) return Collections.emptyList();
        try {
            String key = key(dialog, id);
            if (!order(owner).contains(key)) return Collections.emptyList();
            return versions(owner, key);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "reading earlier text", failure);
            return Collections.emptyList();
        }
    }

    /**
     * The Clear edit history row: every kept text goes, in every account. Works with the switch off
     * or paused too, since the tap is the request.
     *
     * @return how many messages had earlier text, or -1 when it couldn't be cleared
     */
    public static synchronized int clear() {
        HookStatus.invoked(FamilyNames.KEEP_DELETED_MESSAGES);
        int cleared;
        try {
            cleared = persist.clear();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "clearing edit history", failure);
            cleared = -1;
        }
        if (cleared < 0) return -1;
        ORDER.clear();
        if (cleared > 0) HookStatus.counted(FamilyNames.KEEP_DELETED_MESSAGES, "edit history cleared");
        return cleared;
    }

    /** What the row says right after a clear of [count] messages. */
    public static String clearedMessage(int count) {
        if (count < 0) return L10n.t("Couldn't complete that action. Try again.");
        if (count == 0) return L10n.t("There's no edit history to clear.");
        return L10n.quantity(count, "Cleared the edit history of %1$d message.", "Cleared the edit history of %1$d messages.", count);
    }

    static synchronized void forgetAllForTests() {
        ORDER.clear();
    }

    private static LinkedHashSet<String> order(long owner) {
        return ORDER.computeIfAbsent(owner, account -> {
            LinkedHashSet<String> set = new LinkedHashSet<>();
            try {
                String saved = persist.read(orderKey(account));
                if (saved != null && !saved.isEmpty()) {
                    for (String part : saved.split(",")) if (!part.isEmpty()) set.add(part);
                }
            } catch (Throwable failure) {
                HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "reading earlier text", failure);
            }
            return set;
        });
    }

    private static List<Version> versions(long owner, String key) {
        String saved = persist.read(messageKey(owner, key));
        return saved == null || saved.isEmpty() ? Collections.emptyList() : decode(saved);
    }

    /** Each version as its time, a comma, the text's length, a colon and the text, one after another. */
    static String encode(List<Version> versions) {
        StringBuilder out = new StringBuilder();
        for (Version version : versions) {
            out.append(version.replaced).append(',').append(version.text.length()).append(':').append(version.text);
        }
        return out.toString();
    }

    static List<Version> decode(String saved) {
        List<Version> versions = new ArrayList<>();
        int at = 0;
        while (at < saved.length()) {
            int comma = saved.indexOf(',', at);
            int colon = saved.indexOf(':', comma + 1);
            if (comma < 0 || colon < 0) throw new IllegalArgumentException("unreadable earlier text");
            int replaced = Integer.parseInt(saved.substring(at, comma));
            int length = Integer.parseInt(saved.substring(comma + 1, colon));
            if (length < 0 || length > saved.length() - colon - 1) throw new IllegalArgumentException("unreadable earlier text");
            int end = colon + 1 + length;
            versions.add(new Version(saved.substring(colon + 1, end), replaced));
            at = end;
        }
        return versions;
    }

    private static String key(long dialog, long id) { return dialog + ":" + id; }

    private static String orderKey(long owner) { return "order_" + owner; }

    private static String messageKey(long owner, String key) { return "m_" + owner + "_" + key; }

    /** The kept texts, in the app's own private preferences. */
    private static final class Prefs implements Persist {
        private SharedPreferences prefs() {
            return Utils.getContext().getSharedPreferences("hushtelegram_edit_history", Context.MODE_PRIVATE);
        }

        @Override public String read(String key) { return prefs().getString(key, ""); }

        // A commit rather than an apply, so a failed write is known. Every write runs on a storage queue.
        @Override public boolean write(Map<String, String> entries) {
            SharedPreferences.Editor edit = prefs().edit();
            for (Map.Entry<String, String> entry : entries.entrySet()) {
                if (entry.getValue() == null) edit.remove(entry.getKey());
                else edit.putString(entry.getKey(), entry.getValue());
            }
            return edit.commit();
        }

        @Override public int clear() {
            int count = 0;
            for (String key : prefs().getAll().keySet()) if (key.startsWith("m_")) count++;
            return prefs().edit().clear().commit() ? count : -1;
        }
    }
}
