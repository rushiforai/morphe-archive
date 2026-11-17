package semicoloncolonel.mobilestream.extension.primevideotv;

import android.util.Log;

/**
 * Prime Video Android TV — ad-strip native hook loader.
 *
 * The strip lives in libpvhook.so: it installs a PLT/GOT import hook on
 * libignite's memcpy/memmove slots and, inside the hooked copy, empties the
 * regolith getVideoAds ad-decision response (TV-show SGAI mid-rolls) and blanks
 * the movie intraTitlePlaylist Remote ad items. This is the only Java surface:
 * it loads the library at the start of the Application's onCreate, so a worker
 * thread can poll for libignite and install the hooks before the first
 * playback session.
 *
 * Fail loud but never crash: a missing library is logged and the app still
 * runs. Mirrors the other native-loader extensions (idempotent, stable TAG,
 * catches everything).
 *
 * The native hook is a port of ajstrick81's Prime Video Android TV strip
 * (GPL-3.0, github.com/ajstrick81/morphe-androidtv-patches), built for arm64
 * (which they never shipped) and armeabi-v7a.
 */
@SuppressWarnings("unused")
public final class PrimeVideoHookLoader {
    private static final String TAG = "PrimeVideoHook";
    private static boolean loaded = false;

    private PrimeVideoHookLoader() {
    }

    /** Idempotent: safe if the injected call site runs more than once. */
    public static synchronized void load() {
        if (loaded) return;
        try {
            System.loadLibrary("pvhook");
            loaded = true;
            Log.i(TAG, "loaded libpvhook.so");
        } catch (UnsatisfiedLinkError e) {
            Log.e(TAG, "could not load libpvhook.so", e);
        } catch (Throwable t) {
            Log.e(TAG, "unexpected failure loading libpvhook.so", t);
        }
    }
}
