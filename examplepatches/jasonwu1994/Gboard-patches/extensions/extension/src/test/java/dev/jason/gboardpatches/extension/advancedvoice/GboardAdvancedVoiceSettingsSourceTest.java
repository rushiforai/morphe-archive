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
        Assert.assertTrue(feature.contains("openExternalUrl(context, APKMIRROR_DOWNLOAD_URL)"));
        Assert.assertTrue(feature.contains("17-7-7-932364120-release-arm64-v8a"));
        Assert.assertTrue(availability.contains("FEATURE_ADVANCED_VOICE_TYPING"));
        Assert.assertTrue(availability.contains(
                "dev.jason.gboardpatches.feature.advanced_voice_typing"));

        Assert.assertTrue(english.contains("Advanced Voice Typing"));
        Assert.assertTrue(english.contains(
                "Automatically Add Punctuation to Chinese Input"));
        Assert.assertTrue(english.contains(
                "Voice typing -&gt; Advanced features、 Add punctuation"));
        Assert.assertTrue(english.contains("Dictation payload detected"));
        Assert.assertTrue(english.contains("Dictation payload not detected"));
        Assert.assertTrue(english.contains("Unable to verify Dictation payload"));
        Assert.assertTrue(traditionalChinese.contains("進階語音輸入"));
        Assert.assertTrue(traditionalChinese.contains("中文輸入自動添加標點符號"));
        Assert.assertTrue(traditionalChinese.contains("已偵測到 Dictation payload"));
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
