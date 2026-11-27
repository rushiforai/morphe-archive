package dev.jason.gboardpatches.extension.toprowswipe;

import org.junit.Assert;
import org.junit.Test;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;

public final class GboardTopRowSwipeDialogSafetySourceTest {
    @Test
    public void settingsFeatureWrapsDialogAndClipboardCallbacks() throws Exception {
        String source = readSource(
                "src/main/java/dev/jason/gboardpatches/extension/toprowswipe/"
                        + "GboardTopRowSwipeSettingsFeature.java");

        Assert.assertTrue(source.contains("private static void runUiActionSafely("));
        Assert.assertTrue(source.contains("runUiActionSafely(activity, \"show global JavaScript dialog\"")
                || source.contains("\"show global JavaScript dialog\""));
        Assert.assertTrue(source.contains("\"save global JavaScript\""));
        Assert.assertTrue(source.contains("\"show JavaScript runtime limits dialog\""));
        Assert.assertTrue(source.contains("\"save JavaScript runtime limits\""));
        Assert.assertTrue(source.contains("\"copy JavaScript example\""));
    }

    @Test
    public void slotEditorWrapsOnShowAndEditorCallbacks() throws Exception {
        String source = readSource(
                "src/main/java/dev/jason/gboardpatches/extension/toprowswipe/"
                        + "GboardTopRowSwipeSlotEditorDialog.java");

        Assert.assertTrue(source.contains("private static void runUiActionSafely("));
        Assert.assertTrue(source.contains("\"show slot editor dialog\""));
        Assert.assertTrue(source.contains("scriptLockButton.setOnClickListener(view -> runUiActionSafely(")
                || source.contains("scriptLockButton.setOnClickListener(view -> runUiActionSafely("));
        Assert.assertTrue(source.contains("testButton.setOnClickListener(view -> runUiActionSafely(")
                || source.contains("testButton.setOnClickListener(view -> runUiActionSafely("));
    }

    private static String readSource(String path) throws Exception {
        return new String(Files.readAllBytes(Path.of(path)), StandardCharsets.UTF_8);
    }
}
