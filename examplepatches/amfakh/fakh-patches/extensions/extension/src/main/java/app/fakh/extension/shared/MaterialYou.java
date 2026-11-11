package app.fakh.extension.shared;

import android.content.Context;
import android.content.res.Configuration;
import android.os.Build;

/** The Material You colors that more than one app reads: the wallpaper accent and the surfaces of a sheet. */
public final class MaterialYou {
    private MaterialYou() {
    }

    /**
     * Whether the context is in the dark theme.
     *
     * @param context any context
     * @return true in night mode
     */
    public static boolean night(Context context) {
        return (context.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                == Configuration.UI_MODE_NIGHT_YES;
    }

    /**
     * Whether colors come from the wallpaper: Material You is on and the phone runs Android 12 or newer.
     *
     * @param dynamic whether the user turned Material You on
     * @return true when the wallpaper's colors apply
     */
    public static boolean wallpaper(boolean dynamic) {
        return dynamic && Build.VERSION.SDK_INT >= Build.VERSION_CODES.S;
    }

    /**
     * The accent of the selected tab, a link or a check: the wallpaper's on Android 12 and up, else the app's own
     * color for the current theme.
     *
     * @param context any context
     * @param dynamic whether the user turned Material You on
     * @param light   the app's accent on a light theme
     * @param dark    the app's accent on a dark theme
     * @return an ARGB color
     */
    public static int accent(Context context, boolean dynamic, int light, int dark) {
        boolean night = night(context);
        if (wallpaper(dynamic)) {
            return context.getColor(night ? android.R.color.system_accent1_200 : android.R.color.system_accent1_600);
        }
        return night ? dark : light;
    }

    /**
     * The surface of a bottom sheet in the Material 3 look.
     *
     * @param context any context
     * @return an ARGB color, tinted by the wallpaper on Android 12 and up
     */
    public static int sheetSurface(Context context) {
        boolean night = night(context);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            return context.getColor(night ? android.R.color.system_neutral1_900 : android.R.color.system_neutral2_50);
        }
        return night ? 0xFF2B2930 : 0xFFF7F2FA;
    }

    /**
     * The text color on {@link #sheetSurface}.
     *
     * @param context any context
     * @return an ARGB color
     */
    public static int sheetText(Context context) {
        return night(context) ? 0xFFE6E0E9 : 0xFF1D1B20;
    }
}
