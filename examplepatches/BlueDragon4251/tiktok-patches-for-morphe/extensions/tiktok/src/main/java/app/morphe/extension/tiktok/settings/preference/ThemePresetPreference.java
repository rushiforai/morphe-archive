package app.morphe.extension.tiktok.settings.preference;

import android.app.AlertDialog;
import android.content.Context;
import android.os.Bundle;
import android.preference.ListPreference;
import android.view.View;
import android.widget.TextView;

import app.morphe.extension.tiktok.theme.ThemeEngine;
import app.morphe.extension.tiktok.theme.ThemeSettings;
import app.morphe.extension.tiktok.theme.ThemeStateStore;

@SuppressWarnings("deprecation")
public final class ThemePresetPreference extends ListPreference {
    public ThemePresetPreference(Context context) {
        super(context);
        setTitle("Theme preset");
        setEntries(new CharSequence[]{
                "TikTok default",
                "Material You",
                "Material You AMOLED",
                "OLED black",
                "Liquid Glass",
                "Frosted Graphite",
                "Midnight Neon",
                "Rose Noir",
                "Arctic Blue",
                "Aurora Violet",
                "Sunset Ember",
                "Custom"
        });
        setEntryValues(new CharSequence[]{
                "default",
                "material_you",
                "material_you_amoled",
                "oled_black",
                "liquid_glass",
                "frosted_graphite",
                "midnight_neon",
                "rose_noir",
                "arctic_blue",
                "aurora_violet",
                "sunset_ember",
                "custom"
        });

        setKey(ThemeSettings.PRESET.key);

        // Do not let android.preference.ListPreference persist this key into a second preference
        // file. ThemeStateStore is the single source of truth and remembers even an explicit
        // "TikTok default" choice so a patch-time seed cannot come back after a restart.
        setPersistent(false);
        String preset = ThemeStateStore.currentPreset(context);
        setValue(preset);
        updateSummary(preset);

        // The BlueIT preference screens live in fragments inside one Activity. Install a back-stack
        // refresh so returning from Interface cannot reveal rows that were bound using an old theme.
        ThemeUiRefresh.install(context);

        setOnPreferenceChangeListener((preference, newValue) -> {
            String value = String.valueOf(newValue);
            ThemeStateStore.saveUserPreset(getContext(), value);
            ThemeSettings.PRESET.save(value);
            setValue(value);
            updateSummary(value);
            ThemeEngine.requestReapply();
            notifyChanged();
            ThemeUiRefresh.install(getContext());

            // We already updated the non-persistent ListPreference above. Returning false prevents
            // the framework from trying to persist the same key through PreferenceManager.
            return false;
        });
    }

    @Override
    protected void onBindView(View view) {
        super.onBindView(view);

        view.setBackground(SettingsUi.roundedSurface(
                getContext(),
                ThemeStateStore.isLiquidGlass(getContext()) ? 19 : 14,
                false
        ));

        TextView title = view.findViewById(android.R.id.title);
        if (title != null) {
            title.setTextColor(SettingsUi.textPrimary());
        }

        TextView summary = view.findViewById(android.R.id.summary);
        if (summary != null) {
            summary.setTextColor(SettingsUi.textSecondary());
        }
    }

    @Override
    protected void showDialog(Bundle state) {
        super.showDialog(state);
        if (getDialog() instanceof AlertDialog) {
            SettingsUi.styleStandardAlertDialog((AlertDialog) getDialog());
        }
    }

    private void updateSummary(String value) {
        int index = findIndexOfValue(value);
        String selected = index >= 0
                ? String.valueOf(getEntries()[index])
                : "TikTok default";

        String extra;
        switch (value) {
            case "material_you":
                extra = "Android 12+ wallpaper/system colors with safe fallbacks.";
                break;
            case "material_you_amoled":
                extra = "Material You accents on a true-black OLED base.";
                break;
            case "oled_black":
                extra = "Maximum-black surfaces with the classic TikTok accent.";
                break;
            case "liquid_glass":
                extra = "Translucent rounded glass surfaces across navigation, Inbox rows, drawers, settings and sheets.";
                break;
            case "frosted_graphite":
                extra = "Smoky graphite cards with soft silver accents and restrained translucency.";
                break;
            case "midnight_neon":
                extra = "Deep midnight surfaces with bright cyan neon accents.";
                break;
            case "rose_noir":
                extra = "Near-black wine surfaces with vivid rose accents.";
                break;
            case "arctic_blue":
                extra = "Cold navy surfaces with crisp ice-blue accents.";
                break;
            case "aurora_violet":
                extra = "Dark violet glass with a soft aurora-purple accent.";
                break;
            case "sunset_ember":
                extra = "Warm charcoal-brown surfaces with ember-orange accents.";
                break;
            case "custom":
                extra = "Uses the custom background, surface, accent and text colors below.";
                break;
            default:
                extra = "Leaves TikTok's own colors and surfaces unchanged.";
                break;
        }

        setSummary(selected + ". " + extra);
    }
}
