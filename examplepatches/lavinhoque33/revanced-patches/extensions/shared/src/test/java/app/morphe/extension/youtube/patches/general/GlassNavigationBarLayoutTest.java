/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-13.
 */
package app.morphe.extension.youtube.patches.general;

import org.junit.Test;
import app.morphe.extension.shared.ui.glass.GlassCapsuleGeometry;

import static org.junit.Assert.*;

public class GlassNavigationBarLayoutTest {
    @Test public void miniplayerCornersStayInsideCardAcrossStyleRange() {
        assertEquals(8f, GlassCapsuleGeometry.cornerRadius(8, 56), 0f);
        assertEquals(18f, GlassCapsuleGeometry.cornerRadius(18, 56), 0f);
        assertEquals(28f, GlassCapsuleGeometry.cornerRadius(32, 56), 0f);
        assertEquals(16f, GlassCapsuleGeometry.cornerRadius(32, 32), 0f);
    }

    @Test public void artworkCornersRemainConcentricWithoutLosingMinimumRounding() {
        assertEquals(11f, GlassCapsuleGeometry.artworkRadius(18, 7, 6), 0f);
        assertEquals(6f, GlassCapsuleGeometry.artworkRadius(8, 14, 6), 0f);
        assertEquals(24f, GlassCapsuleGeometry.artworkRadius(28, 4, 6), 0f);
    }

    private static long layout(int width, int buttons, int content, int appMin, int percent, int spacing) {
        return GlassCapsuleGeometry.getButtonsLayout(width, buttons, content, appMin, percent, spacing, 12, 48, 8);
    }

    @Test public void capsuleFitsButtonsAndClampsSpacingToAvailableWidth() {
        long full = layout(360, 4, 24, 0, 100, 48);
        assertEquals(4, GlassCapsuleGeometry.shownButtons(full));
        assertEquals(72, GlassCapsuleGeometry.buttonWidth(full));
        assertEquals(48, GlassCapsuleGeometry.buttonWidth(layout(360, 4, 24, 0, 100, 8)));
        assertEquals(84, GlassCapsuleGeometry.buttonWidth(layout(360, 4, 24, 0, 100, 96)));
    }

    @Test public void smallerMaximumWidthHidesOverflowFromSixOrMoreTabs() {
        long narrow = layout(360, 8, 24, 0, 50, 48);
        assertEquals(3, GlassCapsuleGeometry.shownButtons(narrow));
        assertEquals(56, GlassCapsuleGeometry.buttonWidth(narrow));
        assertEquals(7, GlassCapsuleGeometry.shownButtons(layout(360, 8, 24, 0, 100, 48)));
    }

    @Test public void selectedOverflowTabReplacesLastSlotNotFirstTabs() {
        for (int selected = 0; selected < 8; selected++) {
            int count = 0;
            for (int index = 0; index < 8; index++) {
                if (GlassCapsuleGeometry.isButtonShown(index, 3, selected)) count++;
            }
            assertEquals(3, count);
            assertTrue(GlassCapsuleGeometry.isButtonShown(selected, 3, selected));
        }
        assertTrue(GlassCapsuleGeometry.isButtonShown(0, 3, 7));
        assertTrue(GlassCapsuleGeometry.isButtonShown(1, 3, 7));
        assertFalse(GlassCapsuleGeometry.isButtonShown(2, 3, 7));
        assertTrue(GlassCapsuleGeometry.isButtonShown(7, 3, 7));
        assertFalse(GlassCapsuleGeometry.isButtonShown(0, 1, 7));
        assertTrue(GlassCapsuleGeometry.isButtonShown(7, 1, 7));
    }

    @Test public void unselectedOverflowReappearsWhenRoomReturns() {
        assertFalse(GlassCapsuleGeometry.isButtonShown(5, 3, -1));
        assertTrue(GlassCapsuleGeometry.isButtonShown(5, 6, -1));
    }

    @Test public void tabletMinimumAndLongContentDetermineFitting() {
        long tablet = layout(360, 6, 24, 96, 100, 48);
        assertEquals(3, GlassCapsuleGeometry.shownButtons(tablet));
        assertEquals(96, GlassCapsuleGeometry.buttonWidth(tablet));
        assertEquals(2, GlassCapsuleGeometry.shownButtons(layout(360, 6, 120, 0, 100, 48)));
    }

    @Test public void tinyBarStillRetainsSelectedTabWithNonnegativeWidth() {
        long tiny = layout(10, 8, 24, 0, 100, 48);
        assertEquals(1, GlassCapsuleGeometry.shownButtons(tiny));
        assertEquals(0, GlassCapsuleGeometry.buttonWidth(tiny));
    }

    @Test public void heightRespectsContentAndClampsImportedPercentages() {
        assertEquals(48, GlassCapsuleGeometry.getCapsuleHeight(48, 32, 100, 4));
        assertEquals(40, GlassCapsuleGeometry.getCapsuleHeight(48, 32, 60, 4));
        assertEquals(77, GlassCapsuleGeometry.getCapsuleHeight(48, 32, 160, 4));
        assertEquals(88, GlassCapsuleGeometry.getCapsuleHeight(48, 80, 60, 4));
        assertEquals(40, GlassCapsuleGeometry.getCapsuleHeight(48, 32, -1000, 4));
        assertEquals(77, GlassCapsuleGeometry.getCapsuleHeight(48, 32, 1000, 4));
        assertEquals(layout(360, 8, 24, 0, 50, 48), layout(360, 8, 24, 0, -1000, 48));
        assertEquals(layout(360, 8, 24, 0, 100, 48), layout(360, 8, 24, 0, 1000, 48));
    }

    @Test public void opacityScalesLightAndDarkTintAndClampsImports() {
        assertEquals(0, Math.round(255 * GlassCapsuleGeometry.scaledAlpha(.5f, 0)));
        assertEquals(128, Math.round(255 * GlassCapsuleGeometry.scaledAlpha(.5f, 50)));
        assertEquals(102, Math.round(255 * GlassCapsuleGeometry.scaledAlpha(.4f, 50)));
        assertEquals(255, Math.round(255 * GlassCapsuleGeometry.scaledAlpha(.5f, 100)));
        assertEquals(204, Math.round(255 * GlassCapsuleGeometry.scaledAlpha(.4f, 100)));
        assertEquals(0f, GlassCapsuleGeometry.scaledAlpha(.5f, -1000), 0f);
        assertEquals(1f, GlassCapsuleGeometry.scaledAlpha(.5f, 1000), 0f);
        assertEquals(1f, GlassCapsuleGeometry.scaledAlpha(.9f, 100), 0f);
    }
}
