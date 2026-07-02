package dev.jason.gboardpatches.extension.clipboard;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.settings.GboardPatchesFeatureAvailability;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

public final class GboardClipboardSettingsFeature
        implements GboardPatchesSettingsContract.Feature {
    private static final String TAG = "GboardClipboard";
    private static final String FALLBACK_HEADER_BADGE = "Gboard";
    private static final String FALLBACK_ENTRY_TITLE = "Clipboard";
    private static final String FALLBACK_ENTRY_SUMMARY =
            "Adjusts clipboard retention, item limits, preview lines, metadata labels, order"
                    + " index, columns, and the phone-hosted Web Clipboard.";
    private static final String FALLBACK_ERROR_TITLE = "Clipboard settings unavailable";
    private static final String FALLBACK_ERROR_SUMMARY =
            "The clipboard settings screen failed to load. Reopen Gboard settings and try"
                    + " again.";
    private static final String FALLBACK_SECTION_GENERAL = "General";
    private static final String FALLBACK_SECTION_METADATA = "Metadata";
    private static final String FALLBACK_SECTION_LAYOUT = "Layout";
    private static final String FALLBACK_SECTION_RETENTION = "Retention";
    private static final String FALLBACK_SECTION_EXTENSIONS = "Extensions";

    private final GboardClipboardMetadataSettingsSection metadataSection =
            new GboardClipboardMetadataSettingsSection();
    private final GboardClipboardLayoutSettingsSection layoutSection =
            new GboardClipboardLayoutSettingsSection();
    private final GboardClipboardRetentionSettingsSection retentionSection =
            new GboardClipboardRetentionSettingsSection();
    private final GboardWebClipboardSettingsFeature webClipboardFeature =
            new GboardWebClipboardSettingsFeature();

    private String headerBadge = FALLBACK_HEADER_BADGE;
    private String entryTitle = FALLBACK_ENTRY_TITLE;
    private String entrySummary = FALLBACK_ENTRY_SUMMARY;
    private String errorTitle = FALLBACK_ERROR_TITLE;
    private String errorSummary = FALLBACK_ERROR_SUMMARY;
    private String sectionGeneral = FALLBACK_SECTION_GENERAL;
    private String sectionMetadata = FALLBACK_SECTION_METADATA;
    private String sectionLayout = FALLBACK_SECTION_LAYOUT;
    private String sectionRetention = FALLBACK_SECTION_RETENTION;
    private String sectionExtensions = FALLBACK_SECTION_EXTENSIONS;

    @Override
    public String getEntryTitle() {
        return entryTitle;
    }

    @Override
    public String getEntrySummary() {
        return entrySummary;
    }

    public GboardPatchesSettingsContract.Feature getWebClipboardFeature() {
        return webClipboardFeature;
    }

    @Override
    public boolean isAvailable(Context context) {
        initializeText(context);
        return GboardPatchesFeatureAvailability.hasAnyFeature(
                context,
                GboardPatchesFeatureAvailability.FEATURE_CLIPBOARD_ENHANCEMENTS,
                GboardPatchesFeatureAvailability.FEATURE_WEB_CLIPBOARD);
    }

    @Override
    public GboardPatchesSettingsContract.Screen buildScreen(
            GboardPatchesSettingsContract.Host host) {
        try {
            Context context = host.getContext();
            initializeText(context);
            SharedPreferences preferences = GboardClipboardSettings.preferences(context);
            GboardClipboardSettings.ensureDefaults(preferences);

            boolean canQueryAvailability = canQueryFeatureAvailability(context);
            boolean hasClipboardEnhancements = canQueryAvailability
                    ? GboardPatchesFeatureAvailability.hasFeature(
                            context,
                            GboardPatchesFeatureAvailability.FEATURE_CLIPBOARD_ENHANCEMENTS)
                    : true;
            boolean hasWebClipboard = canQueryAvailability
                    ? webClipboardFeature.isAvailable(context)
                    : true;
            List<GboardPatchesSettingsContract.Section> sections =
                    new ArrayList<GboardPatchesSettingsContract.Section>();

            if (hasClipboardEnhancements) {
                boolean clipboardEnabled = GboardClipboardSettings.readClipboardEnabled(
                        preferences);
                List<GboardPatchesSettingsContract.Row> generalRows =
                        new ArrayList<GboardPatchesSettingsContract.Row>();
                generalRows.add(new GboardPatchesSettingsContract.ToggleRow(
                        entryTitle,
                        entrySummary,
                        true,
                        clipboardEnabled,
                        value -> preferences.edit()
                                .putBoolean(
                                        GboardClipboardSettings.PREF_KEY_CLIPBOARD_ENABLED,
                                        value)
                                .apply()));

                List<GboardPatchesSettingsContract.Row> metadataRows =
                        new ArrayList<GboardPatchesSettingsContract.Row>();
                metadataSection.appendRows(metadataRows, host, preferences, clipboardEnabled);

                List<GboardPatchesSettingsContract.Row> layoutRows =
                        new ArrayList<GboardPatchesSettingsContract.Row>();
                layoutSection.appendRows(layoutRows, host, preferences, clipboardEnabled);

                List<GboardPatchesSettingsContract.Row> retentionRows =
                        new ArrayList<GboardPatchesSettingsContract.Row>();
                retentionSection.appendRows(retentionRows, host, preferences, clipboardEnabled);

                sections.add(new GboardPatchesSettingsContract.Section(sectionGeneral, generalRows));
                sections.add(new GboardPatchesSettingsContract.Section(sectionMetadata, metadataRows));
                sections.add(new GboardPatchesSettingsContract.Section(sectionLayout, layoutRows));
                sections.add(new GboardPatchesSettingsContract.Section(sectionRetention, retentionRows));
            }

            if (hasWebClipboard) {
                List<GboardPatchesSettingsContract.Row> extensionRows =
                        new ArrayList<GboardPatchesSettingsContract.Row>();
                extensionRows.add(new GboardPatchesSettingsContract.NavigationRow(
                        webClipboardFeature.getEntryTitle(),
                        webClipboardFeature.getHostedEntrySummary(context, preferences),
                        true,
                        () -> host.openFeature(webClipboardFeature)));
                sections.add(new GboardPatchesSettingsContract.Section(
                        sectionExtensions,
                        extensionRows));
            }

            if (sections.isEmpty()) {
                return buildErrorScreen();
            }
            return new GboardPatchesSettingsContract.Screen(
                    entryTitle,
                    headerBadge,
                    entryTitle,
                    entrySummary,
                    Collections.emptyList(),
                    sections,
                    GboardPatchesSettingsContract.RefreshPolicy.none(),
                    GboardPatchesSettingsContract.PanelStyle.FLAT);
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to render clipboard settings screen", throwable);
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
                entrySummary,
                statusBlocks,
                Collections.emptyList());
    }

    private void initializeText(Context context) {
        headerBadge = GboardSettingsText.get(
                context,
                R.string.gboard_patches_header_badge,
                FALLBACK_HEADER_BADGE);
        entryTitle = GboardSettingsText.get(
                context,
                R.string.gboard_patches_clipboard_title,
                FALLBACK_ENTRY_TITLE);
        entrySummary = GboardSettingsText.get(
                context,
                R.string.gboard_patches_clipboard_summary,
                FALLBACK_ENTRY_SUMMARY);
        errorTitle = GboardSettingsText.get(
                context,
                R.string.gboard_patches_clipboard_error_title,
                FALLBACK_ERROR_TITLE);
        errorSummary = GboardSettingsText.get(
                context,
                R.string.gboard_patches_clipboard_error_summary,
                FALLBACK_ERROR_SUMMARY);
        sectionGeneral = GboardSettingsText.get(
                context,
                R.string.gboard_patches_clipboard_section_general,
                FALLBACK_SECTION_GENERAL);
        sectionMetadata = GboardSettingsText.get(
                context,
                R.string.gboard_patches_clipboard_section_metadata,
                FALLBACK_SECTION_METADATA);
        sectionLayout = GboardSettingsText.get(
                context,
                R.string.gboard_patches_clipboard_section_layout,
                FALLBACK_SECTION_LAYOUT);
        sectionRetention = GboardSettingsText.get(
                context,
                R.string.gboard_patches_clipboard_section_retention,
                FALLBACK_SECTION_RETENTION);
        sectionExtensions = GboardSettingsText.get(
                context,
                R.string.gboard_patches_clipboard_section_extensions,
                FALLBACK_SECTION_EXTENSIONS);
    }

    private boolean canQueryFeatureAvailability(Context context) {
        if (context == null) {
            return false;
        }
        Context applicationContext = context.getApplicationContext();
        Context lookupContext = applicationContext != null ? applicationContext : context;
        try {
            return lookupContext.getPackageManager() != null
                    && lookupContext.getPackageName() != null;
        } catch (Throwable ignored) {
            return false;
        }
    }
}
