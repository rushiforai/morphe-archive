package me.toidicakhia.extension.terabox;

import android.app.Activity;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.view.KeyEvent;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

/**
 * Closes the rewarded-ad surface once the SDK has granted the reward.
 *
 * The ad plays normally, so the completion reported to the ad network is real;
 * this only removes the end card that waits for a close button.
 *
 * Every rewarded network in TeraBox 4.28.5 presents its ad in an Activity, some
 * stacking browser, landing-page or MRAID Activities on top of the player.
 * Finishing only the top one leaves the player, or the mediator's "showing"
 * state, behind. So the whole stack is closed top-down: first a real BACK press
 * (the SDK runs its own close path and reports {@code onAdClosed}), then
 * {@code finish()} for anything that ignored it.
 *
 * The app's follow-up native ad is dismissed too, because the H5 reward
 * callback waits for it to close.
 */
@SuppressWarnings("unused")
public final class TeraboxAdCloser {

    private static final String TAG = "TeraboxAdCloser";

    /** Give the app a moment to handle the reward callback before the ad goes away. */
    private static final long CLOSE_DELAY_MS = 250L;

    /** Time the SDK gets to react to BACK before the Activity is finished. */
    private static final long BACK_GRACE_MS = 180L;

    /** How many follow-up passes run while the stack unwinds. */
    private static final int CLOSE_PASSES = 8;

    /** Close a rewarded ad that never reported a reward after this long. */
    private static final long STUCK_AD_TIMEOUT_MS = 90_000L;

    private static final String ACTIVITY_MANAGER = "com.dubox.drive.ActivityLifecycleManager";

    /**
     * Full-screen native ad the app shows after a reward (H5 `showNativeADCount`).
     * The reward callback is only answered once this activity is closed.
     */
    private static final String EXTRA_NATIVE_ACTIVITY =
            "com.dubox.drive.ads.natives.SingleNativeAdSceneActivity";

    /** Let the native ad render before dismissing it, like a user skipping it. */
    private static final long EXTRA_NATIVE_DELAY_MS = 1200L;

    private static final long EXTRA_NATIVE_POLL_MS = 250L;

    private static final int EXTRA_NATIVE_POLLS = 80;

    /** Keep the clicker paused while the H5 answers the reward and refreshes. */
    private static final long REWARD_HOLD_MS = 3000L;

    private static volatile long lastRewardAt = Long.MIN_VALUE;

    /** When the current ad surface appeared; used by the stuck-ad watchdog. */
    private static volatile long adSince = Long.MIN_VALUE;

    /** End of the current follow-up-native-ad watch, so rewards do not stack loops. */
    private static volatile long nativeWatchUntil = Long.MIN_VALUE;

    /**
     * Full-screen ad activities taken from the 4.28.5 manifest. The Benefits
     * placement runs through MAX, whose waterfall reaches Mars ADX, Vlion,
     * Meta and Moloco as well. Consoles, consent pages and debug screens are
     * deliberately excluded.
     */
    private static final String[] AD_ACTIVITY_PREFIXES = {
            // MAX / AppLovin, including the immersive variant.
            "com.applovin.adview.",
            // Pangle / ByteDance: TTRewardVideoActivity, TTFullScreenVideoActivity,
            // TTAdActivity, landing pages and the TTDelegateActivity proxy.
            "com.bytedance.sdk.openadsdk.activity.",
            // Meta Audience Network (rewarded and interstitial share this Activity).
            "com.facebook.ads.AudienceNetworkActivity",
            // AdMob.
            "com.google.android.gms.ads.AdActivity",
            // Moloco: VastActivity, MraidActivity, StaticAdActivity,
            // FullscreenWebviewActivity.
            "com.moloco.",
            // MBridge / Mintegral.
            "com.mbridge.msdk.reward.player.MBRewardVideoActivity",
            "com.mbridge.msdk.activity.MBCommonActivity",
            "com.mbridge.msdk.out.LoadingActivity",
            // Smaato.
            "com.smaato.sdk.rewarded.",
            "com.smaato.sdk.interstitial.",
            "com.smaato.sdk.core.browser.SmaatoSdkBrowserActivity",
            // Vungle / Liftoff.
            "com.vungle.ads.internal.ui.VungleActivity",
            // InMobi.
            "com.inmobi.ads.rendering.InMobiAdActivity",
            // Bigo.
            "sg.bigo.ads.",
            // AdMaster.
            "cc.admaster.android.proxy.api.",
            // PubNative / Verve.
            "net.pubnative.lite.sdk.rewarded.",
            "net.pubnative.lite.sdk.interstitial.",
            "net.pubnative.lite.sdk.utils.browser.BrowserActivity",
            // Mars ADX and the Menta source (also reached directly by the app).
            "com.mars.united.international.ads.adx.",
            "com.mars.united.international.ads.adsource.",
            // Vlion / Menta.
            "com.advlion.ad.",
            // Brandio.
            "com.brandio.ads.",
    };

    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private TeraboxAdCloser() {
    }

    /** Called from the injected reward callback, before the app handles it. */
    public static void close() {
        lastRewardAt = SystemClock.elapsedRealtime();
        // The reward arrived, so a stuck ad must not be force-closed any more.
        adSince = Long.MIN_VALUE;
        // Let the app process the reward (unlock the privilege, answer the H5
        // callback) before the ad window disappears.
        MAIN.postDelayed(new Runnable() {
            @Override
            public void run() {
                closeAdStack(0, false);
            }
        }, CLOSE_DELAY_MS);
        watchExtraNativeAd();
    }

    /**
     * Closes the topmost ad Activity one pass at a time. Working top-down keeps
     * a landing page from swallowing the BACK meant for the video player below.
     *
     * Pass 0 calls {@code onBackPressed()} (the modern SDK path), pass 1 sends a
     * real key event for SDKs that only listen to key dispatch, later passes
     * finish whatever is still there. A new pass finds the next layer, so a
     * whole stack unwinds instead of one Activity being left behind.
     */
    private static void closeAdStack(final int pass, final boolean force) {
        Activity activity = currentAdActivity();
        if (activity == null) {
            return;
        }
        String name = activity.getClass().getName();
        if (force) {
            Log.i(TAG, "Finishing " + name);
            finishQuietly(activity);
        } else if (pass == 0) {
            Log.i(TAG, "Back press on " + name);
            backPress(activity);
        } else {
            Log.i(TAG, "Sending BACK to " + name);
            sendBack(activity);
        }

        if (pass + 1 >= CLOSE_PASSES) {
            return;
        }
        final int next = pass + 1;
        MAIN.postDelayed(new Runnable() {
            @Override
            public void run() {
                closeAdStack(next, next >= 2);
            }
        }, BACK_GRACE_MS);
    }

    /**
     * Some rewarded networks never deliver the reward callback when an ad is
     * stuck or the mediation waterfall fails. Called from the task poller, this
     * closes the ad after a generous timeout so the flow cannot hang forever.
     */
    public static void watchStuckAd() {
        if (!isAdOnTop()) {
            adSince = Long.MIN_VALUE;
            return;
        }
        long now = SystemClock.elapsedRealtime();
        if (adSince == Long.MIN_VALUE) {
            adSince = now;
        } else if (now - adSince > STUCK_AD_TIMEOUT_MS &&
                now - lastRewardAt > STUCK_AD_TIMEOUT_MS) {
            Log.w(TAG, "Ad did not report a reward, closing it");
            adSince = Long.MIN_VALUE;
            closeAdStack(2, true);
        }
    }

    /**
     * True while any ad, or the app's follow-up native ad, is still in the
     * Activity stack. The task clicker pauses itself then, so a second task
     * cannot start another ad request while one is still playing.
     */
    public static boolean isAdOnTop() {
        for (Activity activity : activities()) {
            if (activity == null || activity.isFinishing() || activity.isDestroyed()) {
                continue;
            }
            if (isAdSurface(activity.getClass().getName())) {
                return true;
            }
        }
        // Fallback when the host does not expose its Activity list.
        Activity activity = currentActivity();
        return activity != null && isAdSurface(activity.getClass().getName());
    }

    /**
     * The Activity currently playing an SDK ad, or {@code null}. Used to put
     * the "watching ad" pill on top of the ad itself.
     */
    public static Activity currentAdActivity() {
        List<Activity> all = activities();
        for (int i = all.size() - 1; i >= 0; i--) {
            Activity activity = all.get(i);
            if (activity == null || activity.isFinishing() || activity.isDestroyed()) {
                continue;
            }
            if (isAdActivity(activity.getClass().getName())) {
                return activity;
            }
        }
        // Fallback when the host does not expose its Activity list.
        Activity current = currentActivity();
        return current != null && isAdActivity(current.getClass().getName()) ? current : null;
    }

    /** True while the H5 page may still be processing a reward it just received. */
    public static boolean recentlyRewarded() {
        return SystemClock.elapsedRealtime() - lastRewardAt < REWARD_HOLD_MS;
    }

    /**
     * True when {@code activity} is the one the user is actually looking at.
     * A "watch video" task can open another full-screen WebView or a video
     * player; while that covers the task page, its clicker must not keep
     * starting tasks in the background.
     */
    public static boolean isOnTop(Activity activity) {
        return activity != null && activity == currentActivity();
    }

    /**
     * The app starts its extra native ad from the reward callback, so it is not
     * on top yet when {@link #close()} runs. Poll for it for a few seconds.
     */
    private static void watchExtraNativeAd() {
        long now = SystemClock.elapsedRealtime();
        // A second reward arriving while the native ad is still expected must
        // not start another polling loop.
        if (now < nativeWatchUntil) {
            return;
        }
        nativeWatchUntil = now + EXTRA_NATIVE_POLL_MS * EXTRA_NATIVE_POLLS + 1000L;
        MAIN.postDelayed(new Runnable() {

            private int polls;

            @Override
            public void run() {
                Activity activity = findExtraNativeAd();
                if (activity != null) {
                    Log.i(TAG, "Extra native ad shown, closing it in " +
                            EXTRA_NATIVE_DELAY_MS + " ms");
                    nativeWatchUntil = Long.MIN_VALUE;
                    finishLater(activity, EXTRA_NATIVE_DELAY_MS);
                    return;
                }

                if (++polls < EXTRA_NATIVE_POLLS) {
                    MAIN.postDelayed(this, EXTRA_NATIVE_POLL_MS);
                } else {
                    nativeWatchUntil = Long.MIN_VALUE;
                }
            }
        }, EXTRA_NATIVE_POLL_MS);
    }

    /** Finds the app's follow-up native ad anywhere in the stack, not only on top. */
    private static Activity findExtraNativeAd() {
        List<Activity> all = activities();
        for (int i = all.size() - 1; i >= 0; i--) {
            Activity activity = all.get(i);
            if (activity != null &&
                    EXTRA_NATIVE_ACTIVITY.equals(activity.getClass().getName())) {
                return activity;
            }
        }
        Activity current = currentActivity();
        if (current != null && EXTRA_NATIVE_ACTIVITY.equals(current.getClass().getName())) {
            return current;
        }
        return null;
    }

    private static void finishLater(final Activity activity, long delayMs) {
        MAIN.postDelayed(new Runnable() {
            @Override
            public void run() {
                Log.i(TAG, "Finishing " + activity.getClass().getName());
                finishQuietly(activity);
            }
        }, delayMs);
    }

    /**
     * The SDK-backed way to leave an ad. {@code Activity.onBackPressed()}
     * delegates to the modern OnBackPressedDispatcher, which many reward
     * networks use instead of the older key-event callbacks.
     */
    private static void backPress(Activity activity) {
        try {
            Method method = Activity.class.getMethod("onBackPressed");
            method.invoke(activity);
        } catch (Throwable throwable) {
            Log.w(TAG, "Could not call onBackPressed(), falling back to key events", throwable);
            sendBack(activity);
        }
    }

    /** Delivers a real BACK key event for SDKs that only watch key dispatch. */
    private static void sendBack(Activity activity) {
        try {
            activity.dispatchKeyEvent(new KeyEvent(KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_BACK));
            activity.dispatchKeyEvent(new KeyEvent(KeyEvent.ACTION_UP, KeyEvent.KEYCODE_BACK));
        } catch (Throwable throwable) {
            Log.w(TAG, "Could not send BACK to the ad activity", throwable);
            finishQuietly(activity);
        }
    }

    private static void finishQuietly(Activity activity) {
        try {
            if (!activity.isFinishing() && !activity.isDestroyed()) {
                activity.finish();
            }
        } catch (Throwable throwable) {
            Log.w(TAG, "Could not finish the ad activity", throwable);
        }
    }

    /** Copy of the host's Activity stack, oldest first, top last. */
    private static List<Activity> activities() {
        try {
            Method method = Class.forName(ACTIVITY_MANAGER).getDeclaredMethod("____");
            method.setAccessible(true);
            Object value = method.invoke(null);
            if (value instanceof List) {
                List<?> raw = (List<?>) value;
                List<Activity> out = new ArrayList<>(raw.size());
                for (Object item : raw) {
                    if (item instanceof Activity) {
                        out.add((Activity) item);
                    }
                }
                return out;
            }
        } catch (Throwable throwable) {
            Log.w(TAG, "Could not read the Activity stack", throwable);
        }
        return new ArrayList<>();
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

    /** An ad Activity, or the app's follow-up native ad. */
    private static boolean isAdSurface(String name) {
        return EXTRA_NATIVE_ACTIVITY.equals(name) || isAdActivity(name);
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
