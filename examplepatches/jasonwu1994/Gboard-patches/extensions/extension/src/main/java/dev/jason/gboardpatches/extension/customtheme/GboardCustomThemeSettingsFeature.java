package dev.jason.gboardpatches.extension.customtheme;

import android.content.Context;
import android.content.SharedPreferences;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.settings.GboardPatchesFeatureAvailability;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettings;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

/** Settings page that gates entry to the Custom Theme gallery. */
public final class GboardCustomThemeSettingsFeature
        implements GboardPatchesSettingsContract.Feature {
    private static final String PREVIEW_ASSET =
            "settings-previews/customtheme/enabled.png";

    private final String title;
    private final String summary;
    private final GboardCustomThemeGalleryFeature galleryFeature;

    public GboardCustomThemeSettingsFeature(Context context) {
        title = text(context, R.string.gboard_patches_custom_theme_title);
        summary = text(context, R.string.gboard_patches_custom_theme_summary);
        galleryFeature = new GboardCustomThemeGalleryFeature(context);
    }

    @Override public String getEntryTitle() { return title; }
    @Override public String getEntrySummary() { return summary; }

    @Override
    public boolean isAvailable(Context context) {
        return GboardPatchesFeatureAvailability.hasFeature(context,
                GboardPatchesFeatureAvailability.FEATURE_CUSTOM_THEME);
    }

    @Override
    public List<GboardPatchesSettingsContract.Feature> getNavigationChildren() {
        return Collections.singletonList(galleryFeature);
    }

    @Override
    public GboardPatchesSettingsContract.Screen buildScreen(
            GboardPatchesSettingsContract.FeatureHost host) {
        Context context = host.getContext();
        SharedPreferences preferences = GboardPatchesSettings.preferences(context);
        boolean enabled = GboardCustomThemeSettings.readEnabled(preferences);
        String enabledTitle = text(context,
                R.string.gboard_patches_custom_theme_enabled_title);
        return new GboardPatchesSettingsContract.Screen(
                title,
                text(context, R.string.gboard_patches_header_badge),
                title,
                summary,
                Collections.emptyList(),
                Collections.singletonList(new GboardPatchesSettingsContract.Section(
                        text(context, R.string.gboard_patches_custom_theme_section),
                        Arrays.asList(
                                new GboardPatchesSettingsContract.ToggleRow(
                                        enabledTitle,
                                        text(context,
                                                R.string.gboard_patches_custom_theme_enabled_summary),
                                        true,
                                        enabled,
                                        value -> {
                                            GboardCustomThemeSettings.writeEnabled(
                                                    preferences, value);
                                            GboardPatchesSettingsContract.refresh(host);
                                        },
                                        new GboardPatchesSettingsContract.PreviewSpec(
                                                enabledTitle,
                                                "",
                                                new GboardPatchesSettingsContract.PreviewImage(
                                                        PREVIEW_ASSET, ""))),
                                new GboardPatchesSettingsContract.NavigationRow(
                                        text(context,
                                                R.string.gboard_patches_custom_theme_browse_title),
                                        text(context,
                                                R.string.gboard_patches_custom_theme_browse_summary),
                                        enabled,
                                        () -> GboardPatchesSettingsContract.openFeature(
                                                host, galleryFeature))))),
                GboardPatchesSettingsContract.RefreshPolicy.none(),
                GboardPatchesSettingsContract.PanelStyle.FLAT);
    }

    private static String text(Context context, int id) {
        return GboardSettingsText.get(context, id);
    }
}
