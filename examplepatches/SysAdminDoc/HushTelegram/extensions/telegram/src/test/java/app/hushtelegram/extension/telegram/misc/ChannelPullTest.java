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

import java.util.Collections;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ChannelPullTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void setUp() {
        Settings.DISABLE_CHANNEL_PULL.resetToDefault();
        HookStatus.clear();
    }

    @After public void tearDown() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.DISABLE_CHANNEL_PULL);
        Settings.DISABLE_CHANNEL_PULL.resetToDefault();
        HookStatus.clear();
    }

    @Test public void onByDefaultStopsBroadcastPullAndRelease() {
        assertTrue(Settings.DISABLE_CHANNEL_PULL.get());
        assertTrue(ChannelPull.stopBottomPull());
        assertTrue(ChannelPull.keepChannelStill());
        assertEquals(Collections.singletonList("Disable pull to next channel: invoked 2, 0 found, 0 missing. Counted: channel bottom pull stopped 1, channel pull release stopped 1"),
                HookStatus.report());
    }

    @Test public void turningTheSwitchOnRestoresBothGuardsWithoutStickyState() {
        Settings.DISABLE_CHANNEL_PULL.save(false);
        stock();
        Settings.DISABLE_CHANNEL_PULL.save(true);
        assertTrue(ChannelPull.stopBottomPull());
        assertTrue(ChannelPull.keepChannelStill());
    }

    @Test public void switchedOffPreservesBothStockInputsAndRelease() {
        Settings.DISABLE_CHANNEL_PULL.save(false);
        stock();
        assertEquals(Collections.singletonList("Disable pull to next channel: invoked 2, 0 found, 0 missing"),
                HookStatus.report());
    }

    @Test public void everyPauseReasonRestoresStockAndResumeStopsTheNextPull() {
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            stock();
            PauseForTests.resume();
        }
        assertTrue(ChannelPull.stopBottomPull());
        assertTrue(ChannelPull.keepChannelStill());
    }

    @Test public void unavailableSettingsPreserveStock() {
        SettingsContextRule.withoutContext(ChannelPullTest::stock);
    }

    @Test public void unreadableSettingFailsOpenAndReportsTheReadFailure() {
        SettingReadsForTests.breakReads(Settings.DISABLE_CHANNEL_PULL);
        stock();
        assertEquals(Collections.singletonList("a working 'switch read' hook (it threw java.lang.NullPointerException)"),
                HookStatus.missing(FamilyNames.DISABLE_CHANNEL_PULL));
    }

    private static void stock() {
        assertFalse(ChannelPull.stopBottomPull());
        assertFalse(ChannelPull.keepChannelStill());
    }
}
