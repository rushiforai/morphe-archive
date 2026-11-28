package dev.jason.gboardpatches.extension.keyboard;

import android.content.Context;

import java.util.Arrays;
import java.util.List;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.customtheme.GboardCustomThemeSettingsFeature;
import dev.jason.gboardpatches.extension.emojisize.GboardEmojiSizeSettingsFeature;
import dev.jason.gboardpatches.extension.frostedglass.GboardFrostedGlassSettingsFeature;
import dev.jason.gboardpatches.extension.roundedkeyboard.GboardRoundedKeyboardSettingsFeature;
import dev.jason.gboardpatches.extension.settings.GboardFeatureGroup;
import dev.jason.gboardpatches.extension.settings.GboardPatchesIcons;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;
import dev.jason.gboardpatches.extension.spacebarlogo.GboardSpacebarLogoSettingsFeature;

/**
 * Patches → Keyboard → Appearance & Theme.
 * Groups AMOLED Dark Keyboard, Frosted Glass, Custom Theme, Rounded Keyboard, Spacebar Logo & Emoji Size.
 */
public final class GboardKeyboardAppearanceSettingsGroupFeature
        implements GboardPatchesSettingsContract.Feature {
    private final GboardFeatureGroup delegate;

    public GboardKeyboardAppearanceSettingsGroupFeature(Context context) {
        delegate = new GboardFeatureGroup(
                GboardSettingsText.get(context,
                        R.string.gboard_patches_group_keyboard_appearance_title),
                GboardSettingsText.get(context,
                        R.string.gboard_patches_group_keyboard_appearance_summary),
                GboardSettingsText.get(context, R.string.gboard_patches_header_badge),
                GboardSettingsText.get(context,
                        R.string.gboard_patches_group_keyboard_header_summary),
                GboardSettingsText.get(context,
                        R.string.gboard_patches_group_keyboard_empty_title),
                GboardSettingsText.get(context,
                        R.string.gboard_patches_group_keyboard_empty_summary),
                Arrays.asList(
                        new GboardFrostedGlassSettingsFeature(context),
                        new GboardCustomThemeSettingsFeature(context),
                        new GboardRoundedKeyboardSettingsFeature(context),
                        new GboardSpacebarLogoSettingsFeature(context),
                        new GboardEmojiSizeSettingsFeature(context)));
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
    public int getEntryIcon() {
        return GboardPatchesIcons.PALETTE;
    }

    @Override
    public String getEntryTone() {
        return "green";
    }

    @Override
    public String getRootSectionKey() {
        return GboardPatchesSettingsContract.ROOT_SECTION_KEYBOARD;
    }

    @Override
    public boolean isAvailable(Context context) {
        return delegate.isAvailable(context);
    }

    @Override
    public List<GboardPatchesSettingsContract.Feature> getNavigationChildren() {
        return delegate.getNavigationChildren();
    }

    @Override
    public GboardPatchesSettingsContract.Screen buildScreen(
            GboardPatchesSettingsContract.FeatureHost host) {
        return delegate.buildScreen(host);
    }
}
