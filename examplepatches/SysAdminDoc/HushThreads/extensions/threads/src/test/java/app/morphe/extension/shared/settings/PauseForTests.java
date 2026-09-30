/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.shared.settings;

/**
 * Pauses and resumes the process for a test in another package. {@link HushThreadsPause} keeps
 * its test hooks package-private, and the hooks a pause has to reach live in the Threads packages.
 */
public final class PauseForTests {
    private PauseForTests() {
    }

    public static void pause(HushThreadsPause.Reason why) {
        HushThreadsPause.pauseForTests(why);
    }

    public static void resume() {
        HushThreadsPause.pauseForTests(HushThreadsPause.Reason.NONE);
    }

    /** Runs [probe] inside the next first-of-process pause decision, or nothing when null. */
    public static void whileDeciding(Runnable probe) {
        HushThreadsPause.whileDecidingForTests = probe;
    }
}
