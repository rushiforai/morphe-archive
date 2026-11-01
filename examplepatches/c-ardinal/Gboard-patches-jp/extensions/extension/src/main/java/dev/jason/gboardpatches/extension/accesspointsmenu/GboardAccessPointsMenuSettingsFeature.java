package dev.jason.gboardpatches.extension.accesspointsmenu;

import android.content.Context;
import android.content.SharedPreferences;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.flagsettings.GboardBooleanFlagSettingsFeature;
import dev.jason.gboardpatches.extension.settings.GboardPatchesFeatureAvailability;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

public final class GboardAccessPointsMenuSettingsFeature
        extends GboardBooleanFlagSettingsFeature {
    public GboardAccessPointsMenuSettingsFeature(Context context) {
        super(
                GboardPatchesFeatureAvailability.FEATURE_ACCESS_POINTS_MENU_STYLE,
                text(context, R.string.gboard_patches_access_points_menu_title),
                "",
                text(context, R.string.gboard_patches_access_points_menu_toggle_title),
                text(context, R.string.gboard_patches_header_badge),
                text(context, R.string.gboard_patches_flag_patch_error_title),
                text(context, R.string.gboard_patches_flag_patch_error_summary),
                text(context, R.string.gboard_patches_flag_patch_section_feature),
                new GboardPatchesSettingsContract.PreviewSpec(
                        text(context, R.string.gboard_patches_access_points_menu_title),
                        "",
                        GboardPatchesSettingsContract.PreviewLayout.STACKED,
                        new GboardPatchesSettingsContract.PreviewImage(
                                "settings-previews/accesspointsmenu/03_access_points_legacy.png",
                                text(context, R.string.gboard_patches_access_points_preview_legacy)),
                        new GboardPatchesSettingsContract.PreviewImage(
                                "settings-previews/accesspointsmenu/04_access_points_redesigned.png",
                                text(context,
                                        R.string.gboard_patches_access_points_preview_redesigned))),
                new SettingsStore() {
                    @Override
                    public void ensureDefault(SharedPreferences preferences) {
                        GboardAccessPointsMenuSettings.ensureDefault(preferences);
                    }

                    @Override
                    public boolean readEnabled(SharedPreferences preferences) {
                        return GboardAccessPointsMenuSettings.readEnabled(preferences);
                    }

                    @Override
                    public boolean writeEnabled(
                            SharedPreferences preferences,
                            boolean enabled) {
                        return GboardAccessPointsMenuSettings.writeEnabled(preferences, enabled);
                    }
                });
    }

    private static String text(Context context, int resourceId) {
        return GboardSettingsText.get(context, resourceId);
    }
}
