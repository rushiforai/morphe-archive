/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class SelectAllTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** Newest first: ids 10 down to 1, with a service message at id 6. */
    private static final int[] IDS = {10, 9, 8, 7, 6, 5, 4, 3, 2, 1};
    private static final boolean[] SELECTABLE = {true, true, true, true, false, true, true, true, true, true};

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.SELECT_ALL);
        Settings.SELECT_ALL.resetToDefault();
        HookStatus.clear();
    }

    private static Set<Integer> set(Integer... ids) { return new HashSet<>(Arrays.asList(ids)); }

    @Test public void everythingSelectableIsPickedNewestFirst() {
        SelectBetween.Plan plan = SelectAll.plan(IDS, SELECTABLE, set(), 100);
        assertEquals(SelectBetween.Outcome.SELECTED, plan.outcome);
        assertEquals(Arrays.asList(0, 1, 2, 3, 5, 6, 7, 8, 9), plan.pick);
    }

    @Test public void messagesAlreadySelectedAreLeftAlone() {
        SelectBetween.Plan plan = SelectAll.plan(IDS, SELECTABLE, set(10, 5, 1), 100);
        assertEquals(Arrays.asList(1, 2, 3, 6, 7, 8), plan.pick);
    }

    @Test public void everythingSelectedAlreadyIsNothing() {
        SelectBetween.Plan plan = SelectAll.plan(IDS, SELECTABLE, set(10, 9, 8, 7, 5, 4, 3, 2, 1), 100);
        assertEquals(SelectBetween.Outcome.NOTHING, plan.outcome);
        assertTrue(plan.pick.isEmpty());
        assertEquals(SelectBetween.Outcome.NOTHING, SelectAll.plan(new int[0], new boolean[0], set(), 100).outcome);
    }

    @Test public void itStopsWhereTelegramsLimitDoesKeepingTheNewest() {
        int[] ids = new int[300];
        boolean[] selectable = new boolean[300];
        for (int i = 0; i < ids.length; i++) {
            ids[i] = 1000 - i;
            selectable[i] = true;
        }
        SelectBetween.Plan plan = SelectAll.plan(ids, selectable, set(1000), 100);
        assertEquals(SelectBetween.Outcome.LIMIT, plan.outcome);
        // One is selected already, so 99 more, the newest ones after it.
        assertEquals(99, plan.pick.size());
        assertEquals(Integer.valueOf(1), plan.pick.get(0));
        assertEquals(Integer.valueOf(99), plan.pick.get(98));
    }

    @Test public void offByDefaultNothingIsOfferedAndTheChatsClickIsTelegrams() {
        assertFalse(Settings.SELECT_ALL.get());
        assertFalse(SelectAll.inChats());
        assertFalse(SelectAll.inSharedMedia());
        // The stubs answer nothing off a patched app, so nothing is added and nothing throws.
        SelectAll.showing(new Object(), true);
        SelectAll.showing(new Object(), false);
    }

    @Test public void theButtonsOwnNumberIsTakenSoTelegramNeverSeesIt() {
        assertEquals(SelectBetween.TAKEN, SelectBetween.clicked(new Object(), SelectAll.ITEM));
        Settings.SELECT_ALL.save(true);
        assertEquals(SelectBetween.TAKEN, SelectBetween.clicked(new Object(), SelectAll.ITEM));
        assertEquals(7, SelectBetween.clicked(new Object(), 7));
    }

    @Test public void itsNumberIsTheExtensionsOwnAndDistinct() {
        assertNotEquals(SelectBetween.ITEM, SelectAll.ITEM);
        assertNotEquals(SelectionScreenshot.ITEM, SelectAll.ITEM);
        assertEquals(0x48544d00, SelectAll.ITEM & 0xffffff00);
    }
}
