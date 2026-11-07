/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-06.
 */
package app.morphe.extension.youtube.patches.general;

/** Pending dialog values are independent of slider thumb positions and saved preferences. */
public final class GlassNavigationBarSizeValues {
    private GlassNavigationBarSizeValues() {
    }

    /** The dialog supplies one default per pending value; the defaults themselves are never modified. */
    public static void resetPending(int[] pending, int[] defaults) {
        System.arraycopy(defaults, 0, pending, 0, pending.length);
    }
}
