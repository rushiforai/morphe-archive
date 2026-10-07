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
 * Which size of a photo Threads loads.
 *
 * <p>The server sends each photo in several sizes, and Threads picks one with a single chooser: the
 * size whose width comes closest to a target, usually your screen's width capped at 1080 pixels,
 * among the sizes with the right shape (square or not). The patch hands that target to
 * {@link #targetWidth} first thing in the chooser. With the switch on, the answer is wider than any
 * photo, so the closest size is the largest one of that shape. The shape rule and Threads' fallback
 * when no size has the shape stay as they are, so a square crop is still a square crop.
 *
 * <p>Off, paused, before the settings are ready, or a failure in here, and Threads' own target goes
 * back unchanged.
 */
public final class ImageQuality {
    /** Wider than any photo Threads is sent, and small enough that Threads' own sum of it can't overflow. */
    static final int WIDEST = 1 << 24;
    static final String LARGEST = "asked for the largest photo";
    /** Prefix for a refusal's count label; one label per fixed reason from offBecause(). */
    static final String LEFT_TO_THREADS = "left photo size to Threads: ";
    /** The outcome last logged. Threads asks for every photo it shows, so a log line marks a change. */
    private static volatile String lastLogged;

    private ImageQuality() { }

    /**
     * First thing in Threads' photo size chooser, with the width Threads aims for. Answers a width no
     * photo reaches while the switch is on, so the largest size wins, and Threads' own width
     * otherwise. Never throws.
     */
    public static int targetWidth(int threads) {
        try {
            HookStatus.invoked(FamilyNames.MAX_IMAGE_QUALITY);
            String off = offBecause();
            HookStatus.counted(FamilyNames.MAX_IMAGE_QUALITY, off == null ? LARGEST : LEFT_TO_THREADS + off);
            String outcome = off == null ? "Threads loads the largest photos" : "Threads picks photo sizes, " + off;
            if (!outcome.equals(lastLogged)) {
                lastLogged = outcome;
                Logger.printDebug(() -> "Image quality: " + outcome);
            }
            return off == null ? Math.max(threads, WIDEST) : threads;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MAX_IMAGE_QUALITY, "photo size", failure);
            return threads;
        }
    }

    /** Why the switch doesn't apply now, or null when it's on. Reads no setting before they're ready. */
    private static String offBecause() {
        if (!Utils.settingsReady()) return "settings not ready";
        if (!Settings.MAX_IMAGE_QUALITY.get()) return Setting.isPaused() ? "HushThreads paused" : "switch off";
        return null;
    }
}
