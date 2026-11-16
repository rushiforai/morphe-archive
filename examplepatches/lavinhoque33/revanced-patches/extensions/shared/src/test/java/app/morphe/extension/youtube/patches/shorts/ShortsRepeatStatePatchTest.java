/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-14.
 */
package app.morphe.extension.youtube.patches.shorts;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class ShortsRepeatStatePatchTest {
    @Test
    public void foregroundAutoplayRepeatsUntilPanelCloses() {
        assertTrue(ShortsRepeatStatePatch.shouldAutoplay(true, false, false));
        assertFalse(ShortsRepeatStatePatch.shouldAutoplay(true, false, true));
        assertFalse(ShortsRepeatStatePatch.shouldAutoplay(true, false, true));
        assertTrue(ShortsRepeatStatePatch.shouldAutoplay(true, false, false));
    }

    @Test
    public void backgroundPipKeepsItsIndependentAutoplaySetting() {
        assertTrue(ShortsRepeatStatePatch.shouldAutoplay(true, true, false));
        assertTrue(ShortsRepeatStatePatch.shouldAutoplay(true, true, true));
    }

    @Test
    public void disabledAutoplayNeverAdvances() {
        assertFalse(ShortsRepeatStatePatch.shouldAutoplay(false, false, false));
        assertFalse(ShortsRepeatStatePatch.shouldAutoplay(false, false, true));
        assertFalse(ShortsRepeatStatePatch.shouldAutoplay(false, true, false));
        assertFalse(ShortsRepeatStatePatch.shouldAutoplay(false, true, true));
    }
}
