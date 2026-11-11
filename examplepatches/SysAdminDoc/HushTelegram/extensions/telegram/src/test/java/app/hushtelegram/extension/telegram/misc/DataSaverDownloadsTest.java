/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static android.net.ConnectivityManager.RESTRICT_BACKGROUND_STATUS_DISABLED;
import static android.net.ConnectivityManager.RESTRICT_BACKGROUND_STATUS_ENABLED;
import static android.net.ConnectivityManager.RESTRICT_BACKGROUND_STATUS_WHITELISTED;
import static android.net.ConnectivityManager.TYPE_MOBILE;
import static android.net.ConnectivityManager.TYPE_WIFI;
import static app.hushtelegram.extension.telegram.misc.DataSaverDownloadsForTests.android;
import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.net.ConnectivityManager;
import android.net.NetworkCapabilities;
import android.net.NetworkInfo;
import android.os.Looper;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.time.Duration;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.shadows.ShadowConnectivityManager;
import org.robolectric.shadows.ShadowNetwork;
import org.robolectric.shadows.ShadowNetworkCapabilities;
import org.robolectric.shadows.ShadowNetworkInfo;
import org.robolectric.shadows.ShadowSystemClock;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class DataSaverDownloadsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** The controllers Telegram's check ran on, in order. */
    private final List<Object> checked = new ArrayList<>();
    private final Object controller = new Object();

    @Before public void reset() {
        restore();
        DataSaverDownloads.later = Runnable::run;
        DataSaverDownloads.checker = checked::add;
    }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.DATA_SAVER_DOWNLOADS);
        Settings.DATA_SAVER_DOWNLOADS.resetToDefault();
        DataSaverDownloads.reset();
        HookStatus.clear();
        RefusingConnectivity.refusals = 0;
    }

    private static DataSaverDownloads.Status now() {
        return DataSaverDownloads.status(RuntimeEnvironment.getApplication());
    }

    private static ShadowConnectivityManager connectivity() {
        return shadowOf(RuntimeEnvironment.getApplication().getSystemService(ConnectivityManager.class));
    }

    @Test public void offByDefaultNothingIsHeld() {
        android(RESTRICT_BACKGROUND_STATUS_ENABLED, TYPE_MOBILE);
        assertFalse(Settings.DATA_SAVER_DOWNLOADS.get());
        assertFalse(DataSaverDownloads.hold());
        assertFalse(DataSaverDownloads.holdMask(controller));
        assertTrue(String.join("\n", HookStatus.report()).contains(FamilyNames.FASTER_DOWNLOADS));
        // Nothing listens for Android while the switch is off.
        assertTrue(connectivity().getNetworkCallbacks().isEmpty());
        assertFalse(listensForDataSaver());
    }

    private static boolean listensForDataSaver() {
        return shadowOf(RuntimeEnvironment.getApplication())
                .hasReceiverForIntent(new Intent(ConnectivityManager.ACTION_RESTRICT_BACKGROUND_CHANGED));
    }

    // A change Android reports while the last answer is being read makes that answer old, so the
    // next question asks again instead of using it for a second.
    @Test public void aChangeHeardWhileAndroidIsAskedLeavesThatAnswerUnused() {
        Settings.DATA_SAVER_DOWNLOADS.save(true);
        android(RESTRICT_BACKGROUND_STATUS_ENABLED, TYPE_MOBILE);
        assertTrue(DataSaverDownloads.hold());
        DataSaverDownloads.forget();
        Context changing = new ContextWrapper(RuntimeEnvironment.getApplication()) {
            @Override public Object getSystemService(String name) {
                if (Context.CONNECTIVITY_SERVICE.equals(name)) DataSaverDownloads.forget();
                return super.getSystemService(name);
            }
        };
        SettingsContextRule.withContext(changing, () -> assertTrue(DataSaverDownloads.hold()));
        connectivity().setRestrictBackgroundStatus(RESTRICT_BACKGROUND_STATUS_DISABLED);
        assertFalse("an answer read across the change was used", DataSaverDownloads.hold());
    }

    @Test public void dataSaverOnAMeteredNetworkHoldsAutomaticDownloads() {
        Settings.DATA_SAVER_DOWNLOADS.save(true);
        android(RESTRICT_BACKGROUND_STATUS_ENABLED, TYPE_MOBILE);
        assertEquals(DataSaverDownloads.DataSaver.ON, now().dataSaver);
        assertEquals(Boolean.TRUE, now().metered);
        assertTrue(now().restricts());
        assertTrue(DataSaverDownloads.hold());
        // The network's download mask comes back with no media types.
        assertTrue(DataSaverDownloads.holdMask(controller));
        assertTrue(String.join("\n", HookStatus.report()).contains("automatic download held for Data Saver"));
    }

    @Test public void dataSaverOffOrAllowingTelegramOrAnUnmeteredNetworkKeepsTelegramsRules() {
        Settings.DATA_SAVER_DOWNLOADS.save(true);
        android(RESTRICT_BACKGROUND_STATUS_DISABLED, TYPE_MOBILE);
        assertEquals(DataSaverDownloads.DataSaver.OFF, now().dataSaver);
        assertFalse(DataSaverDownloads.hold());
        assertFalse(DataSaverDownloads.holdMask(controller));

        android(RESTRICT_BACKGROUND_STATUS_WHITELISTED, TYPE_MOBILE);
        assertEquals(DataSaverDownloads.DataSaver.ALLOWED, now().dataSaver);
        assertFalse(DataSaverDownloads.hold());
        assertFalse(DataSaverDownloads.holdMask(controller));

        android(RESTRICT_BACKGROUND_STATUS_ENABLED, TYPE_WIFI);
        assertEquals(Boolean.FALSE, now().metered);
        assertFalse(DataSaverDownloads.hold());
        assertFalse(DataSaverDownloads.holdMask(controller));
    }

    @Test public void noNetworkIsntCountedMeteredSoNothingIsHeld() {
        Settings.DATA_SAVER_DOWNLOADS.save(true);
        android(RESTRICT_BACKGROUND_STATUS_ENABLED, TYPE_MOBILE);
        connectivity().setDefaultNetworkActive(false);
        DataSaverDownloads.forget();
        assertEquals(DataSaverDownloads.DataSaver.ON, now().dataSaver);
        assertNull(now().metered);
        assertFalse(DataSaverDownloads.hold());
    }

    @Test public void androidIsAskedAgainOnceTheLastAnswerIsASecondOld() {
        Settings.DATA_SAVER_DOWNLOADS.save(true);
        android(RESTRICT_BACKGROUND_STATUS_ENABLED, TYPE_MOBILE);
        assertTrue(DataSaverDownloads.hold());
        // Chat cells ask while they lay out, so one answer is used for a second when Android says nothing.
        connectivity().setRestrictBackgroundStatus(RESTRICT_BACKGROUND_STATUS_DISABLED);
        assertTrue(DataSaverDownloads.hold());
        ShadowSystemClock.advanceBy(Duration.ofMillis(DataSaverDownloads.FRESH_MS));
        assertFalse(DataSaverDownloads.hold());
    }

    @Test public void aNewAnswerRunsTelegramsCheckOnEveryControllerOnce() {
        Settings.DATA_SAVER_DOWNLOADS.save(true);
        android(RESTRICT_BACKGROUND_STATUS_ENABLED, TYPE_MOBILE);
        Object other = new Object();
        // The first answers have nothing to compare with.
        assertTrue(DataSaverDownloads.holdMask(controller));
        assertTrue(DataSaverDownloads.holdMask(other));
        assertEquals(0, checked.size());

        android(RESTRICT_BACKGROUND_STATUS_DISABLED, TYPE_MOBILE);
        assertFalse(DataSaverDownloads.holdMask(controller));
        assertEquals(2, checked.size());
        assertTrue(checked.containsAll(Arrays.asList(controller, other)));
        // Telegram's check reads the mask again, and the same answer doesn't run it again.
        assertFalse(DataSaverDownloads.holdMask(other));
        assertEquals(2, checked.size());

        // Turning the switch off lifts the hold the same way.
        android(RESTRICT_BACKGROUND_STATUS_ENABLED, TYPE_MOBILE);
        assertTrue(DataSaverDownloads.holdMask(controller));
        Settings.DATA_SAVER_DOWNLOADS.save(false);
        assertFalse(DataSaverDownloads.holdMask(controller));
        assertEquals(6, checked.size());
    }

    // Android 13 and later want a receiver registered at runtime marked as not exported.
    @Test @Config(sdk = {30, 33, 36})
    public void dataSaverTurningOffIsHeardAtOnce() {
        Settings.DATA_SAVER_DOWNLOADS.save(true);
        android(RESTRICT_BACKGROUND_STATUS_ENABLED, TYPE_MOBILE);
        assertTrue(DataSaverDownloads.holdMask(controller));
        assertTrue(listensForDataSaver());
        checked.clear();
        connectivity().setRestrictBackgroundStatus(RESTRICT_BACKGROUND_STATUS_DISABLED);
        RuntimeEnvironment.getApplication().sendBroadcast(new Intent(ConnectivityManager.ACTION_RESTRICT_BACKGROUND_CHANGED));
        shadowOf(Looper.getMainLooper()).idle();
        // Android is asked again within the second, and Telegram checks its queue.
        assertEquals(Collections.singletonList(controller), checked);
        assertFalse(DataSaverDownloads.hold());
    }

    @Test public void theNetworkTurningUnmeteredOrGoingIsHeardAtOnce() {
        Settings.DATA_SAVER_DOWNLOADS.save(true);
        android(RESTRICT_BACKGROUND_STATUS_ENABLED, TYPE_MOBILE);
        assertTrue(DataSaverDownloads.holdMask(controller));
        assertEquals(1, connectivity().getNetworkCallbacks().size());
        ConnectivityManager.NetworkCallback callback = connectivity().getNetworkCallbacks().iterator().next();
        // From no network, whatever Android said when the callback was registered.
        callback.onLost(ShadowNetwork.newInstance(1));
        checked.clear();

        callback.onCapabilitiesChanged(ShadowNetwork.newInstance(1), ShadowNetworkCapabilities.newInstance());
        assertEquals(1, checked.size());
        // A capability change that leaves metering alone, like signal strength, says nothing.
        callback.onCapabilitiesChanged(ShadowNetwork.newInstance(1), ShadowNetworkCapabilities.newInstance());
        assertEquals(1, checked.size());

        // Wi-Fi comes up: the last answer would still hold for up to a second, until Android's callback says so.
        assertTrue(DataSaverDownloads.hold());
        connectivity().setActiveNetworkInfo(ShadowNetworkInfo.newInstance(NetworkInfo.DetailedState.CONNECTED, TYPE_WIFI, 0,
                true, NetworkInfo.State.CONNECTED));
        assertTrue(DataSaverDownloads.hold());
        NetworkCapabilities unmetered = ShadowNetworkCapabilities.newInstance();
        shadowOf(unmetered).addCapability(NetworkCapabilities.NET_CAPABILITY_NOT_METERED);
        callback.onCapabilitiesChanged(ShadowNetwork.newInstance(2), unmetered);
        assertEquals(2, checked.size());
        assertFalse(DataSaverDownloads.hold());

        callback.onLost(ShadowNetwork.newInstance(2));
        assertEquals(3, checked.size());
    }

    @Test public void aCheckThatThrowsIsReportedAndTheOthersStillRun() {
        Settings.DATA_SAVER_DOWNLOADS.save(true);
        android(RESTRICT_BACKGROUND_STATUS_ENABLED, TYPE_MOBILE);
        Object broken = new Object();
        DataSaverDownloads.checker = target -> {
            if (target == broken) throw new IllegalStateException("account gone");
            checked.add(target);
        };
        assertTrue(DataSaverDownloads.holdMask(broken));
        assertTrue(DataSaverDownloads.holdMask(controller));
        android(RESTRICT_BACKGROUND_STATUS_DISABLED, TYPE_MOBILE);
        assertFalse(DataSaverDownloads.holdMask(controller));
        assertEquals(Collections.singletonList(controller), checked);
        assertFalse(HookStatus.missing(FamilyNames.FASTER_DOWNLOADS).isEmpty());
    }

    /** Android's ConnectivityManager, refusing the next {@link #refusals} default-network callbacks. */
    @Implements(ConnectivityManager.class)
    public static class RefusingConnectivity extends ShadowConnectivityManager {
        static int refusals;

        @Implementation
        @Override protected void registerDefaultNetworkCallback(ConnectivityManager.NetworkCallback callback) {
            if (refusals > 0) {
                refusals--;
                // What Android throws for a 101st callback (TooManyRequestsException is hidden).
                throw new RuntimeException("too many network callbacks");
            }
            super.registerDefaultNetworkCallback(callback);
        }
    }

    @Test @Config(shadows = RefusingConnectivity.class)
    public void aRefusedWatchIsReportedAndTriedOnceMoreOnly() {
        Settings.DATA_SAVER_DOWNLOADS.save(true);
        android(RESTRICT_BACKGROUND_STATUS_ENABLED, TYPE_MOBILE);
        RefusingConnectivity.refusals = 2;
        // Downloads still follow Data Saver, from Android's answer.
        assertTrue(DataSaverDownloads.hold());
        assertTrue(String.join("\n", HookStatus.report()).contains("'Data Saver watch' hook"));
        assertFalse("the receiver stayed after the watch was refused", listensForDataSaver());
        assertEquals(1, RefusingConnectivity.refusals);
        // The next switch read tries once more, and is refused again.
        assertTrue(DataSaverDownloads.hold());
        assertEquals(0, RefusingConnectivity.refusals);
        RefusingConnectivity.refusals = 1;
        for (int read = 0; read < 5; read++) assertTrue(DataSaverDownloads.hold());
        assertEquals("tried again after its one retry", 1, RefusingConnectivity.refusals);
        assertTrue(connectivity().getNetworkCallbacks().isEmpty());
        assertFalse(listensForDataSaver());
    }

    @Test @Config(shadows = RefusingConnectivity.class)
    public void aWatchRefusedOnceListensFromTheNextRead() {
        Settings.DATA_SAVER_DOWNLOADS.save(true);
        android(RESTRICT_BACKGROUND_STATUS_ENABLED, TYPE_MOBILE);
        RefusingConnectivity.refusals = 1;
        assertTrue(DataSaverDownloads.holdMask(controller));
        assertTrue(connectivity().getNetworkCallbacks().isEmpty());
        assertTrue(DataSaverDownloads.holdMask(controller));
        assertEquals(1, connectivity().getNetworkCallbacks().size());
        assertTrue(listensForDataSaver());
        checked.clear();
        connectivity().setRestrictBackgroundStatus(RESTRICT_BACKGROUND_STATUS_DISABLED);
        RuntimeEnvironment.getApplication().sendBroadcast(new Intent(ConnectivityManager.ACTION_RESTRICT_BACKGROUND_CHANGED));
        shadowOf(Looper.getMainLooper()).idle();
        // One receiver, so Telegram's check runs once.
        assertEquals(Collections.singletonList(controller), checked);
    }

    @Test public void theUnpatchedCheckStubDoesNothing() {
        DataSaverDownloads.checkAgain(controller);
    }

    @Test public void pausingAnEarlyStartOrAnUnreadableSwitchHoldsNothing() {
        Settings.DATA_SAVER_DOWNLOADS.save(true);
        android(RESTRICT_BACKGROUND_STATUS_ENABLED, TYPE_MOBILE);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertFalse(reason.name(), DataSaverDownloads.hold());
            assertFalse(reason.name(), DataSaverDownloads.holdMask(controller));
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> {
            assertFalse(DataSaverDownloads.hold());
            assertFalse(DataSaverDownloads.holdMask(controller));
        });
        SettingReadsForTests.breakReads(Settings.DATA_SAVER_DOWNLOADS);
        assertFalse(DataSaverDownloads.hold());
        assertFalse(HookStatus.missing(FamilyNames.FASTER_DOWNLOADS).isEmpty());
    }

    @Test public void whatAndroidWontSayHoldsNothing() {
        DataSaverDownloads.Status none = DataSaverDownloads.status(null);
        assertEquals(DataSaverDownloads.DataSaver.UNKNOWN, none.dataSaver);
        assertNull(none.metered);
        assertFalse(none.restricts());

        Context noService = new ContextWrapper(RuntimeEnvironment.getApplication()) {
            @Override public Object getSystemService(String name) {
                return null;
            }
        };
        assertEquals(DataSaverDownloads.DataSaver.UNKNOWN, DataSaverDownloads.status(noService).dataSaver);
        assertNull(DataSaverDownloads.status(noService).metered);

        Context broken = new ContextWrapper(RuntimeEnvironment.getApplication()) {
            @Override public Object getSystemService(String name) {
                throw new SecurityException("no network access");
            }
        };
        assertEquals(DataSaverDownloads.DataSaver.UNKNOWN, DataSaverDownloads.status(broken).dataSaver);
        assertFalse(DataSaverDownloads.status(broken).restricts());
    }
}
