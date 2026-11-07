/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-06.
 */
package app.morphe.extension.youtube.patches.general;

import org.junit.Test;

import static org.junit.Assert.*;

public class GlassNavigationBarLayoutTest {
    private static long layout(int width, int buttons, int content, int appMin, int percent, int spacing) {
        return GlassNavigationBarLayout.getButtonsLayout(width, buttons, content, appMin, percent, spacing, 12, 48, 8);
    }

    @Test public void capsuleFitsButtonsAndClampsSpacingToAvailableWidth() {
        long full = layout(360, 4, 24, 0, 100, 48);
        assertEquals(4, GlassNavigationBarLayout.shownButtons(full));
        assertEquals(72, GlassNavigationBarLayout.buttonWidth(full));
        assertEquals(48, GlassNavigationBarLayout.buttonWidth(layout(360, 4, 24, 0, 100, 8)));
        assertEquals(84, GlassNavigationBarLayout.buttonWidth(layout(360, 4, 24, 0, 100, 96)));
    }

    @Test public void smallerMaximumWidthHidesOverflowFromSixOrMoreTabs() {
        long narrow = layout(360, 8, 24, 0, 50, 48);
        assertEquals(3, GlassNavigationBarLayout.shownButtons(narrow));
        assertEquals(56, GlassNavigationBarLayout.buttonWidth(narrow));
        assertEquals(7, GlassNavigationBarLayout.shownButtons(layout(360, 8, 24, 0, 100, 48)));
    }

    @Test public void selectedOverflowTabReplacesLastSlotNotFirstTabs() {
        for (int selected = 0; selected < 8; selected++) {
            int count = 0;
            for (int index = 0; index < 8; index++) {
                if (GlassNavigationBarLayout.isButtonShown(index, 3, selected)) count++;
            }
            assertEquals(3, count);
            assertTrue(GlassNavigationBarLayout.isButtonShown(selected, 3, selected));
        }
        assertTrue(GlassNavigationBarLayout.isButtonShown(0, 3, 7));
        assertTrue(GlassNavigationBarLayout.isButtonShown(1, 3, 7));
        assertFalse(GlassNavigationBarLayout.isButtonShown(2, 3, 7));
        assertTrue(GlassNavigationBarLayout.isButtonShown(7, 3, 7));
        assertFalse(GlassNavigationBarLayout.isButtonShown(0, 1, 7));
        assertTrue(GlassNavigationBarLayout.isButtonShown(7, 1, 7));
    }

    @Test public void unselectedOverflowReappearsWhenRoomReturns() {
        assertFalse(GlassNavigationBarLayout.isButtonShown(5, 3, -1));
        assertTrue(GlassNavigationBarLayout.isButtonShown(5, 6, -1));
    }

    @Test public void tabletMinimumAndLongContentDetermineFitting() {
        long tablet = layout(360, 6, 24, 96, 100, 48);
        assertEquals(3, GlassNavigationBarLayout.shownButtons(tablet));
        assertEquals(96, GlassNavigationBarLayout.buttonWidth(tablet));
        assertEquals(2, GlassNavigationBarLayout.shownButtons(layout(360, 6, 120, 0, 100, 48)));
    }

    @Test public void tinyBarStillRetainsSelectedTabWithNonnegativeWidth() {
        long tiny = layout(10, 8, 24, 0, 100, 48);
        assertEquals(1, GlassNavigationBarLayout.shownButtons(tiny));
        assertEquals(0, GlassNavigationBarLayout.buttonWidth(tiny));
    }

    @Test public void heightRespectsContentAndClampsImportedPercentages() {
        assertEquals(48, GlassNavigationBarLayout.getCapsuleHeight(48, 32, 100, 4));
        assertEquals(40, GlassNavigationBarLayout.getCapsuleHeight(48, 32, 60, 4));
        assertEquals(77, GlassNavigationBarLayout.getCapsuleHeight(48, 32, 160, 4));
        assertEquals(88, GlassNavigationBarLayout.getCapsuleHeight(48, 80, 60, 4));
        assertEquals(40, GlassNavigationBarLayout.getCapsuleHeight(48, 32, -1000, 4));
        assertEquals(77, GlassNavigationBarLayout.getCapsuleHeight(48, 32, 1000, 4));
        assertEquals(layout(360, 8, 24, 0, 50, 48), layout(360, 8, 24, 0, -1000, 48));
        assertEquals(layout(360, 8, 24, 0, 100, 48), layout(360, 8, 24, 0, 1000, 48));
    }

    @Test public void opacityScalesLightAndDarkTintAndClampsImports() {
        assertEquals(0, Math.round(255 * GlassNavigationBarLayout.scaledAlpha(.5f, 0)));
        assertEquals(128, Math.round(255 * GlassNavigationBarLayout.scaledAlpha(.5f, 50)));
        assertEquals(102, Math.round(255 * GlassNavigationBarLayout.scaledAlpha(.4f, 50)));
        assertEquals(255, Math.round(255 * GlassNavigationBarLayout.scaledAlpha(.5f, 100)));
        assertEquals(204, Math.round(255 * GlassNavigationBarLayout.scaledAlpha(.4f, 100)));
        assertEquals(0f, GlassNavigationBarLayout.scaledAlpha(.5f, -1000), 0f);
        assertEquals(1f, GlassNavigationBarLayout.scaledAlpha(.5f, 1000), 0f);
        assertEquals(1f, GlassNavigationBarLayout.scaledAlpha(.9f, 100), 0f);
    }
}
