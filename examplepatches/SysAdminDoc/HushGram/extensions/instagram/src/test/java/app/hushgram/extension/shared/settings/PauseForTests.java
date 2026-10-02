/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.shared.settings;

/**
 * Pauses and resumes the process for a test in another package. {@link HushgramPause} keeps
 * its test hooks package-private, and the hooks a pause has to reach live in the Instagram packages.
 */
public final class PauseForTests {
    private PauseForTests() {
    }

    public static void pause(HushgramPause.Reason why) {
        HushgramPause.pauseForTests(why);
    }

    public static void resume() {
        HushgramPause.pauseForTests(HushgramPause.Reason.NONE);
    }

    /** Runs [probe] inside the next first-of-process pause decision, or nothing when null. */
    public static void whileDeciding(Runnable probe) {
        HushgramPause.whileDecidingForTests = probe;
    }
}
