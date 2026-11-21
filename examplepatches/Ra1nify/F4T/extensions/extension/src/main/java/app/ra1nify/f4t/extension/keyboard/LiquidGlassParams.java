package app.ra1nify.f4t.extension.keyboard;

import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.util.Log;

import java.lang.reflect.Method;

/**
 * Applies the liquid glass material parameters to the stock blur parameter object.
 *
 * The injected call runs right before the stock blur parameter factory returns, reads the F4T page
 * values and rewrites the material color/alpha through the official {@code setMaterialParams} API.
 * The realOS defaults are used when a value was never changed.
 */
public final class LiquidGlassParams {
    private static final String TAG = "F4T";
    private static final String PREFS = "f4t_keyboard";

    private static final String KEY_LIGHT_ALPHA = "f4t_lg_light_alpha";
    private static final String KEY_DARK_ALPHA = "f4t_lg_dark_alpha";

    private static final int DEFAULT_LIGHT_ALPHA = 80;
    private static final int DEFAULT_DARK_ALPHA = 60;
    private static final int LIGHT_TINT = 0xFFE1E1E1;
    private static final int DARK_TINT = 0xFF0D0D0D;

    private LiquidGlassParams() {
    }

    /** Called from the patched blur parameter factory before it returns. */
    public static void apply(Object param) {
        try {
            if (param == null) return;
            Context context = applicationContext();
            if (context == null) return;
            if (!FeatureSwitches.isLiquidGlassEnabled(context)) return;

            SharedPreferences preferences =
                    context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
            boolean night = isNightMode(context);
            int alphaPercent = preferences.getInt(
                    night ? KEY_DARK_ALPHA : KEY_LIGHT_ALPHA,
                    night ? DEFAULT_DARK_ALPHA : DEFAULT_LIGHT_ALPHA);
            alphaPercent = Math.max(0, Math.min(100, alphaPercent));

            int tint = night ? DARK_TINT : LIGHT_TINT;
            float[] white = {1.0f, 1.0f, 1.0f, 1.0f};
            float[] rgba = {
                    Color.red(tint) / 255.0f,
                    Color.green(tint) / 255.0f,
                    Color.blue(tint) / 255.0f,
                    alphaPercent / 100.0f,
            };

            Method setMaterialParams = param.getClass().getMethod(
                    "setMaterialParams",
                    int.class,
                    float[].class,
                    float[].class);
            setMaterialParams.invoke(param, 1, white, rgba);
        } catch (Throwable error) {
            Log.e(TAG, "could not apply liquid glass params", error);
        }
    }

    private static boolean isNightMode(Context context) {
        int mode = context.getResources().getConfiguration().uiMode
                & android.content.res.Configuration.UI_MODE_NIGHT_MASK;
        return mode == android.content.res.Configuration.UI_MODE_NIGHT_YES;
    }

    private static Context applicationContext() {
        try {
            Class<?> activityThread = Class.forName("android.app.ActivityThread");
            Object application = activityThread.getMethod("currentApplication").invoke(null);
            if (application instanceof Context) {
                return ((Context) application).getApplicationContext();
            }
        } catch (Throwable ignored) {
            // The keyboard process always has an application before drawing; fail closed otherwise.
        }
        return null;
    }
}
