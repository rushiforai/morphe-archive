package app.polishapps.extension.all;

import android.content.Context;
import android.util.Log;

/**
 * Support code for the "MicroG-RE maps support" patch.
 *
 * <p>Apps draw Google Maps through the Maps SDK v2 <i>thin client</i>. The renderer is not in the
 * app: the client asks Play Services' DynamiteModule for {@code com.google.android.gms.maps_*dynamite},
 * receives a remote {@link Context} and class-loads
 * {@code com.google.android.gms.maps.internal.CreatorImpl} out of it. Play Services then validates the
 * API key against the app's signing certificate, so a re-signed app gets an empty grid.
 *
 * <p>MicroG-RE ships its own renderer under the same class name, which checks no key and no
 * certificate. The patch makes the client's module loader ask {@link #getMapsContext} first, and only
 * that loader is redirected, so every other Play Services feature keeps using real Play Services.
 *
 * <p>When MicroG-RE is missing, too old, or cannot be seen, this returns {@code null} and the
 * original loader runs, which makes the patch a no-op on such a device.
 */
@SuppressWarnings("unused")
public final class MicroGMaps {

    private static final String TAG = "MicroGMaps";

    /** MicroG-RE's application id. Its Java namespace stays {@code com.google.android.gms}. */
    private static final String MICROG_PACKAGE = "app.revanced.android.gms";

    /** The class the Maps client loads by name. A MicroG-RE build without a renderer lacks it. */
    private static final String CREATOR_CLASS = "com.google.android.gms.maps.internal.CreatorImpl";

    private static final Object LOCK = new Object();

    /** Result of the single lookup, {@code null} when there is no usable renderer. */
    private static Context cached;

    private static boolean resolved;

    private MicroGMaps() {
    }

    /**
     * Returns MicroG-RE's context with its code loaded, or {@code null} if it cannot draw a map.
     *
     * @param context any context of the patched app, used to reach the package manager.
     */
    public static Context getMapsContext(Context context) {
        synchronized (LOCK) {
            if (resolved) {
                return cached;
            }
            if (context == null) {
                return null;
            }
            resolved = true;

            try {
                // INCLUDE_CODE puts MicroG-RE's classes and native libraries into this process, where the
                // renderer has to run. IGNORE_SECURITY is needed because the two apps are signed by
                // different keys.
                Context microG = context.createPackageContext(
                        MICROG_PACKAGE,
                        Context.CONTEXT_INCLUDE_CODE | Context.CONTEXT_IGNORE_SECURITY);

                // Older MicroG-RE builds have the package but no renderer. Returning their context would
                // make the client fail to find CreatorImpl and crash, so check for the class here.
                microG.getClassLoader().loadClass(CREATOR_CLASS);

                cached = microG;
                Log.i(TAG, "Loading maps from MicroG-RE");
            } catch (Throwable t) {
                // Not installed, not visible (missing <queries> entry), or too old.
                cached = null;
                Log.w(TAG, "MicroG-RE maps unavailable, using Play Services", t);
            }

            return cached;
        }
    }
}
