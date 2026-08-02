package dev.jason.gboardpatches.extension.settings;

import org.junit.Assert;
import org.junit.Test;

import dev.jason.gboardpatches.extension.R;

public final class GboardSettingsTextTest {
    @Test
    public void stableCopyReturnsTraditionalChineseForKnownShellStrings() {
        Assert.assertEquals(
                "Patch 設定",
                GboardSettingsText.resolveStableTextForTesting(
                        R.string.gboard_patches_header_title,
                        "zh-Hant",
                        "Patch settings"));
        Assert.assertEquals(
                "偏好",
                GboardSettingsText.resolveStableTextForTesting(
                        R.string.gboard_patches_section_preferences,
                        "zh-Hant",
                        "Preferences"));
        Assert.assertEquals(
                "語言",
                GboardSettingsText.resolveStableTextForTesting(
                        R.string.gboard_patches_language_title,
                        "zh-Hant",
                        "Language"));
    }

    @Test
    public void stableCopyFallsBackToEnglishForKnownStringsOutsideTraditionalChinese() {
        Assert.assertEquals(
                "Patch settings",
                GboardSettingsText.resolveStableTextForTesting(
                        R.string.gboard_patches_header_title,
                        "en",
                        "Patch settings"));
        Assert.assertEquals(
                "Current",
                GboardSettingsText.resolveStableTextForTesting(
                        R.string.gboard_patches_current_value_label,
                        "en",
                        "Current"));
        Assert.assertEquals(
                "Preview",
                GboardSettingsText.resolveStableTextForTesting(
                        R.string.gboard_patches_preview_label,
                        "en",
                        "Preview"));
    }

    @Test
    public void stableCopyOwnsBluetoothMicrophoneStringsInsteadOfTargetResourceIds() {
        Assert.assertEquals(
                "使用藍芽麥克風",
                GboardSettingsText.resolveStableTextForTesting(
                        R.string.gboard_patches_bluetooth_microphone_title,
                        "zh-Hant",
                        "Use Bluetooth microphone"));
        Assert.assertEquals(
                "語音輸入->使用藍芽麥克風",
                GboardSettingsText.resolveStableTextForTesting(
                        R.string.gboard_patches_bluetooth_microphone_summary,
                        "zh-Hant",
                        "Voice typing -> Use Bluetooth microphone"));
        Assert.assertEquals(
                "Use Bluetooth microphone",
                GboardSettingsText.resolveStableTextForTesting(
                        R.string.gboard_patches_bluetooth_microphone_title,
                        "en",
                        "Use Bluetooth microphone"));
        Assert.assertEquals(
                "Behavior",
                GboardSettingsText.resolveStableTextForTesting(
                        R.string.gboard_patches_bluetooth_microphone_section_behavior,
                        "en",
                        "Behavior"));
    }

    @Test
    public void stableCopyFormatsLanguageAndLatinGlobeValues() {
        Assert.assertEquals(
                "跟隨系統（繁體中文）",
                GboardSettingsText.resolveStableTextForTesting(
                        R.string.gboard_patches_language_system_value,
                        "zh-Hant",
                        "System default (%1$s)",
                        "繁體中文"));
        Assert.assertEquals(
                "500 ms（預設）",
                GboardSettingsText.resolveStableTextForTesting(
                        R.string.gboard_patches_latin_globe_interval_value_default,
                        "zh-Hant",
                        "%1$d ms (Default)",
                        500));
        Assert.assertEquals(
                "500 ms (Default)",
                GboardSettingsText.resolveStableTextForTesting(
                        R.string.gboard_patches_latin_globe_interval_value_default,
                        "en",
                        "%1$d ms (Default)",
                        500));
    }

    @Test
    public void stableCopyReturnsTraditionalChineseForClipboardAndSettingsHomepageStrings() {
        Assert.assertEquals(
                "開發人員選項",
                GboardSettingsText.resolveStableTextForTesting(
                        R.string.gboard_patches_developer_options_title,
                        "zh-Hant",
                        "Developer options"));
        Assert.assertEquals(
                "開啟 開發人員選項 與 Flag 編輯器。",
                GboardSettingsText.resolveStableTextForTesting(
                        R.string.gboard_patches_developer_options_summary,
                        "zh-Hant",
                        "Open Developer options and the Flag Editor."));
        Assert.assertEquals(
                "剪貼簿",
                GboardSettingsText.resolveStableTextForTesting(
                        R.string.gboard_patches_clipboard_title,
                        "zh-Hant",
                        "Clipboard"));
        Assert.assertEquals(
                "網頁剪貼簿",
                GboardSettingsText.resolveStableTextForTesting(
                        R.string.gboard_patches_web_clipboard_title,
                        "zh-Hant",
                        "Web Clipboard"));
        Assert.assertEquals(
                "設定樣式",
                GboardSettingsText.resolveStableTextForTesting(
                        R.string.gboard_patches_settings_homepage_title,
                        "zh-Hant",
                        "Settings Style"));
        Assert.assertEquals(
                "表情符號、貼圖與 GIF 分頁順序",
                GboardSettingsText.resolveStableTextForTesting(
                        R.string.gboard_patches_symbol_footer_title,
                        "zh-Hant",
                        "Emojis, stickers & GIFs Tab Order"));
        Assert.assertEquals(
                "貼圖",
                GboardSettingsText.resolveStableTextForTesting(
                        R.string.gboard_patches_symbol_tab_sticker,
                        "zh-Hant",
                        "Sticker"));
        Assert.assertEquals(
                "AI 撰寫工具",
                GboardSettingsText.resolveStableTextForTesting(
                        R.string.gboard_patches_ai_writing_tools_title,
                        "zh-Hant",
                        "AI Writing Tools"));
        Assert.assertEquals(
                "控制 Gboard AI 撰寫工具的可用性、鍵盤支援與後端路由。",
                GboardSettingsText.resolveStableTextForTesting(
                        R.string.gboard_patches_ai_writing_tools_summary,
                        "zh-Hant",
                        "Controls Gboard AI Writing Tools availability, keyboard support, and backend routing."));
        Assert.assertEquals(
                "支援所有鍵盤",
                GboardSettingsText.resolveStableTextForTesting(
                        R.string.gboard_patches_ai_writing_tools_all_keyboards_title,
                        "zh-Hant",
                        "Support All Keyboards"));
        Assert.assertEquals(
                "啟用 AI 撰寫工具",
                GboardSettingsText.resolveStableTextForTesting(
                        R.string.gboard_patches_ai_writing_tools_enabled_title,
                        "zh-Hant",
                        "Enable AI Writing Tools"));
        Assert.assertEquals(
                "強制顯示 修正和建議 -> 撰寫工具 中的2個開關。",
                GboardSettingsText.resolveStableTextForTesting(
                        R.string.gboard_patches_ai_writing_tools_enabled_summary,
                        "zh-Hant",
                        "Force-show the two switches under Corrections & suggestions -> Writing tools."));
        Assert.assertEquals(
                "開啟後，會強制把撰寫工具在所有鍵盤生效。需要強制停止並重新啟動 Gboard 才會生效。",
                GboardSettingsText.resolveStableTextForTesting(
                        R.string.gboard_patches_ai_writing_tools_all_keyboards_summary,
                        "zh-Hant",
                        "When enabled, force writing tools to work on every keyboard. Force-stop and restart Gboard for the change to take effect."));
        Assert.assertEquals(
                "後端類型",
                GboardSettingsText.resolveStableTextForTesting(
                        R.string.gboard_patches_ai_writing_tools_backend_type_title,
                        "zh-Hant",
                        "Backend type"));
        Assert.assertEquals(
                "變更後端後，需要強制停止並重新啟動 Gboard 才會生效。如果選擇 AICORE，需要有資格才能下載模型。",
                GboardSettingsText.resolveStableTextForTesting(
                        R.string.gboard_patches_ai_writing_tools_backend_type_summary,
                        "zh-Hant",
                        "Force-stop and restart Gboard after changing the backend. If you select "
                                + "AICORE, you must be eligible to download the model."));
    }

    @Test
    public void advancedVoiceInformationalRowsNeverFallThroughToTargetResourceIds() {
        int[] resourceIds = {
                R.string.gboard_patches_advanced_voice_section_offline_speech_model,
                R.string.gboard_patches_advanced_voice_section_supported_languages,
                R.string.gboard_patches_advanced_voice_supported_languages_title,
                R.string.gboard_patches_advanced_voice_supported_languages_summary,
                R.string.gboard_patches_advanced_voice_github_star_title,
                R.string.gboard_patches_advanced_voice_github_star_summary,
                R.string.gboard_patches_advanced_voice_speech_services_present_title,
                R.string.gboard_patches_advanced_voice_speech_services_absent_title,
                R.string.gboard_patches_advanced_voice_speech_services_unknown_title,
                R.string.gboard_patches_advanced_voice_speech_services_status_summary,
                R.string.gboard_patches_advanced_voice_downloaded_languages_title,
                R.string.gboard_patches_advanced_voice_downloaded_languages_loading_summary,
                R.string.gboard_patches_advanced_voice_downloaded_languages_empty_summary,
                R.string.gboard_patches_advanced_voice_downloaded_languages_unsupported_summary,
                R.string.gboard_patches_advanced_voice_downloaded_languages_unavailable_summary,
                R.string.gboard_patches_advanced_voice_downloaded_languages_error_summary,
                R.string.gboard_patches_advanced_voice_downloaded_languages_separator,
                R.string.gboard_patches_advanced_voice_live_transcribe_manage_title,
                R.string.gboard_patches_advanced_voice_live_transcribe_manage_summary,
                R.string.gboard_patches_advanced_voice_speech_services_open_failed,
                R.string.gboard_patches_advanced_voice_live_transcribe_open_failed,
        };
        for (int resourceId : resourceIds) {
            String fallback = "fallback-" + resourceId;
            Assert.assertEquals(
                    fallback,
                    GboardSettingsText.resolveStableTextForTesting(
                            resourceId,
                            "en",
                            fallback));
        }

        Assert.assertEquals(
                "離線語音模型",
                GboardSettingsText.resolveStableTextForTesting(
                        R.string.gboard_patches_advanced_voice_section_offline_speech_model,
                        "zh-Hant",
                        "Offline speech model"));
        Assert.assertEquals(
                "支援的語言",
                GboardSettingsText.resolveStableTextForTesting(
                        R.string.gboard_patches_advanced_voice_section_supported_languages,
                        "zh-Hant",
                        "Supported languages"));
        Assert.assertEquals(
                "在 GitHub 上支持這個專案 😊",
                GboardSettingsText.resolveStableTextForTesting(
                        R.string.gboard_patches_advanced_voice_github_star_title,
                        "zh-Hant",
                        "Support this project on GitHub 😊"));
        Assert.assertEquals(
                "無法開啟 Speech Recognition & Synthesis 的 Google Play 頁面。",
                GboardSettingsText.resolveStableTextForTesting(
                        R.string.gboard_patches_advanced_voice_speech_services_open_failed,
                        "zh-Hant",
                        "Unable to open Speech Recognition & Synthesis in Google Play."));
        Assert.assertEquals(
                "無法開啟即時轉錄或其 Google Play 頁面。",
                GboardSettingsText.resolveStableTextForTesting(
                        R.string.gboard_patches_advanced_voice_live_transcribe_open_failed,
                        "zh-Hant",
                        "Unable to open Live Transcribe or its Google Play page."));
    }
}
