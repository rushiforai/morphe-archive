package gxr.haptic;

import android.os.IBinder;
import android.util.Log;

/** Hands the haptic user service's binder to the grip haptics layer. */
public final class HapticBridge {
    private static final String TAG = "GxrHapticMain";

    private static boolean libraryLoaded;

    private HapticBridge() {}

    private static native void nativeSetBinder(IBinder binder);

    public static synchronized void setBinder(IBinder binder) {
        try {
            if (!libraryLoaded) {
                System.loadLibrary("gxr_haptic_main");
                libraryLoaded = true;
            }
            nativeSetBinder(binder);
        } catch (Throwable error) {
            Log.w(TAG, "haptic layer library not available", error);
        }
    }
}
