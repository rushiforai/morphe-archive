/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.misc;

import android.app.Activity;
import android.view.WindowManager;

import androidx.annotation.RequiresApi;

import java.util.Collections;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.Executor;
import java.util.function.Consumer;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * What the Block screenshot detection patch asks before Facebook learns you took a screenshot or
 * are recording the screen.
 *
 * <p>Facebook finds out three ways. Its screenshot detectors, in the feed, Reels, chats, games,
 * Marketplace and ads among others, share one observer of the phone's photo library, which looks
 * at each new picture to see whether it's a screenshot. The patch puts {@link #ignoresChange} first
 * in that observer, so on a yes the new picture is never looked at and no detector hears of it. On
 * Android 14 and newer an app can also ask Android to tell it when a screenshot is taken of it,
 * and on Android 15 and newer whether the screen is being recorded. The patch sends those requests
 * here, and while the switch is on they aren't made: Android never tells Facebook, and a
 * recording request is answered as not recorded. Taking one back that was never made is skipped
 * too, so Facebook's own bookkeeping stays as it expects.
 *
 * <p>Off, paused, settings that aren't ready yet, or a failure in here, and Facebook watches as it
 * would have.
 */
public final class ScreenshotDetection {
    /** The diagnostic counter route: each screenshot check or request, and the ones blocked. */
    static final String ROUTE = "Screenshot detection";

    /** {@code WindowManager.SCREEN_RECORDING_STATE_NOT_VISIBLE}. */
    static final int NOT_RECORDED = 0;

    /** The recording callbacks Facebook asked for while the switch was on, never handed to Android. */
    private static final Map<Object, Boolean> HELD = Collections.synchronizedMap(new WeakHashMap<>());

    private ScreenshotDetection() {
    }

    /**
     * Injection point, first thing in the screenshot observer's {@code onChange}. True returns
     * before the new picture is looked at. Never throws.
     */
    public static boolean ignoresChange() {
        return blocks("new picture", "photo library change");
    }

    /** Injection point, in place of each of Facebook's {@code registerScreenCaptureCallback} calls. */
    @RequiresApi(34)
    public static void registerScreenCaptureCallback(Activity activity, Executor executor,
            Activity.ScreenCaptureCallback callback) {
        if (blocks("screenshot callback", "screenshot callback")) return;
        activity.registerScreenCaptureCallback(executor, callback);
    }

    /**
     * Injection point, in place of each of Facebook's {@code addScreenRecordingCallback} calls.
     * Answers the recording state Facebook reads.
     */
    @RequiresApi(35)
    public static int addScreenRecordingCallback(WindowManager windowManager, Executor executor,
            Consumer<Integer> callback) {
        if (blocks("recording callback", "recording callback")) {
            HELD.put(callback, Boolean.TRUE);
            return NOT_RECORDED;
        }
        return windowManager.addScreenRecordingCallback(executor, callback);
    }

    /**
     * Injection point, in place of each of Facebook's {@code removeScreenRecordingCallback} calls. A
     * callback that was never handed to Android isn't taken back from it.
     */
    @RequiresApi(35)
    public static void removeScreenRecordingCallback(WindowManager windowManager, Consumer<Integer> callback) {
        if (HELD.remove(callback) != null) return;
        windowManager.removeScreenRecordingCallback(callback);
    }

    /** True when the switch blocks what Facebook is about to do, counted under [what]. Never throws. */
    private static boolean blocks(String what, String hook) {
        try {
            HookStatus.invoked(FamilyNames.SCREENSHOT_DETECTION);
            FeedFilterCounters.sawList(ROUTE, 1);
            FeedFilterCounters.sawKind(ROUTE, what);
            if (!Utils.settingsReady() || !Settings.BLOCK_SCREENSHOT_DETECTION.get()) return false;
            FeedFilterCounters.removed(ROUTE, 1, "blocked");
            Logger.printDebug(() -> "Screenshot detection: blocked a " + what);
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SCREENSHOT_DETECTION, hook, failure);
            return false;
        }
    }
}
