package app.template.extension.extension;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import java.lang.ref.WeakReference;

/** Keeps the current post playing when the app is backgrounded, optionally as audio only. */
@SuppressWarnings("unused")
public final class BackgroundPlay {

    private static final String TAG = "TikTokTVBg";
    private static final String PREFS = "TikTokTVPlayback";

    /** The saved mode. One of {@link #MODE_OFF}, {@link #MODE_AUDIO}, {@link #MODE_PIP}. */
    public static final String PREF_MODE = "background";

    public static final int MODE_OFF = 0;
    public static final int MODE_AUDIO = 1;
    /** Reserved for Phase 3; the More row does not offer it while the hardware cannot do PiP. */
    public static final int MODE_PIP = 2;

    /** The controller states that mean "a prepared player exists": playing, paused, active. */
    private static final int STATE_IDLE = 0;
    private static final int STATE_PLAYING = 2;
    private static final int STATE_PAUSED = 3;
    private static final int STATE_ACTIVE = 4;

    /** How long the synchronous fragment resume gets before a preserved marker is called stale. */
    private static final long RESUME_GRACE_MS = 500L;

    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private static WeakReference<Context> sContext;
    private static WeakReference<Activity> sActivity;
    private static WeakReference<Object> sPreserved;
    private static boolean sActivityPaused;
    private static boolean sWasPlaying;
    private static boolean sReported;
    private static int sOtherResumed;
    private static int sGeneration;
    private static Tracker sTracker;

    private BackgroundPlay() {
    }

    // ---------------------------------------------------------------------------------------------
    // Activity lifecycle
    // ---------------------------------------------------------------------------------------------

    /** Called at instruction 0 of {@code MainTvActivity.onPause()}. */
    public static void onActivityPause(Activity activity) {
        if (activity == null) return;

        sActivity = new WeakReference<>(activity);
        noteContext(activity);
        sActivityPaused = true;
        sOtherResumed = 0;
        sReported = false;
        registerTracker(activity);
        Log.i(TAG, "activity pause");
    }

    /** Called at instruction 0 of MainTvActivity.onResume(). */
    public static void onActivityResume(Activity activity) {
        sActivityPaused = false;
        Log.i(TAG, "activity resume");

        Object expected = sPreserved == null ? null : sPreserved.get();
        if (expected == null) return;

        // Safety net: if no fragment consumes the marker (the activity came back on a different
        // screen, or the fragment was replaced while stopped), the engine would keep playing
        // invisibly. The synchronous fragment resume has finished long before this runs.
        int expectedGeneration = sGeneration;
        MAIN.postDelayed(() -> {
            if (sGeneration != expectedGeneration) return;
            if (sPreserved == null || sPreserved.get() != expected) return;

            sPreserved = null;
            sActivityPaused = false;
            sWasPlaying = false;

            // The guard is off now, so the patched onPauseInternal() takes the stock path.
            Subtitles.call(expected, "onPauseInternal");
            Log.i(TAG, "stale preserved released");
        }, RESUME_GRACE_MS);
    }

    /** Called at instruction 0 of MainTvActivity.onStop(). */
    public static void onActivityStop(Activity activity) {
        if (activity == null) return;

        if (activity.isFinishing()) {
            sPreserved = null;
            sWasPlaying = false;
            Log.i(TAG, "stopping: finishing");
            return;
        }

        Object fragment = sPreserved == null ? null : sPreserved.get();
        if (fragment == null) return;

        if (sOtherResumed > 0) {
            sPreserved = null;
            sActivityPaused = false;
            sWasPlaying = false;
            sReported = true;

            // Let the stock body report the watch block, stop the controller and release it.
            Subtitles.call(fragment, "onPauseInternal");
            Log.i(TAG, "covered; released preserved player");
            return;
        }

        // Genuine background. Report the watch block once, without pausing the engine.
        if (!sReported) {
            sReported = true;
            Subtitles.call(fragment, "pauseOrCompletePlay");
            Log.i(TAG, "background keep pos=" + positionOf(controllerOf(fragment)));
        }
    }

    /** Called at instruction 0 of {@code MainTvActivity.onDestroy()}. */
    public static void onActivityDestroy(Activity activity) {
        unregisterTracker(activity);
        sContext = null;
        sActivity = null;
        sPreserved = null;
        sActivityPaused = false;
        sWasPlaying = false;
        sReported = false;
        sOtherResumed = 0;
        Log.i(TAG, "activity destroy");
    }

    // ---------------------------------------------------------------------------------------------
    // The two bytecode guards
    // ---------------------------------------------------------------------------------------------

    /** Called at instruction 0 of BaseVideoFragment.onPauseInternal(). */
    public static boolean shouldKeepPlaying(Object fragment) {
        if (fragment == null) return false;

        Activity activity = asActivity(Subtitles.call(fragment, "getActivity"));
        if (activity == null) return false;
        if (activity.isFinishing() || activity.isChangingConfigurations()) return false;
        if (!sActivityPaused) return false;                    // in-app fragment switch, not background
        if (mode(activity) != MODE_AUDIO) return false;

        Object ready = Subtitles.call(fragment, "getHasInitPlayView");
        if (!(ready instanceof Boolean) || !((Boolean) ready)) return false;

        Object controller = Subtitles.call(fragment, "getMTvPlayerController");
        if (controller == null) return false;

        int state = stateOf(controller);
        if (state != STATE_PLAYING && state != STATE_PAUSED && state != STATE_ACTIVE) return false;

        sPreserved = new WeakReference<>(fragment);
        sWasPlaying = (state == STATE_PLAYING || state == STATE_ACTIVE);
        sGeneration++;

        Log.i(TAG, "keep fragment=" + fragment.getClass().getSimpleName()
                + " state=" + state + " pos=" + positionOf(controller));
        return true;
    }

    /** Called at instruction 0 of BaseVideoFragment.rePlayOnResume(). */
    public static boolean skipReplayOnResume(Object fragment) {
        Object held = sPreserved == null ? null : sPreserved.get();
        if (held != fragment) return false;

        sPreserved = null;

        Object controller = controllerOf(fragment);
        int state = stateOf(controller);
        if (state == STATE_IDLE) {
            // The engine did not survive; the stock restart is the only way back to a picture.
            sWasPlaying = false;
            Log.i(TAG, "preserved engine is gone; stock restart");
            return false;
        }

        if (sWasPlaying && state == STATE_PAUSED) {
            // The surface most likely went away while stopped and the engine paused itself.
            // d() is TvPlayerControllerV2's resume-play path (the same call resumePlay() makes);
            // it does not restart the post.
            Subtitles.call(controller, "d");
            Log.i(TAG, "resume engine");
        }

        Log.i(TAG, "resume kept state=" + state + " pos=" + positionOf(controller));
        sWasPlaying = false;
        return true;
    }

    // ---------------------------------------------------------------------------------------------
    // The setting
    // ---------------------------------------------------------------------------------------------

    public static int mode(Context context) {
        int value = prefs(context).getInt(PREF_MODE, MODE_OFF);
        return value == MODE_AUDIO || value == MODE_PIP ? value : MODE_OFF;
    }

    /** @return the saved mode using the most recent context or the app context. */
    public static int mode() {
        Context context = appContext();
        return context == null ? MODE_OFF : mode(context);
    }

    public static void setMode(Context context, int value) {
        if (value != MODE_AUDIO && value != MODE_PIP) value = MODE_OFF;

        noteContext(context);
        Context app = context == null ? null : context.getApplicationContext();
        if (app == null) app = context;
        if (app != null) {
            prefs(app).edit().putInt(PREF_MODE, value).apply();
        }
        Log.i(TAG, "mode " + label(value));
    }

    public static String label(int value) {
        if (value == MODE_AUDIO) return "Only audio";
        if (value == MODE_PIP) return "Picture-in-picture";
        return "Off";
    }

    public static void noteContext(Context context) {
        if (context == null) return;
        Context app = context.getApplicationContext();
        if (app == null) app = context;
        sContext = new WeakReference<>(app);
    }

    public static Context context() {
        return sContext == null ? null : sContext.get();
    }

    /**
     * The menu list is built before any row is bound, so the first open of the More pane may not
     * have a remembered context yet.
     */
    public static Context appContext() {
        Context context = context();
        if (context != null) return context;
        try {
            Object app = Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication")
                    .invoke(null);
            if (app instanceof Context) {
                noteContext((Context) app);
                return (Context) app;
            }
        } catch (Throwable failure) {
            Log.i(TAG, "no app context " + failure);
        }
        return null;
    }

    private static SharedPreferences prefs(Context context) {
        Context app = context.getApplicationContext();
        if (app == null) app = context;
        return app.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    // ---------------------------------------------------------------------------------------------
    // Reflection helpers
    // ---------------------------------------------------------------------------------------------

    private static Object controllerOf(Object fragment) {
        return Subtitles.call(fragment, "getMTvPlayerController");
    }

    private static int stateOf(Object controller) {
        Object raw = Subtitles.call(controller, "m");
        return raw instanceof Integer ? (Integer) raw : STATE_IDLE;
    }

    /** @return the current position in ms, or -1 when the diagnostics path is unavailable. */
    private static long positionOf(Object controller) {
        Object player = Subtitles.call(controller, "h");
        Object raw = Subtitles.call(player, "b");
        return raw instanceof Long ? (Long) raw : -1L;
    }

    private static Activity asActivity(Object value) {
        return value instanceof Activity ? (Activity) value : null;
    }

    // ---------------------------------------------------------------------------------------------
    // In-app overlay detection
    // ---------------------------------------------------------------------------------------------

    private static void registerTracker(Activity activity) {
        if (sTracker != null) return;

        Application app = activity.getApplication();
        if (app == null) return;

        try {
            sTracker = new Tracker();
            app.registerActivityLifecycleCallbacks(sTracker);
        } catch (Throwable failure) {
            sTracker = null;
            Log.i(TAG, "tracker not registered " + failure);
        }
    }

    private static void unregisterTracker(Activity activity) {
        Application app = activity == null ? null : activity.getApplication();
        if (app != null && sTracker != null) {
            try {
                app.unregisterActivityLifecycleCallbacks(sTracker);
            } catch (Throwable failure) {
                Log.i(TAG, "tracker not unregistered " + failure);
            }
        }
        sTracker = null;
    }

    /** Counts resumed activities other than the tracked {@code MainTvActivity}. */
    private static final class Tracker implements Application.ActivityLifecycleCallbacks {

        private static Activity current() {
            return sActivity == null ? null : sActivity.get();
        }

        @Override
        public void onActivityResumed(Activity activity) {
            if (activity != current()) {
                sOtherResumed++;
                Log.i(TAG, "other activity resumed " + activity.getClass().getSimpleName());
            }
        }

        @Override
        public void onActivityPaused(Activity activity) {
            if (activity != current() && sOtherResumed > 0) {
                sOtherResumed--;
            }
        }

        @Override
        public void onActivityCreated(Activity activity, Bundle state) {
        }

        @Override
        public void onActivityStarted(Activity activity) {
        }

        @Override
        public void onActivityStopped(Activity activity) {
        }

        @Override
        public void onActivitySaveInstanceState(Activity activity, Bundle state) {
        }

        @Override
        public void onActivityDestroyed(Activity activity) {
        }
    }
}
