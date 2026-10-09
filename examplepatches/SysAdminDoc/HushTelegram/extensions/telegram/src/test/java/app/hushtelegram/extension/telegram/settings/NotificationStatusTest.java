/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.app.NotificationManager;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.ContextWrapper;
import android.preference.Preference;
import android.provider.MediaStore;

import java.io.ByteArrayOutputStream;
import java.nio.charset.StandardCharsets;
import java.util.Collections;
import java.util.EnumSet;
import java.util.Map;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.shadows.ShadowLooper;
import org.telegram.tgnet.TLRPC;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.BaseSettings;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.preference.LogBufferManager;
import app.hushtelegram.extension.shared.settings.preference.LogBufferManagerExportTest;
import app.hushtelegram.extension.telegram.misc.FirebasePush;
import app.hushtelegram.extension.telegram.misc.FirebasePushTest;

/** Only the test shadow supplies synthetic native answers; fixture tests prove the shipped readers. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, shadows = NotificationStatusTest.LocalReaders.class)
public class NotificationStatusTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    private static final String PRIVATE_CANARY = "synthetic-private-token-apiHash-account-id-983771";

    @Before public void setUp() {
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.REPAIR_FIREBASE_PUSH);
        PatchFamily.capabilitiesForTests = EnumSet.of(PatchFamily.Capability.FIREBASE_LOCAL_STATUS);
        LocalReaders.token = 1;
        LocalReaders.counts = 2 | (1 << 8);
        LocalReaders.brokenToken = LocalReaders.brokenCounts = false;
        LocalReaders.reads = 0;
        BaseSettings.DEBUG.save(false);
        HookStatus.clear();
        LogBufferManager.clearLogBuffer();
        Shadows.shadowOf(manager()).setNotificationsEnabled(true);
        PauseForTests.resume();
        FirebasePushTest.forgetAnswer();
    }

    @After public void restore() {
        PatchFamily.inBuildForTests = null;
        PatchFamily.capabilitiesForTests = null;
        Settings.REPAIR_FIREBASE_PUSH.resetToDefault();
        BaseSettings.DEBUG.resetToDefault();
        PauseForTests.resume();
        HookStatus.clear();
        LogBufferManager.clearLogBuffer();
        FirebasePushTest.forgetAnswer();
    }

    private static Context context() { return RuntimeEnvironment.getApplication(); }
    private static NotificationManager manager() { return context().getSystemService(NotificationManager.class); }

    @Test public void independentFactsKeepTheirValuesWithTheRepairOffAndEveryPauseReason() {
        Settings.REPAIR_FIREBASE_PUSH.save(false);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            PauseForTests.pause(reason);
            FirebasePush.LocalStatus status = FirebasePush.localStatus(context());
            assertEquals(Boolean.TRUE, status.notificationPermission);
            assertEquals(Boolean.TRUE, status.tokenPresent);
            assertEquals(2, status.activeAccounts);
            assertEquals(1, status.acknowledgedAccounts);
            assertEquals("none since start", status.pushAnswer);
            assertTrue(status.summary().contains("This doesn't confirm notification delivery."));
            assertFalse(Settings.REPAIR_FIREBASE_PUSH.savedValue());
            assertNull(Shadows.shadowOf(RuntimeEnvironment.getApplication()).getNextStartedActivity());
        }
        assertEquals(Collections.emptyList(), HookStatus.report());
    }

    @Test public void missingCapabilityNeverInvokesNativeReadersOrPretendsMissingDataIsZero() {
        PatchFamily.capabilitiesForTests = EnumSet.of(PatchFamily.Capability.FIREBASE_CERTIFICATE_HEADER);
        FirebasePush.LocalStatus status = FirebasePush.localStatus(context());
        assertEquals(Boolean.TRUE, status.notificationPermission);
        assertNull(status.tokenPresent);
        assertEquals(-1, status.activeAccounts);
        assertEquals(-1, status.acknowledgedAccounts);
        FirebasePush.registerDeviceAnswer(new TLRPC.TL_boolTrue(), null);
        assertNull(FirebasePush.localStatus(context()).pushAnswer);
        assertTrue(FirebasePush.localStatus(context()).summary().contains("Telegram's push answer: Unknown"));
        assertEquals(0, LocalReaders.reads);
    }

    @Test public void theSummaryNamesTelegramsLastAnswerToThePushRegistration() {
        assertTrue(FirebasePush.localStatus(context()).summary().contains("Telegram's push answer: None since Telegram started"));
        FirebasePush.registerDeviceAnswer(new TLRPC.TL_boolTrue(), null);
        assertTrue(FirebasePush.localStatus(context()).summary().contains("Telegram's push answer: Accepted"));
        FirebasePush.registerDeviceAnswer(new TLRPC.TL_boolFalse(), null);
        assertTrue(FirebasePush.localStatus(context()).summary().contains("Telegram's push answer: Refused\n"));
        FirebasePush.registerDeviceAnswer(null, new TLRPC.TL_error(400, "APP_PUSH_ERROR"));
        String summary = FirebasePush.localStatus(context()).summary();
        assertTrue(summary, summary.contains("Telegram's push answer: Refused (APP_PUSH_ERROR 400)"));
        FirebasePush.registerDeviceAnswer(null, new TLRPC.TL_error(-1000, PRIVATE_CANARY));
        summary = FirebasePush.localStatus(context()).summary();
        assertTrue(summary, summary.contains("Telegram's push answer: Refused (unreadable -1000)"));
        assertFalse(summary, summary.contains(PRIVATE_CANARY));
        LocalReaders.brokenToken = LocalReaders.brokenCounts = true;
        assertEquals("refused unreadable -1000", FirebasePush.localStatus(null).pushAnswer);
    }

    @Test public void missingInvalidAndUnreadableFactsStayIndependentAndUnknown() {
        for (int token : new int[]{-1, 2, Integer.MAX_VALUE}) {
            LocalReaders.token = token;
            assertNull(FirebasePush.localStatus(context()).tokenPresent);
            assertEquals(2, FirebasePush.localStatus(context()).activeAccounts);
        }
        LocalReaders.token = 0;
        for (int counts : new int[]{-1, 5, 1 | (2 << 8), Integer.MAX_VALUE}) {
            LocalReaders.counts = counts;
            FirebasePush.LocalStatus status = FirebasePush.localStatus(context());
            assertEquals(Boolean.FALSE, status.tokenPresent);
            assertEquals(-1, status.activeAccounts);
            assertEquals(-1, status.acknowledgedAccounts);
        }
        LocalReaders.counts = 0;
        LocalReaders.brokenToken = true;
        FirebasePush.LocalStatus status = FirebasePush.localStatus(context());
        assertNull(status.tokenPresent);
        assertEquals(0, status.activeAccounts);
        assertEquals(0, status.acknowledgedAccounts);
        LocalReaders.brokenToken = false;
        LocalReaders.brokenCounts = true;
        status = FirebasePush.localStatus(context());
        assertEquals(Boolean.FALSE, status.tokenPresent);
        assertEquals(-1, status.activeAccounts);
        assertEquals(Collections.emptyList(), HookStatus.report());
    }

    @Test public void permissionDistinguishesBlockedAllowedAndUnreadableWithoutChangingIt() {
        Shadows.shadowOf(manager()).setNotificationsEnabled(false);
        assertEquals(Boolean.FALSE, FirebasePush.localStatus(context()).notificationPermission);
        assertFalse(manager().areNotificationsEnabled());
        assertNull(FirebasePush.localStatus(null).notificationPermission);
        assertNull(FirebasePush.localStatus(new ContextWrapper(context()) {
            @Override public Object getSystemService(String name) { throw new SecurityException(PRIVATE_CANARY); }
        }).notificationPermission);
        Shadows.shadowOf(manager()).setNotificationsEnabled(true);
        assertEquals(Boolean.TRUE, FirebasePush.localStatus(context()).notificationPermission);
    }

    @Test @Config(sdk = 33)
    public void android13RequiresTheRuntimePermissionAsWellAsTheAppNotificationGate() {
        Shadows.shadowOf(RuntimeEnvironment.getApplication()).denyPermissions("android.permission.POST_NOTIFICATIONS");
        assertEquals(Boolean.FALSE, FirebasePush.localStatus(context()).notificationPermission);
        Shadows.shadowOf(RuntimeEnvironment.getApplication()).grantPermissions("android.permission.POST_NOTIFICATIONS");
        assertEquals(Boolean.TRUE, FirebasePush.localStatus(context()).notificationPermission);
        Shadows.shadowOf(manager()).setNotificationsEnabled(false);
        assertEquals(Boolean.FALSE, FirebasePush.localStatus(context()).notificationPermission);
    }

    @Test public void readOnlyRowRefreshesLocalFactsWhenThePageResumes() {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushTelegramPreferenceFragment page = new HushTelegramPreferenceFragment();
            controller.get().getFragmentManager().beginTransaction().add(android.R.id.content, page).commitNow();
            Preference status = page.findPreference("local_notification_status");
            assertTrue(status.getSummary().toString().contains("Signed-in accounts: 2"));
            LocalReaders.token = LocalReaders.counts = 0;
            Shadows.shadowOf(manager()).setNotificationsEnabled(false);
            page.onResume();
            assertTrue(status.getSummary().toString().contains("Notification permission: Blocked"));
            assertTrue(status.getSummary().toString().contains("Push token saved: No"));
            assertTrue(status.getSummary().toString().contains("Signed-in accounts: 0"));
            FirebasePush.registerDeviceAnswer(new TLRPC.TL_boolTrue(), null);
            page.onResume();
            assertTrue(status.getSummary().toString().contains("Telegram's push answer: Accepted"));
            assertFalse(status.isSelectable());
            assertNull(status.getIntent());
        }
    }

    @Test public void fiveTranslationsPreserveSeparateLabelsBooleansCountsAndUnknownState() throws Exception {
        String[][] languages = {{"de", "de"}, {"es", "es"}, {"in-rID", "in"}, {"pt-rBR", "pt-rbr"}, {"tr", "tr"}};
        for (String[] language : languages) {
            RuntimeEnvironment.setQualifiers("+" + language[0]);
            Map<String, String> table = SettingsL10nTest.TranslationsForTests.of(language[1]);
            String[] labels = {"Notification permission: %1$s", "Push token saved: %1$s", "Signed-in accounts: %1$s", "Accounts confirmed for push: %1$s",
                    "Telegram's push answer: %1$s"};
            for (int state = 0; state < 3; state++) {
                LocalReaders.token = state == 0 ? -1 : state == 1 ? 1 : 0;
                LocalReaders.counts = state == 0 ? -1 : state == 1 ? 2 | (1 << 8) : 0;
                Shadows.shadowOf(manager()).setNotificationsEnabled(state == 1);
                FirebasePushTest.forgetAnswer();
                if (state == 1) FirebasePush.registerDeviceAnswer(new TLRPC.TL_boolTrue(), null);
                if (state == 2) FirebasePush.registerDeviceAnswer(null, new TLRPC.TL_error(400, "APP_PUSH_ERROR"));
                String[] values = state == 0 ? new String[]{table.get("Unknown"), table.get("Unknown"), table.get("Unknown"), table.get("Unknown"),
                        table.get("None since Telegram started")}
                        : state == 1 ? new String[]{table.get("Allowed"), table.get("Yes"), "2", "1", table.get("Accepted")}
                        : new String[]{table.get("Blocked"), table.get("No"), "0", "0",
                        String.format(table.get("Refused (%1$s)"), "APP_PUSH_ERROR 400")};
                String summary = FirebasePush.localStatus(state == 0 ? null : context()).summary();
                for (int label = 0; label < labels.length; label++) {
                    assertTrue(language[0] + ": " + summary, summary.contains(String.format(table.get(labels[label]), values[label])));
                }
                assertTrue(summary.contains(table.get("Read-only local state. This doesn't confirm notification delivery.")));
            }
            FirebasePush.registerDeviceAnswer(new TLRPC.TL_boolFalse(), null);
            String summary = FirebasePush.localStatus(context()).summary();
            assertTrue(language[0] + ": " + summary,
                    summary.contains(String.format(table.get("Telegram's push answer: %1$s"), table.get("Refused"))));
        }
    }

    @Test public void bothExportsCarryOnlyTheBooleanAndAggregateCountsEvenAfterReaderFailures() throws Exception {
        PatchFamily.registerDiagnostics();
        FirebasePush.registerDeviceAnswer(new TLRPC.TL_boolFalse(), new TLRPC.TL_error(400, PRIVATE_CANARY));
        for (boolean unreadable : new boolean[]{false, true}) {
            LocalReaders.brokenToken = LocalReaders.brokenCounts = unreadable;
            for (String report : bothExports()) {
                assertTrue(report, report.contains("notification permission: allowed"));
                assertTrue(report, report.contains("token present: " + (unreadable ? "unknown" : "true")));
                assertTrue(report, report.contains("active accounts: " + (unreadable ? "unknown" : "2")));
                assertTrue(report, report.contains("acknowledged accounts: " + (unreadable ? "unknown" : "1")));
                assertTrue(report, report.contains("push registration answer: refused unreadable 400"));
                assertTrue(report, report.contains("push registrations refused 1"));
                assertTrue(report, report.contains("local state only; notification delivery is unverified"));
                assertFalse(report, report.contains(PRIVATE_CANARY));
                assertFalse(report, report.contains("SecurityException"));
            }
        }
        PatchFamily.inBuildForTests = EnumSet.noneOf(PatchFamily.class);
        LocalReaders.reads = 0;
        for (String report : bothExports()) {
            assertFalse(report, report.contains("notification permission:"));
            assertFalse(report, report.contains("token present:"));
            assertFalse(report, report.contains("push registration answer:"));
        }
        assertEquals(0, LocalReaders.reads);
        assertNull(Shadows.shadowOf(RuntimeEnvironment.getApplication()).getNextStartedActivity());
    }

    private static String[] bothExports() throws Exception {
        LogBufferManager.exportToClipboard();
        Utils.awaitBackgroundTasksForTests();
        ShadowLooper.idleMainLooper();
        String copied = context().getSystemService(ClipboardManager.class).getPrimaryClip().getItemAt(0).getText().toString();
        Robolectric.setupContentProvider(LogBufferManagerExportTest.Downloads.class, MediaStore.AUTHORITY);
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        Shadows.shadowOf(context().getContentResolver()).registerOutputStream(
                android.content.ContentUris.withAppendedId(MediaStore.Downloads.EXTERNAL_CONTENT_URI, 1), bytes);
        LogBufferManager.exportToFile();
        Utils.awaitBackgroundTasksForTests();
        ShadowLooper.idleMainLooper();
        return new String[]{copied, bytes.toString(StandardCharsets.UTF_8.name())};
    }

    @Implements(value = FirebasePush.class, isInAndroidSdk = false)
    public static class LocalReaders {
        static int token, counts, reads;
        static boolean brokenToken, brokenCounts;
        @Implementation protected static int nativeTokenPresence() {
            reads++;
            if (brokenToken) throw new SecurityException(PRIVATE_CANARY);
            return token;
        }
        @Implementation protected static int nativeAccountCounts() {
            reads++;
            if (brokenCounts) throw new SecurityException(PRIVATE_CANARY);
            return counts;
        }
    }
}
