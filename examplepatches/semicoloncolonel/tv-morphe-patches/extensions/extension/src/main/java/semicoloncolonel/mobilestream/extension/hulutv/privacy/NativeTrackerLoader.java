package semicoloncolonel.mobilestream.extension.hulutv.privacy;

import android.util.Log;

/**
 * Hulu (Android TV) — analytics/tracking blocker loader.
 *
 * Loads libhulutrack.so early in WKFapplication.onCreate so its curl hook is
 * armed before the app sends any telemetry. The library links libshadowhook.so,
 * resolved from the same bundled lib dir. Separate from the ad-strip loader so
 * the two patches toggle independently. "Fail loud" but never crash.
 *
 * Approach from ajstrick81's native-adstrip-toolkit (GPL-3.0); see the NOTICE file.
 */
@SuppressWarnings("unused")
public final class NativeTrackerLoader {
    private static final String TAG = "HuluTvTrackHook";
    private static boolean loaded = false;

    private NativeTrackerLoader() {
    }

    public static synchronized void load() {
        if (loaded) return;
        try {
            System.loadLibrary("hulutrack");
            loaded = true;
            Log.i(TAG, "loaded libhulutrack.so");
        } catch (UnsatisfiedLinkError e) {
            Log.e(TAG, "could not load libhulutrack.so", e);
        } catch (Throwable t) {
            Log.e(TAG, "unexpected failure loading libhulutrack.so", t);
        }
    }
}
