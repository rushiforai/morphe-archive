package app.morphe.extension.youtube.patches.fullscreen;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Insets;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.RenderEffect;
import android.graphics.RenderNode;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.DisplayCutout;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowInsetsController;
import android.view.WindowManager;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.WeakHashMap;

/**
 * Independent YouTube add-on helper engineered for zero scroll overhead:
 * 1. Remove top black bar (event-driven edge-to-edge + inset stripping + status-bar collapse).
 * 2. Scroll away toolbar (AppBarLayout SCROLL_FLAG_SCROLL across Home, Subscriptions, Library, and sub-pages).
 * 3. Swap profile photo with Library icon (replaces You tab avatar with crisp vector Library icon).
 * 4. Glass navigation bar blur (adjustable RenderEffect blur radius with live Morphe Settings slider).
 * 5. Transparent status bar (keeps status bar visible while stripping all gray/translucent scrims).
 */
@SuppressWarnings("unused")
public final class YouTubeFullscreenFilter {

    private static final String PREFS_NAME = "morphe_yt_addon_prefs";
    private static final String KEY_GLASS_BLUR_DP = "glass_nav_blur_dp";
    private static final String KEY_HIDE_GLASS_SHADOW = "glass_nav_hide_shadow";
    private static final String LIBRARY_ICON_TAG = "morphe_yt_library_icon_view";
    private static final String GLASS_CAPSULE_CLASS_SUFFIX = "GlassCapsuleDrawable";
    private static volatile Shader transparentShader = null;
    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());

    private static final int SCROLL_FLAG_SCROLL = 0x1;
    private static final long APPBAR_UPDATE_DEBOUNCE_MS = 60L;
    private static final int MAX_COLD_START_RETRIES = 4;

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
            "status_bar_tint",
            "status_bar_overlay",
            "toolbar_status_bar_background",
            "header_status_bar_background"
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

    private static final String[] YOU_TAB_AVATAR_CONTAINER_NAMES = {
            "thumbnail_layout",
            "avatar_layout",
            "account_avatar_container"
    };

    private static final WeakHashMap<Activity, ActivityState> STATES = new WeakHashMap<>();
    private static final HashMap<Class<?>, ScrollFlagsAccessor> SCROLL_FLAGS_CACHE = new HashMap<>();
    private static final HashMap<Class<?>, Field> RENDER_NODE_FIELD_CACHE = new HashMap<>();
    private static final ScrollFlagsAccessor NO_ACCESSOR = new ScrollFlagsAccessor(null, null, null);
    private static final Field NO_FIELD;

    static {
        Field fSentinel = null;
        try {
            fSentinel = YouTubeFullscreenFilter.class.getDeclaredField("PREFS_NAME");
        } catch (Throwable ignored) {
        }
        NO_FIELD = fSentinel;
    }

    private static volatile boolean removeTopBlackBarEnabled = false;
    private static volatile boolean homeScrollToolbarEnabled = false;
    private static volatile boolean swapProfileWithLibraryEnabled = false;
    private static volatile boolean glassBlurEnabled = false;
    private static volatile boolean transparentStatusBarEnabled = false;
    private static volatile boolean lifecycleRegistered = false;
    private static volatile WeakReference<Activity> currentActivityRef = new WeakReference<>(null);
    private static final HashMap<Class<?>, StatusBarScrimMethods> STATUS_BAR_SCRIM_CACHE = new HashMap<>();
    private static final StatusBarScrimMethods NO_SCRIM_METHODS = new StatusBarScrimMethods(null, null, null, null);

    // Glass navigation bar blur + clean edge state (fast O(1) volatile check during draw).
    private static volatile int savedGlassBlurDp = -1; // -1 = App default, 0 = Off, 1..60 = custom dp
    private static volatile boolean savedHideGlassShadow = true;
    private static volatile boolean glassBlurPrefLoaded = false;
    private static volatile int glassBlurRevision = 0;
    private static volatile float appDensity = 2.0f;
    private static volatile float detectedDefaultBlurPx = -1f;
    private static WeakReference<Object> lastFrostedDrawableRef = new WeakReference<>(null);
    private static int lastFrostedDrawableRevision = -1;
    private static WeakReference<Drawable> lastGlassCapsuleRef = new WeakReference<>(null);
    private static WeakReference<Drawable> savedGlassAppBgRef = new WeakReference<>(null);
    private static final HashMap<Class<?>, GlassCapsuleFields> GLASS_CAPSULE_CACHE = new HashMap<>();
    private static final GlassCapsuleFields NO_GLASS_FIELDS = new GlassCapsuleFields(null, null, null, null, null, null);
    private static final HashMap<Class<?>, Field> CALLBACK_OUTER_FIELD_CACHE = new HashMap<>();

    // Navigation button enum tracking so ONLY the "You" (profile photo) tab is swapped.
    private static volatile String lastNavigationEnumName = null;
    private static final WeakHashMap<View, Boolean> YOU_TAB_VIEWS = new WeakHashMap<>();

    // Process-wide cached resource IDs (resolved once, never during scroll).
    private static volatile boolean idsResolved = false;
    private static int[] watchContainerIds = new int[0];
    private static int[] statusBarSpacerIds = new int[0];
    private static int[] appBarIds = new int[0];
    private static int[] navBarIds = new int[0];
    private static int[] youTabAvatarContainerIds = new int[0];
    private static int paneFragmentContainerId = 0;
    private static int tabLabelTextId = 0;
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

    private static final class AppBarHook {
        final View.OnLayoutChangeListener layoutListener;
        final Runnable primarySync;
        final Runnable secondarySync;

        AppBarHook(View.OnLayoutChangeListener layoutListener, Runnable primarySync, Runnable secondarySync) {
            this.layoutListener = layoutListener;
            this.primarySync = primarySync;
            this.secondarySync = secondarySync;
        }
    }

    private static final class ActivityState {
        boolean decorListenersInstalled = false;
        boolean sysStatusBgSearched = false;
        int coldStartRetries = 0;

        WeakReference<View> cachedSysStatusBgRef = new WeakReference<>(null);
        WeakReference<View> cachedWatchContainerRef = new WeakReference<>(null);
        WeakReference<ViewGroup> cachedNavBarRef = new WeakReference<>(null);
        WeakReference<View> cachedPaneContainerRef = new WeakReference<>(null);

        final WeakHashMap<ViewGroup, AppBarHook> hookedAppBars = new WeakHashMap<>();
        final WeakHashMap<View, Integer> originalScrollFlags = new WeakHashMap<>();

        View.OnLayoutChangeListener decorResizeListener;
        ViewTreeObserver.OnWindowFocusChangeListener focusChangeListener;
        View.OnLayoutChangeListener paneLayoutChangeListener;
        Runnable panePrimarySync;
        Runnable paneSecondarySync;
        Runnable coldStartRetryRunnable;
        Runnable[] tabSyncRunnables;
    }

    private YouTubeFullscreenFilter() {
    }

    // -------------------------------------------------------------------------
    // Patch entry points
    // -------------------------------------------------------------------------

    /**
     * Hooked at index 0 of YouTube's MainActivity.onCreate(Bundle) by "Remove top black bar".
     * Never touches getWindow()/getDecorView() synchronously before super.onCreate().
     */
    public static void onMainActivityCreated(Activity activity) {
        removeTopBlackBarEnabled = true;
        initActivityHook(activity);
    }

    /**
     * Hooked at index 0 of YouTube's MainActivity.onCreate(Bundle) by "Scroll away home toolbar".
     */
    public static void onHomeScrollToolbarEnabled(Activity activity) {
        homeScrollToolbarEnabled = true;
        initActivityHook(activity);
    }

    /**
     * Hooked at index 0 of YouTube's MainActivity.onCreate(Bundle) by "Swap profile photo with Library icon".
     */
    public static void onSwapProfileWithLibraryEnabled(Activity activity) {
        swapProfileWithLibraryEnabled = true;
        initActivityHook(activity);
    }

    /**
     * Hooked at index 0 of YouTube's MainActivity.onCreate(Bundle) by "Glass navigation bar blur".
     */
    public static void onGlassBlurEnabled(Activity activity) {
        glassBlurEnabled = true;
        initActivityHook(activity);
        if (activity != null) {
            ensureGlassBlurPrefLoaded(activity);
        }
    }

    /**
     * Hooked at index 0 of YouTube's MainActivity.onCreate(Bundle) by "Transparent status bar (YouTube)".
     * Keeps the status bar visible while stripping all gray/translucent scrims behind it.
     */
    public static void onTransparentStatusBarEnabled(Activity activity) {
        transparentStatusBarEnabled = true;
        initActivityHook(activity);
    }

    /**
     * Overrides YouTube's scrolling status-bar color feature flag (45830993) so YouTube does not
     * paint a semi-transparent gray/dark tint behind the status bar while scrolling.
     */
    public static boolean disableStatusBarScrollColor(boolean original) {
        return transparentStatusBarEnabled ? false : original;
    }

    /**
     * Hooked right after YouTube shows/colors its dedicated status bar background view.
     * Clears the view's background and collapses its visual scale so even scroll alpha animations
     * cannot paint a gray band behind the status bar icons.
     */
    public static void makeStatusBarBackgroundTransparent(View view) {
        if (!transparentStatusBarEnabled) {
            return;
        }
        try {
            if (view != null) {
                silenceStatusBarScrimView(view);
            }
            Activity act = currentActivityRef.get();
            if (act != null && !act.isFinishing() && !act.isDestroyed()) {
                configureTransparentStatusBarWindow(act);
            }
        } catch (Throwable ignored) {
        }
    }

    private static void initActivityHook(Activity activity) {
        if (activity == null) {
            return;
        }
        currentActivityRef = new WeakReference<>(activity);
        try {
            Resources res = activity.getResources();
            if (res != null) {
                appDensity = res.getDisplayMetrics().density;
                resolveResourceIdsOnce(res, activity.getPackageName());
            }
        } catch (Throwable ignored) {
        }
        registerLifecycleOnce(activity);
    }

    // -------------------------------------------------------------------------
    // Glass navigation bar blur preference + RenderEffect hooks
    // -------------------------------------------------------------------------

    public static int getGlassBlurDp(Context context) {
        ensureGlassBlurPrefLoaded(context);
        return savedGlassBlurDp;
    }

    public static boolean isHideGlassShadow(Context context) {
        ensureGlassBlurPrefLoaded(context);
        return savedHideGlassShadow;
    }

    public static int getDetectedDefaultBlurDp(Context context) {
        float d = appDensity;
        if (context != null && context.getResources() != null) {
            d = context.getResources().getDisplayMetrics().density;
            appDensity = d;
        }
        if (detectedDefaultBlurPx > 0f && d > 0f) {
            return Math.round(detectedDefaultBlurPx / d);
        }
        return 25;
    }

    public static void setGlassBlurDp(Context context, int blurDp) {
        setGlassAppearance(context, blurDp, savedHideGlassShadow);
    }

    public static void setGlassAppearance(Context context, int blurDp, boolean hideShadow) {
        int normalized = blurDp < 0 ? -1 : Math.max(0, Math.min(60, blurDp));
        savedGlassBlurDp = normalized;
        savedHideGlassShadow = hideShadow;
        glassBlurPrefLoaded = true;
        glassBlurRevision++;
        if (context != null) {
            try {
                if (context.getResources() != null) {
                    appDensity = context.getResources().getDisplayMetrics().density;
                }
                SharedPreferences prefs = context.getApplicationContext()
                        .getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
                prefs.edit()
                        .putInt(KEY_GLASS_BLUR_DP, normalized)
                        .putBoolean(KEY_HIDE_GLASS_SHADOW, hideShadow)
                        .apply();
            } catch (Throwable ignored) {
            }
        }
        // Apply immediately live on the main thread without requiring an app restart.
        MAIN_HANDLER.post(new Runnable() {
            @Override
            public void run() {
                Drawable glass = lastGlassCapsuleRef.get();
                if (glass != null) {
                    syncGlassCapsuleAppearance(glass, null);
                }
                Activity act = currentActivityRef.get();
                if (act != null && !act.isFinishing() && !act.isDestroyed()) {
                    Window w = act.getWindow();
                    View decor = w != null ? w.getDecorView() : null;
                    ActivityState st = getState(act);
                    if (decor != null && st != null) {
                        syncGlassCapsuleFromDecor(decor, st);
                    }
                }
            }
        });
    }

    private static void ensureGlassBlurPrefLoaded(Context context) {
        if (glassBlurPrefLoaded || context == null) {
            return;
        }
        try {
            if (context.getResources() != null) {
                appDensity = context.getResources().getDisplayMetrics().density;
            }
            SharedPreferences prefs = context.getApplicationContext()
                    .getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
            savedGlassBlurDp = prefs.getInt(KEY_GLASS_BLUR_DP, -1);
            savedHideGlassShadow = prefs.getBoolean(KEY_HIDE_GLASS_SHADOW, true);
            glassBlurPrefLoaded = true;
        } catch (Throwable ignored) {
        }
    }

    /**
     * Replaces RenderEffect.createBlurEffect(rx, ry, tileMode) inside YouTube's
     * "frostedGlassRenderNode" drawable class.
     */
    public static RenderEffect createGlassBlurEffect(float origX, float origY, Shader.TileMode tileMode) {
        if (Build.VERSION.SDK_INT < 31) {
            return null;
        }
        if (origX > 0f) {
            detectedDefaultBlurPx = origX;
        }
        Shader.TileMode safeMode = tileMode != null ? tileMode : Shader.TileMode.CLAMP;
        if (!glassBlurEnabled) {
            return RenderEffect.createBlurEffect(origX, origY, safeMode);
        }
        int blurDp = savedGlassBlurDp;
        if (blurDp < 0) {
            return RenderEffect.createBlurEffect(origX, origY, safeMode);
        }
        if (blurDp == 0) {
            // Non-null minimal blur so RenderEffect.createChainEffect never receives null.
            return RenderEffect.createBlurEffect(0.01f, 0.01f, safeMode);
        }
        float px = Math.max(0.5f, blurDp * appDensity);
        return RenderEffect.createBlurEffect(px, px, safeMode);
    }

    /**
     * Hooked at index 0 of draw(Canvas) on YouTube's "frostedGlassRenderNode" drawable.
     * Fast path is a single reference + int comparison (~1 ns) so scrolling has zero overhead;
     * when the user changes blur/shadow in Settings (or on initial draw), updates RenderNode
     * and Morphe's GlassCapsuleDrawable live.
     */
    public static void onFrostedGlassDraw(Object drawable) {
        if (!glassBlurEnabled || drawable == null || Build.VERSION.SDK_INT < 31) {
            return;
        }
        int rev = glassBlurRevision;
        if (drawable == lastFrostedDrawableRef.get() && lastFrostedDrawableRevision == rev) {
            return;
        }
        lastFrostedDrawableRef = new WeakReference<>(drawable);
        lastFrostedDrawableRevision = rev;

        final int blurDp = savedGlassBlurDp;

        // Discover parent GlassCapsuleDrawable from Drawable.getCallback() (zero view traversal).
        if (drawable instanceof Drawable) {
            final Drawable appBgDrawable = (Drawable) drawable;
            savedGlassAppBgRef = new WeakReference<>(appBgDrawable);
            final Drawable glassCapsule = resolveParentGlassCapsule(appBgDrawable);
            if (glassCapsule != null) {
                lastGlassCapsuleRef = new WeakReference<>(glassCapsule);
                // Post outside draw() so we never mutate appBackground or invalidate synchronously mid-draw.
                MAIN_HANDLER.post(new Runnable() {
                    @Override
                    public void run() {
                        syncGlassCapsuleAppearance(glassCapsule, appBgDrawable);
                    }
                });
            }
        }

        // On initial revision 0 with App default (-1), keep YouTube's native RenderEffect untouched.
        if (rev == 0 && blurDp < 0) {
            return;
        }

        Field nodeField = getCachedRenderNodeField(drawable.getClass());
        if (nodeField == null) {
            return;
        }
        try {
            Object rawNode = nodeField.get(drawable);
            if (!(rawNode instanceof RenderNode)) {
                return;
            }
            RenderNode node = (RenderNode) rawNode;
            if (blurDp == 0) {
                node.setRenderEffect(null);
            } else {
                float px;
                if (blurDp < 0) {
                    px = detectedDefaultBlurPx > 0f ? detectedDefaultBlurPx : (25f * appDensity);
                } else {
                    px = Math.max(0.5f, blurDp * appDensity);
                }
                node.setRenderEffect(RenderEffect.createBlurEffect(px, px, Shader.TileMode.CLAMP));
            }
        } catch (Throwable ignored) {
        }
    }

    private static Drawable resolveParentGlassCapsule(Drawable appBg) {
        if (appBg == null) {
            return null;
        }
        try {
            Drawable.Callback cb = appBg.getCallback();
            if (cb == null) {
                return null;
            }
            if (cb instanceof Drawable && cb.getClass().getName().endsWith(GLASS_CAPSULE_CLASS_SUFFIX)) {
                return (Drawable) cb;
            }
            Field outerField = getCachedCallbackOuterField(cb.getClass());
            if (outerField != null) {
                Object outer = outerField.get(cb);
                if (outer instanceof Drawable && outer.getClass().getName().endsWith(GLASS_CAPSULE_CLASS_SUFFIX)) {
                    return (Drawable) outer;
                }
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static Field getCachedCallbackOuterField(Class<?> cbClass) {
        synchronized (CALLBACK_OUTER_FIELD_CACHE) {
            Field cached = CALLBACK_OUTER_FIELD_CACHE.get(cbClass);
            if (cached != null) {
                return cached == NO_FIELD ? null : cached;
            }
        }
        Field resolved = null;
        try {
            Field[] fields = cbClass.getDeclaredFields();
            for (int i = 0; i < fields.length; i++) {
                Field f = fields[i];
                if (f.getType().getName().endsWith(GLASS_CAPSULE_CLASS_SUFFIX)) {
                    f.setAccessible(true);
                    resolved = f;
                    break;
                }
            }
        } catch (Throwable ignored) {
        }
        synchronized (CALLBACK_OUTER_FIELD_CACHE) {
            CALLBACK_OUTER_FIELD_CACHE.put(cbClass, resolved != null ? resolved : NO_FIELD);
        }
        return resolved;
    }

    private static void syncGlassCapsuleFromDecor(View decor, ActivityState state) {
        if (!glassBlurEnabled || decor == null) {
            return;
        }
        ViewGroup navBar = findNavBarFast(decor, state);
        if (navBar == null) {
            return;
        }
        Drawable bg = navBar.getBackground();
        if (bg != null && bg.getClass().getName().endsWith(GLASS_CAPSULE_CLASS_SUFFIX)) {
            lastGlassCapsuleRef = new WeakReference<>(bg);
            syncGlassCapsuleAppearance(bg, null);
        }
    }

    /**
     * Removes the stacked unblurred dark shadow layers around Morphe's GlassCapsuleDrawable
     * and cleanly detaches/reattaches YouTube's frostedGlassRenderNode appBackground when blur is 0 dp
     * so the capsule renders with pure hardware anti-aliased drawRoundRect (zero clipPath curved seam).
     */
    private static void syncGlassCapsuleAppearance(Drawable glassCapsule, Drawable knownAppBg) {
        if (!glassBlurEnabled || glassCapsule == null) {
            return;
        }
        GlassCapsuleFields fields = getCachedGlassCapsuleFields(glassCapsule.getClass());
        if (fields == null) {
            return;
        }
        boolean changed = false;
        try {
            Shader clearShader = savedHideGlassShadow ? getTransparentShader() : null;

            // 1. Silence or restore the 3 unblurred stacked black shadow roundRects on left/right/bottom
            //    via a transparent Shader (leaves shadowAlpha intact so toggling off restores immediately).
            if (fields.shadowPaintField != null) {
                Object rawShadow = fields.shadowPaintField.get(glassCapsule);
                if (rawShadow instanceof Paint) {
                    Paint shadowPaint = (Paint) rawShadow;
                    if (shadowPaint.getShader() != clearShader) {
                        shadowPaint.setShader(clearShader);
                        changed = true;
                    }
                }
            }

            // 2. If official edge/rim is disabled (rimScale <= 0), ensure bevelPaint cannot draw a stray dark line.
            if (fields.bevelPaintField != null && fields.rimScaleField != null) {
                float rimScale = fields.rimScaleField.getFloat(glassCapsule);
                Object rawBevel = fields.bevelPaintField.get(glassCapsule);
                if (rawBevel instanceof Paint) {
                    Paint bevelPaint = (Paint) rawBevel;
                    Shader targetBevel = (savedHideGlassShadow && rimScale <= 0f) ? clearShader : null;
                    if (bevelPaint.getShader() != targetBevel) {
                        bevelPaint.setShader(targetBevel);
                        changed = true;
                    }
                }
            }

            // 3. When blur == 0 dp, detach appBackground so GlassCapsuleDrawable skips
            //    canvas.clipPath(capsulePath) + drawRenderNode (which creates a 1px curved hairline seam)
            //    and renders via pure anti-aliased drawRoundRect; reattach seamlessly when blur != 0 dp.
            if (fields.appBackgroundField != null && fields.setAppBackgroundMethod != null) {
                Drawable currentAppBg = (Drawable) fields.appBackgroundField.get(glassCapsule);
                if (currentAppBg != null) {
                    savedGlassAppBgRef = new WeakReference<>(currentAppBg);
                } else if (knownAppBg != null) {
                    savedGlassAppBgRef = new WeakReference<>(knownAppBg);
                }

                if (savedGlassBlurDp == 0) {
                    if (currentAppBg != null) {
                        fields.setAppBackgroundMethod.invoke(glassCapsule, new Object[]{null});
                        changed = true;
                    }
                } else {
                    Drawable restoreBg = savedGlassAppBgRef.get();
                    if (currentAppBg == null && restoreBg != null) {
                        fields.setAppBackgroundMethod.invoke(glassCapsule, restoreBg);
                        changed = true;
                    }
                }
            }

            if (changed) {
                glassCapsule.invalidateSelf();
            }
        } catch (Throwable ignored) {
        }
    }

    private static GlassCapsuleFields getCachedGlassCapsuleFields(Class<?> cls) {
        synchronized (GLASS_CAPSULE_CACHE) {
            GlassCapsuleFields cached = GLASS_CAPSULE_CACHE.get(cls);
            if (cached != null) {
                return cached == NO_GLASS_FIELDS ? null : cached;
            }
        }
        Field shadowPaintField = null;
        Field shadowAlphaField = null;
        Field appBackgroundField = null;
        Field bevelPaintField = null;
        Field rimScaleField = null;
        Method setAppBackgroundMethod = null;
        try {
            shadowPaintField = findDeclaredField(cls, "shadowPaint");
            shadowAlphaField = findDeclaredField(cls, "shadowAlpha");
            appBackgroundField = findDeclaredField(cls, "appBackground");
            bevelPaintField = findDeclaredField(cls, "bevelPaint");
            rimScaleField = findDeclaredField(cls, "rimScale");
            try {
                setAppBackgroundMethod = cls.getMethod("setAppBackground", Drawable.class);
                setAppBackgroundMethod.setAccessible(true);
            } catch (Throwable ignored) {
            }
        } catch (Throwable ignored) {
        }
        GlassCapsuleFields resolved = (shadowPaintField != null || appBackgroundField != null)
                ? new GlassCapsuleFields(
                        shadowPaintField,
                        shadowAlphaField,
                        appBackgroundField,
                        bevelPaintField,
                        rimScaleField,
                        setAppBackgroundMethod)
                : NO_GLASS_FIELDS;
        synchronized (GLASS_CAPSULE_CACHE) {
            GLASS_CAPSULE_CACHE.put(cls, resolved);
        }
        return resolved == NO_GLASS_FIELDS ? null : resolved;
    }

    private static Shader getTransparentShader() {
        Shader s = transparentShader;
        if (s == null) {
            s = new LinearGradient(0f, 0f, 1f, 1f, Color.TRANSPARENT, Color.TRANSPARENT, Shader.TileMode.CLAMP);
            transparentShader = s;
        }
        return s;
    }

    private static Field findDeclaredField(Class<?> cls, String name) {
        Class<?> c = cls;
        while (c != null && c != Object.class) {
            try {
                Field f = c.getDeclaredField(name);
                f.setAccessible(true);
                return f;
            } catch (NoSuchFieldException ignored) {
                c = c.getSuperclass();
            } catch (Throwable ignored) {
                return null;
            }
        }
        return null;
    }

    private static final class GlassCapsuleFields {
        final Field shadowPaintField;
        final Field shadowAlphaField;
        final Field appBackgroundField;
        final Field bevelPaintField;
        final Field rimScaleField;
        final Method setAppBackgroundMethod;

        GlassCapsuleFields(
                Field shadowPaintField,
                Field shadowAlphaField,
                Field appBackgroundField,
                Field bevelPaintField,
                Field rimScaleField,
                Method setAppBackgroundMethod
        ) {
            this.shadowPaintField = shadowPaintField;
            this.shadowAlphaField = shadowAlphaField;
            this.appBackgroundField = appBackgroundField;
            this.bevelPaintField = bevelPaintField;
            this.rimScaleField = rimScaleField;
            this.setAppBackgroundMethod = setAppBackgroundMethod;
        }
    }

    private static Field getCachedRenderNodeField(Class<?> cls) {
        synchronized (RENDER_NODE_FIELD_CACHE) {
            Field cached = RENDER_NODE_FIELD_CACHE.get(cls);
            if (cached != null) {
                return cached == NO_FIELD ? null : cached;
            }
        }
        Field resolved = null;
        if (Build.VERSION.SDK_INT >= 29) {
            Class<?> c = cls;
            while (c != null && c != Object.class) {
                Field[] fields = c.getDeclaredFields();
                for (int i = 0; i < fields.length; i++) {
                    Field f = fields[i];
                    if (RenderNode.class.isAssignableFrom(f.getType())) {
                        try {
                            f.setAccessible(true);
                            resolved = f;
                            break;
                        } catch (Throwable ignored) {
                        }
                    }
                }
                if (resolved != null) {
                    break;
                }
                c = c.getSuperclass();
            }
        }
        synchronized (RENDER_NODE_FIELD_CACHE) {
            RENDER_NODE_FIELD_CACHE.put(cls, resolved != null ? resolved : NO_FIELD);
        }
        return resolved;
    }

    // -------------------------------------------------------------------------
    // PivotBar hooks (Swap profile photo with Library icon + App-wide scrolling toolbar)
    // -------------------------------------------------------------------------

    /**
     * Hooked right after YouTube resolves the navigation button enum inside InitializeButtons.
     * Every non-"You" tab (Home, Shorts, Create, Subscriptions, Notifications, etc.) sets an enum
     * right before creating its PivotBar tab view; the modern "You" profile photo tab does not.
     */
    public static void onNavigationEnumLoaded(Enum<?> ytNavigationEnum) {
        if (!swapProfileWithLibraryEnabled) {
            return;
        }
        try {
            if (ytNavigationEnum != null) {
                lastNavigationEnumName = ytNavigationEnum.name();
            }
        } catch (Throwable ignored) {
        }
    }

    /**
     * Hooked right after PivotBar creates an image-resource-styled tab view inside InitializeButtons.
     * On YouTube 21.43+ this is called for all tabs; ONLY the modern "You" profile photo tab
     * arrives with lastNavigationEnumName == null (or a You/Account/Library enum).
     */
    public static void onImageResourceTabLoaded(final View tabView) {
        if (!swapProfileWithLibraryEnabled || tabView == null) {
            lastNavigationEnumName = null;
            return;
        }
        try {
            String enumName = lastNavigationEnumName;
            lastNavigationEnumName = null;
            if (enumName == null || isYouProfileTabEnum(enumName)) {
                registerAndSwapYouTab(tabView);
            }
        } catch (Throwable ignored) {
        }
    }

    /**
     * Hooked right after PivotBar creates a drawable or int-resource tab view inside InitializeButtons.
     * Consumes lastNavigationEnumName so it never leaks into the following tab, and swaps only if
     * the enum explicitly identifies the You/Account/Library tab.
     */
    public static void onNavigationTabLoaded(final View tabView) {
        if (!swapProfileWithLibraryEnabled || tabView == null) {
            lastNavigationEnumName = null;
            return;
        }
        try {
            String enumName = lastNavigationEnumName;
            lastNavigationEnumName = null;
            if (isYouProfileTabEnum(enumName)) {
                registerAndSwapYouTab(tabView);
            }
        } catch (Throwable ignored) {
        }
    }

    private static boolean isYouProfileTabEnum(String enumName) {
        if (enumName == null) {
            return false;
        }
        return "ACCOUNT_CIRCLE".equals(enumName)
                || "ACCOUNT_CIRCLE_CAIRO".equals(enumName)
                || "PIVOT_LIBRARY".equals(enumName)
                || "VIDEO_LIBRARY_WHITE".equals(enumName);
    }

    private static void registerAndSwapYouTab(final View tabView) {
        YOU_TAB_VIEWS.put(tabView, Boolean.TRUE);
        Context ctx = tabView.getContext();
        if (ctx != null) {
            resolveResourceIdsOnce(ctx.getResources(), ctx.getPackageName());
        }
        swapYouTabToLibraryIcon(tabView);
        // Run once more after current message loop in case YouTube binds avatar children
        // immediately after returning the newly inflated tab view.
        tabView.post(new Runnable() {
            @Override
            public void run() {
                if (Boolean.TRUE.equals(YOU_TAB_VIEWS.get(tabView))) {
                    swapYouTabToLibraryIcon(tabView);
                }
            }
        });
    }

    /**
     * Hooked right after setSelected(boolean) inside PivotBar.
     * Updates the Library icon selection state on the You tab, and re-syncs AppBarLayout scroll flags
     * across the entire app whenever the user switches tabs (Home, Subscriptions, Library, etc.).
     */
    public static void onPivotTabSelected(View tabView, boolean isSelected) {
        if ((!swapProfileWithLibraryEnabled && !homeScrollToolbarEnabled) || tabView == null) {
            return;
        }
        if (swapProfileWithLibraryEnabled && Boolean.TRUE.equals(YOU_TAB_VIEWS.get(tabView))) {
            try {
                ViewGroup avatarContainer = findYouTabAvatarContainer(tabView);
                if (avatarContainer != null) {
                    swapYouTabToLibraryIcon(tabView);
                    View icon = avatarContainer.findViewWithTag(LIBRARY_ICON_TAG);
                    if (icon instanceof LibraryIconView) {
                        ((LibraryIconView) icon).setTabSelected(isSelected);
                    }
                }
            } catch (Throwable ignored) {
            }
        }
        if (homeScrollToolbarEnabled && isSelected) {
            try {
                scheduleToolbarTabSync();
            } catch (Throwable ignored) {
            }
        }
    }

    private static void scheduleToolbarTabSync() {
        Activity act = currentActivityRef.get();
        if (act == null || act.isFinishing() || act.isDestroyed()) {
            return;
        }
        final ActivityState state = getState(act);
        cancelPendingTabSyncs(state);

        final WeakReference<Activity> actRef = new WeakReference<>(act);
        final long[] delaysMs = {0L, 140L, 380L, 700L};
        Runnable[] tasks = new Runnable[delaysMs.length];
        for (int i = 0; i < delaysMs.length; i++) {
            Runnable r = new Runnable() {
                @Override
                public void run() {
                    Activity a = actRef.get();
                    if (a == null || a.isFinishing() || a.isDestroyed()) {
                        return;
                    }
                    attachAndSyncAllAppBars(a, state);
                }
            };
            tasks[i] = r;
            if (delaysMs[i] == 0L) {
                MAIN_HANDLER.post(r);
            } else {
                MAIN_HANDLER.postDelayed(r, delaysMs[i]);
            }
        }
        state.tabSyncRunnables = tasks;
    }

    private static void cancelPendingTabSyncs(ActivityState state) {
        if (state == null || state.tabSyncRunnables == null) {
            return;
        }
        Runnable[] tasks = state.tabSyncRunnables;
        state.tabSyncRunnables = null;
        for (int i = 0; i < tasks.length; i++) {
            if (tasks[i] != null) {
                MAIN_HANDLER.removeCallbacks(tasks[i]);
            }
        }
    }

    private static void scanNavBarForYouTab(View decor, ActivityState state) {
        if (!swapProfileWithLibraryEnabled || decor == null || YOU_TAB_VIEWS.isEmpty()) {
            return;
        }
        try {
            // Refresh ONLY already-verified You tab views (never blindly scan all nav bar tabs).
            for (View tab : YOU_TAB_VIEWS.keySet()) {
                if (tab != null && tab.isAttachedToWindow()) {
                    swapYouTabToLibraryIcon(tab);
                }
            }
        } catch (Throwable ignored) {
        }
    }

    private static void hideOriginalAvatarChild(View child, boolean isLinear) {
        if (child == null || (child instanceof LibraryIconView && LIBRARY_ICON_TAG.equals(child.getTag()))) {
            return;
        }
        // Keep original avatar/ring children hidden even if Glide reloads the bitmap asynchronously.
        if (child.getAlpha() != 0f) {
            child.setAlpha(0f);
        }
        if (child.getScaleX() != 0f) {
            child.setScaleX(0f);
        }
        if (child.getScaleY() != 0f) {
            child.setScaleY(0f);
        }
        int hiddenVis = isLinear ? View.GONE : View.INVISIBLE;
        if (child.getVisibility() != hiddenVis) {
            child.setVisibility(hiddenVis);
        }
    }

    private static boolean swapYouTabToLibraryIcon(View tabView) {
        final ViewGroup avatarContainer = findYouTabAvatarContainer(tabView);
        if (avatarContainer == null) {
            return false;
        }

        final boolean isLinear = avatarContainer instanceof LinearLayout;
        int origW = 0;
        int origH = 0;
        LibraryIconView existingIcon = null;

        int childCount = avatarContainer.getChildCount();
        for (int i = 0; i < childCount; i++) {
            View child = avatarContainer.getChildAt(i);
            if (child == null) {
                continue;
            }
            if (child instanceof LibraryIconView && LIBRARY_ICON_TAG.equals(child.getTag())) {
                existingIcon = (LibraryIconView) child;
                continue;
            }
            ViewGroup.LayoutParams clp = child.getLayoutParams();
            if (clp != null) {
                if (origW <= 0 && clp.width > 0) {
                    origW = clp.width;
                }
                if (origH <= 0 && clp.height > 0) {
                    origH = clp.height;
                }
            }
            hideOriginalAvatarChild(child, isLinear);
        }

        TextView labelView = null;
        if (tabLabelTextId != 0) {
            View tv = tabView.findViewById(tabLabelTextId);
            if (tv instanceof TextView) {
                labelView = (TextView) tv;
            }
        }

        if (existingIcon == null) {
            Context ctx = avatarContainer.getContext();
            int sizePx = dpToPx(ctx.getResources(), 24);
            int targetW = origW > 0 ? origW : sizePx;
            int targetH = origH > 0 ? origH : sizePx;

            LibraryIconView iconView = new LibraryIconView(ctx, labelView);
            iconView.setTag(LIBRARY_ICON_TAG);
            iconView.setDuplicateParentStateEnabled(true);
            iconView.setTabSelected(tabView.isSelected());

            ViewGroup.LayoutParams iconLp;
            if (avatarContainer instanceof FrameLayout) {
                iconLp = new FrameLayout.LayoutParams(targetW, targetH, Gravity.CENTER);
            } else if (avatarContainer instanceof LinearLayout) {
                LinearLayout.LayoutParams llp = new LinearLayout.LayoutParams(targetW, targetH);
                llp.gravity = Gravity.CENTER;
                iconLp = llp;
            } else {
                iconLp = new ViewGroup.LayoutParams(targetW, targetH);
            }
            avatarContainer.addView(iconView, iconLp);

            // Guard against YouTube dynamically adding a late avatar child inside this You tab container.
            avatarContainer.setOnHierarchyChangeListener(new ViewGroup.OnHierarchyChangeListener() {
                @Override
                public void onChildViewAdded(View parent, View child) {
                    hideOriginalAvatarChild(child, isLinear);
                }

                @Override
                public void onChildViewRemoved(View parent, View child) {
                }
            });
        } else {
            existingIcon.updateLabelRef(labelView);
            existingIcon.setTabSelected(tabView.isSelected());
        }
        return true;
    }

    private static ViewGroup findYouTabAvatarContainer(View tabView) {
        if (tabView == null) {
            return null;
        }
        for (int i = 0; i < youTabAvatarContainerIds.length; i++) {
            View v = tabView.findViewById(youTabAvatarContainerIds[i]);
            if (v instanceof ViewGroup) {
                return (ViewGroup) v;
            }
        }
        return null;
    }

    /**
     * Crisp hardware-accelerated vector Video Library icon (24dp grid):
     * - Unselected: outlined stacked media card with crisp play triangle & bottom-left shelf.
     * - Selected: solid filled rounded card with EVEN_ODD transparent cut-out play triangle & shelf.
     */
    private static final class LibraryIconView extends View {
        private final Paint strokePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint fillPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path workPath = new Path();
        private final Path shelfPath = new Path();
        private final RectF cardRect = new RectF();
        private WeakReference<TextView> siblingLabelRef;
        private boolean selectedState = false;

        LibraryIconView(Context context, TextView siblingLabel) {
            super(context);
            this.siblingLabelRef = new WeakReference<>(siblingLabel);
            strokePaint.setStyle(Paint.Style.STROKE);
            strokePaint.setStrokeCap(Paint.Cap.ROUND);
            strokePaint.setStrokeJoin(Paint.Join.ROUND);
            fillPaint.setStyle(Paint.Style.FILL);
        }

        void updateLabelRef(TextView siblingLabel) {
            if (siblingLabel != null) {
                this.siblingLabelRef = new WeakReference<>(siblingLabel);
            }
        }

        void setTabSelected(boolean selected) {
            if (this.selectedState != selected) {
                this.selectedState = selected;
                invalidate();
            }
        }

        @Override
        protected void drawableStateChanged() {
            super.drawableStateChanged();
            boolean nowSelected = isSelected();
            if (nowSelected != selectedState) {
                selectedState = nowSelected;
                invalidate();
            }
        }

        private int resolveIconColor() {
            TextView tv = siblingLabelRef != null ? siblingLabelRef.get() : null;
            if (tv != null && tv.isAttachedToWindow()) {
                int c = tv.getCurrentTextColor();
                if ((c >>> 24) > 0x20) {
                    return c;
                }
            }
            int mode = getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK;
            boolean dark = mode == Configuration.UI_MODE_NIGHT_YES;
            return dark ? Color.WHITE : 0xFF0F0F0F;
        }

        @Override
        protected void onDraw(Canvas canvas) {
            int w = getWidth();
            int h = getHeight();
            if (w <= 0 || h <= 0) {
                return;
            }

            float size = Math.min(w, h);
            float scale = size / 24f;
            float ox = (w - size) * 0.5f;
            float oy = (h - size) * 0.5f;

            int color = resolveIconColor();
            strokePaint.setColor(color);
            fillPaint.setColor(color);

            canvas.save();
            canvas.translate(ox, oy);

            // Front rounded media card bounds in 24x24 coordinates: (5.2, 3.2) .. (20.8, 16.8)
            cardRect.set(5.2f * scale, 3.2f * scale, 20.8f * scale, 16.8f * scale);
            float cornerR = 2.1f * scale;

            // Bottom-left stacked library shelf L-curve: (2.8, 7.2) -> (2.8, 18.6) -> (17.2, 20.4)
            shelfPath.reset();
            shelfPath.moveTo(2.8f * scale, 7.4f * scale);
            shelfPath.lineTo(2.8f * scale, 18.2f * scale);
            shelfPath.quadTo(2.8f * scale, 20.4f * scale, 5.0f * scale, 20.4f * scale);
            shelfPath.lineTo(17.2f * scale, 20.4f * scale);

            if (selectedState || isSelected()) {
                // Filled card with EVEN_ODD transparent cut-out play triangle so glass shines through.
                workPath.reset();
                workPath.setFillType(Path.FillType.EVEN_ODD);
                workPath.addRoundRect(cardRect, cornerR, cornerR, Path.Direction.CW);
                workPath.moveTo(11.0f * scale, 6.9f * scale);
                workPath.lineTo(11.0f * scale, 13.1f * scale);
                workPath.lineTo(16.2f * scale, 10.0f * scale);
                workPath.close();
                canvas.drawPath(workPath, fillPaint);

                strokePaint.setStrokeWidth(1.85f * scale);
                canvas.drawPath(shelfPath, strokePaint);
            } else {
                // Outlined card + crisp filled play triangle + stacked shelf stroke.
                strokePaint.setStrokeWidth(1.65f * scale);
                canvas.drawRoundRect(cardRect, cornerR, cornerR, strokePaint);
                canvas.drawPath(shelfPath, strokePaint);

                workPath.reset();
                workPath.setFillType(Path.FillType.WINDING);
                workPath.moveTo(11.2f * scale, 7.2f * scale);
                workPath.lineTo(11.2f * scale, 12.8f * scale);
                workPath.lineTo(15.9f * scale, 10.0f * scale);
                workPath.close();
                canvas.drawPath(workPath, fillPaint);
            }

            canvas.restore();
        }
    }

    // -------------------------------------------------------------------------
    // Top black bar inset hooks
    // -------------------------------------------------------------------------

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

    // -------------------------------------------------------------------------
    // Activity lifecycle & zero-jitter event listeners
    // -------------------------------------------------------------------------

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
            appBarIds = resolveIdArray(res, pkg, APP_BAR_NAMES);
            navBarIds = resolveIdArray(res, pkg, NAV_BAR_NAMES);
            youTabAvatarContainerIds = resolveIdArray(res, pkg, YOU_TAB_AVATAR_CONTAINER_NAMES);
            paneFragmentContainerId = res.getIdentifier("pane_fragment_container", "id", pkg);
            tabLabelTextId = res.getIdentifier("text", "id", pkg);
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
        cancelPendingTabSyncs(state);
        detachAllAppBarListeners(state);
        detachPaneListener(state);
        try {
            Window window = activity.getWindow();
            if (window == null) {
                return;
            }
            View decor = window.peekDecorView();
            if (decor == null) {
                return;
            }
            if (state.coldStartRetryRunnable != null) {
                decor.removeCallbacks(state.coldStartRetryRunnable);
            }
            if (state.decorResizeListener != null) {
                decor.removeOnLayoutChangeListener(state.decorResizeListener);
            }
            ViewTreeObserver vto = decor.getViewTreeObserver();
            if (vto != null && vto.isAlive() && state.focusChangeListener != null) {
                vto.removeOnWindowFocusChangeListener(state.focusChangeListener);
            }
        } catch (Throwable ignored) {
        }
    }

    private static void attachAndApply(Activity activity) {
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) {
            return;
        }
        resolveResourceIdsOnce(activity.getResources(), activity.getPackageName());
        if (glassBlurEnabled) {
            ensureGlassBlurPrefLoaded(activity);
        }

        final ActivityState state = getState(activity);
        if (removeTopBlackBarEnabled && !isFloatingOrSplitMode(activity)) {
            configureWindow(activity);
        }

        Window window = activity.getWindow();
        if (window == null) {
            return;
        }
        final View decor = window.getDecorView();
        if (decor == null) {
            return;
        }

        installDecorEventListeners(activity, decor, state);

        final WeakReference<Activity> actRef = new WeakReference<>(activity);
        decor.post(new Runnable() {
            @Override
            public void run() {
                Activity act = actRef.get();
                if (act == null || act.isFinishing() || act.isDestroyed()) {
                    return;
                }
                applyEventDrivenFixes(act, state);
            }
        });
    }

    private static void installDecorEventListeners(Activity activity, final View decor, final ActivityState state) {
        if (state.decorListenersInstalled) {
            return;
        }
        final WeakReference<Activity> actRef = new WeakReference<>(activity);

        state.decorResizeListener = new View.OnLayoutChangeListener() {
            @Override
            public void onLayoutChange(
                    View v,
                    int left, int top, int right, int bottom,
                    int oldLeft, int oldTop, int oldRight, int oldBottom
            ) {
                int newW = right - left;
                int newH = bottom - top;
                int oldW = oldRight - oldLeft;
                int oldH = oldBottom - oldTop;
                if (newW == oldW && newH == oldH) {
                    return;
                }
                Activity act = actRef.get();
                if (act == null || act.isFinishing() || act.isDestroyed()) {
                    return;
                }
                if (removeTopBlackBarEnabled && !isFloatingOrSplitMode(act)) {
                    configureWindow(act);
                    cleanRootTopInsets(act, state);
                }
                if (transparentStatusBarEnabled) {
                    applyTransparentStatusBar(act, decor, state);
                }
                if (homeScrollToolbarEnabled) {
                    attachAndSyncAllAppBars(act, state);
                }
                if (swapProfileWithLibraryEnabled) {
                    scanNavBarForYouTab(decor, state);
                }
            }
        };
        decor.addOnLayoutChangeListener(state.decorResizeListener);

        ViewTreeObserver vto = decor.getViewTreeObserver();
        if (vto != null && vto.isAlive()) {
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
                    applyEventDrivenFixes(act, state);
                }
            };
            vto.addOnWindowFocusChangeListener(state.focusChangeListener);
        }

        state.decorListenersInstalled = true;
    }

    private static void applyEventDrivenFixes(Activity activity, final ActivityState state) {
        Window window = activity.getWindow();
        final View decor = window != null ? window.getDecorView() : null;

        if (removeTopBlackBarEnabled && !isFloatingOrSplitMode(activity)) {
            configureWindow(activity);
            installInsetStrippers(activity, state);
            cleanRootTopInsets(activity, state);
        }

        if (transparentStatusBarEnabled && decor != null) {
            applyTransparentStatusBar(activity, decor, state);
        }

        if (swapProfileWithLibraryEnabled && decor != null) {
            scanNavBarForYouTab(decor, state);
        }

        if (glassBlurEnabled && decor != null) {
            syncGlassCapsuleFromDecor(decor, state);
        }

        if (homeScrollToolbarEnabled) {
            boolean attached = attachAndSyncAllAppBars(activity, state);
            if (!attached && decor != null && state.coldStartRetries < MAX_COLD_START_RETRIES) {
                state.coldStartRetries++;
                final WeakReference<Activity> actRef = new WeakReference<>(activity);
                if (state.coldStartRetryRunnable != null) {
                    decor.removeCallbacks(state.coldStartRetryRunnable);
                }
                state.coldStartRetryRunnable = new Runnable() {
                    @Override
                    public void run() {
                        Activity act = actRef.get();
                        if (act == null || act.isFinishing() || act.isDestroyed()) {
                            return;
                        }
                        if (swapProfileWithLibraryEnabled) {
                            scanNavBarForYouTab(decor, state);
                        }
                        if (!attachAndSyncAllAppBars(act, state) && state.coldStartRetries < MAX_COLD_START_RETRIES) {
                            state.coldStartRetries++;
                            decor.postDelayed(this, 450L);
                        }
                    }
                };
                decor.postDelayed(state.coldStartRetryRunnable, 450L);
            }
        }
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

    private static void installInsetStrippers(Activity activity, final ActivityState state) {
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
                    hideSysStatusBgIfPresent(v, state);
                    return v.onApplyWindowInsets(stripped);
                }
            });
        }

        if (content != null) {
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

    private static void cleanRootTopInsets(Activity activity, ActivityState state) {
        Window window = activity.getWindow();
        if (window == null) {
            return;
        }
        View decor = window.getDecorView();
        if (decor == null) {
            return;
        }

        int topBandPx = getTopBandPx(activity.getResources());
        View sysStatusBg = hideSysStatusBgIfPresent(decor, state);

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

        for (int i = 0; i < statusBarSpacerIds.length; i++) {
            View spacer = decor.findViewById(statusBarSpacerIds[i]);
            if (spacer != null) {
                collapseSpacerView(spacer, topBandPx);
            }
        }
    }

    private static View hideSysStatusBgIfPresent(View decor, ActivityState state) {
        View sysStatusBg = state.cachedSysStatusBgRef.get();
        if (sysStatusBg == null && !state.sysStatusBgSearched) {
            state.sysStatusBgSearched = true;
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
        return sysStatusBg;
    }

    // -------------------------------------------------------------------------
    // App-wide scrolling toolbar ("Scroll away home toolbar" patch)
    // -------------------------------------------------------------------------

    private static void detachAllAppBarListeners(ActivityState state) {
        if (state == null) {
            return;
        }
        try {
            ArrayList<ViewGroup> bars = new ArrayList<>(state.hookedAppBars.keySet());
            for (int i = 0; i < bars.size(); i++) {
                ViewGroup bar = bars.get(i);
                AppBarHook hook = state.hookedAppBars.get(bar);
                if (bar != null && hook != null) {
                    try {
                        bar.removeOnLayoutChangeListener(hook.layoutListener);
                        bar.removeCallbacks(hook.primarySync);
                        bar.removeCallbacks(hook.secondarySync);
                    } catch (Throwable ignored) {
                    }
                }
            }
            state.hookedAppBars.clear();
        } catch (Throwable ignored) {
        }
    }

    private static void detachPaneListener(ActivityState state) {
        if (state == null) {
            return;
        }
        try {
            View pane = state.cachedPaneContainerRef.get();
            if (pane != null) {
                if (state.paneLayoutChangeListener != null) {
                    pane.removeOnLayoutChangeListener(state.paneLayoutChangeListener);
                }
                if (state.panePrimarySync != null) {
                    pane.removeCallbacks(state.panePrimarySync);
                }
                if (state.paneSecondarySync != null) {
                    pane.removeCallbacks(state.paneSecondarySync);
                }
            }
            state.cachedPaneContainerRef = new WeakReference<>(null);
        } catch (Throwable ignored) {
        }
    }

    private static void ensurePaneContainerHooked(Activity activity, View searchRoot, final ActivityState state) {
        if (paneFragmentContainerId == 0 || searchRoot == null) {
            return;
        }
        View existing = state.cachedPaneContainerRef.get();
        if (existing != null && existing.isAttachedToWindow()) {
            return;
        }
        detachPaneListener(state);

        View pane = searchRoot.findViewById(paneFragmentContainerId);
        if (pane == null) {
            return;
        }

        final WeakReference<Activity> actRef = new WeakReference<>(activity);
        state.panePrimarySync = new Runnable() {
            @Override
            public void run() {
                Activity act = actRef.get();
                if (act != null && !act.isFinishing() && !act.isDestroyed()) {
                    attachAndSyncAllAppBars(act, state);
                }
            }
        };
        state.paneSecondarySync = new Runnable() {
            @Override
            public void run() {
                Activity act = actRef.get();
                if (act != null && !act.isFinishing() && !act.isDestroyed()) {
                    attachAndSyncAllAppBars(act, state);
                }
            }
        };
        state.paneLayoutChangeListener = new View.OnLayoutChangeListener() {
            @Override
            public void onLayoutChange(
                    View v,
                    int left, int top, int right, int bottom,
                    int oldLeft, int oldTop, int oldRight, int oldBottom
            ) {
                if (state.panePrimarySync != null) {
                    v.removeCallbacks(state.panePrimarySync);
                    v.postDelayed(state.panePrimarySync, 100L);
                }
                if (state.paneSecondarySync != null) {
                    v.removeCallbacks(state.paneSecondarySync);
                    v.postDelayed(state.paneSecondarySync, 320L);
                }
            }
        };
        pane.addOnLayoutChangeListener(state.paneLayoutChangeListener);
        state.cachedPaneContainerRef = new WeakReference<>(pane);
    }

    private static boolean attachAndSyncAllAppBars(Activity activity, final ActivityState state) {
        Window window = activity.getWindow();
        if (window == null) {
            return false;
        }
        View content = window.findViewById(android.R.id.content);
        View decor = window.getDecorView();
        View searchRoot = content != null ? content : decor;
        if (searchRoot == null) {
            return false;
        }

        ensurePaneContainerHooked(activity, searchRoot, state);

        ArrayList<ViewGroup> appBars = new ArrayList<>(4);
        collectAppBarLayouts(searchRoot, appBars);
        if (appBars.isEmpty()) {
            return false;
        }

        // Prune any detached AppBarLayouts from previous screens/fragments.
        try {
            ArrayList<ViewGroup> known = new ArrayList<>(state.hookedAppBars.keySet());
            for (int i = 0; i < known.size(); i++) {
                ViewGroup prev = known.get(i);
                if (prev == null || !prev.isAttachedToWindow()) {
                    AppBarHook hook = state.hookedAppBars.remove(prev);
                    if (prev != null && hook != null) {
                        prev.removeOnLayoutChangeListener(hook.layoutListener);
                        prev.removeCallbacks(hook.primarySync);
                        prev.removeCallbacks(hook.secondarySync);
                    }
                }
            }
        } catch (Throwable ignored) {
        }

        final WeakReference<Activity> actRef = new WeakReference<>(activity);
        for (int i = 0; i < appBars.size(); i++) {
            final ViewGroup appBar = appBars.get(i);
            if (appBar == null || !appBar.isAttachedToWindow()) {
                continue;
            }
            if (!state.hookedAppBars.containsKey(appBar)) {
                final WeakReference<ViewGroup> barRef = new WeakReference<>(appBar);
                final Runnable primarySync = new Runnable() {
                    @Override
                    public void run() {
                        Activity act = actRef.get();
                        ViewGroup bar = barRef.get();
                        if (act == null || act.isFinishing() || act.isDestroyed()) {
                            return;
                        }
                        if (bar != null && bar.isAttachedToWindow() && bar.isShown() && bar.getTop() >= 0) {
                            updateAppBarScrollFlags(bar, state);
                        }
                        // Also discover any newly shown pane-local AppBarLayout.
                        attachAndSyncAllAppBars(act, state);
                    }
                };
                final Runnable secondarySync = new Runnable() {
                    @Override
                    public void run() {
                        Activity act = actRef.get();
                        ViewGroup bar = barRef.get();
                        if (act == null || act.isFinishing() || act.isDestroyed()) {
                            return;
                        }
                        if (bar != null && bar.isAttachedToWindow() && bar.isShown() && bar.getTop() >= 0) {
                            updateAppBarScrollFlags(bar, state);
                        }
                    }
                };
                View.OnLayoutChangeListener listener = new View.OnLayoutChangeListener() {
                    @Override
                    public void onLayoutChange(
                            View v,
                            int left, int top, int right, int bottom,
                            int oldLeft, int oldTop, int oldRight, int oldBottom
                    ) {
                        if (top < 0) {
                            return;
                        }
                        v.removeCallbacks(primarySync);
                        v.postDelayed(primarySync, APPBAR_UPDATE_DEBOUNCE_MS);
                        v.removeCallbacks(secondarySync);
                        v.postDelayed(secondarySync, 260L);
                    }
                };
                appBar.addOnLayoutChangeListener(listener);
                state.hookedAppBars.put(appBar, new AppBarHook(listener, primarySync, secondarySync));
            }

            if (appBar.isShown() && appBar.getTop() >= 0) {
                updateAppBarScrollFlags(appBar, state);
            }
        }
        return true;
    }

    private static void updateAppBarScrollFlags(ViewGroup appBar, ActivityState state) {
        if (appBar == null || !appBar.isAttachedToWindow() || appBar.getTop() < 0) {
            return;
        }
        // Apply across the entire app (Home, Subscriptions, Library, Channels, Playlists, etc.),
        // pausing only while the user is actively typing inside a focused search EditText.
        boolean shouldScrollAway = !containsFocusedEditText(appBar, 0);
        boolean modified = false;

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
                        modified = true;
                    }
                } else {
                    Integer orig = state.originalScrollFlags.get(child);
                    if (orig != null && current != orig) {
                        accessor.set(lp, orig);
                        child.setLayoutParams(lp);
                        modified = true;
                    }
                }
            } catch (Throwable ignored) {
            }
        }
        if (modified) {
            appBar.requestLayout();
        }
    }

    private static boolean containsFocusedEditText(View node, int depth) {
        if (node == null || depth > 6 || !node.isShown()) {
            return false;
        }
        if (node instanceof EditText && node.hasFocus()) {
            return true;
        }
        if (node instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) node;
            int count = vg.getChildCount();
            for (int i = 0; i < count; i++) {
                if (containsFocusedEditText(vg.getChildAt(i), depth + 1)) {
                    return true;
                }
            }
        }
        return false;
    }

    private static void collectAppBarLayouts(View root, ArrayList<ViewGroup> out) {
        if (root == null) {
            return;
        }
        for (int i = 0; i < appBarIds.length; i++) {
            View v = root.findViewById(appBarIds[i]);
            if (v instanceof ViewGroup && isAppBarLayoutClass(v)) {
                ViewGroup bar = (ViewGroup) v;
                if (!out.contains(bar)) {
                    out.add(bar);
                }
            }
        }
        collectAppBarLayoutsRecursive(root, 0, out);
    }

    private static void collectAppBarLayoutsRecursive(View node, int depth, ArrayList<ViewGroup> out) {
        if (node == null || depth > 12) {
            return;
        }
        if (node instanceof ViewGroup) {
            if (isAppBarLayoutClass(node)) {
                ViewGroup bar = (ViewGroup) node;
                if (!out.contains(bar)) {
                    out.add(bar);
                }
                return;
            }
            if (isScrollableFeedBody(node)) {
                return;
            }
            ViewGroup vg = (ViewGroup) node;
            int count = vg.getChildCount();
            for (int i = 0; i < count; i++) {
                collectAppBarLayoutsRecursive(vg.getChildAt(i), depth + 1, out);
            }
        }
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
            if (isScrollableFeedBody(node)) {
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
        try {
            Method getter = lpClass.getMethod("getScrollFlags");
            Method setter = lpClass.getMethod("setScrollFlags", int.class);
            if (getter.getReturnType() == int.class) {
                return new ScrollFlagsAccessor(getter, setter, null);
            }
        } catch (Throwable ignored) {
        }

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

    private static boolean isScrollableFeedBody(View v) {
        String name = v.getClass().getName();
        return name.contains("RecyclerView")
                || name.contains("ScrollView")
                || name.contains("ListView")
                || name.contains("GridView")
                || name.contains("WebView");
    }

    // -------------------------------------------------------------------------
    // Shared view helpers
    // -------------------------------------------------------------------------

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

    // -------------------------------------------------------------------------
    // Transparent status bar (YouTube) helpers — keeps status bar visible, strips gray scrims
    // -------------------------------------------------------------------------

    @SuppressWarnings("deprecation")
    private static void configureTransparentStatusBarWindow(Activity activity) {
        if (activity == null) {
            return;
        }
        Window window = activity.getWindow();
        if (window == null) {
            return;
        }
        try {
            window.clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
            window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
            window.setStatusBarColor(Color.TRANSPARENT);
            if (Build.VERSION.SDK_INT >= 29) {
                window.setStatusBarContrastEnforced(false);
            }
        } catch (Throwable ignored) {
        }
    }

    private static void applyTransparentStatusBar(Activity activity, View decor, ActivityState state) {
        if (!transparentStatusBarEnabled || activity == null || decor == null) {
            return;
        }
        configureTransparentStatusBarWindow(activity);

        try {
            View sysStatusBg = decor.findViewById(android.R.id.statusBarBackground);
            if (sysStatusBg != null) {
                silenceStatusBarScrimView(sysStatusBg);
            }
        } catch (Throwable ignored) {
        }

        try {
            for (int i = 0; i < statusBarSpacerIds.length; i++) {
                View v = decor.findViewById(statusBarSpacerIds[i]);
                if (v != null) {
                    silenceStatusBarScrimView(v);
                }
            }
        } catch (Throwable ignored) {
        }

        try {
            int screenW = decor.getWidth();
            if (screenW <= 0 && activity.getResources() != null) {
                screenW = activity.getResources().getDisplayMetrics().widthPixels;
            }
            int sbHeight = resolveLiveStatusBarHeightPx(activity, decor);
            if (screenW > 0 && sbHeight > 0) {
                clearStatusBarScrimsInTree(decor, screenW, sbHeight, 0, new int[2]);
            }
        } catch (Throwable ignored) {
        }
    }

    private static int resolveLiveStatusBarHeightPx(Activity activity, View decor) {
        if (decor != null && Build.VERSION.SDK_INT >= 30) {
            try {
                WindowInsets insets = decor.getRootWindowInsets();
                if (insets != null) {
                    int top = insets.getInsetsIgnoringVisibility(WindowInsets.Type.statusBars()).top;
                    if (top > 0) {
                        return top;
                    }
                }
            } catch (Throwable ignored) {
            }
        }
        int cached = cachedStatusBarHeightPx;
        if (cached > 0) {
            return cached;
        }
        return readStatusBarHeightPx(activity != null ? activity.getResources() : null);
    }

    private static void silenceStatusBarScrimView(View view) {
        if (view == null) {
            return;
        }
        try {
            if (view.getBackground() != null) {
                view.setBackgroundColor(Color.TRANSPARENT);
                view.setBackground(null);
            }
            if (view.getAlpha() != 0f) {
                view.setAlpha(0f);
            }
            if (view.getScaleY() != 0f) {
                view.setScaleY(0f);
            }
            if (view.getVisibility() != View.INVISIBLE) {
                view.setVisibility(View.INVISIBLE);
            }
        } catch (Throwable ignored) {
        }
    }

    private static void clearStatusBarScrimsInTree(
            View view,
            int screenWidth,
            int statusBarHeight,
            int depth,
            int[] loc
    ) {
        if (view == null || depth > 8) {
            return;
        }
        if (view instanceof ViewGroup) {
            // Clear CoordinatorLayout / CollapsingToolbarLayout status bar scrims if present.
            StatusBarScrimMethods methods = getCachedStatusBarScrimMethods(view.getClass());
            if (methods != null) {
                try {
                    if (methods.setStatusBarScrim != null) {
                        methods.setStatusBarScrim.invoke(view, new Object[]{null});
                    }
                    if (methods.setStatusBarScrimColor != null) {
                        methods.setStatusBarScrimColor.invoke(view, Color.TRANSPARENT);
                    }
                    if (methods.setStatusBarBackground != null) {
                        methods.setStatusBarBackground.invoke(view, new Object[]{null});
                    }
                    if (methods.setStatusBarBackgroundColor != null) {
                        methods.setStatusBarBackgroundColor.invoke(view, Color.TRANSPARENT);
                    }
                } catch (Throwable ignored) {
                }
            }

            ViewGroup vg = (ViewGroup) view;
            int count = vg.getChildCount();
            for (int i = 0; i < count; i++) {
                clearStatusBarScrimsInTree(vg.getChildAt(i), screenWidth, statusBarHeight, depth + 1, loc);
            }
            return;
        }

        // Leaf View check: silence unnamed full-width status-bar-height background scrims pinned at y == 0.
        if (view instanceof TextView || view instanceof ImageView) {
            return;
        }
        if (view.getVisibility() != View.VISIBLE || view.getAlpha() <= 0f || view.getBackground() == null) {
            return;
        }
        if (view.isClickable() || view.isFocusable()) {
            return;
        }
        int w = view.getWidth();
        int h = view.getHeight();
        if (w < (int) (screenWidth * 0.90f)) {
            return;
        }
        if (h < Math.max(8, statusBarHeight - 8) || h > statusBarHeight + 12) {
            return;
        }
        view.getLocationInWindow(loc);
        if (loc[1] >= -4 && loc[1] <= 4) {
            silenceStatusBarScrimView(view);
        }
    }

    private static StatusBarScrimMethods getCachedStatusBarScrimMethods(Class<?> cls) {
        synchronized (STATUS_BAR_SCRIM_CACHE) {
            StatusBarScrimMethods cached = STATUS_BAR_SCRIM_CACHE.get(cls);
            if (cached != null) {
                return cached == NO_SCRIM_METHODS ? null : cached;
            }
        }
        Method setScrim = null;
        Method setScrimColor = null;
        Method setBg = null;
        Method setBgColor = null;
        try {
            setScrim = findPublicMethod(cls, "setStatusBarScrim", Drawable.class);
            setScrimColor = findPublicMethod(cls, "setStatusBarScrimColor", int.class);
            setBg = findPublicMethod(cls, "setStatusBarBackground", Drawable.class);
            setBgColor = findPublicMethod(cls, "setStatusBarBackgroundColor", int.class);
        } catch (Throwable ignored) {
        }
        StatusBarScrimMethods resolved = (setScrim != null || setScrimColor != null || setBg != null || setBgColor != null)
                ? new StatusBarScrimMethods(setScrim, setScrimColor, setBg, setBgColor)
                : NO_SCRIM_METHODS;
        synchronized (STATUS_BAR_SCRIM_CACHE) {
            STATUS_BAR_SCRIM_CACHE.put(cls, resolved);
        }
        return resolved == NO_SCRIM_METHODS ? null : resolved;
    }

    private static Method findPublicMethod(Class<?> cls, String name, Class<?> paramType) {
        try {
            Method m = cls.getMethod(name, paramType);
            m.setAccessible(true);
            return m;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static final class StatusBarScrimMethods {
        final Method setStatusBarScrim;
        final Method setStatusBarScrimColor;
        final Method setStatusBarBackground;
        final Method setStatusBarBackgroundColor;

        StatusBarScrimMethods(
                Method setStatusBarScrim,
                Method setStatusBarScrimColor,
                Method setStatusBarBackground,
                Method setStatusBarBackgroundColor
        ) {
            this.setStatusBarScrim = setStatusBarScrim;
            this.setStatusBarScrimColor = setStatusBarScrimColor;
            this.setStatusBarBackground = setStatusBarBackground;
            this.setStatusBarBackgroundColor = setStatusBarBackgroundColor;
        }
    }

    private static int dpToPx(Resources res, int dp) {
        if (res == null) {
            return dp * 2;
        }
        return Math.round(dp * res.getDisplayMetrics().density);
    }
}
