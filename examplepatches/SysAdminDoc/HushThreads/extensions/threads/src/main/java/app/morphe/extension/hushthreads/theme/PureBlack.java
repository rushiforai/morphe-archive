/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.extension.hushthreads.theme;

import app.morphe.extension.hushthreads.settings.FamilyNames;
import app.morphe.extension.hushthreads.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.Setting;

/**
 * Pure black dark mode.
 *
 * <p>Threads draws its screens in Compose from colors its theme builds for dark or light mode. In
 * dark mode the background behind the feed, a post and a profile is #101010, and every way the
 * theme builds its dark colors loads that gray. The hooks sit where it's loaded for dark mode. With
 * the switch on, the gray comes back as #000000. Off, paused or before the settings are ready,
 * Threads' own gray goes back. Light mode never asks, and menus and sheets keep their own grays.
 * Threads builds these colors once a start, so a change shows after a restart.
 */
public final class PureBlack {
    /** Black as an ARGB color, the form Threads' theme loads before it makes a Compose color. */
    static final long BLACK_ARGB = 0xff000000L;
    /** Black as a Compose color: its ARGB in the top half, sRGB's color space (0) in the bottom. */
    static final long BLACK_COLOR = BLACK_ARGB << 32;
    static final String BLACKENED = "made a dark background black";
    /** Prefix for a refusal's count label; one label per fixed reason from offBecause(). */
    static final String LEFT_TO_THREADS = "left the dark gray to Threads: ";
    /** The outcome last logged, so a log line marks a change. */
    private static volatile String lastLogged;

    private PureBlack() { }

    /** Called with the dark background as Threads' theme loads it, an ARGB color. */
    public static long argb(long threads) {
        return blacken() ? BLACK_ARGB : threads;
    }

    /** Called with the dark background as a Compose color, just before it goes into the dark colors. */
    public static long color(long threads) {
        return blacken() ? BLACK_COLOR : threads;
    }

    /** Whether the gray turns black now. A failure answers no, leaving Threads' gray as it would be unpatched. */
    private static boolean blacken() {
        try {
            HookStatus.invoked(FamilyNames.PURE_BLACK);
            String off = offBecause();
            HookStatus.counted(FamilyNames.PURE_BLACK, off == null ? BLACKENED : LEFT_TO_THREADS + off);
            String outcome = off == null ? "dark mode backgrounds are black" : "Threads keeps its dark gray, " + off;
            if (!outcome.equals(lastLogged)) {
                lastLogged = outcome;
                Logger.printDebug(() -> "Pure black: " + outcome);
            }
            return off == null;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.PURE_BLACK, "dark background", failure);
            return false;
        }
    }

    /** Why the switch doesn't apply now, or null when it's on. Reads no setting before they're ready. */
    private static String offBecause() {
        if (!Utils.settingsReady()) return "settings not ready";
        if (!Settings.PURE_BLACK.get()) return Setting.isPaused() ? "HushThreads paused" : "switch off";
        return null;
    }
}
