/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-24.
 */
package app.morphe.extension.youtube.patches.video;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class PlaybackSpeedValuesTest {
    @Test
    public void softwarePathKeepsExactRatesFromCustomSettings() {
        float[] rates = PlaybackSpeedValues.parsePresets(".05\n1.4\n1.45\n1.5\n2.5\n8");
        assertArrayEquals(new float[]{0.05f, 1.4f, 1.45f, 1.5f, 2.5f, 8f}, rates, 0f);
        for (float rate : rates) {
            assertEquals(rate, PlaybackSpeedValues.limitSoftwareSpeed(rate, 0.1f, 8f, true), 0f);
        }
    }

    @Test
    public void stockAndInvalidValuesRetainOriginalBounds() {
        assertEquals(0.1f, PlaybackSpeedValues.limitSoftwareSpeed(0.05f, 0.1f, 8f, false), 0f);
        assertEquals(0.1f, PlaybackSpeedValues.limitSoftwareSpeed(0f, 0.1f, 8f, true), 0f);
        assertEquals(8f, PlaybackSpeedValues.limitSoftwareSpeed(9f, 0.1f, 8f, true), 0f);
    }
}
