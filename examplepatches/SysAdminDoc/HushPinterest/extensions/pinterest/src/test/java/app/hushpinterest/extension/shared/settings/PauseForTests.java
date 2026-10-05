/*
 * Forked from https://github.com/SysAdminDoc/HushTelegram at 8c54a1d (GPL-3.0),
 * modified for HushPinterest (Pinterest), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.hushpinterest.extension.shared.settings;

/**
 * Pauses and resumes the process for a test in another package. {@link HushPinterestPause} keeps
 * its test hooks package-private, and the hooks a pause has to reach live in the Pinterest packages.
 */
public final class PauseForTests {
    private PauseForTests() {
    }

    public static void pause(HushPinterestPause.Reason why) {
        HushPinterestPause.pauseForTests(why);
    }

    public static void resume() {
        HushPinterestPause.pauseForTests(HushPinterestPause.Reason.NONE);
    }

    /** Runs [probe] inside the next first-of-process pause decision, or nothing when null. */
    public static void whileDeciding(Runnable probe) {
        HushPinterestPause.whileDecidingForTests = probe;
    }
}
