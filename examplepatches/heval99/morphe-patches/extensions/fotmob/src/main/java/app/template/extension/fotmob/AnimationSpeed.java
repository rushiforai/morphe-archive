package app.template.extension.fotmob;

import android.animation.ValueAnimator;
import android.app.Activity;
import android.content.ContentResolver;
import android.content.Context;
import android.os.Build;
import android.provider.Settings;
import android.util.Log;

import java.lang.reflect.Method;

import app.template.extension.hevalcontrols.HevalSettings;

/**
 * "Turn off animations" and "Faster animations" for FotMob (Patch settings switches). Off wins
 * when both are on; with both off every call answers exactly what the stock code got.
 *
 * <ul>
 *   <li>{@link #getFloat} replaces every app call to Settings.Global.getFloat(ContentResolver,
 *   String, float): Compose's motion duration scale, Lottie and the Material progress indicators
 *   read "animator_duration_scale" that way. Other settings pass through untouched.</li>
 *   <li>{@link #onActivityResumed} sets the process-wide ValueAnimator duration scale (View
 *   animators, RecyclerView item animations) through the hidden setDurationScale; on API 33+ a
 *   duration scale listener puts it back when the system resets it.</li>
 *   <li>{@link #onActivityCreated} turns the activity open/close transitions off on API 34+ while
 *   "Turn off animations" is on.</li>
 * </ul>
 * Every failure is caught and logged once; the app then keeps its stock animation speed.
 */
@SuppressWarnings("unused")
public final class AnimationSpeed {
    private static final String TAG = "Morphe-FotMob";

    static final String OFF = "fotmob.disable_animations";
    static final String FASTER = "fotmob.faster_animations";

    private static final String ANIMATOR_DURATION_SCALE = "animator_duration_scale";
    private static final float FASTER_FACTOR = 0.5f;

    /** True once this process changed the ValueAnimator scale, so turning both off restores it. */
    private static volatile boolean changed;
    private static volatile boolean listenerRegistered;
    private static volatile boolean applying;
    private static volatile boolean loggedFailure;
    private static Method setDurationScale;

    private AnimationSpeed() {
    }

    /** Replaces Settings.Global.getFloat(ContentResolver, String, float) everywhere in the app. */
    public static float getFloat(ContentResolver resolver, String name, float fallback) {
        float value = Settings.Global.getFloat(resolver, name, fallback);
        if (!ANIMATOR_DURATION_SCALE.equals(name)) return value;
        try {
            return scaled(value);
        } catch (Throwable failure) {
            logOnce(failure);
            return value;
        }
    }

    /** The scale to use instead of the system's [system] animator duration scale. */
    static float scaled(float system) {
        if (HevalSettings.isEnabled(OFF)) return 0f;
        if (HevalSettings.isEnabled(FASTER)) return system * FASTER_FACTOR;
        return system;
    }

    private static boolean active() {
        return HevalSettings.isEnabled(OFF) || HevalSettings.isEnabled(FASTER);
    }

    static void onActivityCreated(Activity activity) {
        try {
            if (Build.VERSION.SDK_INT >= 34 && HevalSettings.isEnabled(OFF)) {
                activity.overrideActivityTransition(Activity.OVERRIDE_TRANSITION_OPEN, 0, 0);
                activity.overrideActivityTransition(Activity.OVERRIDE_TRANSITION_CLOSE, 0, 0);
            }
        } catch (Throwable failure) {
            logOnce(failure);
        }
    }

    static void onActivityResumed(Activity activity) {
        try {
            applyDurationScale(activity);
            registerListener(activity.getApplicationContext());
        } catch (Throwable failure) {
            logOnce(failure);
        }
    }

    private static void applyDurationScale(Context context) throws Exception {
        boolean active = active();
        if (!active && !changed) return;
        float system = Settings.Global.getFloat(context.getContentResolver(), ANIMATOR_DURATION_SCALE, 1f);
        float target = scaled(system);
        if (ValueAnimator.getDurationScale() != target) setScale(target);
        changed = active;
    }

    private static synchronized void setScale(float scale) throws Exception {
        if (setDurationScale == null) {
            setDurationScale = ValueAnimator.class.getDeclaredMethod("setDurationScale", float.class);
            setDurationScale.setAccessible(true);
        }
        applying = true;
        try {
            setDurationScale.invoke(null, scale);
        } finally {
            applying = false;
        }
    }

    /** API 33+: the system resets the scale when the setting changes; put ours back. */
    private static void registerListener(final Context context) {
        if (Build.VERSION.SDK_INT < 33 || listenerRegistered || !active()) return;
        listenerRegistered = true;
        ValueAnimator.registerDurationScaleChangeListener(new ValueAnimator.DurationScaleChangeListener() {
            @Override
            public void onChanged(float scale) {
                if (applying) return;
                try {
                    applyDurationScale(context);
                } catch (Throwable failure) {
                    logOnce(failure);
                }
            }
        });
    }

    private static void logOnce(Throwable failure) {
        if (loggedFailure) return;
        loggedFailure = true;
        Log.w(TAG, "Animation speed not applied: " + failure.getClass().getName());
    }
}
