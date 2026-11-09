/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Executor;
import java.util.function.IntSupplier;

import org.robolectric.RuntimeEnvironment;
import org.telegram.tgnet.TLRPC;
import org.telegram.tgnet.tl.TL_update;

/** Special contacts on a store of its own, for tests outside this package. */
public final class SpecialContactsForTests {
    private SpecialContactsForTests() {}

    /** A MessagesController as far as the hooks read one: its account, and a chat by id. */
    public static class Controller {
        public int currentAccount;
        public final List<Long> asked = new ArrayList<>();

        public TLRPC.Chat getChat(Long id) {
            asked.add(id);
            TLRPC.Chat chat = new TLRPC.Chat();
            chat.title = "Group " + id;
            return chat;
        }
    }

    /** Whether typing from a tracked person reached the history: true when the hook recorded it. */
    public static boolean records() {
        SpecialContactsStore before = SpecialContacts.store;
        Executor work = SpecialContacts.work;
        File dir = new File(RuntimeEnvironment.getApplication().getCacheDir(), "special-contacts-probe-" + System.nanoTime());
        try {
            SpecialContactsStore store = new SpecialContactsStore(dir);
            store.track(0, 42, null, 1_000L);
            SpecialContacts.store = store;
            SpecialContacts.work = Runnable::run;
            TL_update.TL_updateUserTyping typing = new TL_update.TL_updateUserTyping();
            typing.user_id = 42;
            typing.action = new TLRPC.TL_sendMessageTypingAction();
            List<Object> updates = new ArrayList<>();
            updates.add(typing);
            SpecialContacts.updates(new Controller(), updates);
            return SpecialContactsStore.TYPING.equals(store.history(0, 42).get(0).kind);
        } finally {
            SpecialContacts.store = before;
            SpecialContacts.work = work;
            delete(dir);
        }
    }

    private static boolean swapped;
    private static SpecialContactsStore savedStore;
    private static IntSupplier savedAccount;
    private static File folder;

    /** Special contacts on an empty store of its own, showing the first account, until {@link #restore}. */
    public static void fresh() {
        if (!swapped) {
            savedStore = SpecialContacts.store;
            savedAccount = SpecialContacts.account;
            swapped = true;
        }
        if (folder != null) delete(folder);
        folder = new File(RuntimeEnvironment.getApplication().getCacheDir(), "special-contacts-" + System.nanoTime());
        SpecialContacts.store = new SpecialContactsStore(folder);
        SpecialContacts.account = () -> 0;
    }

    /** Tracks [id] on the first account, as seen with [name] and [usernames] (null for neither). */
    public static void track(long id, String name, String usernames) {
        SpecialContactsStore.Seen seen = null;
        if (name != null) {
            seen = new SpecialContactsStore.Seen();
            seen.name = name;
            seen.usernames = usernames;
        }
        SpecialContactsStore.Result result = SpecialContacts.store.track(0, id, seen, 1_700_000_000_000L);
        if (result != SpecialContactsStore.Result.ADDED) throw new IllegalStateException("tracking " + id + ": " + result);
    }

    public static boolean tracked(long id) {
        return SpecialContacts.store.trackedNow(0, id);
    }

    /** How many lines [id]'s history holds on the first account. */
    public static int events(long id) {
        return SpecialContacts.store.history(0, id).size();
    }

    public static void restore() {
        if (!swapped) return;
        SpecialContacts.store = savedStore;
        SpecialContacts.account = savedAccount;
        savedStore = null;
        savedAccount = null;
        swapped = false;
        if (folder != null) delete(folder);
        folder = null;
    }

    static void delete(File file) {
        File[] children = file.listFiles();
        if (children != null) for (File child : children) delete(child);
        //noinspection ResultOfMethodCallIgnored
        file.delete();
    }
}
