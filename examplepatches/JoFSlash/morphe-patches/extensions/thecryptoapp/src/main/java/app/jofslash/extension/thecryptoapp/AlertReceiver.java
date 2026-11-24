package app.jofslash.extension.thecryptoapp;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;

/**
 * Receives the alarm check ticks (explicit {@link AlertScheduler#ACTION_CHECK}) and
 * BOOT_COMPLETED. Network runs on a background thread via goAsync() so the main thread is never
 * blocked. Never crashes the host.
 */
public final class AlertReceiver extends BroadcastReceiver {

    static final String TAG = CustomAlerts.TAG;

    /** How long the broadcast waits for the check (background broadcasts time out at 60 s). */
    private static final long CHECK_DEADLINE_MS = 45_000L;

    @Override
    public void onReceive(Context context, Intent intent) {
        try {
            final Context app = context.getApplicationContext();
            String action = intent != null ? intent.getAction() : null;
            Log.i(TAG, "receiver: onReceive action=" + action);

            if (Intent.ACTION_BOOT_COMPLETED.equals(action)
                    || Intent.ACTION_MY_PACKAGE_REPLACED.equals(action)) {
                AlertScheduler.schedule(app);
                return;
            }
            if (!AlertScheduler.ACTION_CHECK.equals(action)) {
                return;
            }

            // Alarm tick. Arm the next one first, so a slow or killed check can't break the chain
            // (harmless in the inexact-repeating fallback mode), then check off the main thread.
            AlertScheduler.scheduleNext(app);
            final PendingResult pending = goAsync();
            Thread t = new Thread(() -> {
                try {
                    AlertChecker.checkNow(app);
                } catch (Throwable e) {
                    Log.e(TAG, "receiver: check failed", e);
                }
            }, "CryptoAlerts-check");
            t.setDaemon(true);
            t.start();
            // Let the broadcast go well before the system's timeout; a check still running then
            // finishes on its own thread while the process lives.
            new Thread(() -> {
                try {
                    t.join(CHECK_DEADLINE_MS);
                } catch (InterruptedException ignored) {
                } finally {
                    try {
                        pending.finish();
                    } catch (Throwable ignored) {
                    }
                }
            }, "CryptoAlerts-deadline").start();
        } catch (Throwable t) {
            Log.e(TAG, "receiver: unexpected failure", t);
        }
    }
}
