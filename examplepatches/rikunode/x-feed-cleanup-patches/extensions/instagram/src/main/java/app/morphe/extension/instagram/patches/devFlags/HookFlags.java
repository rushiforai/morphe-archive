/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.patches.devFlags;

import java.util.Arrays;

/**
 * Overrides for the app's boolean mobile config flags.
 *
 * {@link #handleBoolFlags} runs at the top of the app's boolean flag getter, which the app calls
 * on every thread, constantly. It therefore allocates nothing and uses no reflection: overrides
 * sit in primitive arrays, the universal id comes from the app's own helper (see
 * {@link #universalId}), and the answer is one of the two shared Boolean instances.
 *
 * Overrides are added only from this class's static initialiser, where the patches that need
 * them insert a call to the matching method (addFlags), so the arrays never change once the
 * class is visible to other threads.
 */
public final class HookFlags {
    /** Configs overridden as a whole: every flag of the config takes the value. */
    private static int[] configUniversalIds = new int[0];
    private static boolean[] configValues = new boolean[0];

    /** Single flags, keyed by (universal id << 32) | flag id. */
    private static long[] flagKeys = new long[0];
    private static boolean[] flagValues = new boolean[0];

    private HookFlags() {
    }

    /** Flags that let the download row show in the post overflow menu. */
    private static void simpleOverflowMenuFlags() {
        overrideConfig(104772, false); // ig_ini
        overrideFlag(117613, 0, true); // ig_overflow_menu_icon::use_more_lines_icon
        overrideConfig(100002, true); // ig_igds_android_prism_overflow_sheet
    }

    private static void overrideConfig(int universalId, boolean value) {
        configUniversalIds = Arrays.copyOf(configUniversalIds, configUniversalIds.length + 1);
        configValues = Arrays.copyOf(configValues, configValues.length + 1);
        configUniversalIds[configUniversalIds.length - 1] = universalId;
        configValues[configValues.length - 1] = value;
    }

    private static void overrideFlag(int universalId, int flagId, boolean value) {
        flagKeys = Arrays.copyOf(flagKeys, flagKeys.length + 1);
        flagValues = Arrays.copyOf(flagValues, flagValues.length + 1);
        flagKeys[flagKeys.length - 1] = key(universalId, flagId);
        flagValues[flagValues.length - 1] = value;
    }

    private static long key(int universalId, long flagId) {
        return ((long) universalId << 32) | flagId;
    }

    /**
     * The app's specifier -> universal id helper. The patch replaces this body with a direct call
     * to it; the body here only has to compile.
     */
    private static int universalId(long specifier) {
        int unresolved = 0;
        return unresolved;
    }

    /** The flag's id within its config, packed into the specifier as the app packs it. */
    private static long flagId(long specifier) {
        long shifted = specifier >>> 16;
        boolean wide = ((specifier >>> 62) & 1L) == 1L;
        return wide ? (shifted & 0xffff) : (shifted & 0xfff);
    }

    /**
     * @return The overridden value of the flag, or null to let the app read it as usual.
     */
    public static Boolean handleBoolFlags(long specifier) {
        int[] configs = configUniversalIds;
        long[] flags = flagKeys;
        if (configs.length == 0 && flags.length == 0) return null;

        int universalId = universalId(specifier);
        for (int i = 0; i < configs.length; i++) {
            if (configs[i] == universalId) return configValues[i] ? Boolean.TRUE : Boolean.FALSE;
        }

        long key = key(universalId, flagId(specifier));
        for (int i = 0; i < flags.length; i++) {
            if (flags[i] == key) return flagValues[i] ? Boolean.TRUE : Boolean.FALSE;
        }
        return null;
    }
}
