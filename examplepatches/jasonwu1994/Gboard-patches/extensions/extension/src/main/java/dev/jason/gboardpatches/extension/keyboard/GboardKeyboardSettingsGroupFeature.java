package dev.jason.gboardpatches.extension.keyboard;

import android.content.Context;

import java.util.Arrays;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.advancedvoice.GboardAdvancedVoiceSettingsFeature;
import dev.jason.gboardpatches.extension.bluetoothmicrophone.GboardBluetoothMicrophoneSettingsFeature;
import dev.jason.gboardpatches.extension.longpressquickactions.GboardLongPressQuickActionsSettingsFeature;
import dev.jason.gboardpatches.extension.settings.GboardFeatureGroup;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;
import dev.jason.gboardpatches.extension.symbolfooter.GboardSymbolFooterOrderSettingsFeature;
import dev.jason.gboardpatches.extension.toprowswipe.GboardTopRowSwipeSettingsFeature;
import dev.jason.gboardpatches.extension.writingtools.GboardAiWritingToolsSettingsFeature;
import dev.jason.gboardpatches.extension.zhuyinbottomrow.GboardZhuyinBottomRowWeightSettingsFeature;

public final class GboardKeyboardSettingsGroupFeature
        implements GboardPatchesSettingsContract.Feature {
    private final GboardFeatureGroup delegate;

    public GboardKeyboardSettingsGroupFeature(Context context) {
        delegate = new GboardFeatureGroup(
                GboardSettingsText.get(context, R.string.gboard_patches_group_keyboard_title,
                        "Keyboard"),
                GboardSettingsText.get(context, R.string.gboard_patches_group_keyboard_summary,
                        "Keyboard-related patch settings."),
                GboardSettingsText.get(context, R.string.gboard_patches_header_badge,
                        "Gboard"),
                GboardSettingsText.get(context,
                        R.string.gboard_patches_group_keyboard_header_summary,
                        "Keyboard-level settings for the patches included in this build."),
                GboardSettingsText.get(context,
                        R.string.gboard_patches_group_keyboard_empty_title,
                        "No keyboard settings available"),
                GboardSettingsText.get(context,
                        R.string.gboard_patches_group_keyboard_empty_summary,
                        "This build does not include any keyboard settings features."),
                Arrays.asList(
                        new GboardAiWritingToolsSettingsFeature(context),
                        new GboardAdvancedVoiceSettingsFeature(context),
                        new GboardTopRowSwipeSettingsFeature(context),
                        new GboardLongPressQuickActionsSettingsFeature(context),
                        new GboardLatinGlobeKeyIgnoreIntervalSettingsFeature(context),
                        new GboardEnglishUppercaseToggleSettingsFeature(context),
                        new GboardZhuyinBottomRowWeightSettingsFeature(context),
                        new GboardSymbolFooterOrderSettingsFeature(context),
                        new GboardBluetoothMicrophoneSettingsFeature(context)));
    }

    @Override
    public String getEntryTitle() {
        return delegate.getEntryTitle();
    }

    @Override
    public String getEntrySummary() {
        return delegate.getEntrySummary();
    }

    @Override
    public boolean isAvailable(Context context) {
        return delegate.isAvailable(context);
    }

    @Override
    public GboardPatchesSettingsContract.Screen buildScreen(
            GboardPatchesSettingsContract.Host host) {
        return delegate.buildScreen(host);
    }
}
