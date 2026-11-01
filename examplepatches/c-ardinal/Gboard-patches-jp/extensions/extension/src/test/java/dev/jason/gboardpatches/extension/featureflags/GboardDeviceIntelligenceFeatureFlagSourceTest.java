package dev.jason.gboardpatches.extension.featureflags;

import org.junit.Assert;
import org.junit.Test;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;

public final class GboardDeviceIntelligenceFeatureFlagSourceTest {
    @Test
    public void runtimeMapsEnableDeviceIntelligenceToDedicatedFeatureMarker() throws Exception {
        String runtimeSource = new String(
                Files.readAllBytes(Path.of("src/main/java/dev/jason/gboardpatches/extension/"
                        + "featureflags/GboardFeatureFlagsRuntime.java")),
                StandardCharsets.UTF_8);
        String availabilitySource = new String(
                Files.readAllBytes(Path.of("src/main/java/dev/jason/gboardpatches/extension/settings/"
                        + "GboardPatchesFeatureAvailability.java")),
                StandardCharsets.UTF_8);

        Assert.assertTrue(runtimeSource.contains("FLAG_DEVICE_INTELLIGENCE"));
        Assert.assertTrue(runtimeSource.contains("\"enable_device_intelligence\""));
        Assert.assertTrue(runtimeSource.contains("FEATURE_DEVICE_INTELLIGENCE"));
        Assert.assertTrue(availabilitySource.contains("FEATURE_DEVICE_INTELLIGENCE"));
        Assert.assertTrue(availabilitySource.contains(
                "dev.jason.gboardpatches.feature.device_intelligence"));
    }
}
