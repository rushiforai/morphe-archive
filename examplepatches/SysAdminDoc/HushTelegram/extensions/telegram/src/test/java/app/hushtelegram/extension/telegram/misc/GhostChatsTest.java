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
public class GhostChatsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

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
        Settings.GHOST_MODE.resetToDefault();
        Settings.GHOST_CHATS.resetToDefault();
        GhostChats.save(Collections.emptySet());
        GhostChats.forget();
        HookStatus.clear();
    }

    private static Set<Long> ids(Long... ids) {
        return new LinkedHashSet<>(Arrays.asList(ids));
    }

    private void tap(Long... picked) throws Exception {
        telegram.picked.clear();
        telegram.picked.addAll(Arrays.asList(picked));
        assertEquals(HiddenChats.CLOSE_SELECTION, HiddenChats.menuChoice(new Object(), GhostChats.MENU_ID));
        Utils.awaitBackgroundTasksForTests();
        ShadowLooper.idleMainLooper();
    }

    @Test public void theLongPressItemShowsWithItsSwitch() {
        Object list = new Object();
        HiddenChats.menuItem(list, new Object());
        View item = telegram.items.get(GhostChats.MENU_ID);
        assertEquals(View.GONE, item.getVisibility());
        Settings.GHOST_CHATS.save(true);
        HiddenChats.menuShown(list);
        assertEquals(View.VISIBLE, item.getVisibility());
        // It follows its own switch, not Hide picked chats'.
        assertEquals(View.GONE, telegram.items.get(HiddenChats.MENU_ID).getVisibility());
        Settings.GHOST_CHATS.save(false);
        HiddenChats.menuShown(list);
        assertEquals(View.GONE, item.getVisibility());
    }

    @Test public void aTapAddsThePickedChatsAndASecondTapTakesThemOut() throws Exception {
        Settings.GHOST_CHATS.save(true);
        Settings.GHOST_MODE.save(true);
        tap(7L, -9L);
        assertEquals(ids(7L, -9L), GhostChats.chats());
        assertEquals("Ghost mode is off in these chats.", String.valueOf(ShadowToast.getTextOfLatestToast()));
        // Some already in: the rest join them.
        Settings.GHOST_MODE.save(false);
        tap(7L, 4L);
        assertEquals(ids(7L, -9L, 4L), GhostChats.chats());
        assertEquals("Ghost mode is on in these chats.", String.valueOf(ShadowToast.getTextOfLatestToast()));
        tap(7L, 4L);
        assertEquals(ids(-9L), GhostChats.chats());
        assertEquals("These chats follow Ghost mode again.", String.valueOf(ShadowToast.getTextOfLatestToast()));
        // What was written comes back after the cache is gone, as after a restart.
        GhostChats.forget();
        assertEquals(ids(-9L), GhostChats.chats());
    }

    @Test public void theListCountsOnlyWhileItsSwitchIsOn() {
        assertTrue(GhostChats.save(ids(7L)));
        assertFalse(GhostChats.any());
        assertFalse(GhostChats.flipped(7L));
        Settings.GHOST_CHATS.save(true);
        assertTrue(GhostChats.any());
        assertTrue(GhostChats.flipped(7L));
        assertFalse(GhostChats.flipped(8L));
        assertFalse(GhostChats.flipped(null));
    }
}
