package com.valvesoftware.steamlink;

import android.util.Log;
import android.view.MotionEvent;

import java.lang.reflect.Method;

/**
 * Galaxy XR SDL input bridge.
 * <p>
 * Provides static helpers injected at the top of two SDL event methods:
 * <ul>
 *   <li>{@link #routeXrPointerAsMouse} — injected into SDLSurface.onTouch</li>
 *   <li>{@link #routeXrPointerAsMouseGeneric} — injected into
 *       SDLGenericMotionListener_API14.onGenericMotionEvent</li>
 * </ul>
 * Uses reflection to call SDL-internal static native methods that are not on
 * the compile-time classpath but are present in the APK's merged DEX at runtime.
 */
public final class GxrSdlBridge {

    private static final String TAG = "SteamLinkGXR";

    private static final int GXR_DEVICE_ID = 0x475852;
    private static final int GXR_VENDOR_ID  = 0x4758;
    private static final int GXR_PRODUCT_ID = 0x4e8;
    private static final int SDL_BUTTON_A   = 0x60;

    private static volatile boolean sPadAdded = false;

    // Lazily resolved reflected methods — resolved once on first call.
    private static Method sIsReady           = null;
    private static Method sNativeAddJoystick = null;
    private static Method sOnNativePadDown   = null;
    private static Method sOnNativePadUp     = null;
    private static Method sOnNativeMouse     = null;

    private GxrSdlBridge() {}

    private static boolean ensureMethods() {
        if (sOnNativeMouse != null) return true;
        try {
            Class<?> sdl      = Class.forName("org.libsdl.app.SDL");
            Class<?> ctrl     = Class.forName("org.libsdl.app.SDLControllerManager");
            Class<?> activity = Class.forName("org.libsdl.app.SDLActivity");
            sIsReady           = sdl.getMethod("isControllerManagerReady");
            sNativeAddJoystick = ctrl.getMethod(
                "nativeAddJoystick",
                int.class, String.class, String.class,
                int.class, int.class, int.class,
                int.class, int.class, int.class,
                boolean.class, boolean.class, boolean.class, boolean.class
            );
            sOnNativePadDown = ctrl.getMethod("onNativePadDown", int.class, int.class, int.class);
            sOnNativePadUp   = ctrl.getMethod("onNativePadUp",   int.class, int.class, int.class);
            sOnNativeMouse   = activity.getMethod(
                "onNativeMouse",
                int.class, int.class, float.class, float.class, boolean.class
            );
            return true;
        } catch (Exception e) {
            Log.e(TAG, "GxrSdlBridge: failed to resolve SDL methods", e);
            return false;
        }
    }

    /**
     * Route an XR spatial-pointer touch event as a mouse + synthetic SDL pad event.
     * Injected at position 0 of SDLSurface.onTouch via bytecodePatch.
     * Returns void; the caller always continues normal touch processing.
     */
    public static void routeXrPointerAsMouse(MotionEvent event) {
        if (!ensureMethods()) return;
        int actionIndex = event.getActionIndex();
        int toolType    = event.getToolType(actionIndex);
        // TOOL_TYPE_UNKNOWN (0) or TOOL_TYPE_FINGER (1) → treat as XR pointer.
        if (toolType != 0 && toolType != 1) return;

        int   action = event.getActionMasked();
        float x      = event.getX(actionIndex);
        float y      = event.getY(actionIndex);

        try {
            // Send hover-move (button=0, action=7=HOVER_MOVE).
            sOnNativeMouse.invoke(null, 0, 7, x, y, false);

            if (action == 0 || action == 5) {           // ACTION_DOWN / ACTION_POINTER_DOWN
                sendGxrSyntheticPad(true);
                sOnNativeMouse.invoke(null, 1, 0, x, y, false);
                Log.i(TAG, "XR panel select -> PRIMARY_MOUSE down; preserving stock 5002244 touch");
            } else if (action == 1 || action == 6 || action == 3) { // UP / POINTER_UP / CANCEL
                sendGxrSyntheticPad(false);
                sOnNativeMouse.invoke(null, 0, 1, x, y, false);
                Log.i(TAG, "XR panel select -> PRIMARY_MOUSE up; preserving stock 5002244 touch");
            }
        } catch (Exception e) {
            Log.e(TAG, "routeXrPointerAsMouse: SDL call failed", e);
        }
    }

    /**
     * Route an XR spatial-pointer generic-motion (hover) event as a mouse event.
     * Injected at position 0 of SDLGenericMotionListener_API14.onGenericMotionEvent.
     * Returns void; the caller always continues normal processing.
     */
    public static void routeXrPointerAsMouseGeneric(MotionEvent event) {
        if (!ensureMethods()) return;
        int actionIndex = event.getActionIndex();
        int toolType    = event.getToolType(actionIndex);
        if (toolType != 0 && toolType != 1) return;

        int   action = event.getActionMasked();
        float x      = event.getX(actionIndex);
        float y      = event.getY(actionIndex);

        boolean isHover = action == 7 || action == 9 || action == 10; // HOVER_MOVE/ENTER/EXIT
        boolean isDown  = action == 0 || action == 5;
        boolean isUp    = action == 1 || action == 6 || action == 3;

        try {
            if (isHover || isDown || isUp) {
                sOnNativeMouse.invoke(null, 0, 7, x, y, false);
            }
            if (isDown) {
                sendGxrSyntheticPad(true);
                sOnNativeMouse.invoke(null, 1, 0, x, y, false);
                Log.i(TAG, "XR generic panel select -> PRIMARY_MOUSE down");
            } else if (isUp) {
                sendGxrSyntheticPad(false);
                sOnNativeMouse.invoke(null, 0, 1, x, y, false);
                Log.i(TAG, "XR generic panel select -> PRIMARY_MOUSE up");
            }
        } catch (Exception e) {
            Log.e(TAG, "routeXrPointerAsMouseGeneric: SDL call failed", e);
        }
    }

    /**
     * Register a one-button virtual Galaxy XR navigation gamepad with SDL (once),
     * then fire BUTTON_A down or up.
     */
    public static boolean sendGxrSyntheticPad(boolean pressed) {
        if (!ensureMethods()) return false;

        try {
            Boolean ready = (Boolean) sIsReady.invoke(null);
            if (ready == null || !ready) {
                Log.w(TAG, "Galaxy XR select ignored: SDL controller manager is not ready");
                return false;
            }

            if (!sPadAdded) {
                sNativeAddJoystick.invoke(
                    null,
                    GXR_DEVICE_ID,
                    "Galaxy XR Spatial Select",
                    "Samsung Galaxy XR spatial navigation",
                    GXR_PRODUCT_ID,
                    GXR_VENDOR_ID,
                    1, 0, 0, 0,
                    false, false, false, false
                );
                sPadAdded = true;
                Log.i(TAG, "Registered Galaxy XR spatial select on SDL gamepad path");
            }

            if (pressed) {
                Boolean result = (Boolean) sOnNativePadDown.invoke(null, GXR_DEVICE_ID, SDL_BUTTON_A, 0);
                Log.i(TAG, "Galaxy XR select -> SDL PAD_A down");
                return result != null && result;
            } else {
                Boolean result = (Boolean) sOnNativePadUp.invoke(null, GXR_DEVICE_ID, SDL_BUTTON_A, 0);
                Log.i(TAG, "Galaxy XR select -> SDL PAD_A up");
                return result != null && result;
            }
        } catch (Exception e) {
            Log.e(TAG, "sendGxrSyntheticPad: SDL call failed", e);
            return false;
        }
    }
}
