/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.privacy;

import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.PatchFamily;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;

/**
 * Filters what Google's advertising ID info object hands to every reader in the app. While the
 * switch is on, readers get the answer Android gives after you delete your ad ID: all zeros, with
 * ad tracking limited.
 */
public final class AdvertisingId {
    private AdvertisingId() {}

    static final String ZERO = "00000000-0000-0000-0000-000000000000";

    private static boolean active() {
        try {
            return Utils.settingsReady() && PatchFamily.HIDE_ADVERTISING_ID.inBuild() && Settings.HIDE_ADVERTISING_ID.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_ADVERTISING_ID, "switch read", failure);
            return false;
        }
    }

    /** Placed before the ID getter's return. */
    public static String id(String original) {
        HookStatus.invoked(FamilyNames.HIDE_ADVERTISING_ID);
        if (!active()) return original;
        HookStatus.counted(FamilyNames.HIDE_ADVERTISING_ID, "advertising ID read");
        return ZERO;
    }

    /** Placed before the limit-tracking getter's return. */
    public static boolean limitTracking(boolean original) {
        HookStatus.invoked(FamilyNames.HIDE_ADVERTISING_ID);
        if (!active()) return original;
        HookStatus.counted(FamilyNames.HIDE_ADVERTISING_ID, "ad tracking limit read");
        return true;
    }
}
