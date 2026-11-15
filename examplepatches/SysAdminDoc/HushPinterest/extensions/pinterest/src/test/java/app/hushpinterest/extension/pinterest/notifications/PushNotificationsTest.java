/*
 * Forked from https://github.com/SysAdminDoc/HushTelegram at df79f7d (GPL-3.0),
 * modified for HushPinterest (Pinterest), 2026.
 *
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushpinterest.extension.pinterest.notifications;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import java.net.URL;
import java.net.URLConnection;
import java.util.Arrays;
import java.util.EnumSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import app.hushpinterest.extension.pinterest.coexist.OwnAuthoritiesForTests;
import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.PatchFamily;
import app.hushpinterest.extension.pinterest.settings.PatchFamilyForTests;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;
import app.hushpinterest.extension.shared.settings.HushPinterestPause;
import app.hushpinterest.extension.shared.settings.PauseForTests;
import app.hushpinterest.extension.shared.settings.SettingReadsForTests;

/** Header inputs only. These tests never ask Firebase for anything or open a connection. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class PushNotificationsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    private static final String PINTEREST_SHA1 = "B6A74DBCB894B0F73D8C485C72EB1247A8F027CA";
    private static final String ORIGINAL = new String("installed-test-signer");
    private static final String CREATE = "https://firebaseinstallations.googleapis.com/v1/projects/test-project/installations";

    @Before public void setUp() {
        HookStatus.clear();
        PauseForTests.resume();
        PatchFamilyForTests.inBuild(EnumSet.of(PatchFamily.FIX_PUSH_NOTIFICATIONS));
        Settings.FIX_PUSH_NOTIFICATIONS.resetToDefault();
    }

    @After public void restore() {
        SettingReadsForTests.mend(Settings.FIX_PUSH_NOTIFICATIONS);
        Settings.FIX_PUSH_NOTIFICATIONS.resetToDefault();
        PatchFamilyForTests.inBuild(null);
        PauseForTests.resume();
        HookStatus.clear();
    }

    /** For PausedHooksTest: true when the hook hands Firebase Pinterest's certificate for a sign-up request. */
    public static boolean fixesACertificate() {
        try {
            return PINTEREST_SHA1.equals(PushNotifications.certificateHeader(connection(CREATE), ORIGINAL));
        } catch (Exception failure) {
            throw new AssertionError(failure);
        }
    }

    @Test public void theCertificateIsPinterestsOwn() {
        assertEquals(PINTEREST_SHA1, PushNotifications.PINTEREST_CERTIFICATE_SHA1);
        assertEquals(PINTEREST_SHA1.toUpperCase(Locale.ROOT), PushNotifications.PINTEREST_CERTIFICATE_SHA1);
    }

    @Test public void itStartsOnAndChangesOnlyTheCertificateValueWithoutConnecting() throws Exception {
        ProbeConnection connection = connection(CREATE);
        connection.setRequestProperty("X-Android-Cert", ORIGINAL);
        connection.setRequestProperty("x-goog-api-key", "test-api-key");
        connection.setRequestProperty("Authorization", "test-auth");
        Map<String, List<String>> before = new LinkedHashMap<>(connection.getRequestProperties());
        assertTrue(Settings.FIX_PUSH_NOTIFICATIONS.savedValue());
        assertEquals(PINTEREST_SHA1, PushNotifications.certificateHeader(connection, ORIGINAL));
        assertEquals(before, connection.getRequestProperties());
        assertEquals(0, connection.connects);
        assertEquals(Arrays.asList("Fix push notifications: invoked 1, 0 found, 0 missing. "
                + "Counted: certificate headers fixed 1"), HookStatus.report());
    }

    @Test public void signUpAndTokenRequestsAreFixedOnTheirOfficialEndpoint() throws Exception {
        for (String url : Arrays.asList(CREATE, CREATE + "/test-fid/authTokens:generate", CREATE + "/test-fid",
                CREATE.replace(".com/", ".com:443/"),
                CREATE.replace("firebaseinstallations.googleapis.com", "FIREBASEINSTALLATIONS.GOOGLEAPIS.COM"))) {
            ProbeConnection connection = connection(url);
            assertEquals(url, PINTEREST_SHA1, PushNotifications.certificateHeader(connection, ORIGINAL));
            assertEquals(0, connection.connects);
        }
        assertTrue(HookStatus.report().get(0).contains("certificate headers fixed 5"));
    }

    @Test public void aHeaderThatAlreadyNamesPinterestKeepsItsObjectAndIsNotCounted() throws Exception {
        String original = new String(PINTEREST_SHA1.toLowerCase(Locale.ROOT));
        assertSame(original, PushNotifications.certificateHeader(connection(CREATE), original));
        assertFalse(HookStatus.report().get(0).contains("Counted:"));
    }

    @Test public void aMissingFingerprintIsFixedToo() throws Exception {
        // Firebase sends no value when it couldn't read the installed certificate.
        assertEquals(PINTEREST_SHA1, PushNotifications.certificateHeader(connection(CREATE), null));
    }

    @Test public void offEveryPauseReasonAndABuildWithoutThePatchKeepPinterestsOwnValue() throws Exception {
        ProbeConnection connection = connection(CREATE);
        Settings.FIX_PUSH_NOTIFICATIONS.save(false);
        assertSame(ORIGINAL, PushNotifications.certificateHeader(connection, ORIGINAL));
        Settings.FIX_PUSH_NOTIFICATIONS.save(true);
        for (HushPinterestPause.Reason reason : HushPinterestPause.Reason.values()) {
            if (reason == HushPinterestPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertSame(reason.name(), ORIGINAL, PushNotifications.certificateHeader(connection, ORIGINAL));
            PauseForTests.resume();
        }
        PatchFamilyForTests.inBuild(EnumSet.noneOf(PatchFamily.class));
        assertSame(ORIGINAL, PushNotifications.certificateHeader(connection, ORIGINAL));
        assertTrue(Settings.FIX_PUSH_NOTIFICATIONS.savedValue());
        assertFalse(HookStatus.report().get(0).contains("Counted:"));
        assertEquals(0, connection.connects);
    }

    @Test public void withoutSettingsOnTheMainThreadItAnswersAtOnceWithPinterestsOwnValue() throws Exception {
        ProbeConnection connection = connection(CREATE);
        long started = System.nanoTime();
        SettingsContextRule.withoutContext(() -> {
            assertSame(ORIGINAL, PushNotifications.certificateHeader(connection, ORIGINAL));
            assertNull(PushNotifications.certificateHeader(connection, null));
        });
        SettingsContextRule.beforeThePauseIsDecided(() -> assertSame(ORIGINAL,
                PushNotifications.certificateHeader(connection, ORIGINAL)));
        // setContext runs on the main thread, so a wait there could only time out.
        assertTrue(System.nanoTime() - started < 2_000_000_000L);
        assertEquals(Arrays.asList("Fix push notifications: invoked 3, 0 found, 0 missing. "
                + "Counted: requests before app start 3"), HookStatus.report());
    }

    @Test public void firebasesStartupRequestWaitsForSettingsOnItsWorkerAndIsFixed() throws Exception {
        // Firebase's init provider starts its token sync before Application.onCreate, so the first
        // Installations request can reach the hook before settings are ready.
        ProbeConnection connection = connection(CREATE);
        String[] answer = new String[1];
        SettingsContextRule.beforeThePauseIsDecided(() -> {
            Thread worker = new Thread(() -> answer[0] = PushNotifications.certificateHeader(connection, ORIGINAL));
            worker.start();
            awaitWaiting(worker);
            SettingsContextRule.finishSetContext();
            join(worker);
        });
        assertEquals(PINTEREST_SHA1, answer[0]);
        assertEquals(0, connection.connects);
        assertEquals(Arrays.asList("Fix push notifications: invoked 1, 0 found, 0 missing. "
                + "Counted: requests held for app start 1, certificate headers fixed 1"), HookStatus.report());
    }

    @Test public void aStartupRequestStillKeepsTheSwitchAndPauseDecidedAfterItsWait() throws Exception {
        Settings.FIX_PUSH_NOTIFICATIONS.save(false);
        String[] answer = new String[1];
        SettingsContextRule.beforeThePauseIsDecided(() -> {
            Thread worker = new Thread(() -> answer[0] = PushNotifications.certificateHeader(connectionOrFail(), ORIGINAL));
            worker.start();
            awaitWaiting(worker);
            SettingsContextRule.finishSetContext();
            join(worker);
        });
        assertSame(ORIGINAL, answer[0]);
        Settings.FIX_PUSH_NOTIFICATIONS.save(true);
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        SettingsContextRule.beforeThePauseIsDecided(() -> {
            Thread worker = new Thread(() -> answer[0] = PushNotifications.certificateHeader(connectionOrFail(), ORIGINAL));
            worker.start();
            awaitWaiting(worker);
            SettingsContextRule.finishSetContext();
            join(worker);
        });
        assertSame(ORIGINAL, answer[0]);
        assertFalse(HookStatus.report().get(0).contains("certificate headers fixed"));
    }

    @Test public void aStartupRequestThatNeverSeesSettingsGivesUpAndKeepsPinterestsOwnValue() throws Exception {
        long saved = PushNotifications.startupWaitMillis;
        PushNotifications.startupWaitMillis = 50L;
        String[] answer = new String[1];
        try {
            SettingsContextRule.beforeThePauseIsDecided(() -> {
                Thread worker = new Thread(() -> answer[0] = PushNotifications.certificateHeader(connectionOrFail(), ORIGINAL));
                worker.start();
                join(worker);
            });
        } finally {
            PushNotifications.startupWaitMillis = saved;
        }
        assertSame(ORIGINAL, answer[0]);
        assertEquals(Arrays.asList("Fix push notifications: invoked 1, 0 found, 0 missing. "
                + "Counted: requests before app start 1"), HookStatus.report());
    }

    @Test public void anotherPackageOrNoPackageHeaderKeepsTheValue() throws Exception {
        for (String packageName : Arrays.asList("com.pinterest.twa", "com.pinterest.other", "other.client", "COM.PINTEREST", "")) {
            ProbeConnection connection = connection(CREATE);
            connection.setRequestProperty("X-Android-Package", packageName);
            assertSame(packageName, ORIGINAL, PushNotifications.certificateHeader(connection, ORIGINAL));
        }
        ProbeConnection missing = new ProbeConnection(new URL(CREATE));
        assertSame(ORIGINAL, PushNotifications.certificateHeader(missing, ORIGINAL));
        assertSame(ORIGINAL, PushNotifications.certificateHeader(null, ORIGINAL));
        assertFalse(HookStatus.report().get(0).contains("Counted:"));
    }

    /**
     * A copy from Change package name sends its own package, which Pinterest's key doesn't accept.
     * The request names Pinterest instead and gets Pinterest's certificate. Any other package, or a
     * build without that patch, keeps its own.
     */
    @Test public void aRenamedCopyNamesPinterestsPackage() throws Exception {
        String copy = "com.pinterest.hushpinterest";
        OwnAuthoritiesForTests.running(copy);
        try {
            ProbeConnection withoutPatch = connection(CREATE);
            withoutPatch.setRequestProperty("X-Android-Package", copy);
            assertSame(ORIGINAL, PushNotifications.certificateHeader(withoutPatch, ORIGINAL));
            assertEquals(copy, withoutPatch.getRequestProperty("X-Android-Package"));

            PatchFamilyForTests.inBuild(EnumSet.of(PatchFamily.FIX_PUSH_NOTIFICATIONS, PatchFamily.CHANGE_PACKAGE_NAME));
            ProbeConnection renamed = connection(CREATE);
            renamed.setRequestProperty("X-Android-Package", copy);
            assertEquals(PINTEREST_SHA1, PushNotifications.certificateHeader(renamed, ORIGINAL));
            assertEquals("com.pinterest", renamed.getRequestProperty("X-Android-Package"));
            assertEquals(0, renamed.connects);
            assertTrue(HookStatus.report().get(0).contains("copy package headers fixed 1"));

            for (String other : Arrays.asList("com.pinterest.other", "other.client", "")) {
                ProbeConnection connection = connection(CREATE);
                connection.setRequestProperty("X-Android-Package", other);
                assertSame(other, ORIGINAL, PushNotifications.certificateHeader(connection, ORIGINAL));
                assertEquals(other, connection.getRequestProperty("X-Android-Package"));
            }

            Settings.FIX_PUSH_NOTIFICATIONS.save(false);
            ProbeConnection off = connection(CREATE);
            off.setRequestProperty("X-Android-Package", copy);
            assertSame(ORIGINAL, PushNotifications.certificateHeader(off, ORIGINAL));
            assertEquals(copy, off.getRequestProperty("X-Android-Package"));
        } finally {
            OwnAuthoritiesForTests.running(null);
        }
    }

    @Test public void otherOrChangedAddressesKeepTheValue() throws Exception {
        for (String url : Arrays.asList(CREATE.replace("https:", "http:"),
                CREATE.replace("googleapis.com", "googleapis.com.other"),
                CREATE.replace("firebaseinstallations", "fcm"),
                CREATE.replace(".com/", ".com:8443/"),
                CREATE.replace("https://", "https://user@"), CREATE + "?key=test", CREATE + "#fragment",
                CREATE + "/", CREATE + "/test-fid/unknown", CREATE.replace("/v1/", "/v2/"),
                CREATE.replace("test-project", ".."), CREATE + "/%2F/authTokens:generate")) {
            assertSame(url, ORIGINAL, PushNotifications.certificateHeader(connection(url), ORIGINAL));
        }
        assertFalse(HookStatus.report().get(0).contains("Counted:"));
    }

    @Test public void aBrokenSwitchOrConnectionKeepsTheValueAndShowsTheFailedHook() throws Exception {
        ProbeConnection connection = connection(CREATE);
        SettingReadsForTests.breakReads(Settings.FIX_PUSH_NOTIFICATIONS);
        assertSame(ORIGINAL, PushNotifications.certificateHeader(connection, ORIGINAL));
        assertEquals(Arrays.asList("a working 'certificate header' hook (it threw java.lang.NullPointerException)"),
                HookStatus.missing(FamilyNames.FIX_PUSH_NOTIFICATIONS));
        assertFalse(HookStatus.report().get(0).contains("Counted:"));
        HookStatus.clear();
        SettingReadsForTests.mend(Settings.FIX_PUSH_NOTIFICATIONS);
        connection.broken = true;
        assertSame(ORIGINAL, PushNotifications.certificateHeader(connection, ORIGINAL));
        assertEquals(Arrays.asList("a working 'certificate header' hook (it threw java.lang.IllegalStateException)"),
                HookStatus.missing(FamilyNames.FIX_PUSH_NOTIFICATIONS));
        assertFalse(HookStatus.report().get(0).contains("Counted:"));
        assertEquals(0, connection.connects);
    }

    private static void awaitWaiting(Thread worker) {
        long deadline = System.nanoTime() + 5_000_000_000L;
        while (worker.getState() != Thread.State.TIMED_WAITING) {
            if (!worker.isAlive() || System.nanoTime() > deadline) {
                throw new AssertionError("the startup request answered before settings were ready");
            }
            Thread.yield();
        }
    }

    private static void join(Thread worker) {
        try {
            worker.join(5_000L);
        } catch (InterruptedException interrupted) {
            throw new AssertionError(interrupted);
        }
        assertFalse("the startup request never finished", worker.isAlive());
    }

    private static ProbeConnection connectionOrFail() {
        try {
            return connection(CREATE);
        } catch (Exception failure) {
            throw new AssertionError(failure);
        }
    }

    private static ProbeConnection connection(String url) throws Exception {
        ProbeConnection connection = new ProbeConnection(new URL(url));
        connection.setRequestProperty("X-Android-Package", "com.pinterest");
        return connection;
    }

    private static final class ProbeConnection extends URLConnection {
        int connects;
        boolean broken;
        ProbeConnection(URL url) { super(url); }
        @Override public void connect() {
            connects++;
            throw new AssertionError("the certificate fix tried to connect");
        }
        @Override public String getRequestProperty(String key) {
            if (broken) throw new IllegalStateException("unreadable test headers");
            return super.getRequestProperty(key);
        }
    }
}
