package app.serajr.extension.navigationbar;

import android.content.ContentResolver;
import android.content.Context;
import android.database.ContentObserver;
import android.os.Handler;
import android.os.Looper;
import android.provider.Settings;
import android.os.SystemClock;
import android.util.Log;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

public final class PersistentNavigationHaze {
    private static final String TAG = "SerajrNavHaze";
    private static final String LAYER_TAG = "NavHazeLayer";
    private static int lastBottomBarSize = Integer.MIN_VALUE;
    private static long lastLayerLogMs;

    private static final String SETTINGS_KEY = "serajr_x_fix_nav_bar_haze_disable_blur";
    private static final String RADIUS_KEY = "serajr_x_haze_radius";
    private static final String MAGENTA_KEY = "serajr_x_haze_debug_magenta";
    private static final String TINT_ALPHA_KEY = "serajr_x_haze_tint_alpha";

    // Native injected Haze noise amount. Range: 0.0 to 1.0; default: 0.05.
    // Read on initialization/settings change, never from the composition path.
    private static final String NOISE_KEY = "serajr_x_haze_noise_factor";
    private static final float DEFAULT_NOISE_FACTOR = 0.05f;
    private static final float MIN_NOISE_FACTOR = 0.0f;
    private static final float MAX_NOISE_FACTOR = 1.0f;
    private static final float DEFAULT_TINT_ALPHA = 0.75f;
    private static final float MIN_TINT_ALPHA = 0.0f;
    private static final float MAX_TINT_ALPHA = 1.0f;
    private static final float DEFAULT_RADIUS = 32.0f;
    private static final float MIN_RADIUS = 0.0f;
    private static final float MAX_RADIUS = 64.0f;
    private static final long MAGENTA_COLOR = -0xff0100000000L;

    private static volatile boolean disableNativeBlur;
    private static volatile float navigationBlurRadius = DEFAULT_RADIUS;
    private static volatile int debugMagentaMode;
    private static volatile float navigationTintAlpha = DEFAULT_TINT_ALPHA;
    private static volatile float navigationNoiseFactor = DEFAULT_NOISE_FACTOR;
    private static ContentObserver settingsObserver;

    private PersistentNavigationHaze() { }

    public static synchronized void initialize(Context context) {
        if (settingsObserver != null) return;
        try {
            Context app = context.getApplicationContext();
            if (app == null) return;
            final ContentResolver resolver = app.getContentResolver();
            ContentObserver observer = new ContentObserver(new Handler(Looper.getMainLooper())) {
                @Override
                public void onChange(boolean selfChange) {
                    refreshSettings(resolver);
                }
            };
            resolver.registerContentObserver(Settings.Global.getUriFor(SETTINGS_KEY), false, observer);
            resolver.registerContentObserver(Settings.Global.getUriFor(RADIUS_KEY), false, observer);
            resolver.registerContentObserver(Settings.Global.getUriFor(MAGENTA_KEY), false, observer);
            resolver.registerContentObserver(Settings.Global.getUriFor(TINT_ALPHA_KEY), false, observer);
            resolver.registerContentObserver(Settings.Global.getUriFor(NOISE_KEY), false, observer);
            settingsObserver = observer;
            refreshSettings(resolver);
            Log.i(TAG, "T4E-T3 observer registered (blur, radius, magenta, tint alpha, noise)");
        } catch (RuntimeException e) {
            Log.w(TAG, "T4E-T3 observer initialization failed", e);
        }
    }

    private static void refreshSettings(ContentResolver resolver) {
        try {
            disableNativeBlur = Settings.Global.getInt(resolver, SETTINGS_KEY, 0) == 1;
        } catch (RuntimeException e) {
            disableNativeBlur = false;
            Log.w(TAG, "T4E-T3 blur setting read failed; using native blur", e);
        }
        try {
            float value = Settings.Global.getFloat(resolver, RADIUS_KEY, DEFAULT_RADIUS);
            navigationBlurRadius = Float.isNaN(value) ? DEFAULT_RADIUS
                    : Math.max(MIN_RADIUS, Math.min(MAX_RADIUS, value));
        } catch (RuntimeException e) {
            navigationBlurRadius = DEFAULT_RADIUS;
            Log.w(TAG, "T4E-T3 radius setting read failed; using default", e);
        }
        try {
            int mode = Settings.Global.getInt(resolver, MAGENTA_KEY, 0);
            debugMagentaMode = Math.max(0, Math.min(3, mode));
        } catch (RuntimeException e) {
            debugMagentaMode = 0;
            Log.w(TAG, "T4E-T3 magenta setting read failed; using default", e);
        }
        try {
            float value = Settings.Global.getFloat(resolver, TINT_ALPHA_KEY, DEFAULT_TINT_ALPHA);
            navigationTintAlpha = Float.isNaN(value) ? DEFAULT_TINT_ALPHA
                    : Math.max(MIN_TINT_ALPHA, Math.min(MAX_TINT_ALPHA, value));
        } catch (RuntimeException e) {
            navigationTintAlpha = DEFAULT_TINT_ALPHA;
            Log.w(TAG, "T4E-T3 tint alpha setting read failed; using default", e);
        }
        try {
            float value = Settings.Global.getFloat(resolver, NOISE_KEY, DEFAULT_NOISE_FACTOR);
            navigationNoiseFactor = Float.isNaN(value) ? DEFAULT_NOISE_FACTOR
                    : Math.max(MIN_NOISE_FACTOR, Math.min(MAX_NOISE_FACTOR, value));
        } catch (RuntimeException e) {
            navigationNoiseFactor = DEFAULT_NOISE_FACTOR;
            Log.w(TAG, "T4E-T3 noise setting read failed; using default", e);
        }
        Log.i(TAG, "T4E-T3 disableNativeBlur=" + disableNativeBlur
                + " radius=" + navigationBlurRadius
                + " magentaMode=" + debugMagentaMode
                + " tintAlpha=" + navigationTintAlpha
                + " noiseFactor=" + navigationNoiseFactor);
    }

    public static float getNavigationNoiseFactor() {
        return navigationNoiseFactor;
    }

    public static float getNavigationTintAlpha() {
        return navigationTintAlpha;
    }

    public static float getNavigationBlurRadius() {
        return navigationBlurRadius;
    }

    public static long resolveTintColor(long original) {
        return (debugMagentaMode & 1) != 0 ? MAGENTA_COLOR : original;
    }

    public static long resolveBackgroundColor(long original) {
        return (debugMagentaMode & 2) != 0 ? MAGENTA_COLOR : original;
    }

    public static boolean resolveBlurEnabled(boolean original) {
        return original && !disableNativeBlur;
    }

    public static void initialize() {
        Log.i(TAG, "PersistentNavigationHaze extension loaded successfully!");
    }

    public static void onVisibilityChanged(boolean visible) {
        Log.i(TAG, "bottomTabsVisible=" + visible);
    }

    public static void onBottomBarVisibilityChanged(boolean visible) {
        Log.i(TAG, "Bottom bar visibility changed: " + visible);
    }

    public static void onBottomBarContentComposed() {
        Log.i(TAG, "Bottom bar content composed (e2.invoke)");
    }

    public static void onBottomBarSizeChanged(int size) {
        if (lastBottomBarSize != size) {
            lastBottomBarSize = size;
            Log.i(TAG, "Bottom bar animated size: " + size);
        }
    }

    // Retained from the existing extension. Diagnostic only.
    private static final int EXPERIMENTAL_MIN_SIZE_PX = 103;

    public static int getExperimentalBottomBarSize(int originalSize) {
        return Math.max(originalSize, EXPERIMENTAL_MIN_SIZE_PX);
    }

    /**
     * Read-only, throttled diagnostics. Accepts Object so the extension does not
     * require a compile-time dependency on the obfuscated Haze/Compose classes.
     */
    public static void inspectHazeRenderer(Object renderer) {
        long now = SystemClock.uptimeMillis();
        if (now - lastLayerLogMs < 250L) return;
        lastLayerLogMs = now;
        if (renderer == null) return;
        try {
            String rendererType = renderer.getClass().getName();
            if (!"dev.chrisbanes.haze.blur.u".equals(rendererType)) return;
            Object layer = readField(renderer, "b");
            if (layer == null) {
                Log.d(LAYER_TAG, "renderer=" + System.identityHashCode(renderer)
                        + " layerPresent=false");
                return;
            }
            Object backend = readField(layer, "a");
            Object alpha = backend == null ? null : invokeNoArg(backend, "a");
            Object effect = backend == null ? null : invokeNoArg(backend, "b");
            Log.d(LAYER_TAG, "renderer=" + System.identityHashCode(renderer)
                    + " layer=" + System.identityHashCode(layer)
                    + " layerPresent=true"
                    + " released=" + readField(layer, "s")
                    + " sizePacked=" + readField(layer, "u")
                    + " clip=" + readField(layer, "A")
                    + " alpha=" + alpha
                    + " effectPresent=" + (effect != null));
        } catch (Throwable t) {
            // Diagnostics must never crash the app.
            Log.w(LAYER_TAG, "Inspection skipped: " + t.getClass().getSimpleName());
        }
    }

    private static Object readField(Object target, String name) throws Exception {
        Field field = target.getClass().getDeclaredField(name);
        field.setAccessible(true);
        return field.get(target);
    }

    private static Object invokeNoArg(Object target, String name) throws Exception {
        Method method = target.getClass().getMethod(name);
        return method.invoke(target);
    }
}
