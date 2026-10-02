/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.shadows.ShadowLog;

import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.SettingsContextRule;
import app.hushgram.extension.shared.settings.BaseSettings;
import app.hushgram.extension.shared.settings.preference.LogBufferManager;

/** Disable analytics' address swap, and the debug log that says what each address met. */
@RunWith(RobolectricTestRunner.class)
public class AnalyticsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final String EVENTS = "https://graph.instagram.com/logging_client_events?access_token=secret#frag";

    @Before
    public void start() {
        Analytics.forget();
        BaseSettings.DEBUG.save(true);
        LogBufferManager.clearLogBuffer();
        ShadowLog.reset();
    }

    @After
    public void restore() {
        Settings.DISABLE_ANALYTICS.resetToDefault();
        BaseSettings.DEBUG.resetToDefault();
        LogBufferManager.clearLogBuffer();
        Analytics.forget();
    }

    @Test
    public void onTheAddressGoesToTheRefusedPortKeepingItsPath() {
        Settings.DISABLE_ANALYTICS.save(true);
        assertEquals("https://127.0.0.1:9/logging_client_events?access_token=secret#frag", Analytics.endpoint(EVENTS));
        assertEquals("https://127.0.0.1:9/", Analytics.endpoint("mqtt.example"));
        assertNull(Analytics.endpoint(null));
    }

    @Test
    public void offTheAddressGoesOutAsItCame() {
        Settings.DISABLE_ANALYTICS.save(false);
        assertEquals(EVENTS, Analytics.endpoint(EVENTS));
    }

    /**
     * On, Falco's event stream stays off, so every event takes the batch upload the switch refuses.
     * Off, the logger's own answer goes through, and an event it never meant to stream stays off it.
     */
    @Test
    public void theEventStreamFollowsTheSwitch() {
        Settings.DISABLE_ANALYTICS.save(true);
        assertEquals(0, Analytics.streamEvents(1));
        assertEquals(0, Analytics.streamEvents(0));

        Settings.DISABLE_ANALYTICS.save(false);
        assertEquals(1, Analytics.streamEvents(1));
        assertEquals(0, Analytics.streamEvents(0));
    }

    /**
     * On, the contacts and location setup screens are skipped and every other screen opens. Off,
     * they open too, since Instagram then hears that they were seen.
     */
    @Test
    public void theSetupScreensFollowTheSwitch() {
        Settings.DISABLE_ANALYTICS.save(true);
        assertEquals(1, Analytics.setupScreen("com.bloks.www.bloks.ig.ndx.ci.entry.screen"));
        assertEquals(1, Analytics.setupScreen("com.bloks.www.bloks.ig.ndx.ls.entry.screen"));
        assertEquals(0, Analytics.setupScreen("com.bloks.www.bloks.ig.ndx.ci.entry.screen.other"));
        assertEquals(0, Analytics.setupScreen("com.bloks.www.ig.account_center"));
        assertEquals(0, Analytics.setupScreen(null));

        Settings.DISABLE_ANALYTICS.save(false);
        assertEquals(0, Analytics.setupScreen("com.bloks.www.bloks.ig.ndx.ci.entry.screen"));
        assertEquals(0, Analytics.setupScreen("com.bloks.www.bloks.ig.ndx.ls.entry.screen"));
    }

    /** Before the settings are ready the stream stays off, even with the switch off: the event is batched instead. */
    @Test
    public void beforeTheSettingsAreReadyTheStreamStaysOff() {
        Settings.DISABLE_ANALYTICS.save(false);
        int[] answer = new int[1];
        SettingsContextRule.withoutContext(() -> answer[0] = Analytics.streamEvents(1));

        assertEquals(0, answer[0]);
    }

    private static final String REPORTS = "https://b-www.facebook.com/mobile/reliability_event_log_upload/";

    /** Lacrima's report address follows the switch once the settings are ready, keeping its path. */
    @Test
    public void theCrashReportAddressFollowsTheSwitch() {
        Settings.DISABLE_ANALYTICS.save(true);
        assertEquals("https://127.0.0.1:9/mobile/reliability_event_log_upload/", Analytics.reportEndpoint(REPORTS));
        assertNull(Analytics.reportEndpoint(null));

        Settings.DISABLE_ANALYTICS.save(false);
        assertEquals(REPORTS, Analytics.reportEndpoint(REPORTS));
    }

    /**
     * Lacrima sends its pending reports as Instagram starts, on a thread of its own, before HushGram
     * can read a switch, and they're refused then even with the switch off. A usage event in that
     * window still goes out.
     */
    @Test
    public void beforeTheSettingsAreReadyACrashReportIsRefused() {
        Settings.DISABLE_ANALYTICS.save(false);
        String[] answers = new String[2];
        SettingsContextRule.withoutContext(() -> {
            answers[0] = Analytics.reportEndpoint(REPORTS);
            answers[1] = Analytics.endpoint(EVENTS);
        });

        assertEquals("https://127.0.0.1:9/mobile/reliability_event_log_upload/", answers[0]);
        assertEquals(EVENTS, answers[1]);
    }

    /**
     * Instagram's main thread waits for Lacrima's startup send before it gets to setContext, so the
     * report must answer at once off the main thread too. A wait for the settings stalled 449's
     * start by the length of the wait.
     */
    @Test
    public void aCrashReportOffTheMainThreadAnswersAtOnce() throws InterruptedException {
        String[] answer = new String[1];
        Thread lacrima = new Thread(() -> answer[0] = Analytics.reportEndpoint(REPORTS));
        SettingsContextRule.withoutContext(() -> {
            lacrima.start();
            try {
                lacrima.join(1_000);
            } catch (InterruptedException e) {
                throw new AssertionError(e);
            }
            assertFalse("the report waited for the settings", lacrima.isAlive());
        });

        assertEquals("https://127.0.0.1:9/mobile/reliability_event_log_upload/", answer[0]);
    }

    /**
     * Each address and outcome is logged once. Logcat on a debugging phone gets the address without
     * the query that could carry a token; the exported report keeps the outcome and the process and
     * leaves the address out, as it does every link.
     */
    @Test
    public void theLogNamesEachAddressOnceWithoutItsQuery() {
        Settings.DISABLE_ANALYTICS.save(true);
        Analytics.endpoint(EVENTS);
        Analytics.endpoint(EVENTS);
        Settings.DISABLE_ANALYTICS.save(false);
        Analytics.endpoint(EVENTS);

        StringBuilder logcat = new StringBuilder();
        for (ShadowLog.LogItem item : ShadowLog.getLogs()) logcat.append(item.msg).append(' ');
        String raw = logcat.toString();
        assertEquals(raw, 1, count(raw, "https://graph.instagram.com/logging_client_events refused ("));
        assertEquals(raw, 1, count(raw, "https://graph.instagram.com/logging_client_events went out as it came, the switch is off ("));
        assertFalse(raw, raw.contains("secret"));
        assertFalse(raw, raw.contains("frag"));

        String report = LogBufferManager.buildExportText();
        assertEquals(report, 1, count(report, "Disable analytics: [url omitted] refused ("));
        assertEquals(report, 1, count(report, "Disable analytics: [url omitted] went out as it came, the switch is off ("));
    }

    /** The log stops naming new addresses after a handful, so a stream of distinct ones can't fill it. */
    @Test
    public void theLogNamesAHandfulOfAddresses() {
        Settings.DISABLE_ANALYTICS.save(true);
        for (int i = 0; i < Analytics.LOGGED_ADDRESSES + 5; i++) Analytics.endpoint("https://host" + i + ".example/events");

        String log = LogBufferManager.buildExportText();
        assertEquals(log, Analytics.LOGGED_ADDRESSES, count(log, " refused ("));
    }

    @Test
    public void theQueryAndFragmentAreCutOff() {
        assertEquals("https://a.example/p", Analytics.withoutQuery("https://a.example/p?x=1#y"));
        assertEquals("https://a.example/p", Analytics.withoutQuery("https://a.example/p#y?x=1"));
        assertEquals("https://a.example/p", Analytics.withoutQuery("https://a.example/p"));
    }

    private static int count(String text, String part) {
        return text.split(java.util.regex.Pattern.quote(part), -1).length - 1;
    }
}
