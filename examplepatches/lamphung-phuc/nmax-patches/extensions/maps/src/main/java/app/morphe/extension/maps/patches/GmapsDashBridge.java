package app.morphe.extension.maps.patches;

import android.app.Activity;
import android.app.PictureInPictureParams;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.ActivityInfo;
import android.graphics.Canvas;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.os.Build;
import android.os.Handler;
import android.view.Choreographer;
import android.view.InputDevice;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import com.lampp.nmaxconnect.dashui.DashCastUi;
import android.os.Bundle;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.view.Surface;
import android.view.SurfaceHolder;

import java.lang.invoke.MethodHandles;
import java.lang.invoke.MethodType;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Hands Maps' map renderer a Surface owned by NmaxConnect (the dash stream) in place of the phone's SurfaceView.
 *
 * Maps' map view is an obfuscated SurfaceView that implements SurfaceHolder.Callback and passes the holder straight to
 * its GL thread, which gives it to EGL10.eglCreateWindowSurface. EGL takes any SurfaceHolder, so the dash goes in as a
 * {@link DashHolder} through the view's own callbacks; no obfuscated name is called except the GL pause/resume pair,
 * whose names the patch writes into {@link #pauseName}/{@link #resumeName}.
 *
 * Hooks (GmapsDashPatch.kt): the view's surfaceCreated/Changed/Destroyed and GL pause/resume call in here first and
 * skip their own work when this returns null. Everything runs on the main thread, where those callbacks already run.
 *
 * The dash gets the map only while Maps navigates ({@link #navigating}, from GmapsDashNav); before that the rider plans
 * the trip on the phone. While navigating, a button over the phone map moves the map between the dash and the phone.
 * Rider options from Maps' Settings → NMAX patch ({@link NmaxSettings}): portrait while navigating on the dash,
 * and whether Maps may go picture-in-picture (its enter/params calls go through {@link #enterPip}/{@link #pipParams}).
 */
public final class GmapsDashBridge {
    private static final String TAG = "GmapsDash";
    private static final long WATCHDOG_MS = 2_000L;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private static final class State {
        SurfaceHolder phone; // null while the phone has no surface
        int format = PixelFormat.RGBA_8888;
        int width;
        int height;
        boolean paused; // the Activity paused the map (screen off, Maps in the background)
    }

    private static final Map<Object, State> VIEWS = new WeakHashMap<>();
    private static WeakReference<Object> target = new WeakReference<>(null);
    private static DashHolder dash;
    /** The dash has the map: a client surface, Maps navigating, the rider has not taken it to the phone. */
    private static volatile boolean shown;
    private static boolean navigating;
    private static boolean onPhone;
    /** True while this class drives the view's callbacks itself, so the hooks let the call through. */
    private static boolean passing;

    private static final String MAPS_ACTIVITY = "com.google.android.maps.MapsActivity";
    private static volatile boolean lockPortrait = true;
    private static volatile boolean pip;
    private static volatile boolean optionsLoaded;
    private static WeakReference<Activity> mapsActivity = new WeakReference<>(null);
    private static WeakReference<Activity> locked = new WeakReference<>(null);
    private static int unlockedOrientation;

    private GmapsDashBridge() {
    }

    // The patch replaces both bodies with the obfuscated method names of this Maps build.
    private static String pauseName() {
        return null;
    }

    private static String resumeName() {
        return null;
    }

    private static String lifecycleEventName() {
        return null;
    }

    private static State state(Object view) {
        State s = VIEWS.get(view);
        if (s == null) {
            s = new State();
            VIEWS.put(view, s);
        }
        return s;
    }

    private static boolean owns(Object view) {
        return shown && target.get() == view;
    }

    /** Hooked dispatchTouchEvent of Maps' map container: true = swallow, the dash has the map (a pan would move it). */
    public static boolean eatTouch(Object container) {
        return shown && !injecting;
    }

    private static final String MAP_CONTAINER = "com.google.android.apps.gmm.base.views.map.MapViewContainer";
    private static final int PINCH_MOVES = 8;
    private static final long PINCH_STEP_MS = 16L;
    /** True only while {@link #pinch} hands the container one of its own events, which {@link #eatTouch} lets in. */
    private static boolean injecting;

    /**
     * Binder thread: one zoom step on the dash map from the dash's + / −. Maps' camera has no callable zoom (its key
     * zoom is stripped), so this is a two-finger pinch into its map container, as the rider's fingers would do on the
     * phone: the span doubles (or halves) at the dash frame's centre, one zoom level. False while the phone has the map.
     */
    static boolean zoom(boolean in) {
        if (!shown) return false;
        MAIN.post(() -> pinch(in));
        return true;
    }

    private static void pinch(boolean in) {
        Object view = target.get();
        DashHolder d = dash;
        ViewGroup container = view instanceof View ? containerOf((View) view) : null;
        if (!shown || d == null || container == null) {
            if (container == null && view != null) Log.w(TAG, "zoom: no " + MAP_CONTAINER + " above the map");
            return;
        }
        float cx = d.width / 2f;
        float cy = d.height / 2f;
        float near = d.width / 10f;
        float from = in ? near : near * 2;
        float to = in ? near * 2 : near;
        long down = SystemClock.uptimeMillis();
        int second = 1 << MotionEvent.ACTION_POINTER_INDEX_SHIFT;
        int last = PINCH_MOVES + 3;
        for (int k = 0; k <= last; k++) {
            int action = k == 0 ? MotionEvent.ACTION_DOWN : k == 1 ? MotionEvent.ACTION_POINTER_DOWN | second
                    : k == last - 1 ? MotionEvent.ACTION_POINTER_UP | second : k == last ? MotionEvent.ACTION_UP
                    : MotionEvent.ACTION_MOVE;
            int pointers = k == 0 || k == last ? 1 : 2;
            float half = k < 2 ? from : k >= last - 1 ? to : from + (to - from) * (k - 1) / PINCH_MOVES;
            long at = down + k * PINCH_STEP_MS;
            MAIN.postAtTime(() -> feed(container, event(down, at, action, pointers, cx, cy, half)), at);
        }
    }

    private static void feed(ViewGroup container, MotionEvent e) {
        injecting = true;
        try {
            container.dispatchTouchEvent(e);
        } finally {
            injecting = false;
            e.recycle();
        }
    }

    /** Fingers side by side at {@code half} either side of (cx, cy); one finger is the left one. */
    private static MotionEvent event(long down, long at, int action, int pointers, float cx, float cy, float half) {
        MotionEvent.PointerProperties[] props = new MotionEvent.PointerProperties[pointers];
        MotionEvent.PointerCoords[] coords = new MotionEvent.PointerCoords[pointers];
        for (int i = 0; i < pointers; i++) {
            props[i] = new MotionEvent.PointerProperties();
            props[i].id = i;
            props[i].toolType = MotionEvent.TOOL_TYPE_FINGER;
            coords[i] = new MotionEvent.PointerCoords();
            coords[i].x = i == 0 ? cx - half : cx + half;
            coords[i].y = cy;
            coords[i].pressure = 1f;
            coords[i].size = 1f;
        }
        return MotionEvent.obtain(down, at, action, pointers, props, coords, 0, 0, 1f, 1f, 0, 0,
                InputDevice.SOURCE_TOUCHSCREEN, 0);
    }

    private static ViewGroup containerOf(View v) {
        for (Object p = v; p instanceof View; p = ((View) p).getParent()) {
            if (p.getClass().getName().equals(MAP_CONTAINER)) return (ViewGroup) p;
        }
        return null;
    }

    /** Binder thread: whether the dash has the map now. */
    static boolean isMapOnDash() {
        return shown;
    }

    public static SurfaceHolder surfaceCreated(Object view, SurfaceHolder holder) {
        if (passing) return holder;
        state(view).phone = holder;
        Object old = target.get();
        if (old != view) {
            // Follow the newest map view (Maps recreated it, or opened another); the dash moves with it.
            if (shown && old != null) giveBack(old, dash);
            target = new WeakReference<>(view);
            if (shown) {
                handTo(view, null);
                return null;
            }
        }
        return owns(view) ? null : holder;
    }

    public static SurfaceHolder surfaceChanged(Object view, SurfaceHolder holder, int format, int width, int height) {
        if (passing) return holder;
        State s = state(view);
        s.format = format;
        s.width = width;
        s.height = height;
        return owns(view) ? null : holder;
    }

    public static SurfaceHolder surfaceDestroyed(Object view, SurfaceHolder holder) {
        if (passing) return holder;
        state(view).phone = null;
        return owns(view) ? null : holder;
    }

    /** GL pause (Activity paused): skipped while the dash has the map, {@link #giveBack} replays it. */
    public static Object pause(Object view) {
        if (passing) return view;
        state(view).paused = true;
        return owns(view) ? null : view;
    }

    public static Object resume(Object view) {
        if (passing) return view;
        state(view).paused = false;
        return view;
    }

    // Maps' frame scheduler: vsync with the screen on, this timer while the dash has the map (no vsync with the screen
    // off, so Maps would draw nothing). 30 Hz: Maps' own frame cap, far above what the dash shows (~7 fps).
    private static final long FRAME_MS = 33L;
    private static final Map<Choreographer.FrameCallback, Runnable> TICKS = new WeakHashMap<>();
    private static WeakReference<Choreographer.FrameCallback> scheduler = new WeakReference<>(null);

    /** Main thread, from the scheduler; replaces Choreographer.postFrameCallback. */
    public static void postFrameCallback(Choreographer choreographer, Choreographer.FrameCallback callback) {
        scheduler = new WeakReference<>(callback);
        if (!shown) {
            choreographer.postFrameCallback(callback);
            return;
        }
        Runnable tick = () -> {
            TICKS.remove(callback);
            callback.doFrame(System.nanoTime()); // Choreographer's frame clock
        };
        Runnable old = TICKS.put(callback, tick);
        if (old != null) MAIN.removeCallbacks(old);
        MAIN.postDelayed(tick, FRAME_MS);
    }

    public static void removeFrameCallback(Choreographer choreographer, Choreographer.FrameCallback callback) {
        choreographer.removeFrameCallback(callback);
        Runnable tick = TICKS.remove(callback);
        if (tick != null) MAIN.removeCallbacks(tick);
    }

    /** The scheduler's setHidden(hidden): the map view went invisible. Kept visible while the dash has the map. */
    public static boolean frameHidden(boolean hidden) {
        if (hidden && shown) Log.i(TAG, "map hidden, kept drawing for the dash");
        return hidden && !shown;
    }

    // Maps' Activity lifecycle while the dash has the map. Screen off pauses and stops MapsActivity, and Maps' UI then
    // stops feeding locations to the map (grey puck, frozen camera). So Maps' activity chain never hears of it: only
    // android.app.Activity's own method runs (Android checks it was called, and its callbacks stay paired), and the
    // matching onRestart/onStart/onResume are skipped the same way. Held per activity and kept after a detach, so
    // Maps' chain stays consistent: for it the activity never paused.
    private static final Map<Activity, boolean[]> HELD = new WeakHashMap<>(); // {pause, stop}

    /** The activity base's onPause/onStop/onRestart/onStart/onResume: true = done here, skip Maps' chain. */
    public static boolean holdActivity(Activity activity, MethodHandles.Lookup lookup, String name) {
        loadOptions(activity);
        if (name.equals("onResume") && MAPS_ACTIVITY.equals(activity.getClass().getName())) {
            mapsActivity = new WeakReference<>(activity);
            MAIN.post(GmapsDashBridge::refreshUi); // after Maps' own onResume has laid out its views
        }
        boolean[] held = HELD.get(activity);
        if (held == null) HELD.put(activity, held = new boolean[2]);
        boolean skip;
        switch (name) {
            case "onPause":
                skip = held[0] = shown || held[0];
                break;
            case "onStop":
                skip = held[1] = shown || held[1];
                break;
            case "onRestart":
                skip = held[1];
                break;
            case "onStart":
                skip = held[1];
                held[1] = false;
                break;
            case "onResume":
                skip = held[0];
                held[0] = false;
                break;
            default:
                return false;
        }
        if (!skip) return false;
        Log.i(TAG, "held " + name + " for the dash");
        return activityOnly(activity, lookup, name, MethodType.methodType(void.class));
    }

    /** onSaveInstanceState while the dash has the map: Maps' fragments stay unsaved, as they never stopped. */
    public static boolean holdSave(Activity activity, MethodHandles.Lookup lookup, Bundle state) {
        if (!shown) return false;
        return activityOnly(activity, lookup, "onSaveInstanceState", MethodType.methodType(void.class, Bundle.class),
            state);
    }

    /** android.app.Activity's own method, past Maps' overrides; false (run Maps' chain after all) if that fails. */
    private static boolean activityOnly(Activity activity, MethodHandles.Lookup lookup, String name, MethodType type,
                                        Object... args) {
        try {
            Object[] all = new Object[args.length + 1];
            all[0] = activity;
            System.arraycopy(args, 0, all, 1, args.length);
            lookup.findSpecial(Activity.class, name, type, lookup.lookupClass()).invokeWithArguments(all);
            return true;
        } catch (Throwable e) {
            Log.e(TAG, "Activity." + name + " failed, running Maps' own", e);
            return false;
        }
    }

    // androidx LifecycleRegistry: ON_PAUSE/ON_STOP held while the dash has the map, replayed when it lets go.
    private static final Map<Object, List<Enum<?>>> PENDING = new WeakHashMap<>();
    private static boolean replaying;

    /** handleLifecycleEvent(event): null = held. Main thread. */
    public static Enum<?> lifecycleEvent(Object registry, Enum<?> event) {
        if (replaying) return event;
        String name = event.name();
        if (shown && (name.equals("ON_PAUSE") || name.equals("ON_STOP"))) {
            List<Enum<?>> held = PENDING.get(registry);
            if (held == null) PENDING.put(registry, held = new ArrayList<>());
            held.add(event);
            return null;
        }
        List<Enum<?>> held = PENDING.get(registry);
        if (held != null) {
            if (name.equals("ON_DESTROY")) {
                PENDING.remove(registry);
            } else {
                String undone = name.equals("ON_START") ? "ON_STOP" : name.equals("ON_RESUME") ? "ON_PAUSE" : null;
                held.removeIf(e -> e.name().equals(undone));
            }
        }
        return event;
    }

    private static void replayLifecycle() {
        if (PENDING.isEmpty()) return;
        replaying = true;
        try {
            for (Map.Entry<Object, List<Enum<?>>> e : new ArrayList<>(PENDING.entrySet())) {
                for (Enum<?> event : e.getValue()) {
                    try {
                        e.getKey().getClass().getMethod(lifecycleEventName(), event.getDeclaringClass())
                            .invoke(e.getKey(), event);
                    } catch (Throwable t) {
                        Log.w(TAG, "lifecycle replay " + event + " failed", t);
                    }
                }
            }
        } finally {
            PENDING.clear();
            replaying = false;
        }
    }

    /** Binder thread; the service already checked the caller. */
    static void attach(Surface surface, int width, int height) {
        MAIN.post(() -> {
            if (surface == null || !surface.isValid() || width <= 0 || height <= 0) {
                Log.w(TAG, "attach ignored: invalid surface " + width + "x" + height);
                return;
            }
            DashHolder old = dash;
            dash = new DashHolder(surface, width, height);
            Object view = target.get();
            if (shown) {
                if (view != null) handTo(view, old);
            } else {
                update();
            }
            if (old != null && old.surface != surface) old.surface.release();
            Log.i(TAG, "dash surface attached " + width + "x" + height + (view == null ? ", waiting for the map" : "")
                + (shown ? "" : ", map on the phone until Maps navigates"));
            refreshUi();
            MAIN.removeCallbacks(WATCHDOG);
            MAIN.postDelayed(WATCHDOG, WATCHDOG_MS);
        });
    }

    static void detach() {
        MAIN.post(GmapsDashBridge::detachNow);
    }

    private static void detachNow() {
        if (dash == null) return;
        DashHolder old = dash;
        dash = null;
        onPhone = false;
        if (shown) leave(old);
        old.surface.release();
        refreshUi();
        MAIN.removeCallbacks(WATCHDOG);
        Log.i(TAG, "dash surface detached");
    }

    /** From GmapsDashNav: Maps started or stopped navigating. Any thread. */
    static void navigating(boolean on) {
        MAIN.post(() -> {
            if (navigating == on) return;
            navigating = on;
            if (!on) onPhone = false; // the next trip starts on the dash again
            Log.i(TAG, on ? "Maps navigating" : "Maps stopped navigating");
            update();
            refreshUi();
        });
    }

    /** The rider's tap: the map to the phone, or back to the dash. */
    private static void flip() {
        onPhone = !onPhone;
        Log.i(TAG, "map on the " + (onPhone ? "phone" : "dash"));
        update();
        refreshUi();
    }

    /** Gives the dash the map, or takes it back, as the state now wants. */
    private static void update() {
        boolean want = dash != null && navigating && !onPhone;
        if (want == shown) return;
        if (!want) {
            leave(dash);
            return;
        }
        shown = true;
        Object view = target.get();
        if (view != null) handTo(view, null);
        // A frame already waiting on vsync never comes with the screen off; start the timer now.
        Choreographer.FrameCallback frames = scheduler.get();
        if (frames != null) postFrameCallback(null, frames);
    }

    /** The map goes back to the phone from {@code from}; lifecycle events held meanwhile are replayed. */
    private static void leave(DashHolder from) {
        shown = false;
        Object view = target.get();
        if (view != null) giveBack(view, from);
        replayLifecycle();
    }

    /** The client died or dropped its ImageReader: its Surface goes invalid, so give the map back. */
    private static final Runnable WATCHDOG = new Runnable() {
        @Override
        public void run() {
            if (dash == null) return;
            if (!dash.surface.isValid()) {
                Log.i(TAG, "dash surface gone");
                detachNow();
                return;
            }
            MAIN.postDelayed(this, WATCHDOG_MS);
        }
    };

    /** Moves the view's renderer off the phone (or off an older dash surface, {@code from}) onto the dash. */
    private static void handTo(Object view, DashHolder from) {
        SurfaceHolder.Callback map = (SurfaceHolder.Callback) view;
        State s = state(view);
        passing = true;
        try {
            // A paused GL thread may not answer the surface handshake, so run it first.
            if (s.paused) call(view, resumeName());
            if (from != null) map.surfaceDestroyed(from); // same view: EGL drops the old dash surface first
            else if (s.phone != null) map.surfaceDestroyed(s.phone);
            map.surfaceCreated(dash);
            map.surfaceChanged(dash, PixelFormat.RGBA_8888, dash.width, dash.height);
        } catch (Throwable e) {
            Log.e(TAG, "hand to dash failed", e);
        } finally {
            passing = false;
        }
    }

    /** The view's renderer goes from {@code from} back to the phone holder; a pause skipped meanwhile is replayed. */
    private static void giveBack(Object view, DashHolder from) {
        SurfaceHolder.Callback map = (SurfaceHolder.Callback) view;
        State s = state(view);
        passing = true;
        try {
            map.surfaceDestroyed(from);
            if (s.phone != null && s.phone.getSurface().isValid()) {
                map.surfaceCreated(s.phone);
                map.surfaceChanged(s.phone, s.format, s.width, s.height);
            }
            if (s.paused) call(view, pauseName());
        } catch (Throwable e) {
            Log.e(TAG, "give back failed", e);
        } finally {
            passing = false;
        }
    }

    // Rider options, from Maps' Settings → NMAX patch (NmaxSettings), kept in Maps' prefs.

    /** Main thread: a switch in Maps' Settings changed. */
    static void optionsChanged(Context context) {
        optionsLoaded = false;
        loadOptions(context);
        refreshUi();
    }

    private static void loadOptions(Context context) {
        if (optionsLoaded) return;
        optionsLoaded = true;
        SharedPreferences p = NmaxSettings.prefs(context);
        lockPortrait = p.getBoolean(NmaxSettings.LOCK_PORTRAIT, true);
        pip = !p.getBoolean(NmaxSettings.NO_PIP, true);
    }

    /** Replaces Maps' Activity.enterPictureInPictureMode(params): false (not entered) while PiP is off. */
    public static boolean enterPip(Activity activity, PictureInPictureParams params) {
        loadOptions(activity);
        if (!pip) {
            Log.i(TAG, "picture-in-picture off, not entered");
            return false;
        }
        return activity.enterPictureInPictureMode(params);
    }

    /** Replaces Maps' Activity.setPictureInPictureParams(params): no auto-enter on leaving while PiP is off. */
    public static void pipParams(Activity activity, PictureInPictureParams params) {
        loadOptions(activity);
        if (!pip && Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            params = new PictureInPictureParams.Builder().setAutoEnterEnabled(false).build();
        }
        activity.setPictureInPictureParams(params);
    }

    /** Main thread: the cast button, the "on the dash" note and the portrait lock follow the state. */
    private static void refreshUi() {
        Activity a = mapsActivity.get();
        if (a == null) return;
        boolean dashTurn = dash != null && navigating;
        lockOrientation(a, dashTurn && lockPortrait);
        DashCastUi.update(a, target.get(), dashTurn, shown, GmapsDashBridge::flip, false);
    }

    // A rotation moves Maps' camera (its landscape layout puts the puck aside), and the dash map with it.
    private static void lockOrientation(Activity a, boolean lock) {
        Activity was = locked.get();
        if (lock && was != a) {
            unlockedOrientation = a.getRequestedOrientation();
            a.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);
            locked = new WeakReference<>(a);
        } else if (!lock && was == a) {
            a.setRequestedOrientation(unlockedOrientation);
            locked = new WeakReference<>(null);
        }
    }

    private static void call(Object view, String name) throws ReflectiveOperationException {
        view.getClass().getMethod(name).invoke(view);
    }

    /** Just enough of a SurfaceHolder for EGL10.eglCreateWindowSurface, which only reads getSurface(). */
    private static final class DashHolder implements SurfaceHolder {
        final Surface surface;
        final int width;
        final int height;

        DashHolder(Surface surface, int width, int height) {
            this.surface = surface;
            this.width = width;
            this.height = height;
        }

        @Override
        public Surface getSurface() {
            return surface;
        }

        @Override
        public Rect getSurfaceFrame() {
            return new Rect(0, 0, width, height);
        }

        @Override
        public boolean isCreating() {
            return false;
        }

        @Override
        public void addCallback(Callback callback) {
        }

        @Override
        public void removeCallback(Callback callback) {
        }

        @Override
        @SuppressWarnings("deprecation")
        public void setType(int type) {
        }

        @Override
        public void setFixedSize(int width, int height) {
        }

        @Override
        public void setSizeFromLayout() {
        }

        @Override
        public void setFormat(int format) {
        }

        @Override
        public void setKeepScreenOn(boolean screenOn) {
        }

        @Override
        public Canvas lockCanvas() {
            return null;
        }

        @Override
        public Canvas lockCanvas(Rect dirty) {
            return null;
        }

        @Override
        public void unlockCanvasAndPost(Canvas canvas) {
        }
    }
}
