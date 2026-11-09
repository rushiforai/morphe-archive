/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.content.SharedPreferences;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.PatchFamilyForTests;
import app.hushtelegram.extension.telegram.settings.Settings;

@RunWith(RobolectricTestRunner.class)
public class AllChatsPlaceTest {
    private static final long ME = 1000L;
    private static final long OTHER = 2000L;

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private AllChatsPlace.Telegram before;
    private final Set<Long> premium = new HashSet<>();
    private long selected = ME;
    private boolean broken;

    /** A controller and a user config are both the user's id, a folder and a request's order what they read as. */
    private final AllChatsPlace.Telegram fake = new AllChatsPlace.Telegram() {
        @Override public Object selectedConfig() { return selected; }
        @Override public Object config(Object controller) { return controller; }
        @Override public boolean premium(Object config) { return premium.contains(config); }
        @Override public long userId(Object config) { return (Long) config; }
        @Override public int folderId(Object filter) {
            if (broken) throw new IllegalStateException("Telegram changed");
            return (Integer) filter;
        }
        @SuppressWarnings("unchecked")
        @Override public List<Integer> order(Object request) {
            if (broken) throw new IllegalStateException("Telegram changed");
            return (List<Integer>) request;
        }
    };

    @Before public void setUp() {
        before = AllChatsPlace.telegram;
        AllChatsPlace.telegram = fake;
        places().edit().clear().commit();
        Settings.MOVE_ALL_CHATS.save(true);
    }

    @After public void tearDown() {
        AllChatsPlace.telegram = before;
        places().edit().clear().commit();
        Settings.MOVE_ALL_CHATS.resetToDefault();
        Settings.HIDE_ALL_CHATS.resetToDefault();
    }

    private static SharedPreferences places() {
        return AllChatsPlace.store.apply(Utils.getContext());
    }

    private static List<Object> folders(Object... ids) {
        return new ArrayList<>(Arrays.asList(ids));
    }

    private static List<Integer> request(Integer... ids) {
        return new ArrayList<>(Arrays.asList(ids));
    }

    /** What a restart does: the server's order, All Chats first, sorted and handed over. */
    private static List<Object> afterRestart(long user) {
        List<Object> list = folders(0, 11, 12);
        AllChatsPlace.loaded(user, list);
        return list;
    }

    @Test public void aDraggedAllChatsStaysAfterARestartAndTheServerNeverSeesIt() {
        assertTrue("the reset after the drag leaves it", AllChatsPlace.keeps(0));

        List<Integer> sent = request(11, 0, 12);
        AllChatsPlace.serverOrder(sent);

        assertEquals("the server still has it first", request(0, 11, 12), sent);
        assertEquals(folders(11, 0, 12), afterRestart(ME));
    }

    @Test public void folderByChatTypeOrdersGoOutAllChatsFirstToo() {
        try {
            PatchFamilyForTests.inBuild(PatchFamily.HIDE_FOLDER_COUNTERS);
            List<Integer> sent = request(11, 0, 12, 21);
            ChatTypeFolders.outgoingOrder(sent);
            assertEquals("the server gets All Chats first", request(0, 11, 12, 21), sent);
            assertEquals("and the place stays on the phone", folders(11, 0, 12), afterRestart(ME));

            PatchFamilyForTests.inBuild();
            List<Integer> without = request(11, 0, 12);
            ChatTypeFolders.outgoingOrder(without);
            assertEquals("without the family the request goes as built", request(11, 0, 12), without);
        } finally {
            PatchFamilyForTests.reset();
        }
    }

    @Test public void offAndEveryPauseAreStockAndThePlaceWaits() {
        AllChatsPlace.serverOrder(request(11, 12, 0));
        assertEquals(folders(11, 12, 0), afterRestart(ME));

        Settings.MOVE_ALL_CHATS.save(false);
        assertFalse("Telegram's reset runs", AllChatsPlace.keeps(0));
        assertTrue("and Telegram's own yes stays a yes", AllChatsPlace.keeps(1));
        assertEquals(folders(0, 11, 12), afterRestart(ME));
        List<Integer> sent = request(11, 0, 12);
        AllChatsPlace.serverOrder(sent);
        assertEquals("nothing touches the request", request(11, 0, 12), sent);

        Settings.MOVE_ALL_CHATS.save(true);
        assertEquals("the place came through unchanged", folders(11, 12, 0), afterRestart(ME));

        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            try {
                assertFalse(reason.name(), AllChatsPlace.keeps(0));
                assertEquals(reason.name(), folders(0, 11, 12), afterRestart(ME));
            } finally {
                PauseForTests.resume();
            }
        }
        assertEquals(folders(11, 12, 0), afterRestart(ME));
    }

    @Test public void hideAllChatsTakesOverWithAllChatsFirst() {
        AllChatsPlace.serverOrder(request(11, 0, 12));
        Settings.HIDE_ALL_CHATS.save(true);
        assertFalse(AllChatsPlace.keeps(0));
        assertEquals(folders(0, 11, 12), afterRestart(ME));
    }

    @Test public void aPremiumAccountsOrderIsItsOwn() {
        premium.add(ME);
        assertTrue(AllChatsPlace.keeps(1));

        List<Integer> sent = request(11, 0, 12);
        AllChatsPlace.serverOrder(sent);
        assertEquals(request(11, 0, 12), sent);
        assertFalse("no place saved", places().contains(String.valueOf(ME)));

        // A place from before it had Premium stays out of the way too.
        places().edit().putInt(String.valueOf(ME), 2).commit();
        List<Object> serverOrder = folders(11, 0, 12);
        AllChatsPlace.loaded(ME, serverOrder);
        assertEquals(folders(11, 0, 12), serverOrder);
    }

    @Test public void withNoSavedPlaceTheServersOrderStands() {
        List<Object> serverOrder = folders(11, 0, 12);
        AllChatsPlace.loaded(ME, serverOrder);
        assertEquals(folders(11, 0, 12), serverOrder);

        Settings.MOVE_ALL_CHATS.save(false);
        AllChatsPlace.loaded(ME, serverOrder);
        assertEquals(folders(11, 0, 12), serverOrder);
    }

    @Test public void eachAccountKeepsItsOwnPlace() {
        AllChatsPlace.serverOrder(request(11, 0, 12));
        selected = OTHER;
        AllChatsPlace.serverOrder(request(11, 12, 0));

        assertEquals(folders(11, 0, 12), afterRestart(ME));
        assertEquals(folders(11, 12, 0), afterRestart(OTHER));
    }

    @Test public void anUnreadableAccountSavesNothing() {
        selected = 0;
        List<Integer> sent = request(11, 0, 12);
        AllChatsPlace.serverOrder(sent);
        assertEquals("the server still gets it first", request(0, 11, 12), sent);
        assertTrue(places().getAll().isEmpty());
    }

    @Test public void aPlacePastTheEndLandsLast() {
        AllChatsPlace.serverOrder(request(11, 12, 13, 14, 0));
        assertEquals(folders(11, 12, 0), afterRestart(ME));
    }

    @Test public void aListWithoutAllChatsOrOnlyOneTabIsLeftAlone() {
        AllChatsPlace.serverOrder(request(11, 0, 12));

        List<Object> none = folders(11, 12);
        AllChatsPlace.loaded(ME, none);
        assertEquals(folders(11, 12), none);

        List<Object> one = folders(0);
        AllChatsPlace.loaded(ME, one);
        assertEquals(folders(0), one);

        AllChatsPlace.loaded(ME, null);
    }

    @Test public void lockingNeverReachesAMovedAllChats() {
        // [11, 12, 0] on screen, reversed by lockFiltersInternal, which locks from the front.
        List<Object> reversed = folders(0, 12, 11);
        AllChatsPlace.lockOrder(reversed);
        assertEquals("the same folders lock as with All Chats first", folders(12, 11, 0), reversed);

        Settings.MOVE_ALL_CHATS.save(false);
        List<Object> off = folders(0, 12, 11);
        AllChatsPlace.lockOrder(off);
        assertEquals("off, Telegram's list goes through as it came", folders(0, 12, 11), off);
        AllChatsPlace.lockOrder(null);
    }

    @Test public void aChangedTelegramLeavesEveryListAsItWas() {
        AllChatsPlace.serverOrder(request(11, 0, 12));
        broken = true;

        List<Integer> sent = request(11, 0, 12);
        AllChatsPlace.serverOrder(sent);
        assertEquals(request(11, 0, 12), sent);

        List<Object> list = folders(0, 11, 12);
        AllChatsPlace.loaded(ME, list);
        assertEquals(folders(0, 11, 12), list);

        List<Object> reversed = folders(0, 12, 11);
        AllChatsPlace.lockOrder(reversed);
        assertEquals(folders(0, 12, 11), reversed);
    }

    @Test public void withoutSettingsTelegramAnswersForItself() {
        SettingsContextRule.withoutContext(() -> {
            assertFalse(AllChatsPlace.keeps(0));
            assertTrue(AllChatsPlace.keeps(1));
            List<Integer> sent = request(11, 0, 12);
            AllChatsPlace.serverOrder(sent);
            assertEquals(request(11, 0, 12), sent);
        });
    }
}
