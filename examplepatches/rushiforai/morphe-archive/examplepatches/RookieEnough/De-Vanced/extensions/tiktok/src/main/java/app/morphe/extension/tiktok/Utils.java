/*
 * Forked from:
 * https://github.com/ReVanced/revanced-patches/blob/377d4e15016296b45d809697f7f69bce74badd3a/extensions/tiktok/src/main/java/app/revanced/extension/tiktok/Utils.java
 */

package app.morphe.extension.tiktok;

import static app.morphe.extension.shared.Utils.isDarkModeEnabled;

import android.graphics.Color;
import android.view.View;
import android.widget.TextView;

import androidx.annotation.ColorInt;

import app.morphe.extension.shared.settings.StringSetting;

public class Utils {

    private static final long[] DEFAULT_MIN_MAX_VALUES = {0L, Long.MAX_VALUE};

    public static long[] parseMinMax(StringSetting setting) {
        final String[] minMax = setting.get().split("-");
        if (minMax.length == 2) {
            try {
                final long min = Long.parseLong(minMax[0]);
                final long max = Long.parseLong(minMax[1]);

                if (min <= max && min >= 0) return new long[]{min, max};

            } catch (NumberFormatException ignored) {
            }
        }

        setting.save("0-" + Long.MAX_VALUE);
        return DEFAULT_MIN_MAX_VALUES;
    }

    private static final @ColorInt int TEXT_DARK_MODE_TITLE = Color.WHITE;
    private static final @ColorInt int TEXT_DARK_MODE_SUMMARY =
            Color.argb(255, 170, 170, 170);

    private static final @ColorInt int TEXT_LIGHT_MODE_TITLE = Color.BLACK;
    private static final @ColorInt int TEXT_LIGHT_MODE_SUMMARY =
            Color.argb(255, 80, 80, 80);

    public static void setTitleAndSummaryColor(View view) {
        final boolean darkModeEnabled = isDarkModeEnabled();

        TextView title = view.findViewById(android.R.id.title);
        title.setTextColor(darkModeEnabled
                ? TEXT_DARK_MODE_TITLE
                : TEXT_LIGHT_MODE_TITLE);

        TextView summary = view.findViewById(android.R.id.summary);
        summary.setTextColor(darkModeEnabled
                ? TEXT_DARK_MODE_SUMMARY
                : TEXT_LIGHT_MODE_SUMMARY);
    }
}

