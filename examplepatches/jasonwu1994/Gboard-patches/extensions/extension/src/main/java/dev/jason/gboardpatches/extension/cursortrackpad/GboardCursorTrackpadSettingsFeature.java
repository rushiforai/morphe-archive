package dev.jason.gboardpatches.extension.cursortrackpad;

import android.content.Context;
import android.content.SharedPreferences;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.flagsettings.GboardBooleanFlagSettingsFeature;
import dev.jason.gboardpatches.extension.settings.GboardPatchesFeatureAvailability;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

public final class GboardCursorTrackpadSettingsFeature
        extends GboardBooleanFlagSettingsFeature {
    public GboardCursorTrackpadSettingsFeature(Context context) {
        super(
                GboardPatchesFeatureAvailability.FEATURE_CURSOR_TRACKPAD,
                text(context, R.string.gboard_patches_cursor_trackpad_title),
                text(context, R.string.gboard_patches_cursor_trackpad_summary),
                text(context, R.string.gboard_patches_cursor_trackpad_title),
                text(context, R.string.gboard_patches_header_badge),
                text(context, R.string.gboard_patches_flag_patch_error_title),
                text(context, R.string.gboard_patches_flag_patch_error_summary),
                text(context, R.string.gboard_patches_flag_patch_section_feature),
                new GboardPatchesSettingsContract.PreviewSpec(
                        text(context, R.string.gboard_patches_cursor_trackpad_title),
                        "",
                        GboardPatchesSettingsContract.PreviewLayout.STACKED,
                        new GboardPatchesSettingsContract.PreviewImage(
                                "settings-previews/cursortrackpad/01_cursor_trackpad_mode.png",
                                text(context,
                                        R.string.gboard_patches_cursor_trackpad_preview_mode)),
                        new GboardPatchesSettingsContract.PreviewImage(
                                "settings-previews/cursortrackpad/02_cursor_trackpad_setting.jpg",
                                text(context,
                                        R.string.gboard_patches_cursor_trackpad_preview_setting))),
                new SettingsStore() {
                    @Override
                    public void ensureDefault(SharedPreferences preferences) {
                        GboardCursorTrackpadSettings.ensureDefault(preferences);
                    }

                    @Override
                    public boolean readEnabled(SharedPreferences preferences) {
                        return GboardCursorTrackpadSettings.readEnabled(preferences);
                    }

                    @Override
                    public boolean writeEnabled(
                            SharedPreferences preferences,
                            boolean enabled) {
                        return GboardCursorTrackpadSettings.writeEnabled(preferences, enabled);
                    }
                });
    }

    private static String text(Context context, int resourceId) {
        return GboardSettingsText.get(context, resourceId);
    }
}
