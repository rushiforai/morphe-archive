package semicoloncolonel.mobilestream.extension.shared.misc;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.graphics.Color;
import android.media.AudioManager;
import android.os.Bundle;
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
import java.lang.reflect.Method;


/**
 * Covers and mutes the ad breaks in ABC News's live streams.
 *
 * Live ads are stitched into the stream on Disney's servers, so they cannot be
 * removed. The player UI's AdState flag isInAd is set for each break and
 * cleared when it ends or the player closes. The cover goes over the screen in
 * front, and the media volume is muted until the flag is cleared. The cover
 * shows the time left from the player's own ad timer when it has one.
 */
@SuppressWarnings("unused")
public final class LiveBreakMask {
    private static final String TAG = "MSP-LIVE-MASK";
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private static boolean tracking;
    private static WeakReference<Activity> front = new WeakReference<>(null);
    private static View cover;
    private static boolean muted;
    // The state the player last asked for. The cover and the mute change on
    // the main thread, after the request, so they can lag behind it.
    private static volatile boolean wanted;
    private static Context audioContext;
    private static TextView label;
    private static Object timer;
    private static Method timerValue;

    private static final Runnable TICK = new Runnable() {
        @Override
        public void run() {
            if (cover == null) return;
            if (label != null) label.setText(coverText());
            MAIN.postDelayed(this, 500);
        }
    };

    private LiveBreakMask() {
    }

    /** Injection point: ComponentActivity.onCreate, to follow the screen in front. */
    public static void track(Activity activity) {
        front = new WeakReference<>(activity);
        if (tracking) return;
        tracking = true;
        audioContext = activity.getApplicationContext();
        activity.getApplication().registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            @Override
            public void onActivityResumed(Activity resumed) {
                front = new WeakReference<>(resumed);
                // Move a cover that is up to the new screen. apply() checks
                // the request when it runs, so a break that ended meanwhile is
                // not covered again.
                if (cover != null) MAIN.post(LiveBreakMask::apply);
            }

            @Override
            public void onActivityCreated(Activity created, Bundle state) {
            }

            @Override
            public void onActivityStarted(Activity started) {
            }

            @Override
            public void onActivityPaused(Activity paused) {
            }

            @Override
            public void onActivityStopped(Activity stopped) {
            }

            @Override
            public void onActivitySaveInstanceState(Activity activity, Bundle state) {
            }

            @Override
            public void onActivityDestroyed(Activity destroyed) {
            }
        });
    }

    /** Injection point: AdTimerControl's Render, with its StateFlow of milliseconds left. */
    public static void trackTimer(Object flow) {
        if (flow == null || flow == timer) return;
        try {
            timerValue = flow.getClass().getMethod("getValue");
            timer = flow;
        } catch (Exception ex) {
            Log.e(TAG, "timer failure", ex);
        }
    }

    private static CharSequence coverText() {
        try {
            if (timer != null) {
                Object value = timerValue.invoke(timer);
                if (value instanceof Number) {
                    long seconds = ((Number) value).longValue() / 1000;
                    if (seconds >= 0) {
                        return AdBreakText.timed(seconds);
                    }
                }
            }
        } catch (Exception ex) {
            Log.e(TAG, "timer read failure", ex);
            timer = null;
        }
        return AdBreakText.untimed();
    }

    /**
     * Injection point: AdStatusStateModifier, with the new isInAd value. CBS
     * News calls it too, from its ad events and when the stream is released.
     *
     * A break can start and end before the main thread runs the first change.
     * Comparing against the cover on screen would then drop the end, and the
     * cover and mute would stay up. The request is recorded here instead, and
     * apply() makes the screen match the latest one when it runs.
     */
    public static void onAdState(boolean inAd) {
        // A repeated start still retries a cover that could not go up (no
        // screen in front yet).
        if (inAd == wanted && inAd == (cover != null || muted)) return;
        wanted = inAd;
        MAIN.post(LiveBreakMask::apply);
    }

    private static void apply() {
        if (wanted) show();
        else hide();
    }

    private static void show() {
        try {
            Activity activity = front.get();
            if (activity == null || activity.isFinishing() || activity.isDestroyed()) return;
            ViewGroup decor = (ViewGroup) activity.getWindow().getDecorView();
            if (cover != null && cover.getParent() != decor) {
                ((ViewGroup) cover.getParent()).removeView(cover);
                cover = null;
            }
            if (cover == null) {
                cover = buildCover(activity);
                decor.addView(cover, new FrameLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
            }
            cover.bringToFront();
            MAIN.removeCallbacks(TICK);
            TICK.run();
            if (!muted && audioContext != null) {
                AudioManager audio = (AudioManager) audioContext.getSystemService(Context.AUDIO_SERVICE);
                audio.adjustStreamVolume(AudioManager.STREAM_MUSIC, AudioManager.ADJUST_MUTE, 0);
                muted = true;
            }
            Log.i(TAG, "Live break covered");
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
                label = null;
            }
            MAIN.removeCallbacks(TICK);
            if (muted && audioContext != null) {
                AudioManager audio = (AudioManager) audioContext.getSystemService(Context.AUDIO_SERVICE);
                audio.adjustStreamVolume(AudioManager.STREAM_MUSIC, AudioManager.ADJUST_UNMUTE, 0);
                muted = false;
                Log.i(TAG, "Live break ended");
            }
        } catch (Exception ex) {
            Log.e(TAG, "hide failure", ex);
        }
    }

    private static View buildCover(Activity activity) {
        FrameLayout layout = new FrameLayout(activity);
        layout.setBackgroundColor(Color.BLACK);
        // Taps on the cover close nothing and open no ad.
        layout.setClickable(true);

        label = new TextView(activity);
        label.setText(coverText());
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
