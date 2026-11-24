/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Modified by lavinhoque33, 2026-11-24.
 * Written by lavinhoque33, 2026-11-20.
 */
package app.morphe.extension.youtube.patches.player;

import app.morphe.extension.youtube.settings.Settings;

public final class DoubleTapSeekPatch {
    private static final int FORWARD = 1;
    private static final int BACKWARD = 2;
    // Keep even the largest custom step representable as a signed millisecond offset.
    private static final int MAX_SEEK_SECONDS = Integer.MAX_VALUE / 1_000;

    private DoubleTapSeekPatch() {
    }

    /** Signed seconds for the built-in player, which has no native duration object. */
    public static int getOfflineSeconds(boolean forward) {
        int configured = forward ? Settings.DOUBLE_TAP_SEEK_FORWARD.get() : Settings.DOUBLE_TAP_SEEK_BACKWARD.get();
        return offlineSeconds(forward, configured);
    }

    public static int offlineSeconds(boolean forward, int configured) {
        int override = signedOverrideSeconds(forward, configured);
        return override != 0 ? override : forward ? 10 : -10;
    }

    /** Injection point: signed seconds, or zero to keep the original YouTube duration object. */
    public static int getOverrideSeconds(int direction) {
        return switch (direction) {
            case FORWARD -> signedOverrideSeconds(true, Settings.DOUBLE_TAP_SEEK_FORWARD.get());
            case BACKWARD -> signedOverrideSeconds(false, Settings.DOUBLE_TAP_SEEK_BACKWARD.get());
            default -> 0;
        };
    }

    private static int signedOverrideSeconds(boolean forward, int seconds) {
        if (seconds <= 0 || seconds > MAX_SEEK_SECONDS) {
            return 0;
        }

        return forward ? seconds : -seconds;
    }
}
