package dev.jason.gboardpatches.extension.clipboard;

import android.content.Context;
import android.content.SharedPreferences;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

final class GboardClipboardSettingsSupport {
    private GboardClipboardSettingsSupport() {
    }

    static String readSelectionValue(SharedPreferences preferences, String key,
            String defaultValue) {
        Object value = preferences.getAll().get(key);
        if (value instanceof String stringValue) {
            return stringValue;
        }
        if (value instanceof Number number) {
            return Long.toString(number.longValue());
        }
        return defaultValue;
    }

    static String formatCustomMinutesLabel(Context context, int minutes) {
        String minutesLabel = GboardSettingsText.quantity(
                context,
                R.plurals.gboard_patches_minutes,
                minutes,
                "%d minute",
                "%d minutes");
        String normalizedMinutesLabel =
                minutesLabel.replace(Integer.toString(minutes), "").trim();
        return GboardSettingsText.get(
                context,
                R.string.gboard_patches_custom_minutes_value,
                "Custom (%1$d %2$s)",
                minutes,
                normalizedMinutesLabel);
    }

    static String formatCustomCountLabel(Context context, int count) {
        return GboardSettingsText.get(
                context,
                R.string.gboard_patches_custom_count_value,
                "Custom (%1$d)",
                count);
    }
}
