package dev.jason.gboardpatches.extension.clipboard;

import org.junit.Assert;
import org.junit.Test;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;

public final class GboardClipboardWebFeatureSourceTest {
    @Test
    public void featureAvailabilityExposesDedicatedWebClipboardMarkerAndOrGate()
            throws Exception {
        String availabilitySource = new String(
                Files.readAllBytes(Path.of("src/main/java/dev/jason/gboardpatches/extension/settings/"
                        + "GboardPatchesFeatureAvailability.java")),
                StandardCharsets.UTF_8);

        Assert.assertTrue(availabilitySource.contains("FEATURE_WEB_CLIPBOARD"));
        Assert.assertTrue(availabilitySource.contains("public static boolean hasAnyFeature"));
    }

    @Test
    public void clipboardRootFeatureUsesFamilyOrGateAndWebClipboardSubpage() throws Exception {
        String clipboardFeatureSource = new String(
                Files.readAllBytes(Path.of("src/main/java/dev/jason/gboardpatches/extension/clipboard/settings/"
                        + "GboardClipboardSettingsFeature.java")),
                StandardCharsets.UTF_8);

        Assert.assertTrue(clipboardFeatureSource.contains("FEATURE_CLIPBOARD_ENHANCEMENTS"));
        Assert.assertTrue(clipboardFeatureSource.contains("FEATURE_WEB_CLIPBOARD"));
        Assert.assertTrue(clipboardFeatureSource.contains("hasAnyFeature("));
        Assert.assertTrue(clipboardFeatureSource.contains("GboardWebClipboardSettingsFeature"));
        Assert.assertTrue(clipboardFeatureSource.contains("host.openFeature(webClipboardFeature)"));
        Assert.assertFalse(
                "Web Clipboard rows should stay behind a dedicated subpage entry",
                clipboardFeatureSource.contains("rows.addAll(webClipboardFeature.buildScreen("));
    }

    @Test
    public void settingsRegistryKeepsSingleClipboardRootEntry() throws Exception {
        String registrySource = new String(
                Files.readAllBytes(Path.of("src/main/java/dev/jason/gboardpatches/extension/settings/"
                        + "GboardPatchesSettingsFeatureRegistry.java")),
                StandardCharsets.UTF_8);

        Assert.assertTrue(registrySource.contains("new GboardClipboardSettingsFeature()"));
        Assert.assertFalse(
                "Web Clipboard should not be registered as a second root feature",
                registrySource.contains("new GboardWebClipboardSettingsFeature()"));
    }
}
