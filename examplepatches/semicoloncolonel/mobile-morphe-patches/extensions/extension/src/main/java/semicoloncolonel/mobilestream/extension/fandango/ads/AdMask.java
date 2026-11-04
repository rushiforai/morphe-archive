package semicoloncolonel.mobilestream.extension.fandango.ads;

import android.app.Activity;
import android.content.Context;
import android.graphics.Color;
import android.media.AudioManager;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;

import java.lang.ref.WeakReference;

import semicoloncolonel.mobilestream.extension.shared.misc.AdBreakText;

/**
 * Covers and mutes Fandango at Home's ad breaks while the ads play.
 *
 * Free titles only stream after their ads have played, so the ads still run
 * and are reported as usual. The player's own session calls mark each ad:
 * the cover goes up when an ad session starts and comes down shortly after
 * the last ad in a break ends, or when the title's session starts.
 */
@SuppressWarnings("unused")
public final class AdMask {
    private static final String TAG = "MSP-FANDANGO-ADS";
    // Between two ads in one break, the next ad starts within this time.
    private static final long UNMASK_DELAY_MS = 1500;

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static WeakReference<Activity> player = new WeakReference<>(null);
    private static View cover;
    private static boolean muted;
    private static final Runnable UNMASK = AdMask::hide;

    private AdMask() {
    }

    /** Injection point: PlayerActivity.onCreate. */
    public static void attach(Activity activity) {
        player = new WeakReference<>(activity);
    }

    /** Injection point: PlayerActivity.onStop. */
    public static void detach(Activity activity) {
        MAIN.post(() -> {
            if (player.get() == activity) hide();
        });
    }

    /** Injection point: PlaybackData.startAdvertStreamingSession. */
    public static void onAdvertStart() {
        MAIN.post(() -> {
            MAIN.removeCallbacks(UNMASK);
            show();
        });
    }

    /** Injection point: PlaybackData.stopAdvertStreamingSession. */
    public static void onAdvertStop() {
        MAIN.post(() -> {
            MAIN.removeCallbacks(UNMASK);
            MAIN.postDelayed(UNMASK, UNMASK_DELAY_MS);
        });
    }

    /** Injection point: PlaybackData.startContentStreamingSession. */
    public static void onContentStart() {
        MAIN.post(() -> {
            MAIN.removeCallbacks(UNMASK);
            hide();
        });
    }

    private static void show() {
        try {
            Activity activity = player.get();
            if (activity == null || activity.isFinishing() || activity.isDestroyed()) return;

            if (cover == null || cover.getParent() == null) {
                ViewGroup decor = (ViewGroup) activity.getWindow().getDecorView();
                cover = buildCover(activity);
                decor.addView(cover, new FrameLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
            }
            cover.setVisibility(View.VISIBLE);
            cover.bringToFront();

            if (!muted) {
                AudioManager audio = (AudioManager) activity.getSystemService(Context.AUDIO_SERVICE);
                audio.adjustStreamVolume(AudioManager.STREAM_MUSIC, AudioManager.ADJUST_MUTE, 0);
                muted = true;
            }
            Log.i(TAG, "Ad break covered");
        } catch (Exception ex) {
            Log.e(TAG, "show failure", ex);
        }
    }

    private static void hide() {
        try {
            if (cover != null) {
                ViewGroup parent = (ViewGroup) cover.getParent();
                if (parent != null) parent.removeView(cover);
                cover = null;
            }
            if (muted) {
                Context context = player.get();
                if (context != null) {
                    AudioManager audio = (AudioManager) context.getSystemService(Context.AUDIO_SERVICE);
                    audio.adjustStreamVolume(AudioManager.STREAM_MUSIC, AudioManager.ADJUST_UNMUTE, 0);
                }
                muted = false;
                Log.i(TAG, "Ad break ended");
            }
        } catch (Exception ex) {
            Log.e(TAG, "hide failure", ex);
        }
    }

    private static View buildCover(Activity activity) {
        FrameLayout layout = new FrameLayout(activity);
        layout.setBackgroundColor(Color.BLACK);
        // Swallow taps so the ad's click-through cannot be opened by accident.
        layout.setClickable(true);

        TextView label = new TextView(activity);
        label.setText(AdBreakText.untimed());
        label.setTextColor(Color.LTGRAY);
        label.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        label.setGravity(Gravity.CENTER);
        int padding = (int) TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, 32, activity.getResources().getDisplayMetrics());
        label.setPadding(padding, padding, padding, padding);
        layout.addView(label, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        return layout;
    }
}
