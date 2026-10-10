/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.settings;

import java.util.Arrays;
import java.util.EnumSet;

/** Lets a test outside this package say which patches the build carries. */
public final class PatchFamilyForTests {
    private PatchFamilyForTests() {
    }

    /** The build carries exactly [families] until {@link #reset}. */
    public static void carry(PatchFamily... families) {
        PatchFamily.inBuildForTests = families.length == 0
                ? EnumSet.noneOf(PatchFamily.class) : EnumSet.copyOf(Arrays.asList(families));
    }

    /** Families are asked of SettingsStatus again. */
    public static void reset() {
        PatchFamily.inBuildForTests = null;
    }
}
