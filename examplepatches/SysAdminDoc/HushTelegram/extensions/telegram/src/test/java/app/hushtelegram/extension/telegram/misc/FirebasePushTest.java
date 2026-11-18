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

import android.os.SystemClock;

import java.net.URL;
import java.net.URLConnection;
import java.util.Arrays;
import java.util.Collections;
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
    /** apksigner's SHA-1 for Plus Messenger 13.2.2.1's signer (CN=rafalense). */
    private static final String PLUS_SHA1 = "49EBB949E0C74FA7A5E8B869762C7907B891941A";
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

    /** Telegram's token types for a Firebase token and for the web address a UnifiedPush app hands over. */
    public static final int FIREBASE = 2;
    public static final int UNIFIED_PUSH = UnifiedPush.WEB_PUSH;
    /** A user ID that makes a {@link Place} fail when it's asked who's signed in. */
    public static final long UNREADABLE = Long.MIN_VALUE;
    private static final long ALICE = 918337771L;
    private static final long BOB = 918337772L;

    /**
     * Stands in for Telegram's controller of one account place. The hooks only ask it who's signed
     * in, by the two names Telegram's own controller answers to.
     */
    public static final class Place {
        /** Who's signed in here: 0 for nobody, {@link #UNREADABLE} for a question that fails. */
        public long user;

        public Place(long user) { this.user = user; }

        public Place getUserConfig() { return this; }

        public long getClientUserId() {
            if (user == UNREADABLE) throw new IllegalStateException("token fcm:abc123 for +15550001234");
            return user;
        }
    }

    /** One sign-up and Telegram's reply to it, the way the two hooks see them. */
    public static void signUp(Place place, int transport, Object response, Object error) {
        FirebasePush.registerDeviceSent(place, transport);
        FirebasePush.registerDeviceAnswer(place, transport, response, error);
    }

    /** Stops the clock [millis] from now, so every reply kept so far reads as that old. */
    public static void age(long millis) {
        long stopped = SystemClock.elapsedRealtime() + millis;
        FirebasePush.clock = () -> stopped;
    }

    /** Statics outlive a test in Robolectric's shared sandbox, so every class that reads the replies starts from none. */
    public static void forgetAnswer() {
        synchronized (FirebasePush.SENT) {
            FirebasePush.SENT.clear();
            FirebasePush.ANSWERED.clear();
            FirebasePush.accounts = 0;
        }
        FirebasePush.clock = SystemClock::elapsedRealtime;
    }

    private static FirebasePush.Reply onlyReply() {
        List<FirebasePush.Reply> replies = FirebasePush.replies();
        assertEquals(1, replies.size());
        return replies.get(0);
    }

    @Test public void theSwitchAsksForARestartSinceFirebaseSignsUpOncePerProcess() {
        assertTrue(Settings.REPAIR_FIREBASE_PUSH.defaultValue);
        assertTrue(Settings.REPAIR_FIREBASE_PUSH.rebootApp);
    }

    @Test public void anAcceptedRegistrationIsRecordedAndCounted() {
        signUp(new Place(ALICE), FIREBASE, new TLRPC.TL_boolTrue(), null);
        assertEquals("accepted", onlyReply().answer);
        assertEquals(1, onlyReply().account);
        assertEquals(FIREBASE, onlyReply().transport);
        assertTrue(HookStatus.report().get(0).contains("push registrations accepted 1"));
        assertFalse(HookStatus.report().get(0).contains("refused"));
        assertEquals(Arrays.asList(), HookStatus.missing(FamilyNames.REPAIR_FIREBASE_PUSH));
    }

    @Test public void aRefusalKeepsOnlyTheUpperCaseErrorNameAndCode() {
        Place place = new Place(ALICE);
        signUp(place, FIREBASE, new TLRPC.TL_boolFalse(), new TLRPC.TL_error(400, "APP_PUSH_ERROR"));
        assertEquals("refused APP_PUSH_ERROR 400", onlyReply().answer);
        signUp(place, FIREBASE, null, new TLRPC.TL_error(420, "FLOOD_WAIT_30"));
        assertEquals("refused FLOOD_WAIT_30 420", onlyReply().answer);
        String privateText = "token fcm:abc123 for +15550001234";
        signUp(place, FIREBASE, null, new TLRPC.TL_error(-1000, privateText));
        assertEquals("refused unreadable -1000", onlyReply().answer);
        signUp(place, FIREBASE, null, new TLRPC.TL_error(400, null));
        assertEquals("refused unreadable 400", onlyReply().answer);
        StringBuilder tooLong = new StringBuilder();
        for (int i = 0; i < 65; i++) tooLong.append('A');
        signUp(place, FIREBASE, null, new TLRPC.TL_error(400, tooLong.toString()));
        assertEquals("refused unreadable 400", onlyReply().answer);
        signUp(place, FIREBASE, null, new Object());
        assertEquals("refused unreadable", onlyReply().answer);
        String report = HookStatus.report().get(0);
        assertTrue(report, report.contains("push registrations refused 6"));
        assertFalse(report, report.contains(privateText));
        assertFalse(report, report.contains("accepted"));
    }

    @Test public void aRefusalWithoutAnErrorIsStillRecorded() {
        Place place = new Place(ALICE);
        signUp(place, FIREBASE, new TLRPC.TL_boolFalse(), null);
        assertEquals("refused", onlyReply().answer);
        signUp(place, FIREBASE, null, null);
        assertEquals("refused", onlyReply().answer);
        assertTrue(HookStatus.report().get(0).contains("push registrations refused 2"));
    }

    @Test public void anAccountsLatestAnswerWinsAndEachIsCountedOnce() {
        Place place = new Place(ALICE);
        signUp(place, FIREBASE, null, new TLRPC.TL_error(400, "APP_PUSH_ERROR"));
        signUp(place, FIREBASE, new TLRPC.TL_boolTrue(), null);
        assertEquals("accepted", onlyReply().answer);
        signUp(place, FIREBASE, new TLRPC.TL_boolFalse(), null);
        assertEquals("refused", onlyReply().answer);
        assertEquals(1, onlyReply().account);
        String report = HookStatus.report().get(0);
        assertTrue(report, report.contains("push registrations accepted 1"));
        assertTrue(report, report.contains("push registrations refused 2"));
    }

    @Test public void answersAreRecordedWithTheRepairOffAndUnderEveryPauseReason() {
        Settings.REPAIR_FIREBASE_PUSH.save(false);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            PauseForTests.pause(reason);
            forgetAnswer();
            signUp(new Place(ALICE), FIREBASE, new TLRPC.TL_boolTrue(), null);
            assertEquals(reason.name(), "accepted", onlyReply().answer);
        }
        assertFalse(Settings.REPAIR_FIREBASE_PUSH.savedValue());
    }

    /**
     * Two accounts sign up, and Telegram answers the second one first: a yes for it, a no for the
     * other. One answer kept for the whole app showed whichever came last and hid the refusal.
     */
    @Test public void twoAccountsKeepTheirOwnRepliesWhicheverComesBackFirst() {
        Place alice = new Place(ALICE);
        Place bob = new Place(BOB);
        FirebasePush.registerDeviceSent(alice, FIREBASE);
        FirebasePush.registerDeviceSent(bob, FIREBASE);
        FirebasePush.registerDeviceAnswer(bob, FIREBASE, new TLRPC.TL_boolTrue(), null);
        assertEquals("accepted", onlyReply().answer);
        FirebasePush.registerDeviceAnswer(alice, FIREBASE, null, new TLRPC.TL_error(400, "APP_PUSH_APIKEY_MISSING"));

        // Numbered as their first replies came: Bob's, then Alice's.
        List<FirebasePush.Reply> replies = FirebasePush.replies();
        assertEquals(2, replies.size());
        assertEquals(1, replies.get(0).account);
        assertEquals("accepted", replies.get(0).answer);
        assertEquals(2, replies.get(1).account);
        assertEquals("refused APP_PUSH_APIKEY_MISSING 400", replies.get(1).answer);

        // Later answers change only their own account's line, and each account keeps its number.
        signUp(alice, FIREBASE, new TLRPC.TL_boolTrue(), null);
        signUp(bob, FIREBASE, new TLRPC.TL_boolFalse(), null);
        replies = FirebasePush.replies();
        assertEquals(2, replies.size());
        assertEquals(1, replies.get(0).account);
        assertEquals("refused", replies.get(0).answer);
        assertEquals(2, replies.get(1).account);
        assertEquals("accepted", replies.get(1).answer);
        String report = HookStatus.report().get(0);
        assertTrue(report, report.contains("push registrations accepted 2"));
        assertTrue(report, report.contains("push registrations refused 2"));
        assertFalse(report, report.contains("sign-out"));
    }

    /** One account asks on Firebase and then on a UnifiedPush address, and the second answer is back first. */
    @Test public void oneAccountKeepsAReplyForEachTransport() {
        Place alice = new Place(ALICE);
        FirebasePush.registerDeviceSent(alice, FIREBASE);
        FirebasePush.registerDeviceSent(alice, UNIFIED_PUSH);
        FirebasePush.registerDeviceAnswer(alice, UNIFIED_PUSH, new TLRPC.TL_boolTrue(), null);
        FirebasePush.registerDeviceAnswer(alice, FIREBASE, null, new TLRPC.TL_error(400, "APP_PUSH_APIKEY_MISSING"));

        List<FirebasePush.Reply> replies = FirebasePush.replies();
        assertEquals(2, replies.size());
        assertEquals(1, replies.get(0).account);
        assertEquals(FIREBASE, replies.get(0).transport);
        assertEquals("refused APP_PUSH_APIKEY_MISSING 400", replies.get(0).answer);
        assertEquals(1, replies.get(1).account);
        assertEquals(UNIFIED_PUSH, replies.get(1).transport);
        assertEquals("accepted", replies.get(1).answer);
    }

    /**
     * Telegram ends a waiting sign-up with an error as its account signs out. That reply belongs to
     * nobody who's signed in. If one outlives the sign-out and another account at that place asks
     * too, a reply doesn't say which of the two it answers, so neither goes to the account that came,
     * whichever order they're back in.
     */
    @Test public void aReplyThatComesAfterItsAccountLeftGoesToNobody() {
        Place place = new Place(ALICE);
        FirebasePush.registerDeviceSent(place, FIREBASE);
        place.user = 0;
        FirebasePush.registerDeviceAnswer(place, FIREBASE, null, new TLRPC.TL_error(-1000, ""));
        assertEquals(Collections.emptyList(), FirebasePush.replies());

        // Alice asks again and signs out, Bob signs in at her place and asks, and both are waiting.
        // The yes is back first. Taken in order, it would have gone to Alice and her late error to Bob.
        place.user = ALICE;
        FirebasePush.registerDeviceSent(place, FIREBASE);
        place.user = BOB;
        FirebasePush.registerDeviceSent(place, FIREBASE);
        FirebasePush.registerDeviceAnswer(place, FIREBASE, new TLRPC.TL_boolTrue(), null);
        assertEquals("a reply that may be the account's that left went to the one that came",
                Collections.emptyList(), FirebasePush.replies());
        FirebasePush.registerDeviceAnswer(place, FIREBASE, null, new TLRPC.TL_error(-1000, ""));
        assertEquals("the late reply to the account that left went to the one that came",
                Collections.emptyList(), FirebasePush.replies());

        // Bob's next sign-up is his alone, and his reply is his.
        signUp(place, FIREBASE, new TLRPC.TL_boolTrue(), null);
        assertEquals("accepted", onlyReply().answer);
        assertEquals(1, onlyReply().account);
        String report = HookStatus.report().get(0);
        assertTrue(report, report.contains("push replies after sign-out 1"));
        assertTrue(report, report.contains("push replies with no clear account 2"));
        assertTrue(report, report.contains("push registrations refused 2"));
    }

    /**
     * Replies live in memory only, so a restart starts with none and numbers accounts from 1 again.
     * A reply from before the restart has no sign-up on record afterward and goes under no account.
     */
    @Test public void aRestartStartsWithNoRepliesAndNoAccountNumbers() {
        signUp(new Place(BOB), FIREBASE, new TLRPC.TL_boolTrue(), null);
        Place alice = new Place(ALICE);
        signUp(alice, FIREBASE, new TLRPC.TL_boolFalse(), null);
        FirebasePush.registerDeviceSent(alice, UNIFIED_PUSH);
        assertEquals(2, FirebasePush.replies().size());

        forgetAnswer();
        assertEquals(Collections.emptyList(), FirebasePush.replies());
        FirebasePush.registerDeviceAnswer(alice, UNIFIED_PUSH, new TLRPC.TL_boolTrue(), null);
        assertEquals(0, onlyReply().account);
        signUp(alice, FIREBASE, new TLRPC.TL_boolTrue(), null);
        List<FirebasePush.Reply> replies = FirebasePush.replies();
        assertEquals(2, replies.size());
        assertEquals("numbered from 1 again", 1, replies.get(0).account);
        assertEquals(FIREBASE, replies.get(0).transport);
        assertEquals(0, replies.get(1).account);
    }

    /** A reply already kept isn't shown as current once its account has left its place. */
    @Test public void aKeptReplyGoesWhenItsAccountLeaves() {
        Place place = new Place(ALICE);
        Place other = new Place(BOB);
        signUp(place, FIREBASE, new TLRPC.TL_boolTrue(), null);
        signUp(other, FIREBASE, new TLRPC.TL_boolFalse(), null);
        assertEquals(2, FirebasePush.replies().size());

        // Asking who's there fails: nothing shows the account left, so its reply stays.
        place.user = UNREADABLE;
        assertEquals(2, FirebasePush.replies().size());

        place.user = BOB + 1;
        assertEquals("refused", onlyReply().answer);
        assertEquals(2, onlyReply().account);
        // Back at her place, Alice starts with no reply rather than the one from before.
        place.user = ALICE;
        assertEquals(2, onlyReply().account);
    }

    /** A reply whose account can't be read is kept under no account, never under a guess. */
    @Test public void aReplyWhoseAccountCantBeReadIsKeptUnderNoAccount() {
        Place place = new Place(UNREADABLE);
        FirebasePush.registerDeviceSent(place, FIREBASE);
        // Readable by the time the reply is back, and still nobody is known to have asked.
        place.user = ALICE;
        FirebasePush.registerDeviceAnswer(place, FIREBASE, new TLRPC.TL_boolTrue(), null);
        assertEquals(0, onlyReply().account);
        assertEquals("accepted", onlyReply().answer);

        // A reply with no sign-up on record, as after more waiting sign-ups than are kept.
        forgetAnswer();
        FirebasePush.registerDeviceAnswer(new Place(ALICE), FIREBASE, null, new TLRPC.TL_error(400, "APP_PUSH_ERROR"));
        assertEquals(0, onlyReply().account);
        assertEquals("refused APP_PUSH_ERROR 400", onlyReply().answer);

        // Something that isn't Telegram's controller, and nothing at all.
        forgetAnswer();
        Object stranger = new Object();
        FirebasePush.registerDeviceSent(stranger, FIREBASE);
        FirebasePush.registerDeviceAnswer(stranger, FIREBASE, new TLRPC.TL_boolTrue(), null);
        FirebasePush.registerDeviceSent(null, UNIFIED_PUSH);
        FirebasePush.registerDeviceAnswer(null, UNIFIED_PUSH, null, null);
        List<FirebasePush.Reply> replies = FirebasePush.replies();
        assertEquals(2, replies.size());
        assertEquals(0, replies.get(0).account);
        assertEquals("accepted", replies.get(0).answer);
        assertEquals(0, replies.get(1).account);
        assertEquals("refused", replies.get(1).answer);
        assertEquals(Arrays.asList(), HookStatus.missing(FamilyNames.REPAIR_FIREBASE_PUSH));
    }

    /** A reply's age is the time since it came on a clock nothing sets, and never less than none. */
    @Test public void aReplysAgeComesFromAClockThatOnlyRunsForward() {
        long[] now = {50_000L};
        FirebasePush.clock = () -> now[0];
        signUp(new Place(ALICE), FIREBASE, new TLRPC.TL_boolTrue(), null);
        assertEquals(0L, onlyReply().age);
        now[0] += 5 * 60_000L;
        assertEquals(5 * 60_000L, onlyReply().age);
        now[0] = 0L;
        assertEquals(0L, onlyReply().age);
    }

    @Test public void onlySoManyRepliesAndWaitingSignUpsAreKept() {
        for (int account = 0; account < FirebasePush.KEPT + 4; account++) {
            signUp(new Place(ALICE + account), FIREBASE, new TLRPC.TL_boolTrue(), null);
        }
        List<FirebasePush.Reply> replies = FirebasePush.replies();
        assertEquals(FirebasePush.KEPT, replies.size());
        // The four oldest made room.
        assertEquals(5, replies.get(0).account);
        assertEquals(FirebasePush.KEPT + 4, replies.get(FirebasePush.KEPT - 1).account);

        forgetAnswer();
        Place place = new Place(ALICE);
        for (int waiting = 0; waiting < FirebasePush.KEPT + 4; waiting++) FirebasePush.registerDeviceSent(place, FIREBASE);
        assertEquals(FirebasePush.KEPT, FirebasePush.SENT.size());
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
        for (String packageName : Arrays.asList("org.telegram.messenger.beta", "org.telegram.messenger.other",
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

    @Test public void plusMessengerGetsItsOwnKeyNotTelegrams() throws Exception {
        ProbeConnection connection = connection(CREATE);
        connection.setRequestProperty("X-Android-Package", "org.telegram.plus");
        assertEquals(PLUS_SHA1, FirebasePush.certificateHeader(connection, ORIGINAL));
        String signed = new String(PLUS_SHA1.toLowerCase(java.util.Locale.ROOT));
        assertSame(signed, FirebasePush.certificateHeader(connection, signed));
        ProbeConnection lookalike = connection(CREATE);
        lookalike.setRequestProperty("X-Android-Package", "org.telegram.plus.other");
        assertSame(ORIGINAL, FirebasePush.certificateHeader(lookalike, ORIGINAL));
        assertTrue(HookStatus.report().get(0).contains("certificate headers repaired 1"));
    }

    @Test public void playBuildUsesTheIndependentlyVerifiedSharedCertificateAndKeepsAllOtherHeaders() throws Exception {
        for (String url : Arrays.asList(CREATE, CREATE + "/test-fid/authTokens:generate", CREATE + "/test-fid")) {
            ProbeConnection connection = connection(url);
            connection.setRequestProperty("X-Android-Package", "org.telegram.messenger");
            connection.setRequestProperty("x-goog-api-key", "test-play-api-key");
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
