package gxr.haptic;

import android.content.ComponentName;
import android.content.ServiceConnection;
import android.content.pm.PackageManager;
import android.os.IBinder;
import android.util.Log;

import rikka.shizuku.Shizuku;
import rikka.shizuku.ShizukuProvider;

/**
 * Connects the haptic layer to a Shizuku user service that can reach the grip vibrator.
 * Without Shizuku, or without its permission, nothing is bound and vibrations stay on OpenXR.
 */
public class HapticProvider extends ShizukuProvider {
    private static final String TAG = "GxrHapticMain";
    private static final int PERMISSION_REQUEST = 7301;
    private static final int SERVICE_VERSION = 3;

    private static boolean libraryLoaded;
    private static boolean bound;

    private static native void nativeSetBinder(IBinder binder);

    private final ServiceConnection connection = new ServiceConnection() {
        @Override
        public void onServiceConnected(ComponentName name, IBinder binder) {
            Log.i(TAG, "user service connected");
            setBinder(binder);
        }

        @Override
        public void onServiceDisconnected(ComponentName name) {
            Log.i(TAG, "user service disconnected");
            bound = false;
            setBinder(null);
        }
    };

    @Override
    public boolean onCreate() {
        final boolean result = super.onCreate();
        try {
            Shizuku.addBinderReceivedListenerSticky(this::onShizukuAvailable);
            Shizuku.addBinderDeadListener(() -> {
                bound = false;
                setBinder(null);
            });
            Shizuku.addRequestPermissionResultListener((requestCode, grantResult) -> {
                if (requestCode != PERMISSION_REQUEST) return;
                if (grantResult == PackageManager.PERMISSION_GRANTED) bind();
                else Log.i(TAG, "Shizuku permission denied, vibrations stay on OpenXR");
            });
        } catch (Throwable error) {
            Log.w(TAG, "Shizuku setup failed", error);
        }
        return result;
    }

    private void onShizukuAvailable() {
        try {
            if (Shizuku.isPreV11()) return;
            if (Shizuku.checkSelfPermission() == PackageManager.PERMISSION_GRANTED) bind();
            else Shizuku.requestPermission(PERMISSION_REQUEST);
        } catch (Throwable error) {
            Log.w(TAG, "Shizuku permission check failed", error);
        }
    }

    private void bind() {
        if (bound) return;
        try {
            final ComponentName component =
                new ComponentName(getContext().getPackageName(), HapticService.class.getName());
            Shizuku.bindUserService(
                new Shizuku.UserServiceArgs(component)
                    .daemon(false)
                    .processNameSuffix("haptic")
                    .debuggable(false)
                    .version(SERVICE_VERSION),
                connection);
            bound = true;
        } catch (Throwable error) {
            Log.w(TAG, "user service bind failed", error);
        }
    }

    private static void setBinder(IBinder binder) {
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
