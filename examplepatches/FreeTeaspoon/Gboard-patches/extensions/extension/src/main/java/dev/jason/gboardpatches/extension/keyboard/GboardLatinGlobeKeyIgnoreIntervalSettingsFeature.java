package dev.jason.gboardpatches.extension.keyboard;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.settings.GboardPatchesFeatureAvailability;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

public final class GboardLatinGlobeKeyIgnoreIntervalSettingsFeature
        implements GboardPatchesSettingsContract.Feature {
    private static final String TAG = "GboardPatches";
    private static final String PREVIEW_VIDEO_DEFAULT_ASSET =
            "settings-previews/keyboard/gboard_latin_globe_key_ignore_interval_default.mp4";
    private static final String PREVIEW_VIDEO_PATCHED_ASSET =
            "settings-previews/keyboard/gboard_latin_globe_key_ignore_interval_patched.mp4";
    private final String headerBadge;
    private final String entryTitle;
    private final String entrySummary;
    private final String headerSummary;
    private final String errorTitle;
    private final String errorSummary;
    private final String enabledTitle;
    private final String enabledSummary;
    private final String intervalTitle;
    private final String intervalSummary;
    private final String intervalDialogTitle;
    private final String intervalDialogHint;
    private final String intervalDialogError;
    private final String sectionBehavior;
    private final String previewMessage;
    private final String previewDefaultCaption;
    private final String previewPatchedCaption;
    private final String intervalValueTemplate;
    private final String intervalValueDefaultTemplate;

    public GboardLatinGlobeKeyIgnoreIntervalSettingsFeature(Context context) {
        headerBadge = GboardSettingsText.get(context, R.string.gboard_patches_header_badge);
        entryTitle = GboardSettingsText.get(context, R.string.gboard_patches_latin_globe_title);
        entrySummary = GboardSettingsText.get(context,
                R.string.gboard_patches_latin_globe_summary);
        headerSummary = GboardSettingsText.format(context,
                R.string.gboard_patches_latin_globe_header_summary,
                GboardLatinGlobeKeyIgnoreIntervalSettings.DEFAULT_INTERVAL_MS);
        errorTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_latin_globe_error_title);
        errorSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_latin_globe_error_summary);
        enabledTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_latin_globe_enabled_title);
        enabledSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_latin_globe_enabled_summary);
        intervalTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_latin_globe_interval_title);
        intervalSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_latin_globe_interval_summary);
        intervalDialogTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_latin_globe_dialog_title);
        intervalDialogHint = GboardSettingsText.get(context,
                R.string.gboard_patches_latin_globe_dialog_hint);
        intervalDialogError = GboardSettingsText.get(context,
                R.string.gboard_patches_latin_globe_dialog_error);
        sectionBehavior = GboardSettingsText.get(context,
                R.string.gboard_patches_latin_globe_section_behavior);
        previewMessage = GboardSettingsText.get(context,
                R.string.gboard_patches_latin_globe_preview_message);
        previewDefaultCaption = GboardSettingsText.get(context,
                R.string.gboard_patches_latin_globe_preview_default);
        previewPatchedCaption = GboardSettingsText.get(context,
                R.string.gboard_patches_latin_globe_preview_patched);
        intervalValueTemplate = GboardSettingsText.get(context,
                R.string.gboard_patches_latin_globe_interval_value);
        intervalValueDefaultTemplate = GboardSettingsText.get(context,
                R.string.gboard_patches_latin_globe_interval_value_default);
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
                GboardPatchesFeatureAvailability.FEATURE_LATIN_GLOBE_KEY_IGNORE_INTERVAL);
    }

    @Override
    public GboardPatchesSettingsContract.Screen buildScreen(
            GboardPatchesSettingsContract.FeatureHost host) {
        try {
            if (host == null || host.getContext() == null) {
                return buildErrorScreen();
            }
            SharedPreferences preferences =
                    GboardLatinGlobeKeyIgnoreIntervalSettings.preferences(host.getContext());
            GboardLatinGlobeKeyIgnoreIntervalSettings.ensureDefaults(preferences);

            boolean enabled =
                    GboardLatinGlobeKeyIgnoreIntervalSettings.readEnabled(preferences);
            int intervalMs =
                    GboardLatinGlobeKeyIgnoreIntervalSettings.readIntervalMs(preferences);

            List<GboardPatchesSettingsContract.Row> behaviorRows =
                    new ArrayList<GboardPatchesSettingsContract.Row>();
            behaviorRows.add(new GboardPatchesSettingsContract.ToggleRow(
                    enabledTitle,
                    enabledSummary,
                    true,
                    enabled,
                    value -> GboardLatinGlobeKeyIgnoreIntervalSettings.writeEnabled(
                            preferences,
                            value)));
            behaviorRows.add(new GboardPatchesSettingsContract.SelectorRow(
                    intervalTitle,
                    intervalSummary,
                    intervalLabel(intervalMs),
                    enabled,
                    () -> showIntervalDialog(host, preferences),
                    buildIntervalPreview()));
            return new GboardPatchesSettingsContract.Screen(
                    entryTitle,
                    headerBadge,
                    entryTitle,
                    headerSummary,
                    Collections.emptyList(),
                    Collections.singletonList(new GboardPatchesSettingsContract.Section(
                            sectionBehavior,
                            behaviorRows)),
                    GboardPatchesSettingsContract.RefreshPolicy.none(),
                    GboardPatchesSettingsContract.PanelStyle.FLAT);
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to render Latin globe key ignore interval settings screen",
                    throwable);
            return buildErrorScreen();
        }
    }

    private GboardPatchesSettingsContract.Screen buildErrorScreen() {
        List<GboardPatchesSettingsContract.StatusBlock> statusBlocks =
                new ArrayList<GboardPatchesSettingsContract.StatusBlock>();
        statusBlocks.add(new GboardPatchesSettingsContract.StatusBlock(
                errorTitle,
                errorSummary,
                GboardPatchesSettingsContract.StatusTone.WARNING));
        return new GboardPatchesSettingsContract.Screen(
                entryTitle,
                headerBadge,
                entryTitle,
                headerSummary,
                statusBlocks,
                Collections.emptyList());
    }

    private void showIntervalDialog(GboardPatchesSettingsContract.FeatureHost host,
            SharedPreferences preferences) {
        GboardPatchesSettingsContract.showTextInputDialog(host,
                intervalDialogTitle,
                intervalDialogHint,
                Integer.toString(
                        GboardLatinGlobeKeyIgnoreIntervalSettings.readIntervalMs(preferences)),
                value -> {
                    int intervalMs = parseIntervalValue(value);
                    if (!GboardLatinGlobeKeyIgnoreIntervalSettings.writeIntervalMs(
                            preferences,
                            intervalMs)) {
                        throw new IllegalStateException("Failed to persist interval value");
                    }
                });
    }

    private int parseIntervalValue(String value) {
        if (value == null) {
            throw new IllegalArgumentException(intervalDialogError);
        }
        final int parsed;
        try {
            parsed = Integer.parseInt(value.trim());
        } catch (NumberFormatException exception) {
            throw new IllegalArgumentException(intervalDialogError);
        }
        if (parsed < GboardLatinGlobeKeyIgnoreIntervalSettings.MIN_INTERVAL_MS
                || parsed > GboardLatinGlobeKeyIgnoreIntervalSettings.MAX_INTERVAL_MS) {
            throw new IllegalArgumentException(intervalDialogError);
        }
        return parsed;
    }

    private String intervalLabel(int intervalMs) {
        if (intervalMs == GboardLatinGlobeKeyIgnoreIntervalSettings.DEFAULT_INTERVAL_MS) {
            return String.format(Locale.US, intervalValueDefaultTemplate, intervalMs);
        }
        return String.format(Locale.US, intervalValueTemplate, intervalMs);
    }

    private GboardPatchesSettingsContract.PreviewSpec buildIntervalPreview() {
        return new GboardPatchesSettingsContract.PreviewSpec(
                intervalTitle,
                previewMessage,
                GboardPatchesSettingsContract.PreviewLayout.STACKED,
                GboardPatchesSettingsContract.PreviewVideo.fromAsset(
                        PREVIEW_VIDEO_DEFAULT_ASSET,
                        previewDefaultCaption),
                GboardPatchesSettingsContract.PreviewVideo.fromAsset(
                        PREVIEW_VIDEO_PATCHED_ASSET,
                        previewPatchedCaption));
    }
}
