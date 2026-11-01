package dev.jason.gboardpatches.extension.emojifont;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.settings.GboardPatchesFeatureAvailability;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

public final class GboardEmojiFontSettingsFeature implements GboardPatchesSettingsContract.Feature {
    private static final String TAG = "GboardEmojiFont";
    private static final String SAMPLE_EMOJIS =
            "😀 😃 😄 😁 🥹 😅 🤣 😂 😍 🥰 😘 🤪 😎 🤩 🥳 🔥 🚀 🌟 ❤️ 👍 🎉 🦄";

    private final Context context;
    private final String entryTitle;
    private final String entrySummary;
    private final String headerBadge;
    private final String sectionSettings;
    private final String toggleTitle;
    private final String toggleSummary;
    private final String selectTitle;
    private final String selectSummary;
    private final String currentFontLabel;
    private final String noneSelectedLabel;
    private final String resetTitle;
    private final String resetSummary;
    private final String sectionPreview;
    private final String previewSampleTitle;
    private final String errorTitle;
    private final String errorSummary;

    public GboardEmojiFontSettingsFeature(Context context) {
        this.context = context;
        entryTitle = textOrFallback(R.string.gboard_patches_emoji_font_title, "Custom Emoji Font (.ttf)");
        entrySummary = textOrFallback(R.string.gboard_patches_emoji_font_summary, "Use a custom TrueType font for emojis");
        headerBadge = textOrFallback(R.string.gboard_patches_header_badge, "GBOARD");
        sectionSettings = textOrFallback(R.string.gboard_patches_emoji_font_section_settings, "Font Settings");
        toggleTitle = textOrFallback(R.string.gboard_patches_emoji_font_toggle_title, "Enable Custom Emoji Font");
        toggleSummary = textOrFallback(R.string.gboard_patches_emoji_font_toggle_summary, "Render emojis using the selected .ttf font");
        selectTitle = textOrFallback(R.string.gboard_patches_emoji_font_select_title, "Select .ttf Font File");
        selectSummary = textOrFallback(R.string.gboard_patches_emoji_font_select_summary, "Import an emoji .ttf file from storage");
        currentFontLabel = textOrFallback(R.string.gboard_patches_emoji_font_current_label, "Current font");
        noneSelectedLabel = textOrFallback(R.string.gboard_patches_emoji_font_none_selected, "System default (No custom font imported)");
        resetTitle = textOrFallback(R.string.gboard_patches_emoji_font_reset_title, "Reset to System Default");
        resetSummary = textOrFallback(R.string.gboard_patches_emoji_font_reset_summary, "Delete custom font and restore system emojis");
        sectionPreview = textOrFallback(R.string.gboard_patches_emoji_font_section_preview, "Emoji Preview");
        previewSampleTitle = textOrFallback(R.string.gboard_patches_emoji_font_preview_sample, "Sample Glyphs");
        errorTitle = textOrFallback(R.string.gboard_patches_emoji_font_error_title, "Custom Emoji Font unavailable");
        errorSummary = textOrFallback(R.string.gboard_patches_emoji_font_error_summary, "The settings screen failed to load.");
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
                context, GboardPatchesFeatureAvailability.FEATURE_CUSTOM_EMOJI_FONT);
    }

    @Override
    public List<GboardPatchesSettingsContract.Feature> getNavigationChildren() {
        return Collections.emptyList();
    }

    @Override
    public GboardPatchesSettingsContract.Screen buildScreen(
            GboardPatchesSettingsContract.FeatureHost host) {
        Context hostContext = host.getContext();
        try {
            SharedPreferences preferences = GboardEmojiFontSettings.preferences(hostContext);
            boolean enabled = GboardEmojiFontSettings.readEnabled(preferences);
            String fontName = GboardEmojiFontSettings.readFontName(preferences);
            long fontSize = GboardEmojiFontSettings.readFontSize(preferences);
            boolean hasFont = GboardEmojiFontSettings.hasCustomFontFile(hostContext);

            String currentFontSummary = hasFont
                    ? (fontName.isEmpty() ? "custom_emoji_font.ttf" : fontName) + " (" + formatFileSize(fontSize) + ")"
                    : noneSelectedLabel;

            String previewStatus = (enabled && hasFont)
                    ? "Active: " + (fontName.isEmpty() ? "custom_emoji_font.ttf" : fontName)
                    : "System default";

            GboardPatchesSettingsContract.Row toggleRow = new GboardPatchesSettingsContract.ToggleRow(
                    toggleTitle, toggleSummary, hasFont, enabled,
                    value -> {
                        GboardEmojiFontSettings.writeEnabled(preferences, value);
                        GboardEmojiFontRuntime.invalidateCache();
                        GboardPatchesSettingsContract.refresh(host);
                    });

            GboardPatchesSettingsContract.Row selectRow = new GboardPatchesSettingsContract.CommandRow(
                    selectTitle, selectSummary, true,
                    () -> GboardPatchesSettingsContract.openBinaryDocument(
                            host,
                            new String[]{"font/ttf", "font/otf", "font/*", "application/x-font-ttf", "application/x-font-truetype", "application/octet-stream", "*/*"},
                            document -> {
                                if (document != null && (document.getUri() != null || (document.getData() != null && document.getData().length > 0))) {
                                    boolean saved;
                                    if (document.getUri() != null) {
                                        saved = GboardEmojiFontRuntime.saveCustomEmojiFontFromUri(
                                                hostContext, document.getUri(), document.getDisplayName());
                                    } else {
                                        saved = GboardEmojiFontRuntime.saveCustomEmojiFont(
                                                hostContext, document.getData(), document.getDisplayName());
                                    }
                                    if (saved) {
                                        GboardEmojiFontSettings.writeEnabled(preferences, true);
                                    }
                                    GboardEmojiFontRuntime.invalidateCache();
                                    GboardPatchesSettingsContract.refresh(host);
                                }
                            }));

            GboardPatchesSettingsContract.Row currentFontRow = new GboardPatchesSettingsContract.DetailRow(
                    currentFontLabel, currentFontSummary, true);

            GboardPatchesSettingsContract.Row resetRow = new GboardPatchesSettingsContract.DangerRow(
                    resetTitle, resetSummary, hasFont,
                    () -> {
                        GboardEmojiFontRuntime.deleteCustomEmojiFont(hostContext);
                        GboardEmojiFontRuntime.invalidateCache();
                        GboardPatchesSettingsContract.refresh(host);
                    },
                    resetTitle, resetSummary);

            GboardPatchesSettingsContract.Section settingsSection = new GboardPatchesSettingsContract.Section(
                    sectionSettings,
                    Arrays.asList(toggleRow, selectRow, currentFontRow, resetRow));

            GboardPatchesSettingsContract.Row previewRow = new GboardPatchesSettingsContract.DetailRow(
                    previewSampleTitle,
                    SAMPLE_EMOJIS,
                    false);

            GboardPatchesSettingsContract.Row previewStatusRow = new GboardPatchesSettingsContract.DetailRow(
                    "Font Status",
                    previewStatus,
                    false);

            GboardPatchesSettingsContract.Section previewSection = new GboardPatchesSettingsContract.Section(
                    sectionPreview,
                    Arrays.asList(previewRow, previewStatusRow));

            return new GboardPatchesSettingsContract.Screen(
                    entryTitle, headerBadge, entryTitle, entrySummary, Collections.emptyList(),
                    Arrays.asList(settingsSection, previewSection),
                    GboardPatchesSettingsContract.RefreshPolicy.none(),
                    GboardPatchesSettingsContract.PanelStyle.FLAT);
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to render emoji font settings screen", throwable);
            return new GboardPatchesSettingsContract.Screen(
                    entryTitle, headerBadge, errorTitle, errorSummary, Collections.emptyList(),
                    Collections.emptyList(),
                    GboardPatchesSettingsContract.RefreshPolicy.none(),
                    GboardPatchesSettingsContract.PanelStyle.FLAT);
        }
    }

    private String textOrFallback(int resId, String fallback) {
        String localized = GboardSettingsText.get(context, resId);
        return localized != null && !localized.isEmpty() ? localized : fallback;
    }

    private static String formatFileSize(long bytes) {
        if (bytes <= 0) return "0 B";
        if (bytes < 1024) return bytes + " B";
        if (bytes < 1024 * 1024) {
            return String.format(Locale.US, "%.1f KB", bytes / 1024.0);
        }
        return String.format(Locale.US, "%.1f MB", bytes / (1024.0 * 1024.0));
    }
}
