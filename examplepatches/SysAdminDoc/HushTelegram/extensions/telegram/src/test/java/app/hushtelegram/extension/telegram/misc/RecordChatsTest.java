/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.view.View;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowToast;

import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.Set;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.Settings;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class RecordChatsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final CallPeer ALEX = new CallPeer(CallPeer.PRIVATE, 7, "Alex");
    private static final CallPeer BAND = new CallPeer(CallPeer.GROUP, -9, "Band");

    private HiddenChatsForTests.Fake telegram;

    @Before public void setUp() {
        reset();
        telegram = HiddenChatsForTests.use(new HiddenChatsForTests.Fake());
    }

    @After public void tearDown() {
        HiddenChatsForTests.restore();
        reset();
    }

    private static void reset() {
        Settings.RECORD_CALLS.resetToDefault();
        Settings.RECORD_CALLS_WHICH.resetToDefault();
        RecordChats.save(Collections.emptySet());
        RecordChats.forget();
        HookStatus.clear();
    }

    private static Set<Long> ids(Long... ids) {
        return new LinkedHashSet<>(Arrays.asList(ids));
    }

    private void tap(Long... picked) throws Exception {
        telegram.picked.clear();
        telegram.picked.addAll(Arrays.asList(picked));
        assertEquals(HiddenChats.CLOSE_SELECTION, HiddenChats.menuChoice(new Object(), RecordChats.MENU_ID));
        Utils.awaitBackgroundTasksForTests();
        ShadowLooper.idleMainLooper();
    }

    @Test public void everyCallByDefaultAndAnUnknownScopeReadsTheSame() {
        assertEquals(RecordChats.ALL, RecordChats.scope());
        Settings.RECORD_CALLS_WHICH.save("someday");
        assertEquals(RecordChats.ALL, RecordChats.scope());
        assertTrue(RecordChats.wants(RecordChats.ALL, CallPeer.NONE));
    }

    @Test public void eachScopeTakesItsOwnCalls() {
        assertTrue(RecordChats.wants(RecordChats.PRIVATE, ALEX));
        assertFalse(RecordChats.wants(RecordChats.PRIVATE, BAND));
        assertTrue(RecordChats.wants(RecordChats.GROUPS, BAND));
        assertFalse(RecordChats.wants(RecordChats.GROUPS, ALEX));
        // A call nobody could read is left out of every narrower scope.
        assertFalse(RecordChats.wants(RecordChats.PRIVATE, CallPeer.NONE));
        assertFalse(RecordChats.wants(RecordChats.GROUPS, CallPeer.NONE));
        assertFalse(RecordChats.wants(RecordChats.CHOSEN, CallPeer.NONE));

        assertFalse(RecordChats.wants(RecordChats.CHOSEN, BAND));
        assertTrue(RecordChats.save(ids(-9L)));
        assertTrue(RecordChats.wants(RecordChats.CHOSEN, BAND));
        assertFalse(RecordChats.wants(RecordChats.CHOSEN, ALEX));
        // A stream with no chat to name has no dialog, so no pick can match it.
        assertFalse(RecordChats.wants(RecordChats.CHOSEN, new CallPeer(CallPeer.GROUP, 0, null)));
    }

    @Test public void theLongPressItemShowsOnlyWhileCallsInPickedChatsAreRecorded() {
        Object list = new Object();
        HiddenChats.menuItem(list, new Object());
        View item = telegram.items.get(RecordChats.MENU_ID);
        assertEquals(View.GONE, item.getVisibility());
        Settings.RECORD_CALLS.save(true);
        HiddenChats.menuShown(list);
        assertEquals("every call is recorded, so there's nothing to pick", View.GONE, item.getVisibility());
        Settings.RECORD_CALLS_WHICH.save(RecordChats.CHOSEN);
        HiddenChats.menuShown(list);
        assertEquals(View.VISIBLE, item.getVisibility());
        Settings.RECORD_CALLS.save(false);
        HiddenChats.menuShown(list);
        assertEquals(View.GONE, item.getVisibility());
    }

    @Test public void aTapAddsThePickedChatsAndASecondTapTakesThemOut() throws Exception {
        tap(7L, -9L);
        assertEquals(ids(7L, -9L), RecordChats.chats());
        assertEquals("Calls in these chats are recorded.", String.valueOf(ShadowToast.getTextOfLatestToast()));
        tap(7L, 4L);
        assertEquals(ids(7L, -9L, 4L), RecordChats.chats());
        tap(7L, 4L);
        assertEquals(ids(-9L), RecordChats.chats());
        assertEquals("Calls in these chats aren't recorded anymore.", String.valueOf(ShadowToast.getTextOfLatestToast()));
        // What was written comes back after the cache is gone, as after a restart.
        RecordChats.forget();
        assertEquals(ids(-9L), RecordChats.chats());
    }
}
