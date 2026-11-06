/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
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
}
