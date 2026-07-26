package dev.jason.gboardpatches.extension.settings;

import org.junit.Assert;
import org.junit.Test;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.regex.Pattern;

public final class GboardSettingsTextFallbackSourceTest {
    private static final Pattern UNSAFE_STRING_LOOKUP = Pattern.compile(
            "GboardSettingsText\\.get\\(\\s*context\\s*,\\s*"
                    + "R\\.string\\.[A-Za-z0-9_]+\\s*\\)",
            Pattern.DOTALL);

    @Test
    public void newlyPortedSettingsFeaturesAlwaysProvideStableEnglishFallbacks()
            throws Exception {
        assertNoUnsafeStringLookup(
                "advancedvoice/GboardAdvancedVoiceSettingsFeature.java");
        assertNoUnsafeStringLookup(
                "longpressquickactions/GboardLongPressQuickActionsSettingsFeature.java");
        assertNoUnsafeStringLookup(
                "bluetoothmicrophone/GboardBluetoothMicrophoneSettingsFeature.java");
    }

    private static void assertNoUnsafeStringLookup(String relativePath) throws Exception {
        String source = new String(
                Files.readAllBytes(Path.of("src/main/java/dev/jason/gboardpatches/extension")
                        .resolve(relativePath)),
                StandardCharsets.UTF_8);
        Assert.assertFalse(
                relativePath + " must provide an English fallback for every settings string",
                UNSAFE_STRING_LOOKUP.matcher(source).find());
    }
}
