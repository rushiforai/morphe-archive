/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;

import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.function.Function;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Opens the chat list on a folder you picked instead of All chats.
 *
 * <p>Telegram builds the folder tabs above the chat list once it has more than one folder to show,
 * and the first tab it adds is the one selected. Just before that first build, with the switch on,
 * this selects the folder picked for the account the list belongs to, so the tabs and the list come
 * up on it with nothing to animate, and with more tabs than fit the strip starts at its tab. The
 * folder order and the server's copy of the folders aren't touched.
 *
 * <p>Each account keeps its own pick on this phone, by the account's user id, so another account
 * signed in to the same slot never gets it. A pick is the folder's id and the name it had when
 * picked, since Telegram gives a deleted folder's id to the next one made. A folder that's gone,
 * renamed or locked by Telegram's folder limit is passed over and All chats opens as usual. Only
 * the main chat list takes it: the lists that pick a chat to share or forward to, and the archive,
 * open as Telegram has them. It happens once for each chat list Telegram makes. A list whose view
 * is built again, after a theme change say, gets new tabs and opens as Telegram has it then.
 *
 * <p>Hide All Chats leaves the All Chats tab out of that build while the account has a folder it
 * can open, and the list opens on the pick or the first such folder. Telegram numbers the tabs by
 * their place in the folder list, and with one left out some of its lookups by place land on the
 * next tab, so after every build the selected tab and the page's folder are set to agree again. Tab
 * dragging writes the new order by place too, to the server, so it's turned down while the tab is
 * hidden. The archive's row only shows in All Chats, so the chat list's menu and the side menu
 * take one instead. Each list reads the switch once, at its first build.
 */
public final class LaunchFolder {
    private LaunchFolder() {}

    /** What the diagnostic report counts each chat list opened on a picked folder as. */
    static final String OPENED = "chat list opened on the picked folder";
    /** What it counts each chat list built without All Chats as. */
    static final String HIDDEN = "chat list built without All Chats";
    /** The archive's folder id, which a chat list opened with it shows. */
    static final int ARCHIVE = 1;
    static final String ARCHIVE_FALLBACK = "Archived Chats";

    private static final String PREFS = "hushtelegram_launch_folders";
    /** Added to a user id for the picked folder's name, beside its id under the user id itself. */
    private static final String NAME = ".name";

    /** The chat lists whose tabs were built once already. Weak, so a list Telegram drops goes too. Main thread only. */
    private static final Map<Object, Build> built = new WeakHashMap<>();
    /** The tab strips building without All Chats now. Main thread only. */
    private static final Map<Object, Boolean> hiddenIn = new WeakHashMap<>();
    /** The last main chat list built without All Chats, which the side menu opens the archive from. */
    private static WeakReference<Object> archiveFrom = new WeakReference<>(null);
    /** Why the last main chat list built with Hide All Chats on kept All Chats, or null when it left it out. */
    @Nullable private static volatile Kept kept;

    /** Why a main chat list built with Hide All Chats on kept All Chats, which the settings and the diagnostic report name. */
    public enum Kept {
        /** All Chats holds the archive's row, and this build has no other way in. */
        NO_ARCHIVE("All Chats kept: no other way to the archive"),
        /** The account has no folder of its own to open instead, or each one is locked. */
        NO_FOLDER("All Chats kept: no unlocked folder of the account's own"),
        /** The tab strip, or a folder in it, couldn't be read. */
        NO_STRIP("All Chats kept: the tab strip couldn't be read");

        /** What the diagnostic report counts it as. */
        public final String counted;

        Kept(String counted) {
            this.counted = counted;
        }
    }

    /** One chat list's answer to Hide All Chats, and where it stood before the build going on. */
    private static final class Build {
        /** The switch as the first build read it, for the main chat list only. */
        final boolean hides;
        /** Whether this build leaves All Chats out: [hides], and the account has a folder to open. */
        boolean hiding;
        boolean wasEmpty;
        int typeBefore;
        int stableBefore;

        Build(boolean hides) {
            this.hides = hides;
        }
    }

    static Function<Context, SharedPreferences> store = context -> context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);

    /** Telegram's side, through the stubs below. A test answers it itself. */
    static Telegram telegram = new Stubs();

    /** A folder an account can open on: Telegram's id for it and its name. */
    public static final class Folder {
        public final int id;
        public final String name;

        Folder(int id, String name) {
            this.id = id;
            this.name = name;
        }

        /** Whether this is [pick]: the same id and the same name, so a new folder that took a deleted one's id isn't. */
        public boolean is(@Nullable Folder pick) {
            return pick != null && id == pick.id && name.equals(pick.name);
        }
    }

    /** The account Telegram shows now, as the settings page reads it once: who's signed in, their folders and their pick. */
    public static final class Shown {
        /** The user id, or 0 when no one is signed in. */
        public final long user;
        public final List<Folder> folders;
        @Nullable public final Folder pick;

        Shown(long user, List<Folder> folders, @Nullable Folder pick) {
            this.user = user;
            this.folders = folders;
            this.pick = pick;
        }

        /** Where the pick sits in a list of All Chats then [folders]: 0 for All Chats, and for a pick that's gone. */
        public int choice() {
            return choiceOf(pick);
        }

        /** Where [folder] sits in that list, 0 when it isn't there. */
        public int choiceOf(@Nullable Folder folder) {
            for (int i = 0; i < folders.size(); i++) {
                if (folders.get(i).is(folder)) return i + 1;
            }
            return 0;
        }
    }

    /**
     * Injected in DialogsActivity.updateFilterTabs where it asks whether the folder tabs are still
     * empty, before any is added.
     */
    public static void firstTabs(Object list) {
        HookStatus.invoked(FamilyNames.HIDE_FOLDER_COUNTERS);
        try {
            boolean empty = telegram.tabsEmpty(list);
            Build build = built.get(list);
            // The folder this first build opened on, or -1.
            int opened = -1;
            if (build == null) {
                // Counted whatever the switches say, so turning one on later doesn't move a list already up.
                if (!empty) return;
                boolean ready = Utils.settingsReady();
                boolean launch = ready && Settings.LAUNCH_FOLDER.get();
                boolean hide = ready && Settings.HIDE_ALL_CHATS.get();
                boolean main = (launch || hide) && mainList(telegram.arguments(list));
                build = new Build(main && hide);
                built.put(list, build);
                if (main && launch) {
                    int account = telegram.account(list);
                    int index = indexOf(account, picked(telegram.userId(account)));
                    if (index >= 0 && telegram.select(list, index)) {
                        opened = index;
                        HookStatus.counted(FamilyNames.HIDE_FOLDER_COUNTERS, OPENED);
                    }
                }
            }
            int selected = build.hides ? beforeHiding(list, build, empty, opened) : opened;
            if (selected >= 0) reveal(list, build, selected);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, "folder at launch", failure);
            Build build = built.get(list);
            if (build != null && build.hides && !build.hiding) {
                kept = Kept.NO_STRIP;
                HookStatus.counted(FamilyNames.HIDE_FOLDER_COUNTERS, Kept.NO_STRIP.counted);
            }
        }
    }

    /**
     * Decides whether this build of [list]'s tabs leaves All Chats out and notes where the list
     * stands before it. A first build that didn't open on a pick opens on the first folder.
     *
     * @param opened the folder the build opened on, or -1
     * @return the folder the build opens on now, or -1
     */
    private static int beforeHiding(Object list, Build build, boolean empty, int opened) {
        // Stock until this build is known to hide, so a read that throws keeps All Chats and its archive row.
        archiveFrom = new WeakReference<>(null);
        build.hiding = false;
        Object strip = telegram.strip(list);
        if (strip == null) return keep(Kept.NO_STRIP, empty, opened);
        hiddenIn.remove(strip);
        // All Chats holds the archive's row, so it stays unless the menu or the side menu opens the archive.
        if (!telegram.archiveReachable()) return keep(Kept.NO_ARCHIVE, empty, opened);
        int account = telegram.account(list);
        int first = firstOpen(account);
        if (first < 0) return keep(Kept.NO_FOLDER, empty, opened);
        kept = null;
        build.hiding = true;
        hiddenIn.put(strip, Boolean.TRUE);
        archiveFrom = new WeakReference<>(list);
        build.wasEmpty = empty;
        build.typeBefore = telegram.selectedType(list);
        build.stableBefore = telegram.currentStable(list);
        if (!empty) return -1;
        int open = opened;
        if (open < 0) {
            // A view built again opens where a new list would: the pick, else the first folder.
            int pick = Utils.settingsReady() && Settings.LAUNCH_FOLDER.get()
                    ? indexOf(account, picked(telegram.userId(account))) : -1;
            int folder = pick >= 0 ? pick : first;
            if (telegram.select(list, folder)) open = folder;
        }
        HookStatus.counted(FamilyNames.HIDE_FOLDER_COUNTERS, HIDDEN);
        return open;
    }

    /** Keeps All Chats in this build for [why], counted at a first build as one left out is. */
    private static int keep(Kept why, boolean empty, int opened) {
        kept = why;
        if (empty) HookStatus.counted(FamilyNames.HIDE_FOLDER_COUNTERS, why.counted);
        return opened;
    }

    /** Why the last main chat list built with Hide All Chats on kept All Chats, or null when it left it out or none was. */
    @Nullable
    public static Kept kept() {
        return kept;
    }

    /**
     * Scrolls [list]'s tab strip so the tab of folder [index] starts it, as the first build opens
     * on it: Telegram leaves the strip at its start then, and with more folders than fit a pick
     * past the edge would stay out of view. The strip numbers tabs by place, so All Chats left out
     * ahead of it moves it one back. The first place is where the strip starts anyway, and a strip
     * whose tabs all fit lays them out as before.
     */
    private static void reveal(Object list, Build build, int index) {
        int position = index;
        if (build.hiding) {
            int account = telegram.account(list);
            for (int i = 0; i < index; i++) {
                if (telegram.folderDefault(account, i)) position--;
            }
        }
        if (position > 0) telegram.scrollStrip(list, position);
    }

    /**
     * Put in place of the call that adds the All Chats tab: adds it unless this strip's build
     * leaves it out. The flags come as ints, the way the hook hands them on.
     */
    public static void allChatsTab(Object strip, int id, int stableId, String title, ArrayList<?> entities,
                                   int noAnimation, int isDefault, int locked) {
        if (Boolean.TRUE.equals(hiddenIn.get(strip))) return;
        telegram.addTab(strip, id, stableId, title, entities, noAnimation != 0, isDefault != 0, locked != 0);
    }

    /**
     * Injected in updateFilterTabs once every tab is added, where it decides whether the page shows
     * another folder now. With All Chats left out it sets the selected tab, and the first page's
     * folder, to one the account can open, and answers whether that moved the list.
     *
     * @param update Telegram's own answer
     * @return whether the page switches to the selected tab's chats
     */
    public static boolean tabsAdded(Object list, int update) {
        try {
            Build build = built.get(list);
            if (build == null || !build.hiding) return update != 0;
            int account = telegram.account(list);
            int selected = telegram.selectedId(list);
            if (!opens(account, selected)) {
                selected = firstOpen(account);
                if (selected < 0) return update != 0;
                telegram.selectByStable(list, telegram.folderStable(account, selected));
            }
            telegram.select(list, selected);
            // Telegram's own answer compares by place, which is off by one with All Chats gone.
            return build.wasEmpty || build.typeBefore != selected || telegram.currentStable(list) != build.stableBefore;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, "tabs without All Chats", failure);
            return update != 0;
        }
    }

    /**
     * Injected first in the tab strip's setIsEditing. Dragging tabs writes the new folder order by
     * place, which is off by one with All Chats gone, so the strip doesn't start editing then.
     *
     * @return whether the strip edits
     */
    public static boolean editing(Object strip, int editing) {
        if (editing == 0 || !Boolean.TRUE.equals(hiddenIn.get(strip))) return editing != 0;
        HookStatus.counted(FamilyNames.HIDE_FOLDER_COUNTERS, "tab drag turned down without All Chats");
        Utils.showToastShort(L10n.t("Turn off Hide All Chats to drag tabs"));
        return false;
    }

    /**
     * Injected first in the chat list's call that shows the Done button for tab editing.
     *
     * @return true to skip it: editing was asked for and turned down
     */
    public static boolean skipsDone(Object list, int show) {
        return show != 0 && hides(list);
    }

    /** Whether the side menu shows its Archived Chats row: a main chat list is built without All Chats, the archive's usual way in. */
    public static boolean archiveShown() {
        return hides(archiveFrom.get());
    }

    /** Whether [list]'s tabs are built without All Chats. */
    public static boolean hides(@Nullable Object list) {
        Build build = list == null ? null : built.get(list);
        return build != null && build.hiding;
    }

    /** Telegram's name for the archive, in its language. */
    public static String archiveTitle() {
        String title = null;
        try {
            title = telegram.archiveTitle();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, "archive title", failure);
        }
        return title == null || title.isEmpty() ? ARCHIVE_FALLBACK : title;
    }

    /** Opens the archive over the chat list built without All Chats, as the archive's own row does. */
    public static boolean openArchive() {
        Object list = archiveFrom.get();
        return list != null && telegram.openArchive(list);
    }

    /** Whether [index] is a folder of [account]'s the chat list can open: not All Chats and not locked. */
    private static boolean opens(int account, int index) {
        return index >= 0 && index < telegram.folderCount(account)
                && !telegram.folderDefault(account, index) && !telegram.folderLocked(account, index);
    }

    /** The first folder [account] can open, or -1. */
    private static int firstOpen(int account) {
        int count = telegram.folderCount(account);
        for (int i = 0; i < count; i++) {
            if (opens(account, i)) return i;
        }
        return -1;
    }

    /**
     * Whether a chat list with [args] is the main one, the one the Chats tab shows. A list that picks
     * where to share or forward, and the archive, aren't.
     */
    static boolean mainList(@Nullable Bundle args) {
        return args != null && args.getBoolean("hasMainTabs", false) && !args.getBoolean("onlySelect", false)
                && args.getInt("dialogsType", 0) == 0 && args.getInt("folderId", 0) == 0;
    }

    /** Where [pick] sits in [account]'s folder list, or -1 when it's not there, renamed or locked. */
    private static int indexOf(int account, @Nullable Folder pick) {
        if (pick == null) return -1;
        int count = telegram.folderCount(account);
        for (int i = 0; i < count; i++) {
            if (telegram.folderDefault(account, i) || !folderAt(account, i).is(pick)) continue;
            return telegram.folderLocked(account, i) ? -1 : i;
        }
        return -1;
    }

    private static Folder folderAt(int account, int index) {
        String name = telegram.folderName(account, index);
        return new Folder(telegram.folderId(account, index), name == null ? "" : name);
    }

    /**
     * The account Telegram shows now, its folders and its pick, or null when Telegram's side can't
     * be read, which the settings page says rather than going down with it.
     */
    @Nullable
    public static Shown shown() {
        try {
            int account = telegram.selectedAccount();
            long user = telegram.userId(account);
            return new Shown(user, folders(account), picked(user));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, "folder list", failure);
            return null;
        }
    }

    /** The folders [account] can open on, in Telegram's order: every one but All chats and the locked ones. */
    static List<Folder> folders(int account) {
        List<Folder> folders = new ArrayList<>();
        int count = telegram.folderCount(account);
        for (int i = 0; i < count; i++) {
            if (telegram.folderDefault(account, i) || telegram.folderLocked(account, i)) continue;
            folders.add(folderAt(account, i));
        }
        return Collections.unmodifiableList(folders);
    }

    /** The folder picked for [user], or null for All chats and for a pick that can't be read. */
    @Nullable
    public static Folder picked(long user) {
        Context context = Utils.getContext();
        if (user == 0 || context == null) return null;
        try {
            SharedPreferences saved = store.apply(context);
            int id = saved.getInt(String.valueOf(user), 0);
            String name = saved.getString(user + NAME, null);
            return id > 0 && name != null ? new Folder(id, name) : null;
        } catch (RuntimeException unreadable) {
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, "folder pick", unreadable);
            return null;
        }
    }

    /**
     * Saves [folder] as [user]'s pick, null for All chats. It's written before this returns, so call
     * it off the main thread.
     *
     * @return whether it was written
     */
    public static boolean pick(long user, @Nullable Folder folder) {
        Context context = Utils.getContext();
        if (user == 0 || context == null) return false;
        SharedPreferences.Editor edit = store.apply(context).edit();
        if (folder != null && folder.id > 0) {
            edit.putInt(String.valueOf(user), folder.id).putString(user + NAME, folder.name);
        } else {
            edit.remove(String.valueOf(user)).remove(user + NAME);
        }
        return edit.commit();
    }

    /** Forgets which chat lists were built, as a restart does. */
    static void resetForTests() {
        built.clear();
        hiddenIn.clear();
        archiveFrom = new WeakReference<>(null);
        kept = null;
    }

    /** What this needs from Telegram. */
    interface Telegram {
        boolean tabsEmpty(Object list);

        @Nullable
        Bundle arguments(Object list);

        int account(Object list);

        boolean select(Object list, int index);

        int selectedAccount();

        long userId(int account);

        int folderCount(int account);

        int folderId(int account, int index);

        @Nullable
        String folderName(int account, int index);

        boolean folderLocked(int account, int index);

        boolean folderDefault(int account, int index);

        default boolean scrollStrip(Object list, int position) { return LaunchFolder.scrollStrip(list, position); }

        // What Hide All Chats adds, the stubs unless a test says otherwise.

        @Nullable
        default Object strip(Object list) { return LaunchFolder.strip(list); }

        default int selectedType(Object list) { return LaunchFolder.selectedType(list); }

        default int selectedId(Object list) { return LaunchFolder.selectedId(list); }

        default int currentStable(Object list) { return LaunchFolder.currentStable(list); }

        default boolean selectByStable(Object list, int stableId) { return LaunchFolder.selectByStable(list, stableId); }

        default int folderStable(int account, int index) { return LaunchFolder.folderStable(account, index); }

        default void addTab(Object strip, int id, int stableId, String title, ArrayList<?> entities,
                            boolean noAnimation, boolean isDefault, boolean locked) {
            LaunchFolder.addTab(strip, id, stableId, title, entities, noAnimation, isDefault, locked);
        }

        default boolean openArchive(Object list) { return LaunchFolder.presentArchive(list); }

        @Nullable
        default String archiveTitle() { return LaunchFolder.telegramArchiveTitle(); }

        /** Whether this build opens the archive without its row: Disable pull to archive's menu entry, or the side menu. */
        default boolean archiveReachable() {
            return PatchFamily.DISABLE_ARCHIVE_PULL.inBuild()
                    || PatchFamily.Capability.SIDE_MENU.installed() && Utils.settingsReady() && Settings.SIDE_MENU.get();
        }
    }

    private static final class Stubs implements Telegram {
        @Override public boolean tabsEmpty(Object list) { return LaunchFolder.tabsEmpty(list); }
        @Override public Bundle arguments(Object list) { return LaunchFolder.arguments(list); }
        @Override public int account(Object list) { return LaunchFolder.account(list); }
        @Override public boolean select(Object list, int index) { return LaunchFolder.select(list, index); }
        @Override public int selectedAccount() { return LaunchFolder.selectedAccount(); }
        @Override public long userId(int account) { return LaunchFolder.userId(account); }
        @Override public int folderCount(int account) { return LaunchFolder.folderCount(account); }
        @Override public int folderId(int account, int index) { return LaunchFolder.folderId(account, index); }
        @Override public String folderName(int account, int index) { return LaunchFolder.folderName(account, index); }
        @Override public boolean folderLocked(int account, int index) { return LaunchFolder.folderLocked(account, index); }
        @Override public boolean folderDefault(int account, int index) { return LaunchFolder.folderDefault(account, index); }
    }

    // Stubs. The patch gives each one Telegram's code; until then they do nothing.

    /** {@code list.filterTabsView}'s tabs are empty, the tabs not built yet. */
    public static boolean tabsEmpty(Object list) { return false; }

    /** {@code list.getArguments()}. */
    @Nullable
    public static Bundle arguments(Object list) { return null; }

    /** {@code list.getCurrentAccount()}. */
    public static int account(Object list) { return 0; }

    /**
     * {@code list.viewPages[0].selectedType} and the tabs' selected id set to [index], so the tab
     * Telegram adds with that id is the selected one. False when the list has no tabs or pages.
     */
    public static boolean select(Object list, int index) { return false; }

    /** {@code UserConfig.selectedAccount}. */
    public static int selectedAccount() { return 0; }

    /** {@code UserConfig.getInstance(account).getClientUserId()}. */
    public static long userId(int account) { return 0; }

    /** {@code MessagesController.getInstance(account).getDialogFilters().size()}. */
    public static int folderCount(int account) { return 0; }

    /** {@code getDialogFilters().get(index).id}. */
    public static int folderId(int account, int index) { return 0; }

    /** {@code getDialogFilters().get(index).name}. */
    @Nullable
    public static String folderName(int account, int index) { return null; }

    /** {@code getDialogFilters().get(index).locked}. */
    public static boolean folderLocked(int account, int index) { return false; }

    /** {@code getDialogFilters().get(index).isDefault()}, All chats. */
    public static boolean folderDefault(int account, int index) { return false; }

    /**
     * {@code list.filterTabsView.listView.scrollToPosition(position)}, false without a strip. It
     * takes effect at the next layout, once the tabs are in.
     */
    public static boolean scrollStrip(Object list, int position) { return false; }

    /** {@code list.filterTabsView}. */
    @Nullable
    public static Object strip(Object list) { return null; }

    /** {@code list.viewPages[0].selectedType}, or -1 without pages. */
    public static int selectedType(Object list) { return -1; }

    /** {@code list.filterTabsView.selectedTabId}, or -1 without tabs. */
    public static int selectedId(Object list) { return -1; }

    /** {@code list.filterTabsView.getCurrentTabStableId()}, or -1 without tabs. */
    public static int currentStable(Object list) { return -1; }

    /** {@code list.filterTabsView.selectTabWithStableId(stableId)}. */
    public static boolean selectByStable(Object list, int stableId) { return false; }

    /** {@code getDialogFilters().get(index).localId}, the tab's stable id. */
    public static int folderStable(int account, int index) { return 0; }

    /** {@code strip.addTab(...)}, Telegram's own call this stands in for. */
    public static void addTab(Object strip, int id, int stableId, String title, ArrayList<?> entities,
                              boolean noAnimation, boolean isDefault, boolean locked) {}

    /** {@code list.presentFragment(new DialogsActivity(args))} with the archive's folder id in args. */
    public static boolean presentArchive(Object list) { return false; }

    /** {@code LocaleController.getString(R.string.ArchivedChats)}. */
    @Nullable
    public static String telegramArchiveTitle() { return null; }
}
