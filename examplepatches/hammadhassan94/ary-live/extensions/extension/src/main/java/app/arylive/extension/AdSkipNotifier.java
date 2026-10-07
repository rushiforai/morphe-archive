package app.arylive.extension;

import android.app.Application;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.widget.Toast;

/**
 * On-screen notice when an ad was blocked.
 *
 * Video (IMA) uses a dedicated message so drama/playback skips are obvious.
 * UI banners share a separate throttle so they do not drown out video notices.
 *
 * We cannot show an exact "N ads will be skipped" count: the client never
 * loads the ad pod once AdsConfiguration / AdsLoader is removed.
 */
@SuppressWarnings("unused")
public final class AdSkipNotifier {

    private static final long UI_MIN_INTERVAL_MS = 2500L;
    private static final long VIDEO_MIN_INTERVAL_MS = 8000L;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private static volatile long lastUiShownMs;
    private static volatile long lastVideoShownMs;

    private AdSkipNotifier() {
    }

    /** Generic UI / banner / interstitial skip. */
    public static void notifySkipped() {
        showThrottled("Ad skipped", false);
    }

    /**
     * Player / drama IMA path — main user-facing proof that video ads were blocked.
     */
    public static void notifyVideoSkipped() {
        showThrottled("Video ads skipped — playing content", true);
    }

    public static void notifySkipped(final String message) {
        showThrottled(message, false);
    }

    private static void showThrottled(final String message, final boolean video) {
        final long now = SystemClock.uptimeMillis();
        if (video) {
            if (now - lastVideoShownMs < VIDEO_MIN_INTERVAL_MS) {
                return;
            }
            lastVideoShownMs = now;
        } else {
            if (now - lastUiShownMs < UI_MIN_INTERVAL_MS) {
                return;
            }
            lastUiShownMs = now;
        }

        MAIN.post(new Runnable() {
            @Override
            public void run() {
                Application app = currentApplication();
                if (app == null) {
                    return;
                }
                Toast.makeText(
                        app,
                        message,
                        video ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT
                ).show();
            }
        });
    }

    private static Application currentApplication() {
        try {
            return (Application) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication")
                    .invoke(null);
        } catch (Throwable ignored) {
            return null;
        }
    }
}
