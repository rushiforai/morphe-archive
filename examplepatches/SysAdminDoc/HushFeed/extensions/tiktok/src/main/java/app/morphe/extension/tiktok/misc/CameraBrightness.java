/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.misc;

import android.view.WindowManager;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.tiktok.settings.Settings;

/**
 * What the Keep the screen's brightness patch asks each time one of TikTok's creation screens
 * starts or a camera's front flash comes on (issue #200).
 *
 * <p>The camera, the editor, the post screen and the effect preview each turn on TikTok's
 * brightness boost when they start: the window's screen brightness is set to the phone's own
 * level plus a step from TikTok's server config, then follows the light sensor and the
 * brightness slider until the screen stops, when TikTok clears it again. Two methods do that
 * start, an older one and the one 47.4 uses, and only one of them runs, by a server flag. The
 * patch asks here at the top of both, and while the switch is on they return before touching
 * the window, so the screen stays where the phone has it.
 *
 * <p>The front flash and the fill light don't go through either start. The record screen's fill
 * light (on its own in low light), its front flash, the flash button's screen flash, the Tako
 * camera's flash and the avatar camera's flash each save the window's brightness, store full
 * brightness and lay a white overlay over the preview. That store comes here instead, and while
 * the switch is on it isn't made: the overlay still comes up, at your own brightness, and the
 * flash's restore writes back the level the window already had. Whatever else sets the window's
 * brightness is left alone.
 *
 * <p>Off, paused, or a failure in here, and the boost and the flash run as TikTok has them.
 */
public final class CameraBrightness {
    private CameraBrightness() {
    }

    /** Injection point, first thing in both of TikTok's brightness boost starts. Never throws. */
    public static boolean keepScreenBrightness() {
        if (!switchedOn()) return false;
        Logger.printDebug(() -> "Keep the screen's brightness: skipped TikTok's camera boost");
        return true;
    }

    /**
     * Injection point in place of the one store of the window's brightness when a front flash or
     * fill light comes on. TikTok hands the parameters to setAttributes right after.
     */
    public static void setFlashBrightness(WindowManager.LayoutParams params, float brightness) {
        if (switchedOn()) {
            Logger.printDebug(() -> "Keep the screen's brightness: the front flash keeps the screen's brightness");
            return;
        }
        params.screenBrightness = brightness;
    }

    private static boolean switchedOn() {
        try {
            return Settings.KEEP_CAMERA_BRIGHTNESS.get();
        } catch (Throwable failure) {
            return false;
        }
    }
}
