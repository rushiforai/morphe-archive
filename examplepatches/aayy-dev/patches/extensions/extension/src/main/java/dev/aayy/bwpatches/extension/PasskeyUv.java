package dev.aayy.bwpatches.extension;

import android.app.Application;
import android.app.KeyguardManager;
import android.content.Context;

/**
 * Runtime logic for the "no screen lock passkey" patch.
 *
 * <p>Bitwarden gates its passkey user-verification flow on an internal "user is verified" boolean.
 * When the device has no secure lock screen (no PIN / pattern / password / biometric), Bitwarden
 * cannot verify the user and falls back to prompting for the master password or PIN. This class
 * reports whether the device lacks a secure lock, so the patch can treat the user as already
 * verified in exactly that case and skip the fallback prompt.
 *
 * <p>Uses only stable Android framework APIs so it keeps working regardless of how the host app is
 * obfuscated, and fails safe: any error makes it report {@code false}, leaving stock behavior.
 */
@SuppressWarnings("unused")
public final class PasskeyUv {

    private PasskeyUv() {
    }

    /**
     * @return {@code true} when the device has no secure lock screen, so passkey operations should
     * proceed without a master password / PIN prompt. {@code false} otherwise, or on any error,
     * which preserves the app's original behavior.
     */
    public static boolean noSecureLock() {
        try {
            Application application = currentApplication();
            if (application == null) {
                return false;
            }
            KeyguardManager keyguardManager =
                    (KeyguardManager) application.getSystemService(Context.KEYGUARD_SERVICE);
            if (keyguardManager == null) {
                return false;
            }
            // isDeviceSecure() is true when a PIN, pattern, password, or biometric-backed lock is
            // set. Its negation is exactly the "no screen lock" case the patch targets.
            return !keyguardManager.isDeviceSecure();
        } catch (Throwable ignored) {
            return false;
        }
    }

    /**
     * Retrieves the current {@link Application} without needing an injected context, via the hidden
     * {@code ActivityThread.currentApplication()} framework method.
     */
    private static Application currentApplication() {
        try {
            Class<?> activityThread = Class.forName("android.app.ActivityThread");
            Object app = activityThread
                    .getMethod("currentApplication")
                    .invoke(null);
            return (Application) app;
        } catch (Throwable ignored) {
            return null;
        }
    }
}
