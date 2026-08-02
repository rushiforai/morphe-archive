package dev.jason.gboardpatches.extension.advancedvoice;

import org.junit.Assert;
import org.junit.Test;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;

public final class GboardAdvancedVoiceSettingsSourceTest {
    @Test
    public void settingsFeaturePreservesAcceptedRowsGuidanceAndLocalization()
            throws Exception {
        Path root = repositoryRoot();
        String feature = read(root,
                "extensions/extension/src/main/java/dev/jason/gboardpatches/extension/"
                        + "advancedvoice/GboardAdvancedVoiceSettingsFeature.java");
        String keyboardGroup = read(root,
                "extensions/extension/src/main/java/dev/jason/gboardpatches/extension/"
                        + "keyboard/GboardKeyboardSettingsGroupFeature.java");
        String availability = read(root,
                "extensions/extension/src/main/java/dev/jason/gboardpatches/extension/"
                        + "settings/GboardPatchesFeatureAvailability.java");
        String english = read(root,
                "extensions/extension/src/main/res/values/gboard_settings_strings.xml");
        String traditionalChinese = read(root,
                "extensions/extension/src/main/res/values-b+zh+Hant/"
                        + "gboard_settings_strings.xml");

        Assert.assertTrue(keyboardGroup.contains(
                "new GboardAdvancedVoiceSettingsFeature(context)"));
        Assert.assertEquals(2, count(feature,
                "new GboardPatchesSettingsContract.ToggleRow("));
        Assert.assertTrue(feature.contains(
                "new GboardPatchesSettingsContract.DetailRow("));
        Assert.assertTrue(feature.contains(
                "new GboardPatchesSettingsContract.CommandRow("));
        Assert.assertTrue(feature.contains("GboardDictationPayloadDetector.detect("));
        Assert.assertTrue(feature.contains("targetPackageNames(context)"));
        Assert.assertTrue(feature.contains("host.openExternalUrl(APKMIRROR_DOWNLOAD_URL)"));
        Assert.assertTrue(feature.contains("GboardSpeechServicesDetector.detect(context)"));
        Assert.assertTrue(feature.contains("host.getOfflineSpeechLanguages()"));
        Assert.assertTrue(feature.contains("public boolean requiresOfflineSpeechLanguages()"));
        Assert.assertTrue(feature.contains("GboardOfflineSpeechLanguageFormatter.format("));
        Assert.assertTrue(feature.contains("Build.VERSION.SDK_INT >= Build.VERSION_CODES.N"));
        Assert.assertTrue(feature.contains("configuration.locale"));
        Assert.assertTrue(feature.contains("host.openSpeechRecognitionAndSynthesisStoreListing()"));
        Assert.assertTrue(feature.contains("host.openLiveTranscribeLanguageManager()"));
        Assert.assertTrue(feature.contains("sectionOfflineSpeechModel"));
        Assert.assertTrue(feature.contains("sectionSupportedLanguages"));
        Assert.assertTrue(feature.contains("ADVANCED_VOICE_GITHUB_URL"));
        Assert.assertTrue(feature.contains("() -> host.openExternalUrl(ADVANCED_VOICE_GITHUB_URL)"));
        Assert.assertTrue(feature.matches(
                "(?s).*new GboardPatchesSettingsContract\\.Section\\("
                        + "\\s*null,\\s*githubStarRows\\).*"));
        Assert.assertTrue(feature.contains("17-7-7-932364120-release-arm64-v8a"));
        Assert.assertTrue(availability.contains("FEATURE_ADVANCED_VOICE_TYPING"));
        Assert.assertTrue(availability.contains(
                "dev.jason.gboardpatches.feature.advanced_voice_typing"));

        Assert.assertTrue(english.contains("Advanced Voice Typing"));
        Assert.assertTrue(english.contains(
                "Automatically Add Punctuation to Chinese Input"));
        Assert.assertTrue(english.contains(
                "Voice typing -&gt; Advanced features、 Add punctuation"));
        Assert.assertTrue(english.contains("Dictation payload (Installed)"));
        Assert.assertTrue(english.contains("Dictation payload (Not installed)"));
        Assert.assertTrue(english.contains("Dictation payload (Unable to verify)"));
        Assert.assertTrue(english.contains("Offline speech model"));
        Assert.assertTrue(english.contains("Speech Recognition &amp; Synthesis (Installed)"));
        Assert.assertTrue(english.contains("Downloaded offline languages"));
        Assert.assertTrue(english.contains("Manage languages with Live Transcribe"));
        Assert.assertTrue(english.contains("Tap to open Live Transcribe."));
        Assert.assertTrue(english.contains("Only en-US supports the complete feature set."));
        Assert.assertTrue(english.contains("English en-AU, en-CA, en-GB, en-IE, en-IN, en-SG, en-US"));
        Assert.assertTrue(english.contains("Support this project on GitHub 😊"));
        Assert.assertTrue(traditionalChinese.contains("進階語音輸入"));
        Assert.assertTrue(traditionalChinese.contains("中文輸入自動添加標點符號"));
        Assert.assertTrue(traditionalChinese.contains("Dictation payload（已安裝）"));
        Assert.assertTrue(traditionalChinese.contains("離線語音模型"));
        Assert.assertTrue(traditionalChinese.contains("Speech Recognition &amp; Synthesis（已安裝）"));
        Assert.assertTrue(traditionalChinese.contains("點擊即可開啟即時轉錄。"));
        Assert.assertTrue(traditionalChinese.contains("只有 en-US 可以支援完整功能"));
        Assert.assertTrue(traditionalChinese.contains("在 GitHub 上支持這個專案 😊"));
    }

    private static int count(String source, String needle) {
        int result = 0;
        int offset = 0;
        while ((offset = source.indexOf(needle, offset)) >= 0) {
            result++;
            offset += needle.length();
        }
        return result;
    }

    private static String read(Path root, String relativePath) throws Exception {
        return new String(
                Files.readAllBytes(root.resolve(relativePath)),
                StandardCharsets.UTF_8);
    }

    private static Path repositoryRoot() {
        Path current = Path.of("").toAbsolutePath().normalize();
        while (current != null) {
            if (Files.isRegularFile(current.resolve("settings.gradle.kts"))) {
                return current;
            }
            current = current.getParent();
        }
        throw new IllegalStateException("Could not locate repository root");
    }
}
