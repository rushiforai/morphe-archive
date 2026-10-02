/*
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.hushtelegram.extension.telegram.settings;

import org.robolectric.shadows.ShadowLooper;

import java.util.concurrent.TimeUnit;

import app.hushtelegram.extension.shared.Utils;

/** The release check as other tests drive it: no network, and nothing left behind for the next test. */
final class ReleaseCheckForTests {
    private ReleaseCheckForTests() {
    }

    /**
     * A Telegram start, a day after the last try so one is due: true when it asked GitHub. The
     * GitHub is a fake that answers with the running release, and it's taken away again after.
     */
    static boolean aStartAsksGitHub() {
        FakeGitHub github = new FakeGitHub().always(FakeGitHub.Reply.release("v0.1.8", null));
        ReleaseCheck.Transport before = ReleaseCheck.transport;
        ReleaseCheck.transport = github;
        try {
            long last = ReleaseCheck.Stored.CHECKED_AT.savedValue();
            ReleaseCheck.onTelegramStart(Math.max(System.currentTimeMillis(), last) + TimeUnit.DAYS.toMillis(2));
            settle();
            return !github.asked.isEmpty();
        } finally {
            ReleaseCheck.transport = before;
        }
    }

    /** Every try on its way has ended and told the main thread. */
    static void settle() {
        try {
            for (int round = 0; round < 3; round++) {
                Utils.awaitBackgroundTasksForTests();
                ShadowLooper.idleMainLooper();
            }
        } catch (Exception failure) {
            throw new AssertionError(failure);
        }
    }

    /** What the last try found, gone, as on a phone that never checked. */
    static void forget() {
        settle();
        ReleaseCheck.Stored.CHECKED_AT.resetToDefault();
        ReleaseCheck.Stored.RESULT.resetToDefault();
        ReleaseCheck.Stored.NEWEST.resetToDefault();
        ReleaseCheck.Stored.TARGET.resetToDefault();
    }
}
