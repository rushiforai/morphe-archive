/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.extension.hushthreads.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.net.URI;

import app.morphe.extension.hushthreads.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;

/** Where Disable analytics sends Threads' event log uploads with its switch on, and off. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class AnalyticsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After
    public void restore() {
        Settings.DISABLE_ANALYTICS.resetToDefault();
    }

    /** Each kind of address the patch hands over: the Pigeon logger's, the default, the MQTT setting's. */
    @Test
    public void everyUploadAddressGoesToThisPhoneOnADeadPort() {
        for (String upload : new String[] {
                "https://graph.threads.net/logging_client_events",
                "https://graph.facebook.com/pigeon_nest",
                "https://graph.facebook.com/logging_client_events",
                null,
        }) {
            assertEquals(String.valueOf(upload), Analytics.NOWHERE, Analytics.endpoint(upload));
        }
    }

    @Test
    public void nowhereIsTheLoopbackAddressOverHttps() {
        URI nowhere = URI.create(Analytics.NOWHERE);
        assertEquals("https", nowhere.getScheme());
        assertEquals("127.0.0.1", nowhere.getHost());
        assertTrue("a port below 1024 that no app can listen on", nowhere.getPort() > 0 && nowhere.getPort() < 1024);
    }

    @Test
    public void theSwitchOffLeavesTheAddressAlone() {
        Settings.DISABLE_ANALYTICS.save(false);
        String upload = "https://graph.facebook.com/logging_client_events";
        assertEquals(upload, Analytics.endpoint(upload));
    }
}
