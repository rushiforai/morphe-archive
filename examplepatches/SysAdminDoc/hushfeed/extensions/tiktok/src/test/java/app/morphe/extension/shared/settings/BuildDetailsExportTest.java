package app.morphe.extension.shared.settings;

import static org.junit.Assert.*;
import android.content.ClipboardManager;
import android.content.Context;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.BuildDetails;
import app.morphe.extension.shared.diagnostics.BuildDetailsTest;
import app.morphe.extension.shared.diagnostics.DiagnosticCategory;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.preference.LogBufferManager;
import app.morphe.extension.tiktok.BuildDetailsFixture;
import app.morphe.extension.tiktok.SettingsContextRule;
import app.morphe.extension.tiktok.settings.SettingsBackup;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = {23, 35})
public class BuildDetailsExportTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    @Rule public final TemporaryFolder temporary = new TemporaryFolder();
    private String oldSettings;

    @Before public void start() throws Exception {
        oldSettings = SettingsBackup.create(false);
        HushfeedPause.resetForTests();
        BaseSettings.DEBUG_LOG_FILTERS.save("downloads");
        LogBufferManager.clearLogBuffer();
        HookStatus.clear();
    }

    @After public void finish() throws Exception {
        try {
            HushfeedPause.resetForTests();
            SettingsBackup.restore(RuntimeEnvironment.getApplication(), oldSettings, false);
        } finally {
            LogBufferManager.clearLogBuffer();
            HookStatus.clear();
        }
    }

    @Test public void metadataDoesNotMakeAnAutomaticReportWorthExporting() throws Exception {
        try (BuildDetailsFixture asset = asset(BuildDetailsTest.metadata())) {
            Utils.setContext(asset.context);
            assertEquals(BuildDetailsTest.metadata(), Utils.getBuildMetadata());
            assertEquals("", LogBufferManager.buildExportText());
            LogBufferManager.appendEvent(DiagnosticCategory.FEED_AND_NAVIGATION, "Fixture", "INFO", "not in the selected category");
            assertEquals("", LogBufferManager.buildExportText());
            LogBufferManager.appendEvent(DiagnosticCategory.DOWNLOADS, "Fixture", "INFO", "phase=ready sessionid=EVENT_SENTINEL");
            String report = LogBufferManager.buildExportText();
            assertTrue(report.contains(BuildDetails.section(BuildDetailsTest.metadata())));
            assertTrue(report.contains("phase=ready"));
            assertFalse(report.contains("EVENT_SENTINEL"));
            assertTrue(report.contains("source_start: A1234567890123456789B"));
            LogBufferManager.clearLogBuffer();
            assertTrue(LogBufferManager.canUndoClear());
            assertEquals(BuildDetailsTest.metadata(), Utils.getBuildMetadata());
            assertEquals("", LogBufferManager.buildExportText());
            assertEquals(LogBufferManager.UndoResult.RESTORED, LogBufferManager.undoClear());
            assertTrue(LogBufferManager.buildExportText().contains(BuildDetails.section(BuildDetailsTest.metadata())));
        }
    }

    @Test public void pauseImportAndResetCannotRewritePatchTimeFacts() throws Exception {
        String metadata = BuildDetailsTest.metadata(), expected = BuildDetails.report(metadata);
        try (BuildDetailsFixture asset = asset(metadata)) {
            Utils.setContext(asset.context);
            for (HushfeedPause.Reason reason : HushfeedPause.Reason.values()) {
                HushfeedPause.pauseForTests(reason);
                assertEquals(expected, BuildDetails.report());
            }
            HushfeedPause.resetForTests();
            String backup = SettingsBackup.create(true);
            assertFalse(backup.contains("patch_time"));
            assertFalse(backup.contains("source_commit"));
            SettingsBackup.restore(asset.context, backup, false);
            assertEquals(expected, BuildDetails.report());
            SettingsBackup.reset(asset.context);
            assertEquals(expected, BuildDetails.report());
            assertEquals(metadata, Utils.getBuildMetadata());
        }
    }

    @Test public void metadataSurvivesTheRealQuickCopyTailWhenEventsExceedItsLimit() throws Exception {
        try (BuildDetailsFixture asset = asset(BuildDetailsTest.metadata())) {
            Utils.setContext(asset.context);
            for (int index = 0; index < 180; index++) {
                LogBufferManager.appendEvent(DiagnosticCategory.DOWNLOADS, "Fixture", "INFO", "phase=ready " + "x".repeat(500));
            }
            assertTrue(LogBufferManager.buildExportText().length() > 60_000);
            LogBufferManager.exportToClipboard();
            ClipboardManager clipboard = (ClipboardManager) asset.context.getSystemService(Context.CLIPBOARD_SERVICE);
            String copied = clipboard.getPrimaryClip().getItemAt(0).getText().toString();
            assertTrue(copied.contains("clipboard_note:"));
            assertTrue(copied.contains(BuildDetails.section(BuildDetailsTest.metadata())));
        }
    }

    @Test public void legacyReadsDoNotCacheUnknownAndOversizedAssetsNeverRenderTheirContents() throws Exception {
        Utils.setContext(RuntimeEnvironment.getApplication());
        assertEquals("", Utils.getBuildMetadata());
        assertTrue(BuildDetails.report().contains("build_metadata: unknown"));
        try (BuildDetailsFixture asset = asset(BuildDetailsTest.metadata())) {
            Utils.setContext(asset.context);
            assertTrue(BuildDetails.report().contains("build_metadata: available"));
        }
        try (BuildDetailsFixture asset = asset("SIZE_SENTINEL".repeat(400))) {
            Utils.setContext(asset.context);
            assertEquals("", Utils.getBuildMetadata());
            assertFalse(BuildDetails.report().contains("SIZE_SENTINEL"));
        }
    }

    private BuildDetailsFixture asset(String metadata) throws Exception {
        return new BuildDetailsFixture(RuntimeEnvironment.getApplication(), temporary.newFile(), metadata);
    }
}
