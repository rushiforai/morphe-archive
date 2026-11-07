/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-06.
 */
package app.morphe.extension.youtube.patches.general;

import org.junit.Test;

import static org.junit.Assert.assertArrayEquals;

public class GlassNavigationBarSizeValuesTest {
    @Test public void importedNonStepHeightResetsWithoutAProgressChangedCallback() {
        int[] pending = {103, 100, 48};
        int[] defaults = {100, 100, 48};

        GlassNavigationBarSizeValues.resetPending(pending, defaults);

        assertArrayEquals(new int[]{100, 100, 48}, pending);
    }

    @Test public void resetCopiesAllDefaultsAndCanBeRepeatedAfterFurtherEdits() {
        int[] pending = {155, 55, 92};
        int[] defaults = {100, 100, 48};

        GlassNavigationBarSizeValues.resetPending(pending, defaults);
        assertArrayEquals(new int[]{100, 100, 48}, pending);

        pending[0] = 60;
        pending[1] = 50;
        pending[2] = 8;
        assertArrayEquals(new int[]{100, 100, 48}, defaults);

        GlassNavigationBarSizeValues.resetPending(pending, defaults);
        assertArrayEquals(new int[]{100, 100, 48}, pending);
    }
}
