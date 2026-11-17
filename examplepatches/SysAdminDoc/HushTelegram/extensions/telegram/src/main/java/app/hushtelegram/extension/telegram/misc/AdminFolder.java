/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.Context;
import android.content.SharedPreferences;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.function.Function;
import java.util.function.LongSupplier;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Logger;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.telegram.misc.ChatTypeFolders.Folder;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * The Admin folder (#79): one of Telegram's own folders with the groups and channels you own or
 * administer, so it's a tab above the chat list and on your other devices, made with a switch the
 * way Folders by chat type makes its folders, through the same requests.
 *
 * <p>Turning the switch on sends {@code messages.updateDialogFilter} for a new folder that lists
 * those chats, as many as Telegram lets a folder hold, then has Telegram load its folders again so
 * the tab shows. While it's on, the folder follows your rights: whenever Telegram sorts the chat
 * list, at most once a minute, a chat you gained rights in goes in and one you no longer manage, or
 * left, goes out. A chat Telegram hasn't loaded yet stays, so a chat list still loading never empties
 * the folder. Turning it off deletes the folder, unless you renamed it, gave it an emoji, or left
 * out or pinned chats in it, which makes it yours. Deleting the folder yourself turns the switch off.
 *
 * <p>Which folder it made is kept in its own prefs file by Telegram user, written before anything
 * is sent, as {@code 1|state|id|name}. None of it is a setting, and the switch stays out of
 * settings backups, as Folders by chat type's does.
 */
public final class AdminFolder {
    static final String PREFS = "hushtelegram_admin_folder";
    /** How often at most the folder is checked against your rights while Telegram sorts the chat list. */
    static final long REFRESH_MS = 60_000;
    /** What {@link #chatRole} says about a chat. */
    static final int UNKNOWN = -1, OTHER = 0, MANAGED = 1;
    /** The most chats a folder holds without Premium, for a build whose limit reads as nothing. */
    static final int DEFAULT_CHAT_LIMIT = 100;

    private AdminFolder() {}

    /** What's kept about the folder this asked Telegram for. */
    static final class Record {
        static final String SENT = "sent";
        static final String MADE = "made";
        static final String REMOVING = "removing";

        final String state;
        final int id;
        final String name;

        Record(String state, int id, String name) {
            this.state = state;
            this.id = id;
            this.name = name;
        }

        static Record read(Object value) {
            if (!(value instanceof String)) return null;
            String[] part = ((String) value).split("\\|", 4);
            if (part.length < 4 || !"1".equals(part[0])) return null;
            if (!(SENT.equals(part[1]) || MADE.equals(part[1]) || REMOVING.equals(part[1]))) return null;
            try {
                return new Record(part[1], Integer.parseInt(part[2]), part[3]);
            } catch (NumberFormatException unreadable) {
                return null;
            }
        }

        String write() {
            return "1|" + state + "|" + id + "|" + name;
        }

        Record as(String state) {
            return new Record(state, id, name);
        }
    }

    /** Telegram's side beyond what Folders by chat type already asks, swapped out by tests. */
    interface Telegram {
        /** The dialog ids of the chats Telegram has loaded, in the chat list's order. */
        long[] dialogs(int account);

        /** {@link #MANAGED}, {@link #OTHER} or {@link #UNKNOWN} for a dialog id. */
        int role(int account, long dialogId);

        /** How many chats one folder can list. */
        int chatLimit(int account);

        /** The dialog ids a folder in Telegram's list shows on top of its chat types, or null when the list hasn't got it. */
        List<Long> chats(int account, int id);

        /** Sends the folder with these chats, as Telegram's folder screen saves one. */
        void save(int account, int id, String name, long[] chats, ChatTypeFolders.Reply reply);

        /** Has Telegram load its folders from the server again, as it does at a start. */
        void reload(int account);
    }

    static Telegram telegram = new Telegram() {
        @Override
        public long[] dialogs(int account) {
            int count = dialogCount(account);
            long[] ids = new long[Math.max(count, 0)];
            for (int i = 0; i < ids.length; i++) ids[i] = dialogId(account, i);
            return ids;
        }

        @Override
        public int role(int account, long dialogId) {
            return dialogId < 0 ? chatRole(account, dialogId) : OTHER;
        }

        @Override
        public int chatLimit(int account) {
            return AdminFolder.chatLimit(account);
        }

        @Override
        public List<Long> chats(int account, int id) {
            Object list = folderChats(account, id);
            if (!(list instanceof List)) return null;
            List<Long> ids = new ArrayList<>();
            for (Object each : (List<?>) list) {
                if (each instanceof Long) ids.add((Long) each);
            }
            return ids;
        }

        @Override
        public void save(int account, int id, String name, long[] chats, ChatTypeFolders.Reply reply) {
            saveAdminFolder(account, id, name, chats, ChatTypeFolders.delegate(ChatTypeFolders.requestDelegate(), reply));
        }

        @Override
        public void reload(int account) {
            reloadFolders(account);
        }
    };

    static Function<Context, SharedPreferences> store = context -> context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);

    /** The clock refreshes go by, swapped out by tests. */
    static LongSupplier clock = System::currentTimeMillis;

    /** The request still waiting on Telegram, or null. Only touched on the main thread. */
    static Pending pending;
    private static long lastRefresh = Long.MIN_VALUE;
    private static boolean reloadedForMissing;

    /** One request, from when it's sent until Telegram answers. */
    static final class Pending {
        final Context context;
        final int account;
        final long user;
        /** True for the switch turning on, false for it turning off, null for a refresh nobody asked for. */
        final Boolean on;
        final boolean cut;

        Pending(Context context, int account, long user, Boolean on, boolean cut) {
            this.context = context;
            this.account = account;
            this.user = user;
            this.on = on;
            this.cut = cut;
        }
    }

    /** The chats the folder should list, and whether Telegram's limit left some out. */
    static final class Selection {
        final long[] chats;
        final boolean cut;

        Selection(long[] chats, boolean cut) {
            this.chats = chats;
            this.cut = cut;
        }

        /** The same chats as the folder lists now, in any order. */
        boolean same(List<Long> now) {
            if (now == null || now.size() != chats.length) return false;
            Set<Long> had = new LinkedHashSet<>(now);
            for (long id : chats) {
                if (!had.contains(id)) return false;
            }
            return had.size() == chats.length;
        }
    }

    static SharedPreferences prefs(Context context) {
        return store.apply(context);
    }

    /** The folder ids this has asked for for a user, so Folders by chat type never asks for one of them. */
    static Set<Integer> recordedIds(Context context, long user) {
        Set<Integer> ids = new LinkedHashSet<>();
        try {
            Record record = Record.read(prefs(context).getAll().get(key(user)));
            if (record != null) ids.add(record.id);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.CHAT_TYPE_FOLDERS, "admin folder record", failure);
        }
        return ids;
    }

    /**
     * From the switch, on the main thread, once its new value is saved: makes the folder with the
     * switch on and removes it with the switch off. When nothing can be asked, the switch goes back.
     *
     * @return what to tell the person now, or null when there's nothing to say yet
     */
    public static String apply(Context context) {
        if (context == null || !PatchFamily.Capability.ADMIN_FOLDER.installed()) return null;
        boolean on = false;
        try {
            if (!Utils.settingsReady()) return null;
            on = Settings.ADMIN_FOLDER.savedValue();
            if (HushTelegramPause.isPaused()) return switchBack(on, L10n.t("HushTelegram is paused, so your folders stay as they are."));
            ChatTypeFolders.Telegram folders = ChatTypeFolders.telegram;
            int account = folders.account();
            if (!folders.signedIn(account)) return switchBack(on, L10n.t("Sign in to Telegram first."));
            List<Folder> list = folders.folders(account);
            if (list == null) return switchBack(on, L10n.t("Telegram is still loading your folders. Try again in a moment."));
            long user = folders.user(account);
            if (pending != null) {
                // Someone else's request has no one to wait for now; its answer only settles their record.
                if (pending.account == account && pending.user == user) {
                    return switchBack(on, L10n.t("Telegram is still answering. Try again in a moment."));
                }
                pending = null;
            }
            Context app = context.getApplicationContext() != null ? context.getApplicationContext() : context;
            return on ? make(app, account, user, list) : remove(app, account, user, list);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.CHAT_TYPE_FOLDERS, "admin folder switch", failure);
            return switchBack(on, L10n.t("Couldn't change your folders. Try again in a moment."));
        }
    }

    private static String switchBack(boolean on, String said) {
        try {
            Settings.ADMIN_FOLDER.save(!on);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.CHAT_TYPE_FOLDERS, "admin folder switch back", failure);
        }
        return said;
    }

    private static String make(Context context, int account, long user, List<Folder> folders) {
        SharedPreferences prefs = prefs(context);
        Record record = Record.read(prefs.getAll().get(key(user)));
        Folder existing = record == null ? null : find(folders, record.id);
        if (existing != null && ours(record, existing)) {
            // Still there from before: bring its chats up to date rather than make a second one.
            Selection pick = pick(account, telegram.chats(account, record.id));
            if (pick.chats.length == 0) return L10n.t("You don't manage any groups or channels yet.");
            Record kept = record.as(Record.MADE);
            if (!prefs.edit().putString(key(user), kept.write()).commit()) {
                return switchBack(true, L10n.t("Couldn't change your folders. Try again in a moment."));
            }
            return send(new Pending(context, account, user, true, pick.cut), kept, pick.chats, false);
        }
        Selection pick = pick(account, null);
        if (pick.chats.length == 0) return switchBack(true, L10n.t("You don't manage any groups or channels yet."));
        Set<Integer> taken = new LinkedHashSet<>();
        int yours = 0;
        for (Folder folder : folders) {
            taken.add(folder.id);
            if (folder.id != 0) yours++;
        }
        // Ids asked for before stay taken, in case Telegram's server has them and the list hasn't caught up.
        taken.addAll(ChatTypeFolders.recordedIds(context, user));
        if (record != null) taken.add(record.id);
        if (ChatTypeFolders.telegram.limit(account) - yours <= 0) {
            return switchBack(true, L10n.t("Folder limit reached. Remove a folder and try again."));
        }
        int id = ChatTypeFolders.FIRST_ID;
        while (taken.contains(id)) id++;
        Record sent = new Record(Record.SENT, id, L10n.t("Admin"));
        // Kept before anything is sent, so a folder that went out is always one Off can find.
        if (!prefs.edit().putString(key(user), sent.write()).commit()) {
            return switchBack(true, L10n.t("Couldn't change your folders. Try again in a moment."));
        }
        return send(new Pending(context, account, user, true, pick.cut), sent, pick.chats, true);
    }

    private static String send(Pending request, Record record, long[] chats, boolean fresh) {
        pending = request;
        try {
            telegram.save(request.account, record.id, record.name, chats, (response, error) -> saved(request, record, fresh, error));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.CHAT_TYPE_FOLDERS, "admin folder request", failure);
            pending = null;
            if (fresh) forget(request.context, request.user, record.id);
            return request.on == null ? null : switchBack(true, L10n.t("Couldn't change your folders. Try again in a moment."));
        }
        return null;
    }

    private static String remove(Context context, int account, long user, List<Folder> folders) {
        SharedPreferences prefs = prefs(context);
        Record record = Record.read(prefs.getAll().get(key(user)));
        if (record == null) return null;
        Folder now = find(folders, record.id);
        // Gone already means you deleted it, or it was never made: nothing is sent for an id that may be reused.
        if (now == null) {
            forget(context, user, record.id);
            return null;
        }
        if (!ours(record, now)) {
            forget(context, user, record.id);
            return L10n.t("You changed the Admin folder, so it stays.");
        }
        Record removing = record.as(Record.REMOVING);
        if (!prefs.edit().putString(key(user), removing.write()).commit()) {
            return switchBack(false, L10n.t("Couldn't change your folders. Try again in a moment."));
        }
        Pending request = new Pending(context, account, user, false, false);
        pending = request;
        try {
            ChatTypeFolders.telegram.delete(account, record.id, (response, error) -> removed(request, record, error));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.CHAT_TYPE_FOLDERS, "admin folder request", failure);
            pending = null;
            save(context, user, record.as(Record.MADE));
            return switchBack(false, L10n.t("Couldn't change your folders. Try again in a moment."));
        }
        return null;
    }

    private static void saved(Pending request, Record record, boolean fresh, String error) {
        if (pending == request) pending = null;
        try {
            Record now = Record.read(prefs(request.context).getAll().get(key(request.user)));
            boolean ours = now != null && now.id == record.id;
            if (error == null) {
                if (ours) save(request.context, request.user, record.as(Record.MADE));
                HookStatus.counted(FamilyNames.CHAT_TYPE_FOLDERS, request.on == null ? "admin folder updated" : "admin folder made");
                if (here(request)) {
                    // A new folder goes in Telegram's list now, so its tab shows, and loading the server's
                    // folders again fills in its chats, as a change from another device does.
                    List<Folder> list = fresh ? ChatTypeFolders.telegram.folders(request.account) : null;
                    if (list != null && find(list, record.id) == null) ChatTypeFolders.telegram.add(request.account, record.id, record.name, 0);
                    telegram.reload(request.account);
                }
                if (request.on == null || !here(request) || !open(request)) return;
                Utils.showToastLong(request.cut ? L10n.t("Made the Admin folder. Some chats didn't fit.") : L10n.t("Made the Admin folder."));
                return;
            }
            Logger.printInfo(() -> "Admin folder: Telegram turned down folder " + record.id + " (" + error + ")");
            if (fresh && ours && here(request)) forget(request.context, request.user, record.id);
            if (request.on == null || !here(request) || !open(request)) return;
            Utils.showToastLong(switchBack(true, ChatTypeFolders.TOO_MANY.equals(error)
                    ? L10n.t("Folder limit reached. Remove a folder and try again.")
                    : L10n.t("Telegram didn't make the folder. Try again later.")));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.CHAT_TYPE_FOLDERS, "admin folder answer", failure);
        }
    }

    private static void removed(Pending request, Record record, String error) {
        if (pending == request) pending = null;
        try {
            if (error == null || ChatTypeFolders.NO_SUCH_FOLDER.equals(error)) {
                forget(request.context, request.user, record.id);
                if (here(request)) ChatTypeFolders.telegram.drop(request.account, record.id);
                HookStatus.counted(FamilyNames.CHAT_TYPE_FOLDERS, "admin folder removed");
                if (here(request) && open(request)) Utils.showToastLong(L10n.t("Removed the Admin folder."));
                return;
            }
            Logger.printInfo(() -> "Admin folder: Telegram kept folder " + record.id + " (" + error + ")");
            save(request.context, request.user, record.as(Record.MADE));
            if (here(request) && open(request)) Utils.showToastLong(switchBack(false, L10n.t("Telegram kept the Admin folder. Try again later.")));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.CHAT_TYPE_FOLDERS, "admin folder answer", failure);
        }
    }

    /**
     * Called each time Telegram sorts the chat list. While the switch is on, at most once a minute,
     * puts the folder's chats right on the main thread.
     */
    public static void refresh() {
        try {
            if (pending != null || !PatchFamily.Capability.ADMIN_FOLDER.installed() || !Utils.settingsReady()
                    || !Settings.ADMIN_FOLDER.get() || HushTelegramPause.isPaused()) return;
            long now = clock.getAsLong();
            if (lastRefresh != Long.MIN_VALUE && now - lastRefresh < REFRESH_MS) return;
            lastRefresh = now;
            Utils.runOnMainThread(AdminFolder::update);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.CHAT_TYPE_FOLDERS, "admin folder refresh", failure);
        }
    }

    static void update() {
        try {
            Context context = Utils.getContext();
            if (context == null || pending != null) return;
            ChatTypeFolders.Telegram folders = ChatTypeFolders.telegram;
            int account = folders.account();
            if (!folders.signedIn(account)) return;
            List<Folder> list = folders.folders(account);
            if (list == null) return;
            long user = folders.user(account);
            Record record = Record.read(prefs(context).getAll().get(key(user)));
            if (record == null || !Record.MADE.equals(record.state)) return;
            Folder now = find(list, record.id);
            if (now == null) {
                // Missing once can be Telegram's list catching up, so it loads the server's folders first.
                if (!reloadedForMissing) {
                    reloadedForMissing = true;
                    telegram.reload(account);
                    return;
                }
                // Missing after that, you deleted it in Telegram, so the switch says so too.
                reloadedForMissing = false;
                forget(context, user, record.id);
                Settings.ADMIN_FOLDER.save(false);
                return;
            }
            reloadedForMissing = false;
            // Renamed or changed, it's yours, and it's left as you made it.
            if (!ours(record, now)) return;
            List<Long> chats = telegram.chats(account, record.id);
            Selection pick = pick(account, chats);
            if (pick.chats.length == 0 || pick.same(chats)) return;
            send(new Pending(context, account, user, null, pick.cut), record, pick.chats, false);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.CHAT_TYPE_FOLDERS, "admin folder refresh", failure);
        }
    }

    /**
     * The chats the folder should list: the ones in it now that you still manage or Telegram hasn't
     * loaded, then every loaded group and channel you manage, in the chat list's order, as many as fit.
     */
    static Selection pick(int account, List<Long> now) {
        Set<Long> chosen = new LinkedHashSet<>();
        if (now != null) {
            for (Long id : now) {
                if (id != null && id < 0 && telegram.role(account, id) != OTHER) chosen.add(id);
            }
        }
        for (long id : telegram.dialogs(account)) {
            if (id < 0 && telegram.role(account, id) == MANAGED) chosen.add(id);
        }
        int limit = telegram.chatLimit(account);
        if (limit <= 0) limit = DEFAULT_CHAT_LIMIT;
        int size = Math.min(chosen.size(), limit);
        long[] chats = new long[size];
        int i = 0;
        for (long id : chosen) {
            if (i == size) break;
            chats[i++] = id;
        }
        return new Selection(chats, chosen.size() > limit);
    }

    /** Still the folder this made: its name, no chat types, no emoji and nothing left out or pinned. */
    static boolean ours(Record record, Folder now) {
        int yours = ChatTypeFolders.TITLE_EMOJI | ChatTypeFolders.CHATS_LEFT_OUT | ChatTypeFolders.CHATS_PINNED;
        return record.name.equals(now.name) && (now.flags & ChatTypeFolders.ALL_TYPES) == 0 && (now.changes & yours) == 0;
    }

    private static boolean here(Pending request) {
        try {
            ChatTypeFolders.Telegram folders = ChatTypeFolders.telegram;
            return folders.signedIn(request.account) && folders.user(request.account) == request.user;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.CHAT_TYPE_FOLDERS, "admin folder account check", failure);
            return false;
        }
    }

    private static boolean open(Pending request) {
        try {
            return ChatTypeFolders.telegram.account() == request.account;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.CHAT_TYPE_FOLDERS, "admin folder account check", failure);
            return false;
        }
    }

    private static Folder find(List<Folder> folders, int id) {
        for (Folder folder : folders) {
            if (folder.id == id) return folder;
        }
        return null;
    }

    private static void save(Context context, long user, Record record) {
        if (!prefs(context).edit().putString(key(user), record.write()).commit()) {
            HookStatus.counted(FamilyNames.CHAT_TYPE_FOLDERS, "admin folder record not saved");
        }
    }

    /** Forgets the record, if it's still for this folder. */
    private static void forget(Context context, long user, int id) {
        SharedPreferences prefs = prefs(context);
        Record record = Record.read(prefs.getAll().get(key(user)));
        if (record != null && record.id != id) return;
        if (!prefs.edit().remove(key(user)).commit()) HookStatus.counted(FamilyNames.CHAT_TYPE_FOLDERS, "admin folder record not saved");
    }

    private static String key(long user) {
        return String.valueOf(user);
    }

    static void resetForTests() {
        pending = null;
        lastRefresh = Long.MIN_VALUE;
        reloadedForMissing = false;
    }

    // Stubs. The patch gives each one Telegram's code; until then they do nothing.

    /** {@code MessagesController.getInstance(account).allDialogs.size()}. */
    public static int dialogCount(int account) { return 0; }

    /** {@code allDialogs.get(index).id}. */
    public static long dialogId(int account, int index) { return 0; }

    /**
     * For a chat's dialog id: {@link #UNKNOWN} when Telegram doesn't have the chat, {@link #MANAGED} when you
     * created it or have admin rights there and haven't left, and {@link #OTHER} otherwise.
     */
    public static int chatRole(int account, long dialogId) { return UNKNOWN; }

    /** {@code dialogFiltersChatsLimitPremium} with Premium, {@code dialogFiltersChatsLimitDefault} without. */
    public static int chatLimit(int account) { return 0; }

    /** {@code dialogFiltersById.get(id).alwaysShow}, or null when there's no such folder. */
    public static Object folderChats(int account, int id) { return null; }

    /** {@code messages.updateDialogFilter} for a folder with only these chats in it, answered through {@code reply}. */
    public static void saveAdminFolder(int account, int id, String name, long[] chats, Object reply) {}

    /** {@code loadRemoteFilters(true, null)}. */
    public static void reloadFolders(int account) {}
}
