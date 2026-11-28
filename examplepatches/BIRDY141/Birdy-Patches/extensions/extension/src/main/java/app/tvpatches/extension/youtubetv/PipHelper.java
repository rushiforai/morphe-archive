package app.tvpatches.extension.youtubetv;

import android.app.Activity;
import android.app.PictureInPictureParams;
import android.content.pm.PackageManager;
import android.os.Build;
import android.util.Log;
import android.util.Rational;

import java.lang.ref.WeakReference;

/**
 * Picture-in-Picture (PiP) helper for BirdyTV.
 * Triggered from CobaltActivity.onUserLeaveHint() when video playback is active,
 * or explicitly via "@enterpip" from JS.
 */
@SuppressWarnings("unused")
public final class PipHelper {
    private static volatile boolean pipEnabled = true;
    private static volatile boolean videoPlaying = false;
    private static WeakReference<Activity> activityRef = new WeakReference<>(null);

    private PipHelper() {
    }

    public static void setActivity(Activity activity) {
        activityRef = new WeakReference<>(activity);
    }

    public static void setPipEnabled(boolean enabled) {
        pipEnabled = enabled;
    }

    public static void setVideoPlaying(boolean playing) {
        videoPlaying = playing;
    }

    public static void onUserLeaveHint(Activity activity) {
        // PiP is triggered explicitly via the player PiP button (@enterpip).
    }

    public static void enterPipNow() {
        Activity activity = activityRef.get();
        if (activity != null) enterPip(activity);
    }

    private static void enterPip(Activity activity) {
        if (activity == null || Build.VERSION.SDK_INT < 26) return;
        try {
            if (activity.isFinishing() || activity.isDestroyed()) return;
            if (activity.isInPictureInPictureMode()) return;
            PackageManager pm = activity.getPackageManager();
            if (pm != null && !pm.hasSystemFeature(PackageManager.FEATURE_PICTURE_IN_PICTURE)) return;
            PictureInPictureParams params = new PictureInPictureParams.Builder()
                    .setAspectRatio(new Rational(16, 9))
                    .build();
            activity.enterPictureInPictureMode(params);
            Log.i(TvScripts.TAG, "pip: entered picture-in-picture mode");
        } catch (Throwable t) {
            Log.w(TvScripts.TAG, "pip: failed to enter PiP: " + t);
        }
    }
}
