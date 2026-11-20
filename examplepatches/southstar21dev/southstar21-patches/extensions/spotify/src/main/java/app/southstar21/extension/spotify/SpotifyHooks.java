package app.southstar21.extension.spotify;

import android.app.Activity;
import android.util.Log;

import app.southstar21.extension.spotify.liquidglass.LiquidGlassNavBarPatch;

/**
 * Shared entry point, called from SpotifyMainActivity.onWindowFocusChanged by the shared
 * extension patch. Starts each included patch.
 */
@SuppressWarnings("unused")
public final class SpotifyHooks {
    public static final String TAG = "southstar21";

    private SpotifyHooks() {
    }

    public static void onMainActivityWindowFocusChanged(Activity activity) {
        try {
            if (LiquidGlassNavBarPatch.isIncluded()) {
                LiquidGlassNavBarPatch.onMainActivityReady(activity);
            }
        } catch (Throwable t) {
            // Never take the app down over a patch.
            Log.e(TAG, "Main activity hook failed", t);
        }
    }

}
