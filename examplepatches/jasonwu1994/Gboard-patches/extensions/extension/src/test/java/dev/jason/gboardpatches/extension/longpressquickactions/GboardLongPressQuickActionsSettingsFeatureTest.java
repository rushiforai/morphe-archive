package dev.jason.gboardpatches.extension.longpressquickactions;

import org.junit.Assert;
import org.junit.Test;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.atomic.AtomicReference;

import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;

public final class GboardLongPressQuickActionsSettingsFeatureTest {
    @Test
    public void screenContainsOneToggleAndSixExactMappingRows() {
        GboardLongPressQuickActionsSettingsFeature feature = testFeature();

        GboardPatchesSettingsContract.Screen screen = feature.buildScreenForState(
                false,
                value -> { });

        Assert.assertEquals("Long-Press Editing Shortcuts", screen.getToolbarTitle());
        Assert.assertEquals(2, screen.getSections().size());
        Assert.assertEquals("Feature", screen.getSections().get(0).getTitle());
        Assert.assertEquals(1, screen.getSections().get(0).getItems().size());
        Assert.assertTrue(screen.getSections().get(0).getItems().get(0)
                instanceof GboardPatchesSettingsContract.ToggleRow);
        GboardPatchesSettingsContract.ToggleRow toggle =
                (GboardPatchesSettingsContract.ToggleRow)
                        screen.getSections().get(0).getItems().get(0);
        Assert.assertEquals("Enable Long-Press Editing Shortcuts", toggle.getTitle());
        Assert.assertFalse(toggle.isChecked());
        Assert.assertNotNull(toggle.getPreviewSpec());
        Assert.assertEquals("Long-Press Editing Shortcuts", toggle.getPreviewSpec().getTitle());
        Assert.assertEquals(GboardPatchesSettingsContract.PreviewLayout.STACKED,
                toggle.getPreviewSpec().getLayout());
        Assert.assertEquals(1, toggle.getPreviewSpec().getMediaItems().size());
        Assert.assertTrue(toggle.getPreviewSpec().getMediaItems().get(0)
                instanceof GboardPatchesSettingsContract.PreviewVideo);
        GboardPatchesSettingsContract.PreviewVideo previewVideo =
                (GboardPatchesSettingsContract.PreviewVideo)
                        toggle.getPreviewSpec().getMediaItems().get(0);
        Assert.assertEquals(
                "settings-previews/keyboard/"
                        + "gboard_long_press_quick_actions_enabled_preview.mp4",
                previewVideo.getAssetPath());
        Assert.assertEquals("", previewVideo.getCaption());

        Assert.assertEquals("Mappings", screen.getSections().get(1).getTitle());
        Assert.assertEquals(6, screen.getSections().get(1).getItems().size());
        assertMapping(screen, 0, "A", "Select all");
        assertMapping(screen, 1, "Z", "Undo");
        assertMapping(screen, 2, "C", "Copy");
        assertMapping(screen, 3, "X", "Cut");
        assertMapping(screen, 4, "V", "Paste");
        assertMapping(screen, 5, "Y", "Redo");
    }

    @Test
    public void toggleForwardsRequestedEnabledState() {
        AtomicReference<Boolean> requested = new AtomicReference<>();
        GboardPatchesSettingsContract.Screen screen = testFeature().buildScreenForState(
                true,
                requested::set);
        GboardPatchesSettingsContract.ToggleRow toggle =
                (GboardPatchesSettingsContract.ToggleRow)
                        screen.getSections().get(0).getItems().get(0);

        toggle.getToggleAction().accept(false);

        Assert.assertEquals(Boolean.FALSE, requested.get());
    }

    @Test
    public void enabledPreviewVideoAssetExists() {
        Assert.assertTrue(Files.exists(Path.of(
                "..", "..", "patches", "src", "main", "resources",
                "settings-previews", "keyboard",
                "gboard_long_press_quick_actions_enabled_preview.mp4")));
    }

    @Test
    public void localizedResourcesUsePublishedPatchName() throws Exception {
        Path root = repositoryRoot();
        String english = new String(Files.readAllBytes(root.resolve(
                "extensions/extension/src/main/res/values/gboard_settings_strings.xml")),
                StandardCharsets.UTF_8);
        String traditionalChinese = new String(Files.readAllBytes(root.resolve(
                "extensions/extension/src/main/res/values-b+zh+Hant/"
                        + "gboard_settings_strings.xml")), StandardCharsets.UTF_8);

        Assert.assertTrue(english.contains(
                ">Long-Press Editing Shortcuts</string>"));
        Assert.assertTrue(english.contains(
                ">Enable Long-Press Editing Shortcuts</string>"));
        Assert.assertTrue(traditionalChinese.contains(
                ">長按編輯快捷鍵</string>"));
        Assert.assertTrue(traditionalChinese.contains(
                ">啟用長按編輯快捷鍵</string>"));
    }

    private static GboardLongPressQuickActionsSettingsFeature testFeature() {
        return new GboardLongPressQuickActionsSettingsFeature(
                "Long-Press Editing Shortcuts",
                "Adds editing shortcuts to English and Zhuyin letter keys.",
                "Patch",
                "Long-Press Editing Shortcuts unavailable",
                "Reopen Gboard settings and try again.",
                "Enable Long-Press Editing Shortcuts",
                "Reopen the keyboard or switch layouts to fully apply changes.",
                "Feature",
                "Mappings",
                new String[] {"Select all", "Undo", "Copy", "Cut", "Paste", "Redo"});
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

    private static void assertMapping(GboardPatchesSettingsContract.Screen screen,
            int index, String title, String summary) {
        GboardPatchesSettingsContract.Row row =
                screen.getSections().get(1).getItems().get(index);
        Assert.assertTrue(row instanceof GboardPatchesSettingsContract.InfoRow);
        Assert.assertEquals(title, row.getTitle());
        Assert.assertEquals(summary, row.getSummary());
    }
}
