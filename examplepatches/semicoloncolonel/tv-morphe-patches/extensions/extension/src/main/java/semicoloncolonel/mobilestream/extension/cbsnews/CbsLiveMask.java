package semicoloncolonel.mobilestream.extension.cbsnews;

import android.app.Activity;
import android.os.SystemClock;
import android.util.Log;

import semicoloncolonel.mobilestream.extension.shared.misc.LiveBreakMask;

/**
 * Covers and mutes the ad breaks in CBS News's Google DAI live stream.
 *
 * The IMA SDK reports the start and end of each ad break to the Paramount AVIA
 * player's DAI listener. The cover goes up at a break's start and comes down
 * at its end, or when AVIA releases the stream. The IMA classes are read
 * through reflection, since the extension is not built against them.
 */
@SuppressWarnings("unused")
public final class CbsLiveMask {
    private static final String TAG = "MSP-CBS-ADS";
    private static final Remaining REMAINING = new Remaining();
    private static boolean inBreak;
    private static long breakEnd;

    private CbsLiveMask() {
    }

    /**
     * Read by LiveBreakMask's countdown: milliseconds left in the break, or
     * null while the length is unknown, which shows the cover without a time.
     */
    public static final class Remaining {
        public Long getValue() {
            if (breakEnd == 0) return null;
            return Math.max(0L, breakEnd - SystemClock.elapsedRealtime());
        }
    }

    /** Injection point: HomePageActivity.onCreate. */
    public static void track(Activity activity) {
        LiveBreakMask.track(activity);
    }

    /** Injection point: the DAI listener's onAdEvent, with the IMA AdEvent. */
    public static void onAdEvent(Object event) {
        try {
            String type = String.valueOf(call(event, "getType"));
            switch (type) {
                case "AD_BREAK_STARTED":
                case "AD_PERIOD_STARTED":
                    if (!inBreak) {
                        inBreak = true;
                        breakEnd = 0;
                        LiveBreakMask.onAdState(true);
                    }
                    break;
                case "STARTED":
                    if (inBreak && breakEnd == 0) readBreakLength(event);
                    break;
                case "AD_BREAK_ENDED":
                case "AD_PERIOD_ENDED":
                    end();
                    break;
                default:
                    break;
            }
        } catch (Exception ex) {
            Log.e(TAG, "ad event failure", ex);
        }
    }

    /** Injection point: AVIA's DAI plugin releasing the stream. */
    public static void onStreamReleased() {
        end();
    }

    private static void end() {
        if (!inBreak) return;
        inBreak = false;
        breakEnd = 0;
        LiveBreakMask.onAdState(false);
    }

    // AdEvent.getAd().getAdPodInfo().getMaxDuration(), in seconds.
    private static void readBreakLength(Object event) {
        try {
            Object ad = call(event, "getAd");
            Object pod = ad == null ? null : call(ad, "getAdPodInfo");
            Object max = pod == null ? null : call(pod, "getMaxDuration");
            if (max instanceof Number && ((Number) max).doubleValue() > 0) {
                breakEnd = SystemClock.elapsedRealtime() + (long) (((Number) max).doubleValue() * 1000);
                LiveBreakMask.trackTimer(REMAINING);
            }
        } catch (Exception ex) {
            Log.e(TAG, "break length failure", ex);
        }
    }

    private static Object call(Object target, String name) throws Exception {
        return target.getClass().getMethod(name).invoke(target);
    }
}
