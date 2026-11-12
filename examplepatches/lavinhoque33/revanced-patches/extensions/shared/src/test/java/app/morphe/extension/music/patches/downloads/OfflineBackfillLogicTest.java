/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-08.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.*;

import org.junit.Test;

import java.util.List;
import java.util.Set;

public class OfflineBackfillLogicTest {
    @Test public void aRunNeedsTheSettingAndANetwork() {
        assertNull(OfflineBackfillLogic.blockedReason(true, true));
        assertEquals("setting off", OfflineBackfillLogic.blockedReason(false, true));
        assertEquals("setting off", OfflineBackfillLogic.blockedReason(false, false));
        assertEquals("offline", OfflineBackfillLogic.blockedReason(true, false));
    }

    @Test public void pendingAreTheCopiesWithoutStoredDataInAFixedOrder() {
        List<String> pending = OfflineBackfillLogic.pending(Set.of("ccc", "aaa", "bbb", "ddd"), Set.of("bbb", "zzz"));

        assertEquals(List.of("aaa", "ccc", "ddd"), pending);
    }

    @Test public void nothingIsPendingOnceEveryCopyHasData() {
        assertTrue(OfflineBackfillLogic.pending(Set.of("aaa"), Set.of("aaa")).isEmpty());
        assertTrue(OfflineBackfillLogic.pending(Set.of(), Set.of()).isEmpty());
    }

    @Test public void theRetryWaitGrowsFourfold() {
        assertEquals(30_000, OfflineBackfillLogic.retryDelayMillis(1));
        assertEquals(120_000, OfflineBackfillLogic.retryDelayMillis(2));
        assertEquals(480_000, OfflineBackfillLogic.retryDelayMillis(3));
    }

    @Test public void aRunWaitsForTheIdleTimeToPass() {
        assertFalse(OfflineBackfillLogic.mayStartAgain(1_000, 999));
        assertTrue(OfflineBackfillLogic.mayStartAgain(1_000, 1_000));
        assertTrue(OfflineBackfillLogic.mayStartAgain(0, 5));
    }

    @Test public void theScheduleTakesTheFirstPendingCopy() {
        OfflineBackfillLogic.Schedule schedule = new OfflineBackfillLogic.Schedule();

        assertEquals("aaa", schedule.next(List.of("aaa", "bbb"), 0));
        assertNull(schedule.next(List.of(), 0));
    }

    @Test public void aFailedCopyWaitsAndTheNextOneGoesFirst() {
        OfflineBackfillLogic.Schedule schedule = new OfflineBackfillLogic.Schedule();

        assertFalse(schedule.failed("aaa", 1_000));

        assertEquals("bbb", schedule.next(List.of("aaa", "bbb"), 1_001));
        assertNull(schedule.next(List.of("aaa"), 1_001));
        assertEquals("aaa", schedule.next(List.of("aaa"), 1_000 + OfflineBackfillLogic.RETRY_BASE_MILLIS));
    }

    @Test public void aCopyIsGivenUpOnAfterTheLastAllowedFailure() {
        OfflineBackfillLogic.Schedule schedule = new OfflineBackfillLogic.Schedule();
        long now = 0;

        for (int failure = 1; failure < OfflineBackfillLogic.MAX_FAILURES; failure++) {
            assertFalse(schedule.failed("aaa", now));
            now += OfflineBackfillLogic.retryDelayMillis(failure);
        }
        assertTrue(schedule.failed("aaa", now));

        assertNull(schedule.next(List.of("aaa"), now + 24 * 3_600_000L));
    }

    @Test public void aStoredCopyForgetsItsFailures() {
        OfflineBackfillLogic.Schedule schedule = new OfflineBackfillLogic.Schedule();
        schedule.failed("aaa", 0);

        schedule.succeeded("aaa");

        assertEquals("aaa", schedule.next(List.of("aaa"), 0));
    }
}
