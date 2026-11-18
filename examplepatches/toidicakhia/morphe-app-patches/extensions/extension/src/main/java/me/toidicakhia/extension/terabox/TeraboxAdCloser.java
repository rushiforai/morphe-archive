package me.toidicakhia.extension.terabox;

import android.app.Activity;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import java.lang.reflect.Method;

/**
 * Finishes the rewarded-ad activity once the SDK has granted the reward.
 *
 * The ad keeps playing normally, so the completion reported to the ad network
 * is real; this only removes the end card that otherwise waits for the user to
 * press its close button. The app's own extra native ad, which it shows after
 * the reward and which holds back the H5 success callback until it is closed,
 * is dismissed as well.
 */
@SuppressWarnings("unused")
public final class TeraboxAdCloser {

    private static final String TAG = "TeraboxAdCloser";

    /** Give the app a moment to handle the reward callback before the ad goes away. */
    private static final long CLOSE_DELAY_MS = 350L;

    private static final String ACTIVITY_MANAGER = "com.dubox.drive.ActivityLifecycleManager";

    /**
     * Full-screen native ad the app shows after a reward (H5 `showNativeADCount`).
     * The reward callback is only answered once this activity is closed.
     */
    private static final String EXTRA_NATIVE_ACTIVITY =
            "com.dubox.drive.ads.natives.SingleNativeAdSceneActivity";

    /** Let the native ad render before dismissing it, like a user skipping it. */
    private static final long EXTRA_NATIVE_DELAY_MS = 3000L;

    private static final long EXTRA_NATIVE_POLL_MS = 300L;

    private static final int EXTRA_NATIVE_POLLS = 30;

    /**
     * Activities that can host a rewarded video. These are the ad SDKs declared
     * in the 4.27.5 manifest: the Benefits placement
     * (`ad_placement_reward_h5_wap`) runs through MAX, whose server chain falls
     * back to the Mars ADX / Menta (advlion) / Meta / Moloco sources, so every
     * one of them has to be listed.
     */
    private static final String[] AD_ACTIVITY_PREFIXES = {
            "cc.admaster.",
            "com.advlion.",
            "com.applovin.",
            "com.brandio.",
            "com.bytedance.",
            "com.facebook.ads.",
            "com.google.android.gms.ads.",
            "com.inmobi.",
            "com.mars.united.international.ads.",
            "com.mbridge.",
            "com.moloco.",
            "com.smaato.",
            "com.vungle.",
            "net.pubnative.",
            "sg.bigo.ads.",
    };

    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private TeraboxAdCloser() {
    }

    public static void close() {
        final Activity activity = currentActivity();
        if (activity != null) {
            final String name = activity.getClass().getName();
            if (isAdActivity(name)) {
                Log.i(TAG, "Reward earned on " + name + ", closing it in " + CLOSE_DELAY_MS + " ms");
                finishLater(activity, name, CLOSE_DELAY_MS);
            } else {
                Log.d(TAG, "Top activity is not an ad: " + name);
            }
        }

        watchExtraNativeAd();
    }

    /**
     * True while an ad, or the app's follow-up native ad, covers the task page.
     * The task clicker pauses itself then, so a second task cannot start another
     * ad request while one is still playing.
     */
    public static boolean isAdOnTop() {
        final Activity activity = currentActivity();
        if (activity == null) {
            return false;
        }
        final String name = activity.getClass().getName();
        return isAdActivity(name) || EXTRA_NATIVE_ACTIVITY.equals(name);
    }

    /**
     * The app starts its extra native ad from the reward callback, so it is not
     * on top yet when {@link #close()} runs. Poll for it for a few seconds.
     */
    private static void watchExtraNativeAd() {
        MAIN.postDelayed(new Runnable() {

            private int polls;

            @Override
            public void run() {
                final Activity activity = currentActivity();
                if (activity != null &&
                        EXTRA_NATIVE_ACTIVITY.equals(activity.getClass().getName())) {
                    Log.i(TAG, "Extra native ad shown, closing it in " +
                            EXTRA_NATIVE_DELAY_MS + " ms");
                    finishLater(activity, EXTRA_NATIVE_ACTIVITY, EXTRA_NATIVE_DELAY_MS);
                    return;
                }

                if (++polls < EXTRA_NATIVE_POLLS) {
                    MAIN.postDelayed(this, EXTRA_NATIVE_POLL_MS);
                }
            }
        }, EXTRA_NATIVE_POLL_MS);
    }

    private static void finishLater(final Activity activity, final String name, long delayMs) {
        MAIN.postDelayed(new Runnable() {
            @Override
            public void run() {
                try {
                    if (!activity.isFinishing() && !activity.isDestroyed()) {
                        Log.i(TAG, "Finishing " + name);
                        activity.finish();
                    }
                } catch (Throwable throwable) {
                    Log.w(TAG, "Could not finish " + name, throwable);
                }
            }
        }, delayMs);
    }

    private static Activity currentActivity() {
        try {
            Method method = Class.forName(ACTIVITY_MANAGER).getDeclaredMethod("______");
            method.setAccessible(true);
            Object value = method.invoke(null);
            return value instanceof Activity ? (Activity) value : null;
        } catch (Throwable throwable) {
            Log.w(TAG, "Could not resolve the current activity", throwable);
            return null;
        }
    }

    private static boolean isAdActivity(String name) {
        for (String prefix : AD_ACTIVITY_PREFIXES) {
            if (name.startsWith(prefix)) {
                return true;
            }
        }
        return false;
    }
}
