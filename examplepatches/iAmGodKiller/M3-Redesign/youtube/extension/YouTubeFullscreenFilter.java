package app.morphe.extension.youtube.patches.fullscreen;

import android.app.Activity;
import android.app.Application;
import android.content.res.Resources;
import android.graphics.Color;
import android.graphics.Insets;
import android.graphics.Rect;
import android.os.Build;
import android.os.Bundle;
import android.os.SystemClock;
import android.view.DisplayCutout;
import android.view.SurfaceView;
import android.view.TextureView;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowInsetsController;
import android.view.WindowManager;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.Toolbar;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.HashMap;
import java.util.WeakHashMap;

/**
 * Independent YouTube fullscreen & Home toolbar helper:
 * 1. Removes the black status-bar gap above YouTube videos on tablets and phones without adding
 *    per-frame scroll overhead (no OnPreDrawListener, all IDs & reflection handles cached once).
 * 2. Optionally configures the YouTube Home AppBarLayout children to SCROLL_FLAG_SCROLL (0x1) so
 *    the top toolbar behaves as the top of the page and scrolls away cleanly instead of staying
 *    persistent or popping back mid-page.
 */
@SuppressWarnings("unused")
public final class YouTubeFullscreenFilter {

    private static final int SCROLL_FLAG_SCROLL = 0x1;
    private static final long LAYOUT_CHECK_MIN_INTERVAL_MS = 280L;
    private static final long TRAILING_CHECK_DELAY_MS = 220L;
    private static final long SURFACE_FALLBACK_SCAN_INTERVAL_MS = 900L;

    private static final String[] WATCH_CONTAINER_NAMES = {
            "next_gen_watch_container",
            "next_gen_watch_layout",
            "watch_while_layout",
            "watch_while_root",
            "pane_fragment_container"
    };

    private static final String[] STATUS_BAR_SPACER_NAMES = {
            "status_bar_background",
            "status_bar_scrim",
            "status_bar_view",
            "status_bar_placeholder",
            "status_bar_spacer",
            "status_bar_tint"
    };

    private static final String[] PLAYER_CONTAINER_NAMES = {
            "player_fragment_container",
            "next_gen_watch_player",
            "watch_player",
            "player_view",
            "player_overlays"
    };

    private static final String[] APP_BAR_NAMES = {
            "appbar_layout",
            "app_bar_layout",
            "action_bar_app_bar_layout",
            "toolbar_app_bar",
            "toolbar_appbar"
    };

    private static final String[] NAV_BAR_NAMES = {
            "pivot_bar",
            "navigation_rail",
            "bottom_bar_container"
    };

    private static final WeakHashMap<Activity, ActivityState> STATES = new WeakHashMap<>();
    private static final HashMap<Class<?>, ScrollFlagsAccessor> SCROLL_FLAGS_CACHE = new HashMap<>();
    private static final ScrollFlagsAccessor NO_ACCESSOR = new ScrollFlagsAccessor(null, null, null);

    private static volatile boolean removeTopBlackBarEnabled = false;
    private static volatile boolean homeScrollToolbarEnabled = false;
    private static volatile boolean lifecycleRegistered = false;
    private static volatile WeakReference<Activity> currentActivityRef = new WeakReference<>(null);

    // Process-wide cached resource IDs (resolved ONCE, never on scroll frames).
    private static volatile boolean idsResolved = false;
    private static int[] watchContainerIds = new int[0];
    private static int[] statusBarSpacerIds = new int[0];
    private static int[] playerContainerIds = new int[0];
    private static int[] appBarIds = new int[0];
    private static int[] navBarIds = new int[0];
    private static int cachedStatusBarHeightPx = -1;

    private static final class ScrollFlagsAccessor {
        final Method getter;
        final Method setter;
        final Field field;

        ScrollFlagsAccessor(Method getter, Method setter, Field field) {
            this.getter = getter;
            this.setter = setter;
            this.field = field;
        }

        boolean isValid() {
            return (getter != null && setter != null) || field != null;
        }

        int get(ViewGroup.LayoutParams lp) throws Exception {
            if (getter != null) {
                Object val = getter.invoke(lp);
                if (val instanceof Integer) {
                    return (Integer) val;
                }
            }
            if (field != null) {
                return field.getInt(lp);
            }
            return -1;
        }

        void set(ViewGroup.LayoutParams lp, int flags) throws Exception {
            if (setter != null) {
                setter.invoke(lp, flags);
                return;
            }
            if (field != null) {
                field.setInt(lp, flags);
            }
        }
    }

    private static final class ActivityState {
        boolean listenersInstalled = false;
        int lastDecorW = -1;
        int lastDecorH = -1;
        long lastLayoutCheckMs = 0L;
        long lastSurfaceScanMs = 0L;
        boolean trailingCheckScheduled = false;

        int appliedShiftPx = 0;
        WeakReference<View> shiftedViewRef = new WeakReference<>(null);
        int originalShiftedHeight = ViewGroup.LayoutParams.MATCH_PARENT;

        WeakReference<View> cachedSysStatusBgRef = new WeakReference<>(null);
        WeakReference<View> cachedWatchContainerRef = new WeakReference<>(null);
        WeakReference<View> cachedPlayerViewRef = new WeakReference<>(null);
        WeakReference<ViewGroup> cachedAppBarRef = new WeakReference<>(null);
        WeakReference<ViewGroup> cachedNavBarRef = new WeakReference<>(null);
        int lastAppBarChildCount = -1;
        boolean appBarLayoutListenerAttached = false;

        final WeakHashMap<View, Integer> originalScrollFlags = new WeakHashMap<>();

        ViewTreeObserver.OnGlobalLayoutListener globalLayoutListener;
        ViewTreeObserver.OnWindowFocusChangeListener focusChangeListener;
        View.OnLayoutChangeListener appBarLayoutChangeListener;
        Runnable trailingCheckRunnable;

        final int[] tmpLocA = new int[2];
        final int[] tmpLocB = new int[2];
    }

    private YouTubeFullscreenFilter() {
    }

    /**
     * Hooked at index 0 of YouTube's MainActivity.onCreate(Bundle) by "Remove top black bar".
     * Never touches getWindow()/getDecorView() synchronously before super.onCreate().
     */
    public static void onMainActivityCreated(Activity activity) {
        removeTopBlackBarEnabled = true;
        if (activity == null) {
            return;
        }
        currentActivityRef = new WeakReference<>(activity);
        registerLifecycleOnce(activity);
    }

    /**
     * Hooked at index 0 of YouTube's MainActivity.onCreate(Bundle) by "Scroll away home toolbar".
     */
    public static void onHomeScrollToolbarEnabled(Activity activity) {
        homeScrollToolbarEnabled = true;
        if (activity == null) {
            return;
        }
        currentActivityRef = new WeakReference<>(activity);
        registerLifecycleOnce(activity);
    }

    /**
     * Hooked after YouTube reads stable insets for the player (and after official Morphe's
     * HideStatusBarPatch.getPlayerStableInsets if installed).
     */
    public static Rect stripPlayerTopInset(Rect insets) {
        if (!removeTopBlackBarEnabled || insets == null || insets.top == 0) {
            return insets;
        }
        Activity activity = currentActivityRef.get();
        if (activity != null && isFloatingOrSplitMode(activity)) {
            return insets;
        }
        return new Rect(insets.left, 0, insets.right, insets.bottom);
    }

    /**
     * Hooked after YouTube copies system window insets for top-anchored layouts (and after
     * official Morphe's HideStatusBarPatch.setSystemWindowInsetTop if installed).
     */
    public static void stripSystemWindowInsetTop(Rect insets, View view) {
        if (!removeTopBlackBarEnabled || insets == null || insets.top == 0) {
            return;
        }
        Activity activity = currentActivityRef.get();
        if (activity != null && isFloatingOrSplitMode(activity)) {
            return;
        }
        insets.top = 0;
    }

    /**
     * Hooked on YouTube's internal status-bar background view show/color method.
     * Collapses the view completely so it can never draw a solid black strip at the top.
     */
    public static void collapseStatusBarBackground(View view) {
        if (!removeTopBlackBarEnabled || view == null) {
            return;
        }
        Activity activity = currentActivityRef.get();
        if (activity != null && isFloatingOrSplitMode(activity)) {
            return;
        }
        try {
            if (view.getVisibility() != View.GONE) {
                view.setVisibility(View.GONE);
            }
            if (view.getAlpha() != 0f) {
                view.setAlpha(0f);
            }
            view.setBackgroundColor(Color.TRANSPARENT);
            ViewGroup.LayoutParams lp = view.getLayoutParams();
            if (lp != null && lp.height > 0) {
                int maxBand = getTopBandPx(view.getResources());
                if (lp.height <= maxBand) {
                    lp.height = 0;
                    view.setLayoutParams(lp);
                }
            }
        } catch (Throwable ignored) {
        }
    }

    private static void registerLifecycleOnce(Activity activity) {
        if (lifecycleRegistered) {
            return;
        }
        Application app = activity.getApplication();
        if (app == null) {
            return;
        }
        synchronized (YouTubeFullscreenFilter.class) {
            if (lifecycleRegistered) {
                return;
            }
            lifecycleRegistered = true;
            app.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
                @Override
                public void onActivityCreated(Activity act, Bundle savedInstanceState) {
                    if (isTargetActivity(act)) {
                        currentActivityRef = new WeakReference<>(act);
                    }
                }

                @Override
                public void onActivityStarted(Activity act) {
                    if (!isTargetActivity(act)) {
                        return;
                    }
                    currentActivityRef = new WeakReference<>(act);
                    attachAndApply(act);
                }

                @Override
                public void onActivityResumed(Activity act) {
                    if (!isTargetActivity(act)) {
                        return;
                    }
                    currentActivityRef = new WeakReference<>(act);
                    attachAndApply(act);
                }

                @Override
                public void onActivityPaused(Activity act) {
                }

                @Override
                public void onActivityStopped(Activity act) {
                }

                @Override
                public void onActivitySaveInstanceState(Activity act, Bundle outState) {
                }

                @Override
                public void onActivityDestroyed(Activity act) {
                    detachActivity(act);
                }
            });
        }
    }

    private static boolean isTargetActivity(Activity activity) {
        if (activity == null) {
            return false;
        }
        String name = activity.getClass().getName();
        return name.endsWith(".MainActivity")
                || name.endsWith(".WatchWhileActivity")
                || name.contains("watchwhile");
    }

    private static boolean isFloatingOrSplitMode(Activity activity) {
        if (activity == null) {
            return false;
        }
        try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N && activity.isInMultiWindowMode()) {
                return true;
            }
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O && activity.isInPictureInPictureMode()) {
                return true;
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    private static ActivityState getState(Activity activity) {
        synchronized (STATES) {
            ActivityState state = STATES.get(activity);
            if (state == null) {
                state = new ActivityState();
                STATES.put(activity, state);
            }
            return state;
        }
    }

    private static void resolveResourceIdsOnce(Resources res, String pkg) {
        if (idsResolved || res == null || pkg == null) {
            return;
        }
        synchronized (YouTubeFullscreenFilter.class) {
            if (idsResolved) {
                return;
            }
            watchContainerIds = resolveIdArray(res, pkg, WATCH_CONTAINER_NAMES);
            statusBarSpacerIds = resolveIdArray(res, pkg, STATUS_BAR_SPACER_NAMES);
            playerContainerIds = resolveIdArray(res, pkg, PLAYER_CONTAINER_NAMES);
            appBarIds = resolveIdArray(res, pkg, APP_BAR_NAMES);
            navBarIds = resolveIdArray(res, pkg, NAV_BAR_NAMES);
            cachedStatusBarHeightPx = readStatusBarHeightPx(res);
            idsResolved = true;
        }
    }

    private static int[] resolveIdArray(Resources res, String pkg, String[] names) {
        int[] raw = new int[names.length];
        int count = 0;
        for (int i = 0; i < names.length; i++) {
            int id = res.getIdentifier(names[i], "id", pkg);
            if (id != 0) {
                raw[count++] = id;
            }
        }
        if (count == raw.length) {
            return raw;
        }
        int[] trimmed = new int[count];
        System.arraycopy(raw, 0, trimmed, 0, count);
        return trimmed;
    }

    private static void detachActivity(Activity activity) {
        if (activity == null) {
            return;
        }
        ActivityState state;
        synchronized (STATES) {
            state = STATES.remove(activity);
        }
        if (state == null) {
            return;
        }
        restoreShift(state);
        try {
            ViewGroup appBar = state.cachedAppBarRef.get();
            if (appBar != null && state.appBarLayoutChangeListener != null) {
                appBar.removeOnLayoutChangeListener(state.appBarLayoutChangeListener);
            }
        } catch (Throwable ignored) {
        }
        try {
            Window window = activity.getWindow();
            if (window == null) {
                return;
            }
            View decor = window.peekDecorView();
            if (decor == null) {
                return;
            }
            if (state.trailingCheckRunnable != null) {
                decor.removeCallbacks(state.trailingCheckRunnable);
            }
            ViewTreeObserver vto = decor.getViewTreeObserver();
            if (vto != null && vto.isAlive()) {
                if (state.globalLayoutListener != null) {
                    vto.removeOnGlobalLayoutListener(state.globalLayoutListener);
                }
                if (state.focusChangeListener != null) {
                    vto.removeOnWindowFocusChangeListener(state.focusChangeListener);
                }
            }
        } catch (Throwable ignored) {
        }
    }

    private static void attachAndApply(Activity activity) {
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) {
            return;
        }
        resolveResourceIdsOnce(activity.getResources(), activity.getPackageName());

        final ActivityState state = getState(activity);
        if (removeTopBlackBarEnabled) {
            if (isFloatingOrSplitMode(activity)) {
                restoreShift(state);
            } else {
                configureWindow(activity);
            }
        }

        Window window = activity.getWindow();
        if (window == null) {
            return;
        }
        final View decor = window.getDecorView();
        if (decor == null) {
            return;
        }

        installLayoutWatchers(activity, decor, state);

        // Post inset stripper & initial toolbar setup so we attach AFTER upstream Morphe's
        // HideStatusBarPatch.addDisplayCutoutInset listener on android.R.id.content.
        final WeakReference<Activity> actRef = new WeakReference<>(activity);
        decor.post(new Runnable() {
            @Override
            public void run() {
                Activity act = actRef.get();
                if (act == null || act.isFinishing() || act.isDestroyed()) {
                    return;
                }
                if (removeTopBlackBarEnabled) {
                    if (isFloatingOrSplitMode(act)) {
                        restoreShift(state);
                    } else {
                        configureWindow(act);
                        installInsetStrippers(act);
                    }
                }
                runLightCheck(act, state, true);
            }
        });
    }

    @SuppressWarnings("deprecation")
    private static void configureWindow(Activity activity) {
        if (!removeTopBlackBarEnabled || activity == null || isFloatingOrSplitMode(activity)) {
            return;
        }
        Window window = activity.getWindow();
        if (window == null) {
            return;
        }
        try {
            WindowManager.LayoutParams lp = window.getAttributes();
            if (lp != null) {
                boolean attrsChanged = false;
                if (Build.VERSION.SDK_INT >= 30) {
                    if (lp.layoutInDisplayCutoutMode != WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_ALWAYS) {
                        lp.layoutInDisplayCutoutMode = WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_ALWAYS;
                        attrsChanged = true;
                    }
                } else if (Build.VERSION.SDK_INT >= 28) {
                    if (lp.layoutInDisplayCutoutMode != WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_SHORT_EDGES) {
                        lp.layoutInDisplayCutoutMode = WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_SHORT_EDGES;
                        attrsChanged = true;
                    }
                }
                if (attrsChanged) {
                    window.setAttributes(lp);
                }
            }
        } catch (Throwable ignored) {
        }

        try {
            if (window.getStatusBarColor() != Color.TRANSPARENT) {
                window.setStatusBarColor(Color.TRANSPARENT);
            }
        } catch (Throwable ignored) {
        }

        if (Build.VERSION.SDK_INT >= 29) {
            try {
                if (window.isStatusBarContrastEnforced()) {
                    window.setStatusBarContrastEnforced(false);
                }
            } catch (Throwable ignored) {
            }
        }

        if (Build.VERSION.SDK_INT >= 30) {
            try {
                window.setDecorFitsSystemWindows(false);
            } catch (Throwable ignored) {
            }
            try {
                WindowInsetsController controller = window.getInsetsController();
                if (controller != null) {
                    controller.setSystemBarsBehavior(
                            WindowInsetsController.BEHAVIOR_SHOW_TRANSIENT_BARS_BY_SWIPE
                    );
                    controller.hide(WindowInsets.Type.statusBars());
                }
            } catch (Throwable ignored) {
            }
        } else {
            try {
                View decor = window.getDecorView();
                if (decor != null) {
                    int flags = decor.getSystemUiVisibility();
                    int desired = flags
                            | View.SYSTEM_UI_FLAG_LAYOUT_STABLE
                            | View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
                            | View.SYSTEM_UI_FLAG_FULLSCREEN
                            | View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY;
                    if (desired != flags) {
                        decor.setSystemUiVisibility(desired);
                    }
                }
            } catch (Throwable ignored) {
            }
        }
    }

    private static void installInsetStrippers(Activity activity) {
        if (!removeTopBlackBarEnabled) {
            return;
        }
        Window window = activity.getWindow();
        if (window == null) {
            return;
        }
        final View decor = window.getDecorView();
        final View content = window.findViewById(android.R.id.content);
        final WeakReference<Activity> actRef = new WeakReference<>(activity);

        if (decor != null) {
            decor.setOnApplyWindowInsetsListener(new View.OnApplyWindowInsetsListener() {
                @Override
                public WindowInsets onApplyWindowInsets(View v, WindowInsets insets) {
                    Activity act = actRef.get();
                    if (act == null || isFloatingOrSplitMode(act)) {
                        return v.onApplyWindowInsets(insets);
                    }
                    WindowInsets stripped = stripTopWindowInsets(insets);
                    if (v.getPaddingTop() != 0) {
                        v.setPadding(v.getPaddingLeft(), 0, v.getPaddingRight(), v.getPaddingBottom());
                    }
                    return v.onApplyWindowInsets(stripped);
                }
            });
        }

        if (content != null) {
            // Intentionally replaces any listener set by upstream HideStatusBarPatch.addDisplayCutoutInset
            // which otherwise adds top cutout padding to android.R.id.content.
            content.setOnApplyWindowInsetsListener(new View.OnApplyWindowInsetsListener() {
                @Override
                public WindowInsets onApplyWindowInsets(View v, WindowInsets insets) {
                    Activity act = actRef.get();
                    if (act == null || isFloatingOrSplitMode(act)) {
                        return v.onApplyWindowInsets(insets);
                    }
                    WindowInsets stripped = stripTopWindowInsets(insets);
                    if (v.getPaddingTop() != 0) {
                        v.setPadding(v.getPaddingLeft(), 0, v.getPaddingRight(), v.getPaddingBottom());
                    }
                    return v.onApplyWindowInsets(stripped);
                }
            });
            if (content.getPaddingTop() != 0) {
                content.setPadding(
                        content.getPaddingLeft(),
                        0,
                        content.getPaddingRight(),
                        content.getPaddingBottom()
                );
            }
        }

        if (decor != null) {
            try {
                decor.requestApplyInsets();
            } catch (Throwable ignored) {
            }
        }
    }

    @SuppressWarnings("deprecation")
    private static WindowInsets stripTopWindowInsets(WindowInsets insets) {
        if (insets == null) {
            return null;
        }
        if (Build.VERSION.SDK_INT >= 30) {
            try {
                WindowInsets.Builder builder = new WindowInsets.Builder(insets);

                zeroTypeTop(builder, insets, WindowInsets.Type.statusBars(), true);
                zeroTypeTop(builder, insets, WindowInsets.Type.displayCutout(), true);
                zeroTypeTop(builder, insets, WindowInsets.Type.tappableElement(), true);
                zeroTypeTop(builder, insets, WindowInsets.Type.captionBar(), true);
                zeroTypeTop(builder, insets, WindowInsets.Type.systemGestures(), false);
                zeroTypeTop(builder, insets, WindowInsets.Type.mandatorySystemGestures(), false);

                DisplayCutout cutout = insets.getDisplayCutout();
                if (cutout != null
                        && cutout.getSafeInsetTop() > 0
                        && cutout.getSafeInsetLeft() == 0
                        && cutout.getSafeInsetRight() == 0
                        && cutout.getSafeInsetBottom() == 0) {
                    try {
                        builder.setDisplayCutout(null);
                    } catch (Throwable ignored) {
                    }
                }

                return builder.build();
            } catch (Throwable ignored) {
            }
        } else if (Build.VERSION.SDK_INT == 29) {
            try {
                WindowInsets.Builder builder = new WindowInsets.Builder(insets);
                Insets sys = insets.getSystemWindowInsets();
                if (sys.top != 0) {
                    builder.setSystemWindowInsets(Insets.of(sys.left, 0, sys.right, sys.bottom));
                }
                Insets stable = insets.getStableInsets();
                if (stable.top != 0) {
                    builder.setStableInsets(Insets.of(stable.left, 0, stable.right, stable.bottom));
                }
                Insets tappable = insets.getTappableElementInsets();
                if (tappable.top != 0) {
                    builder.setTappableElementInsets(Insets.of(tappable.left, 0, tappable.right, tappable.bottom));
                }
                Insets mandatory = insets.getMandatorySystemGestureInsets();
                if (mandatory.top != 0) {
                    builder.setMandatorySystemGestureInsets(Insets.of(mandatory.left, 0, mandatory.right, mandatory.bottom));
                }
                DisplayCutout cutout = insets.getDisplayCutout();
                if (cutout != null
                        && cutout.getSafeInsetTop() > 0
                        && cutout.getSafeInsetLeft() == 0
                        && cutout.getSafeInsetRight() == 0
                        && cutout.getSafeInsetBottom() == 0) {
                    builder.setDisplayCutout(null);
                }
                return builder.build();
            } catch (Throwable ignored) {
            }
        }

        try {
            if (insets.getSystemWindowInsetTop() != 0) {
                return insets.replaceSystemWindowInsets(
                        insets.getSystemWindowInsetLeft(),
                        0,
                        insets.getSystemWindowInsetRight(),
                        insets.getSystemWindowInsetBottom()
                );
            }
        } catch (Throwable ignored) {
        }
        return insets;
    }

    private static void zeroTypeTop(
            WindowInsets.Builder builder,
            WindowInsets source,
            int type,
            boolean alsoIgnoringVisibility
    ) {
        if (Build.VERSION.SDK_INT < 30) {
            return;
        }
        try {
            Insets cur = source.getInsets(type);
            if (cur.top != 0) {
                builder.setInsets(type, Insets.of(cur.left, 0, cur.right, cur.bottom));
            }
        } catch (Throwable ignored) {
        }
        if (alsoIgnoringVisibility) {
            try {
                Insets curIgn = source.getInsetsIgnoringVisibility(type);
                if (curIgn.top != 0) {
                    builder.setInsetsIgnoringVisibility(
                            type,
                            Insets.of(curIgn.left, 0, curIgn.right, curIgn.bottom)
                    );
                }
            } catch (Throwable ignored) {
            }
        }
    }

    private static void installLayoutWatchers(Activity activity, final View decor, final ActivityState state) {
        if (state.listenersInstalled) {
            return;
        }
        ViewTreeObserver vto = decor.getViewTreeObserver();
        if (vto == null || !vto.isAlive()) {
            return;
        }
        final WeakReference<Activity> actRef = new WeakReference<>(activity);

        state.trailingCheckRunnable = new Runnable() {
            @Override
            public void run() {
                state.trailingCheckScheduled = false;
                Activity act = actRef.get();
                if (act == null || act.isFinishing() || act.isDestroyed()) {
                    return;
                }
                runLightCheck(act, state, false);
            }
        };

        // Zero-jitter global layout watcher:
        // - Never runs OnPreDrawListener (0 callbacks per scroll frame).
        // - Never calls configureWindow() unless window dimensions actually change.
        // - Throttles to at most once every 280ms during scroll, with a single coalesced trailing check.
        state.globalLayoutListener = new ViewTreeObserver.OnGlobalLayoutListener() {
            @Override
            public void onGlobalLayout() {
                Activity act = actRef.get();
                if (act == null || act.isFinishing() || act.isDestroyed()) {
                    return;
                }
                int w = decor.getWidth();
                int h = decor.getHeight();
                if (w <= 0 || h <= 0) {
                    return;
                }
                boolean sizeChanged = (w != state.lastDecorW || h != state.lastDecorH);
                long now = SystemClock.uptimeMillis();
                if (!sizeChanged && (now - state.lastLayoutCheckMs) < LAYOUT_CHECK_MIN_INTERVAL_MS) {
                    if (!state.trailingCheckScheduled && state.trailingCheckRunnable != null) {
                        state.trailingCheckScheduled = true;
                        decor.postDelayed(state.trailingCheckRunnable, TRAILING_CHECK_DELAY_MS);
                    }
                    return;
                }
                if (sizeChanged) {
                    state.lastDecorW = w;
                    state.lastDecorH = h;
                    if (removeTopBlackBarEnabled && !isFloatingOrSplitMode(act)) {
                        configureWindow(act);
                    }
                }
                runLightCheck(act, state, sizeChanged);
            }
        };

        state.focusChangeListener = new ViewTreeObserver.OnWindowFocusChangeListener() {
            @Override
            public void onWindowFocusChanged(boolean hasFocus) {
                if (!hasFocus) {
                    return;
                }
                Activity act = actRef.get();
                if (act == null || act.isFinishing() || act.isDestroyed()) {
                    return;
                }
                if (removeTopBlackBarEnabled) {
                    if (isFloatingOrSplitMode(act)) {
                        restoreShift(state);
                    } else {
                        configureWindow(act);
                        installInsetStrippers(act);
                    }
                }
                runLightCheck(act, state, true);
            }
        };

        vto.addOnGlobalLayoutListener(state.globalLayoutListener);
        vto.addOnWindowFocusChangeListener(state.focusChangeListener);
        state.listenersInstalled = true;
    }

    private static void runLightCheck(Activity activity, ActivityState state, boolean forceScan) {
        state.lastLayoutCheckMs = SystemClock.uptimeMillis();
        Window window = activity.getWindow();
        if (window == null) {
            return;
        }
        View decor = window.getDecorView();
        if (decor == null || decor.getWidth() <= 0 || decor.getHeight() <= 0) {
            return;
        }

        boolean playerMaximized = false;
        if (removeTopBlackBarEnabled) {
            if (isFloatingOrSplitMode(activity)) {
                restoreShift(state);
            } else {
                playerMaximized = enforceEdgeToEdgeLayout(activity, window, decor, state, forceScan);
            }
        }

        if (homeScrollToolbarEnabled) {
            enforceHomeScrollToolbar(activity, window, decor, state, playerMaximized);
        }
    }

    private static boolean enforceEdgeToEdgeLayout(
            Activity activity,
            Window window,
            View decor,
            ActivityState state,
            boolean forceScan
    ) {
        Resources res = activity.getResources();
        int topBandPx = getTopBandPx(res);

        // 1. Hide Android's system statusBarBackground overlay view if present (cached).
        View sysStatusBg = state.cachedSysStatusBgRef.get();
        if (sysStatusBg == null || !sysStatusBg.isAttachedToWindow()) {
            sysStatusBg = decor.findViewById(android.R.id.statusBarBackground);
            state.cachedSysStatusBgRef = new WeakReference<>(sysStatusBg);
        }
        if (sysStatusBg != null) {
            if (sysStatusBg.getVisibility() != View.GONE) {
                sysStatusBg.setVisibility(View.GONE);
            }
            if (sysStatusBg.getAlpha() != 0f) {
                sysStatusBg.setAlpha(0f);
            }
        }

        // 2. Clear small top padding/margin on decor, decor root child, and android.R.id.content.
        clearSmallTopInsetOnView(decor, topBandPx);
        if (decor instanceof ViewGroup) {
            ViewGroup decorGroup = (ViewGroup) decor;
            if (decorGroup.getChildCount() > 0) {
                View firstChild = decorGroup.getChildAt(0);
                if (firstChild != null && firstChild != sysStatusBg) {
                    clearSmallTopInsetOnView(firstChild, topBandPx);
                }
            }
        }

        View content = window.findViewById(android.R.id.content);
        if (content != null) {
            clearSmallTopInsetOnView(content, topBandPx);
            if (content instanceof ViewGroup) {
                ViewGroup contentGroup = (ViewGroup) content;
                if (contentGroup.getChildCount() > 0) {
                    clearSmallTopInsetOnView(contentGroup.getChildAt(0), topBandPx);
                }
            }
        }

        // 3. Clear YouTube watch/root container top padding/margin using cached integer IDs.
        View watchContainer = state.cachedWatchContainerRef.get();
        if (watchContainer == null || !watchContainer.isAttachedToWindow()) {
            watchContainer = null;
            for (int i = 0; i < watchContainerIds.length; i++) {
                View v = decor.findViewById(watchContainerIds[i]);
                if (v != null) {
                    clearSmallTopInsetOnView(v, topBandPx);
                    if (watchContainer == null) {
                        watchContainer = v;
                    }
                }
            }
            state.cachedWatchContainerRef = new WeakReference<>(watchContainer);
        } else {
            clearSmallTopInsetOnView(watchContainer, topBandPx);
        }

        // Collapse known status-bar spacer views only on forced scans (startup/focus/resize)
        // or when their cached integer IDs exist.
        if (forceScan) {
            for (int i = 0; i < statusBarSpacerIds.length; i++) {
                View spacer = decor.findViewById(statusBarSpacerIds[i]);
                if (spacer != null) {
                    collapseSpacerView(spacer, topBandPx);
                }
            }
        }

        // 4. Portrait maximized video player flush safety net.
        int decorW = decor.getWidth();
        int decorH = decor.getHeight();
        if (decorH <= decorW) {
            restoreShift(state);
            return false;
        }

        View playerView = findPortraitMaximizedPlayerFast(decor, watchContainer, res, state, decorW, decorH, forceScan);
        if (playerView == null) {
            restoreShift(state);
            return false;
        }

        clearAncestorTopInsets(playerView, content, topBandPx);

        decor.getLocationOnScreen(state.tmpLocA);
        playerView.getLocationOnScreen(state.tmpLocB);
        int currentScreenGap = state.tmpLocB[1] - state.tmpLocA[1];
        int naturalGap = currentScreenGap + state.appliedShiftPx;

        if (naturalGap > 0 && naturalGap <= topBandPx) {
            View shiftTarget = watchContainer != null ? watchContainer : playerView;
            applyShift(state, shiftTarget, naturalGap, decorH);
        } else {
            restoreShift(state);
        }
        return true;
    }

    private static View findPortraitMaximizedPlayerFast(
            View decor,
            View watchContainer,
            Resources res,
            ActivityState state,
            int decorW,
            int decorH,
            boolean forceScan
    ) {
        int minPlayerW = (int) (decorW * 0.88f);
        int minPlayerH = dpToPx(res, 120);
        int maxPlayerH = (int) (decorH * 0.65f);

        // Fast path 1: check previously cached player view (O(1)).
        View cached = state.cachedPlayerViewRef.get();
        if (cached != null && cached.isAttachedToWindow()) {
            if (isMaximizedPortraitPlayerBox(cached, minPlayerW, minPlayerH, maxPlayerH)) {
                return cached;
            }
        }

        // Fast path 2: check resolved integer IDs directly (never calls getIdentifier).
        View searchRoot = watchContainer != null ? watchContainer : decor;
        for (int i = 0; i < playerContainerIds.length; i++) {
            View v = searchRoot.findViewById(playerContainerIds[i]);
            if (isMaximizedPortraitPlayerBox(v, minPlayerW, minPlayerH, maxPlayerH)) {
                state.cachedPlayerViewRef = new WeakReference<>(v);
                return v;
            }
        }

        // Slow fallback: only scan watchContainer (never RecyclerView/feed subtrees) and
        // rate-limit to at most once every 900ms so scrolling Home has 0 tree-walk cost.
        long now = SystemClock.uptimeMillis();
        if (!forceScan && (now - state.lastSurfaceScanMs) < SURFACE_FALLBACK_SCAN_INTERVAL_MS) {
            return null;
        }
        state.lastSurfaceScanMs = now;
        if (watchContainer == null) {
            return null;
        }
        View found = findPlayerSurfaceContainerRecursive(watchContainer, minPlayerW, minPlayerH, maxPlayerH, 0);
        if (found != null) {
            state.cachedPlayerViewRef = new WeakReference<>(found);
        }
        return found;
    }

    private static boolean isMaximizedPortraitPlayerBox(View v, int minW, int minH, int maxH) {
        if (v == null || !v.isShown()) {
            return false;
        }
        int w = v.getWidth();
        int h = v.getHeight();
        return w >= minW && h >= minH && h <= maxH;
    }

    private static View findPlayerSurfaceContainerRecursive(
            View node,
            int minW,
            int minH,
            int maxH,
            int depth
    ) {
        if (node == null || depth > 10 || !node.isShown()) {
            return null;
        }
        if (node instanceof SurfaceView || node instanceof TextureView) {
            if (isMaximizedPortraitPlayerBox(node, minW, minH, maxH)) {
                ViewParent parent = node.getParent();
                if (parent instanceof View) {
                    View parentView = (View) parent;
                    if (isMaximizedPortraitPlayerBox(parentView, minW, minH, maxH)) {
                        return parentView;
                    }
                }
                return node;
            }
            return null;
        }
        if (node instanceof ViewGroup) {
            if (isScrollableFeedContainer(node)) {
                return null;
            }
            ViewGroup vg = (ViewGroup) node;
            int count = vg.getChildCount();
            for (int i = 0; i < count; i++) {
                View found = findPlayerSurfaceContainerRecursive(vg.getChildAt(i), minW, minH, maxH, depth + 1);
                if (found != null) {
                    return found;
                }
            }
        }
        return null;
    }

    // -------------------------------------------------------------------------
    // Home screen scrolling toolbar ("Scroll away home toolbar" patch)
    // -------------------------------------------------------------------------

    private static void enforceHomeScrollToolbar(
            final Activity activity,
            Window window,
            View decor,
            final ActivityState state,
            boolean playerMaximized
    ) {
        if (playerMaximized) {
            return;
        }

        View content = window.findViewById(android.R.id.content);
        View searchRoot = content != null ? content : decor;

        ViewGroup appBar = findAppBarLayoutFast(searchRoot, state);
        if (appBar == null) {
            return;
        }

        // Attach an additive OnLayoutChangeListener once so child additions/tab switches
        // update scrollFlags immediately without overwriting YouTube's own listeners.
        if (!state.appBarLayoutListenerAttached) {
            final WeakReference<Activity> actRef = new WeakReference<>(activity);
            final WeakReference<ViewGroup> barRef = new WeakReference<>(appBar);
            state.appBarLayoutChangeListener = new View.OnLayoutChangeListener() {
                @Override
                public void onLayoutChange(
                        View v,
                        int left, int top, int right, int bottom,
                        int oldLeft, int oldTop, int oldRight, int oldBottom
                ) {
                    Activity act = actRef.get();
                    ViewGroup bar = barRef.get();
                    if (act == null || bar == null || act.isFinishing() || act.isDestroyed()) {
                        return;
                    }
                    int count = bar.getChildCount();
                    if (count != state.lastAppBarChildCount) {
                        state.lastAppBarChildCount = count;
                        updateAppBarScrollFlags(act, bar, state);
                    }
                }
            };
            appBar.addOnLayoutChangeListener(state.appBarLayoutChangeListener);
            state.appBarLayoutListenerAttached = true;
        }

        state.lastAppBarChildCount = appBar.getChildCount();
        updateAppBarScrollFlags(activity, appBar, state);
    }

    private static void updateAppBarScrollFlags(Activity activity, ViewGroup appBar, ActivityState state) {
        if (appBar == null || !appBar.isAttachedToWindow()) {
            return;
        }
        Window window = activity.getWindow();
        View decor = window != null ? window.getDecorView() : null;
        boolean shouldScrollAway = isHomeToolbarScreen(decor, appBar, state);

        int count = appBar.getChildCount();
        for (int i = 0; i < count; i++) {
            View child = appBar.getChildAt(i);
            if (child == null) {
                continue;
            }
            ViewGroup.LayoutParams lp = child.getLayoutParams();
            if (lp == null) {
                continue;
            }
            ScrollFlagsAccessor accessor = getScrollFlagsAccessor(lp.getClass());
            if (accessor == null || !accessor.isValid()) {
                continue;
            }
            try {
                int current = accessor.get(lp);
                if (shouldScrollAway) {
                    if (!state.originalScrollFlags.containsKey(child)) {
                        state.originalScrollFlags.put(child, current);
                    }
                    if (current != SCROLL_FLAG_SCROLL) {
                        accessor.set(lp, SCROLL_FLAG_SCROLL);
                        child.setLayoutParams(lp);
                    }
                } else {
                    Integer orig = state.originalScrollFlags.get(child);
                    if (orig != null && current != orig) {
                        accessor.set(lp, orig);
                        child.setLayoutParams(lp);
                    }
                }
            } catch (Throwable ignored) {
            }
        }
    }

    private static boolean isHomeToolbarScreen(View decor, ViewGroup appBar, ActivityState state) {
        // Never force-scroll away when typing in a Search EditText inside the toolbar.
        if (containsVisibleEditText(appBar, 0)) {
            return false;
        }
        // Skip sub-pages (Notifications, History, Channel, Settings) that display a non-empty text title.
        if (hasNonHomeToolbarTitle(appBar, 0)) {
            return false;
        }
        if (decor == null) {
            return true;
        }
        ViewGroup navBar = findNavBarFast(decor, state);
        if (navBar == null || !navBar.isShown()) {
            return true;
        }
        int selectedIndex = findSelectedNavTabIndex(navBar);
        // If we can identify the selected tab, restrict scroll-away strictly to tab 0 (Home).
        // If no tab reports selected/activated, allow Home scroll-away by default.
        return selectedIndex <= 0;
    }

    private static boolean containsVisibleEditText(View node, int depth) {
        if (node == null || depth > 6 || !node.isShown()) {
            return false;
        }
        if (node instanceof EditText) {
            return true;
        }
        if (node instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) node;
            int count = vg.getChildCount();
            for (int i = 0; i < count; i++) {
                if (containsVisibleEditText(vg.getChildAt(i), depth + 1)) {
                    return true;
                }
            }
        }
        return false;
    }

    private static boolean hasNonHomeToolbarTitle(View node, int depth) {
        if (node == null || depth > 5 || !node.isShown()) {
            return false;
        }
        CharSequence title = extractToolbarTitle(node);
        if (title != null && title.length() > 0) {
            String s = title.toString().trim();
            if (!s.isEmpty() && !s.equalsIgnoreCase("YouTube") && !s.equalsIgnoreCase("Home")) {
                return true;
            }
        }
        if (node instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) node;
            int count = vg.getChildCount();
            for (int i = 0; i < count; i++) {
                if (hasNonHomeToolbarTitle(vg.getChildAt(i), depth + 1)) {
                    return true;
                }
            }
        }
        return false;
    }

    private static CharSequence extractToolbarTitle(View view) {
        if (view instanceof Toolbar) {
            return ((Toolbar) view).getTitle();
        }
        String className = view.getClass().getName();
        if (className.endsWith("Toolbar") || className.contains(".Toolbar")) {
            try {
                Method m = view.getClass().getMethod("getTitle");
                Object res = m.invoke(view);
                if (res instanceof CharSequence) {
                    return (CharSequence) res;
                }
            } catch (Throwable ignored) {
            }
        }
        return null;
    }

    private static ViewGroup findAppBarLayoutFast(View root, ActivityState state) {
        ViewGroup cached = state.cachedAppBarRef.get();
        if (cached != null && cached.isAttachedToWindow()) {
            return cached;
        }
        state.appBarLayoutListenerAttached = false;

        for (int i = 0; i < appBarIds.length; i++) {
            View v = root.findViewById(appBarIds[i]);
            if (v instanceof ViewGroup && isAppBarLayoutClass(v)) {
                ViewGroup bar = (ViewGroup) v;
                state.cachedAppBarRef = new WeakReference<>(bar);
                return bar;
            }
        }

        ViewGroup found = findAppBarLayoutRecursive(root, 0);
        if (found != null) {
            state.cachedAppBarRef = new WeakReference<>(found);
        }
        return found;
    }

    private static ViewGroup findAppBarLayoutRecursive(View node, int depth) {
        if (node == null || depth > 8) {
            return null;
        }
        if (node instanceof ViewGroup) {
            if (isAppBarLayoutClass(node)) {
                return (ViewGroup) node;
            }
            if (isScrollableFeedContainer(node)) {
                return null;
            }
            ViewGroup vg = (ViewGroup) node;
            int count = vg.getChildCount();
            for (int i = 0; i < count; i++) {
                ViewGroup found = findAppBarLayoutRecursive(vg.getChildAt(i), depth + 1);
                if (found != null) {
                    return found;
                }
            }
        }
        return null;
    }

    private static boolean isAppBarLayoutClass(View v) {
        if (!(v instanceof ViewGroup)) {
            return false;
        }
        Class<?> c = v.getClass();
        while (c != null && c != ViewGroup.class && c != View.class && c != Object.class) {
            if (c.getName().contains("AppBarLayout")) {
                return true;
            }
            c = c.getSuperclass();
        }
        return false;
    }

    private static ViewGroup findNavBarFast(View decor, ActivityState state) {
        ViewGroup cached = state.cachedNavBarRef.get();
        if (cached != null && cached.isAttachedToWindow()) {
            return cached;
        }
        for (int i = 0; i < navBarIds.length; i++) {
            View v = decor.findViewById(navBarIds[i]);
            if (v instanceof ViewGroup) {
                ViewGroup nav = (ViewGroup) v;
                state.cachedNavBarRef = new WeakReference<>(nav);
                return nav;
            }
        }
        ViewGroup found = findNavBarRecursive(decor, 0);
        if (found != null) {
            state.cachedNavBarRef = new WeakReference<>(found);
        }
        return found;
    }

    private static ViewGroup findNavBarRecursive(View node, int depth) {
        if (node == null || depth > 8) {
            return null;
        }
        if (node instanceof ViewGroup) {
            String name = node.getClass().getName();
            if (name.contains("PivotBar") || name.contains("NavigationRail")) {
                return (ViewGroup) node;
            }
            if (isScrollableFeedContainer(node)) {
                return null;
            }
            ViewGroup vg = (ViewGroup) node;
            int count = vg.getChildCount();
            for (int i = 0; i < count; i++) {
                ViewGroup found = findNavBarRecursive(vg.getChildAt(i), depth + 1);
                if (found != null) {
                    return found;
                }
            }
        }
        return null;
    }

    private static int findSelectedNavTabIndex(ViewGroup navBar) {
        ViewGroup tabsContainer = navBar;
        // Unwrap single-child wrappers (e.g. HorizontalScrollView -> LinearLayout tabs container).
        for (int unwrap = 0; unwrap < 3; unwrap++) {
            if (tabsContainer.getChildCount() == 1 && tabsContainer.getChildAt(0) instanceof ViewGroup) {
                tabsContainer = (ViewGroup) tabsContainer.getChildAt(0);
            } else {
                break;
            }
        }
        int visibleTabIdx = 0;
        int count = tabsContainer.getChildCount();
        for (int i = 0; i < count; i++) {
            View tab = tabsContainer.getChildAt(i);
            if (tab == null || tab.getVisibility() != View.VISIBLE) {
                continue;
            }
            if (isViewOrChildSelected(tab, 0)) {
                return visibleTabIdx;
            }
            visibleTabIdx++;
        }
        return -1;
    }

    private static boolean isViewOrChildSelected(View v, int depth) {
        if (v == null || depth > 3) {
            return false;
        }
        if (v.isSelected() || v.isActivated()) {
            return true;
        }
        if (v instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) v;
            int count = vg.getChildCount();
            for (int i = 0; i < count; i++) {
                if (isViewOrChildSelected(vg.getChildAt(i), depth + 1)) {
                    return true;
                }
            }
        }
        return false;
    }

    private static ScrollFlagsAccessor getScrollFlagsAccessor(Class<?> lpClass) {
        synchronized (SCROLL_FLAGS_CACHE) {
            ScrollFlagsAccessor cached = SCROLL_FLAGS_CACHE.get(lpClass);
            if (cached != null) {
                return cached == NO_ACCESSOR ? null : cached;
            }
        }

        ScrollFlagsAccessor resolved = resolveScrollFlagsAccessor(lpClass);
        synchronized (SCROLL_FLAGS_CACHE) {
            SCROLL_FLAGS_CACHE.put(lpClass, resolved != null ? resolved : NO_ACCESSOR);
        }
        return resolved;
    }

    private static ScrollFlagsAccessor resolveScrollFlagsAccessor(Class<?> lpClass) {
        // 1. Try unobfuscated Material Components getScrollFlags() / setScrollFlags(int).
        try {
            Method getter = lpClass.getMethod("getScrollFlags");
            Method setter = lpClass.getMethod("setScrollFlags", int.class);
            if (getter.getReturnType() == int.class) {
                return new ScrollFlagsAccessor(getter, setter, null);
            }
        } catch (Throwable ignored) {
        }

        // 2. R8-obfuscated fallback: in AppBarLayout.LayoutParams (subclass of LinearLayout.LayoutParams),
        //    scrollFlags is the ONLY non-static, non-final int field declared below LinearLayout.LayoutParams.
        Class<?> c = lpClass;
        Field uniqueIntField = null;
        int intFieldCount = 0;
        while (c != null
                && c != LinearLayout.LayoutParams.class
                && c != ViewGroup.MarginLayoutParams.class
                && c != ViewGroup.LayoutParams.class
                && c != Object.class) {
            Field[] fields = c.getDeclaredFields();
            for (int i = 0; i < fields.length; i++) {
                Field f = fields[i];
                int mod = f.getModifiers();
                if (f.getType() == int.class && !Modifier.isStatic(mod) && !Modifier.isFinal(mod)) {
                    if ("scrollFlags".equals(f.getName())) {
                        f.setAccessible(true);
                        return new ScrollFlagsAccessor(null, null, f);
                    }
                    uniqueIntField = f;
                    intFieldCount++;
                }
            }
            c = c.getSuperclass();
        }

        if (intFieldCount == 1 && uniqueIntField != null) {
            try {
                uniqueIntField.setAccessible(true);
                return new ScrollFlagsAccessor(null, null, uniqueIntField);
            } catch (Throwable ignored) {
            }
        }
        return null;
    }

    private static boolean isScrollableFeedContainer(View v) {
        String name = v.getClass().getName();
        return name.contains("RecyclerView")
                || name.contains("ScrollView")
                || name.contains("ListView")
                || name.contains("GridView")
                || name.contains("WebView")
                || name.contains("ViewPager");
    }

    // -------------------------------------------------------------------------
    // Shared layout & shift helpers
    // -------------------------------------------------------------------------

    private static void applyShift(ActivityState state, View target, int shiftPx, int decorH) {
        if (target == null || shiftPx <= 0) {
            restoreShift(state);
            return;
        }
        View prev = state.shiftedViewRef.get();
        if (prev != null && prev != target) {
            restoreShift(state);
        }

        boolean targetChanged = (prev != target);
        if (targetChanged) {
            ViewGroup.LayoutParams curLp = target.getLayoutParams();
            state.originalShiftedHeight = curLp != null ? curLp.height : ViewGroup.LayoutParams.MATCH_PARENT;
            state.shiftedViewRef = new WeakReference<>(target);
        }

        if (target.getTranslationY() != -shiftPx) {
            target.setTranslationY(-shiftPx);
        }

        ViewGroup.LayoutParams lp = target.getLayoutParams();
        if (lp != null && state.originalShiftedHeight == ViewGroup.LayoutParams.MATCH_PARENT) {
            int desiredH = decorH + shiftPx;
            if (lp.height != desiredH) {
                lp.height = desiredH;
                target.setLayoutParams(lp);
            }
        }
        state.appliedShiftPx = shiftPx;
    }

    private static void restoreShift(ActivityState state) {
        if (state == null) {
            return;
        }
        View prev = state.shiftedViewRef.get();
        if (prev != null && state.appliedShiftPx != 0) {
            try {
                if (prev.getTranslationY() != 0f) {
                    prev.setTranslationY(0f);
                }
                ViewGroup.LayoutParams lp = prev.getLayoutParams();
                if (lp != null && lp.height != state.originalShiftedHeight) {
                    lp.height = state.originalShiftedHeight;
                    prev.setLayoutParams(lp);
                }
            } catch (Throwable ignored) {
            }
        }
        state.appliedShiftPx = 0;
        state.shiftedViewRef = new WeakReference<>(null);
        state.originalShiftedHeight = ViewGroup.LayoutParams.MATCH_PARENT;
    }

    private static void clearAncestorTopInsets(View leaf, View stopAt, int topBandPx) {
        View cur = leaf;
        int steps = 0;
        while (cur != null && steps < 12) {
            clearSmallTopInsetOnView(cur, topBandPx);
            if (cur == stopAt) {
                break;
            }
            ViewParent p = cur.getParent();
            cur = (p instanceof View) ? (View) p : null;
            steps++;
        }
    }

    private static void clearSmallTopInsetOnView(View v, int topBandPx) {
        if (v == null) {
            return;
        }
        try {
            int padTop = v.getPaddingTop();
            if (padTop > 0 && padTop <= topBandPx) {
                v.setPadding(v.getPaddingLeft(), 0, v.getPaddingRight(), v.getPaddingBottom());
            }
            ViewGroup.LayoutParams lp = v.getLayoutParams();
            if (lp instanceof ViewGroup.MarginLayoutParams) {
                ViewGroup.MarginLayoutParams mlp = (ViewGroup.MarginLayoutParams) lp;
                if (mlp.topMargin > 0 && mlp.topMargin <= topBandPx) {
                    mlp.topMargin = 0;
                    v.setLayoutParams(mlp);
                }
            }
        } catch (Throwable ignored) {
        }
    }

    private static void collapseSpacerView(View spacer, int topBandPx) {
        if (spacer == null) {
            return;
        }
        try {
            int h = spacer.getHeight();
            ViewGroup.LayoutParams lp = spacer.getLayoutParams();
            int lpH = lp != null ? lp.height : 0;
            if ((h > 0 && h <= topBandPx) || (lpH > 0 && lpH <= topBandPx)) {
                if (spacer.getVisibility() != View.GONE) {
                    spacer.setVisibility(View.GONE);
                }
                if (spacer.getAlpha() != 0f) {
                    spacer.setAlpha(0f);
                }
                if (lp != null && lp.height != 0) {
                    lp.height = 0;
                    spacer.setLayoutParams(lp);
                }
            }
        } catch (Throwable ignored) {
        }
    }

    private static int readStatusBarHeightPx(Resources res) {
        if (res == null) {
            return 0;
        }
        try {
            int resId = res.getIdentifier("status_bar_height", "dimen", "android");
            if (resId > 0) {
                return res.getDimensionPixelSize(resId);
            }
        } catch (Throwable ignored) {
        }
        return 0;
    }

    private static int getTopBandPx(Resources res) {
        int sb = cachedStatusBarHeightPx >= 0 ? cachedStatusBarHeightPx : readStatusBarHeightPx(res);
        int minBand = dpToPx(res, 56);
        int sbBand = sb + dpToPx(res, 16);
        return Math.max(minBand, sbBand);
    }

    private static int dpToPx(Resources res, int dp) {
        if (res == null) {
            return dp * 2;
        }
        return Math.round(dp * res.getDisplayMetrics().density);
    }
}
