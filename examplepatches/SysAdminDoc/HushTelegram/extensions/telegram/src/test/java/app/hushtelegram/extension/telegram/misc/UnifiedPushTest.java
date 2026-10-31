/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

import android.app.Application;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.ResolveInfo;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.PatchFamilyForTests;
import app.hushtelegram.extension.telegram.settings.Settings;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class UnifiedPushTest {
    private static final String OTHER = "org.example.push";
    private static final String ENDPOINT = "https://ntfy.sh/upAbCdEf12?up=1";

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private final List<String> registered = new ArrayList<>();
    private final List<Runnable> wakes = new ArrayList<>();
    private final List<String> released = new ArrayList<>();
    private UnifiedPush.Telegram real;
    private java.util.concurrent.Executor realWork;
    private final java.util.function.Function<Context, android.content.SharedPreferences> realStore = UnifiedPush.store;
    private final Runnable realApply = OwnConnection.apply;
    private int ownConnectionApplied;
    private Context context;

    @Before public void setUp() {
        context = Utils.getContext();
        real = UnifiedPush.telegram;
        realWork = UnifiedPush.work;
        UnifiedPush.telegram = new UnifiedPush.Telegram() {
            @Override public void register(String endpoint) { registered.add(endpoint); }
            @Override public void wake(Runnable done) { wakes.add(done); }
            @Override public void release(String endpoint) { released.add(endpoint); }
        };
        UnifiedPush.work = Runnable::run;
        OwnConnection.apply = () -> ownConnectionApplied++;
        PatchFamilyForTests.inBuild(PatchFamily.UNIFIED_PUSH);
        UnifiedPush.prefs(context).edit().clear().commit();
        OwnConnection.telegramStore.apply(context).edit().clear().commit();
        OwnConnection.store.apply(context).edit().clear().commit();
        Settings.UNIFIED_PUSH.resetToDefault();
    }

    @After public void restore() {
        UnifiedPush.telegram = real;
        UnifiedPush.work = realWork;
        UnifiedPush.store = realStore;
        OwnConnection.apply = realApply;
        PatchFamilyForTests.reset();
        PauseForTests.resume();
        UnifiedPush.prefs(context).edit().clear().commit();
        Settings.UNIFIED_PUSH.resetToDefault();
        HookStatus.clear();
    }

    private void install(String... packages) {
        for (String name : packages) {
            ResolveInfo info = new ResolveInfo();
            info.activityInfo = new ActivityInfo();
            info.activityInfo.packageName = name;
            info.activityInfo.name = name + ".Distributor";
            shadowOf(context.getPackageManager()).addResolveInfoForIntent(new Intent(UnifiedPush.REGISTER), info);
        }
    }

    private List<Intent> sent() {
        return shadowOf((Application) RuntimeEnvironment.getApplication()).getBroadcastIntents();
    }

    private Intent last(String action) {
        Intent found = null;
        for (Intent intent : sent()) if (action.equals(intent.getAction())) found = intent;
        return found;
    }

    private Intent from(String action, String token) {
        return new Intent(action).putExtra("token", token);
    }

    private String token() { return UnifiedPush.prefs(context).getString(UnifiedPush.TOKEN, null); }

    /** The Web Push token Telegram signs up for {@link #ENDPOINT}. */
    private String webPush() { return UnifiedPush.webPushToken(context, ENDPOINT, true); }

    /** Whether 65 bytes are an uncompressed point on P-256: y² = x³ - 3x + b, mod p. */
    private static boolean onP256(byte[] point) {
        java.math.BigInteger p = new java.math.BigInteger("FFFFFFFF00000001000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF", 16);
        java.math.BigInteger b = new java.math.BigInteger("5AC635D8AA3A93E7B3EBBD55769886BC651D06B0CC53B0F63BCE3C3E27D2604B", 16);
        java.math.BigInteger x = new java.math.BigInteger(1, java.util.Arrays.copyOfRange(point, 1, 33));
        java.math.BigInteger y = new java.math.BigInteger(1, java.util.Arrays.copyOfRange(point, 33, 65));
        return point.length == 65 && point[0] == 0x04
                && y.pow(2).mod(p).equals(x.pow(3).subtract(x.multiply(java.math.BigInteger.valueOf(3))).add(b).mod(p));
    }

    /** Signed up with ntfy, an address in hand, the switch on. */
    private String signedUp() {
        install(UnifiedPush.NTFY);
        Settings.UNIFIED_PUSH.save(true);
        UnifiedPush.sync(context, true);
        UnifiedPush.receive(context, from(UnifiedPush.NEW_ENDPOINT, token()).putExtra("endpoint", ENDPOINT), () -> {});
        registered.clear();
        return token();
    }

    /**
     * Seen on the S22: ntfy freshly installed and never opened sits in Android's stopped state,
     * which drops a broadcast unless it asks to reach stopped apps, so the row said "Signing up"
     * for good. Every broadcast to the app has to ask.
     */
    @Test public void everyBroadcastToTheAppReachesOneThatWasNeverOpened() {
        String token = signedUp();
        UnifiedPush.receive(context, from(UnifiedPush.MESSAGE, token).putExtra("id", "m1"), () -> {});
        UnifiedPush.sync(context, false);
        for (String action : new String[] {UnifiedPush.REGISTER, UnifiedPush.MESSAGE_ACK, UnifiedPush.UNREGISTER}) {
            Intent intent = last(action);
            assertNotNull(action, intent);
            assertEquals(action, UnifiedPush.NTFY, intent.getPackage());
            assertTrue(action, (intent.getFlags() & Intent.FLAG_INCLUDE_STOPPED_PACKAGES) != 0);
        }
    }

    @Test public void telegramKeepsItsOwnTokenUntilAnAddressIsInAndTheSwitchIsOn() {
        assertEquals("fcm-token", UnifiedPush.token(2, "fcm-token"));
        assertEquals(2, UnifiedPush.type(2));
        UnifiedPush.prefs(context).edit().putString(UnifiedPush.ENDPOINT, ENDPOINT).commit();
        assertEquals("the switch is still off", "fcm-token", UnifiedPush.token(2, "fcm-token"));
        assertEquals(2, UnifiedPush.type(2));

        Settings.UNIFIED_PUSH.save(true);
        String signUp = UnifiedPush.token(2, "fcm-token");
        assertEquals(webPush(), signUp);
        assertEquals(UnifiedPush.WEB_PUSH, UnifiedPush.type(2));
        // A Firebase sign-up that failed asks with no token, and the address goes in all the same.
        assertEquals(signUp, UnifiedPush.token(2, null));
        assertEquals(UnifiedPush.WEB_PUSH, UnifiedPush.type(2));
        assertEquals(signUp, UnifiedPush.token(UnifiedPush.WEB_PUSH, signUp));
        assertEquals(UnifiedPush.WEB_PUSH, UnifiedPush.type(UnifiedPush.WEB_PUSH));

        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertEquals(reason.name(), "fcm-token", UnifiedPush.token(2, "fcm-token"));
            assertEquals(reason.name(), 2, UnifiedPush.type(2));
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> {
            assertEquals("fcm-token", UnifiedPush.token(2, "fcm-token"));
            assertEquals(2, UnifiedPush.type(2));
        });
    }

    /**
     * Seen on the S22 on 2026-10-13: a Simple push (type 4) sign-up was accepted and a bot's
     * message never reached the address. Ordinary messages go to a Web Push sign-up, type 10, whose
     * token is the address with a P-256 key and an auth secret Telegram's servers encrypt to.
     */
    @Test public void theSignUpIsAWebPushTokenWithAKeyTelegramCanEncryptTo() throws Exception {
        signedUp();
        String signUp = UnifiedPush.token(2, "fcm-token");
        assertEquals(UnifiedPush.WEB_PUSH, UnifiedPush.type(2));
        org.json.JSONObject json = new org.json.JSONObject(signUp);
        assertEquals(ENDPOINT, json.getString("endpoint"));
        org.json.JSONObject keys = json.getJSONObject("keys");
        assertFalse("base64url without padding", (keys.getString("p256dh") + keys.getString("auth")).matches(".*[+/=].*"));
        assertTrue("the key is a point on P-256", onP256(java.util.Base64.getUrlDecoder().decode(keys.getString("p256dh"))));
        assertEquals(16, java.util.Base64.getUrlDecoder().decode(keys.getString("auth")).length);

        // Each start hands Telegram the same token, so it isn't signed up again.
        assertEquals(signUp, UnifiedPush.token(2, "fcm-token"));
        UnifiedPush.type(2);
        // Off keeps the keys, and the next sign-up uses them again.
        UnifiedPush.sync(context, false);
        assertEquals(signUp, UnifiedPush.webPushToken(context, ENDPOINT, false));
    }

    /** A coordinate that comes up short of 32 bytes, or with a sign byte, still makes a 65-byte point. */
    @Test public void everyNewKeyIsAWholePoint() throws Exception {
        for (int i = 0; i < 200; i++) assertTrue("key " + i, onP256(UnifiedPush.newPublicKey()));
    }

    /** With keys that couldn't be saved, Telegram keeps its own token: keys made fresh at each start would sign it up again each time. */
    @Test public void keysThatWerentSavedSignNothingUp() {
        signedUp();
        Flaky flaky = new Flaky(UnifiedPush.prefs(context));
        UnifiedPush.store = ignored -> flaky;
        flaky.failWrites = true;
        assertEquals("fcm-token", UnifiedPush.token(2, "fcm-token"));
        assertEquals(2, UnifiedPush.type(2));
        assertTrue(String.join("\n", HookStatus.report()).contains("Web Push keys not saved"));
        flaky.failWrites = false;
        assertEquals(webPush(), UnifiedPush.token(2, "fcm-token"));
        assertEquals(UnifiedPush.WEB_PUSH, UnifiedPush.type(2));
    }

    /** A failed save leaves the keys in Android's memory, so they're taken back out and a later ask this run signs nothing up either. */
    @Test public void keysAFailedSaveLeftInMemoryAreTakenBackOut() {
        signedUp();
        Flaky flaky = new Flaky(UnifiedPush.prefs(context));
        UnifiedPush.store = ignored -> flaky;
        flaky.failWrites = true;
        flaky.failedWritesStay = true;
        assertEquals("fcm-token", UnifiedPush.token(2, "fcm-token"));
        assertEquals(2, UnifiedPush.type(2));
        assertNull(UnifiedPush.prefs(context).getString(UnifiedPush.WEB_PUSH_KEY, null));
        assertEquals("fcm-token", UnifiedPush.token(2, "fcm-token"));
        assertEquals(2, UnifiedPush.type(2));
    }

    /**
     * Telegram's sign-up thread and the main thread asking for the first time at once get the one
     * key pair that's kept, so the token Telegram holds still counts as its own when switching off.
     */
    @Test public void twoFirstAsksAtOnceGetTheKeysThatAreKept() throws Exception {
        Flaky flaky = new Flaky(UnifiedPush.prefs(context));
        flaky.readers = new java.util.concurrent.CountDownLatch(2);
        UnifiedPush.store = ignored -> flaky;
        String[] tokens = new String[2];
        Thread first = new Thread(() -> tokens[0] = webPush());
        Thread second = new Thread(() -> tokens[1] = webPush());
        first.start();
        second.start();
        first.join(10_000);
        second.join(10_000);
        assertNotNull(tokens[0]);
        assertEquals(tokens[0], tokens[1]);
        flaky.readers = null;
        assertEquals(tokens[0], webPush());
        assertTrue(UnifiedPush.holds(tokens[1], context, ENDPOINT));
    }

    /** Switching off hands Telegram back to Firebase whether it holds the Web Push token or the bare address a 0.0.17 sign-up left. */
    @Test public void telegramHoldsTheAddressAsAWebPushTokenOrAsTheBareOldOne() {
        signedUp();
        String signUp = webPush();
        assertTrue(UnifiedPush.holds(signUp, context, ENDPOINT));
        assertTrue("a Simple push sign-up from 0.0.17", UnifiedPush.holds(ENDPOINT, context, ENDPOINT));
        assertFalse(UnifiedPush.holds("fcm-token", context, ENDPOINT));
        assertFalse(UnifiedPush.holds(null, context, ENDPOINT));
        assertFalse("another address", UnifiedPush.holds(UnifiedPush.webPushToken(context, ENDPOINT + "2", true), context, ENDPOINT));
        UnifiedPush.prefs(context).edit().remove(UnifiedPush.WEB_PUSH_KEY).commit();
        assertFalse("without keys only the bare address counts", UnifiedPush.holds(signUp, context, ENDPOINT));
        assertNull("checking doesn't make keys", UnifiedPush.prefs(context).getString(UnifiedPush.WEB_PUSH_KEY, null));
    }

    @Test public void signingUpPicksNtfyAndSendsWhatTheSpecAsks() {
        install(OTHER, UnifiedPush.NTFY);
        assertEquals(java.util.Arrays.asList(UnifiedPush.NTFY, OTHER), UnifiedPush.distributors(context));
        UnifiedPush.sync(context, true);
        Intent register = last(UnifiedPush.REGISTER);
        assertNotNull(register);
        assertEquals(UnifiedPush.NTFY, register.getPackage());
        assertEquals(token(), register.getStringExtra("token"));
        assertEquals(36, token().length());
        assertEquals(context.getPackageName(), register.getStringExtra("application"));
        assertTrue(register.getParcelableExtra("pi") instanceof PendingIntent);

        // Each start signs up again with the same token, which keeps the same address.
        String first = token();
        UnifiedPush.sync(context, true);
        assertEquals(first, token());
        assertEquals(first, last(UnifiedPush.REGISTER).getStringExtra("token"));

        // Another app: the old sign-up ends and the new one gets a token of its own.
        UnifiedPush.prefs(context).edit().putString(UnifiedPush.CHOSEN, OTHER).commit();
        UnifiedPush.sync(context, true);
        Intent ended = last(UnifiedPush.UNREGISTER);
        assertEquals(UnifiedPush.NTFY, ended.getPackage());
        assertEquals(first, ended.getStringExtra("token"));
        assertEquals(OTHER, last(UnifiedPush.REGISTER).getPackage());
        assertNotEquals(first, token());
        assertEquals(token(), last(UnifiedPush.REGISTER).getStringExtra("token"));
    }

    @Test public void anAddressCountsOnlyWithTheSignUpsTokenAndGoesToTelegram() {
        install(UnifiedPush.NTFY);
        Settings.UNIFIED_PUSH.save(true);
        UnifiedPush.sync(context, true);
        int[] done = {0};
        UnifiedPush.receive(context, from(UnifiedPush.NEW_ENDPOINT, "someone-else").putExtra("endpoint", ENDPOINT), () -> done[0]++);
        assertNull(UnifiedPush.prefs(context).getString(UnifiedPush.ENDPOINT, null));
        for (String bad : new String[]{"javascript:alert(1)", "https://", "ftp://host/x", ""}) {
            UnifiedPush.receive(context, from(UnifiedPush.NEW_ENDPOINT, token()).putExtra("endpoint", bad), () -> done[0]++);
        }
        assertNull(UnifiedPush.prefs(context).getString(UnifiedPush.ENDPOINT, null));
        assertTrue(registered.isEmpty());

        UnifiedPush.receive(context, from(UnifiedPush.NEW_ENDPOINT, token()).putExtra("endpoint", ENDPOINT), () -> done[0]++);
        assertEquals(ENDPOINT, UnifiedPush.prefs(context).getString(UnifiedPush.ENDPOINT, null));
        assertEquals(java.util.Collections.singletonList(ENDPOINT), registered);
        assertEquals("every broadcast is finished", 6, done[0]);

        // Paused, the address is kept for later and Telegram keeps the one it has.
        registered.clear();
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        UnifiedPush.receive(context, from(UnifiedPush.NEW_ENDPOINT, token()).putExtra("endpoint", ENDPOINT + "2"), () -> {});
        assertEquals(ENDPOINT + "2", UnifiedPush.prefs(context).getString(UnifiedPush.ENDPOINT, null));
        assertTrue(registered.isEmpty());
    }

    /**
     * Issue #50: with only the address signed up, messages waited until Telegram was opened, so the
     * address going to Telegram also turns its own connection on. Paused, neither happens.
     */
    @Test public void anAddressGoingToTelegramKeepsTelegramsOwnConnectionOnBesideIt() {
        install(UnifiedPush.NTFY);
        Settings.UNIFIED_PUSH.save(true);
        UnifiedPush.sync(context, true);
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        UnifiedPush.receive(context, from(UnifiedPush.NEW_ENDPOINT, token()).putExtra("endpoint", ENDPOINT), () -> {});
        assertNotEquals(Boolean.TRUE, OwnConnection.bothOn(context));
        assertEquals(0, ownConnectionApplied);

        PauseForTests.resume();
        UnifiedPush.receive(context, from(UnifiedPush.NEW_ENDPOINT, token()).putExtra("endpoint", ENDPOINT), () -> {});
        assertEquals(java.util.Collections.singletonList(ENDPOINT), registered);
        assertEquals(Boolean.TRUE, OwnConnection.bothOn(context));
        assertTrue(OwnConnection.turnedOnBesideUnifiedPush(context));
        assertEquals(1, ownConnectionApplied);
    }

    @Test public void aMessageWakesTelegramAndIsAcknowledged() {
        String token = signedUp();
        int[] done = {0};
        UnifiedPush.receive(context, from(UnifiedPush.MESSAGE, token).putExtra("bytesMessage", "version=1".getBytes())
                .putExtra("id", "m1"), () -> done[0]++);
        assertEquals(1, wakes.size());
        assertEquals("the broadcast stays open until Telegram has been told", 0, done[0]);
        wakes.get(0).run();
        wakes.get(0).run();
        assertEquals(1, done[0]);
        Intent ack = last(UnifiedPush.MESSAGE_ACK);
        assertEquals(UnifiedPush.NTFY, ack.getPackage());
        assertEquals(token, ack.getStringExtra("token"));
        assertEquals("m1", ack.getStringExtra("id"));

        // Somebody else's message, or one while paused, wakes nothing and still finishes.
        UnifiedPush.receive(context, from(UnifiedPush.MESSAGE, "someone-else"), () -> done[0]++);
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        UnifiedPush.receive(context, from(UnifiedPush.MESSAGE, token), () -> done[0]++);
        assertEquals(1, wakes.size());
        assertEquals(3, done[0]);
    }

    @Test public void aRefusalKeepsAWorkingAddressAndOnlyAFirstRefusalShows() {
        String token = signedUp();
        assertEquals("Telegram's wake-ups come through io.heckel.ntfy.", UnifiedPush.status(context, true));
        // Asked again at a start, the app fails for a moment: the address it gave before still works.
        UnifiedPush.receive(context, from(UnifiedPush.REGISTRATION_FAILED, token).putExtra("reason", "NETWORK"), () -> {});
        assertEquals(ENDPOINT, UnifiedPush.activeEndpoint());
        assertEquals("a refusal after the address came in is ignored, token and all", token, token());
        assertEquals("Telegram's wake-ups come through io.heckel.ntfy.", UnifiedPush.status(context, true));

        // Turned down before there was ever an address, the row says so.
        UnifiedPush.sync(context, false);
        UnifiedPush.sync(context, true);
        UnifiedPush.receive(context, from(UnifiedPush.REGISTRATION_FAILED, token()), () -> {});
        assertEquals("io.heckel.ntfy turned the sign-up down. Check that it allows UnifiedPush.", UnifiedPush.status(context, true));
        assertNull(UnifiedPush.activeEndpoint());
    }

    @Test public void anEndedSignUpStaysEndedUntilTheSwitchGoesOffAndOn() {
        String token = signedUp();
        UnifiedPush.receive(context, from(UnifiedPush.UNREGISTERED, token), () -> {});
        assertEquals("io.heckel.ntfy ended the sign-up. Turn the switch off and on to sign up again.", UnifiedPush.status(context, true));
        assertEquals("nothing answers at the old address, so Telegram is asked for Firebase again",
                java.util.Collections.singletonList(ENDPOINT), released);
        int registers = count(UnifiedPush.REGISTER);
        UnifiedPush.sync(context, true);
        assertEquals("a new start doesn't sign up again behind the app's back", registers, count(UnifiedPush.REGISTER));

        UnifiedPush.sync(context, false);
        assertEquals("the address was already handed back", 1, released.size());
        assertEquals("io.heckel.ntfy. Turn the switch on to sign up with it.", UnifiedPush.status(context, false));
        UnifiedPush.sync(context, true);
        assertEquals(registers + 1, count(UnifiedPush.REGISTER));
        assertEquals("Signing up with io.heckel.ntfy…", UnifiedPush.status(context, true));
    }

    @Test public void pickingAnAppAfterAnEndedSignUpSignsUpWithIt() {
        install(OTHER);
        String token = signedUp();
        UnifiedPush.receive(context, from(UnifiedPush.UNREGISTERED, token), () -> {});
        int registers = count(UnifiedPush.REGISTER);
        UnifiedPush.choose(context, OTHER, true);
        assertEquals(registers + 1, count(UnifiedPush.REGISTER));
        assertEquals(OTHER, last(UnifiedPush.REGISTER).getPackage());
        assertEquals("Signing up with org.example.push…", UnifiedPush.status(context, true));
    }

    @Test public void turningItOffEndsTheSignUpAndForgetsTheAddress() {
        String token = signedUp();
        UnifiedPush.prefs(context).edit().putString(UnifiedPush.CHOSEN, UnifiedPush.NTFY).commit();
        Settings.UNIFIED_PUSH.save(false);
        UnifiedPush.sync(context, false);
        Intent ended = last(UnifiedPush.UNREGISTER);
        assertEquals(UnifiedPush.NTFY, ended.getPackage());
        assertEquals(token, ended.getStringExtra("token"));
        assertNull(token());
        assertNull(UnifiedPush.prefs(context).getString(UnifiedPush.ENDPOINT, null));
        assertEquals("Telegram is asked for Firebase again right away", java.util.Collections.singletonList(ENDPOINT), released);
        assertEquals("the choice of app stays", UnifiedPush.NTFY, UnifiedPush.prefs(context).getString(UnifiedPush.CHOSEN, null));
        // Each later start with the switch off has nothing left to hand back.
        UnifiedPush.sync(context, false);
        assertEquals(1, released.size());
        // Its last address is gone, so a broadcast carrying the old token is somebody else's now.
        UnifiedPush.receive(context, from(UnifiedPush.MESSAGE, token), () -> {});
        assertTrue(wakes.isEmpty());
        assertNull(UnifiedPush.raise(context));
    }

    @Test public void withNoAppInstalledTheRowSaysWhatToInstall() {
        assertNull(UnifiedPush.chosen(context));
        assertEquals("Install a UnifiedPush app like ntfy, then come back here.", UnifiedPush.status(context, true));
        UnifiedPush.sync(context, true);
        assertNull(last(UnifiedPush.REGISTER));
        assertNull(token());
    }

    @Test public void anAppThatIsGoneTakesItsAddressWithItSoFirebaseCanComeBack() {
        signedUp();
        assertEquals(webPush(), UnifiedPush.token(2, "fcm-token"));
        UnifiedPush.type(2);
        shadowOf(context.getPackageManager()).removeResolveInfosForIntent(new Intent(UnifiedPush.REGISTER), UnifiedPush.NTFY);
        UnifiedPush.sync(context, true);
        assertNull(token());
        assertNull(UnifiedPush.activeEndpoint());
        assertEquals("Telegram is asked for Firebase again, as when the switch goes off",
                java.util.Collections.singletonList(ENDPOINT), released);
        UnifiedPush.sync(context, true);
        assertEquals("a later start has no address left to hand back", 1, released.size());
        assertEquals("fcm-token", UnifiedPush.token(2, "fcm-token"));
        assertEquals(2, UnifiedPush.type(2));
        assertEquals("Install a UnifiedPush app like ntfy, then come back here.", UnifiedPush.status(context, true));
    }

    @Test public void withSeveralAppsAndNoneOfThemNtfyTheUserPicks() {
        install("org.example.alpha", OTHER);
        assertNull("the alphabet doesn't pick who learns when messages arrive", UnifiedPush.chosen(context));
        assertEquals("Tap to pick which UnifiedPush app to use.", UnifiedPush.status(context, true));
        UnifiedPush.sync(context, true);
        assertNull(last(UnifiedPush.REGISTER));
        UnifiedPush.choose(context, OTHER, true);
        assertEquals(OTHER, last(UnifiedPush.REGISTER).getPackage());
    }

    @Test public void theOnlyAppThereIsIsPickedWithoutAsking() {
        install(OTHER);
        assertEquals(OTHER, UnifiedPush.chosen(context));
        UnifiedPush.sync(context, true);
        assertEquals(OTHER, last(UnifiedPush.REGISTER).getPackage());
    }

    @Test public void outsideThisBuildNothingAnswers() {
        String token = signedUp();
        assertNotNull(UnifiedPush.raise(context));
        PatchFamilyForTests.inBuild();
        int registers = count(UnifiedPush.REGISTER);
        UnifiedPush.onTelegramStart(context);
        UnifiedPush.switched(context, true);
        UnifiedPush.receive(context, from(UnifiedPush.MESSAGE, token), () -> {});
        assertTrue(wakes.isEmpty());
        assertNull(UnifiedPush.raise(context));
        assertEquals(registers, count(UnifiedPush.REGISTER));
    }

    /** The spec: a refused registration's token is changed for the next one, and its late answers are a stranger's. */
    @Test public void aRefusedFirstSignUpGetsANewTokenNextTime() {
        install(UnifiedPush.NTFY);
        Settings.UNIFIED_PUSH.save(true);
        UnifiedPush.sync(context, true);
        String refused = token();
        UnifiedPush.receive(context, from(UnifiedPush.REGISTRATION_FAILED, refused).putExtra("reason", "ACTION_REQUIRED"), () -> {});
        assertNull(token());
        assertEquals("io.heckel.ntfy turned the sign-up down. Check that it allows UnifiedPush.", UnifiedPush.status(context, true));
        UnifiedPush.receive(context, from(UnifiedPush.NEW_ENDPOINT, refused).putExtra("endpoint", ENDPOINT), () -> {});
        assertNull(UnifiedPush.activeEndpoint());
        assertTrue(registered.isEmpty());

        UnifiedPush.sync(context, true);
        assertNotNull(token());
        assertNotEquals(refused, token());
        assertEquals(token(), last(UnifiedPush.REGISTER).getStringExtra("token"));
        assertEquals("Signing up with io.heckel.ntfy…", UnifiedPush.status(context, true));
    }

    @Test public void aNewAddressIsAcknowledgedWhenItCarriesAnId() {
        install(UnifiedPush.NTFY);
        Settings.UNIFIED_PUSH.save(true);
        UnifiedPush.sync(context, true);
        UnifiedPush.receive(context, from(UnifiedPush.NEW_ENDPOINT, token()).putExtra("endpoint", ENDPOINT).putExtra("id", "e1"), () -> {});
        Intent ack = last(UnifiedPush.MESSAGE_ACK);
        assertNotNull("an address nobody acknowledges may be dropped by the app", ack);
        assertEquals(UnifiedPush.NTFY, ack.getPackage());
        assertEquals(token(), ack.getStringExtra("token"));
        assertEquals("e1", ack.getStringExtra("id"));
        // Somebody else's address isn't acknowledged either.
        UnifiedPush.receive(context, from(UnifiedPush.NEW_ENDPOINT, "someone-else").putExtra("endpoint", ENDPOINT).putExtra("id", "e2"), () -> {});
        assertEquals("e1", last(UnifiedPush.MESSAGE_ACK).getStringExtra("id"));
    }

    @Test public void aPlainHttpAddressIsTurnedAwayAndTheRowSaysWhy() {
        install(UnifiedPush.NTFY);
        Settings.UNIFIED_PUSH.save(true);
        UnifiedPush.sync(context, true);
        assertFalse(UnifiedPush.usable("http://ntfy.example/upAbC"));
        UnifiedPush.receive(context, from(UnifiedPush.NEW_ENDPOINT, token()).putExtra("endpoint", "http://ntfy.example/upAbC"), () -> {});
        assertNull(UnifiedPush.activeEndpoint());
        assertTrue(registered.isEmpty());
        assertEquals("io.heckel.ntfy gave an address without https, which Telegram's servers won't call.",
                UnifiedPush.status(context, true));
        UnifiedPush.receive(context, from(UnifiedPush.NEW_ENDPOINT, token()).putExtra("endpoint", ENDPOINT), () -> {});
        assertEquals(ENDPOINT, UnifiedPush.activeEndpoint());
        assertEquals("Telegram's wake-ups come through io.heckel.ntfy.", UnifiedPush.status(context, true));
    }

    @Test public void aPlainHttpAddressReplacingAWorkingOneLetsTheOldOneGo() {
        String token = signedUp();
        UnifiedPush.receive(context, from(UnifiedPush.NEW_ENDPOINT, token).putExtra("endpoint", "http://ntfy.example/upAbC"), () -> {});
        // The app moved to an http server, so nothing answers at the old address and Firebase is let back in.
        assertEquals(Collections.singletonList(ENDPOINT), released);
        assertNull(UnifiedPush.activeEndpoint());
        assertTrue(registered.isEmpty());
        assertEquals(token, token());
        assertEquals("io.heckel.ntfy gave an address without https, which Telegram's servers won't call.",
                UnifiedPush.status(context, true));
    }

    @Test public void anOutageKeepsTheSignUpAndItsAddressUntilTheAppIsBack() {
        String token = signedUp();
        UnifiedPush.receive(context, from(UnifiedPush.TEMP_UNAVAILABLE, "someone-else"), () -> {});
        assertEquals("Telegram's wake-ups come through io.heckel.ntfy.", UnifiedPush.status(context, true));
        int[] done = {0};
        UnifiedPush.receive(context, from(UnifiedPush.TEMP_UNAVAILABLE, token).putExtra("useDistributor", OTHER), () -> done[0]++);
        assertEquals(1, done[0]);
        assertEquals("The server behind io.heckel.ntfy is down for now. Wake-ups come back once it's up.",
                UnifiedPush.status(context, true));
        assertEquals(token, token());
        assertEquals(ENDPOINT, UnifiedPush.activeEndpoint());
        assertTrue("Telegram keeps the address through an outage", released.isEmpty());
        for (Intent intent : sent()) assertNotEquals("a suggested stand-in app was signed up with", OTHER, intent.getPackage());
        // A start during the outage asks again with the same token, and the app's next address says it's back.
        UnifiedPush.sync(context, true);
        assertEquals(token, last(UnifiedPush.REGISTER).getStringExtra("token"));
        UnifiedPush.receive(context, from(UnifiedPush.NEW_ENDPOINT, token).putExtra("endpoint", ENDPOINT), () -> {});
        assertEquals("Telegram's wake-ups come through io.heckel.ntfy.", UnifiedPush.status(context, true));
    }

    /** On Android 14 and up the spec's FLAG_SHARE_IDENTITY takes the stand-in PendingIntent's place. */
    @Config(sdk = 34)
    @Test public void onAndroid14AndroidTellsTheAppWhoIsAsking() {
        List<Intent> intents = new ArrayList<>();
        List<android.os.Bundle> options = new ArrayList<>();
        UnifiedPush.Broadcasts kept = UnifiedPush.broadcasts;
        UnifiedPush.broadcasts = (ignored, intent, bundle) -> {
            intents.add(intent);
            options.add(bundle);
        };
        try {
            String token = signedUp();
            UnifiedPush.receive(context, from(UnifiedPush.MESSAGE, token).putExtra("id", "m1"), () -> {});
            UnifiedPush.sync(context, false);
        } finally {
            UnifiedPush.broadcasts = kept;
        }
        List<String> actions = new ArrayList<>();
        for (int i = 0; i < intents.size(); i++) {
            String action = intents.get(i).getAction();
            actions.add(action);
            if (UnifiedPush.REGISTER.equals(action) || UnifiedPush.UNREGISTER.equals(action)) {
                assertFalse(action, intents.get(i).hasExtra("pi"));
                assertNotNull(action, options.get(i));
                assertTrue(action, android.app.BroadcastOptions.fromBundle(options.get(i)).isShareIdentityEnabled());
            } else {
                assertNull(action, options.get(i));
            }
        }
        assertTrue(actions.toString(), actions.contains(UnifiedPush.REGISTER));
        assertTrue(actions.toString(), actions.contains(UnifiedPush.UNREGISTER));
        assertTrue(actions.toString(), actions.contains(UnifiedPush.MESSAGE_ACK));
    }

    /** The real file, except that a write can be made to fail the way a full disk does. */
    private static final class Flaky implements android.content.SharedPreferences {
        final android.content.SharedPreferences real;
        boolean failWrites;
        /** A failed write still changes what reads see, the way Android's own commit leaves it in memory. */
        boolean failedWritesStay;
        /** When set, each read of the auth secret waits up to a second for the others, so first asks overlap if they can. */
        java.util.concurrent.CountDownLatch readers;

        Flaky(android.content.SharedPreferences real) {
            this.real = real;
        }

        @Override public java.util.Map<String, ?> getAll() { return real.getAll(); }
        @Override public String getString(String key, String fallback) {
            String value = real.getString(key, fallback);
            if (readers != null && UnifiedPush.WEB_PUSH_AUTH.equals(key)) {
                readers.countDown();
                try {
                    readers.await(1, java.util.concurrent.TimeUnit.SECONDS);
                } catch (InterruptedException stopped) {
                    Thread.currentThread().interrupt();
                }
            }
            return value;
        }
        @Override public java.util.Set<String> getStringSet(String key, java.util.Set<String> fallback) { return real.getStringSet(key, fallback); }
        @Override public int getInt(String key, int fallback) { return real.getInt(key, fallback); }
        @Override public long getLong(String key, long fallback) { return real.getLong(key, fallback); }
        @Override public float getFloat(String key, float fallback) { return real.getFloat(key, fallback); }
        @Override public boolean getBoolean(String key, boolean fallback) { return real.getBoolean(key, fallback); }
        @Override public boolean contains(String key) { return real.contains(key); }
        @Override public void registerOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener listener) {
            real.registerOnSharedPreferenceChangeListener(listener);
        }
        @Override public void unregisterOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener listener) {
            real.unregisterOnSharedPreferenceChangeListener(listener);
        }

        /** Changes wait in the real editor and are dropped when the write fails, unless {@link #failedWritesStay}. */
        @Override public Editor edit() {
            Editor writes = real.edit();
            return new Editor() {
                @Override public Editor putString(String key, String value) { writes.putString(key, value); return this; }
                @Override public Editor putStringSet(String key, java.util.Set<String> values) { writes.putStringSet(key, values); return this; }
                @Override public Editor putInt(String key, int value) { writes.putInt(key, value); return this; }
                @Override public Editor putLong(String key, long value) { writes.putLong(key, value); return this; }
                @Override public Editor putFloat(String key, float value) { writes.putFloat(key, value); return this; }
                @Override public Editor putBoolean(String key, boolean value) { writes.putBoolean(key, value); return this; }
                @Override public Editor remove(String key) { writes.remove(key); return this; }
                @Override public Editor clear() { writes.clear(); return this; }
                @Override public boolean commit() {
                    if (!failWrites) return writes.commit();
                    if (failedWritesStay) writes.commit();
                    return false;
                }
                @Override public void apply() { if (!failWrites || failedWritesStay) writes.apply(); }
            };
        }
    }

    /** Nothing goes to the app or to Telegram on a write that didn't reach the disk. */
    @Test public void nothingGoesOutUntilWhatItDependsOnIsSaved() {
        install(UnifiedPush.NTFY);
        Settings.UNIFIED_PUSH.save(true);
        Flaky flaky = new Flaky(UnifiedPush.prefs(context));
        UnifiedPush.store = ignored -> flaky;
        flaky.failWrites = true;
        UnifiedPush.sync(context, true);
        assertNull("a token this side couldn't keep was sent", last(UnifiedPush.REGISTER));
        assertTrue(String.join("\n", HookStatus.report()).contains("sign-up not saved"));
        UnifiedPush.choose(context, UnifiedPush.NTFY, true);
        assertNull(last(UnifiedPush.REGISTER));

        flaky.failWrites = false;
        UnifiedPush.sync(context, true);
        String token = token();
        assertEquals(token, last(UnifiedPush.REGISTER).getStringExtra("token"));
        flaky.failWrites = true;
        UnifiedPush.receive(context, from(UnifiedPush.NEW_ENDPOINT, token).putExtra("endpoint", ENDPOINT), () -> {});
        assertTrue("Telegram got an address that a restart would forget", registered.isEmpty());
        assertNull(UnifiedPush.activeEndpoint());
        assertTrue(String.join("\n", HookStatus.report()).contains("address not saved"));

        // Off still ends the sign-up with the app, and says the file still holds it.
        UnifiedPush.sync(context, false);
        assertEquals(token, last(UnifiedPush.UNREGISTER).getStringExtra("token"));
        assertTrue(String.join("\n", HookStatus.report()).contains("sign-up not forgotten"));
    }

    private int count(String action) {
        int n = 0;
        for (Intent intent : sent()) if (action.equals(intent.getAction())) n++;
        return n;
    }
}
