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
public class SelectBetweenTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** Newest first, as the chat lists them: ids 10 down to 1, with a service message at id 6. */
    private static final int[] IDS = {10, 9, 8, 7, 6, 5, 4, 3, 2, 1};
    private static final boolean[] SELECTABLE = {true, true, true, true, false, true, true, true, true, true};

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.SELECT_BETWEEN);
        Settings.SELECT_BETWEEN.resetToDefault();
        HookStatus.clear();
    }

    private static Set<Integer> set(Integer... ids) { return new HashSet<>(Arrays.asList(ids)); }

    @Test public void everythingBetweenTheOutermostTwoIsPickedAndTheServiceMessageIsSkipped() {
        SelectBetween.Plan plan = SelectBetween.between(IDS, SELECTABLE, set(9, 3), 100);
        assertEquals(SelectBetween.Outcome.SELECTED, plan.outcome);
        // Positions of ids 8, 7, 5, 4: id 6 is a service message.
        assertEquals(Arrays.asList(2, 3, 5, 6), plan.pick);
    }

    @Test public void messagesAlreadySelectedInsideTheRangeAreLeftAlone() {
        SelectBetween.Plan plan = SelectBetween.between(IDS, SELECTABLE, set(9, 7, 3), 100);
        assertEquals(Arrays.asList(2, 5, 6), plan.pick);
    }

    @Test public void fewerThanTwoSelectedIsNotARange() {
        assertEquals(SelectBetween.Outcome.TOO_FEW, SelectBetween.between(IDS, SELECTABLE, set(), 100).outcome);
        assertEquals(SelectBetween.Outcome.TOO_FEW, SelectBetween.between(IDS, SELECTABLE, set(5), 100).outcome);
    }

    @Test public void neighboursHaveNothingBetweenThem() {
        SelectBetween.Plan plan = SelectBetween.between(IDS, SELECTABLE, set(9, 8), 100);
        assertEquals(SelectBetween.Outcome.NOTHING, plan.outcome);
        assertTrue(plan.pick.isEmpty());
    }

    @Test public void aSelectedMessageThatIsntLoadedSelectsNothing() {
        SelectBetween.Plan plan = SelectBetween.between(IDS, SELECTABLE, set(9, 99), 100);
        assertEquals(SelectBetween.Outcome.NOT_LOADED, plan.outcome);
        assertTrue(plan.pick.isEmpty());
    }

    @Test public void theRangeStopsWhereTelegramsLimitDoes() {
        int[] ids = new int[300];
        boolean[] selectable = new boolean[300];
        for (int i = 0; i < ids.length; i++) {
            ids[i] = 1000 - i;
            selectable[i] = true;
        }
        SelectBetween.Plan plan = SelectBetween.between(ids, selectable, set(1000, 701), 100);
        assertEquals(SelectBetween.Outcome.LIMIT, plan.outcome);
        // Two are selected already, and the 100 limit leaves 98 for the gap.
        assertEquals(98, plan.pick.size());
        assertEquals(Integer.valueOf(1), plan.pick.get(0));
    }

    @Test public void aTapPastTheEndPullsTheGapInWithIt() {
        // 9 and 7 selected, 4 tapped: id 6 is a service message, so id 5 is all that lies between 7 and 4.
        SelectBetween.Plan below = SelectBetween.extend(IDS, SELECTABLE, set(9, 7), 100, 4);
        assertEquals(Arrays.asList(5), below.pick);
        SelectBetween.Plan above = SelectBetween.extend(IDS, SELECTABLE, set(5, 3), 100, 9);
        assertEquals(Arrays.asList(2, 3), above.pick);
    }

    @Test public void aTapInsideTheRangeOrOnASelectedMessageChangesNothing() {
        assertEquals(SelectBetween.Outcome.NOTHING, SelectBetween.extend(IDS, SELECTABLE, set(9, 3), 100, 5).outcome);
        assertEquals(SelectBetween.Outcome.NOTHING, SelectBetween.extend(IDS, SELECTABLE, set(9, 3), 100, 9).outcome);
        assertEquals(SelectBetween.Outcome.NOTHING, SelectBetween.extend(IDS, SELECTABLE, set(), 100, 5).outcome);
    }

    @Test public void aTapPastTheEndIsStoppedByTheLimitToo() {
        int[] ids = new int[300];
        boolean[] selectable = new boolean[300];
        for (int i = 0; i < ids.length; i++) {
            ids[i] = 1000 - i;
            selectable[i] = true;
        }
        SelectBetween.Plan plan = SelectBetween.extend(ids, selectable, set(1000), 100, 800);
        assertEquals(SelectBetween.Outcome.LIMIT, plan.outcome);
        // One selected and the tapped message still to come leaves 98 for the gap.
        assertEquals(98, plan.pick.size());
    }

    @Test public void offByDefaultTheButtonIsNotOfferedAndAClickIsTelegrams() {
        assertFalse(Settings.SELECT_BETWEEN.get());
        assertEquals(12, SelectBetween.clicked(new Object(), 12));
        // The stubs answer nothing off a patched app, so nothing is added and nothing throws.
        SelectBetween.addItem(new Object());
        SelectBetween.selecting(new Object(), new Object());
    }

    @Test public void onTheButtonsOwnNumberIsTakenSoTelegramNeverSeesIt() {
        Settings.SELECT_BETWEEN.save(true);
        assertEquals(SelectBetween.TAKEN, SelectBetween.clicked(new Object(), SelectBetween.ITEM));
        assertEquals(7, SelectBetween.clicked(new Object(), 7));
    }
}
