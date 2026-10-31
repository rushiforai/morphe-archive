/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.content.SharedPreferences;

import java.util.Map;
import java.util.Set;
import java.util.function.Function;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.telegram.tgnet.TLRPC;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.PatchFamilyForTests;
import app.hushtelegram.extension.telegram.settings.Settings;

/** Telegram's own two switches after a push sign-up answer or a UnifiedPush address. Nothing here starts a service or connects. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class OwnConnectionTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    private final Context context = RuntimeEnvironment.getApplication();
    private final Function<Context, SharedPreferences> realTelegram = OwnConnection.telegramStore;
    private final Function<Context, SharedPreferences> realStore = OwnConnection.store;
    private final Runnable realApply = OwnConnection.apply;
    private int applied;

    @Before public void setUp() {
        HookStatus.clear();
        PauseForTests.resume();
        Settings.REPAIR_FIREBASE_PUSH.resetToDefault();
        Settings.UNIFIED_PUSH.resetToDefault();
        telegram().edit().clear().commit();
        OwnConnection.store.apply(context).edit().clear().commit();
        UnifiedPush.prefs(context).edit().clear().commit();
        OwnConnection.apply = () -> applied++;
        FirebasePushTest.forgetAnswer();
    }

    @After public void restore() {
        OwnConnection.telegramStore = realTelegram;
        OwnConnection.store = realStore;
        OwnConnection.apply = realApply;
        Settings.REPAIR_FIREBASE_PUSH.resetToDefault();
        Settings.UNIFIED_PUSH.resetToDefault();
        PauseForTests.resume();
        HookStatus.clear();
        FirebasePushTest.forgetAnswer();
    }

    private SharedPreferences telegram() { return realTelegram.apply(context); }

    /** One account's place, signed in throughout unless a test signs it out. */
    private final FirebasePushTest.Place place = new FirebasePushTest.Place(918337771L);

    private void refused() { refused(FirebasePushTest.FIREBASE); }

    private void refused(int transport) {
        FirebasePushTest.signUp(place, transport, null, new TLRPC.TL_error(400, "APP_PUSH_APIKEY_MISSING"));
    }

    private void accepted() { accepted(FirebasePushTest.FIREBASE); }

    private void accepted(int transport) { FirebasePushTest.signUp(place, transport, new TLRPC.TL_boolTrue(), null); }

    private boolean report(String line) { return HookStatus.report().toString().contains(line); }

    @Test public void aRefusedSignUpTurnsOnTelegramsOwnConnectionWhenNobodyChoseBefore() {
        refused();
        assertTrue(telegram().getBoolean(OwnConnection.KEEP_ALIVE, false));
        assertTrue(telegram().getBoolean(OwnConnection.BACKGROUND, false));
        assertTrue(OwnConnection.turnedOnHere(context));
        assertEquals(Boolean.TRUE, OwnConnection.bothOn(context));
        assertEquals(1, applied);
        assertTrue(report("own connection turned on for a refused sign-up 1"));

        refused();
        assertEquals("a second refusal finds them on already", 1, applied);
    }

    @Test public void aChoiceMadeInTelegramStaysTheUsers() {
        telegram().edit().putBoolean(OwnConnection.KEEP_ALIVE, false).commit();
        refused();
        assertFalse(telegram().getBoolean(OwnConnection.KEEP_ALIVE, true));
        assertFalse(telegram().contains(OwnConnection.BACKGROUND));
        assertFalse(OwnConnection.turnedOnHere(context));
        assertEquals(0, applied);
        assertTrue(report("own connection left as set in Telegram 1"));
    }

    @Test public void theRepairSwitchOffAndEveryPauseLeaveEverythingAlone() {
        Settings.REPAIR_FIREBASE_PUSH.save(false);
        refused();
        assertTrue(telegram().getAll().isEmpty());
        Settings.REPAIR_FIREBASE_PUSH.resetToDefault();
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            refused();
            assertTrue(reason.name(), telegram().getAll().isEmpty());
            PauseForTests.resume();
        }
        assertEquals(0, applied);
        assertFalse(OwnConnection.turnedOnHere(context));
    }

    @Test public void anAcceptedFirebaseSignUpHandsBothBackToTelegramsDefaults() {
        refused();
        accepted();
        assertFalse(telegram().contains(OwnConnection.KEEP_ALIVE));
        assertFalse(telegram().contains(OwnConnection.BACKGROUND));
        assertFalse(OwnConnection.turnedOnHere(context));
        assertEquals(2, applied);
        assertTrue(report("own connection handed back to push 1"));
    }

    @Test public void anAcceptanceNeverTouchesSwitchesTheUserSetOrChanged() {
        telegram().edit().putBoolean(OwnConnection.KEEP_ALIVE, true).putBoolean(OwnConnection.BACKGROUND, true).commit();
        accepted();
        assertTrue(telegram().getBoolean(OwnConnection.KEEP_ALIVE, false));
        assertTrue(telegram().getBoolean(OwnConnection.BACKGROUND, false));

        telegram().edit().clear().commit();
        refused();
        telegram().edit().putBoolean(OwnConnection.KEEP_ALIVE, false).commit();
        accepted();
        assertFalse(telegram().getBoolean(OwnConnection.KEEP_ALIVE, true));
        assertTrue(telegram().getBoolean(OwnConnection.BACKGROUND, false));
        assertFalse("the changed switch makes it the user's from here", OwnConnection.turnedOnHere(context));
        assertEquals(1, applied);
    }

    @Test public void anAcceptedUnifiedPushSignUpSaysNothingAboutFirebase() {
        refused();
        UnifiedPush.prefs(context).edit().putString(UnifiedPush.ENDPOINT, "https://ntfy.sh/upAbCdEf12?up=1").commit();
        Settings.UNIFIED_PUSH.save(true);
        accepted(FirebasePushTest.UNIFIED_PUSH);
        assertEquals(Boolean.TRUE, OwnConnection.bothOn(context));
        assertTrue(OwnConnection.turnedOnHere(context));
        assertEquals(1, applied);
    }

    /**
     * Each answer comes with the transport its sign-up went out on, and only a Firebase one acts.
     * With no UnifiedPush address in use, nothing but the transport keeps these from acting.
     */
    @Test public void aUnifiedPushAnswerNeitherTurnsItOnNorHandsItBack() {
        refused(FirebasePushTest.UNIFIED_PUSH);
        assertTrue("a UnifiedPush refusal turned them on", telegram().getAll().isEmpty());
        assertFalse(OwnConnection.turnedOnHere(context));
        assertEquals(0, applied);

        refused();
        assertTrue(OwnConnection.turnedOnHere(context));
        accepted(FirebasePushTest.UNIFIED_PUSH);
        assertEquals("a UnifiedPush yes handed them back", Boolean.TRUE, OwnConnection.bothOn(context));
        assertTrue(OwnConnection.turnedOnHere(context));
        assertEquals(1, applied);
        assertFalse(report("own connection handed back"));

        // A token type nothing here sends says nothing about Firebase either.
        accepted(7);
        assertTrue(OwnConnection.turnedOnHere(context));
        accepted();
        assertFalse(OwnConnection.turnedOnHere(context));
        assertEquals(2, applied);
    }

    /**
     * Telegram ends a waiting sign-up with an error as its account signs out. That's no refusal, and
     * nor is a reply nobody can say is whose.
     */
    @Test public void aReplyForAnAccountThatLeftOrIsUnclearLeavesEverythingAlone() {
        FirebasePush.registerDeviceSent(place, FirebasePushTest.FIREBASE);
        place.user = 0;
        FirebasePush.registerDeviceAnswer(place, FirebasePushTest.FIREBASE, null, new TLRPC.TL_error(-1000, ""));
        assertTrue(telegram().getAll().isEmpty());

        // Two accounts' sign-ups wait at one place, so neither reply can be told apart.
        place.user = 918337771L;
        FirebasePush.registerDeviceSent(place, FirebasePushTest.FIREBASE);
        place.user = 918337772L;
        FirebasePush.registerDeviceSent(place, FirebasePushTest.FIREBASE);
        FirebasePush.registerDeviceAnswer(place, FirebasePushTest.FIREBASE, null, new TLRPC.TL_error(400, "APP_PUSH_APIKEY_MISSING"));
        FirebasePush.registerDeviceAnswer(place, FirebasePushTest.FIREBASE, null, new TLRPC.TL_error(400, "APP_PUSH_APIKEY_MISSING"));
        assertTrue(telegram().getAll().isEmpty());
        assertFalse(OwnConnection.turnedOnHere(context));
        assertEquals(0, applied);

        refused();
        assertTrue("the account now there still gets its own refusal acted on", OwnConnection.turnedOnHere(context));
        assertEquals(1, applied);
    }

    @Test public void aWriteThatFailsLeavesNothingHalfDone() {
        OwnConnection.telegramStore = c -> new Unsaved(realTelegram.apply(c));
        refused();
        assertFalse(OwnConnection.turnedOnHere(context));
        assertTrue(telegram().getAll().isEmpty());
        assertEquals(0, applied);
        assertTrue(report("own connection not saved 1"));

        OwnConnection.telegramStore = realTelegram;
        OwnConnection.store = c -> new Unsaved(realStore.apply(c));
        refused();
        assertTrue(telegram().getAll().isEmpty());
        assertEquals(0, applied);
    }

    /** Android keeps a failed commit's values in memory, so each failure takes them back out itself. */
    @Test public void aFailedWriteAndroidStillHoldsInMemoryIsTakenBackOut() {
        Settings.UNIFIED_PUSH.save(true);
        OwnConnection.telegramStore = c -> new Unsaved(realTelegram.apply(c), true);
        OwnConnection.besideUnifiedPush(context);
        assertTrue("Telegram's switches kept in memory", telegram().getAll().isEmpty());
        assertTrue(OwnConnection.store.apply(context).getAll().isEmpty());
        assertEquals(0, applied);
        assertTrue(report("own connection not saved 1"));

        OwnConnection.telegramStore = realTelegram;
        OwnConnection.store = c -> new Unsaved(realStore.apply(c), true);
        refused();
        assertTrue(realStore.apply(context).getAll().isEmpty());
        assertTrue(telegram().getAll().isEmpty());
        assertFalse(OwnConnection.turnedOnHere(context));
        assertEquals(0, applied);
    }

    /**
     * Issue #50: Telegram's servers accept the UnifiedPush sign-up but never called the address for
     * a message on the S22, so its own connection stays on beside it, under the same rules.
     */
    @Test public void anAddressHandedToTelegramTurnsItsOwnConnectionOnBesideUnifiedPush() {
        UnifiedPush.prefs(context).edit().putString(UnifiedPush.ENDPOINT, "https://ntfy.sh/upAbCdEf12?up=1").commit();
        Settings.UNIFIED_PUSH.save(true);
        OwnConnection.besideUnifiedPush(context);
        assertEquals(Boolean.TRUE, OwnConnection.bothOn(context));
        assertTrue(OwnConnection.turnedOnHere(context));
        assertTrue(OwnConnection.turnedOnBesideUnifiedPush(context));
        assertEquals(1, applied);
        assertTrue(report("own connection kept on beside UnifiedPush 1"));

        OwnConnection.besideUnifiedPush(context);
        refused();
        assertEquals("a new address and a refusal find them on already", 1, applied);
        assertTrue(OwnConnection.turnedOnBesideUnifiedPush(context));

        // An accepted Firebase sign-up says nothing while UnifiedPush carries the wake-ups.
        accepted();
        assertEquals(Boolean.TRUE, OwnConnection.bothOn(context));
        assertTrue(OwnConnection.turnedOnBesideUnifiedPush(context));

        Settings.UNIFIED_PUSH.save(false);
        accepted();
        assertFalse(telegram().contains(OwnConnection.KEEP_ALIVE));
        assertFalse(telegram().contains(OwnConnection.BACKGROUND));
        assertFalse(OwnConnection.turnedOnHere(context));
        assertFalse(OwnConnection.turnedOnBesideUnifiedPush(context));
        assertEquals(2, applied);
    }

    @Test public void besideUnifiedPushTheUsersChoiceTheSwitchAndPauseStillWin() {
        OwnConnection.besideUnifiedPush(context);
        assertTrue("UnifiedPush off", telegram().getAll().isEmpty());

        Settings.UNIFIED_PUSH.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            OwnConnection.besideUnifiedPush(context);
            assertTrue(reason.name(), telegram().getAll().isEmpty());
            PauseForTests.resume();
        }
        OwnConnection.besideUnifiedPush(null);
        assertEquals(0, applied);

        telegram().edit().putBoolean(OwnConnection.BACKGROUND, false).commit();
        OwnConnection.besideUnifiedPush(context);
        assertFalse(telegram().getBoolean(OwnConnection.BACKGROUND, true));
        assertFalse(telegram().contains(OwnConnection.KEEP_ALIVE));
        assertFalse(OwnConnection.turnedOnHere(context));
        assertTrue(report("own connection left as set in Telegram 1"));

        // UnifiedPush is its own patch, so leaving the Firebase repair off changes nothing here.
        telegram().edit().clear().commit();
        Settings.REPAIR_FIREBASE_PUSH.save(false);
        OwnConnection.besideUnifiedPush(context);
        assertEquals(Boolean.TRUE, OwnConnection.bothOn(context));
        assertEquals(1, applied);
    }

    @Test public void theNotificationReportSaysWhatTurnedThemOn() {
        PatchFamilyForTests.inBuild(PatchFamily.REPAIR_FIREBASE_PUSH);
        PatchFamilyForTests.installed(PatchFamily.Capability.FIREBASE_LOCAL_STATUS);
        try {
            Settings.UNIFIED_PUSH.save(true);
            OwnConnection.besideUnifiedPush(context);
            assertTrue(String.join("\n", FirebasePush.localReportLines())
                    .contains("keep-alive and background connection: on (beside UnifiedPush)"));

            telegram().edit().clear().commit();
            realStore.apply(context).edit().clear().commit();
            refused();
            assertTrue(String.join("\n", FirebasePush.localReportLines())
                    .contains("keep-alive and background connection: on (after a refused sign-up)"));
        } finally {
            PatchFamilyForTests.reset();
            PatchFamilyForTests.resetCapabilities();
        }
    }

    /** A store whose writes never land, or with keptInMemory, land only in memory as Android's do when a commit fails. */
    private static final class Unsaved implements SharedPreferences {
        private final SharedPreferences real;
        private final boolean keptInMemory;

        Unsaved(SharedPreferences real) { this(real, false); }

        Unsaved(SharedPreferences real, boolean keptInMemory) {
            this.real = real;
            this.keptInMemory = keptInMemory;
        }

        @Override public Map<String, ?> getAll() { return real.getAll(); }
        @Override public String getString(String key, String fallback) { return real.getString(key, fallback); }
        @Override public Set<String> getStringSet(String key, Set<String> fallback) { return real.getStringSet(key, fallback); }
        @Override public int getInt(String key, int fallback) { return real.getInt(key, fallback); }
        @Override public long getLong(String key, long fallback) { return real.getLong(key, fallback); }
        @Override public float getFloat(String key, float fallback) { return real.getFloat(key, fallback); }
        @Override public boolean getBoolean(String key, boolean fallback) { return real.getBoolean(key, fallback); }
        @Override public boolean contains(String key) { return real.contains(key); }
        @Override public void registerOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener listener) { }
        @Override public void unregisterOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener listener) { }

        @Override public Editor edit() {
            Editor memory = keptInMemory ? real.edit() : null;
            return new Editor() {
                @Override public Editor putString(String key, String value) { if (memory != null) memory.putString(key, value); return this; }
                @Override public Editor putStringSet(String key, Set<String> values) { if (memory != null) memory.putStringSet(key, values); return this; }
                @Override public Editor putInt(String key, int value) { if (memory != null) memory.putInt(key, value); return this; }
                @Override public Editor putLong(String key, long value) { if (memory != null) memory.putLong(key, value); return this; }
                @Override public Editor putFloat(String key, float value) { if (memory != null) memory.putFloat(key, value); return this; }
                @Override public Editor putBoolean(String key, boolean value) { if (memory != null) memory.putBoolean(key, value); return this; }
                @Override public Editor remove(String key) { if (memory != null) memory.remove(key); return this; }
                @Override public Editor clear() { if (memory != null) memory.clear(); return this; }
                @Override public boolean commit() { if (memory != null) memory.commit(); return false; }
                @Override public void apply() { if (memory != null) memory.commit(); }
            };
        }
    }
}
