package dev.jason.gboardpatches.extension.spacebarlogo;

import org.junit.Assert;
import org.junit.Test;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.charset.StandardCharsets;

public final class GboardSpacebarLogoSourceContractTest {
    private final Path root = Path.of(".").toAbsolutePath().normalize();

    @Test
    public void versionAdapterOwnsAll1777Symbols() throws Exception {
        String source = read(root.resolve(
                "src/main/java/dev/jason/gboardpatches/extension/spacebarlogo/" +
                        "GboardSpacebarLogo1777Runtime.java"));

        Assert.assertTrue(source.contains("ACTION_TYPE_CLASS = \"oth\""));
        Assert.assertTrue(source.contains("ACTION_DEF_CLASS = \"otk\""));
        Assert.assertTrue(source.contains("ACTION_ENTRY_CLASS = \"oud\""));
        Assert.assertTrue(source.contains("SPACEBAR_VIEW_ID = 0x7f0b05e0"));
        Assert.assertTrue(source.contains("PRIMARY_LABEL_VIEW_ID = 0x7f0b062a"));
        Assert.assertTrue(source.contains("GOOGLE_G_DRAWABLE_ID = 0x7f08045c"));
        Assert.assertTrue(source.contains("HEART_DRAWABLE_ID = 0x7f080448"));
        Assert.assertTrue(source.contains("EMOJI_DRAWABLE_ID = 0x7f080489"));
    }

    @Test
    public void productRuntimeIsVersionNeutralAndTracksWeakViews() throws Exception {
        String source = read(root.resolve(
                "src/main/java/dev/jason/gboardpatches/extension/spacebarlogo/" +
                        "GboardSpacebarLogoRuntime.java"));

        Assert.assertTrue(source.contains("WeakHashMap"));
        Assert.assertTrue(source.contains("IMPORTANT_FOR_ACCESSIBILITY_NO"));
        Assert.assertTrue(source.contains("setVisibility(View.INVISIBLE)"));
        Assert.assertFalse(source.contains("0x7f"));
        Assert.assertFalse(source.contains("Class.forName"));
    }

    @Test
    public void keyboardGroupKeepsGLogoFirst() throws Exception {
        String source = read(root.resolve(
                "src/main/java/dev/jason/gboardpatches/extension/keyboard/" +
                        "GboardKeyboardLayoutSettingsGroupFeature.java"));
        int list = source.indexOf("Arrays.asList(");
        int logo = source.indexOf("new GboardSpacebarLogoSettingsFeature", list);
        int next = source.indexOf("new GboardLatinGlobeKeyIgnoreIntervalSettingsFeature", list);

        Assert.assertTrue(logo > list);
        Assert.assertTrue(logo < next);
    }

    @Test
    public void featureDoesNotOwnSharedKeyboardPreview() throws Exception {
        Path featureRoot = root.resolve(
                "src/main/java/dev/jason/gboardpatches/extension/spacebarlogo");
        try (var files = Files.walk(featureRoot)) {
            for (Path file : files.filter(Files::isRegularFile).toList()) {
                Assert.assertFalse(read(file).contains("KeyboardPreview"));
            }
        }
    }

    @Test
    public void decoderAcceptsOnlyPressActionKeyCode62() throws Exception {
        Class<?> metadataClass = Class.forName("owd");
        Object space = metadataClass.getMethod("actionWithKeyCode", int.class, int.class)
                .invoke(null, 1, 62);
        Object enter = metadataClass.getMethod("actionWithKeyCode", int.class, int.class)
                .invoke(null, 1, 66);
        java.lang.reflect.Method resolver = GboardSpacebarLogo1777Runtime.class
                .getDeclaredMethod("decoder", ClassLoader.class);
        resolver.setAccessible(true);
        Object decoder = resolver.invoke(null, metadataClass.getClassLoader());
        java.lang.reflect.Method method = decoder.getClass()
                .getDeclaredMethod("isSpaceAction", Object.class);
        method.setAccessible(true);

        Assert.assertEquals(Boolean.TRUE, method.invoke(decoder, space));
        Assert.assertEquals(Boolean.FALSE, method.invoke(decoder, enter));
    }

    @Test
    public void incomingSpaceClassificationSurvivesReturnMetadataMutation() throws Exception {
        Class<?> metadataClass = Class.forName("owd");
        Object incomingSpace = metadataClass
                .getMethod("actionWithKeyCode", int.class, int.class)
                .invoke(null, 1, 62);
        Object mutatedReturnMetadata = metadataClass
                .getMethod("actionWithKeyCode", int.class, int.class)
                .invoke(null, 1, 66);
        Object receiver = new Object();

        GboardSpacebarLogo1777Runtime.class
                .getMethod("beforeSoftKeyBound", Object.class, Object.class)
                .invoke(null, receiver, incomingSpace);
        java.lang.reflect.Method resolver = GboardSpacebarLogo1777Runtime.class
                .getDeclaredMethod("resolveSpaceAction", Object.class, Object.class);
        resolver.setAccessible(true);

        Assert.assertEquals(Boolean.TRUE,
                resolver.invoke(null, receiver, mutatedReturnMetadata));
    }

    @Test
    public void runtimeAndDialogCallbacksFailClosedAtHostBoundaries() throws Exception {
        String adapter = read(root.resolve(
                "src/main/java/dev/jason/gboardpatches/extension/spacebarlogo/" +
                        "GboardSpacebarLogo1777Runtime.java"));
        String runtime = read(root.resolve(
                "src/main/java/dev/jason/gboardpatches/extension/spacebarlogo/" +
                        "GboardSpacebarLogoRuntime.java"));
        String dialogs = read(root.resolve(
                "src/main/java/dev/jason/gboardpatches/extension/spacebarlogo/" +
                        "GboardSpacebarLogoDialogs.java"));
        String picker = read(root.resolve(
                "src/main/java/dev/jason/gboardpatches/extension/spacebarlogo/" +
                        "GboardSpacebarLogoColorPickerView.java"));

        Assert.assertTrue(adapter.contains("restoreDisabledAppearanceSafely"));
        Assert.assertTrue(adapter.contains("forgetIncomingSpaceActionSafely"));
        Assert.assertTrue(runtime.contains("safeRestoreStockAppearance"));
        Assert.assertTrue(runtime.contains("Failed to refresh bound spacebar"));
        Assert.assertTrue(runtime.contains("softKeyView.post(() ->"));
        Assert.assertTrue(runtime.contains("refreshBoundSpacebarSafely"));
        Assert.assertTrue(runtime.contains("Failed to schedule bound spacebar refresh"));
        Assert.assertTrue(dialogs.contains("runSafely(\"handle icon selection\""));
        Assert.assertTrue(dialogs.contains("runSafely(\"save custom color\""));
        Assert.assertTrue(dialogs.contains("runSafely(\"dismiss spacebar logo dialog\""));
        Assert.assertTrue(picker.contains("Failed to handle color picker touch"));
        Assert.assertTrue(picker.contains("Failed to notify color picker listener"));
    }

    @Test
    public void dialogsKeepEqualTileHeightsAndAccessibleTouchTargets() throws Exception {
        String dialogs = read(root.resolve(
                "src/main/java/dev/jason/gboardpatches/extension/spacebarlogo/" +
                        "GboardSpacebarLogoDialogs.java"));
        String picker = read(root.resolve(
                "src/main/java/dev/jason/gboardpatches/extension/spacebarlogo/" +
                        "GboardSpacebarLogoColorPickerView.java"));

        Assert.assertTrue(dialogs.contains("ICON_TILE_HEIGHT_DP = 120"));
        Assert.assertTrue(dialogs.contains("COLOR_TILE_HEIGHT_DP = 136"));
        Assert.assertTrue(dialogs.contains("setSelected(selected)"));
        Assert.assertTrue(dialogs.contains("RippleDrawable"));
        Assert.assertTrue(picker.contains("hueHeight = dp(48)"));
    }

    private static String read(Path path) throws Exception {
        return new String(Files.readAllBytes(path), StandardCharsets.UTF_8);
    }
}
