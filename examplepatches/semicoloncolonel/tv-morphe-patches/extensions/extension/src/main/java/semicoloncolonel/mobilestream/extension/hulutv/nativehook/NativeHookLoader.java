package semicoloncolonel.mobilestream.extension.hulutv.nativehook;

import android.util.Log;

/**
 * Hulu (Android TV) — native ad-strip hook loader.
 *
 * The whole in-process ad strip lives in libhuluhook.so (an SSL_read hook on
 * libwkf_support.so plus DASH manifest period stripping). This is the only Java
 * surface: it loads that library early in WKFapplication.onCreate so JNI_OnLoad
 * installs the hook before the first playback session. libhuluhook.so links
 * libshadowhook.so, which the linker resolves from the same bundled lib dir.
 *
 * The native interception approach is from ajstrick81's native-adstrip-toolkit
 * (GPL-3.0); see the NOTICE file. "Fail loud" but never crash: a missing or
 * misaligned library is logged, and the app still runs (ads unblocked) rather
 * than crashing. Mirrors the SkipAdsPatch extension convention: small,
 * self-contained, logs to a stable TAG, catches everything.
 */
@SuppressWarnings("unused")
public final class NativeHookLoader {
    private static final String TAG = "HuluTvNativeHook";
    private static boolean loaded = false;

    private NativeHookLoader() {
    }

    /** Idempotent: safe if the injected call site somehow runs more than once. */
    public static synchronized void load() {
        if (loaded) return;
        try {
            System.loadLibrary("huluhook");
            loaded = true;
            Log.i(TAG, "loaded libhuluhook.so");
        } catch (UnsatisfiedLinkError e) {
            Log.e(TAG, "could not load libhuluhook.so", e);
        } catch (Throwable t) {
            Log.e(TAG, "unexpected failure loading libhuluhook.so", t);
        }
    }
}
