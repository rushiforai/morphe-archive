package semicoloncolonel.mobilestream.extension.shared.privacy;

import android.annotation.SuppressLint;
import android.app.Application;
import android.content.ContentResolver;
import android.content.Context;
import android.content.SharedPreferences;
import android.provider.Settings;
import android.util.Log;

import java.security.SecureRandom;
import java.util.Locale;

/**
 * "Hide device identifiers" (opt-in) runtime.
 *
 * Every Settings.Secure.getString(ContentResolver, String) call in the app is
 * rewritten to {@link #getSecureString}. Requests for ANDROID_ID get a random
 * 16-hex-digit value generated once per install and kept in the app's own
 * storage, so the app sees a stable ID that is not the device's. It resets
 * when the app's data is cleared or the app is reinstalled. Every other
 * setting is read normally.
 *
 * A per-install value is used instead of one shared constant: a constant
 * would make every patched install look like the same device, which a
 * service could flag or rate-limit.
 *
 * Nothing leaves the device; this class only answers the app's own reads.
 */
@SuppressWarnings("unused")
public final class DeviceIdSpoofer {
    private static final String TAG = "MSP-DEVICE-ID";
    private static final String PREFS = "msp_device_id";
    private static final String KEY = "android_id";

    private static volatile String cachedId;
    private static volatile boolean persisted;

    private DeviceIdSpoofer() {
    }

    /** Replaces Settings.Secure.getString(ContentResolver, String) at every app call site. */
    public static String getSecureString(ContentResolver resolver, String name) {
        if (Settings.Secure.ANDROID_ID.equals(name)) {
            return fakeAndroidId();
        }
        return Settings.Secure.getString(resolver, name);
    }

    static String fakeAndroidId() {
        String id = cachedId;
        if (id != null && persisted) return id;
        synchronized (DeviceIdSpoofer.class) {
            SharedPreferences prefs = prefs();
            if (cachedId == null) {
                String saved = prefs != null ? prefs.getString(KEY, null) : null;
                cachedId = saved != null && saved.length() == 16 ? saved : randomHex16();
                persisted = saved != null && saved.length() == 16;
                Log.i(TAG, "serving a per-install ANDROID_ID instead of the device's");
            }
            // A read before the app's storage is ready gets an in-memory value.
            // Once storage is up, an ID saved by an earlier launch wins (so the
            // install keeps one ID across launches); otherwise the in-memory
            // value is saved.
            if (!persisted && prefs != null) {
                String saved = prefs.getString(KEY, null);
                if (saved != null && saved.length() == 16) {
                    cachedId = saved;
                } else {
                    prefs.edit().putString(KEY, cachedId).apply();
                }
                persisted = true;
            }
            return cachedId;
        }
    }

    private static SharedPreferences prefs() {
        try {
            Context context = currentApplication();
            return context != null ? context.getSharedPreferences(PREFS, Context.MODE_PRIVATE) : null;
        } catch (Throwable t) {
            // No context this early: fall back to a per-process value.
            return null;
        }
    }

    @SuppressLint({"PrivateApi", "DiscouragedPrivateApi"})
    private static Context currentApplication() throws Exception {
        // ActivityThread.currentApplication() is on the SDK allow-list.
        Application app = (Application) Class.forName("android.app.ActivityThread")
                .getMethod("currentApplication")
                .invoke(null);
        return app;
    }

    private static String randomHex16() {
        byte[] bytes = new byte[8];
        new SecureRandom().nextBytes(bytes);
        StringBuilder sb = new StringBuilder(16);
        for (byte b : bytes) sb.append(String.format(Locale.US, "%02x", b));
        return sb.toString();
    }
}
