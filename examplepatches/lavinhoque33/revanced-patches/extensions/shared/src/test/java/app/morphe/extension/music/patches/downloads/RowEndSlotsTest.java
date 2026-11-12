/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.*;

import org.junit.Test;

public class RowEndSlotsTest {
    // The ids are stand-ins for the resource ids of the layouts of Music 9.40.51 (names in the comments).
    private static final int MENU = 11;       // contextual_menu_container / menu_anchor_container
    private static final int AVATARS = 12;    // contributor_avatars_container
    private static final int DETAILS = 13;    // details_container
    private static final int THUMBNAILS = 14; // thumbnail_index_container
    private static final int PANEL_TEXT = 0;  // the queue's text column has no id

    @Test public void aLaidOutRowReportsStartOfAsLeftOf() {
        // The rule of details_container: toStartOf avatars, resolved by the layout into LEFT_OF.
        assertEquals(AVATARS, RowEndSlots.startOfTarget(0, AVATARS, 0, false));
        assertEquals(AVATARS, RowEndSlots.startOfTarget(0, 0, AVATARS, true));
        assertEquals(AVATARS, RowEndSlots.startOfTarget(AVATARS, 0, 0, false));
        assertEquals(0, RowEndSlots.startOfTarget(0, 0, THUMBNAILS, false));
    }

    @Test public void theTextColumnOfAListRowEndsAtTheAvatars() {
        assertTrue(RowEndSlots.isTextColumn(DETAILS, AVATARS, MENU, AVATARS));
        // The avatars end at the menu, and the menu container itself is neither.
        assertFalse(RowEndSlots.isTextColumn(AVATARS, MENU, MENU, AVATARS));
        assertFalse(RowEndSlots.isTextColumn(MENU, 0, MENU, AVATARS));
    }

    @Test public void theTextColumnOfAQueueRowEndsAtTheMenuAndHasNoId() {
        assertTrue(RowEndSlots.isTextColumn(PANEL_TEXT, MENU, MENU, 0));
        assertTrue(RowEndSlots.isTextColumn(-1, MENU, MENU, 0));
    }

    @Test public void aChildThatEndsElsewhereIsNoTextColumn() {
        assertFalse(RowEndSlots.isTextColumn(DETAILS, THUMBNAILS, MENU, AVATARS));
        assertFalse(RowEndSlots.isTextColumn(DETAILS, 0, MENU, AVATARS));
    }

    @Test public void theCheckSitsInFrontOfTheAvatarsOnlyWhenThereAreSome() {
        assertEquals(AVATARS, RowEndSlots.anchor(MENU, AVATARS, true));
        assertEquals(MENU, RowEndSlots.anchor(MENU, AVATARS, false));
        assertEquals(MENU, RowEndSlots.anchor(MENU, 0, true));
    }
}
