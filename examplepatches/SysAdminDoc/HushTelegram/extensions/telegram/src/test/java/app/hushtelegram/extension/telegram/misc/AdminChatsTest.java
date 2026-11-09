/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.PatchFamilyForTests;
import app.hushtelegram.extension.telegram.settings.Settings;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class AdminChatsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private HiddenChatsForTests.Fake telegram;
    private final Set<Long> managed = new HashSet<>();

    @Before public void setUp() {
        // A person (5), two groups you manage (-10, -12) and one you don't (-11), and the archive's row (-99).
        telegram = HiddenChatsForTests.use(new HiddenChatsForTests.Fake());
        ArrayList<Object> list = new ArrayList<>();
        for (long id : new long[]{5, -10, -11, -12, -99}) list.add(new HiddenChatsForTests.Dialog(id));
        telegram.folders.put(0, list);
        telegram.users.put(0, 1000L);
        managed.clear();
        managed.add(10L);
        managed.add(12L);
        AdminChats.telegram = (controller, chatId) -> managed.contains(chatId);
        PatchFamilyForTests.inBuild(PatchFamily.HIDE_FOLDER_COUNTERS);
        PatchFamilyForTests.installed(PatchFamily.Capability.ADMIN_CHATS);
        Settings.ADMIN_CHATS.resetToDefault();
        HookStatus.clear();
        AdminChats.forget();
    }

    @After public void tearDown() {
        HiddenChatsForTests.restore();
        AdminChats.telegram = (controller, chatId) -> AdminChats.isAdmin(controller, chatId);
        PatchFamilyForTests.reset();
        PatchFamilyForTests.resetCapabilities();
        Settings.ADMIN_CHATS.resetToDefault();
        resetFilter();
        HookStatus.clear();
    }

    private static void resetFilter() {
        AdminChats.forget();
    }

    private String list() {
        return String.valueOf(telegram.folders.get(0));
    }

    @Test public void offByDefaultTheRowIsNotThere() {
        assertFalse(AdminChats.available());
        assertEquals("Administrators", AdminChats.rowLabel());
        HiddenChats.prune(new Object());
        assertEquals("[5, -10, -11, -12, -99]", list());
    }

    @Test public void aTapShowsOnlyTheGroupsAndChannelsYouManage() {
        Settings.ADMIN_CHATS.save(true);
        assertTrue(AdminChats.available());
        HiddenChats.prune(new Object());
        assertEquals("with the filter off every chat stays", "[5, -10, -11, -12, -99]", list());

        AdminChats.toggle();
        assertTrue(AdminChats.showing());
        assertEquals("Show all chats", AdminChats.rowLabel());
        // Stock rebuilds the list on a sort, so rebuild it the way Telegram would.
        ArrayList<Object> list = new ArrayList<>();
        for (long id : new long[]{5, -10, -11, -12, -99}) list.add(new HiddenChatsForTests.Dialog(id));
        telegram.folders.put(0, list);
        HiddenChats.prune(new Object());
        assertEquals("[-10, -12]", list());
        assertTrue(String.join("\n", HookStatus.report()).contains(AdminChats.FILTERED));

        AdminChats.toggle();
        assertFalse(AdminChats.showing());
        assertEquals("Administrators", AdminChats.rowLabel());
    }

    @Test public void theFolderTabsListsFollowToo() {
        Settings.ADMIN_CHATS.save(true);
        AdminChats.toggle();
        HiddenChatsForTests.Filter tab = new HiddenChatsForTests.Filter();
        for (long id : new long[]{-10, -11, 5}) tab.dialogs.add(new HiddenChatsForTests.Dialog(id));
        telegram.filters = new Object[]{tab, null};
        HiddenChats.prune(new Object());
        assertEquals("[-10]", String.valueOf(tab.dialogs));
    }

    @Test public void turningTheSwitchOffEndsTheFilter() {
        Settings.ADMIN_CHATS.save(true);
        AdminChats.toggle();
        Settings.ADMIN_CHATS.save(false);
        assertFalse(AdminChats.showing());
        HiddenChats.prune(new Object());
        assertEquals("[5, -10, -11, -12, -99]", list());
    }

    @Test public void aPersonOrAnUnknownChatIsNeverAnAdminChat() {
        assertFalse(AdminChats.manages(new Object(), 10));
        assertFalse(AdminChats.manages(new Object(), -11));
        assertTrue(AdminChats.manages(new Object(), -10));
    }

    @Test public void aTelegramThatThrowsLeavesTheListAlone() {
        Settings.ADMIN_CHATS.save(true);
        AdminChats.toggle();
        AdminChats.telegram = (controller, chatId) -> { throw new IllegalStateException("changed"); };
        HiddenChats.prune(new Object());
        assertTrue(String.join("\n", HookStatus.report()).contains("administrator chats"));
    }
}
