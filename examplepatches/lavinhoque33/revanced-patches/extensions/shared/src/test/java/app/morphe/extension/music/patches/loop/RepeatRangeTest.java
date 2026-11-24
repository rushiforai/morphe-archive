/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-23.
 */
package app.morphe.extension.music.patches.loop;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class RepeatRangeTest {
    private static final long DURATION = 30_000;

    @Test
    public void rejectsInvalidEndWithoutLosingStart() {
        RepeatRange range = new RepeatRange();
        assertFalse(range.setEnd(4_000, DURATION));
        assertTrue(range.setStart(2_000, DURATION));
        assertFalse(range.setEnd(1_000, DURATION));
        assertFalse(range.setEnd(2_000, DURATION));
        assertFalse(range.setEnd(2_249, DURATION));
        assertFalse(range.setEnd(29_501, DURATION));
        assertEquals(2_000, range.start());
        assertFalse(range.active());
        assertTrue(range.setEnd(2_250, DURATION));
    }

    @Test
    public void zeroIsValidAndNearEndRetainsRoomToWrap() {
        RepeatRange range = new RepeatRange();
        assertFalse(range.setStart(-1, DURATION));
        assertFalse(range.setStart(29_251, DURATION));
        assertTrue(range.setStart(0, DURATION));
        assertTrue(range.setEnd(29_500, DURATION));
        assertTrue(range.fits(DURATION));
        assertFalse(range.fits(DURATION - 1));
    }

    @Test
    public void wrapsOnceUntilNativeClockAcknowledgesSeek() {
        RepeatRange range = new RepeatRange();
        range.setStart(2_000, DURATION);
        range.setEnd(2_250, DURATION);

        assertFalse(range.shouldWrap(-1));
        assertFalse(range.shouldWrap(2_249));
        assertTrue(range.shouldWrap(2_250));
        assertFalse(range.shouldWrap(2_300));
        assertFalse(range.shouldWrap(2_000));
        assertTrue(range.shouldWrap(2_251));
    }

    @Test
    public void manualSeekDoesNotClampAndOutsideClearsTheRange() {
        RepeatRange range = new RepeatRange();
        range.setStart(2_000, DURATION);
        assertFalse(range.manualSeek(1_000));
        range.setEnd(4_000, DURATION);
        assertFalse(range.manualSeek(2_000));
        assertFalse(range.manualSeek(3_999));
        assertTrue(range.active());
        assertTrue(range.manualSeek(4_000));
        assertFalse(range.shouldWrap(5_000));
        range.setStart(2_000, DURATION);
        range.setEnd(4_000, DURATION);
        assertTrue(range.manualSeek(1_999));
    }

    @Test
    public void newOccurrenceAndStopUseTheSameCompleteReset() {
        RepeatRange range = new RepeatRange();
        range.setStart(2_000, DURATION);
        range.setEnd(4_000, DURATION);
        assertTrue(range.shouldWrap(4_000));

        assertTrue(range.clear());
        assertEquals(RepeatRange.UNSET, range.start());
        assertEquals(RepeatRange.UNSET, range.end());
        assertFalse(range.clear());
        assertFalse(range.shouldWrap(4_000));
        range.setStart(2_000, DURATION);
        range.setEnd(4_000, DURATION);
        assertTrue(range.shouldWrap(4_000));
    }
}
