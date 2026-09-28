package com.travianpatch.notifier;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;

/**
 * Whether the game itself is on screen. This code runs inside the game's own app, so it sees the game's
 * screen open and close. While the player is in the game (and for a short while after), the background
 * check sends nothing: the game is already talking to its server, a second client at the same moment
 * stands out, and an automatic village switch could redirect the player's own next tap.
 */
final class GameScreen {

    /** After the game leaves the screen, background checks wait this long. */
    static final long AFTER_LEAVING_MS = 2 * 60_000L;

    private static volatile boolean onScreen = false;
    private static volatile long leftAtMs = 0;
    private static boolean watching = false;

    private GameScreen() {
    }

    /** Starts watching the game's own screen (the Activity the patch hooks). Safe to call more than once. */
    static synchronized void watch(final Activity game) {
        if (watching) {
            return;
        }
        watching = true;
        final Class<?> gameClass = game.getClass();
        onScreen = true; // called from its onCreate: it is about to show
        game.getApplication().registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            @Override
            public void onActivityResumed(Activity a) {
                if (a.getClass() == gameClass) {
                    onScreen = true;
                }
            }

            @Override
            public void onActivityPaused(Activity a) {
                if (a.getClass() == gameClass) {
                    onScreen = false;
                    leftAtMs = System.currentTimeMillis();
                }
            }

            @Override
            public void onActivityCreated(Activity a, Bundle b) {
            }

            @Override
            public void onActivityStarted(Activity a) {
            }

            @Override
            public void onActivityStopped(Activity a) {
            }

            @Override
            public void onActivitySaveInstanceState(Activity a, Bundle b) {
            }

            @Override
            public void onActivityDestroyed(Activity a) {
                if (a.getClass() == gameClass) {
                    onScreen = false;
                    leftAtMs = System.currentTimeMillis();
                }
            }
        });
    }

    /** True while the game is on screen or left it less than AFTER_LEAVING_MS ago. */
    static boolean busy(long nowMs) {
        return onScreen || (leftAtMs > 0 && nowMs - leftAtMs < AFTER_LEAVING_MS);
    }

    /** How long until busy() turns false (0 when it already is, or the game is still on screen). */
    static long msUntilFree(long nowMs) {
        if (onScreen || leftAtMs <= 0) {
            return 0;
        }
        return Math.max(0, leftAtMs + AFTER_LEAVING_MS - nowMs);
    }
}
