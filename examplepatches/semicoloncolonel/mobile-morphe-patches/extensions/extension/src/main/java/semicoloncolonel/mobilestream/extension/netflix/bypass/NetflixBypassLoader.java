package semicoloncolonel.mobilestream.extension.netflix.bypass;

import android.util.Log;

/**
 * Netflix — anti-tamper native hook loader.
 *
 * The whole bypass lives in libnfkill.so: it inline-hooks libc's kill
 * primitives (kill, killpg, raise, pthread_kill, abort, syscall) with
 * And64InlineHook and swallows the fatal signal Netflix's native integrity
 * guard raises against its own process on a re-signed install. This is the
 * only Java surface: it loads that library at the very start of the
 * Application's attachBaseContext so JNI_OnLoad installs the hooks before the
 * guard first fires.
 *
 * "Fail loud" but never crash: a missing or misaligned library is logged, and
 * the app still runs (and then the guard would kill it) rather than crashing
 * here. Mirrors the other native-loader extensions: small, self-contained,
 * logs to a stable TAG, catches everything, idempotent.
 */
@SuppressWarnings("unused")
public final class NetflixBypassLoader {
    private static final String TAG = "NetflixBypass";
    private static boolean loaded = false;

    private NetflixBypassLoader() {
    }

    /** Idempotent: safe if the injected call site somehow runs more than once. */
    public static synchronized void load() {
        if (loaded) return;
        try {
            System.loadLibrary("nfkill");
            loaded = true;
            Log.i(TAG, "loaded libnfkill.so");
        } catch (UnsatisfiedLinkError e) {
            Log.e(TAG, "could not load libnfkill.so", e);
        } catch (Throwable t) {
            Log.e(TAG, "unexpected failure loading libnfkill.so", t);
        }
    }
}
