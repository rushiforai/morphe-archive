/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.os.Bundle;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowToast;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.PatchFamilyForTests;
import app.hushtelegram.extension.telegram.settings.Settings;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class LaunchFolderTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final LaunchFolder.Folder WORK = new LaunchFolder.Folder(3, "Work");
    private static final LaunchFolder.Folder FRIENDS = new LaunchFolder.Folder(7, "Friends");
    private static final LaunchFolder.Folder OLD = new LaunchFolder.Folder(9, "Old");
    private static final LaunchFolder.Folder FAMILY = new LaunchFolder.Folder(5, "Family");

    private final LaunchFolder.Telegram real = LaunchFolder.telegram;
    private Fake telegram;

    /** Telegram as the stubs reach it: one chat list's tabs and arguments, and each account's folders. */
    private static final class Fake implements LaunchFolder.Telegram {
        Bundle args = main();
        final Set<Object> built = new HashSet<>();
        int listAccount = 0;
        int selected = 0;
        final Map<Integer, Long> users = new HashMap<>();
        /** Each account's folders as Telegram lists them: id, name, locked, default. */
        final Map<Integer, List<Object[]>> folders = new HashMap<>();
        /** Each pick, as "account/index". */
        final List<String> picks = new ArrayList<>();
        boolean pages = true;
        boolean broken;

        Fake folder(int account, int id, String name, boolean locked) {
            folders.computeIfAbsent(account, a -> new ArrayList<>()).add(new Object[]{id, name, locked, id == 0});
            return this;
        }

        private Object[] at(int account, int index) {
            if (broken) throw new IllegalStateException("Telegram changed");
            return folders.get(account).get(index);
        }

        @Override public boolean tabsEmpty(Object list) { return !built.contains(list); }
        @Override public Bundle arguments(Object list) { return args; }
        @Override public int account(Object list) { return listAccount; }

        @Override public boolean select(Object list, int index) {
            if (!pages) return false;
            picks.add(listAccount + "/" + index);
            type = index;
            tab = index;
            stable = folderStable(listAccount, index);
            return true;
        }

        /** The page's folder and the selected tab, both by place in the folder list, as Telegram keeps them. */
        int type = 0;
        int tab = 0;
        /** The selected tab's stable id, which stays the old folder's until the tabs are rebuilt. */
        int stable = 100;
        final Object strip = new Object();
        /** Each tab added through Telegram's own call, by title. */
        final List<String> tabs = new ArrayList<>();
        final List<Object> archives = new ArrayList<>();
        String archiveTitle = "Archivierte Chats";
        /** Whether the build has the menu entry or the side menu to open the archive with. */
        boolean archive = true;
        boolean noStrip;

        @Override public Object strip(Object list) { return noStrip ? null : strip; }
        @Override public boolean archiveReachable() { return archive; }
        @Override public int selectedType(Object list) { return type; }
        @Override public int selectedId(Object list) { return tab; }
        @Override public int currentStable(Object list) { return stable; }

        @Override public boolean selectByStable(Object list, int stableId) {
            for (int i = 0; i < folderCount(listAccount); i++) {
                if (folderStable(listAccount, i) == stableId) {
                    tab = i;
                    stable = stableId;
                    return true;
                }
            }
            return false;
        }

        /** Telegram's local ids, numbered apart from the server ids so a mix-up shows. */
        @Override public int folderStable(int account, int index) { return 100 + folderId(account, index); }

        @Override public void addTab(Object strip, int id, int stableId, String title, ArrayList<?> entities,
                                     boolean noAnimation, boolean isDefault, boolean locked) {
            tabs.add(title);
        }

        @Override public boolean openArchive(Object list) { return archives.add(list); }
        @Override public String archiveTitle() { return archiveTitle; }

        @Override public int selectedAccount() { return selected; }
        @Override public long userId(int account) { return users.getOrDefault(account, 0L); }
        @Override public int folderCount(int account) { return folders.getOrDefault(account, new ArrayList<>()).size(); }
        @Override public int folderId(int account, int index) { return (Integer) at(account, index)[0]; }
        @Override public String folderName(int account, int index) { return (String) at(account, index)[1]; }
        @Override public boolean folderLocked(int account, int index) { return (Boolean) at(account, index)[2]; }
        @Override public boolean folderDefault(int account, int index) { return (Boolean) at(account, index)[3]; }
    }

    /** The arguments MainTabsActivity gives its chat list. */
    private static Bundle main() {
        Bundle args = new Bundle();
        args.putBoolean("hasMainTabs", true);
        return args;
    }

    private static Context context() {
        return Utils.getContext();
    }

    @Before public void setUp() {
        telegram = new Fake();
        telegram.users.put(0, 1000L);
        telegram.users.put(1, 2000L);
        telegram.folder(0, 0, "All Chats", false).folder(0, 3, "Work", false).folder(0, 7, "Friends", false)
                .folder(0, 9, "Old", true);
        telegram.folder(1, 0, "All Chats", false).folder(1, 5, "Family", false);
        LaunchFolder.telegram = telegram;
        LaunchFolder.resetForTests();
        LaunchFolder.store.apply(context()).edit().clear().commit();
        Settings.LAUNCH_FOLDER.resetToDefault();
        Settings.HIDE_ALL_CHATS.resetToDefault();
        ShadowToast.reset();
        HookStatus.clear();
    }

    @After public void tearDown() {
        LaunchFolder.telegram = real;
        LaunchFolder.resetForTests();
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.LAUNCH_FOLDER);
        SettingReadsForTests.mend(Settings.HIDE_ALL_CHATS);
        Settings.LAUNCH_FOLDER.resetToDefault();
        Settings.HIDE_ALL_CHATS.resetToDefault();
        ShadowToast.reset();
        LaunchFolder.store.apply(context()).edit().clear().commit();
        HookStatus.clear();
    }

    /** Telegram's first tab build for [list], which then has its tabs. */
    private void build(Object list) {
        LaunchFolder.firstTabs(list);
        telegram.built.add(list);
    }

    /** One whole tab build of [list]: the question, All Chats' tab, then the answer once every tab is in. */
    private boolean buildTabs(Object list, int update) {
        LaunchFolder.firstTabs(list);
        LaunchFolder.allChatsTab(telegram.strip, 0, 100, "All Chats", new ArrayList<>(), 1, 1, 0);
        telegram.built.add(list);
        return LaunchFolder.tabsAdded(list, update);
    }

    private String report() {
        return String.join("\n", HookStatus.report());
    }

    @Test public void hideAllChatsOffByDefaultKeepsTheTab() {
        assertFalse(Settings.HIDE_ALL_CHATS.get());
        assertTrue(Settings.HIDE_ALL_CHATS.rebootApp);
        Object list = new Object();
        assertTrue(buildTabs(list, 1));
        assertFalse("Telegram's own answer stands", buildTabs(list, 0));
        assertEquals(Arrays.asList("All Chats", "All Chats"), telegram.tabs);
        assertEquals(new ArrayList<String>(), telegram.picks);
        assertFalse(LaunchFolder.hides(list));
        assertFalse(LaunchFolder.archiveShown());
        assertFalse(LaunchFolder.openArchive());
        assertTrue(LaunchFolder.editing(telegram.strip, 1));
        assertFalse(LaunchFolder.skipsDone(list, 1));
        assertFalse(report(), report().contains(LaunchFolder.HIDDEN));
    }

    @Test public void hideAllChatsOpensOnTheFirstFolderItCanOpen() {
        Settings.HIDE_ALL_CHATS.save(true);
        Object list = new Object();
        assertTrue("a first build shows its page", buildTabs(list, 0));
        assertEquals(new ArrayList<String>(), telegram.tabs);
        assertEquals("0/1", telegram.picks.get(0));
        assertEquals(1, telegram.type);
        assertEquals(1, telegram.tab);
        assertTrue(LaunchFolder.hides(list));
        assertTrue(LaunchFolder.archiveShown());
        assertTrue(report(), report().contains(LaunchFolder.HIDDEN + " 1"));
        // Its later builds aren't counted again.
        buildTabs(list, 0);
        assertTrue(report(), report().contains(LaunchFolder.HIDDEN + " 1"));
    }

    @Test public void thePickWinsOverTheFirstFolderAndALockedPickDoesnt() {
        Settings.HIDE_ALL_CHATS.save(true);
        Settings.LAUNCH_FOLDER.save(true);
        LaunchFolder.pick(1000, FRIENDS);
        buildTabs(new Object(), 0);
        assertEquals("0/2", telegram.picks.get(0));
        assertEquals(2, telegram.type);
        assertTrue(report(), report().contains(LaunchFolder.OPENED + " 1"));
        LaunchFolder.pick(1000, OLD);
        telegram.picks.clear();
        buildTabs(new Object(), 0);
        assertEquals("0/1", telegram.picks.get(0));
        assertEquals(1, telegram.type);
    }

    @Test public void aRebuildKeepsThePageAndTheTabTogether() {
        Settings.HIDE_ALL_CHATS.save(true);
        Object list = new Object();
        buildTabs(list, 0);
        // Nothing moved: Telegram's yes, which compares by place, doesn't scroll the list to the top.
        assertFalse(buildTabs(list, 1));
        assertEquals(1, telegram.type);
        // Work deleted: the selected place now holds Friends, so the page follows it.
        telegram.folders.get(0).remove(1);
        assertTrue(buildTabs(list, 0));
        assertEquals(1, telegram.type);
        assertEquals(1, telegram.tab);
        // A selected place that's gone, or locked, lands on the first folder the account can open.
        telegram.tab = 2;
        telegram.type = 2;
        assertTrue(buildTabs(list, 0));
        assertEquals(1, telegram.tab);
        assertEquals(1, telegram.type);
        telegram.folders.get(0).remove(1);
        telegram.folder(0, 4, "News", false);
        telegram.tab = 1;
        assertTrue(buildTabs(list, 0));
        assertEquals("Old is locked, so News", 2, telegram.tab);
        assertEquals(2, telegram.type);
        assertEquals(new ArrayList<String>(), telegram.tabs);
    }

    @Test public void anAccountWithNoFolderToOpenKeepsAllChatsUntilItHasOne() {
        Settings.HIDE_ALL_CHATS.save(true);
        telegram.folder(2, 0, "All Chats", false).folder(2, 4, "Locked", true);
        telegram.listAccount = 2;
        Object list = new Object();
        assertTrue(buildTabs(list, 1));
        assertEquals(Arrays.asList("All Chats"), telegram.tabs);
        assertEquals(new ArrayList<String>(), telegram.picks);
        assertFalse(LaunchFolder.hides(list));
        assertFalse(LaunchFolder.archiveShown());
        assertTrue(LaunchFolder.editing(telegram.strip, 1));
        // A folder made later hides it at the next build, since the list read the switch at its first.
        telegram.folder(2, 6, "New", false);
        assertTrue(buildTabs(list, 0));
        assertEquals(Arrays.asList("All Chats"), telegram.tabs);
        assertEquals(2, telegram.type);
        assertTrue(LaunchFolder.hides(list));
    }

    @Test public void noWayToTheArchiveOrNoTabStripKeepsAllChats() {
        Settings.HIDE_ALL_CHATS.save(true);
        telegram.archive = false;
        Object list = new Object();
        assertTrue(buildTabs(list, 1));
        assertFalse(LaunchFolder.hides(list));
        telegram.archive = true;
        telegram.noStrip = true;
        Object stripless = new Object();
        assertTrue(buildTabs(stripless, 1));
        assertFalse(LaunchFolder.hides(stripless));
        assertEquals(Arrays.asList("All Chats", "All Chats"), telegram.tabs);
        assertEquals(new ArrayList<String>(), telegram.picks);
        assertFalse(LaunchFolder.archiveShown());
        assertFalse(report(), report().contains(LaunchFolder.HIDDEN));
    }

    @Test public void theArchiveIsReachableThroughTheMenuEntryOrTheSideMenu() {
        try {
            PatchFamilyForTests.inBuild();
            assertFalse(real.archiveReachable());
            PatchFamilyForTests.inBuild(PatchFamily.DISABLE_ARCHIVE_PULL);
            assertTrue("its menu entry", real.archiveReachable());
            PatchFamilyForTests.inBuild(PatchFamily.HIDE_CONTACTS_TAB);
            Settings.SIDE_MENU.save(false);
            assertFalse("side menu off", real.archiveReachable());
            Settings.SIDE_MENU.save(true);
            assertTrue("side menu on", real.archiveReachable());
            PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
            assertFalse("paused, the side menu is stock", real.archiveReachable());
        } finally {
            PauseForTests.resume();
            PatchFamilyForTests.reset();
            Settings.SIDE_MENU.resetToDefault();
        }
    }

    @Test public void aReadThatThrowsKeepsAllChatsAndTakesTheArchiveOutOfTheSideMenu() {
        Settings.HIDE_ALL_CHATS.save(true);
        buildTabs(new Object(), 0);
        assertTrue(LaunchFolder.archiveShown());
        telegram.broken = true;
        Object list = new Object();
        assertTrue(buildTabs(list, 1));
        assertFalse(LaunchFolder.hides(list));
        assertFalse(LaunchFolder.archiveShown());
        assertEquals(Arrays.asList("All Chats"), telegram.tabs);
        assertTrue(report(), report().contains("folder at launch"));
    }

    @Test public void aListBuiltWithAllChatsTakesTheArchiveOutOfTheSideMenu() {
        Settings.HIDE_ALL_CHATS.save(true);
        buildTabs(new Object(), 0);
        assertTrue(LaunchFolder.archiveShown());
        // Another account, with no folder to open, signed in and its list built.
        telegram.folder(2, 0, "All Chats", false);
        telegram.listAccount = 2;
        buildTabs(new Object(), 1);
        assertFalse(LaunchFolder.archiveShown());
        assertFalse(LaunchFolder.openArchive());
    }

    @Test public void aViewBuiltAgainOpensOnThePickNotTheFirstFolder() {
        Settings.HIDE_ALL_CHATS.save(true);
        Settings.LAUNCH_FOLDER.save(true);
        LaunchFolder.pick(1000, FRIENDS);
        Object list = new Object();
        buildTabs(list, 0);
        telegram.built.remove(list);
        telegram.type = 0;
        telegram.tab = 0;
        int before = telegram.picks.size();
        assertTrue(buildTabs(list, 0));
        assertEquals("0/2", telegram.picks.get(before));
        assertEquals(2, telegram.type);
        assertEquals(2, telegram.tab);
    }

    @Test public void tabDraggingIsTurnedDownWithAToastAndNoDoneButton() {
        Settings.HIDE_ALL_CHATS.save(true);
        Object list = new Object();
        buildTabs(list, 0);
        assertFalse(LaunchFolder.editing(telegram.strip, 1));
        ShadowLooper.idleMainLooper();
        assertEquals("Turn off Hide All Chats to drag tabs", ShadowToast.getTextOfLatestToast());
        assertTrue(report(), report().contains("tab drag turned down without All Chats 1"));
        assertFalse("ending an edit goes through", LaunchFolder.editing(telegram.strip, 0));
        assertTrue("another strip edits", LaunchFolder.editing(new Object(), 1));
        assertTrue(LaunchFolder.skipsDone(list, 1));
        assertFalse(LaunchFolder.skipsDone(list, 0));
        assertFalse(LaunchFolder.skipsDone(new Object(), 1));
    }

    @Test public void pauseOtherListsAndUnreadableSwitchesKeepAllChats() {
        Settings.HIDE_ALL_CHATS.save(true);
        int builds = 0;
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertTrue(reason.name(), buildTabs(new Object(), 1));
            PauseForTests.resume();
            builds++;
        }
        SettingsContextRule.withoutContext(() -> buildTabs(new Object(), 1));
        SettingReadsForTests.breakReads(Settings.HIDE_ALL_CHATS);
        buildTabs(new Object(), 1);
        SettingReadsForTests.mend(Settings.HIDE_ALL_CHATS);
        Bundle share = main();
        share.putBoolean("onlySelect", true);
        Bundle archive = main();
        archive.putInt("folderId", 1);
        for (Bundle args : Arrays.asList(share, archive)) {
            telegram.args = args;
            buildTabs(new Object(), 1);
        }
        assertEquals(builds + 4, telegram.tabs.size());
        assertEquals(new ArrayList<String>(), telegram.picks);
        assertFalse(LaunchFolder.archiveShown());
        assertFalse(report(), report().contains(LaunchFolder.HIDDEN));
    }

    @Test public void eachListKeepsTheSwitchItsFirstBuildRead() {
        Object before = new Object();
        buildTabs(before, 0);
        Settings.HIDE_ALL_CHATS.save(true);
        buildTabs(before, 0);
        assertEquals(2, telegram.tabs.size());
        assertFalse(LaunchFolder.hides(before));
        Object after = new Object();
        buildTabs(after, 0);
        Settings.HIDE_ALL_CHATS.save(false);
        buildTabs(after, 0);
        assertEquals("until Telegram restarts", 2, telegram.tabs.size());
        assertTrue(LaunchFolder.hides(after));
    }

    @Test public void theArchiveOpensFromTheListBuiltWithoutAllChats() {
        Settings.HIDE_ALL_CHATS.save(true);
        assertFalse(LaunchFolder.openArchive());
        assertEquals("Archivierte Chats", LaunchFolder.archiveTitle());
        telegram.archiveTitle = null;
        assertEquals(LaunchFolder.ARCHIVE_FALLBACK, LaunchFolder.archiveTitle());
        telegram.archiveTitle = "";
        assertEquals(LaunchFolder.ARCHIVE_FALLBACK, LaunchFolder.archiveTitle());
        Object list = new Object();
        buildTabs(list, 0);
        // A list that picks where to share doesn't take its place.
        Bundle share = main();
        share.putBoolean("onlySelect", true);
        telegram.args = share;
        buildTabs(new Object(), 0);
        assertTrue(LaunchFolder.openArchive());
        assertEquals(Arrays.asList(list), telegram.archives);
    }

    @Test public void tabsThatCantBeReadKeepTelegramsAnswer() {
        Settings.HIDE_ALL_CHATS.save(true);
        Object list = new Object();
        buildTabs(list, 0);
        telegram.broken = true;
        assertTrue(LaunchFolder.tabsAdded(list, 1));
        assertFalse(LaunchFolder.tabsAdded(list, 0));
        assertTrue(report(), report().contains("tabs without All Chats"));
    }

    @Test public void offByDefaultTheListOpensOnAllChats() {
        LaunchFolder.pick(1000, FRIENDS);
        assertFalse(Settings.LAUNCH_FOLDER.get());
        build(new Object());
        assertEquals(new ArrayList<String>(), telegram.picks);
        assertTrue(report(), report().contains(FamilyNames.HIDE_FOLDER_COUNTERS + ": invoked 1"));
        assertFalse(report(), report().contains(LaunchFolder.OPENED));
    }

    @Test public void onTheListOpensOnThePickedFolderOnce() {
        Settings.LAUNCH_FOLDER.save(true);
        LaunchFolder.pick(1000, FRIENDS);
        Object list = new Object();
        build(list);
        // Its index in Telegram's list, All Chats included, which is what the tabs number by.
        assertEquals(Arrays.asList("0/2"), telegram.picks);
        // Asked again for the same list with its tabs empty, as when its view is built again, it isn't picked a second time.
        telegram.built.remove(list);
        build(list);
        assertEquals(Arrays.asList("0/2"), telegram.picks);
        // A new chat list, after a restart say, opens on it again.
        build(new Object());
        assertEquals(Arrays.asList("0/2", "0/2"), telegram.picks);
        assertTrue(report(), report().contains(LaunchFolder.OPENED + " 2"));
    }

    @Test public void aListAlreadyBuiltWhenTheSwitchWentOnStaysWhereItIs() {
        Object list = new Object();
        build(list);
        Settings.LAUNCH_FOLDER.save(true);
        LaunchFolder.pick(1000, FRIENDS);
        telegram.built.remove(list);
        build(list);
        assertEquals(new ArrayList<String>(), telegram.picks);
    }

    @Test public void onlyTheMainChatListTakesIt() {
        Settings.LAUNCH_FOLDER.save(true);
        LaunchFolder.pick(1000, WORK);
        Bundle share = main();
        share.putBoolean("onlySelect", true);
        Bundle type = main();
        type.putInt("dialogsType", 3);
        Bundle archive = main();
        archive.putInt("folderId", 1);
        Bundle tabless = new Bundle();
        for (Bundle args : Arrays.asList(share, type, archive, tabless, null)) {
            telegram.args = args;
            build(new Object());
        }
        assertEquals(new ArrayList<String>(), telegram.picks);
        telegram.args = main();
        build(new Object());
        assertEquals(Arrays.asList("0/1"), telegram.picks);
    }

    @Test public void eachAccountKeepsItsOwnPick() {
        Settings.LAUNCH_FOLDER.save(true);
        LaunchFolder.pick(1000, FRIENDS);
        telegram.listAccount = 1;
        build(new Object());
        assertEquals("the second account has no pick", new ArrayList<String>(), telegram.picks);
        LaunchFolder.pick(2000, FAMILY);
        build(new Object());
        telegram.listAccount = 0;
        build(new Object());
        assertEquals(Arrays.asList("1/1", "0/2"), telegram.picks);
        // Someone else signed in to the first slot doesn't get the last one's pick.
        telegram.users.put(0, 3000L);
        build(new Object());
        assertEquals(2, telegram.picks.size());
    }

    @Test public void aLockedOrMissingFolderOpensAllChats() {
        Settings.LAUNCH_FOLDER.save(true);
        LaunchFolder.pick(1000, OLD);
        build(new Object());
        LaunchFolder.pick(1000, new LaunchFolder.Folder(42, "Gone"));
        build(new Object());
        assertEquals(new ArrayList<String>(), telegram.picks);
        // A list with no pages takes nothing and isn't counted.
        LaunchFolder.pick(1000, WORK);
        telegram.pages = false;
        build(new Object());
        assertFalse(report(), report().contains(LaunchFolder.OPENED));
    }

    /** Telegram gives a deleted folder's id to the next one made, so a pick needs its name too. */
    @Test public void aNewFolderThatTookThePickedOnesIdOpensAllChats() {
        Settings.LAUNCH_FOLDER.save(true);
        LaunchFolder.pick(1000, FRIENDS);
        telegram.folders.get(0).set(2, new Object[]{7, "Gym", false, false});
        build(new Object());
        assertEquals(new ArrayList<String>(), telegram.picks);
        // The same folder under its picked name opens again.
        telegram.folders.get(0).set(2, new Object[]{7, "Friends", false, false});
        build(new Object());
        assertEquals(Arrays.asList("0/2"), telegram.picks);
    }

    @Test public void pauseMissingContextAndBrokenReadsOpenAllChats() {
        Settings.LAUNCH_FOLDER.save(true);
        LaunchFolder.pick(1000, FRIENDS);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            build(new Object());
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> build(new Object()));
        SettingReadsForTests.breakReads(Settings.LAUNCH_FOLDER);
        build(new Object());
        SettingReadsForTests.mend(Settings.LAUNCH_FOLDER);
        telegram.broken = true;
        build(new Object());
        assertEquals(new ArrayList<String>(), telegram.picks);
        assertTrue(report(), report().contains("folder at launch"));
        assertFalse(report(), report().contains(LaunchFolder.OPENED));
    }

    @Test public void theFolderListLeavesOutAllChatsAndLockedOnes() {
        List<LaunchFolder.Folder> folders = LaunchFolder.folders(0);
        assertEquals(2, folders.size());
        assertEquals(3, folders.get(0).id);
        assertEquals("Work", folders.get(0).name);
        assertEquals(7, folders.get(1).id);
        telegram.folder(1, 6, null, false);
        assertEquals("", LaunchFolder.folders(1).get(1).name);
        assertEquals(0, LaunchFolder.folders(2).size());
        // The settings page reads the account shown now, its folders and its pick in one go.
        telegram.selected = 1;
        LaunchFolder.pick(2000, FAMILY);
        LaunchFolder.Shown shown = LaunchFolder.shown();
        assertEquals(2000L, shown.user);
        assertEquals(2, shown.folders.size());
        assertEquals("Family is first after All Chats", 1, shown.choice());
        assertEquals(2, shown.choiceOf(new LaunchFolder.Folder(6, "")));
        assertEquals("a renamed pick isn't there", 0, shown.choiceOf(new LaunchFolder.Folder(5, "Kids")));
        assertEquals(0, shown.choiceOf(null));
    }

    @Test public void aFolderListThatCantBeReadIsNoneAndSaysWhy() {
        telegram.broken = true;
        assertNull(LaunchFolder.shown());
        assertTrue(report(), report().contains("folder list"));
    }

    @Test public void picksAreSavedByUserAndAllChatsClearsOne() {
        assertNull(LaunchFolder.picked(1000));
        assertTrue(LaunchFolder.pick(1000, FRIENDS));
        assertTrue(LaunchFolder.pick(2000, FAMILY));
        assertTrue(FRIENDS.is(LaunchFolder.picked(1000)));
        assertTrue(FAMILY.is(LaunchFolder.picked(2000)));
        assertTrue(LaunchFolder.pick(1000, null));
        assertNull(LaunchFolder.picked(1000));
        assertFalse(LaunchFolder.store.apply(context()).contains("1000"));
        assertFalse(LaunchFolder.store.apply(context()).contains("1000.name"));
        // An id saved without its name, or a value of the wrong kind, is no pick.
        LaunchFolder.store.apply(context()).edit().putInt("3000", 7).putInt("4000.name", 1).putInt("4000", 7).commit();
        assertNull(LaunchFolder.picked(3000));
        assertNull(LaunchFolder.picked(4000));
        assertTrue(report(), report().contains("folder pick"));
        // No one signed in, or no context yet: nothing is saved or read.
        assertFalse(LaunchFolder.pick(0, FRIENDS));
        assertNull(LaunchFolder.picked(0));
        SettingsContextRule.withoutContext(() -> {
            assertFalse(LaunchFolder.pick(2000, WORK));
            assertNull(LaunchFolder.picked(2000));
        });
        assertTrue(FAMILY.is(LaunchFolder.picked(2000)));
    }
}
