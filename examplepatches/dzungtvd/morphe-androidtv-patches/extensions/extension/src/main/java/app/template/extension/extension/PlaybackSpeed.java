package app.template.extension.extension;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.View;

import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.Locale;

/** Applies TikTok Lite's playback speed to the TV player. */
@SuppressWarnings("unused")
public final class PlaybackSpeed {

    private static final String TAG = "TikTokTVSpeed";
    private static final String PREFS = "TikTokTVPlayback";

    /** The saved rate. One of {@link #SPEEDS}; 1x when nothing has been picked. */
    public static final String PREF_SPEED = "speed";

    /** The rates the TV app offers, in the order the Lite sheet lists them. */
    public static final float[] SPEEDS = {2f, 1.5f, 1f, 0.5f};

    private static final String PLAYBACK_PARAMS = "com.ss.ttm.player.PlaybackParams";
    private static final long[] REAPPLY_DELAYS = {300L, 1200L};

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Runnable REAPPLY = PlaybackSpeed::applyCurrent;

    private static WeakReference<Context> context;
    private static WeakReference<Object> current;
    private static WeakReference<Object> appliedTo;
    private static float appliedSpeed = Float.NaN;
    private static float desired = 1f;

    private PlaybackSpeed() {
    }

    /** Called for every full-screen play, before the engine reports a position. */
    public static void onPlay(Object fragment) {
        Object view = Subtitles.call(fragment, "getView");
        if (!(view instanceof View)) return;

        View root = (View) view;
        noteContext(root.getContext());
        PlaybackSpeedMenu.notePlayer(root);

        // A reused engine can drop the rate when it prepares the next video. Forget the last
        // write so the first position poll restores it, and write again once the player settles.
        appliedTo = null;
        appliedSpeed = Float.NaN;
        scheduleReapply();
    }

    /** Called with each engine the app asks for its position, which is the engine on screen. */
    public static void noteEngine(Object engine) {
        if (engine == null) return;

        current = new WeakReference<>(engine);
        Object applied = appliedTo == null ? null : appliedTo.get();
        if (applied == engine && appliedSpeed == desired) return;
        apply(engine, desired);
    }

    /** Saves a rate and writes it to the player that is on screen now. */
    public static void setSpeed(Context context, float speed) {
        noteContext(context);
        desired = speed;
        prefs(context).edit().putFloat(PREF_SPEED, speed).apply();
        applyCurrent();
        Log.i(TAG, "playback speed " + label(speed));
    }

    /** @return the saved rate, or 1x when the viewer never picked one. */
    public static float speed(Context context) {
        return prefs(context).getFloat(PREF_SPEED, 1f);
    }

    /** @return the rate in force, from the last context this class saw. */
    public static float speed() {
        return desired;
    }

    public static SharedPreferences prefs(Context context) {
        return context.getApplicationContext().getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    /** @return the rate as Lite spells it: 2x, 1.5x, 1x, 0.5x. */
    public static String label(float speed) {
        String text = String.format(Locale.US, "%.2f", speed);
        while (text.endsWith("0")) text = text.substring(0, text.length() - 1);
        if (text.endsWith(".")) text = text.substring(0, text.length() - 1);
        return text + "x";
    }

    /** @return whether this is the rate the viewer picked. */
    public static boolean isPicked(float speed) {
        return Math.abs(speed - desired) < 0.001f;
    }

    // ---------------------------------------------------------------------------------------------
    // Applying it
    // ---------------------------------------------------------------------------------------------

    private static void noteContext(Context source) {
        if (source == null) return;

        Context app = source.getApplicationContext();
        if (app == null) app = source;
        context = new WeakReference<>(app);
        desired = speed(app);
    }

    private static void scheduleReapply() {
        MAIN.removeCallbacks(REAPPLY);
        for (long delay : REAPPLY_DELAYS) MAIN.postDelayed(REAPPLY, delay);
    }

    private static void applyCurrent() {
        Object engine = current == null ? null : current.get();
        apply(engine, desired);
    }

    /**
     * The exact call Lite makes: a fresh PlaybackParams whose mSpeed is the rate, passed to
     * TTVideoEngine.setPlaybackParams.
     */
    private static void apply(Object engine, float speed) {
        if (engine == null) return;

        try {
            Class<?> params = Class.forName(PLAYBACK_PARAMS, false, engine.getClass().getClassLoader());
            Object values = params.getConstructor().newInstance();
            params.getMethod("setSpeed", float.class).invoke(values, speed);

            for (Method method : engine.getClass().getMethods()) {
                if (!"setPlaybackParams".equals(method.getName())) continue;

                Class<?>[] types = method.getParameterTypes();
                if (types.length != 1 || !types[0].isAssignableFrom(params)) continue;

                method.invoke(engine, values);
                appliedTo = new WeakReference<>(engine);
                appliedSpeed = speed;
                return;
            }
            Log.i(TAG, "no setPlaybackParams on " + engine.getClass().getName());
        } catch (Throwable failure) {
            Log.i(TAG, "playback speed not applied " + failure);
        }
    }
}
