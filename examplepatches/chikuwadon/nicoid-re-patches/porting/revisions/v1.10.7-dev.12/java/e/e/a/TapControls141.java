package e.e.a;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.preference.PreferenceManager;
import android.view.MotionEvent;
import android.view.SurfaceView;
import android.view.TextureView;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

/** Gates the confirmed control toggle without consuming playback touch streams. */
public final class TapControls141 {
    static final String KEY = "nicoid_single_tap_control_region";
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final WeakHashMap<Activity, Tap> TAPS = new WeakHashMap<>();
    private static SharedPreferences preferences;
    private static volatile TapRegions141 regions = TapRegions141.preset(TapRegions141.ALL);
    private static final SharedPreferences.OnSharedPreferenceChangeListener LISTENER =
            (prefs, key) -> { if (key == null || KEY.equals(key)) regions = load(prefs); };

    private TapControls141() {}

    private static TapRegions141 load(SharedPreferences prefs) {
        try { return TapRegions141.parse(prefs.getString(KEY, "all")); }
        catch (ClassCastException ignored) { return TapRegions141.preset(TapRegions141.ALL); }
    }

    static TapRegions141 settings(Context context) {
        if (preferences == null) {
            Context app = context.getApplicationContext();
            preferences = PreferenceManager.getDefaultSharedPreferences(app == null ? context : app);
            preferences.registerOnSharedPreferenceChangeListener(LISTENER);
            regions = load(preferences);
        }
        return regions;
    }

    static void save(Context context, TapRegions141 value) {
        settings(context);
        regions = value;
        preferences.edit().putString(KEY, value.encode()).apply();
    }

    private static View render(View view) {
        if (view instanceof TextureView || view instanceof SurfaceView) return view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                View child = render(group.getChildAt(i));
                if (child != null && child.isShown() && child.getWidth() > 0) return child;
            }
        }
        return null;
    }

    private static boolean alwaysVisible(Context context, boolean popup) {
        try {
            return Boolean.TRUE.equals(Dev112.staticCall("e.e.a.PlayerVisibility192", "enabled",
                    new Class<?>[]{Context.class, boolean.class}, context, popup));
        } catch (Exception ignored) {
            return false;
        }
    }

    static boolean allows(View video, float x, float y, boolean popup) {
        if (video == null || !video.isAttachedToWindow() || !video.isShown()) return false;
        View display = render(video);
        if (display == null) display = video;
        int[] at = new int[2];
        display.getLocationOnScreen(at);
        float minimum = popup ? 24 * video.getResources().getDisplayMetrics().density : 0;
        Context context = video.getContext();
        return settings(context).contains(x - at[0], y - at[1],
                display.getWidth(), display.getHeight(), minimum)
                && !alwaysVisible(context, popup);
    }

    private static final class Tap {
        WeakReference<View> player;
        float x, y;
        int slop, width, height;
        long down;
        boolean candidate;
        Runnable pending;

        void cancel() {
            candidate = false;
            if (pending != null) MAIN.removeCallbacks(pending);
            pending = null;
        }

        boolean moved(MotionEvent event) {
            float dx = event.getRawX() - x, dy = event.getRawY() - y;
            return dx * dx + dy * dy > (float) slop * slop;
        }
    }

    private static View player(Activity activity) throws Exception {
        Object fragment = Dev112.get(activity, "v");
        return fragment == null ? null : (View) Dev112.get(fragment, "a0");
    }

    /** Observe cancellations even when the seek or gesture recognizer consumes the event. */
    public static void activityInput(Activity activity, MotionEvent event) {
        Tap tap = TAPS.get(activity);
        if (tap == null) return;
        int action = event.getActionMasked();
        if (action == MotionEvent.ACTION_DOWN || action == MotionEvent.ACTION_CANCEL
                || action == MotionEvent.ACTION_POINTER_DOWN || action == MotionEvent.ACTION_POINTER_UP
                || (action == MotionEvent.ACTION_MOVE && tap.candidate && tap.moved(event))) {
            tap.cancel();
        }
    }

    /** Observe only the stream the Activity is about to pass to Android's normal view dispatch. */
    public static void activityTouch(Activity activity, MotionEvent event) {
        int action = event.getActionMasked();
        if (action == MotionEvent.ACTION_DOWN) {
            try {
                View video = player(activity);
                float x = event.getRawX(), y = event.getRawY();
                if (!allows(video, x, y, false)) {
                    if (video != null && video.isShown()) trace(video, false);
                    return;
                }
                // Direct controls still receive every original event.
                if (Boolean.TRUE.equals(Dev112.staticCall("e.e.a.Review181", "control",
                        new Class<?>[]{View.class, float.class, float.class, View.class},
                        activity.getWindow().getDecorView(), x, y, video))) return;
                Tap tap = TAPS.get(activity);
                if (tap == null) {
                    tap = new Tap();
                    TAPS.put(activity, tap);
                }
                tap.player = new WeakReference<>(video);
                tap.x = x;
                tap.y = y;
                tap.width = video.getWidth();
                tap.height = video.getHeight();
                tap.slop = ViewConfiguration.get(activity).getScaledTouchSlop();
                tap.down = event.getDownTime();
                tap.candidate = true;
            } catch (Exception failure) {
                android.util.Log.w("nicoid-tap-area", "Unable to track player tap", failure);
            }
            return;
        }
        if (action != MotionEvent.ACTION_UP) return;
        Tap tap = TAPS.get(activity);
        if (tap == null || !tap.candidate || tap.down != event.getDownTime()) return;
        tap.candidate = false;
        long up = event.getEventTime();
        if (tap.moved(event) || up - tap.down >= ViewConfiguration.getLongPressTimeout()) return;
        WeakReference<Activity> owner = new WeakReference<>(activity);
        tap.pending = () -> confirm(owner.get(), tap);
        MAIN.postAtTime(tap.pending, up + ViewConfiguration.getDoubleTapTimeout() + 1L);
    }

    private static void confirm(Activity activity, Tap tap) {
        tap.pending = null;
        View video = tap.player.get();
        if (activity == null || activity.isFinishing() || video == null || !video.hasWindowFocus()
                || video.getWidth() != tap.width || video.getHeight() != tap.height) return;
        try {
            if (video != player(activity) || !allows(video, tap.x, tap.y, false)) return;
            Object controls = video.getClass().getMethod("getVideoControlsCore").invoke(video);
            if (controls == null) return;
            if (Boolean.TRUE.equals(controls.getClass().getMethod("isVisible").invoke(controls))) {
                controls.getClass().getMethod("hide", boolean.class).invoke(controls, false);
            } else {
                video.getClass().getMethod("showControls").invoke(video);
            }
            trace(video, true);
        } catch (Exception failure) {
            android.util.Log.w("nicoid-tap-area", "Unable to toggle player controls", failure);
        }
    }

    private static void trace(View video, boolean allowed) {
        if (regions.mode != TapRegions141.ALL && android.util.Log.isLoggable("nicoid-tap-area", android.util.Log.DEBUG)) {
            android.util.Log.d("nicoid-tap-area", "Normal player mode=" + regions.mode + " allowed=" + allowed
                    + " video=" + video.getWidth() + "x" + video.getHeight());
        }
    }
}
