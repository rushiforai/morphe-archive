package app.serajr.extension.navigationbar;

import android.content.Context;
import android.os.SystemClock;
import android.util.Log;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

public final class PersistentNavigationHaze {
    private static final String TAG = "SerajrNavHaze";
    private static final String LAYER_TAG = "NavHazeLayer";
    private static int lastBottomBarSize = Integer.MIN_VALUE;
    private static long lastLayerLogMs;

    private static final String ACTION = "serajr.x.HAZE_UPDATE";
    private static final String PREFS_NAME = "serajr_navigation_haze";
    private static final String SETTINGS_KEY = "serajr_x_fix_nav_bar_haze_disable_blur";
    private static final String RADIUS_KEY = "serajr_x_haze_radius";
    private static final String MAGENTA_KEY = "serajr_x_haze_debug_magenta";
    private static final String TINT_ALPHA_KEY = "serajr_x_haze_tint_alpha";
    private static final String NOISE_KEY = "serajr_x_haze_noise_factor";
    private static final String MASK_LENGTH_KEY = "serajr_x_haze_mask_length";
    private static final String RESET_KEY = "serajr_x_fix_nav_bar_haze_global_reset";
    private static final float DEFAULT_RADIUS = 32.0f;
    private static final float DEFAULT_TINT_ALPHA = 0.75f;
    private static final float DEFAULT_NOISE_FACTOR = 0.05f;
    // Positive infinity preserves the T4E-T3 native mask gradient endpoint.
    private static final float DEFAULT_MASK_LENGTH = Float.POSITIVE_INFINITY;
    private static final long MAGENTA_COLOR = -0xff0100000000L;

    private static volatile boolean disableNativeBlur;
    private static volatile float navigationBlurRadius = DEFAULT_RADIUS;
    private static volatile int debugMagentaMode;
    private static volatile float navigationTintAlpha = DEFAULT_TINT_ALPHA;
    private static volatile float navigationNoiseFactor = DEFAULT_NOISE_FACTOR;
    private static volatile float navigationMaskLength = DEFAULT_MASK_LENGTH;
    private static android.content.BroadcastReceiver receiver;
    private static android.content.SharedPreferences preferences;

    private PersistentNavigationHaze() { }

    public static synchronized void initialize(Context context) {
        if (receiver != null) return;
        try {
            Context app = context.getApplicationContext();
            if (app == null) return;
            preferences = app.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
            loadPreferences();
            android.content.BroadcastReceiver newReceiver = new android.content.BroadcastReceiver() {
                @Override
                public void onReceive(Context context, android.content.Intent intent) {
                    if (intent != null && ACTION.equals(intent.getAction())) {
                        applyUpdate(intent);
                    }
                }
            };
            android.content.IntentFilter filter = new android.content.IntentFilter(ACTION);
            // API 33+ requires an explicit exported flag for non-system broadcasts.
            // The receiver is intentionally limited to harmless visual settings.
            if (android.os.Build.VERSION.SDK_INT >= 33) {
                // Resolve the framework overload at runtime. Some patch/R8 builds
                // incorrectly rewrite the direct three-argument call into a
                // missing synthetic static method (La;->a(...)).
                Method register = Context.class.getMethod(
                        "registerReceiver",
                        android.content.BroadcastReceiver.class,
                        android.content.IntentFilter.class,
                        int.class);
                register.invoke(app, newReceiver, filter, 2 /* RECEIVER_EXPORTED */);
            } else {
                app.registerReceiver(newReceiver, filter);
            }
            receiver = newReceiver;
            Log.i(TAG, "T4E-T4 broadcast receiver registered; preferences loaded");
            logConfiguration("initial");
        } catch (Exception | LinkageError e) {
            Log.w(TAG, "T4E-T4 receiver initialization failed", e);
        }
    }

    private static float clamp(float value, float low, float high, float fallback) {
        return Float.isNaN(value) ? fallback : Math.max(low, Math.min(high, value));
    }

    private static float clampMask(float value) {
        return Float.isNaN(value) ? DEFAULT_MASK_LENGTH
                : (Float.isInfinite(value) ? DEFAULT_MASK_LENGTH : Math.max(0f, Math.min(512f, value)));
    }

    private static void loadPreferences() {
        android.content.SharedPreferences p = preferences;
        disableNativeBlur = p.getBoolean(SETTINGS_KEY, false);
        navigationBlurRadius = clamp(p.getFloat(RADIUS_KEY, DEFAULT_RADIUS), 0f, 64f, DEFAULT_RADIUS);
        debugMagentaMode = Math.max(0, Math.min(3, p.getInt(MAGENTA_KEY, 0)));
        navigationTintAlpha = clamp(p.getFloat(TINT_ALPHA_KEY, DEFAULT_TINT_ALPHA), 0f, 1f, DEFAULT_TINT_ALPHA);
        navigationNoiseFactor = clamp(p.getFloat(NOISE_KEY, DEFAULT_NOISE_FACTOR), 0f, 1f, DEFAULT_NOISE_FACTOR);
        navigationMaskLength = clampMask(p.getFloat(MASK_LENGTH_KEY, DEFAULT_MASK_LENGTH));
    }

    private static synchronized void applyUpdate(android.content.Intent intent) {
        android.content.SharedPreferences p = preferences;
        if (p == null) return;
        if (intent.getBooleanExtra(RESET_KEY, false)) {
            disableNativeBlur = false;
            navigationBlurRadius = DEFAULT_RADIUS;
            debugMagentaMode = 0;
            navigationTintAlpha = DEFAULT_TINT_ALPHA;
            navigationNoiseFactor = DEFAULT_NOISE_FACTOR;
            navigationMaskLength = DEFAULT_MASK_LENGTH;
            p.edit().clear().apply();
            logConfiguration("RESET");
            return;
        }
        android.content.SharedPreferences.Editor edit = p.edit();
        boolean changed = false;
        if (intent.hasExtra(SETTINGS_KEY)) {
            disableNativeBlur = intent.getBooleanExtra(SETTINGS_KEY, false);
            edit.putBoolean(SETTINGS_KEY, disableNativeBlur);
            changed = true;
        }
        if (intent.hasExtra(RADIUS_KEY)) {
            navigationBlurRadius = clamp(intent.getFloatExtra(RADIUS_KEY, DEFAULT_RADIUS), 0f, 64f, DEFAULT_RADIUS);
            edit.putFloat(RADIUS_KEY, navigationBlurRadius);
            changed = true;
        }
        if (intent.hasExtra(MAGENTA_KEY)) {
            debugMagentaMode = Math.max(0, Math.min(3, intent.getIntExtra(MAGENTA_KEY, 0)));
            edit.putInt(MAGENTA_KEY, debugMagentaMode);
            changed = true;
        }
        if (intent.hasExtra(TINT_ALPHA_KEY)) {
            navigationTintAlpha = clamp(intent.getFloatExtra(TINT_ALPHA_KEY, DEFAULT_TINT_ALPHA), 0f, 1f, DEFAULT_TINT_ALPHA);
            edit.putFloat(TINT_ALPHA_KEY, navigationTintAlpha);
            changed = true;
        }
        if (intent.hasExtra(NOISE_KEY)) {
            navigationNoiseFactor = clamp(intent.getFloatExtra(NOISE_KEY, DEFAULT_NOISE_FACTOR), 0f, 1f, DEFAULT_NOISE_FACTOR);
            edit.putFloat(NOISE_KEY, navigationNoiseFactor);
            changed = true;
        }
        if (intent.hasExtra(MASK_LENGTH_KEY)) {
            navigationMaskLength = clampMask(intent.getFloatExtra(MASK_LENGTH_KEY, DEFAULT_MASK_LENGTH));
            edit.putFloat(MASK_LENGTH_KEY, navigationMaskLength);
            changed = true;
        }
        if (changed) {
            edit.apply();
            logConfiguration("UPDATE");
        }
    }

    private static void logConfiguration(String event) {
        Log.i(TAG, "T4E-T4 " + event
                + " disableNativeBlur=" + disableNativeBlur
                + " radius=" + navigationBlurRadius
                + " magentaMode=" + debugMagentaMode
                + " tintAlpha=" + navigationTintAlpha
                + " noiseFactor=" + navigationNoiseFactor
                + " maskLength=" + navigationMaskLength);
    }

    public static float getNavigationMaskLength() {
        return navigationMaskLength;
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
