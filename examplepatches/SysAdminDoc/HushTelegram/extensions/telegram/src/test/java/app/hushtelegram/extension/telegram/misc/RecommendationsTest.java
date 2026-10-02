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

/** Both recommendation hooks retain stock behavior when disabled, paused or unable to read settings. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class RecommendationsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void setUp() {
        HookStatus.clear();
    }

    @After
    public void tearDown() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.HIDE_RECOMMENDATIONS);
        Settings.HIDE_RECOMMENDATIONS.resetToDefault();
        HookStatus.clear();
    }

    @Test
    public void bothHooksHideRecommendationsByDefaultAndCountResultsWithoutClaimingNetworkRequests() {
        Settings.HIDE_RECOMMENDATIONS.resetToDefault();
        assertTrue("recommendations are hidden by default", Settings.HIDE_RECOMMENDATIONS.get());
        assertTrue(Recommendations.skipRecommendations());
        assertTrue(Recommendations.skipCachedRecommendations());
        assertEquals(Collections.singletonList("Hide recommendations: invoked 2, 0 found, 0 missing. "
                        + "Counted: recommendations hidden 1, cached recommendations hidden 1"),
                HookStatus.report());
    }

    @Test
    public void bothHooksKeepStockBehaviorWithTheSwitchOff() {
        Settings.HIDE_RECOMMENDATIONS.save(false);
        assertStockBehavior();
    }

    @Test
    public void bothHooksKeepStockBehaviorWhilePaused() {
        Settings.HIDE_RECOMMENDATIONS.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            HookStatus.clear();
            PauseForTests.pause(reason);
            assertStockBehavior();
            PauseForTests.resume();
        }
    }

    @Test
    public void bothHooksKeepStockBehaviorBeforeSettingsAreReady() {
        Settings.HIDE_RECOMMENDATIONS.save(true);
        SettingsContextRule.withoutContext(this::assertStockBehavior);
    }

    @Test
    public void unreadableSettingsHideNothingAndRecordTheFailure() {
        Settings.HIDE_RECOMMENDATIONS.save(true);
        SettingReadsForTests.breakReads(Settings.HIDE_RECOMMENDATIONS);
        assertFalse(Recommendations.skipRecommendations());
        assertFalse(Recommendations.skipCachedRecommendations());
        assertEquals(Collections.singletonList("a working 'switch read' hook (it threw java.lang.NullPointerException)"),
                HookStatus.missing(FamilyNames.HIDE_RECOMMENDATIONS));
        assertFalse("failed reads don't count as hidden recommendations", HookStatus.report().get(0).contains("Counted:"));
    }

    private void assertStockBehavior() {
        assertFalse(Recommendations.skipRecommendations());
        assertFalse(Recommendations.skipCachedRecommendations());
        assertEquals(Collections.singletonList("Hide recommendations: invoked 2, 0 found, 0 missing"), HookStatus.report());
    }
}
