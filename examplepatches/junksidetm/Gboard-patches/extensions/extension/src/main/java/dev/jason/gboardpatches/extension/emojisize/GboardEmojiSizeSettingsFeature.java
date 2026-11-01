package dev.jason.gboardpatches.extension.emojisize;

import android.content.Context;
import android.content.SharedPreferences;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.flagsettings.GboardBooleanFlagSettingsFeature;
import dev.jason.gboardpatches.extension.settings.GboardPatchesFeatureAvailability;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

public final class GboardEmojiSizeSettingsFeature
        extends GboardBooleanFlagSettingsFeature {
    public GboardEmojiSizeSettingsFeature(Context context) {
        super(
                GboardPatchesFeatureAvailability.FEATURE_EMOJI_SIZE,
                text(context, R.string.gboard_patches_emoji_size_title),
                "",
                text(context, R.string.gboard_patches_emoji_size_title),
                text(context, R.string.gboard_patches_header_badge),
                text(context, R.string.gboard_patches_flag_patch_error_title),
                text(context, R.string.gboard_patches_flag_patch_error_summary),
                text(context, R.string.gboard_patches_flag_patch_section_feature),
                new GboardPatchesSettingsContract.PreviewSpec(
                        text(context, R.string.gboard_patches_emoji_size_title),
                        "",
                        GboardPatchesSettingsContract.PreviewLayout.STACKED,
                        new GboardPatchesSettingsContract.PreviewImage(
                                "settings-previews/emojisize/05_emoji_size_setting.jpg",
                                text(context,
                                        R.string.gboard_patches_emoji_size_preview_setting))),
                new SettingsStore() {
                    @Override
                    public void ensureDefault(SharedPreferences preferences) {
                        GboardEmojiSizeSettings.ensureDefault(preferences);
                    }

                    @Override
                    public boolean readEnabled(SharedPreferences preferences) {
                        return GboardEmojiSizeSettings.readEnabled(preferences);
                    }

                    @Override
                    public boolean writeEnabled(
                            SharedPreferences preferences,
                            boolean enabled) {
                        return GboardEmojiSizeSettings.writeEnabled(preferences, enabled);
                    }
                });
    }

    private static String text(Context context, int resourceId) {
        return GboardSettingsText.get(context, resourceId);
    }
}
