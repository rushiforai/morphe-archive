package app.sledgesune.extension.cp;

import android.app.Activity;
import android.content.ComponentCallbacks;
import android.content.res.Configuration;
import android.graphics.ColorMatrix;
import android.graphics.ColorMatrixColorFilter;
import android.graphics.Paint;
import android.graphics.drawable.ColorDrawable;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.View;

import org.json.JSONObject;

import java.lang.ref.WeakReference;

/**
 * Dark mode for the CP app.
 * <p>
 * The app is written in Flutter and has no dark theme; its colours are compiled Dart code. The patch makes Flutter
 * draw into a TextureView and this class puts a colour filter on the window: colours are inverted and then
 * rotated by 180 degrees in hue, so white becomes dark grey but green stays green. Status bar and navigation bar
 * colours and icon brightness, which Flutter sets on the window itself, are adjusted to match.
 */
@SuppressWarnings("unused")
public final class DarkModePatch {

    private static final String TAG = "CpDarkMode";

    // Output is squeezed into [DARK_FLOOR, LIGHT_CEIL] (0-255), a Material-style dark range: the former white
    // background becomes grey (not black), former black text becomes soft white (not glaring), and the app's
    // dim-the-screen overlays - which invert to bright - can't go past the ceiling. SATURATION puts back the
    // colour that inversion washes out, so the green reads clean instead of greyed.
    private static final int DARK_FLOOR = 40;
    private static final int LIGHT_CEIL = 175;
    private static final float SATURATION = 1.5f;

    /** Window background set under the app while dark, so loads and gaps never flash white. */
    private static final int WINDOW_BACKGROUND = 0xFF000000 | (DARK_FLOOR << 16) | (DARK_FLOOR << 8) | DARK_FLOOR;

    private static final float[] MATRIX = buildMatrix();

    private static WeakReference<Activity> currentActivity = new WeakReference<>(null);

    /** The patch writes the chosen mode here: 0 = auto (follow phone), 1 = always dark, 2 = off (light). */
    public static int mode() {
        return 0;
    }

    /** Injection point: start of the Flutter activity's onCreate. */
    public static void onActivityCreate(final Activity activity) {
        try {
            currentActivity = new WeakReference<>(activity);
            // Dark the window background now, before the first frame, so cold-start loading doesn't flash white.
            if (isDark(activity) && activity.getWindow() != null) {
                activity.getWindow().setBackgroundDrawable(new ColorDrawable(WINDOW_BACKGROUND));
            }
            // After onCreate, when the window has its views.
            new Handler(Looper.getMainLooper()).post(() -> apply(activity));
            activity.registerComponentCallbacks(new ComponentCallbacks() {
                @Override
                public void onConfigurationChanged(Configuration newConfig) {
                    apply(activity); // The phone's dark theme was switched; the activity isn't restarted.
                }

                @Override
                public void onLowMemory() {
                }
            });
        } catch (Throwable t) {
            Log.e(TAG, "Could not set up dark mode", t);
        }
    }

    private static boolean isDark(Activity activity) {
        switch (mode()) {
            case 1: return true;   // Always dark.
            case 2: return false;  // Off (always light).
            default:               // Auto: follow the phone.
                int night = activity.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK;
                return night == Configuration.UI_MODE_NIGHT_YES;
        }
    }

    private static void apply(Activity activity) {
        try {
            if (activity.isFinishing() || activity.getWindow() == null) return;
            View decor = activity.getWindow().getDecorView();
            if (isDark(activity)) {
                activity.getWindow().setBackgroundDrawable(new ColorDrawable(WINDOW_BACKGROUND));
                Paint paint = new Paint();
                paint.setColorFilter(new ColorMatrixColorFilter(MATRIX));
                decor.setLayerType(View.LAYER_TYPE_HARDWARE, paint);
            } else {
                decor.setLayerType(View.LAYER_TYPE_NONE, null);
            }
        } catch (Throwable t) {
            Log.e(TAG, "Could not apply dark mode", t);
        }
    }

    /**
     * Injection point: start of Flutter's decoder for SystemChrome.setSystemUIOverlayStyle.
     * Bar colours are drawn by the system, outside the filtered view, so convert them the same way, and swap
     * light and dark icons.
     */
    public static void adjustSystemBars(JSONObject style) {
        try {
            Activity activity = currentActivity.get();
            if (style == null || activity == null || !isDark(activity)) return;
            for (String key : new String[]{"statusBarColor", "systemNavigationBarColor", "systemNavigationBarDividerColor"}) {
                if (style.has(key) && !style.isNull(key)) style.put(key, convert(style.getInt(key)));
            }
            for (String key : new String[]{"statusBarIconBrightness", "systemNavigationBarIconBrightness"}) {
                if (!style.has(key) || style.isNull(key)) continue;
                String value = style.getString(key);
                if ("Brightness.dark".equals(value)) style.put(key, "Brightness.light");
                else if ("Brightness.light".equals(value)) style.put(key, "Brightness.dark");
            }
        } catch (Throwable t) {
            Log.e(TAG, "Could not adjust the system bars", t);
        }
    }

    /** Applies {@link #MATRIX} to one ARGB colour. */
    private static int convert(int color) {
        float a = (color >>> 24) & 0xFF, r = (color >> 16) & 0xFF, g = (color >> 8) & 0xFF, b = color & 0xFF;
        float[] m = MATRIX;
        int nr = clamp(m[0] * r + m[1] * g + m[2] * b + m[3] * a + m[4]);
        int ng = clamp(m[5] * r + m[6] * g + m[7] * b + m[8] * a + m[9]);
        int nb = clamp(m[10] * r + m[11] * g + m[12] * b + m[13] * a + m[14]);
        return ((int) a << 24) | (nr << 16) | (ng << 8) | nb;
    }

    private static int clamp(float value) {
        return Math.max(0, Math.min(255, Math.round(value)));
    }

    private static float[] buildMatrix() {
        // 1. Invert.
        ColorMatrix result = new ColorMatrix(new float[]{
                -1, 0, 0, 0, 255,
                0, -1, 0, 0, 255,
                0, 0, -1, 0, 255,
                0, 0, 0, 1, 0,
        });
        // 2. Rotate hue by 180 degrees around the luminance axis (cos = -1, sin = 0), which undoes the hue flip
        //    of step 1 while keeping the inverted lightness.
        float lr = 0.213f, lg = 0.715f, lb = 0.072f;
        result.postConcat(new ColorMatrix(new float[]{
                2 * lr - 1, 2 * lg, 2 * lb, 0, 0,
                2 * lr, 2 * lg - 1, 2 * lb, 0, 0,
                2 * lr, 2 * lg, 2 * lb - 1, 0, 0,
                0, 0, 0, 1, 0,
        }));
        // 3. Put back the colour that inversion washed out, so greens/blues read clean.
        ColorMatrix saturation = new ColorMatrix();
        saturation.setSaturation(SATURATION);
        result.postConcat(saturation);
        // 4. Squeeze the full range into [DARK_FLOOR, LIGHT_CEIL]: background greys up off pure black, white text
        //    softens, and inverted dim-overlays are capped so they can't glare.
        float scale = (LIGHT_CEIL - DARK_FLOOR) / 255f;
        result.postConcat(new ColorMatrix(new float[]{
                scale, 0, 0, 0, DARK_FLOOR,
                0, scale, 0, 0, DARK_FLOOR,
                0, 0, scale, 0, DARK_FLOOR,
                0, 0, 0, 1, 0,
        }));
        return result.getArray();
    }
}
