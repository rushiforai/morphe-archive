package app.southstar21.extension.youtubemusic.liquidglass;

import android.app.Activity;
import android.content.res.Resources;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;

import java.util.WeakHashMap;

/**
 * Liquid Glass patch for YouTube Music: entry point. The patch options are baked into the
 * methods below; there's no settings menu in YouTube Music yet.
 */
@SuppressWarnings("unused")
public final class LiquidGlassNavBarPatch {
    static final String TAG = "LiquidGlass";

    private static final WeakHashMap<View, LiquidGlassController> installed = new WeakHashMap<>();

    /** Set once the glass bar is up: from then on the content runs on under the bar. */
    private static volatile boolean contentBehindBar;

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

    /**
     * Called by the patch from WatchWhileLayout.onMeasure, which sizes the content (everything
     * but the player) to the screen less the tab bar. With the glass bar up the content keeps
     * the full height instead, so it scrolls on behind the glass.
     *
     * @param withoutBar the height YouTube Music wants: {@code full} less the bar's height
     * @param full       the whole layout's height
     */
    public static int contentHeight(int withoutBar, int full) {
        return contentBehindBar ? full : withoutBar;
    }

    /** YouTube Music's tab bar once the glass is on it. */
    private static java.lang.ref.WeakReference<View> glassBar;
    private static float density;

    /**
     * Called by the patch from WatchWhileLayout.onMeasure, which rests the player (a bottom
     * sheet) at the mini player's height plus the tab bar's. With the glass bar up the player
     * rests lower instead, so the mini player sits in the tab bar's row, docked next to the
     * tabs (see {@link Dock}).
     *
     * @param miniPlayer the mini player's height
     * @param bar        the tab bar's height, with its bottom margin
     * @return the part of the player's resting height above the tab bar
     */
    public static int miniPlayerHeight(int miniPlayer, int bar) {
        try {
            View view = glassBar == null ? null : glassBar.get();
            // Not the bar's visibility: YouTube Music hides the bar while the full player is
            // open, and undocking for that redid the whole layout on every open and close. A
            // hidden bar keeps its measured height; one with none has no row to dock in.
            if (!contentBehindBar || view == null || bar < Math.round(40 * density)) {
                Dock.resting = false;
                return miniPlayer;
            }
            Dock.resting = true;
            // The mini player's glass (4dp below its top) lines up with the bar's pill.
            return Math.round(Dock.TOP_INSET_DP * density) - Dock.barPadTop;
        } catch (Throwable t) {
            Log.e(TAG, "miniPlayerHeight", t);
            return miniPlayer;
        }
    }

    /** Called by YouTubeMusicHooks whenever the main activity gains or loses focus. */
    public static void onMainActivityReady(Activity activity) {
        try {
            View bar = findView(activity, "pivot_bar");
            if (!(bar instanceof ViewGroup) || installed.containsKey(bar)) return;
            if (!(bar.getParent() instanceof ViewGroup)) return;

            LiquidGlassController controller = new LiquidGlassController((ViewGroup) bar, null, true);
            controller.install();
            installed.put(bar, controller);
            density = bar.getResources().getDisplayMetrics().density;
            glassBar = new java.lang.ref.WeakReference<>(bar);
            contentBehindBar = true;
            View layout = findView(activity, "watch_while_layout");
            if (layout != null) layout.requestLayout();
            installMiniPlayer(activity);
            Log.d(TAG, "Installed on " + bar);
        } catch (Throwable t) {
            // Never take the app down over a cosmetic patch.
            Log.e(TAG, "Failed to install liquid glass tab bar", t);
        }
    }

    /** The mini player above the bar gets the same glass. */
    private static void installMiniPlayer(Activity activity) {
        try {
            View page = findView(activity, "player_page");
            int miniPlayerId = id(activity, "mini_player");
            if (!(page instanceof ViewGroup) || miniPlayerId == 0) return;
            new MiniPlayerGlass(activity, (ViewGroup) page, miniPlayerId, id(activity, "watch_fragment_container")).install();
        } catch (Throwable t) {
            Log.e(TAG, "Failed to install mini player glass", t);
        }
    }

    static int id(Activity activity, String name) {
        Resources res = activity.getResources();
        // Resources keep the original package name even if the app was renamed (GmsCore support).
        int id = res.getIdentifier(name, "id", "com.google.android.apps.youtube.music");
        return id != 0 ? id : res.getIdentifier(name, "id", activity.getPackageName());
    }

    static View findView(Activity activity, String name) {
        int id = id(activity, name);
        return id == 0 ? null : activity.findViewById(id);
    }
}
