/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.extension.hushthreads.settings;

/**
 * Says which ways into the settings this test's build has. The settings patch answers that in a
 * real build, and the extension as it ships answers no for both, so tests start from a full build.
 */
public final class WaysInForTests {
    private WaysInForTests() {
    }

    /** Whether the build has the row in Threads' settings and the long press on the logo, or null to take the stubs' answers. */
    public static void set(Boolean row, Boolean logo) {
        ThreadsSettingsRow.inBuildForTests = row;
        ThreadsLogo.inBuildForTests = logo;
    }
}
