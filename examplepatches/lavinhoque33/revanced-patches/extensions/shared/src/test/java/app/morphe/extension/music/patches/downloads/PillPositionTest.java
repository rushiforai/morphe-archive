/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-08.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.*;

import org.junit.Test;

public class PillPositionTest {
    @Test public void aPositionInTheMiddleIsKept() {
        PillPosition.Start start = PillPosition.choose(60_000, 200_000);

        assertEquals(60_000, start.millis());
        assertTrue(start.continues());
    }

    @Test public void anUnknownPositionStartsAtTheBeginningAndSaysWhy() {
        PillPosition.Start start = PillPosition.choose(-1, 200_000);

        assertEquals(0, start.millis());
        assertFalse(start.continues());
        assertEquals("position unknown", start.reason());
    }

    @Test public void aPositionUnderASecondHasNothingToContinueFrom() {
        assertEquals(0, PillPosition.choose(0, 200_000).millis());
        assertEquals(0, PillPosition.choose(999, 200_000).millis());
        assertEquals(1_000, PillPosition.choose(1_000, 200_000).millis());
    }

    @Test public void aPositionWithinThreeSecondsOfTheEndStartsAtTheBeginning() {
        assertEquals(196_999, PillPosition.choose(196_999, 200_000).millis());

        PillPosition.Start near = PillPosition.choose(197_000, 200_000);
        assertEquals(0, near.millis());
        assertTrue(near.reason().contains("end"));
        assertEquals(0, PillPosition.choose(200_000, 200_000).millis());
        assertEquals(0, PillPosition.choose(250_000, 200_000).millis());
    }

    @Test public void anUnknownLengthDoesNotCheckTheEnd() {
        PillPosition.Start start = PillPosition.choose(500_000, 0);

        assertEquals(500_000, start.millis());
        assertTrue(start.reason().contains("length unknown"));
    }

    @Test public void aVideoShorterThanTheMarginStartsAtTheBeginning() {
        assertEquals(0, PillPosition.choose(1_500, 2_000).millis());
    }
}
