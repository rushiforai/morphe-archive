/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 *
 * Modified for HushGram (Instagram), 2026.
 */
package app.hushgram.extension.instagram.media;

import android.os.SystemClock;
import android.view.MotionEvent;

/** What tests outside this package need of Tap to play: a tap and a clean start. */
public final class TapToPlayForTests {
    private TapToPlayForTests() { }

    /** A tap that ended [msAgo] milliseconds before now on the clock the players' starts read. */
    public static void tapEnded(long msAgo) {
        long up = SystemClock.uptimeMillis() - msAgo;
        TapClock.record(MotionEvent.ACTION_DOWN, 100, 100, up - 60, 8);
        TapClock.record(MotionEvent.ACTION_UP, 102, 101, up, 8);
    }

    /** Forgets every tap, armed player and log count. */
    public static void forget() {
        TapClock.forget();
        TapClock.slopForTests = -1;
        TapToPlay.forget();
    }
}
