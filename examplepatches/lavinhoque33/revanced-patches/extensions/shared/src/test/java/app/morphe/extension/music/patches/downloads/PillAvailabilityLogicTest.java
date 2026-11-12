/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-09.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.*;

import org.junit.Test;

import java.util.Set;
import java.util.function.Predicate;

public class PillAvailabilityLogicTest {
    private static final Predicate<String> COPIES = Set.of("video-1")::contains;

    @Test public void theVideoBeingPlayedThatHasACopyIsTheOne() {
        assertEquals("video-1", PillAvailabilityLogic.videoWithCopy("video-1", "", COPIES));
    }

    @Test public void theVideoOfTheLastPlayerResponseCountsWhenTheOneBeingPlayedHasNoCopy() {
        assertEquals("video-1", PillAvailabilityLogic.videoWithCopy("song-1", "video-1", COPIES));
    }

    @Test public void aVideoWithoutACopyIsNone() {
        assertNull(PillAvailabilityLogic.videoWithCopy("video-2", "video-3", COPIES));
    }

    @Test public void noVideoAsksNothingOfTheStore() {
        Predicate<String> never = id -> {
            throw new AssertionError("asked for " + id);
        };

        assertNull(PillAvailabilityLogic.videoWithCopy("", "", never));
        assertNull(PillAvailabilityLogic.videoWithCopy(null, null, never));
    }

    @Test public void anAnswerOfTheAppThatIsTrueIsKept() {
        assertTrue(PillAvailabilityLogic.opens(true, false));
        assertTrue(PillAvailabilityLogic.opens(true, true));
    }

    @Test public void aFalseAnswerIsOverruledOnlyForAVideoWithACopy() {
        assertTrue(PillAvailabilityLogic.opens(false, true));
        assertFalse(PillAvailabilityLogic.opens(false, false));
    }
}
