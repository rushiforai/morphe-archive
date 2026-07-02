package dev.jason.gboardpatches.extension.zhuyinbottomrow;

import org.junit.Assert;
import org.junit.Test;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;

public final class GboardZhuyinBottomRowWeightRuntimeSourceTest {
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
}
