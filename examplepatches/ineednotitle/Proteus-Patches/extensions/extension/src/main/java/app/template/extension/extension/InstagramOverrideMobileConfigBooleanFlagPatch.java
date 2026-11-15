/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * Adapted from https://github.com/brosssh/instagram-morphe-patches-library
 * (GPL-3.0). See META-INF/PROTEUS-NOTICE.txt for GPLv3 §7(b) terms.
 */

package app.template.extension.extension;

import java.util.HashMap;
import java.util.Map;

@SuppressWarnings("unused")
public final class InstagramOverrideMobileConfigBooleanFlagPatch {
    private static final String SENTINEL = "BOGUS";
    public static final Map<String, Boolean> OVERRIDES;

    // Populated at patch time; the sentinel entry keeps <clinit> registers allocated.
    static {
        OVERRIDES = new HashMap<>();
        OVERRIDES.put(SENTINEL, true);
    }

    private InstagramOverrideMobileConfigBooleanFlagPatch() {
    }

    public static long getMobileConfigFlagId(long mobileConfigSpecifier) {
        long shifted = mobileConfigSpecifier >>> 16;
        boolean flag = ((mobileConfigSpecifier >>> 62) & 1L) == 1L;
        return flag ? (shifted & 0xffffL) : (shifted & 0xfffL);
    }

    /**
     * Injection point.
     */
    public static Boolean overrideBooleanFlag(
            long mobileConfigSpecifier,
            String mobileConfigCategoryId,
            String mobileConfigFlagId
    ) {
        String configId = mobileConfigCategoryId + "::" + mobileConfigFlagId;
        if (SENTINEL.equals(configId)) {
            return null;
        }
        // Only patch-enabled flags may be toggled at runtime. A patch that did
        // not add a static override must not start enabling unrelated flags
        // just because the override hook is linked.
        Boolean runtimeOverride = OVERRIDES.containsKey(configId)
                ? InstagramRuntimeFlags.overrideMobileConfig(configId)
                : null;
        if (runtimeOverride != null) {
            return runtimeOverride;
        }
        return OVERRIDES.get(configId);
    }
}
