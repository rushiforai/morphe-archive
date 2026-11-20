package app.southstar21.extension.spotify.liquidglass;

import android.app.Activity;
import android.content.res.Resources;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;

import java.util.WeakHashMap;

/**
 * Liquid Glass patch for Spotify: entry point. The patch options are baked into the methods
 * below; there's no settings menu in Spotify yet.
 */
@SuppressWarnings("unused")
public final class LiquidGlassNavBarPatch {
    static final String TAG = "LiquidGlass";

    private static final WeakHashMap<View, LiquidGlassController> installed = new WeakHashMap<>();

    /** The patch makes this return true. */
    public static boolean isIncluded() {
        return false;
    }

    // The methods below are overwritten by the patch with the chosen option values.

    public static int blurRadiusDp() {
        return 4;
    }

    public static int refractionPercent() {
        return 100;
    }

    public static boolean southstar21Style() {
        return true;
    }

    /** Called by SpotifyHooks whenever the main activity gains or loses focus. */
    public static void onMainActivityReady(Activity activity) {
        try {
            View bar = findView(activity, "navigation_bar");
            if (!(bar instanceof ViewGroup) || installed.containsKey(bar)) return;
            if (!(bar.getParent() instanceof ViewGroup)) return;

            // Spotify's content already scrolls under the bar; there are no margins to drop.
            LiquidGlassController controller = new LiquidGlassController((ViewGroup) bar, null, true);
            // Spotify darkens the content behind the bar with gradients up to 85% black. They stay
            // on screen, but the glass looks past them at the content itself.
            for (String name : GRADIENTS) controller.excludeFromGlass(findView(activity, name));
            controller.install();
            installed.put(bar, controller);
            installMiniPlayer(activity);
            Log.d(TAG, "Installed on " + bar);
        } catch (Throwable t) {
            // Never take the app down over a cosmetic patch.
            Log.e(TAG, "Failed to install liquid glass tab bar", t);
        }
    }

    private static final String[] GRADIENTS =
            {"bottom_gradient", "bottom_gradient_black_fade", "bottom_gradient_window_insets"};

    /** The now playing card above the bar gets the same glass. */
    private static void installMiniPlayer(Activity activity) {
        try {
            View container = findView(activity, "now_playing_view_container");
            int cardId = id(activity, "now_playing_bar_layout");
            if (!(container instanceof ViewGroup) || cardId == 0) return;
            MiniPlayerGlass glass = new MiniPlayerGlass((ViewGroup) container, cardId);
            for (String name : GRADIENTS) glass.exclude(findView(activity, name));
            glass.install();
        } catch (Throwable t) {
            Log.e(TAG, "Failed to install mini player glass", t);
        }
    }

    private static int id(Activity activity, String name) {
        Resources res = activity.getResources();
        int id = res.getIdentifier(name, "id", "com.spotify.music");
        return id != 0 ? id : res.getIdentifier(name, "id", activity.getPackageName());
    }

    static View findView(Activity activity, String name) {
        // Resources keep the original package name even if the app was cloned/renamed.
        int id = id(activity, name);
        return id == 0 ? null : activity.findViewById(id);
    }
}
