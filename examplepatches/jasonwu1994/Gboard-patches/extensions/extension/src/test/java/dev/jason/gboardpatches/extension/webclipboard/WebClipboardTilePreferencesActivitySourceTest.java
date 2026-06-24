package dev.jason.gboardpatches.extension.webclipboard;

import org.junit.Assert;
import org.junit.Test;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;

public final class WebClipboardTilePreferencesActivitySourceTest {
    @Test
    public void dedicatedTilePreferencesActivityForwardsIntoInternalSettingsRoot()
            throws Exception {
        String activitySource = new String(
                Files.readAllBytes(Path.of(
                        "src/main/java/dev/jason/gboardpatches/extension/webclipboard/"
                                + "WebClipboardTilePreferencesActivity.java")),
                StandardCharsets.UTF_8);

        Assert.assertTrue(activitySource.contains("extends Activity"));
        Assert.assertTrue(activitySource.contains(
                "GboardPatchesSettingsActivity.createWebClipboardSettingsIntent"));
        Assert.assertTrue(activitySource.contains("startActivity("));
        Assert.assertTrue(activitySource.contains("finish();"));
    }

    @Test
    public void sharedSettingsActivityExposesInternalWebClipboardIntentBuilder() throws Exception {
        String settingsSource = new String(
                Files.readAllBytes(Path.of(
                        "src/main/java/dev/jason/gboardpatches/extension/settings/"
                                + "GboardPatchesSettingsActivity.java")),
                StandardCharsets.UTF_8);

        Assert.assertTrue(settingsSource.contains("createWebClipboardSettingsIntent("));
        Assert.assertTrue(settingsSource.contains("EXTRA_OPEN_WEB_CLIPBOARD"));
    }
}
