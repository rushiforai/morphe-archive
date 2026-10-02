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

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * {@link Analytics}'s two hooks, read on their own: what each counts with the switch on, what it
 * leaves alone with the switch off, paused, or before the settings are ready, and what it does
 * when the switch itself cannot be read.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class AnalyticsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** Mirrors the vendor controller's public request flag and private once-per-start guard. */
    public static class DeviceStatsController {
        public boolean collectDeviceStats;
        private boolean loggedDeviceStats;

        public DeviceStatsController(boolean requested, boolean alreadyHandled) {
            collectDeviceStats = requested;
            loggedDeviceStats = alreadyHandled;
        }
    }

    private static final class InheritedController extends DeviceStatsController {
        InheritedController() {
            super(true, false);
        }
    }

    public static final class MissingLoggedFlag {
        public boolean collectDeviceStats = true;
    }

    public static final class WrongRequestedType {
        public String collectDeviceStats = "true";
    }

    public static final class WrongLoggedType {
        public boolean collectDeviceStats = true;
        private int loggedDeviceStats;
    }

    @Before
    public void setUp() {
        HookStatus.clear();
    }

    @After
    public void tearDown() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.DISABLE_ANALYTICS);
        Settings.DISABLE_ANALYTICS.resetToDefault();
        HookStatus.clear();
    }

    @Test
    public void theDeviceStatsReportIsSkippedAndCountedWhileTheSwitchIsOn() {
        Settings.DISABLE_ANALYTICS.save(true);
        DeviceStatsController controller = new DeviceStatsController(true, false);
        assertTrue(Analytics.skipDeviceStats(controller));
        assertTrue("the server flag stays as Telegram set it", controller.collectDeviceStats);
        assertFalse("the hook must not set Telegram's once-per-start guard", controller.loggedDeviceStats);
        assertEquals(Arrays.asList(
                        "Disable analytics: invoked 1, 0 found, 0 missing. Counted: device stats report skipped 1"),
                HookStatus.report());
    }

    @Test
    public void theDeviceStatsReportGoesOutWithTheSwitchOff() {
        Settings.DISABLE_ANALYTICS.save(false);
        assertFalse(Analytics.skipDeviceStats(new DeviceStatsController(true, false)));
        assertEquals(Arrays.asList("Disable analytics: invoked 1, 0 found, 0 missing"), HookStatus.report());
    }

    @Test
    public void theDeviceStatsReportGoesOutWhilePaused() {
        Settings.DISABLE_ANALYTICS.save(true);
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        assertFalse(Analytics.skipDeviceStats(new DeviceStatsController(true, false)));
        assertEquals(Arrays.asList("Disable analytics: invoked 1, 0 found, 0 missing"), HookStatus.report());
    }

    @Test
    public void theDeviceStatsReportGoesOutBeforeTheSettingsAreReady() {
        Settings.DISABLE_ANALYTICS.save(true);
        SettingsContextRule.withoutContext(() -> assertFalse(Analytics.skipDeviceStats(new DeviceStatsController(true, false))));
        assertEquals(Arrays.asList("Disable analytics: invoked 1, 0 found, 0 missing"), HookStatus.report());
    }

    @Test
    public void aReportIsNotCountedAsSkippedUntilTheServerRequestsIt() {
        Settings.DISABLE_ANALYTICS.save(true);
        DeviceStatsController controller = new DeviceStatsController(false, false);
        for (int i = 0; i < 3; i++) assertFalse(Analytics.skipDeviceStats(controller));
        assertEquals(Arrays.asList("Disable analytics: invoked 3, 0 found, 0 missing. Counted: device stats report not requested 3"),
                HookStatus.report());
        controller.collectDeviceStats = true;
        assertTrue(Analytics.skipDeviceStats(controller));
        assertEquals(Arrays.asList("Disable analytics: invoked 4, 0 found, 0 missing. Counted: device stats report not requested 3, "
                + "device stats report skipped 1"), HookStatus.report());
    }

    @Test
    public void aReportTelegramAlreadyHandledIsNotCountedAsSkipped() {
        Settings.DISABLE_ANALYTICS.save(true);
        DeviceStatsController controller = new DeviceStatsController(true, true);
        assertFalse(Analytics.skipDeviceStats(controller));
        assertEquals(Arrays.asList("Disable analytics: invoked 1, 0 found, 0 missing. Counted: device stats report already handled 1"),
                HookStatus.report());
        assertTrue(controller.collectDeviceStats);
        assertTrue(controller.loggedDeviceStats);
    }

    @Test
    public void theServerFlagTakesPrecedenceOverTheAlreadyHandledFlag() {
        Settings.DISABLE_ANALYTICS.save(true);
        assertFalse(Analytics.skipDeviceStats(new DeviceStatsController(false, true)));
        assertEquals(Arrays.asList("Disable analytics: invoked 1, 0 found, 0 missing. Counted: device stats report not requested 1"),
                HookStatus.report());
    }

    @Test
    public void inheritedControllerFlagsStillBindToTheirDeclaringClass() {
        Settings.DISABLE_ANALYTICS.save(true);
        assertTrue(Analytics.skipDeviceStats(new InheritedController()));
        assertEquals(Arrays.asList("Disable analytics: invoked 1, 0 found, 0 missing. Counted: device stats report skipped 1"),
                HookStatus.report());
    }

    @Test
    public void inactiveAndStartingHooksReadNoControllerStateAndCountNoDecision() {
        DeviceStatsController notRequested = new DeviceStatsController(false, false);
        Settings.DISABLE_ANALYTICS.save(false);
        assertFalse(Analytics.skipDeviceStats(notRequested));
        assertFalse(Analytics.skipDeviceStats(null));
        Settings.DISABLE_ANALYTICS.save(true);
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        assertFalse(Analytics.skipDeviceStats(notRequested));
        assertFalse(Analytics.skipDeviceStats(null));
        PauseForTests.resume();
        SettingsContextRule.withoutContext(() -> {
            assertFalse(Analytics.skipDeviceStats(notRequested));
            assertFalse(Analytics.skipDeviceStats(null));
        });
        SettingsContextRule.beforeThePauseIsDecided(() -> {
            assertFalse(Analytics.skipDeviceStats(notRequested));
            assertFalse(Analytics.skipDeviceStats(null));
        });
        assertEquals(Arrays.asList("Disable analytics: invoked 8, 0 found, 0 missing"), HookStatus.report());
        assertTrue("inactive guards must run before reflection", HookStatus.missing(FamilyNames.DISABLE_ANALYTICS).isEmpty());
    }

    @Test
    public void controllerLookupFailuresLeaveTelegramAloneAndNeverCountAsSkips() {
        Settings.DISABLE_ANALYTICS.save(true);
        Object[] broken = {null, new Object(), new MissingLoggedFlag(), new WrongRequestedType(), new WrongLoggedType()};
        Class<?>[] failures = {NullPointerException.class, NoSuchFieldException.class, NoSuchFieldException.class,
                IllegalArgumentException.class, IllegalArgumentException.class};
        for (int i = 0; i < broken.length; i++) {
            HookStatus.clear();
            assertFalse(Analytics.skipDeviceStats(broken[i]));
            assertEquals(Arrays.asList("a working 'device stats state read' hook (it threw " + failures[i].getName() + ")"),
                    HookStatus.missing(FamilyNames.DISABLE_ANALYTICS));
            assertFalse("a state read failure must not count a decision", HookStatus.report().get(0).contains("Counted:"));
        }
    }

    @Test
    public void notRequestedAlreadyHandledAndReadMetricsUseSeparateCounters() {
        Settings.DISABLE_ANALYTICS.save(true);
        assertFalse(Analytics.skipDeviceStats(new DeviceStatsController(false, false)));
        assertFalse(Analytics.skipDeviceStats(new DeviceStatsController(true, true)));
        assertTrue(Analytics.skipDeviceStats(new DeviceStatsController(true, false)));
        List<Object> pending = new ArrayList<>(Arrays.asList("post 1"));
        assertTrue(Analytics.skipReadMetrics(pending));
        assertTrue(pending.isEmpty());
        assertEquals(Arrays.asList("Disable analytics: invoked 4, 0 found, 0 missing. Counted: device stats report not requested 1, "
                + "device stats report already handled 1, device stats report skipped 1, read metrics report skipped 1"),
                HookStatus.report());
    }

    @Test
    public void theReadMetricsBatchIsDroppedAndCountedWhileTheSwitchIsOn() {
        Settings.DISABLE_ANALYTICS.save(true);
        List<Object> pending = new ArrayList<>(Arrays.asList("post 1", "post 2"));
        assertTrue(Analytics.skipReadMetrics(pending));
        assertTrue("the batch is emptied as a send would, so it can't pile up", pending.isEmpty());
        assertEquals(Arrays.asList(
                        "Disable analytics: invoked 1, 0 found, 0 missing. Counted: read metrics report skipped 1"),
                HookStatus.report());
    }

    @Test
    public void theReadMetricsBatchGoesOutUntouchedWithTheSwitchOffWhilePausedOrBeforeTheSettingsAreReady() {
        List<Object> pending = new ArrayList<>(Arrays.asList("post 1"));
        Settings.DISABLE_ANALYTICS.save(false);
        assertFalse(Analytics.skipReadMetrics(pending));
        Settings.DISABLE_ANALYTICS.save(true);
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        assertFalse(Analytics.skipReadMetrics(pending));
        PauseForTests.resume();
        SettingsContextRule.withoutContext(() -> assertFalse(Analytics.skipReadMetrics(pending)));
        assertEquals(Arrays.asList("post 1"), pending);
        assertEquals(Arrays.asList("Disable analytics: invoked 3, 0 found, 0 missing"), HookStatus.report());
    }

    @Test
    public void aBatchThatCannotBeEmptiedIsStillNotSent() {
        Settings.DISABLE_ANALYTICS.save(true);
        assertTrue(Analytics.skipReadMetrics(Collections.unmodifiableList(new ArrayList<>(Arrays.asList("post 1")))));
        assertTrue(Analytics.skipReadMetrics(null));
        assertEquals(Arrays.asList(
                        "a working 'read metrics clear' hook (it threw java.lang.UnsupportedOperationException)"),
                HookStatus.missing(FamilyNames.DISABLE_ANALYTICS));
    }

    @Test
    public void aHookThatCannotReadTheSwitchSkipsNothingAndRecordsWhatThrew() {
        Settings.DISABLE_ANALYTICS.save(true);
        SettingReadsForTests.breakReads(Settings.DISABLE_ANALYTICS);
        assertFalse(Analytics.skipDeviceStats(new DeviceStatsController(true, false)));
        assertEquals(Arrays.asList(
                        "a working 'switch read' hook (it threw java.lang.NullPointerException)"),
                HookStatus.missing(FamilyNames.DISABLE_ANALYTICS));
        assertFalse("a throw must not count as a skip", HookStatus.report().get(0).contains("Counted:"));
    }
}
