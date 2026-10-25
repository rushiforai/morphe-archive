/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.library.extension.instagram.patches;

import java.util.HashMap;
import java.util.Map;

import app.morphe.extension.shared.Logger;

@SuppressWarnings("unused")
public final class OverrideMobileConfigBooleanFlagPatch {
    private static final Map<String, Boolean> OVERRIDES;

    // Populated at patch time
    // The BOGUS key is there just to expand the static clinit registers count (can't clone)
    static {
        OVERRIDES = new HashMap<>();

        OVERRIDES.put("BOGUS", true);
    }

    public static long getMobileConfigFlagId(long mobileConfigSpecifier) {
        long shifted = mobileConfigSpecifier >>> 16;
        boolean flag = ((mobileConfigSpecifier >>> 62) & 1L) == 1L;
        return flag ? (shifted & 0xffff) : (shifted & 0xfff);
    }

    // Injection point
    public static Boolean overrideBooleanFlag(
            long mobileConfigSpecifier,
            String mobileConfigCategoryId,
            String mobileConfigFlagId
    ) {
        String configId = mobileConfigCategoryId + "::" + mobileConfigFlagId;
        //Logger.printInfo(() -> "Overriding experiment flag " + mobileConfigSpecifier + " (" + configId + ")");

        Boolean override = OVERRIDES.getOrDefault(configId, null);
        if (override != null) {
            Logger.printInfo(() -> "Overriding flag " + configId + " -> " + override + ". Original config: " + mobileConfigSpecifier);
        }

        return override;
    }
}
