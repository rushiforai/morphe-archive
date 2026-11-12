/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.*;

import org.junit.Test;

public class ElementRowLayoutTest {
    // The track row of an album page on a 2.5 density, 1080 px wide screen (measured in a view dump): the row is 160 px
    // high and the cell of the number is 85 x 120 px, 40 px from the start.
    private static final float DENSITY = 2.5f;

    @Test public void theCellOfTheTrackNumberIsRecognised() {
        assertTrue(ElementRowLayout.isNumberCell(40, 85, 120, 1080, 160, DENSITY));
    }

    @Test public void aThumbnailOrAButtonIsNotTheCellOfTheNumber() {
        // A 56 dp wide thumbnail, a button at the end of the row, a short view at the start.
        assertFalse(ElementRowLayout.isNumberCell(40, 140, 140, 1080, 160, DENSITY));
        assertFalse(ElementRowLayout.isNumberCell(978, 92, 120, 1080, 160, DENSITY));
        assertFalse(ElementRowLayout.isNumberCell(40, 85, 30, 1080, 160, DENSITY));
    }

    @Test public void onlyTheHeightOfATrackRowCounts() {
        assertFalse(ElementRowLayout.isNumberCell(40, 85, 120, 1080, 40, DENSITY));
        assertFalse(ElementRowLayout.isNumberCell(40, 85, 120, 1080, 400, DENSITY));
        assertFalse(ElementRowLayout.isNumberCell(40, 85, 120, 400, 160, DENSITY));
    }

    @Test public void theActionBarOfTheAlbumHeaderIsNoTrackRow() {
        // Measured on a device: 1080 x 120 px (48 dp), with a 97 x 120 px icon button cell that looked like a number.
        assertFalse(ElementRowLayout.isTrackRow(1080, 120, DENSITY));
        assertFalse(ElementRowLayout.isNumberCell(0, 97, 120, 1080, 120, DENSITY));
        assertTrue(ElementRowLayout.isTrackRow(1080, 160, DENSITY));
    }

    @Test public void theCellOfTheActionMenuIsRecognised() {
        // Measured: 92 x 120 px at 978 of a 1080 px row, so its end is 10 px from the end of the row.
        assertTrue(ElementRowLayout.isMenuCell(10, 92, 120, 1080, 160, DENSITY));
    }

    @Test public void theTitleOrTheNumberIsNotTheActionMenu() {
        // The 1030 px wide title host and the number cell at the start (its end is far from the end of the row).
        assertFalse(ElementRowLayout.isMenuCell(10, 1030, 160, 1080, 160, DENSITY));
        assertFalse(ElementRowLayout.isMenuCell(955, 85, 120, 1080, 160, DENSITY));
        assertFalse(ElementRowLayout.isMenuCell(10, 92, 30, 1080, 160, DENSITY));
        assertFalse(ElementRowLayout.isMenuCell(10, 92, 120, 1080, 120, DENSITY));
    }

    @Test public void theCheckSitsLeftOfTheMenuInALeftToRightRow() {
        int left = ElementRowLayout.checkLeft(978, 92, false, DENSITY);

        // 16 dp = 40 px with a 4 dp (10 px) gap: it ends 10 px before the menu cell, so it never overlaps it.
        assertEquals(978 - 10 - 40, left);
        assertTrue(left + 40 + 10 <= 978);
    }

    @Test public void theCheckMirrorsToTheRightOfTheMenuInARightToLeftRow() {
        // The menu cell of a mirrored row sits at the left end: 10 px from it, 92 px wide.
        int left = ElementRowLayout.checkLeft(10, 92, true, DENSITY);

        assertEquals(10 + 92 + 10, left);
        assertTrue(left >= 10 + 92);
    }

    @Test public void theCheckIsCenteredVerticallyInTheRow() {
        int top = ElementRowLayout.checkTop(160, DENSITY);

        assertEquals(60, top);
        assertEquals(160 - (top + 40), top);
    }
}
