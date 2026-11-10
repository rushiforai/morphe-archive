package gxr.pose;

import android.os.IBinder;
import android.util.Log;

/** Hands the pose user service's binder to the controller HAL pose layer. */
public final class PoseBridge {
    private static final String TAG = "GxrHalPose";

    private static boolean libraryLoaded;

    private PoseBridge() {}

    private static native void nativeSetBinder(IBinder binder);

    public static synchronized void setBinder(IBinder binder) {
        try {
            if (!libraryLoaded) {
                System.loadLibrary("gxr_controller_hal_pose");
                libraryLoaded = true;
            }
            nativeSetBinder(binder);
        } catch (Throwable error) {
            Log.w(TAG, "controller HAL pose layer library not available", error);
        }
    }
}
