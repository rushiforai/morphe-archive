/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-11.
 * Written by lavinhoque33, 2026-11-05.
 */
package app.morphe.extension.youtube.patches.general.offline;

import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class OfflinePickerLayoutTest {
    @Test public void portraitUsesScreenFraction() {
        assertEquals(1100, OfflinePickerLayout.scrollCap(2000, 1800, 150, 16, 120));
    }

    @Test public void landscapeReservesTheWholeFooter() {
        assertEquals(204, OfflinePickerLayout.scrollCap(700, 400, 180, 16, 120));
    }

    @Test public void largeFontNeverLetsTheFloorClipTheFooter() {
        assertEquals(34, OfflinePickerLayout.scrollCap(700, 350, 300, 16, 120));
        assertEquals(0, OfflinePickerLayout.scrollCap(700, 200, 300, 16, 120));
    }

    @Test public void portraitShowsAllOptionsWhenOnePlaylistRowFits() {
        assertEquals(420, OfflinePickerLayout.playlistOptionsHeight(900, 160, 420, 120));
    }

    @Test public void longOptionsScrollWithoutRemovingThePlaylistRow() {
        assertEquals(620, OfflinePickerLayout.playlistOptionsHeight(900, 160, 800, 120));
    }

    @Test public void landscapeSharesConstrainedSpaceWithoutClippingFixedActions() {
        assertEquals(120, OfflinePickerLayout.playlistOptionsHeight(400, 160, 420, 180));
    }

    @Test public void enlargedFixedActionsNeverProduceNegativeViewports() {
        assertEquals(30, OfflinePickerLayout.playlistOptionsHeight(400, 340, 600, 220));
        assertEquals(0, OfflinePickerLayout.playlistOptionsHeight(400, 440, 600, 220));
    }
}
