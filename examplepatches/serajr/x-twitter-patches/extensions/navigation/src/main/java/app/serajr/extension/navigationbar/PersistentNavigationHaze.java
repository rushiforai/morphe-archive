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
    private static volatile boolean disableNativeBlur;
    private static ContentObserver settingsObserver;

    private PersistentNavigationHaze() {
    }

    public static synchronized void initialize(Context context) {
        if (settingsObserver != null) return;
        try {
            Context app = context.getApplicationContext();
            if (app == null) return;
            final ContentResolver resolver = app.getContentResolver();
            ContentObserver observer = new ContentObserver(new Handler(Looper.getMainLooper())) {
                @Override
                public void onChange(boolean selfChange) {
                    refreshBlurSetting(resolver);
                }
            };
            resolver.registerContentObserver(Settings.Global.getUriFor(SETTINGS_KEY), false, observer);
            settingsObserver = observer;
            refreshBlurSetting(resolver);
            Log.i(TAG, "T4D observer registered");
        } catch (RuntimeException e) {
            Log.w(TAG, "T4D observer initialization failed", e);
        }
    }

    private static void refreshBlurSetting(ContentResolver resolver) {
        try {
            disableNativeBlur = Settings.Global.getInt(resolver, SETTINGS_KEY, 0) == 1;
            Log.i(TAG, "T4D disableNativeBlur=" + disableNativeBlur);
        } catch (RuntimeException e) {
            disableNativeBlur = false;
            Log.w(TAG, "T4D settings read failed; preserving native blur", e);
        }
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
