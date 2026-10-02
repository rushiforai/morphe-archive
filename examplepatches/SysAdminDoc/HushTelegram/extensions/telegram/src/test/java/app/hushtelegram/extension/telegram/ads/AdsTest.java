/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.ads;

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

/**
 * {@link Ads}'s three hooks, read on their own rather than through a probe: what each one counts
 * with the switch on, what both leave alone with the switch off, paused, or before the settings
 * are ready, and what happens when the switch itself cannot be read.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class AdsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void setUp() {
        HookStatus.clear();
    }

    @After
    public void tearDown() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.HIDE_ADS);
        Settings.HIDE_ADS.resetToDefault();
        HookStatus.clear();
    }

    @Test
    public void eachHookSkipsItsRequestAndCountsItWhileTheSwitchIsOn() {
        Settings.HIDE_ADS.save(true);
        assertTrue(Ads.skipSponsoredMessages());
        assertTrue(Ads.skipVideoAds());
        assertTrue(Ads.skipSearchAds());
        assertEquals(Arrays.asList("Hide ads: invoked 3, 0 found, 0 missing. "
                        + "Counted: sponsored messages request skipped 1, video ads request skipped 1, search ads request skipped 1"),
                HookStatus.report());
    }

    @Test
    public void eachHookLeavesTelegramAloneWithTheSwitchOff() {
        Settings.HIDE_ADS.save(false);
        assertFalse(Ads.skipSponsoredMessages());
        assertFalse(Ads.skipVideoAds());
        assertFalse(Ads.skipSearchAds());
        assertEquals(Arrays.asList("Hide ads: invoked 3, 0 found, 0 missing"), HookStatus.report());
    }

    @Test
    public void eachHookLeavesTelegramAloneWhilePaused() {
        Settings.HIDE_ADS.save(true);
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        assertFalse(Ads.skipSponsoredMessages());
        assertFalse(Ads.skipVideoAds());
        assertFalse(Ads.skipSearchAds());
        assertEquals(Arrays.asList("Hide ads: invoked 3, 0 found, 0 missing"), HookStatus.report());
    }

    @Test
    public void eachHookLeavesTelegramAloneBeforeTheSettingsAreReady() {
        Settings.HIDE_ADS.save(true);
        SettingsContextRule.withoutContext(() -> {
            assertFalse(Ads.skipSponsoredMessages());
            assertFalse(Ads.skipVideoAds());
            assertFalse(Ads.skipSearchAds());
        });
        assertEquals(Arrays.asList("Hide ads: invoked 3, 0 found, 0 missing"), HookStatus.report());
    }

    @Test
    public void aHookThatCannotReadTheSwitchSkipsNothingAndRecordsWhatThrew() {
        Settings.HIDE_ADS.save(true);
        SettingReadsForTests.breakReads(Settings.HIDE_ADS);
        assertFalse(Ads.skipSponsoredMessages());
        assertEquals(Arrays.asList(
                        "a working 'switch read' hook (it threw java.lang.NullPointerException)"),
                HookStatus.missing(FamilyNames.HIDE_ADS));
        assertFalse("a throw must not count as a skip", HookStatus.report().get(0).contains("Counted:"));
    }
}
