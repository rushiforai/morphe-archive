package app.southstar21.extension.youtubemusic;

import android.app.Activity;
import android.util.Log;

import app.southstar21.extension.youtubemusic.liquidglass.LiquidGlassNavBarPatch;

/**
 * Shared entry point, called from MusicActivity.onWindowFocusChanged by the shared extension
 * patch. Starts each included patch.
 */
@SuppressWarnings("unused")
public final class YouTubeMusicHooks {
    public static final String TAG = "southstar21";

    private YouTubeMusicHooks() {
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
