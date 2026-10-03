/*
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.hushtelegram.extension.telegram.settings;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.content.ClipboardManager;
import android.content.Context;
import android.os.Build;
import android.provider.MediaStore;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLooper;

import java.io.ByteArrayOutputStream;
import java.nio.charset.StandardCharsets;
import java.util.EnumSet;
import java.util.regex.Pattern;

import app.hushtelegram.extension.telegram.misc.Analytics;
import app.hushtelegram.extension.telegram.misc.AnalyticsTest.DeviceStatsController;
import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.BaseSettings;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.preference.LogBufferManager;
import app.hushtelegram.extension.shared.settings.preference.LogBufferManagerExportTest;

/**
 * Bug reports used to come without a report: with nothing logged and no hook missing anything, the
 * export said there was nothing to report and told the reader to turn on Debug logging. A report
 * asked for now always carries the facts a maintainer asks for first: the app's package, version
 * code, Android API and profile, ABI, HushTelegram's version, whether it's paused, which patches
 * the build carries and what each hook has counted. Debug logging stays off here, both exports
 * are read, and nothing is sent anywhere.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class SupportReportTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void setUp() {
        Utils.setContext(RuntimeEnvironment.getApplication());
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        PatchFamily.registerDiagnostics();
        BaseSettings.DEBUG.save(false);
        BaseSettings.DEBUG_LOG_FILTERS.resetToDefault();
        LogBufferManager.clearLogBuffer();
        HookStatus.clear();
    }

    @After
    public void tearDown() {
        PatchFamily.inBuildForTests = null;
        PatchFamily.capabilitiesForTests = null;
        PauseForTests.resume();
        BaseSettings.DEBUG.resetToDefault();
        LogBufferManager.clearLogBuffer();
        HookStatus.clear();
    }

    /** The clipboard copy and the saved file of one report, in that order. */
    private static String[] bothExports() throws Exception {
        Context context = RuntimeEnvironment.getApplication();
        ClipboardManager clipboard = context.getSystemService(ClipboardManager.class);
        LogBufferManager.exportToClipboard();
        Utils.awaitBackgroundTasksForTests();
        ShadowLooper.idleMainLooper();
        String copied = String.valueOf(clipboard.getPrimaryClip().getItemAt(0).getText());

        LogBufferManagerExportTest.Downloads downloads = Robolectric.setupContentProvider(
                LogBufferManagerExportTest.Downloads.class, MediaStore.AUTHORITY);
        ByteArrayOutputStream body = new ByteArrayOutputStream();
        Shadows.shadowOf(context.getContentResolver()).registerOutputStream(
                android.content.ContentUris.withAppendedId(MediaStore.Downloads.EXTERNAL_CONTENT_URI, 1), body);
        LogBufferManager.exportToFile();
        Utils.awaitBackgroundTasksForTests();
        ShadowLooper.idleMainLooper();
        return new String[]{copied, body.toString(StandardCharsets.UTF_8.name())};
    }

    /** What every report asked for carries, whatever went right or wrong. */
    private static void assertBuildFacts(String report) {
        String packageName = RuntimeEnvironment.getApplication().getPackageName();
        assertTrue(report, report.startsWith("MORPHE DIAGNOSTIC REPORT\n"));
        assertTrue("no package or version code: " + report,
                Pattern.compile("\napp: " + Pattern.quote(packageName) + " \\S+ \\(\\d+\\)\n").matcher(report).find());
        assertTrue("no API level or profile: " + report, report.contains(
                "\nandroid: API " + Build.VERSION.SDK_INT + " (" + Build.VERSION.RELEASE + "), user "));
        assertTrue("no ABI: " + report, report.contains("\nabi: app "));
        assertTrue("no HushTelegram version: " + report, report.contains("\nmorphe: "));
        assertTrue("Debug logging's state is missing: " + report, report.contains("\ndebug_logging: off\n"));
        assertTrue("no patch list: " + report, report.contains("\n[PATCHES]\n"));
        assertTrue(report, report.contains("\nHide ads: on (hushtelegram_hide_ads=on)\n"));
        assertFalse("events without Debug logging: " + report, report.contains("[SELECTED EVENTS]"));
    }

    @Test
    public void aHealthyRunStillGivesAReport() throws Exception {
        for (String report : bothExports()) {
            assertBuildFacts(report);
            assertTrue("the Pause state is missing: " + report, report.contains("\nhushtelegram: running\n"));
            assertFalse("a healthy run reported hook findings: " + report, report.contains("[HOOK STATUS]"));
        }
    }

    /**
     * A hook that ran says how often and what it did, with nothing logged: here Telegram asked three
     * times for the device statistics report and each ask was skipped. The report says so without
     * Debug logging.
     */
    @Test
    public void aHookThatRanSaysWhatItCounted() throws Exception {
        DeviceStatsController controller = new DeviceStatsController(true, false);
        for (int i = 0; i < 3; i++) Analytics.skipDeviceStats(controller);

        for (String report : bothExports()) {
            assertBuildFacts(report);
            assertTrue(report, report.contains("\n[HOOK STATUS]\nDisable analytics: invoked 3, 0 found, 0 missing. "
                    + "Counted: device stats report skipped 3\n"));
        }
    }

    @Test
    public void bothExportsDistinguishUnrequestedAndAlreadyHandledReportsFromSkips() throws Exception {
        Analytics.skipDeviceStats(new DeviceStatsController(false, false));
        Analytics.skipDeviceStats(new DeviceStatsController(true, true));
        for (String report : bothExports()) {
            assertBuildFacts(report);
            assertTrue(report, report.contains("device stats report not requested 1, device stats report already handled 1"));
            assertFalse(report, report.contains("device stats report skipped"));
            assertFalse(report, report.contains("read metrics report skipped"));
        }
    }

    @Test
    public void aPausedRunSaysSo() throws Exception {
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        for (String report : bothExports()) {
            assertTrue(report, report.contains("\nhushtelegram: paused (switch)"));
            assertTrue(report, report.contains("\nHide ads: disabled while paused (saved hushtelegram_hide_ads=on)\n"));
        }
    }

    @Test
    public void bothExportsPreservePrecisePartialCoverageWithoutDebugLogging() throws Exception {
        PatchFamily.capabilitiesForTests = EnumSet.of(PatchFamily.Capability.CHANNEL_ADS,
                PatchFamily.Capability.SEARCH_ADS, PatchFamily.Capability.DEVICE_STATS);
        for (boolean paused : new boolean[]{false, true}) {
            if (paused) PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
            for (String report : bothExports()) {
                assertTrue(report, report.contains("\nHide ads coverage: channel ads, search ads; missing: video ads\n"));
                assertTrue(report, report.contains("\nDisable analytics coverage: device statistics reports; missing: "
                        + "channel read metrics, Premium promo views, Premium promo taps, Premium promo accepts, Premium promo failures\n"));
                assertTrue(report, report.contains("\ndebug_logging: off\n"));
                assertFalse(report, report.contains("[SELECTED EVENTS]"));
            }
        }
    }
}
