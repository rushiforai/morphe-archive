/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-10.
 */
package app.morphe.extension.shared.patches;

import org.junit.Test;

import static app.morphe.extension.shared.patches.FeatureFlagsStartupState.Start.*;
import static org.junit.Assert.*;

public class FeatureFlagsStartupStateTest {
    @Test
    public void firstGuardedStartIsArmedBeforeUsingOverrides() {
        FeatureFlagsStartupState.Start start = FeatureFlagsStartupState.begin(0, true);
        assertSame(FIRST, start);
        assertEquals(1, start.unconfirmedStarts);
        assertFalse(start.resetOverrides);
    }

    @Test
    public void secondUnconfirmedStartStillAllowsTheOverrides() {
        FeatureFlagsStartupState.Start start = FeatureFlagsStartupState.begin(FIRST.unconfirmedStarts, true);
        assertSame(SECOND, start);
        assertEquals(2, start.unconfirmedStarts);
        assertFalse(start.resetOverrides);
    }

    @Test
    public void thirdStartRecoversBeforeApplyingTheSameOverrides() {
        FeatureFlagsStartupState.Start start = FeatureFlagsStartupState.begin(SECOND.unconfirmedStarts, true);
        assertSame(RECOVER, start);
        assertEquals(0, start.unconfirmedStarts);
        assertTrue(start.resetOverrides);
    }

    @Test
    public void noOverridesNeverArmsOrRequestsRecovery() {
        for (int previous : new int[] {0, 1, 2, Integer.MAX_VALUE}) {
            FeatureFlagsStartupState.Start start = FeatureFlagsStartupState.begin(previous, false);
            assertSame(INACTIVE, start);
            assertEquals(0, start.unconfirmedStarts);
            assertFalse(start.resetOverrides);
        }
    }

    @Test
    public void corruptNegativeCountStartsAtOne() {
        assertSame(FIRST, FeatureFlagsStartupState.begin(-1, true));
        assertSame(FIRST, FeatureFlagsStartupState.begin(Integer.MIN_VALUE, true));
    }

    @Test
    public void largePersistedCountRecoversWithoutIntegerOverflow() {
        assertSame(RECOVER, FeatureFlagsStartupState.begin(3, true));
        assertSame(RECOVER, FeatureFlagsStartupState.begin(Integer.MAX_VALUE, true));
    }

    @Test
    public void confirmationBreaksTheConsecutiveFailureStreak() {
        FeatureFlagsStartupState.Start confirmed = SECOND.confirmed();
        assertSame(INACTIVE, confirmed);
        assertEquals(0, confirmed.unconfirmedStarts);
        assertFalse(confirmed.resetOverrides);
        assertSame(FIRST, FeatureFlagsStartupState.begin(confirmed.unconfirmedStarts, true));
    }

    @Test
    public void recoveryStaysIdleOnceOverridesAndBisectAreCleared() {
        FeatureFlagsStartupState.Start recovery = FeatureFlagsStartupState.begin(2, true);
        assertTrue(recovery.resetOverrides);
        assertSame(INACTIVE, FeatureFlagsStartupState.begin(recovery.unconfirmedStarts, false));
        assertSame(INACTIVE, recovery.confirmed());
    }

    @Test
    public void confirmedStartsCanRepeatWithoutTriggeringRecovery() {
        int previous = 0;
        for (int run = 0; run < 20; run++) {
            FeatureFlagsStartupState.Start start = FeatureFlagsStartupState.begin(previous, true);
            assertFalse(start.resetOverrides);
            previous = start.confirmed().unconfirmedStarts;
        }
        assertEquals(0, previous);
    }
}
