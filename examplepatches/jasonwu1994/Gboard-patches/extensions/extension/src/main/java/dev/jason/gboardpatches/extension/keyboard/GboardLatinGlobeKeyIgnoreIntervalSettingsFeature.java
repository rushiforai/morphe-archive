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
    private static final String HEADER_BADGE = "Gboard";
    private static final String ENTRY_TITLE = "English Globe Key Ignore Delay";
    private static final String ENTRY_SUMMARY =
            "On the English keyboard, you cannot switch keyboards with the globe key immediately after typing letters. The stock delay is 500ms.";
    private static final String ERROR_TITLE =
            "English globe key ignore delay unavailable";
    private static final String ERROR_SUMMARY =
            "The English globe key settings screen failed to load. Reopen Gboard settings and try again.";
    private static final String ENABLED_TITLE = "Enabled";
    private static final String ENABLED_SUMMARY =
            "Enable this runtime override for the English keyboard globe key ignore delay.";
    private static final String INTERVAL_TITLE = "Ignore delay";
    private static final String INTERVAL_SUMMARY =
            "Range: 0-1000ms. Official default: 500ms.";
    private static final String INTERVAL_DIALOG_TITLE =
            "English Globe Key Ignore Delay";
    private static final String INTERVAL_DIALOG_HINT = "0-1000 ms";
    private static final String INTERVAL_DIALOG_ERROR =
            "Enter a value from 0 to 1000.";
    private static final String SECTION_BEHAVIOR = "Behavior";
    private static final String PREVIEW_MESSAGE = "";
    private static final String PREVIEW_DEFAULT_CAPTION = "Stock default (500 ms)";
    private static final String PREVIEW_PATCHED_CAPTION = "Patched example (0 ms)";

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
        headerBadge = GboardSettingsText.get(context, R.string.gboard_patches_header_badge,
                HEADER_BADGE);
        entryTitle = GboardSettingsText.get(context, R.string.gboard_patches_latin_globe_title,
                ENTRY_TITLE);
        entrySummary = GboardSettingsText.get(context,
                R.string.gboard_patches_latin_globe_summary,
                ENTRY_SUMMARY);
        headerSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_latin_globe_header_summary,
                "On the English keyboard, you cannot switch keyboards with the globe key immediately after typing letters. The stock delay is %1$dms.",
                GboardLatinGlobeKeyIgnoreIntervalSettings.DEFAULT_INTERVAL_MS);
        errorTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_latin_globe_error_title,
                ERROR_TITLE);
        errorSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_latin_globe_error_summary,
                ERROR_SUMMARY);
        enabledTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_latin_globe_enabled_title,
                ENABLED_TITLE);
        enabledSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_latin_globe_enabled_summary,
                ENABLED_SUMMARY);
        intervalTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_latin_globe_interval_title,
                INTERVAL_TITLE);
        intervalSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_latin_globe_interval_summary,
                INTERVAL_SUMMARY);
        intervalDialogTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_latin_globe_dialog_title,
                INTERVAL_DIALOG_TITLE);
        intervalDialogHint = GboardSettingsText.get(context,
                R.string.gboard_patches_latin_globe_dialog_hint,
                INTERVAL_DIALOG_HINT);
        intervalDialogError = GboardSettingsText.get(context,
                R.string.gboard_patches_latin_globe_dialog_error,
                INTERVAL_DIALOG_ERROR);
        sectionBehavior = GboardSettingsText.get(context,
                R.string.gboard_patches_latin_globe_section_behavior,
                SECTION_BEHAVIOR);
        previewMessage = GboardSettingsText.get(context,
                R.string.gboard_patches_latin_globe_preview_message,
                PREVIEW_MESSAGE);
        previewDefaultCaption = GboardSettingsText.get(context,
                R.string.gboard_patches_latin_globe_preview_default,
                PREVIEW_DEFAULT_CAPTION);
        previewPatchedCaption = GboardSettingsText.get(context,
                R.string.gboard_patches_latin_globe_preview_patched,
                PREVIEW_PATCHED_CAPTION);
        intervalValueTemplate = GboardSettingsText.get(context,
                R.string.gboard_patches_latin_globe_interval_value,
                "%1$d ms");
        intervalValueDefaultTemplate = GboardSettingsText.get(context,
                R.string.gboard_patches_latin_globe_interval_value_default,
                "%1$d ms (Default)");
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
            GboardPatchesSettingsContract.Host host) {
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

    private void showIntervalDialog(GboardPatchesSettingsContract.Host host,
            SharedPreferences preferences) {
        host.showTextInputDialog(
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
