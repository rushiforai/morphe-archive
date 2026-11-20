package app.keyboardspeed.extension;

import android.content.Context;
import android.content.res.Configuration;
import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

/**
 * Sets the caption size by the screen the app is on: one size on the phone, another on a monitor,
 * such as with Samsung DeX or a USB-C dock. The captions of the app grow with the size of the player,
 * so on a monitor they are much larger than on a phone.
 * <p>
 * The sizes are percentages of the caption size of the app, like the caption size setting of Morphe, which this
 * replaces: the scale of the Morphe setting is divided out, so the sizes of the patch options are the sizes shown.
 * The screen is checked each time a caption is laid out, so the size follows the app between the phone and
 * the monitor without a restart.
 */
@SuppressWarnings("unused")
public final class MonitorCaptionSizePatch {
    private static final String TAG = "MonitorCaptionSize";

    /**
     * Screens at least this wide in both orientations are tablets and monitors, as in Android.
     */
    private static final int MONITOR_SMALLEST_WIDTH_DP = 600;

    private static Method getActivity;
    private static boolean lookedUpActivity;

    private static Field desktopModeEnabled;
    private static int desktopModeEnabledValue;
    private static boolean lookedUpDesktopMode;

    private static Object morpheCaptionScaleSetting;
    private static Method morpheClampToRange;
    private static boolean lookedUpMorpheScale;

    private static String lastLogged;

    private MonitorCaptionSizePatch() {
    }

    /**
     * Patch option 'Caption size on the phone', in percent. The body is replaced at patch time.
     */
    private static int getPhoneCaptionSize() {
        return 100;
    }

    /**
     * Patch option 'Caption size on a monitor', in percent. The body is replaced at patch time.
     */
    private static int getMonitorCaptionSize() {
        return 100;
    }

    /**
     * If the caption size setting of Morphe scales the same font size. The body is replaced at patch time.
     */
    private static boolean isMorpheCaptionScaleApplied() {
        return false;
    }

    /**
     * Injection point. Called with the font size of the captions.
     */
    public static float scaleFontSize(float size) {
        try {
            final boolean monitor = isOnMonitor();
            final int percent = monitor ? getMonitorCaptionSize() : getPhoneCaptionSize();
            final int morphePercent = isMorpheCaptionScaleApplied() ? getMorpheCaptionScale() : 100;

            String state = (monitor ? "monitor" : "phone") + " " + percent + "% (Morphe " + morphePercent + "%)";
            if (!state.equals(lastLogged)) {
                lastLogged = state;
                Log.i(TAG, "Captions on the " + state);
            }
            return size * percent / Math.max(morphePercent, 1);
        } catch (Exception ex) {
            Log.e(TAG, "scaleFontSize failure", ex);
            return size;
        }
    }

    /**
     * @return The caption size setting of Morphe in percent, as Morphe applies it, or 100 if not found.
     */
    private static int getMorpheCaptionScale() {
        if (!lookedUpMorpheScale) {
            lookedUpMorpheScale = true;
            try {
                ClassLoader loader = MonitorCaptionSizePatch.class.getClassLoader();
                Field field = Class.forName("app.morphe.extension.youtube.settings.Settings", true, loader)
                        .getField("CAPTION_SCALE");
                morpheCaptionScaleSetting = field.get(null);
                morpheClampToRange = Class.forName(
                        "app.morphe.extension.shared.settings.preference.SeekBarPreference", true, loader)
                        .getMethod("clampToRange", field.getType());
            } catch (Exception ex) {
                Log.w(TAG, "Morphe caption size setting not found", ex);
                morpheClampToRange = null;
            }
        }
        try {
            return morpheClampToRange == null ? 100 : (int) morpheClampToRange.invoke(null, morpheCaptionScaleSetting);
        } catch (Exception ex) {
            return 100;
        }
    }

    private static boolean isOnMonitor() throws IllegalAccessException {
        Context context = getContext();
        if (context == null) {
            return false;
        }
        Configuration configuration = context.getResources().getConfiguration();
        return configuration.smallestScreenWidthDp >= MONITOR_SMALLEST_WIDTH_DP || isSamsungDesktopMode(configuration);
    }

    /**
     * @return If the app is on the desktop of Samsung DeX.
     */
    private static boolean isSamsungDesktopMode(Configuration configuration) throws IllegalAccessException {
        if (!lookedUpDesktopMode) {
            lookedUpDesktopMode = true;
            try {
                desktopModeEnabled = Configuration.class.getField("semDesktopModeEnabled");
                desktopModeEnabledValue = Configuration.class.getField("SEM_DESKTOP_MODE_ENABLED").getInt(null);
            } catch (Exception ex) {
                desktopModeEnabled = null; // Not a Samsung device.
            }
        }
        return desktopModeEnabled != null && desktopModeEnabled.getInt(configuration) == desktopModeEnabledValue;
    }

    /**
     * @return The activity in front, whose configuration is of the screen it's on, or null.
     */
    private static Context getContext() {
        if (!lookedUpActivity) {
            lookedUpActivity = true;
            try {
                getActivity = Class.forName("app.morphe.extension.shared.Utils", true,
                        MonitorCaptionSizePatch.class.getClassLoader()).getMethod("getActivity");
            } catch (Exception ex) {
                Log.w(TAG, "Morphe utilities not found", ex);
            }
        }
        try {
            return getActivity == null ? null : (Context) getActivity.invoke(null);
        } catch (Exception ex) {
            return null;
        }
    }
}
