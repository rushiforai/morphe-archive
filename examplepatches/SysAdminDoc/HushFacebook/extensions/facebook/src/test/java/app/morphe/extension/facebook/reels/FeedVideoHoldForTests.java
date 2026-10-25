/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.reels;

import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.View;

import org.robolectric.RuntimeEnvironment;

/** What tests outside this package need of Hold a feed video for 2x: a finger down, as the touch hook gets it. */
public final class FeedVideoHoldForTests {
    private FeedVideoHoldForTests() { }

    /**
     * A finger down on a window, in a build that carries Hold a reel for 2x: true when it started
     * timing a hold, which only Hold a feed video for 2x on does. Leaves nothing behind.
     */
    public static boolean startsTiming() {
        Boolean build = FeedVideoHold.inBuildForTests;
        long now = SystemClock.uptimeMillis();
        MotionEvent down = MotionEvent.obtain(now, now, MotionEvent.ACTION_DOWN, 10f, 10f, 0);
        try {
            FeedVideoHold.inBuildForTests = true;
            FeedVideoHold.touch(new View(RuntimeEnvironment.getApplication()), down);
            return FeedVideoHold.timingForTests();
        } finally {
            down.recycle();
            FeedVideoHold.reset();
            FeedVideoHold.inBuildForTests = build;
        }
    }
}
