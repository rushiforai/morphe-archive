/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.extension.hushthreads.feed;

import app.morphe.extension.hushthreads.settings.FamilyNames;
import app.morphe.extension.hushthreads.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.Setting;

/**
 * Whether a video in a feed post plays by itself.
 *
 * <p>A post in a feed, a profile or a thread hands its video to Threads' PostVideo composable with
 * a flag saying whether it's the video Threads picked to play now. The hook sits on that flag. With
 * the switch on, the picked video stays on its cover frame and gets no player, the same as a video
 * scrolled out of view. Tapping it opens Threads' full-screen viewer, which plays it and never asks
 * here. Off, paused or before the settings are ready, Threads' own answer goes back unchanged.
 */
public final class VideoAutoplay {
    static final String HELD = "held a video for a tap";
    /** Prefix for a refusal's count label; one label per fixed reason from offBecause(). */
    static final String LEFT_TO_THREADS = "left autoplay to Threads: ";
    /** The outcome last logged. Threads asks every time a feed post's video recomposes, so a log line marks a change. */
    private static volatile String lastLogged;

    private VideoAutoplay() { }

    /**
     * Called with whether a feed post's video is the one Threads picked to play, just before the post
     * hands it to PostVideo. Only a pick is a question: false stays false, uncounted. A failure hands
     * back Threads' answer, as it would be unpatched.
     */
    public static boolean play(boolean threads) {
        if (!threads) return false;
        try {
            HookStatus.invoked(FamilyNames.VIDEO_AUTOPLAY);
            String off = offBecause();
            HookStatus.counted(FamilyNames.VIDEO_AUTOPLAY, off == null ? HELD : LEFT_TO_THREADS + off);
            String outcome = off == null ? "videos in feed posts wait for a tap" : "Threads plays videos in feed posts itself, " + off;
            if (!outcome.equals(lastLogged)) {
                lastLogged = outcome;
                Logger.printDebug(() -> "Video autoplay: " + outcome);
            }
            return off != null;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.VIDEO_AUTOPLAY, "feed post video", failure);
            return true;
        }
    }

    /** Why the switch doesn't apply now, or null when it's on. Reads no setting before they're ready. */
    private static String offBecause() {
        if (!Utils.settingsReady()) return "settings not ready";
        if (!Settings.DISABLE_VIDEO_AUTOPLAY.get()) return Setting.isPaused() ? "HushThreads paused" : "switch off";
        return null;
    }
}
