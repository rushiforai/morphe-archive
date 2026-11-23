/**
 * Gboard_Pro - Gboard Enhancement Mod
 *
 * Maintained and customized by Arafath (@smartworldarafath)
 * Repository: https://github.com/smartworldarafath/Gboard_Pro
 * Licensed under the GNU General Public License v3.0 (GPLv3)
 */
package com.akshaykadam.pixelboard.extension.settings;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Build;
import android.preference.PreferenceManager;
import com.akshaykadam.pixelboard.extension.R;
import com.akshaykadam.pixelboard.extension.advancedvoice.GboardAdvancedVoiceSettings;
import com.akshaykadam.pixelboard.extension.writingtools.GboardAiWritingToolsDeviceSupport;
import com.akshaykadam.pixelboard.extension.writingtools.GboardAiWritingToolsSettings;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public final class GboardAdvancedSettingsFeature implements GboardPatchesSettingsContract.Feature {

    public static final String PREF_KEY_FREQUENT_EMOJIS = "frequently_used_emojis_enabled";
    public static final String GBOARD_PREF_KEY_FREQUENT_EMOJI_TAB = "enable_frequent_emoji_recent_Tab";

    private final Context context;

    public GboardAdvancedSettingsFeature(Context context) {
        this.context = context;
    }

    @Override
    public String getEntryTitle() {
        return "Advanced Settings";
    }

    @Override
    public String getEntrySummary() {
        return "Gemini voice typing, writing tools & modular patches";
    }

    @Override
    public boolean isAvailable(Context context) {
        return true;
    }

    @Override
    public List<GboardPatchesSettingsContract.Feature> getNavigationChildren() {
        return Collections.emptyList();
    }

    @Override
    public GboardPatchesSettingsContract.Screen buildScreen(GboardPatchesSettingsContract.FeatureHost host) {
        Context ctx = host != null && host.getContext() != null ? host.getContext() : context;

        SharedPreferences writingPrefs = GboardAiWritingToolsSettings.preferences(ctx);
        SharedPreferences voicePrefs = GboardAdvancedVoiceSettings.preferences(ctx);
        SharedPreferences patchesPrefs = GboardPatchesSettings.preferences(ctx);

        if (writingPrefs != null) {
            if (!writingPrefs.getBoolean("pref_defaults_migrated_v4", false)) {
                writingPrefs.edit()
                        .putBoolean(GboardAiWritingToolsSettings.PREF_KEY_ENABLED, true)
                        .putBoolean(GboardAiWritingToolsSettings.PREF_KEY_ALL_KEYBOARDS, true)
                        .putBoolean("pref_defaults_migrated_v4", true)
                        .apply();
            }
        }
        if (voicePrefs != null) {
            if (!voicePrefs.getBoolean("pref_defaults_migrated_v4", false)) {
                voicePrefs.edit()
                        .putBoolean(GboardAdvancedVoiceSettings.PREF_KEY_ENABLED, true)
                        .putBoolean("pref_defaults_migrated_v4", true)
                        .apply();
            }
        }
        if (patchesPrefs != null) {
            GboardRoundedKeysSettings.ensureDefaults(ctx, patchesPrefs);
            GboardGoogleSansSettings.ensureDefaults(ctx, patchesPrefs);
            GboardUndoSettings.ensureDefaults(ctx, patchesPrefs);
            if (!patchesPrefs.contains(GboardEmojiSettings.PREF_KEY_FREQUENT_EMOJIS_ENABLED)
                    && patchesPrefs.contains(PREF_KEY_FREQUENT_EMOJIS)) {
                GboardEmojiSettings.writeFrequentEmojisEnabled(
                        patchesPrefs, patchesPrefs.getBoolean(PREF_KEY_FREQUENT_EMOJIS, false));
            }
        }

        boolean aiWritingToolsEnabled = writingPrefs == null
                || GboardAiWritingToolsSettings.readEnabled(writingPrefs);
        boolean allKeyboardsEnabled = writingPrefs == null
                || GboardAiWritingToolsSettings.readAllKeyboardsEnabled(writingPrefs);
        boolean advancedVoiceEnabled = voicePrefs == null
                || GboardAdvancedVoiceSettings.readEnabled(voicePrefs);
        boolean roundedKeysEnabled = patchesPrefs == null
                || GboardRoundedKeysSettings.readEnabled(patchesPrefs);
        boolean googleSansEnabled = patchesPrefs == null
                || GboardGoogleSansSettings.readEnabled(patchesPrefs);
        boolean undoButtonEnabled = patchesPrefs == null
                || GboardUndoSettings.readEnabled(patchesPrefs);
        boolean frequentEmojisEnabled = patchesPrefs != null
                && GboardEmojiSettings.readFrequentEmojisEnabled(patchesPrefs);

        List<GboardPatchesSettingsContract.Row> rows = new ArrayList<>();

        // 1. Enable AI Writing Tools
        rows.add(new GboardPatchesSettingsContract.ToggleRow(
                GboardSettingsText.get(ctx, R.string.gboard_patches_ai_writing_tools_enabled_title),
                GboardSettingsText.get(ctx, R.string.gboard_patches_ai_writing_tools_enabled_summary),
                true,
                aiWritingToolsEnabled,
                value -> {
                    if (writingPrefs != null) {
                        GboardAiWritingToolsSettings.writeEnabled(writingPrefs, value);
                        if (host != null) {
                            GboardPatchesSettingsContract.refresh(host);
                        }
                    }
                }));

        // 2. Support All Keyboards
        rows.add(new GboardPatchesSettingsContract.ToggleRow(
                GboardSettingsText.get(ctx, R.string.gboard_patches_ai_writing_tools_all_keyboards_title),
                GboardSettingsText.get(ctx, R.string.gboard_patches_ai_writing_tools_all_keyboards_summary),
                aiWritingToolsEnabled,
                allKeyboardsEnabled,
                value -> {
                    if (writingPrefs != null) {
                        GboardAiWritingToolsSettings.writeAllKeyboardsEnabled(writingPrefs, value);
                    }
                }));

        // 3. Enable Advanced Voice Typing
        rows.add(new GboardPatchesSettingsContract.ToggleRow(
                GboardSettingsText.get(ctx, R.string.gboard_patches_advanced_voice_enabled_title),
                GboardSettingsText.get(ctx, R.string.gboard_patches_advanced_voice_enabled_summary),
                true,
                advancedVoiceEnabled,
                value -> {
                    if (voicePrefs != null) {
                        GboardAdvancedVoiceSettings.writeEnabled(voicePrefs, value);
                    }
                }));

        // 4. Rounded Keys
        rows.add(new GboardPatchesSettingsContract.ToggleRow(
                GboardSettingsText.get(ctx, R.string.gboard_patches_rounded_keys_enabled_title),
                GboardSettingsText.get(ctx, R.string.gboard_patches_rounded_keys_enabled_summary),
                true,
                roundedKeysEnabled,
                value -> {
                    if (patchesPrefs != null) {
                        GboardRoundedKeysSettings.writeEnabled(patchesPrefs, value);
                        GboardRoundedKeysSettings.applyToGboardPreferences(ctx, value);
                        if (host != null) {
                            GboardPatchesSettingsContract.refresh(host);
                        }
                    }
                }));

        // 5. Google Sans Flex typography
        rows.add(new GboardPatchesSettingsContract.ToggleRow(
                GboardSettingsText.get(ctx, R.string.gboard_patches_google_sans_title),
                GboardSettingsText.get(ctx, R.string.gboard_patches_google_sans_summary),
                true,
                googleSansEnabled,
                value -> {
                    if (patchesPrefs != null) {
                        GboardGoogleSansSettings.writeEnabled(patchesPrefs, value);
                        if (host != null) {
                            GboardPatchesSettingsContract.refresh(host);
                        }
                    }
                }));

        // 6. Undo button
        rows.add(new GboardPatchesSettingsContract.ToggleRow(
                GboardSettingsText.get(ctx, R.string.gboard_patches_undo_button_title),
                GboardSettingsText.get(ctx, R.string.gboard_patches_undo_button_summary),
                true,
                undoButtonEnabled,
                value -> {
                    if (patchesPrefs != null) {
                        GboardUndoSettings.writeEnabled(patchesPrefs, value);
                        if (host != null) {
                            GboardPatchesSettingsContract.refresh(host);
                        }
                    }
                }));

        // 7. Frequently used emojis
        rows.add(new GboardPatchesSettingsContract.ToggleRow(
                GboardSettingsText.get(ctx, R.string.gboard_patches_frequently_used_emojis_title),
                GboardSettingsText.get(ctx, R.string.gboard_patches_frequently_used_emojis_summary),
                true,
                frequentEmojisEnabled,
                value -> {
                    if (patchesPrefs != null) {
                        GboardEmojiSettings.writeFrequentEmojisEnabled(patchesPrefs, value);
                        patchesPrefs.edit().putBoolean(PREF_KEY_FREQUENT_EMOJIS, value).apply();
                    }
                    syncFrequentEmojiPrefToGboard(ctx, value);
                    if (host != null) {
                        GboardPatchesSettingsContract.refresh(host);
                    }
                }));

        List<GboardPatchesSettingsContract.Section> sections = new ArrayList<>();
        sections.add(new GboardPatchesSettingsContract.Section(
                GboardSettingsText.get(ctx, R.string.gboard_patches_section_features),
                rows));

        if (GboardAiWritingToolsDeviceSupport.isSupportedDevice()) {
            String backendType = writingPrefs != null
                    ? GboardAiWritingToolsSettings.readBackendType(writingPrefs)
                    : GboardAiWritingToolsSettings.BACKEND_GBOARD_SERVER;

            List<GboardPatchesSettingsContract.Row> backendRows = new ArrayList<>();

            backendRows.add(new GboardPatchesSettingsContract.RadioRow(
                    "Google Cloud (Server)",
                    "Cloud-based processing for text generation, rewriting, and smart suggestions.",
                    aiWritingToolsEnabled,
                    GboardAiWritingToolsSettings.BACKEND_GBOARD_SERVER.equals(backendType),
                    () -> {
                        if (writingPrefs != null) {
                            GboardAiWritingToolsSettings.writeBackendType(writingPrefs,
                                    GboardAiWritingToolsSettings.BACKEND_GBOARD_SERVER);
                            if (host != null) {
                                GboardPatchesSettingsContract.refresh(host);
                            }
                        }
                    }));

            backendRows.add(new GboardPatchesSettingsContract.RadioRow(
                    "Private Inference (AICore)",
                    "Private on-device inference using Gemini Nano via Android AICore system service.",
                    aiWritingToolsEnabled,
                    GboardAiWritingToolsSettings.BACKEND_PRIVATE_INFERENCE_AICORE.equals(backendType),
                    () -> {
                        if (writingPrefs != null) {
                            GboardAiWritingToolsSettings.writeBackendType(writingPrefs,
                                    GboardAiWritingToolsSettings.BACKEND_PRIVATE_INFERENCE_AICORE);
                            if (host != null) {
                                GboardPatchesSettingsContract.refresh(host);
                            }
                        }
                    }));

            backendRows.add(new GboardPatchesSettingsContract.RadioRow(
                    "Private Inference (Astrea)",
                    "Private on-device inference via Astrea isolated execution environment.",
                    aiWritingToolsEnabled,
                    GboardAiWritingToolsSettings.BACKEND_PRIVATE_INFERENCE_ASTREA.equals(backendType),
                    () -> {
                        if (writingPrefs != null) {
                            GboardAiWritingToolsSettings.writeBackendType(writingPrefs,
                                    GboardAiWritingToolsSettings.BACKEND_PRIVATE_INFERENCE_ASTREA);
                            if (host != null) {
                                GboardPatchesSettingsContract.refresh(host);
                            }
                        }
                    }));

            sections.add(new GboardPatchesSettingsContract.Section(
                    GboardSettingsText.get(ctx, R.string.gboard_patches_ai_writing_tools_backend_type_title),
                    backendRows));
        }

        return new GboardPatchesSettingsContract.Screen(
                "Advanced settings",
                "Gboard Pro",
                "Advanced settings",
                "Gemini voice typing, writing tools & modular patches",
                Collections.emptyList(),
                sections,
                GboardPatchesSettingsContract.RefreshPolicy.none(),
                GboardPatchesSettingsContract.PanelStyle.FLAT);
    }

    private static void syncFrequentEmojiPrefToGboard(Context ctx, boolean enabled) {
        if (ctx == null) {
            return;
        }
        try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N && !ctx.isDeviceProtectedStorage()) {
                Context dpsContext = ctx.createDeviceProtectedStorageContext();
                if (dpsContext != null) {
                    SharedPreferences dpsPrefs = PreferenceManager.getDefaultSharedPreferences(dpsContext);
                    if (dpsPrefs != null) {
                        dpsPrefs.edit().putBoolean(GBOARD_PREF_KEY_FREQUENT_EMOJI_TAB, enabled).apply();
                    }
                }
            }
        } catch (Throwable ignored) {
        }
        try {
            SharedPreferences gboardPrefs = PreferenceManager.getDefaultSharedPreferences(ctx);
            if (gboardPrefs != null) {
                gboardPrefs.edit().putBoolean(GBOARD_PREF_KEY_FREQUENT_EMOJI_TAB, enabled).apply();
            }
        } catch (Throwable ignored) {
        }
    }
}
