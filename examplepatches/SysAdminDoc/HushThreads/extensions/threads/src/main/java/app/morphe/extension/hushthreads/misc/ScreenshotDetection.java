/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.extension.hushthreads.misc;

import android.app.Activity;

import androidx.annotation.RequiresApi;

import java.util.concurrent.Executor;

import app.morphe.extension.hushthreads.settings.FamilyNames;
import app.morphe.extension.hushthreads.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.Setting;

/**
 * What the Disable screenshot detection patch asks before Threads learns you took a screenshot.
 *
 * <p>Threads finds out three ways, and it runs one of two detectors for the first two. One watches
 * the phone's photo library and looks up each new picture to see whether it's a screenshot. The
 * other watches the screenshot folders and reports each new file it can read a screenshot's date
 * from. The patch asks {@link #ignoresChange} first thing in the library watcher and
 * {@link #ignoresScreenshotFile} first thing in the folder watcher's report, so on a yes the new
 * picture is never looked at and nothing in Threads hears of it. On Android 14 and newer the feed
 * also asks Android to say when a screenshot is taken of it; that request comes here
 * ({@link #registerScreenCaptureCallback}) and isn't made while the switch is on. Taking back a
 * request Android never got is harmless, so Threads' own cleanup stays as it is.
 *
 * <p>Off, paused, before the settings are ready, or a failure in here, and Threads watches as it
 * would have.
 */
public final class ScreenshotDetection {
    static final String IGNORED = "kept a screenshot from Threads";
    /** Prefix for a refusal's count label; one label per fixed reason from offBecause(). */
    static final String LEFT_TO_THREADS = "left screenshots to Threads: ";
    /** The outcome last logged, so a log line marks a change. */
    private static volatile String lastLogged;

    private ScreenshotDetection() { }

    /**
     * First thing in the photo library watcher's onChange. True returns before Threads looks up the
     * new picture. Never throws.
     */
    public static boolean ignoresChange() {
        return blocks("photo library change");
    }

    /**
     * First thing in the screenshot folder watcher's report of a new file. True returns before
     * Threads reads the file's name or tells anything about it. Never throws.
     */
    public static boolean ignoresScreenshotFile() {
        return blocks("screenshot folder file");
    }

    /** In place of each of Threads' {@code Activity.registerScreenCaptureCallback} calls. */
    @RequiresApi(34)
    public static void registerScreenCaptureCallback(Activity activity, Executor executor,
            Activity.ScreenCaptureCallback callback) {
        if (blocks("screenshot callback")) return;
        activity.registerScreenCaptureCallback(executor, callback);
    }

    /** Whether the switch keeps this from Threads now. A failure answers no, leaving Threads as it would be unpatched. */
    private static boolean blocks(String hook) {
        try {
            HookStatus.invoked(FamilyNames.SCREENSHOT_DETECTION);
            String off = offBecause();
            HookStatus.counted(FamilyNames.SCREENSHOT_DETECTION, off == null ? IGNORED : LEFT_TO_THREADS + off);
            String outcome = off == null ? "Threads isn't told of screenshots" : "Threads watches for screenshots, " + off;
            if (!outcome.equals(lastLogged)) {
                lastLogged = outcome;
                Logger.printDebug(() -> "Screenshot detection: " + outcome);
            }
            return off == null;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SCREENSHOT_DETECTION, hook, failure);
            return false;
        }
    }

    /** Why the switch doesn't apply now, or null when it's on. Reads no setting before they're ready. */
    private static String offBecause() {
        if (!Utils.settingsReady()) return "settings not ready";
        if (!Settings.DISABLE_SCREENSHOT_DETECTION.get()) return Setting.isPaused() ? "HushThreads paused" : "switch off";
        return null;
    }
}
