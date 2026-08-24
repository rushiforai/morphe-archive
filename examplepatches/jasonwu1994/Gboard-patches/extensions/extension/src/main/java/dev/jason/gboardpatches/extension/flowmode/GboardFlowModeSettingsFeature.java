package dev.jason.gboardpatches.extension.flowmode;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import java.util.Collections;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.settings.GboardPatchesFeatureAvailability;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettings;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

public final class GboardFlowModeSettingsFeature
        implements GboardPatchesSettingsContract.Feature {
    private static final String TAG = "GboardPatches";
    private static final String PREVIEW_VIDEO =
            "settings-previews/keyboard/gboard_flow_mode_enabled_preview.mp4";

    private final String entryTitle;
    private final String entrySummary;
    private final String headerBadge;
    private final String errorTitle;
    private final String errorSummary;
    private final String sectionTitle;
    private final String enabledTitle;
    private final String enabledSummary;

    public GboardFlowModeSettingsFeature(Context context) {
        this(
                text(context, R.string.gboard_patches_flow_mode_title),
                text(context, R.string.gboard_patches_flow_mode_summary),
                text(context, R.string.gboard_patches_header_badge),
                text(context, R.string.gboard_patches_flow_mode_error_title),
                text(context, R.string.gboard_patches_flow_mode_error_summary),
                text(context, R.string.gboard_patches_flow_mode_section),
                text(context, R.string.gboard_patches_flow_mode_enabled_title),
                text(context, R.string.gboard_patches_flow_mode_enabled_summary));
    }

    GboardFlowModeSettingsFeature(
            String entryTitle,
            String entrySummary,
            String headerBadge,
            String errorTitle,
            String errorSummary,
            String sectionTitle,
            String enabledTitle,
            String enabledSummary) {
        this.entryTitle = entryTitle;
        this.entrySummary = entrySummary;
        this.headerBadge = headerBadge;
        this.errorTitle = errorTitle;
        this.errorSummary = errorSummary;
        this.sectionTitle = sectionTitle;
        this.enabledTitle = enabledTitle;
        this.enabledSummary = enabledSummary;
    }

    @Override
    public String getEntryTitle() {
        return entryTitle;
    }

    @Override
    public String getEntrySummary() {
        return entrySummary;
    }

    @Override
    public boolean isAvailable(Context context) {
        return GboardPatchesFeatureAvailability.hasFeature(
                context,
                GboardPatchesFeatureAvailability.FEATURE_FLOW_MODE_ANIMATION);
    }

    @Override
    public GboardPatchesSettingsContract.Screen buildScreen(
            GboardPatchesSettingsContract.FeatureHost host) {
        try {
            if (host == null || host.getContext() == null) {
                return buildErrorScreen();
            }
            SharedPreferences preferences = GboardPatchesSettings.preferences(host.getContext());
            GboardFlowModeSettings.ensureDefault(preferences);
            return buildScreenForState(
                    GboardFlowModeSettings.readEnabled(preferences),
                    enabled -> GboardFlowModeSettings.writeEnabled(preferences, enabled));
        } catch (Throwable throwable) {
            try {
                Log.w(TAG, "Failed to render hyperspeed typing animation settings", throwable);
            } catch (Throwable ignored) {
                // Rendering the warning screen is the only remaining action.
            }
            return buildErrorScreen();
        }
    }

    GboardPatchesSettingsContract.Screen buildScreenForState(
            boolean enabled,
            GboardPatchesSettingsContract.ToggleAction toggleAction) {
        return new GboardPatchesSettingsContract.Screen(
                entryTitle,
                headerBadge,
                entryTitle,
                "",
                Collections.emptyList(),
                Collections.singletonList(new GboardPatchesSettingsContract.Section(
                        sectionTitle,
                        Collections.singletonList(new GboardPatchesSettingsContract.ToggleRow(
                                enabledTitle,
                                enabledSummary,
                                true,
                                enabled,
                                toggleAction,
                                buildPreview())))),
                GboardPatchesSettingsContract.RefreshPolicy.none(),
                GboardPatchesSettingsContract.PanelStyle.FLAT);
    }

    private GboardPatchesSettingsContract.PreviewSpec buildPreview() {
        return new GboardPatchesSettingsContract.PreviewSpec(
                entryTitle,
                "",
                GboardPatchesSettingsContract.PreviewLayout.STACKED,
                GboardPatchesSettingsContract.PreviewVideo.fromAsset(PREVIEW_VIDEO, ""));
    }

    private GboardPatchesSettingsContract.Screen buildErrorScreen() {
        return new GboardPatchesSettingsContract.Screen(
                entryTitle,
                headerBadge,
                entryTitle,
                "",
                Collections.singletonList(new GboardPatchesSettingsContract.StatusBlock(
                        errorTitle,
                        errorSummary,
                        GboardPatchesSettingsContract.StatusTone.WARNING)),
                Collections.emptyList());
    }

    private static String text(Context context, int resourceId) {
        return GboardSettingsText.get(context, resourceId);
    }
}
