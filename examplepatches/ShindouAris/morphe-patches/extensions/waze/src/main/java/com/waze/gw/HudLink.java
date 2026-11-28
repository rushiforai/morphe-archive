package com.waze.gw;

import android.content.Context;
import android.os.SystemClock;
import android.util.Log;

/**
 * Compatibility facade for the original hook. All Bluetooth and protocol work now belongs to
 * HudLinkService/HudConnectionManager; this method is intentionally cheap and idempotent because
 * Gateway.onSpeedo is a hot callback.
 */
final class HudLink {
    private static final String TAG = "WazeHudLink";
    private static final long START_RETRY_MS = 15000L;
    private static final Object START_LOCK = new Object();
    private static volatile long lastStartAttemptElapsed;

    private HudLink() {}

    static void ensureStarted(Context context) {
        if (context == null || Gateway.isExplicitShutdownRequested()) return;
        if (!new HudDeviceRepository(context).isActiveEnabled() || HudLinkService.isRunning()) return;
        // Gateway.onSpeedo is a hot callback. Start at most once per retry window while the
        // service is absent; onCreate() publishes the running flag as soon as Android accepts it.
        // The finite window is intentional: a foreground-service start can be rejected while
        // Waze is backgrounded, then become legal again when its UI returns to the foreground.
        long now = SystemClock.elapsedRealtime();
        synchronized (START_LOCK) {
            if (HudLinkService.isRunning()
                    || now - lastStartAttemptElapsed < START_RETRY_MS) return;
            lastStartAttemptElapsed = now;
        }
        Log.i(TAG, "HUD Link enabled but service absent; requesting runtime restart");
        HudLinkService.startFromRuntime(context);
    }

    /** Waze came to the foreground or a drive started: (re)start at once. */
    static void resume(Context context) {
        synchronized (START_LOCK) { lastStartAttemptElapsed = 0L; }
        ensureStarted(context);
    }

    static void stop(Context context) {
        HudLinkService.stop(context);
    }
}
