/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.reels;

import android.view.Window;

/** Lets tests in other packages put Burn-in guard's watcher on a window, and take it away after. */
public final class BurnInGuardForTests {
    private BurnInGuardForTests() {
    }

    public static void watch(Window window) {
        BurnInGuard.watchForTests(window);
    }

    public static void reset() {
        BurnInGuard.resetForTests();
    }
}
