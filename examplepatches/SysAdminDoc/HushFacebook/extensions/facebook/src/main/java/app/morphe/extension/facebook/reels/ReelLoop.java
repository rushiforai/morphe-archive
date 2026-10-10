/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.reels;

import androidx.annotation.Nullable;

import java.util.function.Predicate;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Plays each reel once, for Clean up Reels.
 *
 * <p>When a video reaches its end, Facebook's player reads whether the video's settings ask for a
 * loop, and with a yes it goes back to the start and plays again. Reels ask for one. Without it the
 * player finishes the video the way it does any other: it tells the screen the video completed, and
 * the video stays on its last frame. The patch hands that read here with the video's settings.
 *
 * <p>With the switch on, a reel's yes becomes a no, so the reel stops at its end. A tap plays it
 * again, once, and a swipe moves on. Everything that isn't a reel, feed videos and stories among
 * them, keeps Facebook's answer. Off, paused, before the settings are ready, or when anything here
 * fails, the answer is Facebook's own.
 */
public final class ReelLoop {
    /** Counted under the patch's name each time a reel stops at its end instead of starting over. */
    static final String PLAYED_ONCE = "Reel played once";

    private static final String FAMILY = FamilyNames.REEL_DECLUTTER;

    /** Stands in for {@link #fbShorts} when a test sets it. */
    @Nullable
    static volatile Predicate<Object> reelForTests;

    private static volatile boolean logged;

    private ReelLoop() {
    }

    /**
     * Injection point, right after Facebook's player reads, at a video's end, whether the video's
     * settings ask for a loop. False lets the video finish there. Never throws.
     *
     * @param facebook what the settings asked for.
     * @param params   the video's settings, Facebook's VideoPlayerParams.
     */
    public static boolean loops(boolean facebook, @Nullable Object params) {
        try {
            HookStatus.invoked(FAMILY);
            // Settings mustn't load before the extension has its context.
            if (!facebook || params == null || !Utils.settingsReady() || !Settings.PLAY_REELS_ONCE.get()) return facebook;
            HookStatus.bound(FAMILY, "reel loop");
            if (!isReel(params)) return facebook;
            HookStatus.counted(FAMILY, PLAYED_ONCE);
            logOnce();
            return false;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "reel loop", failure);
            return facebook;
        }
    }

    /** Whether [params] are a reel's. */
    static boolean isReel(Object params) {
        Predicate<Object> forced = reelForTests;
        return forced != null ? forced.test(params) : fbShorts(params);
    }

    /** Filled in by the patch: the field VideoPlayerParams' debug dump reports as isFbShorts. Only params may be passed. */
    public static boolean fbShorts(Object params) {
        return false;
    }

    private static void logOnce() {
        if (logged) return;
        logged = true;
        Logger.printDebug(() -> "Clean up Reels: a reel stopped at its end instead of starting over");
    }

    /** Forgets the one-time log line and any stand-in reel check. Tests only. */
    static void forgetForTests() {
        logged = false;
        reelForTests = null;
    }
}
