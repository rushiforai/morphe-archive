/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.settings;

import java.util.Set;

/** Lets a test outside this package say which capabilities the build it stands for has. */
public final class PatchFamilyForTests {
    private PatchFamilyForTests() {}

    /** The capabilities to report as installed, or null to ask the build again. */
    public static void capabilities(Set<PatchFamily.Capability> installed) {
        PatchFamily.capabilitiesForTests = installed;
    }
}
