/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.chats;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.AbstractList;
import java.util.Collections;
import java.util.List;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * The two hooks of Clean up Facebook's chat list: with a switch on, the notes tiles go or a
 * promotion banner answers no, and with it off, paused, not ready or failing, Facebook gets what
 * it would have built.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ChatListTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void startClean() {
        FeedFilterCounters.clear();
        HookStatus.clear();
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.HIDE_CHAT_NOTES_TRAY.resetToDefault();
        Settings.HIDE_CHAT_PROMOTIONS.resetToDefault();
        FeedFilterCounters.clear();
        HookStatus.clear();
    }

    private static String counterLine(String route) {
        for (String line : FeedFilterCounters.report()) {
            if (line.startsWith(route + ":")) return line;
        }
        return null;
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.CHAT_LIST + ":")) return line;
        }
        return null;
    }

    @Test
    public void bothSwitchesStartOffAndChatsIsFacebooks() {
        assertFalse(Settings.HIDE_CHAT_NOTES_TRAY.get());
        assertFalse(Settings.HIDE_CHAT_PROMOTIONS.get());
        List<String> tiles = ChatListForTests.tiles();
        assertSame(tiles, ChatList.notesTiles(tiles));
        assertFalse(ChatList.hidesPromotion());
        // Counted with the switches off too, so the report shows Chats asked.
        assertEquals(ChatList.NOTES_ROUTE + ": 1 lists, 3 items, 0 removed", counterLine(ChatList.NOTES_ROUTE));
        assertEquals(ChatList.PROMOTIONS_ROUTE + ": 1 lists, 1 items, 0 removed", counterLine(ChatList.PROMOTIONS_ROUTE));
    }

    @Test
    public void withTheNotesSwitchOnTheTilesGoAndAreCounted() {
        Settings.HIDE_CHAT_NOTES_TRAY.save(true);
        List<String> tiles = ChatListForTests.tiles();
        assertEquals(Collections.emptyList(), ChatList.notesTiles(tiles));
        assertEquals(ChatList.NOTES_ROUTE + ": 1 lists, 3 items, 3 removed. Last reason: " + ChatList.NOTES_HIDDEN
                + ". Removed: " + ChatList.NOTES_HIDDEN + " 3", counterLine(ChatList.NOTES_ROUTE));
        assertEquals(FamilyNames.CHAT_LIST + ": invoked 1, 0 found, 0 missing", statusLine());
        // The other switch is its own: promotions stay while only notes are on.
        assertFalse(ChatList.hidesPromotion());
    }

    @Test
    public void withThePromotionsSwitchOnABannerAnswersNo() {
        Settings.HIDE_CHAT_PROMOTIONS.save(true);
        assertTrue(ChatList.hidesPromotion());
        assertEquals(ChatList.PROMOTIONS_ROUTE + ": 1 lists, 1 items, 1 removed. Last reason: "
                + ChatList.PROMOTIONS_HIDDEN + ". Removed: " + ChatList.PROMOTIONS_HIDDEN + " 1",
                counterLine(ChatList.PROMOTIONS_ROUTE));
        // The notes tiles stay while only promotions are on.
        List<String> tiles = ChatListForTests.tiles();
        assertSame(tiles, ChatList.notesTiles(tiles));
    }

    @Test
    public void anEmptyOrMissingListIsHandedBackAsItIs() {
        Settings.HIDE_CHAT_NOTES_TRAY.save(true);
        assertNull(ChatList.notesTiles(null));
        List<String> none = Collections.emptyList();
        assertSame(none, ChatList.notesTiles(none));
        assertNull("nothing was counted for a list with no tiles", counterLine(ChatList.NOTES_ROUTE));
    }

    @Test
    public void pausedChatsIsFacebooks() {
        Settings.HIDE_CHAT_NOTES_TRAY.save(true);
        Settings.HIDE_CHAT_PROMOTIONS.save(true);
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertFalse(ChatListForTests.dropsTheNotesTiles());
        assertFalse(ChatList.hidesPromotion());
        PauseForTests.pause(HushfacebookPause.Reason.CRASH_LOOP);
        assertFalse(ChatListForTests.dropsTheNotesTiles());
        assertFalse(ChatList.hidesPromotion());
        PauseForTests.resume();
        assertTrue(ChatListForTests.dropsTheNotesTiles());
        assertTrue(ChatList.hidesPromotion());
    }

    /** Until the settings are ready, Facebook builds its own list and no switch is read. */
    @Test
    public void untilTheSettingsAreReadyChatsIsFacebooks() {
        Settings.HIDE_CHAT_NOTES_TRAY.save(true);
        Settings.HIDE_CHAT_PROMOTIONS.save(true);
        boolean[] changed = {true, true};
        SettingsContextRule.withoutContext(() -> {
            changed[0] = ChatListForTests.dropsTheNotesTiles();
            changed[1] = ChatList.hidesPromotion();
        });
        assertFalse(changed[0]);
        assertFalse(changed[1]);
        SettingsContextRule.beforeThePauseIsDecided(() -> {
            changed[0] = ChatListForTests.dropsTheNotesTiles();
            changed[1] = ChatList.hidesPromotion();
        });
        assertFalse(changed[0]);
        assertFalse(changed[1]);
        assertTrue(ChatListForTests.dropsTheNotesTiles());
    }

    /** A list that throws when asked its size is Facebook's own again, and the report names the hook. */
    @Test
    public void aFailureHandsTheListBackAndTheReportSaysSo() {
        Settings.HIDE_CHAT_NOTES_TRAY.save(true);
        List<String> broken = new AbstractList<String>() {
            @Override public String get(int index) {
                return "tile";
            }

            @Override public int size() {
                throw new IllegalStateException("no size");
            }

            @Override public boolean isEmpty() {
                return false;
            }
        };
        assertSame(broken, ChatList.notesTiles(broken));
        List<String> missing = HookStatus.missing(FamilyNames.CHAT_LIST);
        assertEquals(missing.toString(), 1, missing.size());
        assertTrue(missing.get(0), missing.get(0).contains(
                "'notes tray tiles' hook (it threw " + IllegalStateException.class.getName() + ")"));
    }

    @Test
    public void theHookReportsUnderThePatchsName() {
        assertEquals("Clean up Facebook's chat list", FamilyNames.CHAT_LIST);
        ChatList.notesTiles(ChatListForTests.tiles());
        ChatList.hidesPromotion();
        assertEquals(FamilyNames.CHAT_LIST + ": invoked 2, 0 found, 0 missing", statusLine());
    }
}
