/*
 * Forked from https://github.com/SysAdminDoc/HushTelegram at 8c54a1d (GPL-3.0),
 * modified for HushPinterest (Pinterest), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.hushpinterest.extension.pinterest.settings;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.content.ClipboardManager;
import android.content.Context;
import android.os.Build;
import android.view.View;
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

import app.hushpinterest.extension.pinterest.ads.Ads;
import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;
import app.hushpinterest.extension.shared.settings.BaseSettings;
import app.hushpinterest.extension.shared.settings.HushPinterestPause;
import app.hushpinterest.extension.shared.settings.PauseForTests;
import app.hushpinterest.extension.shared.settings.preference.LogBufferManager;
import app.hushpinterest.extension.shared.settings.preference.LogBufferManagerExportTest;

/**
 * Bug reports used to come without a report: with nothing logged and no hook missing anything, the
 * export said there was nothing to report and told the reader to turn on Debug logging. A report
 * asked for now always carries the facts a maintainer asks for first: the app's package, version
 * code, Android API and profile, ABI, HushPinterest's version, whether it's paused, which patches
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
        assertTrue("no HushPinterest version: " + report, report.contains("\nmorphe: "));
        assertTrue("Debug logging's state is missing: " + report, report.contains("\ndebug_logging: off\n"));
        assertTrue("no patch list: " + report, report.contains("\n[PATCHES]\n"));
        assertTrue("no local push checks: " + report, report.contains("\n[PUSH READINESS]\n"));
        assertTrue(report, report.contains("live delivery not proven"));
        assertTrue(report, report.contains("\nHide ads: on (hushpinterest_hide_ads=on)\n"));
        assertFalse("events without Debug logging: " + report, report.contains("[SELECTED EVENTS]"));
    }

    @Test
    public void aHealthyRunStillGivesAReport() throws Exception {
        for (String report : bothExports()) {
            assertBuildFacts(report);
            assertTrue("the Pause state is missing: " + report, report.contains("\nhushpinterest: running\n"));
            assertFalse("a healthy run reported hook findings: " + report, report.contains("[HOOK STATUS]"));
        }
    }

    /**
     * A hook that ran says how often and what it did, with nothing logged: here Pinterest showed an
     * ad-only view three times and each time it was kept folded away. The report says so without
     * Debug logging.
     */
    @Test
    public void aHookThatRanSaysWhatItCounted() throws Exception {
        for (int i = 0; i < 3; i++) Ads.adViewVisibility(View.VISIBLE);

        for (String report : bothExports()) {
            assertBuildFacts(report);
            assertTrue(report, report.contains("\n[HOOK STATUS]\nHide ads: invoked 3, 0 found, 0 missing. "
                    + "Counted: ad view kept folded away 3\n"));
        }
    }

    @Test
    public void bothExportsCountOnlyAdViewsThatWereShownNotOnesAlreadyFoldedAway() throws Exception {
        Ads.adViewVisibility(View.VISIBLE);
        Ads.adViewVisibility(View.GONE);
        for (String report : bothExports()) {
            assertBuildFacts(report);
            assertTrue(report, report.contains("invoked 2, 0 found, 0 missing. Counted: ad view kept folded away 1\n"));
            assertFalse(report, report.contains("kept folded away 2"));
        }
    }

    @Test
    public void aPausedRunSaysSo() throws Exception {
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        for (String report : bothExports()) {
            assertTrue(report, report.contains("\nhushpinterest: paused (switch)"));
            assertTrue(report, report.contains("\nHide ads: disabled while paused (saved hushpinterest_hide_ads=on)\n"));
        }
    }

    @Test
    public void bothExportsPreservePrecisePartialCoverageWithoutDebugLogging() throws Exception {
        PatchFamily.capabilitiesForTests = EnumSet.of(PatchFamily.Capability.FEED_ADS);
        for (boolean paused : new boolean[]{false, true}) {
            if (paused) PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
            for (String report : bothExports()) {
                assertTrue(report, report.contains("\nHide ads coverage: promoted pins in lists; missing: ad-only views, Google ad SDK start\n"));
                assertTrue(report, report.contains("\nHide AI-labeled pins coverage: none; missing: AI-labeled pins in lists\n"));
                assertTrue(report, report.contains("\ndebug_logging: off\n"));
                assertFalse(report, report.contains("[SELECTED EVENTS]"));
            }
        }
    }
}
