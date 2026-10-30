/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.SharedPreferences;
import android.util.SparseArray;
import android.view.View;

import org.robolectric.RuntimeEnvironment;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;

/** Lets tests give the hidden chats a Telegram, and ask what they do. */
public final class HiddenChatsForTests {
    private HiddenChatsForTests() {}

    private static HiddenChats.Telegram saved;

    /** One of Telegram's dialogs, as the stubs read it. */
    public static final class Dialog {
        public final long id;
        public boolean pinned;
        public int pinnedNum;

        public Dialog(long id) {
            this.id = id;
        }

        /** This chat pinned at [num], Telegram's place for it among the pins (highest first). */
        public Dialog pin(int num) {
            pinned = true;
            pinnedNum = num;
            return this;
        }

        @Override public String toString() {
            return String.valueOf(id);
        }
    }

    /** One folder tab's own list. */
    public static final class Filter {
        public final ArrayList<Object> dialogs = new ArrayList<>();
    }

    /** Telegram for one account slot at a time: the sort's lists, each account's chats, and every refresh. */
    public static class Fake implements HiddenChats.Telegram {
        public long controllerUser = 1000;
        public final SparseArray<ArrayList<Object>> folders = new SparseArray<>();
        public Object[] filters = new Object[0];
        public int selected = 0;
        public int slots = 4;
        public final Map<Integer, Long> users = new HashMap<>();
        /** Each account's chat list (folder 0) and archive (folder 1). */
        public final Map<String, List<Object>> chats = new HashMap<>();
        public final Map<Long, String> names = new HashMap<>();
        public final List<Integer> resorted = new ArrayList<>();
        public final List<Integer> recounted = new ArrayList<>();
        public boolean broken;

        public Fake folder(int id, long... dialogs) {
            ArrayList<Object> list = new ArrayList<>();
            for (long dialog : dialogs) list.add(new Dialog(dialog));
            folders.put(id, list);
            return this;
        }

        public Fake chats(int account, int folder, long... ids) {
            List<Object> list = new ArrayList<>();
            for (long id : ids) list.add(new Dialog(id));
            chats.put(account + "/" + folder, list);
            return this;
        }

        @Override public long controllerUser(Object controller) { return controllerUser; }
        @Override public SparseArray<?> folders(Object controller) { return folders; }
        @Override public Object[] selectedFilters(Object controller) { return filters; }
        @Override public List<?> filterDialogs(Object filter) { return ((Filter) filter).dialogs; }
        @Override public long dialogId(Object dialog) { return ((Dialog) dialog).id; }
        @Override public boolean pinned(Object dialog) { return ((Dialog) dialog).pinned; }
        @Override public int pinnedNum(Object dialog) { return ((Dialog) dialog).pinnedNum; }

        @Override public int selectedAccount() {
            if (broken) throw new IllegalStateException("Telegram changed");
            return selected;
        }

        @Override public int accountSlots() {
            if (broken) throw new IllegalStateException("Telegram changed");
            return slots;
        }

        @Override public long userId(int account) { return users.getOrDefault(account, 0L); }
        @Override public List<?> dialogs(int account, int folder) { return chats.get(account + "/" + folder); }
        @Override public String peerName(int account, long id) { return names.get(id); }
        @Override public void resort(int account) { resorted.add(account); }
        @Override public void recount(int account) { recounted.add(account); }

        /** The long press menu's items as "id text", and the chat ids a long press picked. */
        public final List<String> menu = new ArrayList<>();
        public final ArrayList<Object> picked = new ArrayList<>();
        public View item;

        @Override public Object addMenuItem(Object more, int id, int icon, String text) {
            menu.add(Integer.toHexString(id) + " " + text);
            item = new View(RuntimeEnvironment.getApplication());
            return item;
        }

        @Override public List<?> selectedChats(Object listener) { return picked; }

        /** Each folder's chat ids, as "folder: ids" in folder order. */
        public List<String> lists() {
            List<String> out = new ArrayList<>();
            for (int i = 0; i < folders.size(); i++) out.add(folders.keyAt(i) + ": " + folders.valueAt(i));
            return out;
        }
    }

    /** Gives the hidden chats [telegram]. {@link #restore} undoes it. */
    public static Fake use(Fake telegram) {
        if (saved == null) saved = HiddenChats.telegram;
        HiddenChats.telegram = telegram;
        return telegram;
    }

    /** Back to the stubs, with nothing hidden. */
    public static void restore() {
        if (saved != null) HiddenChats.telegram = saved;
        saved = null;
        HiddenChats.store.apply(RuntimeEnvironment.getApplication()).edit().clear().commit();
    }

    /** With chat 5 hidden for the signed-in user, whether a sort leaves it out of the chat list. */
    public static boolean leavesOut() {
        HiddenChats.Telegram real = HiddenChats.telegram;
        Fake telegram = new Fake().folder(0, 4, 5, 6);
        HiddenChats.telegram = telegram;
        // Written straight to the file, so the pick is there even while the extension has no context.
        SharedPreferences picks =HiddenChats.store.apply(RuntimeEnvironment.getApplication());
        picks.edit().putStringSet("1000", new LinkedHashSet<>(Collections.singletonList("5"))).commit();
        try {
            HiddenChats.prune(new Object());
        } finally {
            HiddenChats.telegram = real;
            picks.edit().clear().commit();
        }
        return Arrays.asList("0: [4, 6]").equals(telegram.lists());
    }
}
