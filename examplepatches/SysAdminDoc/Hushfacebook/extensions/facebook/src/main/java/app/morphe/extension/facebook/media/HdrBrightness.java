/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.media;

import android.content.pm.ActivityInfo;
import android.os.Build;
import android.view.SurfaceView;
import android.view.Window;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Turn off HDR brightness. Facebook shows an HDR video or photo brighter than the rest of the
 * screen by asking Android for an HDR window: as the feed, a story or a reel comes to the front it
 * sets its window's colour mode to HDR and, on Android 15, how far above the screen's usual white
 * it wants to go, a figure its server sends. Android then turns the panel up for the HDR parts.
 * In a window at the default colour mode, Android draws the same video tone-mapped into the usual
 * range, at the same resolution.
 *
 * <p>Each of Facebook's calls of {@code Window.setColorMode} and {@code
 * Window.setDesiredHdrHeadroom} comes here instead. While the switch is on, a request for the HDR
 * mode becomes one for the default mode and a headroom becomes none; every other request goes
 * through as asked. A video Facebook draws on a surface of its own doesn't follow the window's
 * mode, so on Android 15 each SurfaceView Facebook builds asks for no headroom as well.
 *
 * <p>A switch change shows from the next screen Facebook brings to the front. Nothing here may
 * throw into Facebook's screen: off, paused, before the settings are ready or when anything here
 * fails, Facebook's request goes through unchanged.
 */
public final class HdrBrightness {
    /** Counted under the patch's name for each HDR window asked for in the usual range instead. */
    static final String WINDOW_HELD = "HDR window kept in the usual range";

    /** Counted for each headroom Facebook asked for and didn't get. */
    static final String HEADROOM_HELD = "HDR headroom held to none";

    /** Counted for each SurfaceView built asking for no headroom, Android 15 and newer. */
    static final String SURFACE_HELD = "video surface kept in the usual range";

    /** No headroom over the screen's usual white, so nothing on screen goes brighter than it. */
    static final float NO_HEADROOM = 1f;

    private static final String FAMILY = FamilyNames.HDR_BRIGHTNESS;

    private static volatile boolean windowLogged;

    private HdrBrightness() {
    }

    /** Injection point, in place of each of Facebook's calls of {@code Window.setColorMode}. */
    public static void setColorMode(Window window, int mode) {
        window.setColorMode(colorMode(mode));
    }

    /**
     * Injection point, in place of each of Facebook's calls of {@code
     * Window.setDesiredHdrHeadroom}, which Facebook makes on Android 15 and newer only.
     */
    public static void setDesiredHdrHeadroom(Window window, float headroom) {
        if (Build.VERSION.SDK_INT >= 35) window.setDesiredHdrHeadroom(headroom(headroom));
    }

    /** Injection point, right after each SurfaceView Facebook builds, its own kinds included. */
    public static void surfaceBuilt(SurfaceView view) {
        if (Build.VERSION.SDK_INT < 35) return;
        try {
            if (!on()) return;
            view.setDesiredHdrHeadroom(NO_HEADROOM);
            HookStatus.bound(FAMILY, "surface built");
            HookStatus.counted(FAMILY, SURFACE_HELD);
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "surface built", failure);
        }
    }

    /** The colour mode to ask Android for: the default one in place of HDR while the switch is on, else [mode]. */
    static int colorMode(int mode) {
        try {
            if (mode != ActivityInfo.COLOR_MODE_HDR || !on()) return mode;
            HookStatus.bound(FAMILY, "colour mode");
            HookStatus.counted(FAMILY, WINDOW_HELD);
            if (!windowLogged) {
                windowLogged = true;
                Logger.printDebug(() -> "Turn off HDR brightness: an HDR window kept in the usual range");
            }
            return ActivityInfo.COLOR_MODE_DEFAULT;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "colour mode", failure);
            return mode;
        }
    }

    /** The headroom to ask Android for: none while the switch is on, else [headroom]. */
    static float headroom(float headroom) {
        try {
            if (!on()) return headroom;
            HookStatus.bound(FAMILY, "headroom");
            HookStatus.counted(FAMILY, HEADROOM_HELD);
            return NO_HEADROOM;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "headroom", failure);
            return headroom;
        }
    }

    private static boolean on() {
        HookStatus.invoked(FAMILY);
        return Utils.settingsReady() && Settings.TURN_OFF_HDR_BRIGHTNESS.get();
    }
}
