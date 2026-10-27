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
import java.util.List;
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
    private static final long ALICE = 918337771L;
    private static final long BOB = 918337772L;

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
            assertEquals(Collections.emptyList(), status.pushReplies);
            assertTrue(status.summary().contains("It doesn't prove notifications will arrive."));
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
        FirebasePushTest.signUp(new FirebasePushTest.Place(ALICE), FirebasePushTest.FIREBASE, new TLRPC.TL_boolTrue(), null);
        assertNull(FirebasePush.localStatus(context()).pushReplies);
        assertTrue(FirebasePush.localStatus(context()).summary().contains("Telegram's reply to notification sign-up: Unknown"));
        assertEquals(0, LocalReaders.reads);
    }

    @Test public void theSummaryNamesTelegramsLastAnswerToThePushRegistration() {
        FirebasePushTest.Place place = new FirebasePushTest.Place(ALICE);
        assertTrue(FirebasePush.localStatus(context()).summary().contains("Telegram's reply to notification sign-up: No reply since Telegram started"));
        FirebasePushTest.signUp(place, FirebasePushTest.FIREBASE, new TLRPC.TL_boolTrue(), null);
        String summary = FirebasePush.localStatus(context()).summary();
        assertTrue(summary, summary.contains("Telegram's reply to account 1 on Firebase: Accepted, less than a minute ago\n"));
        assertFalse(summary, summary.contains("Telegram's reply to notification sign-up"));
        FirebasePushTest.signUp(place, FirebasePushTest.FIREBASE, new TLRPC.TL_boolFalse(), null);
        summary = FirebasePush.localStatus(context()).summary();
        assertTrue(summary, summary.contains("Telegram's reply to account 1 on Firebase: Refused, less than a minute ago\n"));
        FirebasePushTest.signUp(place, FirebasePushTest.FIREBASE, null, new TLRPC.TL_error(400, "APP_PUSH_ERROR"));
        summary = FirebasePush.localStatus(context()).summary();
        assertTrue(summary, summary.contains("Telegram's reply to account 1 on Firebase: Refused (APP_PUSH_ERROR 400), less than a minute ago\n"));
        FirebasePushTest.signUp(place, FirebasePushTest.FIREBASE, null, new TLRPC.TL_error(-1000, PRIVATE_CANARY));
        summary = FirebasePush.localStatus(context()).summary();
        assertTrue(summary, summary.contains("Telegram's reply to account 1 on Firebase: Refused (unreadable -1000), less than a minute ago\n"));
        assertFalse(summary, summary.contains(PRIVATE_CANARY));
        LocalReaders.brokenToken = LocalReaders.brokenCounts = true;
        List<FirebasePush.Reply> replies = FirebasePush.localStatus(null).pushReplies;
        assertEquals(1, replies.size());
        assertEquals("refused unreadable -1000", replies.get(0).answer);
    }

    /**
     * Two accounts, one of them on both push services, and a reply nothing is known about. Each
     * gets its own line, in the dialog and in both exports, and no line says who an account is.
     */
    @Test public void everyAccountAndTransportKeepsItsOwnLineAndNoneSaysWhoItIs() throws Exception {
        PatchFamily.registerDiagnostics();
        FirebasePushTest.Place first = new FirebasePushTest.Place(ALICE);
        FirebasePushTest.Place second = new FirebasePushTest.Place(BOB);
        FirebasePushTest.signUp(first, FirebasePushTest.FIREBASE, new TLRPC.TL_boolTrue(), null);
        FirebasePushTest.signUp(second, FirebasePushTest.FIREBASE, null, new TLRPC.TL_error(400, "APP_PUSH_APIKEY_MISSING"));
        FirebasePushTest.signUp(first, FirebasePushTest.UNIFIED_PUSH, new TLRPC.TL_boolFalse(), null);
        // No sign-up on record, from something that isn't a controller, on a token type nothing here sends.
        FirebasePush.registerDeviceAnswer(new Object(), 13, new TLRPC.TL_boolTrue(), null);
        FirebasePushTest.age(7 * 60_000L);

        String summary = FirebasePush.localStatus(context()).summary();
        assertTrue(summary, summary.contains("\nTelegram's reply to account 1 on Firebase: Accepted, 7 min ago"
                + "\nTelegram's reply to account 1 on UnifiedPush: Refused, 7 min ago"
                + "\nTelegram's reply to account 2 on Firebase: Refused (APP_PUSH_APIKEY_MISSING 400), 7 min ago"
                + "\nTelegram's reply to account Unknown on Unknown: Accepted, 7 min ago"
                // The refused key is the server's to fix, and the line under the replies says so.
                + "\nAPP_PUSH_APIKEY_MISSING means Telegram's servers have no push key set up for this app. That's "
                + "configured on Telegram's side, so no setting on this phone fixes it."
                // The second account's Firebase refusal turned Telegram's own connection on.
                + "\nKeep-Alive Service and Background Connection on: Yes"
                + "\n\nThis only shows what's saved on this phone. It doesn't prove notifications will arrive."));
        assertFalse(summary, summary.contains(Long.toString(ALICE)));
        assertFalse(summary, summary.contains(Long.toString(BOB)));
        for (String report : bothExports()) {
            assertTrue(report, report.contains("push registration answer: account 1, firebase, accepted, 420 s ago"));
            assertTrue(report, report.contains("push registration answer: account 1, unifiedpush, refused, 420 s ago"));
            assertTrue(report, report.contains("push registration answer: account 2, firebase, refused APP_PUSH_APIKEY_MISSING 400, 420 s ago"));
            assertTrue(report, report.contains("push registration answer: account unknown, unknown, accepted, 420 s ago"));
            assertTrue(report, report.contains("local state only; notification delivery is unverified"));
            assertFalse(report, report.contains(Long.toString(ALICE)));
            assertFalse(report, report.contains(Long.toString(BOB)));
        }

        // The second account signs out. Its line goes, and the first account's stay as they were.
        second.user = 0;
        summary = FirebasePush.localStatus(context()).summary();
        assertTrue(summary, summary.contains("Telegram's reply to account 1 on UnifiedPush: Refused, 7 min ago"));
        assertFalse(summary, summary.contains("account 2"));
    }

    /**
     * The details come in three parts, each with its own fix: what Android allows on this phone
     * (permission, background use, battery optimization), the push service, and Telegram's answers
     * for each account. Android's two background facts are read and never changed, and stay Unknown
     * when they can't be read.
     */
    @Test public void theDetailsSplitIntoThisPhoneThePushServiceAndTheAccounts() throws Exception {
        PatchFamily.registerDiagnostics();
        android.app.ActivityManager activities = context().getSystemService(android.app.ActivityManager.class);
        android.os.PowerManager power = context().getSystemService(android.os.PowerManager.class);
        String app = context().getPackageName();
        Shadows.shadowOf(activities).setBackgroundRestricted(true);
        Shadows.shadowOf(power).setIgnoringBatteryOptimizations(app, false);
        FirebasePush.LocalStatus status = FirebasePush.localStatus(context());
        assertEquals(Boolean.TRUE, status.backgroundRestricted);
        assertEquals(Boolean.TRUE, status.batteryOptimized);
        assertTrue(status.androidLimitsBackground());
        String summary = status.summary();
        assertTrue(summary, summary.startsWith("On this phone\nNotification permission: Allowed\nBackground use: Restricted"
                + "\nBattery optimization: On\n\nPush service\nNotification ID saved on this phone: Yes\n\nTelegram accounts"
                + "\nSigned-in accounts: 2\nAccounts Telegram confirmed for notifications: 1\n"));
        assertFalse("UnifiedPush isn't in this build", summary.contains("UnifiedPush:"));
        assertFalse("no reply named the missing key", summary.contains("APP_PUSH_APIKEY_MISSING"));
        assertTrue(summary, summary.endsWith("\n\nThis only shows what's saved on this phone. It doesn't prove notifications will arrive."));
        for (String report : bothExports()) {
            assertTrue(report, report.contains("background restricted: true"));
            assertTrue(report, report.contains("battery optimized: true"));
        }
        assertTrue("reading the status changed Android's setting", activities.isBackgroundRestricted());
        assertFalse(power.isIgnoringBatteryOptimizations(app));
        assertNull(Shadows.shadowOf(RuntimeEnvironment.getApplication()).getNextStartedActivity());

        Shadows.shadowOf(activities).setBackgroundRestricted(false);
        Shadows.shadowOf(power).setIgnoringBatteryOptimizations(app, true);
        status = FirebasePush.localStatus(context());
        assertFalse(status.androidLimitsBackground());
        assertTrue(status.summary(), status.summary().contains("\nBackground use: Allowed\nBattery optimization: Off\n\n"));

        for (Context unreadable : new Context[]{null, new ContextWrapper(context()) {
            @Override public Object getSystemService(String name) { throw new SecurityException(PRIVATE_CANARY); }
        }}) {
            status = FirebasePush.localStatus(unreadable);
            assertNull(status.backgroundRestricted);
            assertNull(status.batteryOptimized);
            assertFalse(status.androidLimitsBackground());
            assertTrue(status.summary(), status.summary().contains("\nBackground use: Unknown\nBattery optimization: Unknown\n\n"));
            assertFalse(status.summary().contains(PRIVATE_CANARY));
        }
    }

    /** With UnifiedPush in the build, the push service part says what the UnifiedPush app row says. */
    @Test public void theUnifiedPushAppsStateSitsWithThePushService() {
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.REPAIR_FIREBASE_PUSH, PatchFamily.UNIFIED_PUSH);
        String summary = FirebasePush.localStatus(context()).summary();
        assertTrue(summary, summary.contains("\nNotification ID saved on this phone: Yes"
                + "\nUnifiedPush: Install a UnifiedPush app like ntfy, then come back here.\n\nTelegram accounts\n"));
    }

    /**
     * App info, where Android keeps an app's background and battery settings, is offered only while
     * Android holds Telegram back, and the row reads the facts again when the page comes back.
     */
    @Test public void appInfoIsOfferedOnlyWhileAndroidHoldsTelegramBack() {
        android.app.ActivityManager activities = context().getSystemService(android.app.ActivityManager.class);
        android.os.PowerManager power = context().getSystemService(android.os.PowerManager.class);
        Shadows.shadowOf(activities).setBackgroundRestricted(false);
        Shadows.shadowOf(power).setIgnoringBatteryOptimizations(context().getPackageName(), true);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushTelegramPreferenceFragment page = new HushTelegramPreferenceFragment();
            controller.get().getFragmentManager().beginTransaction().add(android.R.id.content, page).commitNow();
            Preference status = page.findPreference("local_notification_status");
            assertTrue(status.getSummary().toString(), status.getSummary().toString().contains("\nBackground use: Allowed\n"));
            status.getOnPreferenceClickListener().onPreferenceClick(status);
            android.app.AlertDialog details = org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog();
            assertEquals(android.view.View.GONE, details.getButton(android.app.AlertDialog.BUTTON_NEUTRAL).getVisibility());
            details.dismiss();

            Shadows.shadowOf(activities).setBackgroundRestricted(true);
            page.onResume();
            assertTrue(status.getSummary().toString(), status.getSummary().toString().contains("\nBackground use: Restricted\n"));
            status.getOnPreferenceClickListener().onPreferenceClick(status);
            details = org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog();
            android.widget.Button appInfo = details.getButton(android.app.AlertDialog.BUTTON_NEUTRAL);
            assertEquals(android.view.View.VISIBLE, appInfo.getVisibility());
            assertEquals("Open app info", appInfo.getText().toString());
            appInfo.performClick();
            ShadowLooper.idleMainLooper();
            android.content.Intent launched = Shadows.shadowOf(controller.get()).getNextStartedActivity();
            assertEquals(android.provider.Settings.ACTION_APPLICATION_DETAILS_SETTINGS, launched.getAction());
            assertEquals("package:" + controller.get().getPackageName(), launched.getDataString());
            assertTrue("opening App info changed Android's setting", activities.isBackgroundRestricted());
        }
    }

    /**
     * Before Android 12, App info only reaches battery optimization a few taps in, so when that alone
     * holds Telegram back, the dialog opens Android's battery optimization list instead. From Android
     * 12, App info holds both.
     */
    @Test public void batteryOptimizationAloneOpensTheBatteryListBeforeAndroid12() {
        android.os.PowerManager power = context().getSystemService(android.os.PowerManager.class);
        Shadows.shadowOf(context().getSystemService(android.app.ActivityManager.class)).setBackgroundRestricted(false);
        Shadows.shadowOf(power).setIgnoringBatteryOptimizations(context().getPackageName(), false);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushTelegramPreferenceFragment page = new HushTelegramPreferenceFragment();
            controller.get().getFragmentManager().beginTransaction().add(android.R.id.content, page).commitNow();
            Preference status = page.findPreference("local_notification_status");
            status.getOnPreferenceClickListener().onPreferenceClick(status);
            android.app.AlertDialog details = org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog();
            android.widget.Button battery = details.getButton(android.app.AlertDialog.BUTTON_NEUTRAL);
            assertEquals(android.view.View.VISIBLE, battery.getVisibility());
            assertEquals("Open battery optimization", battery.getText().toString());
            battery.performClick();
            ShadowLooper.idleMainLooper();
            android.content.Intent launched = Shadows.shadowOf(controller.get()).getNextStartedActivity();
            assertEquals(android.provider.Settings.ACTION_IGNORE_BATTERY_OPTIMIZATION_SETTINGS, launched.getAction());
            assertFalse("opening the list changed Android's setting", power.isIgnoringBatteryOptimizations(context().getPackageName()));
        }

        FirebasePush.LocalStatus optimized = FirebasePush.localStatus(context());
        assertTrue(HushTelegramPreferenceFragment.batteryListFirst(optimized));
        int sdk = android.os.Build.VERSION.SDK_INT;
        try {
            org.robolectric.util.ReflectionHelpers.setStaticField(android.os.Build.VERSION.class, "SDK_INT", 31);
            assertFalse("Android 12 keeps battery optimization in App info", HushTelegramPreferenceFragment.batteryListFirst(optimized));
        } finally {
            org.robolectric.util.ReflectionHelpers.setStaticField(android.os.Build.VERSION.class, "SDK_INT", sdk);
        }
        // A restricted background is changed in App info on every version.
        Shadows.shadowOf(context().getSystemService(android.app.ActivityManager.class)).setBackgroundRestricted(true);
        assertFalse(HushTelegramPreferenceFragment.batteryListFirst(FirebasePush.localStatus(context())));
    }

    /** When Android won't open the page, a toast says so and nothing breaks. */
    @Test public void settingsPagesThatWontOpenSaySoInAToast() {
        Shadows.shadowOf(RuntimeEnvironment.getApplication()).checkActivities(true);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushTelegramPreferenceFragment.openAppInfo(controller.get());
            ShadowLooper.idleMainLooper();
            assertEquals("Couldn't open app info. Open Android settings.", org.robolectric.shadows.ShadowToast.getTextOfLatestToast());
            HushTelegramPreferenceFragment.openBatteryOptimization(controller.get());
            ShadowLooper.idleMainLooper();
            assertEquals("Couldn't open battery optimization. Open Android settings.",
                    org.robolectric.shadows.ShadowToast.getTextOfLatestToast());
            assertNull(Shadows.shadowOf(controller.get()).getNextStartedActivity());
        } finally {
            Shadows.shadowOf(RuntimeEnvironment.getApplication()).checkActivities(false);
        }
    }

    /** A phone whose battery optimization list won't open gets App info instead, with no toast saying neither opened. */
    @Test public void aBatteryListThatWontOpenFallsBackToAppInfo() {
        Context app = RuntimeEnvironment.getApplication();
        android.content.Intent details = new android.content.Intent(android.provider.Settings.ACTION_APPLICATION_DETAILS_SETTINGS,
                android.net.Uri.parse("package:" + app.getPackageName()));
        android.content.pm.ResolveInfo appInfo = new android.content.pm.ResolveInfo();
        appInfo.activityInfo = new android.content.pm.ActivityInfo();
        appInfo.activityInfo.packageName = "com.android.settings";
        appInfo.activityInfo.name = "com.android.settings.applications.InstalledAppDetails";
        Shadows.shadowOf(app.getPackageManager()).addResolveInfoForIntent(details, appInfo);
        Shadows.shadowOf(RuntimeEnvironment.getApplication()).checkActivities(true);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            org.robolectric.shadows.ShadowToast.reset();
            HushTelegramPreferenceFragment.openBatteryOptimization(controller.get());
            ShadowLooper.idleMainLooper();
            android.content.Intent launched = Shadows.shadowOf(controller.get()).getNextStartedActivity();
            assertEquals(android.provider.Settings.ACTION_APPLICATION_DETAILS_SETTINGS, launched.getAction());
            assertEquals("package:" + app.getPackageName(), launched.getDataString());
            assertFalse("the toast said nothing opened", "Couldn't open battery optimization. Open Android settings."
                    .equals(org.robolectric.shadows.ShadowToast.getTextOfLatestToast()));
        } finally {
            Shadows.shadowOf(RuntimeEnvironment.getApplication()).checkActivities(false);
        }
    }

    /** The battery list is tried first, and App info only once the list won't open. */
    @Test public void theBatteryListIsTriedBeforeAppInfo() {
        List<String> tried = new java.util.ArrayList<>();
        Context phone = new ContextWrapper(RuntimeEnvironment.getApplication()) {
            @Override public void startActivity(android.content.Intent intent) {
                tried.add(intent.getAction());
                if (android.provider.Settings.ACTION_IGNORE_BATTERY_OPTIMIZATION_SETTINGS.equals(intent.getAction())) {
                    throw new android.content.ActivityNotFoundException("no battery list");
                }
            }
        };
        org.robolectric.shadows.ShadowToast.reset();
        HushTelegramPreferenceFragment.openBatteryOptimization(phone);
        ShadowLooper.idleMainLooper();
        assertEquals(java.util.Arrays.asList(android.provider.Settings.ACTION_IGNORE_BATTERY_OPTIMIZATION_SETTINGS,
                android.provider.Settings.ACTION_APPLICATION_DETAILS_SETTINGS), tried);
        assertFalse("the toast said nothing opened", "Couldn't open battery optimization. Open Android settings."
                .equals(org.robolectric.shadows.ShadowToast.getTextOfLatestToast()));
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

    @Test public void localFactsRefreshAndDetailsKeepRegistrationSeparateFromPermission() {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushTelegramPreferenceFragment page = new HushTelegramPreferenceFragment();
            controller.get().getFragmentManager().beginTransaction().add(android.R.id.content, page).commitNow();
            Preference status = page.findPreference("local_notification_status");
            assertTrue(status.getSummary().toString().contains("Signed-in accounts: 2"));
            LocalReaders.token = LocalReaders.counts = 0;
            Shadows.shadowOf(manager()).setNotificationsEnabled(false);
            page.onResume();
            assertTrue(status.getSummary().toString().contains("Notification permission: Blocked"));
            assertTrue(status.getSummary().toString().contains("Signed-in accounts: 0"));
            FirebasePushTest.signUp(new FirebasePushTest.Place(ALICE), FirebasePushTest.FIREBASE, new TLRPC.TL_boolTrue(), null);
            page.onResume();
            assertTrue(status.isSelectable());
            assertNull(status.getIntent());
            status.getOnPreferenceClickListener().onPreferenceClick(status);
            android.app.AlertDialog details = org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog();
            String message = org.robolectric.Shadows.shadowOf(details).getMessage().toString();
            assertTrue(message.contains("Notification ID saved on this phone: No"));
            assertTrue(message, message.contains("Telegram's reply to account 1 on Firebase: Accepted, less than a minute ago"));
            assertTrue(message.contains("It doesn't prove notifications will arrive."));
            details.getButton(android.app.AlertDialog.BUTTON_POSITIVE).performClick();
            org.robolectric.shadows.ShadowLooper.idleMainLooper();
            android.content.Intent launched = org.robolectric.Shadows.shadowOf(controller.get()).getNextStartedActivity();
            assertEquals(android.provider.Settings.ACTION_APP_NOTIFICATION_SETTINGS, launched.getAction());
            assertEquals(controller.get().getPackageName(), launched.getStringExtra(android.provider.Settings.EXTRA_APP_PACKAGE));
        }
    }

    @Test public void theStatusSaysWhetherTelegramsOwnConnectionIsOnAndHowToTurnItOn() {
        android.content.SharedPreferences telegram = context().getSharedPreferences("Notifications", Context.MODE_PRIVATE);
        telegram.edit().clear().putBoolean("pushService", false).commit();
        FirebasePushTest.Place place = new FirebasePushTest.Place(ALICE);
        // A UnifiedPush refusal says nothing about Firebase, so it brings no hint.
        FirebasePushTest.signUp(place, FirebasePushTest.UNIFIED_PUSH, null, new TLRPC.TL_error(400, "APP_PUSH_ERROR"));
        String summary = FirebasePush.localStatus(context()).summary();
        assertTrue(summary, summary.contains("Keep-Alive Service and Background Connection on: No"));
        assertFalse(summary, summary.contains("Without push"));
        FirebasePushTest.signUp(place, FirebasePushTest.FIREBASE, null, new TLRPC.TL_error(400, "APP_PUSH_APIKEY_MISSING"));
        summary = FirebasePush.localStatus(context()).summary();
        assertTrue(summary, summary.contains("Keep-Alive Service and Background Connection on: No"));
        assertTrue(summary, summary.contains("Without push, turn both on to get messages on time. They're in Telegram's own "
                + "Settings > Notifications, under Other."));
        assertTrue(String.join("\n", FirebasePush.localReportLines()).contains("keep-alive and background connection: off"));

        telegram.edit().clear().commit();
        FirebasePushTest.signUp(place, FirebasePushTest.FIREBASE, null, new TLRPC.TL_error(400, "APP_PUSH_APIKEY_MISSING"));
        summary = FirebasePush.localStatus(context()).summary();
        assertTrue(summary, summary.contains("Keep-Alive Service and Background Connection on: Yes"));
        assertFalse(summary, summary.contains("Without push"));
        assertTrue(String.join("\n", FirebasePush.localReportLines())
                .contains("keep-alive and background connection: on (after a refused sign-up)"));
        telegram.edit().clear().commit();
        context().getSharedPreferences("hushtelegram_own_connection", Context.MODE_PRIVATE).edit().clear().commit();
    }

    /**
     * Issue #16: the hint only helps if the reader can find the two switches, so every language
     * names them, Telegram's Settings row and its Other section the way Telegram shows them there.
     * These are the applied values on translations.telegram.org for NotificationsService,
     * NotificationsServiceConnection, Settings, SettingsNotifications and NotificationsOther, read
     * 2026-10-14. German's "Benachrichtungen" is spelled the way Telegram's own row spells it.
     */
    @Test public void theHintNamesTheSwitchesAndThePathAsTelegramShowsThemInEveryLanguage() {
        android.content.SharedPreferences telegram = context().getSharedPreferences("Notifications", Context.MODE_PRIVATE);
        telegram.edit().clear().putBoolean("pushService", false).commit();
        FirebasePushTest.signUp(new FirebasePushTest.Place(ALICE), FirebasePushTest.FIREBASE, null,
                new TLRPC.TL_error(400, "APP_PUSH_APIKEY_MISSING"));
        String[][] languages = {
                {"en-rUS", "Keep-Alive Service", "Background Connection", "Settings > Notifications", "Other"},
                {"bg", "Услуга Keep-Alive", "Свързване на заден план", "Настройки > Notifications", "Друго"},
                {"de", "Keep-Alive-Dienst", "Hintergrundverbindung", "Einstellungen > Benachrichtungen", "Sonstiges"},
                {"es", "Servicio keep-alive", "Conexión en segundo plano", "Ajustes de Telegram > Notificaciones", "Otros"},
                {"in-rID", "Biarkan Layanan Tetap Menyala", "Koneksi Latar", "Pengaturan Telegram sendiri > Notifikasi", "Lainnya"},
                {"pt-rBR", "Manter Serviço Ativo", "Conexão em Segundo Plano", "Configurações do Telegram > Notificações", "Outro"},
                {"tr", "Canlı Tutma Hizmeti", "Arka Plan Bağlantısı", "Ayarlar > Bildirimler", "Diğer"}};
        try {
            for (String[] language : languages) {
                RuntimeEnvironment.setQualifiers("+" + language[0]);
                String summary = FirebasePush.localStatus(context()).summary();
                for (int label = 1; label < language.length; label++) {
                    assertTrue(language[0] + " lacks " + language[label] + ": " + summary, summary.contains(language[label]));
                }
            }
        } finally {
            telegram.edit().clear().commit();
        }
    }

    @Test public void everyTranslationPreservesSeparateLabelsBooleansCountsAndUnknownState() throws Exception {
        String[][] languages = {{"bg", "bg"}, {"de", "de"}, {"es", "es"}, {"in-rID", "in"}, {"pt-rBR", "pt-rbr"}, {"tr", "tr"}};
        for (String[] language : languages) {
            RuntimeEnvironment.setQualifiers("+" + language[0]);
            Map<String, String> table = SettingsL10nTest.TranslationsForTests.of(language[1]);
            String[] labels = {"Notification permission: %1$s", "Notification ID saved on this phone: %1$s", "Signed-in accounts: %1$s", "Accounts Telegram confirmed for notifications: %1$s"};
            String replyLine = table.get("Telegram's reply to account %1$s on %2$s: %3$s, %4$s");
            FirebasePushTest.Place place = new FirebasePushTest.Place(ALICE);
            for (int state = 0; state < 3; state++) {
                LocalReaders.token = state == 0 ? -1 : state == 1 ? 1 : 0;
                LocalReaders.counts = state == 0 ? -1 : state == 1 ? 2 | (1 << 8) : 0;
                Shadows.shadowOf(manager()).setNotificationsEnabled(state == 1);
                FirebasePushTest.forgetAnswer();
                if (state == 1) FirebasePushTest.signUp(place, FirebasePushTest.FIREBASE, new TLRPC.TL_boolTrue(), null);
                if (state == 2) FirebasePushTest.signUp(place, FirebasePushTest.UNIFIED_PUSH, null, new TLRPC.TL_error(400, "APP_PUSH_ERROR"));
                String[] values = state == 0 ? new String[]{table.get("Unknown"), table.get("Unknown"), table.get("Unknown"), table.get("Unknown")}
                        : state == 1 ? new String[]{table.get("Allowed"), table.get("Yes"), "2", "1"}
                        : new String[]{table.get("Blocked"), table.get("No"), "0", "0"};
                String reply = state == 0 ? String.format(table.get("Telegram's reply to notification sign-up: %1$s"), table.get("No reply since Telegram started"))
                        : state == 1 ? String.format(replyLine, "1", "Firebase", table.get("Accepted"), table.get("less than a minute ago"))
                        : String.format(replyLine, "1", "UnifiedPush", String.format(table.get("Refused (%1$s)"), "APP_PUSH_ERROR 400"),
                        table.get("less than a minute ago"));
                String summary = FirebasePush.localStatus(state == 0 ? null : context()).summary();
                for (int label = 0; label < labels.length; label++) {
                    assertTrue(language[0] + ": " + summary, summary.contains(String.format(table.get(labels[label]), values[label])));
                }
                assertTrue(language[0] + ": " + summary, summary.contains(reply));
                assertTrue(summary.contains(table.get("This only shows what's saved on this phone. It doesn't prove notifications will arrive.")));
            }
            FirebasePushTest.signUp(place, FirebasePushTest.FIREBASE, new TLRPC.TL_boolFalse(), null);
            FirebasePushTest.age(7 * 60_000L);
            String summary = FirebasePush.localStatus(context()).summary();
            assertTrue(language[0] + ": " + summary, summary.contains(String.format(replyLine, "1", "Firebase", table.get("Refused"),
                    String.format(table.get("%1$s min ago"), 7))));
            FirebasePushTest.age(3 * 3_600_000L);
            summary = FirebasePush.localStatus(context()).summary();
            assertTrue(language[0] + ": " + summary, summary.contains(String.format(replyLine, "1", "Firebase", table.get("Refused"),
                    String.format(table.get("%1$s h ago"), 3))));
            // A reply nothing is known about says so in the phone's language too.
            FirebasePushTest.forgetAnswer();
            FirebasePush.registerDeviceAnswer(new Object(), 13, new TLRPC.TL_boolTrue(), null);
            summary = FirebasePush.localStatus(context()).summary();
            assertTrue(language[0] + ": " + summary, summary.contains(String.format(replyLine, table.get("Unknown"), table.get("Unknown"),
                    table.get("Accepted"), table.get("less than a minute ago"))));
        }
    }

    @Test public void bothExportsCarryOnlyTheBooleanAndAggregateCountsEvenAfterReaderFailures() throws Exception {
        PatchFamily.registerDiagnostics();
        FirebasePushTest.signUp(new FirebasePushTest.Place(ALICE), FirebasePushTest.FIREBASE, new TLRPC.TL_boolFalse(),
                new TLRPC.TL_error(400, PRIVATE_CANARY));
        FirebasePushTest.age(7 * 60_000L);
        for (boolean unreadable : new boolean[]{false, true}) {
            LocalReaders.brokenToken = LocalReaders.brokenCounts = unreadable;
            for (String report : bothExports()) {
                assertTrue(report, report.contains("notification permission: allowed"));
                assertTrue(report, report.contains("token present: " + (unreadable ? "unknown" : "true")));
                assertTrue(report, report.contains("active accounts: " + (unreadable ? "unknown" : "2")));
                assertTrue(report, report.contains("acknowledged accounts: " + (unreadable ? "unknown" : "1")));
                assertTrue(report, report.contains("push registration answer: account 1, firebase, refused unreadable 400, 420 s ago"));
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
