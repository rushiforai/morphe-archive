package app.morphe.extension.tiktok.settings.preference;

import android.app.AlertDialog;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.os.Build;
import android.os.Bundle;
import android.preference.EditTextPreference;
import android.text.InputFilter;
import android.text.InputType;
import android.view.View;
import android.widget.TextView;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.StringSetting;
import app.morphe.extension.tiktok.theme.ThemeEngine;

/**
 * BlueIT theme color editor backed by a StringSetting.
 *
 * This intentionally does not extend the shared ColorPickerPreference. TikTok patch bundles do not
 * contain the shared Morphe color-picker XML resources, and loading that class would therefore throw
 * Resources.NotFoundException before the Interface section can even open. A plain programmatic hex
 * editor keeps the Theme Engine self-contained and safe on every supported TikTok APK.
 */
@SuppressWarnings("deprecation")
public final class ThemeColorPreference extends EditTextPreference {
    private final StringSetting setting;
    private final boolean allowOpacity;

    public ThemeColorPreference(
            Context context,
            String title,
            String summary,
            StringSetting setting,
            boolean allowOpacity
    ) {
        super(context);
        this.setting = setting;
        this.allowOpacity = allowOpacity;

        setTitle(title);
        setSummary(summary + " Enter " + (allowOpacity ? "#AARRGGBB" : "#RRGGBB") + ".");
        setKey(setting.key);

        getEditText().setSingleLine(true);
        getEditText().setInputType(
                InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_CAP_CHARACTERS
        );
        getEditText().setFilters(new InputFilter[]{
                new InputFilter.LengthFilter(allowOpacity ? 9 : 7)
        });
        styleEditor();
        super.setText(setting.get());

        setOnPreferenceChangeListener((preference, value) -> {
            String normalized = normalize(String.valueOf(value));
            if (normalized == null) {
                Utils.showToastShort(
                        "Invalid color. Use " + (allowOpacity ? "#AARRGGBB" : "#RRGGBB")
                );
                return false;
            }

            setting.save(normalized);
            super.setText(normalized);
            ThemeEngine.requestReapply();
            return false;
        });
    }

    @Override
    protected void onBindView(View view) {
        super.onBindView(view);

        TextView title = view.findViewById(android.R.id.title);
        if (title != null) {
            title.setTextColor(ThemeEngine.textColor(getContext()));
        }

        TextView summary = view.findViewById(android.R.id.summary);
        if (summary != null) {
            summary.setTextColor(ThemeEngine.secondaryTextColor(getContext()));
        }
    }

    @Override
    protected void showDialog(Bundle state) {
        styleEditor();
        super.showDialog(state);

        if (getDialog() instanceof AlertDialog) {
            SettingsUi.styleStandardAlertDialog((AlertDialog) getDialog());
        }

        // SettingsUi follows TikTok's own night-mode hook, which can briefly report the system
        // theme instead of the selected BlueIT theme. Reassert the effective Theme Engine colors.
        styleEditor();
    }

    private void styleEditor() {
        getEditText().setTextColor(ThemeEngine.textColor(getContext()));
        getEditText().setHintTextColor(ThemeEngine.secondaryTextColor(getContext()));
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            getEditText().setBackgroundTintList(
                    ColorStateList.valueOf(ThemeEngine.accentColor(getContext()))
            );
        }
    }

    private String normalize(String input) {
        if (input == null) return null;
        String value = input.trim().toUpperCase();
        if (!value.startsWith("#")) value = "#" + value;

        int expectedLength = allowOpacity ? 9 : 7;
        if (value.length() != expectedLength) return null;

        try {
            Color.parseColor(value);
            return value;
        } catch (IllegalArgumentException ignored) {
            return null;
        }
    }
}
