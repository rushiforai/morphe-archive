/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import java.net.URL;
import java.net.URLConnection;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.telegram.tgnet.TLRPC;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/** Public header inputs only. These tests never request a token or connect to Firebase. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class FirebasePushTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    private static final String OFFICIAL_SHA1 = "9723E5838612E9C7C08CA2C6573B6026D7A51F8F";
    private static final String ORIGINAL = new String("installed-test-signer");
    private static final String CREATE = "https://firebaseinstallations.googleapis.com/v1/projects/test-project/installations";

    @Before public void setUp() {
        HookStatus.clear();
        PauseForTests.resume();
        Settings.REPAIR_FIREBASE_PUSH.resetToDefault();
        forgetAnswer();
    }

    @After public void restore() {
        SettingReadsForTests.mend(Settings.REPAIR_FIREBASE_PUSH);
        Settings.REPAIR_FIREBASE_PUSH.resetToDefault();
        PauseForTests.resume();
        HookStatus.clear();
        forgetAnswer();
    }

    /** Statics outlive a test in Robolectric's shared sandbox, so every class that reads the answer starts from none. */
    public static void forgetAnswer() { FirebasePush.lastAnswer = null; }

    @Test public void anAcceptedRegistrationIsRecordedAndCounted() {
        FirebasePush.registerDeviceAnswer(new TLRPC.TL_boolTrue(), null);
        assertEquals("accepted", FirebasePush.lastAnswer);
        assertTrue(HookStatus.report().get(0).contains("push registrations accepted 1"));
        assertFalse(HookStatus.report().get(0).contains("refused"));
        assertEquals(Arrays.asList(), HookStatus.missing(FamilyNames.REPAIR_FIREBASE_PUSH));
    }

    @Test public void aRefusalKeepsOnlyTheUpperCaseErrorNameAndCode() {
        FirebasePush.registerDeviceAnswer(new TLRPC.TL_boolFalse(), new TLRPC.TL_error(400, "APP_PUSH_ERROR"));
        assertEquals("refused APP_PUSH_ERROR 400", FirebasePush.lastAnswer);
        FirebasePush.registerDeviceAnswer(null, new TLRPC.TL_error(420, "FLOOD_WAIT_30"));
        assertEquals("refused FLOOD_WAIT_30 420", FirebasePush.lastAnswer);
        String privateText = "token fcm:abc123 for +15550001234";
        FirebasePush.registerDeviceAnswer(null, new TLRPC.TL_error(-1000, privateText));
        assertEquals("refused unreadable -1000", FirebasePush.lastAnswer);
        FirebasePush.registerDeviceAnswer(null, new TLRPC.TL_error(400, null));
        assertEquals("refused unreadable 400", FirebasePush.lastAnswer);
        StringBuilder tooLong = new StringBuilder();
        for (int i = 0; i < 65; i++) tooLong.append('A');
        FirebasePush.registerDeviceAnswer(null, new TLRPC.TL_error(400, tooLong.toString()));
        assertEquals("refused unreadable 400", FirebasePush.lastAnswer);
        FirebasePush.registerDeviceAnswer(null, new Object());
        assertEquals("refused unreadable", FirebasePush.lastAnswer);
        String report = HookStatus.report().get(0);
        assertTrue(report, report.contains("push registrations refused 6"));
        assertFalse(report, report.contains(privateText));
        assertFalse(report, report.contains("accepted"));
    }

    @Test public void aRefusalWithoutAnErrorIsStillRecorded() {
        FirebasePush.registerDeviceAnswer(new TLRPC.TL_boolFalse(), null);
        assertEquals("refused", FirebasePush.lastAnswer);
        FirebasePush.registerDeviceAnswer(null, null);
        assertEquals("refused", FirebasePush.lastAnswer);
        assertTrue(HookStatus.report().get(0).contains("push registrations refused 2"));
    }

    @Test public void theLatestAnswerWinsAndEachIsCountedOnce() {
        FirebasePush.registerDeviceAnswer(null, new TLRPC.TL_error(400, "APP_PUSH_ERROR"));
        FirebasePush.registerDeviceAnswer(new TLRPC.TL_boolTrue(), null);
        assertEquals("accepted", FirebasePush.lastAnswer);
        FirebasePush.registerDeviceAnswer(new TLRPC.TL_boolFalse(), null);
        assertEquals("refused", FirebasePush.lastAnswer);
        String report = HookStatus.report().get(0);
        assertTrue(report, report.contains("push registrations accepted 1"));
        assertTrue(report, report.contains("push registrations refused 2"));
    }

    @Test public void answersAreRecordedWithTheRepairOffAndUnderEveryPauseReason() {
        Settings.REPAIR_FIREBASE_PUSH.save(false);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            PauseForTests.pause(reason);
            forgetAnswer();
            FirebasePush.registerDeviceAnswer(new TLRPC.TL_boolTrue(), null);
            assertEquals(reason.name(), "accepted", FirebasePush.lastAnswer);
        }
        assertFalse(Settings.REPAIR_FIREBASE_PUSH.savedValue());
    }

    @Test public void repairsOnlyTheCertificateValueWithoutChangingHeadersOrConnecting() throws Exception {
        ProbeConnection connection = connection(CREATE);
        connection.setRequestProperty("X-Android-Cert", ORIGINAL);
        connection.setRequestProperty("x-goog-api-key", "test-api-key");
        connection.setRequestProperty("Authorization", "test-auth");
        Map<String, List<String>> before = new LinkedHashMap<>(connection.getRequestProperties());
        assertTrue(Settings.REPAIR_FIREBASE_PUSH.savedValue());
        assertEquals(OFFICIAL_SHA1, FirebasePush.certificateHeader(connection, ORIGINAL));
        assertEquals(before, connection.getRequestProperties());
        assertEquals(0, connection.connects);
        assertEquals(Arrays.asList("Repair Firebase push registration: invoked 1, 0 found, 0 missing. "
                + "Counted: certificate headers repaired 1"), HookStatus.report());
    }

    @Test public void scopesCreationRotationAndDeletionToTheSameOfficialEndpoints() throws Exception {
        for (String url : Arrays.asList(CREATE, CREATE + "/test-fid/authTokens:generate", CREATE + "/test-fid",
                CREATE.replace(".com/", ".com:443/"), CREATE.replace("firebaseinstallations.googleapis.com", "FIREBASEINSTALLATIONS.GOOGLEAPIS.COM"))) {
            ProbeConnection connection = connection(url);
            assertEquals(url, OFFICIAL_SHA1, FirebasePush.certificateHeader(connection, ORIGINAL));
            assertEquals(0, connection.connects);
        }
        assertTrue(HookStatus.report().get(0).contains("certificate headers repaired 5"));
    }

    @Test public void anAlreadyOfficialHeaderKeepsItsOriginalObjectAndIsNotCountedAsARepair() throws Exception {
        String original = new String(OFFICIAL_SHA1.toLowerCase(java.util.Locale.ROOT));
        assertSame(original, FirebasePush.certificateHeader(connection(CREATE), original));
        assertFalse(HookStatus.report().get(0).contains("Counted:"));
    }

    @Test public void aMissingStockFingerprintCanBeRepairedAtTheVerifiedHeaderSite() throws Exception {
        assertEquals(OFFICIAL_SHA1, FirebasePush.certificateHeader(connection(CREATE), null));
    }

    @Test public void disabledAndEveryPauseReasonKeepStockAndDoNotCountRepairs() throws Exception {
        ProbeConnection connection = connection(CREATE);
        Settings.REPAIR_FIREBASE_PUSH.save(false);
        assertSame(ORIGINAL, FirebasePush.certificateHeader(connection, ORIGINAL));
        Settings.REPAIR_FIREBASE_PUSH.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertSame(reason.name(), ORIGINAL, FirebasePush.certificateHeader(connection, ORIGINAL));
            PauseForTests.resume();
        }
        assertTrue(Settings.REPAIR_FIREBASE_PUSH.savedValue());
        assertFalse(HookStatus.report().get(0).contains("Counted:"));
        assertEquals(0, connection.connects);
    }

    @Test public void missingSettingsAndUndecidedPauseKeepStockOnTheMainThreadWithoutWaiting() throws Exception {
        ProbeConnection connection = connection(CREATE);
        long started = System.nanoTime();
        SettingsContextRule.withoutContext(() -> {
            assertSame(ORIGINAL, FirebasePush.certificateHeader(connection, ORIGINAL));
            assertNull(FirebasePush.certificateHeader(connection, null));
        });
        SettingsContextRule.beforeThePauseIsDecided(() -> assertSame(ORIGINAL,
                FirebasePush.certificateHeader(connection, ORIGINAL)));
        // setContext runs on the main thread, so a wait there could only time out.
        assertTrue(System.nanoTime() - started < 2_000_000_000L);
        assertEquals(Arrays.asList("Repair Firebase push registration: invoked 3, 0 found, 0 missing. "
                + "Counted: requests before app start 3"), HookStatus.report());
    }

    @Test public void firebasesStartupRequestWaitsForSettingsOnItsWorkerAndIsRepaired() throws Exception {
        // Issue 5: FCM's eager token sync starts in Firebase's init provider, so on a slow phone
        // the first Installations request reached the hook before Application.onCreate.
        ProbeConnection connection = connection(CREATE);
        String[] answer = new String[1];
        SettingsContextRule.beforeThePauseIsDecided(() -> {
            Thread worker = new Thread(() -> answer[0] = FirebasePush.certificateHeader(connection, ORIGINAL));
            worker.start();
            awaitWaiting(worker);
            SettingsContextRule.finishSetContext();
            join(worker);
        });
        assertEquals(OFFICIAL_SHA1, answer[0]);
        assertEquals(0, connection.connects);
        assertEquals(Arrays.asList("Repair Firebase push registration: invoked 1, 0 found, 0 missing. "
                + "Counted: requests held for app start 1, certificate headers repaired 1"), HookStatus.report());
    }

    @Test public void aStartupRequestStillKeepsTheSwitchAndPauseDecidedAfterItsWait() throws Exception {
        Settings.REPAIR_FIREBASE_PUSH.save(false);
        String[] answer = new String[1];
        SettingsContextRule.beforeThePauseIsDecided(() -> {
            Thread worker = new Thread(() -> answer[0] = FirebasePush.certificateHeader(connectionOrFail(), ORIGINAL));
            worker.start();
            awaitWaiting(worker);
            SettingsContextRule.finishSetContext();
            join(worker);
        });
        assertSame(ORIGINAL, answer[0]);
        Settings.REPAIR_FIREBASE_PUSH.save(true);
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        SettingsContextRule.beforeThePauseIsDecided(() -> {
            Thread worker = new Thread(() -> answer[0] = FirebasePush.certificateHeader(connectionOrFail(), ORIGINAL));
            worker.start();
            awaitWaiting(worker);
            SettingsContextRule.finishSetContext();
            join(worker);
        });
        assertSame(ORIGINAL, answer[0]);
        assertFalse(HookStatus.report().get(0).contains("certificate headers repaired"));
    }

    @Test public void aStartupRequestThatNeverSeesSettingsGivesUpAndKeepsStock() throws Exception {
        long saved = FirebasePush.startupWaitMillis;
        FirebasePush.startupWaitMillis = 50L;
        String[] answer = new String[1];
        try {
            SettingsContextRule.beforeThePauseIsDecided(() -> {
                Thread worker = new Thread(() -> answer[0] = FirebasePush.certificateHeader(connectionOrFail(), ORIGINAL));
                worker.start();
                join(worker);
            });
        } finally {
            FirebasePush.startupWaitMillis = saved;
        }
        assertSame(ORIGINAL, answer[0]);
        assertEquals(Arrays.asList("Repair Firebase push registration: invoked 1, 0 found, 0 missing. "
                + "Counted: requests before app start 1"), HookStatus.report());
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

    @Test public void foreignPackagesAndMissingNativePackageHeadersKeepStock() throws Exception {
        for (String packageName : Arrays.asList("org.telegram.messenger", "org.telegram.messenger.beta.other",
                "other.client", "org.telegram.messenger.web.other")) {
            ProbeConnection connection = connection(CREATE);
            connection.setRequestProperty("X-Android-Package", packageName);
            assertSame(packageName, ORIGINAL, FirebasePush.certificateHeader(connection, ORIGINAL));
        }
        ProbeConnection missing = new ProbeConnection(new URL(CREATE));
        assertSame(ORIGINAL, FirebasePush.certificateHeader(missing, ORIGINAL));
        assertSame(ORIGINAL, FirebasePush.certificateHeader(null, ORIGINAL));
        assertFalse(HookStatus.report().get(0).contains("Counted:"));
    }

    @Test public void betaUsesTheIndependentlyVerifiedSharedCertificateAndKeepsAllOtherHeaders() throws Exception {
        for (String url : Arrays.asList(CREATE, CREATE + "/test-fid/authTokens:generate", CREATE + "/test-fid")) {
            ProbeConnection connection = connection(url);
            connection.setRequestProperty("X-Android-Package", "org.telegram.messenger.beta");
            connection.setRequestProperty("x-goog-api-key", "test-beta-api-key");
            Map<String, List<String>> before = new LinkedHashMap<>(connection.getRequestProperties());
            assertEquals(OFFICIAL_SHA1, FirebasePush.certificateHeader(connection, ORIGINAL));
            assertEquals(before, connection.getRequestProperties());
            assertEquals(0, connection.connects);
            Settings.REPAIR_FIREBASE_PUSH.save(false);
            assertSame(ORIGINAL, FirebasePush.certificateHeader(connection, ORIGINAL));
            Settings.REPAIR_FIREBASE_PUSH.save(true);
            PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
            assertSame(ORIGINAL, FirebasePush.certificateHeader(connection, ORIGINAL));
            PauseForTests.resume();
        }
    }

    @Test public void unrelatedOrChangedUrlsKeepStock() throws Exception {
        for (String url : Arrays.asList(CREATE.replace("https:", "http:"),
                CREATE.replace("googleapis.com", "googleapis.com.other"),
                CREATE.replace("firebaseinstallations", "fcm"),
                CREATE.replace(".com/", ".com:8443/"),
                CREATE.replace("https://", "https://user@"), CREATE + "?key=test", CREATE + "#fragment",
                CREATE + "/", CREATE + "/test-fid/unknown", CREATE.replace("/v1/", "/v2/"),
                CREATE.replace("test-project", ".."), CREATE + "/%2F/authTokens:generate")) {
            assertSame(url, ORIGINAL, FirebasePush.certificateHeader(connection(url), ORIGINAL));
        }
        assertFalse(HookStatus.report().get(0).contains("Counted:"));
    }

    @Test public void switchAndConnectionFailuresKeepStockAndExposeTheFailedHook() throws Exception {
        ProbeConnection connection = connection(CREATE);
        SettingReadsForTests.breakReads(Settings.REPAIR_FIREBASE_PUSH);
        assertSame(ORIGINAL, FirebasePush.certificateHeader(connection, ORIGINAL));
        assertEquals(Arrays.asList("a working 'certificate header' hook (it threw java.lang.NullPointerException)"),
                HookStatus.missing(FamilyNames.REPAIR_FIREBASE_PUSH));
        assertFalse(HookStatus.report().get(0).contains("Counted:"));
        HookStatus.clear();
        SettingReadsForTests.mend(Settings.REPAIR_FIREBASE_PUSH);
        connection.broken = true;
        assertSame(ORIGINAL, FirebasePush.certificateHeader(connection, ORIGINAL));
        assertEquals(Arrays.asList("a working 'certificate header' hook (it threw java.lang.IllegalStateException)"),
                HookStatus.missing(FamilyNames.REPAIR_FIREBASE_PUSH));
        assertFalse(HookStatus.report().get(0).contains("Counted:"));
        assertEquals(0, connection.connects);
    }

    private static ProbeConnection connection(String url) throws Exception {
        ProbeConnection connection = new ProbeConnection(new URL(url));
        connection.setRequestProperty("X-Android-Package", "org.telegram.messenger.web");
        return connection;
    }

    private static final class ProbeConnection extends URLConnection {
        int connects;
        boolean broken;
        ProbeConnection(URL url) { super(url); }
        @Override public void connect() {
            connects++;
            throw new AssertionError("header repair tried to connect");
        }
        @Override public String getRequestProperty(String key) {
            if (broken) throw new IllegalStateException("unreadable test headers");
            return super.getRequestProperty(key);
        }
    }
}
