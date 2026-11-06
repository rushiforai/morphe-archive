/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-06.
 *
 * Layout choices ported from Morphe, Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 * See NOTICE for GPLv3 Section 7 terms that apply to Morphe contributions.
 */
package app.morphe.extension.youtube.patches.player;

public enum VideoActionBarLayout {
    DEFAULT,
    CLASSIC,
    CLASSIC_TWO_ROWS,
    MINIMAL;

    public boolean isClassic() {
        return this == CLASSIC || this == CLASSIC_TWO_ROWS;
    }

    public boolean usesSegmentedCounts(boolean serverHasSegmentedButton) {
        return isClassic() || (this != MINIMAL && serverHasSegmentedButton);
    }

    public VideoActionBarLayout effective(boolean tablet, boolean disableLayoutUpdates) {
        return tablet || disableLayoutUpdates ? DEFAULT : this;
    }

    public static VideoActionBarLayout migrate(boolean restoreOldActionBar, boolean tabletLayoutInPlayer) {
        return tabletLayoutInPlayer ? CLASSIC_TWO_ROWS : restoreOldActionBar ? CLASSIC : DEFAULT;
    }
}
