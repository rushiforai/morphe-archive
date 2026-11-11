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
    private static final String OPEN_ONLY = "nicoid_single_tap_region_open_only";
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

    static boolean openOnly(Context context) {
        settings(context);
        return preferences.getBoolean(OPEN_ONLY, false);
    }

    static void save(Context context, TapRegions141 value, boolean openOnly) {
        settings(context);
        regions = value;
        preferences.edit().putString(KEY, value.encode()).putBoolean(OPEN_ONLY, openOnly).apply();
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

    static boolean allows(View video, float x, float y, boolean popup, boolean closing) {
        if (video == null || !video.isAttachedToWindow() || !video.isShown()) return false;
        Context context = video.getContext();
        if (alwaysVisible(context, popup)) return false;
        if (closing && openOnly(context)) return true;
        View display = render(video);
        if (display == null) display = video;
        int[] at = new int[2];
        display.getLocationOnScreen(at);
        float minimum = popup ? 24 * video.getResources().getDisplayMetrics().density : 0;
        x -= at[0];
        y -= at[1];
        return settings(context).contains(x, y, display.getWidth(), display.getHeight(), minimum);
    }

    private static final class Tap {
        WeakReference<View> player;
        WeakReference<Object> fragment;
        boolean local, startedVisible;
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

    private static View player(Object fragment, boolean local) throws Exception {
        return (View) Dev112.get(fragment, local ? "Z" : "a0");
    }

    /** Called from the stock overlay's DOWN-only toggle branch, before native drag/seek tracking. */
    public static void nativeDown(Object fragment, MotionEvent event) {
        try {
            Activity activity = (Activity) Dev112.get(fragment, "A1");
            if (activity == null) return;
            boolean local = Dev112.get(activity, "w") == fragment;
            View video = player(fragment, local);
            boolean visible = Boolean.TRUE.equals(Dev112.get(fragment, local ? "T1" : "Q1"));
            float x = event.getRawX(), y = event.getRawY();
            if (!allows(video, x, y, false, visible)) {
                if (video != null) trace(false, visible);
                return;
            }
            Tap tap = TAPS.get(activity);
            if (tap == null) {
                tap = new Tap();
                TAPS.put(activity, tap);
            }
            tap.player = new WeakReference<>(video);
            tap.fragment = new WeakReference<>(fragment);
            tap.local = local;
            tap.startedVisible = visible;
            tap.x = x;
            tap.y = y;
            tap.width = video.getWidth();
            tap.height = video.getHeight();
            tap.slop = ViewConfiguration.get(activity).getScaledTouchSlop();
            tap.down = event.getDownTime();
            tap.candidate = true;
        } catch (Exception failure) {
            android.util.Log.w("nicoid-tap-area", "Unable to track overlay tap", failure);
        }
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

    /** Finish only taps that passed the Activity's gesture handlers and reached the overlay. */
    public static void activityTouch(Activity activity, MotionEvent event) {
        if (event.getActionMasked() != MotionEvent.ACTION_UP) return;
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
            Object fragment = tap.fragment.get();
            if (fragment == null || Dev112.get(activity, tap.local ? "w" : "v") != fragment
                    || video != player(fragment, tap.local)
                    || Boolean.TRUE.equals(Dev112.get(fragment, tap.local ? "A0" : "x0"))) return;
            boolean visible = Boolean.TRUE.equals(Dev112.get(fragment, tap.local ? "T1" : "Q1"));
            if (visible != tap.startedVisible || !allows(video, tap.x, tap.y, false, visible)) return;
            fragment.getClass().getMethod(tap.local ? "i" : "j", int.class).invoke(fragment, visible ? 4 : 2);
            trace(true, visible);
        } catch (Exception failure) {
            android.util.Log.w("nicoid-tap-area", "Unable to toggle nicoid overlay controls", failure);
        }
    }

    private static void trace(boolean allowed, boolean closing) {
        if (regions.mode != TapRegions141.ALL) {
            android.util.Log.i("nicoid-tap-area", "Foreground single tap mode=" + regions.mode
                    + " closing=" + closing + " allowed=" + allowed);
        }
    }
}
