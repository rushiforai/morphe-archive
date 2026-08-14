package dev.jason.gboardpatches.extension.accessibilitylayout;

import android.content.Context;
import android.content.SharedPreferences;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.flagsettings.GboardBooleanFlagSettingsFeature;
import dev.jason.gboardpatches.extension.settings.GboardPatchesFeatureAvailability;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

public final class GboardAccessibilityLayoutSettingsFeature
        extends GboardBooleanFlagSettingsFeature {
    public GboardAccessibilityLayoutSettingsFeature(Context context) {
        super(
                GboardPatchesFeatureAvailability.FEATURE_ACCESSIBILITY_LAYOUT,
                text(context, R.string.gboard_patches_accessibility_layout_title),
                "",
                text(context, R.string.gboard_patches_accessibility_layout_title),
                text(context, R.string.gboard_patches_header_badge),
                text(context, R.string.gboard_patches_flag_patch_error_title),
                text(context, R.string.gboard_patches_flag_patch_error_summary),
                text(context, R.string.gboard_patches_flag_patch_section_feature),
                new GboardPatchesSettingsContract.PreviewSpec(
                        text(context, R.string.gboard_patches_accessibility_layout_title),
                        "",
                        GboardPatchesSettingsContract.PreviewLayout.STACKED,
                        new GboardPatchesSettingsContract.PreviewImage(
                                "settings-previews/accessibilitylayout/06_accessibility_keyboard.png",
                                text(context,
                                        R.string.gboard_patches_accessibility_preview_keyboard)),
                        new GboardPatchesSettingsContract.PreviewImage(
                                "settings-previews/accessibilitylayout/07_accessibility_layout_setting.jpg",
                                text(context,
                                        R.string.gboard_patches_accessibility_preview_setting))),
                new SettingsStore() {
                    @Override
                    public void ensureDefault(SharedPreferences preferences) {
                        GboardAccessibilityLayoutSettings.ensureDefault(preferences);
                    }

                    @Override
                    public boolean readEnabled(SharedPreferences preferences) {
                        return GboardAccessibilityLayoutSettings.readEnabled(preferences);
                    }

                    @Override
                    public boolean writeEnabled(
                            SharedPreferences preferences,
                            boolean enabled) {
                        return GboardAccessibilityLayoutSettings.writeEnabled(preferences, enabled);
                    }
                });
    }

    private static String text(Context context, int resourceId) {
        return GboardSettingsText.get(context, resourceId);
    }
}
