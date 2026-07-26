package dev.jason.gboardpatches.extension.zhuyinbottomrow;

import org.junit.Assert;
import org.junit.Test;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;

public final class GboardZhuyinBottomRowWeightRuntimeSourceTest {
    @Test
    public void runtimeSupportUsesExact1777MetadataContractWithoutBaselineFallback()
            throws Exception {
        String source = readRuntimeSupportSource();

        Assert.assertTrue(source.contains(
                "private static final String ACTION_TYPE_CLASS = \"oth\";"));
        Assert.assertTrue(source.contains(
                "private static final String ACTION_SET_CLASS = \"owd\";"));
        Assert.assertTrue(source.contains(
                "private static final String ACTION_DEF_CLASS = \"otk\";"));
        Assert.assertTrue(source.contains(
                "private static final String ACTION_DATA_CLASS = \"oud\";"));
        Assert.assertTrue(source.contains("softKeyViewClass.getDeclaredField(\"e\")"));
        Assert.assertTrue(source.contains("actionSetClass.getDeclaredField(\"g\")"));
        Assert.assertTrue(source.contains(
                "actionSetClass.getDeclaredMethod(\"h\", actionTypeClass)"));
        Assert.assertTrue(source.contains("actionDefClass.getDeclaredField(\"d\")"));
        Assert.assertTrue(source.contains("actionDataClass.getDeclaredField(\"e\")"));
        Assert.assertFalse(source.contains("\"nxi\""));
        Assert.assertFalse(source.contains("\"oaa\""));
        Assert.assertFalse(source.contains("\"nxl\""));
        Assert.assertFalse(source.contains("\"nyf\""));
        Assert.assertFalse(source.contains("getDeclaredField(\"n\")"));
        Assert.assertFalse(source.contains("getDeclaredMethod(\"a\", actionTypeClass)"));
    }

    @Test
    public void runtimeResolvesOriginalMetadataBeforeInspectingReceiverAndFooterLabels()
            throws Exception {
        String source = readRuntimeSource();

        Assert.assertTrue(source.contains(
                "resolveKeyMetadataForInterop(handles.softKeyMetadataField.get(softKeyView))"));
        Assert.assertTrue(source.contains(
                "resolveKeyMetadataForInterop(handles.softKeyMetadataField.get(keyView))"));
    }

    @Test
    public void runtimeValidatesAllLayoutParamsBeforeMutatingAnyWeight() throws Exception {
        String source = readRuntimeSource();

        Assert.assertTrue(source.contains(
                "LinearLayout.LayoutParams[] paramsByTarget = resolveLinearLayoutParams(weightTargets);"));
        Assert.assertTrue(source.contains("if (paramsByTarget == null) {"));
        Assert.assertTrue(source.contains(
                "private static LinearLayout.LayoutParams[] resolveLinearLayoutParams("));
    }

    private static String readRuntimeSource() throws Exception {
        return new String(
                Files.readAllBytes(
                        Path.of(
                                "src/main/java/dev/jason/gboardpatches/extension/"
                                        + "zhuyinbottomrow/GboardZhuyinBottomRowWeightRuntime.java")),
                StandardCharsets.UTF_8);
    }

    private static String readRuntimeSupportSource() throws Exception {
        return new String(
                Files.readAllBytes(
                        Path.of(
                                "src/main/java/dev/jason/gboardpatches/extension/"
                                        + "zhuyinbottomrow/"
                                        + "GboardZhuyinBottomRowWeightRuntimeSupport.java")),
                StandardCharsets.UTF_8);
    }
}
