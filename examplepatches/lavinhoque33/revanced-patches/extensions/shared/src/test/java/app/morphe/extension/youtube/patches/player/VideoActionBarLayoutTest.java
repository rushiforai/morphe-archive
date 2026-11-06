/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-06.
 */
package app.morphe.extension.youtube.patches.player;

import static org.junit.Assert.*;
import static app.morphe.extension.youtube.patches.player.VideoActionBarLayout.*;

import org.junit.Test;

public class VideoActionBarLayoutTest {
    @Test
    public void migratesBothLegacySwitchesWithTabletPrecedence() {
        assertEquals(DEFAULT, migrate(false, false));
        assertEquals(CLASSIC, migrate(true, false));
        assertEquals(CLASSIC_TWO_ROWS, migrate(false, true));
        assertEquals(CLASSIC_TWO_ROWS, migrate(true, true));
    }

    @Test
    public void respectsForcedDefaultRules() {
        for (VideoActionBarLayout layout : values()) {
            assertEquals(layout, layout.effective(false, false));
            assertEquals(DEFAULT, layout.effective(true, false));
            assertEquals(DEFAULT, layout.effective(false, true));
            assertEquals(DEFAULT, layout.effective(true, true));
        }
    }

    @Test
    public void identifiesClassicLayoutsForConfigAndDislikePill() {
        assertFalse(DEFAULT.isClassic());
        assertTrue(CLASSIC.isClassic());
        assertTrue(CLASSIC_TWO_ROWS.isClassic());
        assertFalse(MINIMAL.isClassic());
    }

    @Test
    public void minimalUsesSeparateCountOverlaysEvenForSegmentedServerInput() {
        assertFalse(MINIMAL.usesSegmentedCounts(true));
        assertFalse(MINIMAL.usesSegmentedCounts(false));
        assertTrue(CLASSIC.usesSegmentedCounts(false));
        assertTrue(CLASSIC_TWO_ROWS.usesSegmentedCounts(false));
        assertTrue(DEFAULT.usesSegmentedCounts(true));
        assertFalse(DEFAULT.usesSegmentedCounts(false));
    }

    @Test
    public void parsesStoredEnumNames() {
        assertEquals(DEFAULT, valueOf("DEFAULT"));
        assertEquals(CLASSIC, valueOf("CLASSIC"));
        assertEquals(CLASSIC_TWO_ROWS, valueOf("CLASSIC_TWO_ROWS"));
        assertEquals(MINIMAL, valueOf("MINIMAL"));
    }
}
