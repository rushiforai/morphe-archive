/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowToast;

import android.view.View;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.List;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class HiddenChatsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private HiddenChatsForTests.Fake telegram;

    @Before public void setUp() {
        // The chat list, the archive (folder 1) and a folder of its own, with one tab's list.
        telegram = HiddenChatsForTests.use(new HiddenChatsForTests.Fake().folder(0, 11, 12, 13).folder(1, 14).folder(2, 12));
        HiddenChatsForTests.Filter tab = new HiddenChatsForTests.Filter();
        tab.dialogs.add(new HiddenChatsForTests.Dialog(11));
        tab.dialogs.add(new HiddenChatsForTests.Dialog(12));
        telegram.filters = new Object[]{tab, null};
        telegram.users.put(0, 1000L);
        telegram.users.put(1, 2000L);
        Settings.HIDDEN_CHATS.resetToDefault();
        HookStatus.clear();
    }

    @After public void tearDown() {
        HiddenChatsForTests.restore();
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.HIDDEN_CHATS);
        Settings.HIDDEN_CHATS.resetToDefault();
        HookStatus.clear();
    }

    private String report() {
        return String.join("\n", HookStatus.report());
    }

    private List<String> tab() {
        return Collections.singletonList(String.valueOf(telegram.filterDialogs(telegram.filters[0])));
    }

    private static LinkedHashSet<Long> ids(Long... ids) {
        return new LinkedHashSet<>(Arrays.asList(ids));
    }

    @Test public void offByDefaultEveryChatStays() {
        HiddenChats.hide(1000, ids(12L));
        assertFalse(Settings.HIDDEN_CHATS.get());
        HiddenChats.prune(new Object());
        assertEquals(Arrays.asList("0: [11, 12, 13]", "1: [14]", "2: [12]"), telegram.lists());
        assertTrue(report(), report().contains(FamilyNames.HIDE_FOLDER_COUNTERS + ": invoked 1"));
        assertFalse(report(), report().contains(HiddenChats.LEFT_OUT));
    }

    @Test public void onTheHiddenChatsLeaveEveryFolderAndTab() {
        Settings.HIDDEN_CHATS.save(true);
        HiddenChats.hide(1000, ids(12L, 14L));
        HiddenChats.prune(new Object());
        // The folder that held only a hidden chat is left empty, so Telegram drops it with the other empty ones.
        assertEquals(Arrays.asList("0: [11, 13]", "1: []", "2: []"), telegram.lists());
        assertEquals(Collections.singletonList("[11]"), tab());
        assertTrue(report(), report().contains(HiddenChats.LEFT_OUT));
        // A sort with nothing to leave out counts nothing.
        HookStatus.clear();
        HiddenChats.prune(new Object());
        assertFalse(report(), report().contains(HiddenChats.LEFT_OUT));
    }

    @Test public void eachAccountKeepsItsOwnHiddenChats() {
        Settings.HIDDEN_CHATS.save(true);
        HiddenChats.hide(1000, ids(11L));
        HiddenChats.hide(2000, ids(13L));
        assertEquals(ids(11L), HiddenChats.hidden(1000));
        assertEquals(ids(13L), HiddenChats.hidden(2000));
        // The sort reads the user its own controller belongs to, not the account shown.
        telegram.controllerUser = 2000;
        telegram.selected = 0;
        HiddenChats.prune(new Object());
        assertEquals("0: [11, 12]", telegram.lists().get(0));
        // No one signed in hides nothing and saves nothing.
        telegram.controllerUser = 0;
        assertFalse(HiddenChats.hide(0, ids(11L)));
        assertEquals(Collections.emptySet(), HiddenChats.hidden(0));
        // An empty pick clears the account's list.
        assertTrue(HiddenChats.hide(1000, Collections.emptySet()));
        assertEquals(Collections.emptySet(), HiddenChats.hidden(1000));
        assertEquals(ids(13L), HiddenChats.hidden(2000));
    }

    @Test public void pauseMissingContextAndBrokenReadsLeaveEveryChat() {
        Settings.HIDDEN_CHATS.save(true);
        HiddenChats.hide(1000, ids(12L));
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            HiddenChats.prune(new Object());
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> HiddenChats.prune(new Object()));
        SettingReadsForTests.breakReads(Settings.HIDDEN_CHATS);
        HiddenChats.prune(new Object());
        SettingReadsForTests.mend(Settings.HIDDEN_CHATS);
        assertEquals(Arrays.asList("0: [11, 12, 13]", "1: [14]", "2: [12]"), telegram.lists());
        // Telegram's side changing under the hook leaves the lists as they were and says so.
        HiddenChatsForTests.use(new HiddenChatsForTests.Fake() {
            @Override public long dialogId(Object dialog) { throw new IllegalStateException("Telegram changed"); }
        }.folder(0, 12));
        HiddenChats.prune(new Object());
        assertTrue(report(), report().contains("hidden chats"));
        assertFalse(report(), report().contains(HiddenChats.LEFT_OUT));
    }

    @Test public void theSettingsPageSeesTheChatsArchivedOnesAndHiddenOnesTelegramDropped() {
        telegram.chats(0, 0, 11, 12).chats(0, 1, 14, 12);
        telegram.names.put(11L, "Alice");
        telegram.names.put(12L, "  ");
        telegram.names.put(14L, "Old news");
        HiddenChats.hide(1000, ids(14L, 99L));
        HiddenChats.Shown shown = HiddenChats.shown();
        assertEquals(1000L, shown.user);
        assertEquals(0, shown.account);
        List<String> names = new ArrayList<>();
        for (HiddenChats.Chat chat : shown.chats) names.add(chat.id + "=" + chat.name);
        // Each once, a blank name falls back to the id, and a hidden chat Telegram doesn't list now still shows to untick.
        assertEquals(Arrays.asList("11=Alice", "12=12", "14=Old news", "99=99"), names);
        assertArrayEquals(new boolean[]{false, false, true, true}, shown.ticked());
        // Another account shows its own.
        telegram.selected = 1;
        assertEquals(2000L, HiddenChats.shown().user);
        assertEquals(Collections.emptySet(), HiddenChats.shown().hidden);
        // Telegram's side can't be read: the page hears it, nothing throws.
        telegram.broken = true;
        assertNull(HiddenChats.shown());
        assertTrue(report(), report().contains("chat list for hiding"));
        // The report names the first hook that broke, so the refresh's own failure gets a clean slate.
        HookStatus.clear();
        HiddenChats.refreshShown();
        assertTrue(report(), report().contains("chat list refresh"));
    }

    @Test public void yourOwnChatIsSavedMessagesNotYourName() {
        telegram.chats(0, 0, 1000, 11);
        telegram.names.put(1000L, "M");
        telegram.names.put(11L, "Alice");
        List<String> names = new ArrayList<>();
        for (HiddenChats.Chat chat : HiddenChats.shown().chats) names.add(chat.id + "=" + chat.name);
        assertEquals(Arrays.asList("1000=Saved Messages", "11=Alice"), names);
    }

    @Test public void aHiddenPinnedChatKeepsItsPlaceInThePinOrderTelegramSends() {
        Object controller = new Object();
        // Pins 13 (5), hidden 12 (4), 11 (3), hidden 15 (6) in the archive, then the unpinned 16 and hidden 17.
        ArrayList<Object> list = new ArrayList<>(Arrays.asList(new HiddenChatsForTests.Dialog(13).pin(5),
            new HiddenChatsForTests.Dialog(12).pin(4), new HiddenChatsForTests.Dialog(11).pin(3),
            new HiddenChatsForTests.Dialog(16), new HiddenChatsForTests.Dialog(17)));
        ArrayList<Object> archive = new ArrayList<>(Collections.singletonList(new HiddenChatsForTests.Dialog(15).pin(6)));
        telegram.folders.clear();
        telegram.folders.put(0, list);
        telegram.folders.put(1, archive);
        // Off, the list goes through as it is.
        HiddenChats.hide(1000, ids(12L, 15L, 17L));
        HiddenChats.prune(controller);
        assertTrue(list == HiddenChats.pinOrder(controller, 0, list));
        Settings.HIDDEN_CHATS.save(true);
        HiddenChats.prune(controller);
        assertEquals("[13, 11, 16]", list.toString());
        HookStatus.clear();
        Object order = HiddenChats.pinOrder(controller, 0, list);
        // The hidden pin goes back between the pins it sat between, the unpinned hidden chat stays out, and the list on screen doesn't change.
        assertEquals("[13, 12, 11, 16]", order.toString());
        assertEquals("[13, 11, 16]", list.toString());
        assertTrue(report(), report().contains(HiddenChats.KEPT_PINNED));
        // Each folder gets its own: the archive's hidden pin goes first in the archive's order.
        assertEquals("[15, 18]", HiddenChats.pinOrder(controller, 1, new ArrayList<>(Collections.singletonList(
            new HiddenChatsForTests.Dialog(18).pin(2)))).toString());
        // Another controller, an empty list, and a chat unticked since the sort all leave the list alone.
        assertTrue(list == HiddenChats.pinOrder(new Object(), 0, list));
        ArrayList<Object> empty = new ArrayList<>();
        assertTrue(empty == HiddenChats.pinOrder(controller, 0, empty));
        HiddenChats.hide(1000, ids(15L, 17L));
        assertTrue(list == HiddenChats.pinOrder(controller, 0, list));
        // Switched off after the sort, nothing comes back either.
        HiddenChats.hide(1000, ids(12L));
        Settings.HIDDEN_CHATS.save(false);
        assertTrue(list == HiddenChats.pinOrder(controller, 0, list));
    }

    @Test public void aPinOrderThatCantBeReadGoesOutAsTelegramMadeIt() {
        Settings.HIDDEN_CHATS.save(true);
        HiddenChats.hide(1000, ids(12L));
        Object controller = new Object();
        ArrayList<Object> list = new ArrayList<>(Arrays.asList(new HiddenChatsForTests.Dialog(11).pin(1),
            new HiddenChatsForTests.Dialog(12).pin(2)));
        telegram.folders.clear();
        telegram.folders.put(0, list);
        HiddenChats.prune(controller);
        HiddenChatsForTests.use(new HiddenChatsForTests.Fake() {
            @Override public boolean pinned(Object dialog) { throw new IllegalStateException("Telegram changed"); }
        });
        HookStatus.clear();
        assertTrue(list == HiddenChats.pinOrder(controller, 0, list));
        assertTrue(report(), report().contains("pinned order"));
    }

    @Test public void aSortThatBreaksKeepsOnlyWhatItTookOut() {
        Settings.HIDDEN_CHATS.save(true);
        HiddenChats.hide(1000, ids(12L, 14L));
        Object controller = new Object();
        telegram.folders.clear();
        telegram.folders.put(0, new ArrayList<>(Arrays.asList(new HiddenChatsForTests.Dialog(11).pin(1),
            new HiddenChatsForTests.Dialog(12).pin(2))));
        HiddenChats.prune(controller);
        // The next sort breaks before it reads a folder: the pin the last one took out isn't sent again.
        HiddenChatsForTests.use(new HiddenChatsForTests.Fake() {
            @Override public android.util.SparseArray<?> folders(Object c) { throw new IllegalStateException("Telegram changed"); }
        });
        HiddenChats.prune(controller);
        ArrayList<Object> list = new ArrayList<>(Collections.singletonList(new HiddenChatsForTests.Dialog(11).pin(1)));
        assertTrue(list == HiddenChats.pinOrder(controller, 0, list));
        // One that breaks in the archive still puts back the pin it took out of the chat list.
        HiddenChatsForTests.Fake halfway = new HiddenChatsForTests.Fake() {
            @Override public long dialogId(Object dialog) {
                if (((HiddenChatsForTests.Dialog) dialog).id == 14) throw new IllegalStateException("Telegram changed");
                return super.dialogId(dialog);
            }
        };
        halfway.folders.put(0, new ArrayList<>(Arrays.asList(new HiddenChatsForTests.Dialog(11).pin(1),
            new HiddenChatsForTests.Dialog(12).pin(2))));
        halfway.folders.put(1, new ArrayList<>(Collections.singletonList(new HiddenChatsForTests.Dialog(14).pin(3))));
        HiddenChatsForTests.use(halfway);
        HiddenChats.prune(controller);
        assertEquals("[12, 11]", HiddenChats.pinOrder(controller, 0, list).toString());
        ArrayList<Object> archive = new ArrayList<>(Collections.singletonList(new HiddenChatsForTests.Dialog(15).pin(1)));
        assertTrue(archive == HiddenChats.pinOrder(controller, 1, archive));
    }

    @Test public void aRefreshSortsTheAccountAgain() {
        HiddenChats.refresh(1);
        telegram.selected = 0;
        HiddenChats.refreshShown();
        assertEquals(Arrays.asList(1, 0), telegram.resorted);
    }

    @Test public void theLongPressItemFollowsTheSwitch() {
        Object list = new Object();
        HiddenChats.menuItem(list, new Object());
        assertEquals(Collections.singletonList("48544801 Hide from chat list"), telegram.menu);
        assertEquals(View.GONE, telegram.item.getVisibility());
        Settings.HIDDEN_CHATS.save(true);
        HiddenChats.menuShown(list);
        assertEquals(View.VISIBLE, telegram.item.getVisibility());
        Settings.HIDDEN_CHATS.save(false);
        HiddenChats.menuShown(list);
        assertEquals(View.GONE, telegram.item.getVisibility());
        // Another chat list's check leaves this one's item alone.
        Settings.HIDDEN_CHATS.save(true);
        HiddenChats.menuShown(new Object());
        assertEquals(View.GONE, telegram.item.getVisibility());
        assertFalse(report(), report().contains("threw"));
    }

    @Test public void aTapOnTheItemHidesThePickedChatsAndClosesTheSelection() throws Exception {
        Settings.HIDDEN_CHATS.save(true);
        HiddenChats.hide(1000, ids(13L));
        telegram.picked.addAll(Arrays.asList(11L, 12L));
        assertEquals(HiddenChats.CLOSE_SELECTION, HiddenChats.menuChoice(new Object(), HiddenChats.MENU_ID));
        Utils.awaitBackgroundTasksForTests();
        ShadowLooper.idleMainLooper();
        assertEquals(ids(13L, 11L, 12L), HiddenChats.hidden(1000));
        assertEquals(Collections.singletonList(0), telegram.resorted);
        assertEquals("Hidden from your chat list.", String.valueOf(ShadowToast.getTextOfLatestToast()));
        // The other account's chats are its own.
        assertEquals(Collections.emptySet(), HiddenChats.hidden(2000));
    }

    @Test public void everyOtherIdAndAnEmptyPickGoOnAsTheyCame() throws Exception {
        assertEquals(0x6a, HiddenChats.menuChoice(new Object(), 0x6a));
        assertEquals(-1, HiddenChats.menuChoice(new Object(), -1));
        // Nothing picked: the selection closes and nothing is saved.
        assertEquals(HiddenChats.CLOSE_SELECTION, HiddenChats.menuChoice(new Object(), HiddenChats.MENU_ID));
        Utils.awaitBackgroundTasksForTests();
        ShadowLooper.idleMainLooper();
        assertEquals(Collections.emptySet(), HiddenChats.hidden(1000));
        assertTrue(telegram.resorted.isEmpty());
        assertNull(ShadowToast.getTextOfLatestToast());
    }

    @Test public void aBrokenReadLeavesTheTapToTelegram() {
        telegram.picked.add(11L);
        telegram.broken = true;
        assertEquals(HiddenChats.MENU_ID, HiddenChats.menuChoice(new Object(), HiddenChats.MENU_ID));
        assertTrue(report(), report().contains("hide from chat list"));
        assertEquals(Collections.emptySet(), HiddenChats.hidden(1000));
    }
}
