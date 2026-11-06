package dev.jason.gboardpatches.extension.customtheme;

import android.content.Context;
import android.view.View;

import java.util.Collections;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.settings.GboardPatchesFeatureAvailability;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettings;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

/** Full gallery child page beneath the Custom Theme settings page. */
final class GboardCustomThemeGalleryFeature implements GboardPatchesSettingsContract.Feature {
    private final String title;
    private GboardCustomThemeGalleryView activeGallery;

    GboardCustomThemeGalleryFeature(Context context) {
        title = text(context, R.string.gboard_patches_custom_theme_activity_title);
    }

    @Override public String getEntryTitle() { return title; }
    @Override public String getEntrySummary() { return ""; }

    @Override
    public boolean isAvailable(Context context) {
        return GboardPatchesFeatureAvailability.hasFeature(context,
                GboardPatchesFeatureAvailability.FEATURE_CUSTOM_THEME)
                && GboardCustomThemeSettings.readEnabled(
                        GboardPatchesSettings.preferences(context));
    }

    @Override
    public GboardPatchesSettingsContract.Screen buildScreen(
            GboardPatchesSettingsContract.FeatureHost host) {
        return new GboardPatchesSettingsContract.Screen(
                title,
                "",
                "",
                "",
                Collections.emptyList(),
                Collections.singletonList(new GboardPatchesSettingsContract.Section(
                        null,
                        null,
                        GboardPatchesSettingsContract.SectionStyle.FULL_BLEED,
                        Collections.singletonList(new GboardPatchesSettingsContract.CustomViewRow(
                                this::createGalleryView)))),
                GboardPatchesSettingsContract.RefreshPolicy.none(),
                GboardPatchesSettingsContract.PanelStyle.FLAT,
                null,
                Collections.singletonList(new GboardPatchesSettingsContract.ToolbarAction(
                        text(host.getContext(),
                                R.string.gboard_patches_custom_theme_delete_downloads),
                        GboardPatchesSettingsContract.ToolbarIcon.DELETE,
                        this::showDeletePacksDialog)),
                true);
    }

    @Override
    public void onHidden(GboardPatchesSettingsContract.FeatureHost host) {
        closeGallery();
    }

    private View createGalleryView(
            GboardPatchesSettingsContract.FeatureHost host) {
        // The settings shell invokes custom view factories while applying the screen on the UI
        // thread. Keep all Android View creation and replacement behind that lifecycle seam.
        closeGallery();
        GboardCustomThemeGalleryView gallery = new GboardCustomThemeGalleryView(host);
        activeGallery = gallery;
        return gallery.getView();
    }

    private void showDeletePacksDialog() {
        GboardCustomThemeGalleryView gallery = activeGallery;
        if (gallery != null) {
            gallery.showDeletePacksDialog();
        }
    }

    private void closeGallery() {
        GboardCustomThemeGalleryView gallery = activeGallery;
        if (gallery != null) {
            activeGallery = null;
            gallery.close();
        }
    }

    private static String text(Context context, int id) {
        return GboardSettingsText.get(context, id);
    }
}
