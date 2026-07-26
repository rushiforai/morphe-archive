package dev.jason.gboardpatches.extension.developeroptions;

import android.content.Context;

import org.junit.Assert;
import org.junit.Test;

import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;

import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;

public final class GboardDeveloperOptionsSettingsFeatureTest {
    @Test
    public void rootEntryIsDirectAndRequestsOnlyThe1777HeaderId() throws Exception {
        Path sourcePath = Path.of(
                "src/main/java/dev/jason/gboardpatches/extension/developeroptions/"
                        + "GboardDeveloperOptionsSettingsFeature.java");
        Assert.assertTrue("Developer options settings feature missing",
                Files.isRegularFile(sourcePath));

        Class<?> featureClass = Class.forName(
                "dev.jason.gboardpatches.extension.developeroptions."
                        + "GboardDeveloperOptionsSettingsFeature");
        Constructor<?> constructor = featureClass.getDeclaredConstructor(
                String.class, String.class);
        constructor.setAccessible(true);
        Object feature = constructor.newInstance(
                "Developer options", "Open Developer options and the Flag Editor.");

        AtomicInteger openedHeader = new AtomicInteger();
        AtomicBoolean openedIntermediateFeature = new AtomicBoolean(false);
        GboardPatchesSettingsContract.Host host =
                (GboardPatchesSettingsContract.Host) Proxy.newProxyInstance(
                        getClass().getClassLoader(),
                        new Class<?>[] { GboardPatchesSettingsContract.Host.class },
                        (proxy, method, args) -> {
                            if ("openTargetSettingsHeader".equals(method.getName())) {
                                openedHeader.set(((Integer) args[0]).intValue());
                            } else if ("openFeature".equals(method.getName())) {
                                openedIntermediateFeature.set(true);
                            }
                            return defaultValue(method.getReturnType());
                        });

        Method openRootEntry = featureClass.getMethod(
                "openRootEntry", GboardPatchesSettingsContract.Host.class);
        openRootEntry.invoke(feature, host);

        Assert.assertEquals(0x7f140abe, openedHeader.get());
        Assert.assertFalse(openedIntermediateFeature.get());
    }

    @Test
    public void sourceContainsNoLegacyFragmentOrVersionFallback() throws Exception {
        String featureSource = readSource(
                "src/main/java/dev/jason/gboardpatches/extension/developeroptions/"
                        + "GboardDeveloperOptionsSettingsFeature.java");
        String activitySource = readSource(
                "src/main/java/dev/jason/gboardpatches/extension/settings/"
                        + "GboardPatchesSettingsActivity.java");

        Assert.assertFalse(featureSource.contains("DeveloperSettingsFragment"));
        Assert.assertFalse(featureSource.contains(":android:show_fragment"));
        Assert.assertTrue(featureSource.contains(
                "Open Developer options and the Flag Editor."));
        Assert.assertFalse(featureSource.contains(
                "Open Gboard's official Developer options page."));
        Assert.assertFalse(activitySource.contains("DeveloperSettingsFragment"));
        Assert.assertFalse(activitySource.contains(":android:show_fragment"));
        Assert.assertFalse(activitySource.contains("17.0.10"));
        Assert.assertFalse(activitySource.contains("versionName.startsWith("));
        Assert.assertTrue(activitySource.contains(
                "17.7.7.932364120-release-arm64-v8a"));
    }

    @Test
    public void versionSupportRequiresExactFull1777ReleaseName() throws Exception {
        String activityClassName =
                "dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsActivity";
        Method versionCheck = Class.forName(activityClassName).getDeclaredMethod(
                "isSupportedDeveloperOptionsTargetVersion", String.class);
        versionCheck.setAccessible(true);

        Assert.assertEquals(Boolean.TRUE, versionCheck.invoke(
                null, "17.7.7.932364120-release-arm64-v8a"));
        Assert.assertEquals(Boolean.FALSE, versionCheck.invoke(null, "17.7.7"));
        Assert.assertEquals(Boolean.FALSE, versionCheck.invoke(
                null, "17.7.7.932364120-release-arm64-v8a-debug"));
        Assert.assertEquals(Boolean.FALSE, versionCheck.invoke(
                null, "17.0.10.880768217-release-arm64-v8a"));
        Assert.assertEquals(Boolean.FALSE, versionCheck.invoke(null, new Object[] { null }));
    }

    private static String readSource(String path) throws Exception {
        Path sourcePath = Path.of(path);
        Assert.assertTrue("Missing source: " + path, Files.isRegularFile(sourcePath));
        return new String(Files.readAllBytes(sourcePath), StandardCharsets.UTF_8);
    }

    private static Object defaultValue(Class<?> returnType) {
        if (!returnType.isPrimitive()) {
            return null;
        }
        if (returnType == boolean.class) {
            return Boolean.FALSE;
        }
        if (returnType == char.class) {
            return Character.valueOf('\0');
        }
        if (returnType == byte.class) {
            return Byte.valueOf((byte) 0);
        }
        if (returnType == short.class) {
            return Short.valueOf((short) 0);
        }
        if (returnType == int.class) {
            return Integer.valueOf(0);
        }
        if (returnType == long.class) {
            return Long.valueOf(0L);
        }
        if (returnType == float.class) {
            return Float.valueOf(0f);
        }
        if (returnType == double.class) {
            return Double.valueOf(0d);
        }
        return null;
    }
}
