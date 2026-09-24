package app.belkart.extension.nfc;

import android.app.Activity;
import android.app.Application;
import android.nfc.NfcAdapter;
import android.os.Bundle;
import android.os.SystemClock;
import android.util.Log;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * Enables the NFC adapter through root whenever Belkart Pay comes to the foreground.
 */
@SuppressWarnings("unused")
public final class RootNfcEnableHook {
    private static final String TAG = "BelkartNfc";
    private static final long SU_TIMEOUT_SEC = 15L;
    private static final long ENABLE_WAIT_MS = 4000L;
    private static final long MIN_INTERVAL_MS = 3000L;

    private static volatile boolean registered;
    private static final AtomicBoolean running = new AtomicBoolean(false);
    private static volatile long lastAttempt;

    private RootNfcEnableHook() { }

    public static void onMainActivityCreate(Activity activity) {
        Log.i(TAG, "onMainActivityCreate called");
        if (activity == null) return;
        final Application application = activity.getApplication();
        if (application != null && !registered) {
            registered = true;
            application.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
                @Override public void onActivityResumed(Activity a) { tryEnable(application); }
                @Override public void onActivityCreated(Activity a, Bundle b) { }
                @Override public void onActivityStarted(Activity a) { }
                @Override public void onActivityPaused(Activity a) { }
                @Override public void onActivityStopped(Activity a) { }
                @Override public void onActivitySaveInstanceState(Activity a, Bundle b) { }
                @Override public void onActivityDestroyed(Activity a) { }
            });
            Log.i(TAG, "NFC auto-enable lifecycle listener registered");
        }
        tryEnable(activity.getApplicationContext());
    }

    private static void tryEnable(android.content.Context context) {
        if (context == null) return;
        NfcAdapter adapter;
        try {
            adapter = NfcAdapter.getDefaultAdapter(context);
        } catch (Throwable t) {
            Log.w(TAG, "Unable to inspect NFC state", t);
            return;
        }
        if (adapter == null) {
            Log.i(TAG, "Device has no NFC");
            return;
        }
        if (adapter.isEnabled()) {
            Log.d(TAG, "NFC is already enabled");
            return;
        }

        long now = SystemClock.elapsedRealtime();
        if (now - lastAttempt < MIN_INTERVAL_MS) return;
        if (!running.compareAndSet(false, true)) return;
        lastAttempt = now;

        new Thread(() -> {
            try {
                Log.i(TAG, "NFC is off, enabling via root...");
                runAsRoot("svc nfc enable");
                if (waitForNfc(adapter)) {
                    Log.i(TAG, "NFC enabled successfully (svc)");
                    return;
                }
                runAsRoot("cmd nfc enable-nfc");
                if (waitForNfc(adapter)) {
                    Log.i(TAG, "NFC enabled successfully (cmd)");
                    return;
                }
                Log.w(TAG, "Root NFC enable commands did not turn NFC on");
            } finally {
                running.set(false);
            }
        }, "belkart-nfc-enable").start();
    }

    private static boolean waitForNfc(NfcAdapter adapter) {
        long deadline = SystemClock.elapsedRealtime() + ENABLE_WAIT_MS;
        while (SystemClock.elapsedRealtime() < deadline) {
            try { if (adapter.isEnabled()) return true; } catch (Throwable ignored) { }
            SystemClock.sleep(200);
        }
        return false;
    }

    private static void runAsRoot(String command) {
        Process process = null;
        try {
            process = new ProcessBuilder("su").redirectErrorStream(true).start();
            try (OutputStream in = process.getOutputStream()) {
                in.write((command + "\nexit\n").getBytes(StandardCharsets.UTF_8));
                in.flush();
            }
            StringBuilder output = new StringBuilder();
            try (BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream(), StandardCharsets.UTF_8))) {
                String line;
                while ((line = reader.readLine()) != null) output.append(line).append('\n');
            }
            if (!process.waitFor(SU_TIMEOUT_SEC, TimeUnit.SECONDS)) {
                Log.w(TAG, "Root command timed out: " + command);
                return;
            }
            Log.i(TAG, "'" + command + "' exit=" + process.exitValue() + (output.length() > 0 ? " out=" + output.toString().trim() : ""));
        } catch (Throwable t) {
            Log.w(TAG, "Root command failed: " + command, t);
        } finally {
            if (process != null) process.destroy();
        }
    }
}
