/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.telemetry;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.tiktok.settings.Settings;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
public class DisableTelemetryPatchTest {
    @Before
    public void setUp() {
        Utils.setContext(RuntimeEnvironment.getApplication());
        Settings.DISABLE_ANALYTICS.save(false);
    }

    @After
    public void tearDown() {
        Settings.DISABLE_ANALYTICS.save(false);
    }

    @Test
    public void telemetryIsDisabledWhenTheSettingIsOn() {
        Settings.DISABLE_ANALYTICS.save(true);
        assertTrue(DisableTelemetryPatch.isTelemetryDisabled());
    }

    @Test
    public void telemetryIsEnabledWhenTheSettingIsOff() {
        assertFalse(DisableTelemetryPatch.isTelemetryDisabled());
    }

    @Test
    public void telemetryStaysEnabledBeforeTheContextIsSet() {
        Utils.setContext(null);
        Settings.DISABLE_ANALYTICS.save(true);
        assertFalse(DisableTelemetryPatch.isTelemetryDisabled());
    }
}
