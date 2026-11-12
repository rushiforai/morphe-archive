package app.template.extension.flashscore;

import android.animation.ValueAnimator;
import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.os.Build;
import android.os.Bundle;
import android.provider.Settings;
import android.util.Log;

import app.template.extension.hevalcontrols.HevalSettings;

import java.lang.reflect.Method;

/**
 * The "Animation speed" switches of Flashscore's Patch settings. Both read once per process
 * (restart required). With both switches off every hook passes the system value through unchanged
 * and nothing is registered, so the app is stock.
 *
 * <ul>
 *   <li>{@link #durationScale} replaces the app's {@code ValueAnimator.getDurationScale()} read
 *       (the Compose motion scale), returning the system scale times the switch factor.</li>
 *   <li>{@link #init} (called right after the Application's super.onCreate) scales
 *       ValueAnimator's own duration scale and keeps it scaled when the framework sets it again.</li>
 *   <li>"Turn off animations" also drops the activity open and close transitions.</li>
 * </ul>
 */
@SuppressWarnings("unused")
public final class AnimationSpeed {

    static final String OFF = "flashscore.animations_off";
    static final String FAST = "flashscore.animations_fast";

    /** Settings.Global.ANIMATOR_DURATION_SCALE. */
    private static final String ANIMATOR_DURATION_SCALE = "animator_duration_scale";
    private static final String TAG = "HevalControls";

    /** The factor read at init (0, 0.5 or 1); NaN until then. */
    private static volatile float factor = Float.NaN;

    private static volatile Context context;
    private static volatile Method setDurationScale;
    private static volatile boolean applying;
    private static volatile boolean loggedFailure;

    /** Held strongly: ValueAnimator keeps its listeners as weak references. */
    private static Object scaleListener;
    private static Application.ActivityLifecycleCallbacks callbacks;

    /** 0 while "Turn off animations" is on, 0.5 while only "Faster animations" is on, else 1. */
    static float readFactor() {
        if (HevalSettings.isEnabled(OFF)) return 0f;
        if (HevalSettings.isEnabled(FAST)) return 0.5f;
        return 1f;
    }

    private static float currentFactor() {
        float value = factor;
        // Before init (a read during start-up) the switches are read live.
        return value == value ? value : readFactor();
    }

    /** Replaces {@code ValueAnimator.getDurationScale()} in the app (Compose's motion scale). */
    public static float durationScale() {
        float value = ValueAnimator.getDurationScale();
        float scale = currentFactor();
        return scale == 1f ? value : value * scale;
    }

    /** Called right after the Application's super.onCreate. Does nothing while both switches are off. */
    public static void init(Application application) {
        try {
            float value = readFactor();
            factor = value;
            if (value == 1f) return;
            context = application.getApplicationContext();
            enforce();
            if (Build.VERSION.SDK_INT >= 33) {
                ValueAnimator.DurationScaleChangeListener listener = scale -> enforce();
                scaleListener = listener;
                ValueAnimator.registerDurationScaleChangeListener(listener);
            }
            callbacks = new Callbacks(value == 0f);
            application.registerActivityLifecycleCallbacks(callbacks);
        } catch (Throwable failure) {
            logOnce(failure);
        }
    }

    /**
     * Sets ValueAnimator's duration scale to the system scale times the factor. The framework
     * sets it from the system value when the first activity starts and on every change, so this
     * runs again from the scale listener (API 33+) and before each activity is created.
     */
    static void enforce() {
        if (applying) return;
        try {
            Context app = context;
            if (app == null) return;
            float target = Settings.Global.getFloat(app.getContentResolver(), ANIMATOR_DURATION_SCALE, 1f)
                * currentFactor();
            if (ValueAnimator.getDurationScale() == target) return;
            Method setter = setDurationScale;
            if (setter == null) {
                // Hidden API (@hide, unsupported app usage). If it is ever blocked, the
                // durationScale redirect still covers Compose.
                setter = ValueAnimator.class.getDeclaredMethod("setDurationScale", float.class);
                setter.setAccessible(true);
                setDurationScale = setter;
            }
            applying = true;
            try {
                setter.invoke(null, target);
            } finally {
                applying = false;
            }
        } catch (Throwable failure) {
            logOnce(failure);
        }
    }

    private static void logOnce(Throwable failure) {
        if (loggedFailure) return;
        loggedFailure = true;
        Log.w(TAG, "Animation speed: " + failure.getClass().getName());
    }

    /** Re-applies the scale for each activity; with "Turn off animations", drops its transitions. */
    private static final class Callbacks implements Application.ActivityLifecycleCallbacks {
        private final boolean off;

        Callbacks(boolean off) {
            this.off = off;
        }

        @Override
        public void onActivityCreated(Activity activity, Bundle state) {
            enforce();
            if (!off) return;
            try {
                if (Build.VERSION.SDK_INT >= 34) {
                    activity.overrideActivityTransition(Activity.OVERRIDE_TRANSITION_OPEN, 0, 0);
                    activity.overrideActivityTransition(Activity.OVERRIDE_TRANSITION_CLOSE, 0, 0);
                } else {
                    activity.overridePendingTransition(0, 0);
                }
            } catch (Throwable failure) {
                logOnce(failure);
            }
        }

        @Override
        public void onActivityPaused(Activity activity) {
            if (!off || Build.VERSION.SDK_INT >= 34) return;
            try {
                if (activity.isFinishing()) activity.overridePendingTransition(0, 0);
            } catch (Throwable failure) {
                logOnce(failure);
            }
        }

        @Override public void onActivityStarted(Activity activity) { }
        @Override public void onActivityResumed(Activity activity) { }
        @Override public void onActivityStopped(Activity activity) { }
        @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) { }
        @Override public void onActivityDestroyed(Activity activity) { }
    }

    private AnimationSpeed() { }
}
