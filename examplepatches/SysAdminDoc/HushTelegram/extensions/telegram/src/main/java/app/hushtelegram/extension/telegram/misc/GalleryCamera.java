/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.os.SystemClock;

import java.util.Map;
import java.util.WeakHashMap;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Keeps the attachment gallery's camera asleep until the camera tile is tapped. While it sleeps,
 * Telegram's checkCamera and showCamera return at once, so opening the gallery neither asks for
 * the camera permission nor starts CameraController. A tap wakes that gallery and runs Telegram's
 * own checkCamera(true), and the camera opens once its view exists. Every new open of the gallery
 * puts it back to sleep. All of this runs on the UI thread.
 */
public final class GalleryCamera {
    /** How long after a tap a camera that just got its view still opens by itself. */
    static final long OPEN_WINDOW_MS = 10_000L;

    /** Galleries a tap woke, each with the time its camera may still open by itself, or 0 once it has. */
    private static final Map<Object, Long> AWAKE = new WeakHashMap<>();

    private GalleryCamera() {}

    /** checkCamera and showCamera: true keeps the camera off for this gallery. */
    public static boolean keepCameraOff(Object layout) {
        HookStatus.invoked(FamilyNames.GALLERY_CAMERA_ON_TAP);
        if (!enabled()) return false;
        synchronized (AWAKE) {
            if (AWAKE.containsKey(layout)) return false;
        }
        HookStatus.counted(FamilyNames.GALLERY_CAMERA_ON_TAP, "gallery camera kept off");
        return true;
    }

    /**
     * The camera tile, with the in-app camera on. True wakes the gallery, and the hook then runs
     * checkCamera(true) itself. An awake gallery whose camera view exists opens it the stock way.
     */
    public static boolean wakeOnTap(Object layout, Object cameraView) {
        HookStatus.invoked(FamilyNames.GALLERY_CAMERA_ON_TAP);
        if (!enabled()) return false;
        synchronized (AWAKE) {
            if (cameraView != null && AWAKE.containsKey(layout)) return false;
            AWAKE.put(layout, SystemClock.elapsedRealtime() + OPEN_WINDOW_MS);
        }
        HookStatus.counted(FamilyNames.GALLERY_CAMERA_ON_TAP, "camera tile woke the camera");
        return true;
    }

    /** A tap that asks for the camera permission, so the grant can start the camera. */
    public static void wakeForPermission(Object layout) {
        HookStatus.invoked(FamilyNames.GALLERY_CAMERA_ON_TAP);
        if (!enabled()) return;
        synchronized (AWAKE) {
            if (AWAKE.containsKey(layout)) return;
            AWAKE.put(layout, SystemClock.elapsedRealtime() + OPEN_WINDOW_MS);
        }
        HookStatus.counted(FamilyNames.GALLERY_CAMERA_ON_TAP, "permission request woke the camera");
    }

    /**
     * The end of checkCamera: true once, when the camera a tap woke has its view in time and the
     * switch is still on.
     */
    public static boolean openWhenReady(Object layout, Object cameraView) {
        if (cameraView == null || !enabled()) return false;
        synchronized (AWAKE) {
            Long due = AWAKE.get(layout);
            if (due == null || due == 0L) return false;
            AWAKE.put(layout, 0L);
            if (SystemClock.elapsedRealtime() > due) return false;
        }
        HookStatus.counted(FamilyNames.GALLERY_CAMERA_ON_TAP, "woken camera opened");
        return true;
    }

    /**
     * The attach menu is about to show, on whatever tab: a new open, so its gallery sleeps until a
     * tap, and a tap made while the menu is still opening holds.
     */
    public static void sleep(Object layout) {
        synchronized (AWAKE) {
            AWAKE.remove(layout);
        }
    }

    private static boolean enabled() {
        try {
            return Utils.settingsReady() && Settings.GALLERY_CAMERA_ON_TAP.get();
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.GALLERY_CAMERA_ON_TAP, "switch read", t);
            return false;
        }
    }
}
