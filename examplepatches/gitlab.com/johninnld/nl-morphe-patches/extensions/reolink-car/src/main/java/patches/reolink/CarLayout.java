package patches.reolink;

import android.app.Activity;
import android.content.Context;
import android.content.res.Configuration;
import android.os.Build;
import android.util.Log;
import android.view.Display;

/**
 * Reolink's phone layouts on a landscape car display.
 * <p>
 * Reolink picks each screen's layout from the configuration orientation: the overview and the
 * camera page with its controls are portrait layouts, and its landscape player is a bare
 * full-screen video whose Back only asks Android to rotate the phone. A car display never
 * rotates, so that Back never leaves. On a car display every Reolink screen therefore gets a
 * portrait configuration while its window keeps the whole width of the car screen, and the
 * players switch between their portrait page and full-screen video by recreating themselves
 * instead of rotating.
 * <p>
 * A parked app is an ordinary activity that the car host launches onto a display of its own, so the
 * activity itself shows where it is: every display other than the phone's own counts, whichever host
 * (Android Auto, DriveDeck or another) created it. Nothing changes on the phone display.
 */
public final class CarLayout {
    static final String TAG = "NlReolinkCar";

    /** Screens with a portrait page and a full-screen video. */
    private static final String[] PLAYERS = {
            "com.android.bc.player.playerv2.PlayerV2Activity",
            "com.android.bc.player.playerv2.playbackpage.PlaybackV2Activity",
    };

    /** The next player created shows full-screen video; set just before a player recreates itself. */
    private static volatile boolean fullScreenRequested;

    private CarLayout() {
    }

    /**
     * BaseStatusActivity.attachBaseContext: the portrait configuration on a car display, unless this
     * player was recreated for full-screen video.
     */
    public static Context wrap(Activity activity, Context base) {
        try {
            final boolean player = isPlayer(activity);
            final boolean fullScreen = player && fullScreenRequested;
            if (player) fullScreenRequested = false;
            if (fullScreen || !isCarDisplay(base)) return base;

            final Configuration current = base.getResources().getConfiguration();
            if (current.orientation == Configuration.ORIENTATION_PORTRAIT) return base;
            final Configuration portrait = new Configuration(current);
            portrait.orientation = Configuration.ORIENTATION_PORTRAIT;
            Log.i(TAG, "Portrait layout across the car display for " + activity.getClass().getName());
            return base.createConfigurationContext(portrait);
        } catch (RuntimeException ex) {
            Log.e(TAG, "wrap failure", ex);
            return base;
        }
    }

    /**
     * PlayerV2Activity and PlaybackV2Activity switchOrientation: their full-screen button, and Back
     * in full screen. On a car display the player toggles between its portrait page and full-screen
     * video by recreating itself. Returns false to let the phone rotate as usual.
     */
    public static boolean switchOrientation(Activity activity) {
        try {
            if (!isCarDisplay(activity)) return false;
            final boolean toFullScreen =
                    activity.getResources().getConfiguration().orientation != Configuration.ORIENTATION_LANDSCAPE;
            Log.i(TAG, (toFullScreen ? "Full-screen video" : "Portrait page") + " on the car display");
            fullScreenRequested = toFullScreen;
            activity.recreate();
            return true;
        } catch (RuntimeException ex) {
            Log.e(TAG, "switchOrientation failure", ex);
            fullScreenRequested = false;
            return false;
        }
    }

    private static boolean isPlayer(Activity activity) {
        final String name = activity.getClass().getName();
        for (String player : PLAYERS) {
            if (player.equals(name)) return true;
        }
        return false;
    }

    private static Display getDisplay(Context context) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.R) return null;
        try {
            return context.getDisplay();
        } catch (UnsupportedOperationException ex) {
            return null; // Not a context of a display.
        }
    }

    /** Any display other than the phone's own: no list of hosts decides it. */
    static boolean isCarDisplay(Context context) {
        final Display display = getDisplay(context);
        return display != null && display.getDisplayId() != Display.DEFAULT_DISPLAY;
    }
}
