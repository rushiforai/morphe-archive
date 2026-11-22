package app.keyboardspeed.extension;

import android.content.Context;
import android.util.DisplayMetrics;
import android.util.Log;

import java.lang.reflect.Method;

/**
 * Sizes the buttons and dialogs of the Morphe patches for the screen the app is on.
 * <p>
 * The Morphe extensions convert dp to pixels with the display metrics of the screen of the phone. On a monitor,
 * such as with Samsung DeX, the density is much lower, so their buttons and dialogs were much too big.
 */
@SuppressWarnings("unused")
public final class MorpheUiSizePatch {
    private static final String TAG = "MorpheUiSize";

    private static Method getActivity;
    private static boolean lookedUp;
    private static float lastLoggedDensity;

    private MorpheUiSizePatch() {
    }

    /**
     * Injection point.
     *
     * @return The display metrics of the activity in front, whose screen the app is on, or null if not known.
     */
    public static DisplayMetrics getDisplayMetrics() {
        try {
            if (!lookedUp) {
                lookedUp = true;
                getActivity = Class.forName("app.morphe.extension.shared.Utils", true,
                        MorpheUiSizePatch.class.getClassLoader()).getMethod("getActivity");
            }
            if (getActivity == null) {
                return null;
            }
            Context activity = (Context) getActivity.invoke(null);
            if (activity == null) {
                return null;
            }
            DisplayMetrics metrics = activity.getResources().getDisplayMetrics();
            if (metrics.density != lastLoggedDensity) {
                lastLoggedDensity = metrics.density;
                Log.i(TAG, "Morphe UI density " + metrics.density);
            }
            return metrics;
        } catch (Exception ex) {
            Log.e(TAG, "getDisplayMetrics failure", ex);
            return null;
        }
    }
}
