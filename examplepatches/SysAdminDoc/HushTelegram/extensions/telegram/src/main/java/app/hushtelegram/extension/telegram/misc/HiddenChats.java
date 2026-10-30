/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.SparseArray;
import android.view.View;

import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.function.Function;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import app.hushtelegram.extension.telegram.settings.SettingsLock;

/**
 * Leaves chats you picked out of the chat list.
 *
 * <p>Telegram sorts every folder's chats, the archive's included, each time a chat moves. Right
 * after that, before it drops the folders left empty, this takes the hidden chats out of those
 * lists and out of the folder tabs' lists, so All Chats, every folder and the archive go without
 * them and a new message doesn't bring them back. Nothing changes on the server: the chats keep
 * their messages and notifications, search still finds them, and they show again the moment the
 * switch goes off or they're unticked. A hidden pinned chat stays pinned: the pin order Telegram
 * sends when you pin or move a chat keeps it in its place. Chats get picked on the settings page,
 * or with Hide from chat list in the more menu of a long press.
 *
 * <p>The unread counts on the folder tabs leave them out too: Telegram counts each folder's unread
 * chats on its storage thread, and the count skips the hidden ones. The app icon's badge still
 * counts them, since it follows their notifications.
 *
 * <p>Each account keeps its own hidden chats on this phone, by the account's user id, so another
 * account signed in to the same slot never gets them.
 */
public final class HiddenChats {
    private HiddenChats() {}

    /** What the diagnostic report counts each sort that left a hidden chat out as. */
    static final String LEFT_OUT = "chat list sorted without the hidden chats";

    /** What the report counts each pinned order sent with the hidden pins put back as. */
    static final String KEPT_PINNED = "pinned order kept the hidden pins";

    /** What the report counts each hidden chat an unread count skipped as. */
    static final String UNCOUNTED = "unread count skipped a hidden chat";

    private static final String PREFS = "hushtelegram_hidden_chats";

    static Function<Context, SharedPreferences> store = context -> context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);

    /** Telegram's side, through the stubs below. A test answers it itself. */
    static Telegram telegram = new Stubs();

    /** A chat the settings page lists: Telegram's dialog id for it and its name. */
    public static final class Chat {
        public final long id;
        public final String name;

        Chat(long id, String name) {
            this.id = id;
            this.name = name;
        }
    }

    /** The account Telegram shows now, as the settings page reads it once: who's signed in, their chats and the hidden ones. */
    public static final class Shown {
        /** The user id, or 0 when no one is signed in. */
        public final long user;
        /** Telegram's account slot, for the refresh after a save. */
        public final int account;
        /** The chat list's chats, then the archive's, then hidden ones Telegram hasn't loaded, each once. */
        public final List<Chat> chats;
        public final Set<Long> hidden;

        Shown(long user, int account, List<Chat> chats, Set<Long> hidden) {
            this.user = user;
            this.account = account;
            this.chats = chats;
            this.hidden = hidden;
        }

        /** Which of [chats] are ticked, in their order. */
        public boolean[] ticked() {
            boolean[] ticked = new boolean[chats.size()];
            for (int i = 0; i < ticked.length; i++) ticked[i] = hidden.contains(chats.get(i).id);
            return ticked;
        }
    }

    /**
     * Injected in MessagesController.sortDialogs after every folder's chats are sorted, before the
     * folders left empty are dropped.
     */
    public static void prune(Object controller) {
        HookStatus.invoked(FamilyNames.HIDE_FOLDER_COUNTERS);
        SparseArray<List<Object>> away = null;
        try {
            if (!Utils.settingsReady() || !Settings.HIDDEN_CHATS.get()) {
                keep(controller, null);
                return;
            }
            Set<Long> hidden = hidden(telegram.controllerUser(controller));
            if (hidden.isEmpty()) {
                keep(controller, null);
                return;
            }
            int left = 0;
            away = new SparseArray<>();
            SparseArray<?> folders = telegram.folders(controller);
            for (int i = 0; folders != null && i < folders.size(); i++) {
                List<Object> gone = new ArrayList<>();
                away.put(folders.keyAt(i), gone);
                left += leaveOut(folders.valueAt(i), hidden, gone);
                if (gone.isEmpty()) away.remove(folders.keyAt(i));
            }
            keep(controller, away);
            Object[] tabs = telegram.selectedFilters(controller);
            for (int i = 0; tabs != null && i < tabs.length; i++) {
                if (tabs[i] != null) leaveOut(telegram.filterDialogs(tabs[i]), hidden, null);
            }
            if (left > 0) HookStatus.counted(FamilyNames.HIDE_FOLDER_COUNTERS, LEFT_OUT);
        } catch (Throwable failure) {
            // What this sort took out, never what an earlier one did.
            keep(controller, away);
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, "hidden chats", failure);
        }
    }

    /**
     * Takes the chats in [hidden] out of [list], a list of Telegram's dialogs, adds them to [gone]
     * when there is one, and says how many went.
     */
    private static int leaveOut(@Nullable Object list, Set<Long> hidden, @Nullable List<Object> gone) {
        if (!(list instanceof List)) return 0;
        int left = 0;
        for (Iterator<?> each = ((List<?>) list).iterator(); each.hasNext(); ) {
            Object dialog = each.next();
            if (dialog != null && hidden.contains(telegram.dialogId(dialog))) {
                each.remove();
                if (gone != null) gone.add(dialog);
                left++;
            }
        }
        return left;
    }

    /** The chats each controller's last sort left out, by folder id, for the pinned order. */
    private static final Map<Object, SparseArray<List<Object>>> AWAY = new WeakHashMap<>();

    private static void keep(Object controller, @Nullable SparseArray<List<Object>> away) {
        synchronized (AWAY) {
            if (away == null || away.size() == 0) AWAY.remove(controller);
            else AWAY.put(controller, away);
        }
    }

    /**
     * Injected in MessagesController.reorderPinnedDialogs right after it reads [folder]'s chats.
     * Telegram sends the server the pinned chats in that list as the whole pinned order, so a
     * hidden pinned chat missing from it would come unpinned everywhere. This gives it back a copy
     * with the hidden pinned chats among the pins, each at its own pin place. The list on screen
     * stays as it is.
     */
    public static Object pinOrder(Object controller, int folder, Object list) {
        try {
            if (!(list instanceof List) || ((List<?>) list).isEmpty() || !Utils.settingsReady() || !Settings.HIDDEN_CHATS.get()) {
                return list;
            }
            Set<Long> hidden = hidden(telegram.controllerUser(controller));
            List<Object> away;
            synchronized (AWAY) {
                SparseArray<List<Object>> folders = AWAY.get(controller);
                away = folders == null ? null : folders.get(folder);
                away = away == null ? null : new ArrayList<>(away);
            }
            if (hidden.isEmpty() || away == null) return list;
            Set<Long> listed = new HashSet<>();
            List<Object> pins = new ArrayList<>();
            List<Object> rest = new ArrayList<>();
            for (Object dialog : (List<?>) list) {
                if (dialog != null) listed.add(telegram.dialogId(dialog));
                (dialog != null && telegram.pinned(dialog) ? pins : rest).add(dialog);
            }
            int back = 0;
            for (Object dialog : away) {
                long id = telegram.dialogId(dialog);
                if (!hidden.contains(id) || listed.contains(id) || !telegram.pinned(dialog)) continue;
                // Telegram orders pins by pinnedNum, highest first.
                int num = telegram.pinnedNum(dialog);
                int at = 0;
                while (at < pins.size() && telegram.pinnedNum(pins.get(at)) >= num) at++;
                pins.add(at, dialog);
                back++;
            }
            if (back == 0) return list;
            ArrayList<Object> order = new ArrayList<>(pins);
            order.addAll(rest);
            HookStatus.counted(FamilyNames.HIDE_FOLDER_COUNTERS, KEPT_PINNED);
            return order;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, "pinned order", failure);
            return list;
        }
    }

    /**
     * Injected in MessagesStorage.calcUnreadCounters and updateFiltersReadCounter right after each
     * chat's id is read, on the storage thread. A yes skips the chat, so the unread counts on the
     * folder tabs, All Chats and the archive go without the hidden chats.
     */
    public static boolean uncounted(Object storage, long chat) {
        try {
            if (chat == 0 || !Utils.settingsReady() || !Settings.HIDDEN_CHATS.get()) return false;
            if (!hidden(telegram.controllerUser(storage)).contains(chat)) return false;
            HookStatus.counted(FamilyNames.HIDE_FOLDER_COUNTERS, UNCOUNTED);
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, "unread counts", failure);
            return false;
        }
    }

    /**
     * The account Telegram shows now, its chats and the hidden ones, or null when Telegram's side
     * can't be read, which the settings page says rather than going down with it. Main thread only:
     * Telegram's lists change there.
     */
    @Nullable
    public static Shown shown() {
        try {
            int account = telegram.selectedAccount();
            long user = telegram.userId(account);
            Set<Long> hidden = hidden(user);
            Set<Long> ids = new LinkedHashSet<>();
            for (int folder = 0; folder <= 1; folder++) {
                List<?> dialogs = telegram.dialogs(account, folder);
                if (dialogs == null) continue;
                for (Object dialog : dialogs) {
                    if (dialog != null) ids.add(telegram.dialogId(dialog));
                }
            }
            ids.addAll(hidden);
            List<Chat> chats = new ArrayList<>();
            for (long id : ids) {
                if (id == 0) continue;
                // Your own chat is Saved Messages, as Telegram lists it, not your name.
                String name = id == user ? L10n.t("Saved Messages") : telegram.peerName(account, id);
                chats.add(new Chat(id, name == null || name.trim().isEmpty() ? String.valueOf(id) : name));
            }
            return new Shown(user, account, Collections.unmodifiableList(chats), hidden);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, "chat list for hiding", failure);
            return null;
        }
    }

    /** The chats hidden for [user], empty for no one and when they can't be read. */
    public static Set<Long> hidden(long user) {
        Context context = Utils.getContext();
        if (user == 0 || context == null) return Collections.emptySet();
        try {
            Set<String> saved = store.apply(context).getStringSet(String.valueOf(user), null);
            if (saved == null || saved.isEmpty()) return Collections.emptySet();
            Set<Long> ids = new LinkedHashSet<>();
            for (String id : saved) {
                try {
                    ids.add(Long.parseLong(id));
                } catch (NumberFormatException skipped) {
                    // Not one this wrote.
                }
            }
            return Collections.unmodifiableSet(ids);
        } catch (RuntimeException unreadable) {
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, "hidden chats", unreadable);
            return Collections.emptySet();
        }
    }

    /**
     * Saves [ids] as [user]'s hidden chats, none for an empty set. It's written before this returns,
     * so call it off the main thread.
     *
     * @return whether it was written
     */
    public static boolean hide(long user, Set<Long> ids) {
        Context context = Utils.getContext();
        if (user == 0 || context == null) return false;
        SharedPreferences.Editor edit = store.apply(context).edit();
        if (ids.isEmpty()) {
            edit.remove(String.valueOf(user));
        } else {
            Set<String> saved = new LinkedHashSet<>();
            for (long id : ids) saved.add(String.valueOf(id));
            edit.putStringSet(String.valueOf(user), saved);
        }
        return edit.commit();
    }

    /**
     * Sorts [account]'s chats again and redraws its chat lists, then has its unread counts made
     * again, so a change shows now. Main thread only.
     */
    public static void refresh(int account) {
        try {
            telegram.resort(account);
            telegram.recount(account);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, "chat list refresh", failure);
        }
    }

    /**
     * {@link #refresh} for each signed-in account, not only the one on screen: the switch covers
     * them all, and each keeps its own counts. Main thread only.
     */
    public static void refreshAll() {
        try {
            for (int account = 0, slots = telegram.accountSlots(); account < slots; account++) {
                if (telegram.userId(account) != 0) refresh(account);
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, "chat list refresh", failure);
        }
    }

    /** The long press menu's Hide from chat list item, an id far from Telegram's own. */
    static final int MENU_ID = 0x48544801;

    /** Telegram's id for its back arrow, which closes the long press selection. */
    static final int CLOSE_SELECTION = -1;

    /** Each chat list's Hide from chat list item, so it can follow the switch. Main thread only. */
    private static final Map<Object, WeakReference<View>> MENU_ITEMS = new WeakHashMap<>();

    /**
     * Injected in DialogsActivity.createActionMode right after the more menu's Block item: adds
     * Hide from chat list under it.
     */
    public static void menuItem(Object list, Object more) {
        try {
            Context context = Utils.getContext();
            int icon = context == null ? 0 : context.getResources().getIdentifier("msg_archive_hide", "drawable", context.getPackageName());
            Object item = telegram.addMenuItem(more, MENU_ID, icon, L10n.t("Hide from chat list"));
            if (item instanceof View) {
                MENU_ITEMS.put(list, new WeakReference<>((View) item));
                menuShown(list);
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, "hide from chat list item", failure);
        }
    }

    /**
     * Injected at the start of DialogsActivity.updateCounters, which runs each time the selection
     * changes: the item shows while Hide picked chats is on.
     */
    public static void menuShown(Object list) {
        try {
            WeakReference<View> held = MENU_ITEMS.get(list);
            View item = held == null ? null : held.get();
            if (item == null) return;
            item.setVisibility(Utils.settingsReady() && Settings.HIDDEN_CHATS.get() ? View.VISIBLE : View.GONE);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, "hide from chat list item", failure);
        }
    }

    /**
     * Injected at the start of DialogsActivity's action bar click handler. A tap on Hide from chat
     * list adds the selected chats to the account's hidden ones and hands Telegram its back arrow,
     * which closes the selection; any other id goes on as it came.
     */
    public static int menuChoice(Object listener, int id) {
        if (id != MENU_ID) return id;
        try {
            if (SettingsLock.refuses()) return id;
            Set<Long> picked = new LinkedHashSet<>();
            List<?> selected = telegram.selectedChats(listener);
            for (int i = 0; selected != null && i < selected.size(); i++) {
                Object chat = selected.get(i);
                if (chat instanceof Long && (Long) chat != 0) picked.add((Long) chat);
            }
            int account = telegram.selectedAccount();
            long user = telegram.userId(account);
            if (picked.isEmpty() || user == 0) return CLOSE_SELECTION;
            // Read and written in one queued task, so two quick hides don't drop each other's chats.
            boolean queued = Utils.runInOrderOnBackgroundThread(() -> {
                Set<Long> hide = new LinkedHashSet<>(hidden(user));
                hide.addAll(picked);
                boolean saved = hide(user, hide);
                Utils.runOnMainThread(() -> {
                    if (saved) {
                        refresh(account);
                        Utils.showToastShort(L10n.t("Hidden from your chat list."));
                    } else {
                        Utils.showToastLong(L10n.t("Couldn't save the chats. Try again in a moment."));
                    }
                });
            });
            if (!queued) Utils.showToastLong(L10n.t("Couldn't save the chats. Try again in a moment."));
            return CLOSE_SELECTION;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, "hide from chat list", failure);
            return id;
        }
    }

    /** What this needs from Telegram. */
    interface Telegram {
        long controllerUser(Object controller);

        @Nullable
        SparseArray<?> folders(Object controller);

        @Nullable
        Object[] selectedFilters(Object controller);

        @Nullable
        List<?> filterDialogs(Object filter);

        long dialogId(Object dialog);

        boolean pinned(Object dialog);

        int pinnedNum(Object dialog);

        int selectedAccount();

        int accountSlots();

        long userId(int account);

        @Nullable
        List<?> dialogs(int account, int folder);

        @Nullable
        String peerName(int account, long id);

        void resort(int account);

        void recount(int account);

        @Nullable
        Object addMenuItem(Object more, int id, int icon, String text);

        @Nullable
        List<?> selectedChats(Object listener);
    }

    private static final class Stubs implements Telegram {
        @Override public long controllerUser(Object controller) { return HiddenChats.controllerUser(controller); }
        @Override public SparseArray<?> folders(Object controller) { return HiddenChats.folders(controller); }
        @Override public Object[] selectedFilters(Object controller) { return HiddenChats.selectedFilters(controller); }
        @Override public List<?> filterDialogs(Object filter) { return HiddenChats.filterDialogs(filter); }
        @Override public long dialogId(Object dialog) { return HiddenChats.dialogId(dialog); }
        @Override public boolean pinned(Object dialog) { return HiddenChats.pinned(dialog); }
        @Override public int pinnedNum(Object dialog) { return HiddenChats.pinnedNum(dialog); }
        @Override public int selectedAccount() { return HiddenChats.selectedAccount(); }

        /** {@code UserConfig.MAX_ACCOUNT_COUNT}, read the way KeepDeletedBridge reads it. */
        @Override public int accountSlots() {
            try {
                return Class.forName("org.telegram.messenger.UserConfig", true, HiddenChats.class.getClassLoader())
                        .getField("MAX_ACCOUNT_COUNT").getInt(null);
            } catch (ReflectiveOperationException missing) {
                throw new IllegalStateException("no account slots", missing);
            }
        }

        @Override public long userId(int account) { return HiddenChats.userId(account); }
        @Override public List<?> dialogs(int account, int folder) { return HiddenChats.dialogs(account, folder); }
        @Override public String peerName(int account, long id) { return HiddenChats.peerName(account, id); }
        @Override public void resort(int account) { HiddenChats.resort(account); }
        @Override public void recount(int account) {
            HiddenChats.onStorageThread(account, () -> {
                try {
                    HiddenChats.recount(account);
                } catch (Throwable failure) {
                    HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, "unread recount", failure);
                }
            });
        }
        @Override public Object addMenuItem(Object more, int id, int icon, String text) { return HiddenChats.addMenuItem(more, id, icon, text); }
        @Override public List<?> selectedChats(Object listener) { return HiddenChats.selectedChats(listener); }
    }

    // Stubs. The patch gives each one Telegram's code; until then they do nothing.

    /** {@code controller.getUserConfig().getClientUserId()}, for a MessagesController or a MessagesStorage. */
    public static long controllerUser(Object controller) { return 0; }

    /** {@code controller.dialogsByFolder}, each folder's chats by folder id. */
    @Nullable
    public static SparseArray<?> folders(Object controller) { return null; }

    /** {@code controller.selectedDialogFilter}, the folders the chat list's tabs show now. */
    @Nullable
    public static Object[] selectedFilters(Object controller) { return null; }

    /** {@code filter.dialogs}. */
    @Nullable
    public static ArrayList<?> filterDialogs(Object filter) { return null; }

    /** {@code dialog.id}. */
    public static long dialogId(Object dialog) { return 0; }

    /** {@code dialog.pinned}. */
    public static boolean pinned(Object dialog) { return false; }

    /** {@code dialog.pinnedNum}. */
    public static int pinnedNum(Object dialog) { return 0; }

    /** {@code UserConfig.selectedAccount}. */
    public static int selectedAccount() { return 0; }

    /** {@code UserConfig.getInstance(account).getClientUserId()}. */
    public static long userId(int account) { return 0; }

    /** {@code MessagesController.getInstance(account).getDialogs(folder)}. */
    @Nullable
    public static ArrayList<?> dialogs(int account, int folder) { return null; }

    /** {@code MessagesController.getInstance(account).getPeerName(id)}. */
    @Nullable
    public static String peerName(int account, long id) { return null; }

    /**
     * {@code MessagesController.getInstance(account).sortDialogs(null)}, then
     * {@code NotificationCenter.getInstance(account).postNotificationName(dialogsNeedReload)}.
     */
    public static void resort(int account) {}

    /**
     * {@code MessagesStorage.getInstance(account).resetAllUnreadCounters(false)}, which counts every
     * folder's unread chats again. Storage thread only. Left empty when this build's counts can't
     * skip the hidden chats.
     */
    public static void recount(int account) {}

    /**
     * {@code MessagesStorage.getInstance(account).getStorageQueue().postRunnable(work)}. Left empty
     * with {@link #recount}.
     */
    public static void onStorageThread(int account, Runnable work) {}

    /** {@code more.addSubItem(id, icon, text)}, the long press menu's new item. */
    @Nullable
    public static Object addMenuItem(Object more, int id, int icon, String text) { return null; }

    /** {@code listener.this$0.selectedDialogs}, the chat ids the long press picked. */
    @Nullable
    public static ArrayList<?> selectedChats(Object listener) { return null; }
}
