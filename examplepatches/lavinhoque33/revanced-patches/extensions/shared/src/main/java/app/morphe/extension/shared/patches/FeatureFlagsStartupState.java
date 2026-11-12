/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-10.
 */
package app.morphe.extension.shared.patches;

/** Pure policy for two unconfirmed guarded starts followed by a recovery start. */
public final class FeatureFlagsStartupState {
    public enum Start {
        INACTIVE(0, false),
        FIRST(1, false),
        SECOND(2, false),
        RECOVER(0, true);

        public final int unconfirmedStarts;
        public final boolean resetOverrides;

        Start(int unconfirmedStarts, boolean resetOverrides) {
            this.unconfirmedStarts = unconfirmedStarts;
            this.resetOverrides = resetOverrides;
        }

        public Start confirmed() {
            return INACTIVE;
        }
    }

    private FeatureFlagsStartupState() {}

    public static Start begin(int previousUnconfirmedStarts, boolean overridesActive) {
        if (!overridesActive) return Start.INACTIVE;
        if (previousUnconfirmedStarts >= Start.SECOND.unconfirmedStarts) return Start.RECOVER;
        return previousUnconfirmedStarts <= 0 ? Start.FIRST : Start.SECOND;
    }
}
