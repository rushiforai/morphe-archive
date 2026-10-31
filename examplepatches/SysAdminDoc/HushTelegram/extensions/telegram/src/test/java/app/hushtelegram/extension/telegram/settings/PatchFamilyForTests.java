/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.settings;

import java.util.Arrays;
import java.util.EnumSet;
import java.util.Set;
import java.util.function.BooleanSupplier;

/** Lets tests outside this package say which families the build carries. */
public final class PatchFamilyForTests {
    private PatchFamilyForTests() {}

    public static void inBuild(PatchFamily... families) {
        PatchFamily.inBuildForTests = families.length == 0 ? EnumSet.noneOf(PatchFamily.class)
                : EnumSet.copyOf(Arrays.asList(families));
    }

    public static void reset() {
        PatchFamily.inBuildForTests = null;
    }

    /** Which capabilities the build says are installed, until {@link #resetCapabilities()}. */
    public static void installed(PatchFamily.Capability... capabilities) {
        PatchFamily.capabilitiesForTests = capabilities.length == 0 ? EnumSet.noneOf(PatchFamily.Capability.class)
                : EnumSet.copyOf(Arrays.asList(capabilities));
    }

    public static void resetCapabilities() {
        PatchFamily.capabilitiesForTests = null;
    }

    /** Runs the body with this family in the build as well, then puts back what was there. */
    public static boolean alsoInBuild(PatchFamily family, BooleanSupplier body) {
        Set<PatchFamily> saved = PatchFamily.inBuildForTests;
        Set<PatchFamily> now = EnumSet.of(family);
        if (saved != null) now.addAll(saved);
        PatchFamily.inBuildForTests = now;
        try {
            return body.getAsBoolean();
        } finally {
            PatchFamily.inBuildForTests = saved;
        }
    }
}
