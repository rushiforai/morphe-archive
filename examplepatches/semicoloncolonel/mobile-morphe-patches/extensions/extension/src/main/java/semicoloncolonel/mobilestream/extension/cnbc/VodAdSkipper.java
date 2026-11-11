package semicoloncolonel.mobilestream.extension.cnbc;

import android.util.Log;

import java.lang.reflect.Method;

/**
 * CNBC "Skip ads": jumps over the ad breaks in on-demand videos.
 *
 * Amazon MediaTailor stitches the ads into the video stream, and ViewLift's
 * player downloads MediaTailor's ad timeline (its "avails", each with a start
 * and a length). AdUiUpdater.updateAdInfo runs on every tick of an ad break
 * to update the "Sponsored Ad" overlay. The patch calls {@link #onAdTick}
 * there, which seeks the player to the end of the break. Live video is left
 * alone, since the player cannot jump ahead of the broadcast.
 */
@SuppressWarnings("unused")
public final class VodAdSkipper {
    private static final String TAG = "MSP-CNBC";
    private static final String AD_UI_UPDATER = "com.vl.viewlift.playersdk.utils.AdUiUpdater";
    /** Lands just past the break, so the next tick does not see it again. */
    private static final long PAST_BREAK_MS = 250;

    private VodAdSkipper() {
    }

    public static void onAdTick() {
        try {
            Class<?> updater = Class.forName(AD_UI_UPDATER);
            Object instance = updater.getField("INSTANCE").get(null);
            Object avail = updater.getMethod("getLatestAdsAVail").invoke(instance);
            if (avail == null) return;
            Object player = updater.getMethod("access$getPlayer$p").invoke(null);
            if (player == null) return;
            Method isLive = player.getClass().getMethod("isCurrentMediaItemLive");
            if (Boolean.TRUE.equals(isLive.invoke(player))) return;
            double start = (Double) avail.getClass().getMethod("getStartTimeInSeconds").invoke(avail);
            double length = (Double) avail.getClass().getMethod("getDurationInSeconds").invoke(avail);
            long end = (long) ((start + length) * 1000) + PAST_BREAK_MS;
            player.getClass().getMethod("seekTo", long.class).invoke(player, end);
            Log.i(TAG, "Skipped an ad break of " + Math.round(length) + " s");
        } catch (Throwable t) {
            Log.w(TAG, "Could not skip the ad break", t);
        }
    }
}
