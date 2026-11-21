package app.proxma.rox;

import android.util.Log;

/**
 * ROX ships a foreground-service plugin that, once started, runs its own Dart engine, can hold a wake
 * lock and a Wi-Fi lock, restarts itself through an alarm clock when the system stops it, and starts
 * again on boot and after an app update. None of that is needed for the check-in or the ads, so every
 * way in is turned away here.
 */
public final class BackgroundService {

    private static final String TAG = "PROXMA_ROX";

    private BackgroundService() {}

    public static void blockedStart() {
        Log.i(TAG, "BG blocked service start from the app");
    }

    public static void blockedRestart() {
        Log.i(TAG, "BG blocked service restart alarm");
    }

    public static void blockedBoot() {
        Log.i(TAG, "BG blocked service start on boot or update");
    }
}
