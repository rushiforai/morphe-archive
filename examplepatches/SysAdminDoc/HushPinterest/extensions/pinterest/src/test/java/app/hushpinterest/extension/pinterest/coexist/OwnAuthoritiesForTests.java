/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.coexist;

/** Lets a test outside this package say which package the app runs as. */
public final class OwnAuthoritiesForTests {
    private OwnAuthoritiesForTests() {}

    /** The package to answer as running, or null to read the process name again. */
    public static void running(String packageName) {
        OwnAuthorities.runningPackage = packageName;
    }
}
