/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.reels;

/** Hands the reel loop hook a reel's end, for tests in any package. */
public final class ReelLoopForTests {
    private ReelLoopForTests() {
    }

    /**
     * A reel reaches its end and its settings ask for a loop. True when the hook said no, which is
     * the switch changing what Facebook would have done.
     */
    public static boolean stopsAReel() {
        ReelLoop.reelForTests = params -> true;
        try {
            return !ReelLoop.loops(true, new Object());
        } finally {
            ReelLoop.forgetForTests();
        }
    }
}
