/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.Arrays;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class CallDebugTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void setUp() {
        Settings.DISABLE_CALL_DEBUG.resetToDefault();
        HookStatus.clear();
    }

    @After public void tearDown() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.DISABLE_CALL_DEBUG);
        Settings.DISABLE_CALL_DEBUG.resetToDefault();
        HookStatus.clear();
    }

    @Test public void enabledByDefaultAndEachRequestedDiagnosticCountsItsSuppression() {
        assertTrue(Settings.DISABLE_CALL_DEBUG.get());
        assertTrue(CallDebug.skipCallDebugUpload(true));
        assertTrue(CallDebug.skipCallLogFileUpload());
        assertTrue(CallDebug.skipCallLogUpload());
        assertEquals(Arrays.asList("Disable call debug upload: invoked 3, 0 found, 0 missing. Counted: "
                        + "call debug report suppressed 1, call log file upload suppressed 1, call log report suppressed 1"),
                HookStatus.report());
    }

    @Test public void noRequestedDebugUploadReadsNoSettingAndCountsNothing() {
        assertFalse(CallDebug.skipCallDebugUpload(false));
        SettingReadsForTests.breakReads(Settings.DISABLE_CALL_DEBUG);
        assertFalse(CallDebug.skipCallDebugUpload(false));
        SettingsContextRule.withoutContext(() -> assertFalse(CallDebug.skipCallDebugUpload(false)));
        assertTrue(HookStatus.report().isEmpty());
        assertTrue(HookStatus.missing(FamilyNames.DISABLE_CALL_DEBUG).isEmpty());
    }

    @Test public void disabledPreservesAllStockUploads() {
        Settings.DISABLE_CALL_DEBUG.save(false);
        assertStock();
        assertNoSuppression();
    }

    @Test public void everyPauseReasonPreservesAllStockUploadsAndResumeRestoresTheGuard() {
        Settings.DISABLE_CALL_DEBUG.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertStock();
            assertNoSuppression();
            PauseForTests.resume();
        }
        assertTrue(CallDebug.skipCallDebugUpload(true));
    }

    @Test public void unavailableSettingsPreserveAllStockUploads() {
        Settings.DISABLE_CALL_DEBUG.save(true);
        SettingsContextRule.withoutContext(this::assertStock);
        assertNoSuppression();
    }

    @Test public void unreadableSettingFailsOpenAndReportsItsStateFailure() {
        Settings.DISABLE_CALL_DEBUG.save(true);
        SettingReadsForTests.breakReads(Settings.DISABLE_CALL_DEBUG);
        assertStock();
        assertEquals(Arrays.asList("a working 'switch read' hook (it threw java.lang.NullPointerException)"),
                HookStatus.missing(FamilyNames.DISABLE_CALL_DEBUG));
        assertNoSuppression();
    }

    private void assertStock() {
        assertFalse(CallDebug.skipCallDebugUpload(false));
        assertFalse(CallDebug.skipCallDebugUpload(true));
        assertFalse(CallDebug.skipCallLogFileUpload());
        assertFalse(CallDebug.skipCallLogUpload());
    }

    private void assertNoSuppression() {
        assertFalse(HookStatus.report().stream().anyMatch(row -> row.contains("Counted:")));
    }
}
