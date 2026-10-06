/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.privacy;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import java.io.IOException;
import java.lang.reflect.Field;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLStreamHandler;
import java.util.Collections;
import java.util.EnumSet;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.pinterest.settings.PatchFamily;
import app.hushpinterest.extension.pinterest.settings.PatchFamilyForTests;
import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.settings.HushPinterestPause;
import app.hushpinterest.extension.shared.settings.PauseForTests;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class AnalyticsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    enum Task {
        TAG_APPSFLYER_INIT, TAG_FIREBASE_ANALYTICS_INIT, TAG_ADS_OPEN_MEASUREMENT_SDK_INIT, TAG_RECAPTCHA_FOR_AUTH,
        TAG_WORKMANAGER_INIT, TAG_ADD_ACCOUNT, TAG_MAIN_ACTIVITY_START_SERVICES, TAG_TRACKING_REQUESTS
    }

    @Before public void installedBuild() throws ReflectiveOperationException {
        installed(true);
    }

    @After public void restore() throws ReflectiveOperationException {
        PauseForTests.resume();
        Settings.DISABLE_ANALYTICS.resetToDefault();
        PatchFamilyForTests.capabilities(null);
        installed(null);
    }

    @Test public void blocksAnalyticsTasksAndPreservesAuthAndCoreTasks() {
        assertTrue(Analytics.blockTask(Task.TAG_APPSFLYER_INIT));
        assertTrue(Analytics.blockTask(Task.TAG_FIREBASE_ANALYTICS_INIT));
        assertTrue(Analytics.blockTask(Task.TAG_ADS_OPEN_MEASUREMENT_SDK_INIT));
        assertFalse(Analytics.blockTask(Task.TAG_RECAPTCHA_FOR_AUTH));
        assertFalse(Analytics.blockTask(Task.TAG_WORKMANAGER_INIT));
        assertFalse(Analytics.blockTask(Task.TAG_ADD_ACCOUNT));
        assertFalse(Analytics.blockTask(Task.TAG_MAIN_ACTIVITY_START_SERVICES));
        // Keep the deferred tracking queue running so its wrappers can drain completed values.
        assertFalse(Analytics.blockTask(Task.TAG_TRACKING_REQUESTS));
        assertFalse(Analytics.blockTask(null));
        assertFalse(Analytics.blockTask("TAG_APPSFLYER_INIT"));
    }

    @Test public void pausedDisabledAndColdStartUploadHooksAllowTheOriginalPath() {
        assertTrue(Analytics.blockUpload());
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        assertFalse(Analytics.blockUpload());
        assertFalse(Analytics.blockTask(Task.TAG_APPSFLYER_INIT));
        PauseForTests.resume();
        Settings.DISABLE_ANALYTICS.save(false);
        assertFalse(Analytics.blockUpload());
        Settings.DISABLE_ANALYTICS.save(true);
        SettingsContextRule.withoutContext(() -> assertFalse(Analytics.blockUpload()));
    }

    @Test public void suppressedSdkRequestCompletesLocallyWithoutOpeningTheOriginalConnection() throws IOException {
        ProbeHandler handler = new ProbeHandler();
        URL url = new URL(null, "https://appsflyer.example/event", handler);
        HttpURLConnection connection = (HttpURLConnection) Analytics.openConnection(url);
        connection.getOutputStream().write(new byte[]{1, 2, 3});
        assertEquals(200, connection.getResponseCode());
        assertEquals("{}", new String(connection.getInputStream().readAllBytes(), java.nio.charset.StandardCharsets.UTF_8));
        assertEquals(0, handler.opened);
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        URLConnection restored = Analytics.openConnection(url);
        assertSame(handler.original, restored);
        assertEquals(1, handler.opened);
    }

    @Test public void engageServiceIsWithheldOnlyWhileTheSwitchIsActive() {
        Object service = new Object();
        assertNull(Analytics.engageService(service));
        assertNull(Analytics.engageService(null));
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        assertSame(service, Analytics.engageService(service));
        PauseForTests.resume();
        Settings.DISABLE_ANALYTICS.save(false);
        assertSame(service, Analytics.engageService(service));
        Settings.DISABLE_ANALYTICS.save(true);
        SettingsContextRule.withoutContext(() -> assertSame(service, Analytics.engageService(service)));
    }

    @Test public void retainedPartialHooksRemainInactiveUntilTheFamilyIsInstalled() throws Exception {
        Settings.DISABLE_ANALYTICS.save(true);
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.ANALYTICS_TASKS,
                PatchFamily.Capability.ANALYTICS_UPLOADS));
        installed(false);
        assertFalse(Analytics.blockUpload());
        assertFalse(Analytics.blockTask(Task.TAG_APPSFLYER_INIT));
        Object service = new Object();
        assertSame(service, Analytics.engageService(service));
        ProbeHandler handler = new ProbeHandler();
        URL url = new URL(null, "https://appsflyer.example/event", handler);
        URLConnection original = Analytics.openConnection(url);
        assertSame(handler.original, original);
        assertEquals(1, handler.opened);
        installed(true);
        assertTrue(Analytics.blockUpload());
    }

    private static void installed(Boolean present) throws ReflectiveOperationException {
        Field field = PatchFamily.class.getDeclaredField("inBuildForTests");
        field.setAccessible(true);
        field.set(null, present == null ? null : present ? EnumSet.of(PatchFamily.DISABLE_ANALYTICS) : Collections.emptySet());
    }

    private static final class ProbeHandler extends URLStreamHandler {
        int opened;
        URLConnection original;
        @Override protected URLConnection openConnection(URL url) {
            opened++;
            original = new URLConnection(url) { @Override public void connect() {} };
            return original;
        }
    }
}
