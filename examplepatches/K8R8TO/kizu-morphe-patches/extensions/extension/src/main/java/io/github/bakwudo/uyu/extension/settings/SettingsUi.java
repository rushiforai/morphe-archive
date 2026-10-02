package io.github.bakwudo.uyu.extension.settings;

import android.app.AlertDialog;
import android.content.Context;
import android.graphics.Color;
import android.util.TypedValue;

import io.github.bakwudo.uyu.extension.Utils;

/**
 * Helpers shared by the uyu settings screen and its preferences.
 */
final class SettingsUi {
    private SettingsUi() {
    }

    static int dp(Context context, float dp) {
        return Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, dp,
                context.getResources().getDisplayMetrics()));
    }

    /**
     * Twitch's own page background, so the screen matches light and dark mode.
     */
    static int backgroundColor(Context context) {
        int color = Utils.getResourceId(context, "background_body", "color");
        if (color != 0) return context.getColor(color);

        TypedValue value = new TypedValue();
        if (context.getTheme().resolveAttribute(android.R.attr.colorBackground, value, true)
                && value.type >= TypedValue.TYPE_FIRST_COLOR_INT
                && value.type <= TypedValue.TYPE_LAST_COLOR_INT) {
            return value.data;
        }
        return 0xFF000000;
    }

    static boolean isDark(Context context) {
        int background = backgroundColor(context);
        double luminance = 0.299 * Color.red(background) + 0.587 * Color.green(background)
                + 0.114 * Color.blue(background);
        return luminance < 128;
    }

    /**
     * A platform dialog in the light or dark style of Twitch's current theme. Twitch's themes
     * are AppCompat themes, which do not style platform dialogs.
     */
    @SuppressWarnings("deprecation")
    static AlertDialog.Builder dialog(Context context) {
        return new AlertDialog.Builder(context, isDark(context)
                ? android.R.style.Theme_DeviceDefault_Dialog_Alert
                : android.R.style.Theme_DeviceDefault_Light_Dialog_Alert);
    }
}
