package app.hushmessenger.extension;

import java.util.Arrays;
import java.util.Collections;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class MqttTelemetryTest {
    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        CrashGuard.resetForTests();
    }

    @Test public void onlyTheLoggingTopicsAreDroppedAndOnlyWhileTheSwitchIsOn() {
        assertFalse(Settings.dropMqttPublish("/mqtt_health_stats"));
        assertTrue("The health report stays the keepalive while the switch is off", Settings.mqttHealthKeepalive(true));
        assertEquals(0, Settings.lastActive("mqtt_telemetry"));
        Settings.preferences.edit().putBoolean("analytics_uploads", true).putBoolean("ad_events", true).commit();
        assertFalse("The other privacy switches leave MQTT alone", Settings.dropMqttPublish("/fbns_exp_logging"));

        Settings.preferences.edit().clear().putBoolean("mqtt_telemetry", true).commit();
        assertTrue(Settings.dropMqttPublish("/mqtt_health_stats"));
        assertTrue(Settings.dropMqttPublish("/fbns_exp_logging"));
        for (String topic : new String[] {"/t_sm", "/send_message2", "/t_ms", "/messenger_sync_get_diffs", "/t_thread_typing", "/t_rtc_log", "/mqtt_health_stats/", "", null})
            assertFalse("Messages, typing, presence and calls still go out: " + topic, Settings.dropMqttPublish(topic));
        assertTrue(Settings.lastActive("mqtt_telemetry") > 0);
        assertFalse("The keepalive sends the plain ping", Settings.mqttHealthKeepalive(true));
        assertFalse("A config that already pings plainly keeps doing so", Settings.mqttHealthKeepalive(false));
        assertFalse("The MQTT switch leaves analytics alone", Settings.stopAnalyticsUploads());

        Settings.preferences.edit().putBoolean("mqtt_telemetry", false).commit();
        assertFalse("The next report after switching off goes out", Settings.dropMqttPublish("/mqtt_health_stats"));
        assertTrue(Settings.mqttHealthKeepalive(true));
    }

    @Test public void offPauseSafeModeAndAMissingControlLeaveTheConnectionStock() {
        for (String state : new String[] {"off", "paused", "safe", "missing"}) {
            Settings.initialize(RuntimeEnvironment.getApplication());
            Settings.preferences.edit().clear().putBoolean("mqtt_telemetry", !state.equals("off"))
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            if (state.equals("missing")) Settings.installed = Collections.emptySet();
            Settings.activeAt.clear();
            assertFalse(state, Settings.dropMqttPublish("/mqtt_health_stats"));
            assertTrue(state, Settings.mqttHealthKeepalive(true));
            assertEquals(state, 0, Settings.lastActive("mqtt_telemetry"));
        }
    }

    @Test public void theSwitchSitsUnderPrivacyAndStartsOff() {
        assertTrue(Settings.installed.contains("mqtt_telemetry"));
        String[] row = Arrays.stream(SettingsActivity.CONTROLS).filter(c -> c[0].equals("mqtt_telemetry")).findFirst().orElseThrow();
        assertEquals("Stop live connection logging", row[1]);
        assertEquals("tracking", row[3]);
        assertFalse(Settings.preferences.contains("mqtt_telemetry"));
        assertFalse(Settings.wouldUse("mqtt_telemetry"));
    }
}
