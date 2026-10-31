/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import android.content.Context;
import android.content.SharedPreferences;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.function.LongSupplier;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class LocalEmojiStatusTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final long ME = 777L;
    private static final Object USER = new Object();
    private static final Object CONTROLLER = new Object();

    private final Telegram telegram = new Telegram();
    private Function<Context, SharedPreferences> stockStore;
    private LocalEmojiStatus.Telegram stockTelegram;
    private LongSupplier stockClock;
    private long now = 1_000_000L;

    @Before public void reset() {
        stockStore = LocalEmojiStatus.store;
        stockTelegram = LocalEmojiStatus.telegram;
        stockClock = LocalEmojiStatus.clock;
        LocalEmojiStatus.telegram = telegram;
        LocalEmojiStatus.clock = () -> now;
        prefs().edit().clear().commit();
        restore();
    }

    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.LOCAL_EMOJI_STATUS);
        Settings.LOCAL_EMOJI_STATUS.resetToDefault();
        HookStatus.clear();
    }

    @After public void putTelegramBack() {
        LocalEmojiStatus.store = stockStore;
        LocalEmojiStatus.telegram = stockTelegram;
        LocalEmojiStatus.clock = stockClock;
    }

    @Test public void startsOffSoTelegramSendsTheStatusAndTheTitleDrawsItsOwn() {
        assertFalse(Settings.LOCAL_EMOJI_STATUS.get());
        assertFalse(LocalEmojiStatus.keep(CONTROLLER, status(42L, 0)));
        assertEquals(Long.valueOf(5L), LocalEmojiStatus.documentId(5L, USER));
        assertNull(LocalEmojiStatus.documentId(null, USER));
        assertFalse(LocalEmojiStatus.premium(0));
        assertTrue(LocalEmojiStatus.premium(1));
        assertTrue(telegram.refreshed.isEmpty());
        assertTrue(prefs().getAll().isEmpty());
        assertTrue(String.join("\n", HookStatus.report()).contains(FamilyNames.HIDE_COMMERCE));
        assertFalse(String.join("\n", HookStatus.report()).contains(LocalEmojiStatus.KEPT));
    }

    @Test public void turnedOnThePickStaysOnThisPhoneAndTheTitleDrawsIt() {
        Settings.LOCAL_EMOJI_STATUS.save(true);
        assertTrue(LocalEmojiStatus.premium(0));
        assertTrue("Telegram skips the send", LocalEmojiStatus.keep(CONTROLLER, status(42L, 0)));
        assertEquals(1, telegram.refreshed.size());
        assertEquals(Long.valueOf(42L), LocalEmojiStatus.documentId(null, USER));
        assertEquals(Long.valueOf(42L), LocalEmojiStatus.documentId(5L, USER));
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains(LocalEmojiStatus.KEPT));
        assertTrue(report, report.contains(LocalEmojiStatus.SHOWN));
    }

    @Test public void anEmptyStatusClearsThePickAndTheTitleGoesBackToTelegrams() {
        Settings.LOCAL_EMOJI_STATUS.save(true);
        LocalEmojiStatus.keep(CONTROLLER, status(42L, 0));
        assertTrue(LocalEmojiStatus.keep(CONTROLLER, status(0L, 0)));
        assertEquals(2, telegram.refreshed.size());
        assertNull(LocalEmojiStatus.documentId(null, USER));
        assertTrue(prefs().getAll().isEmpty());
    }

    @Test public void aGiftStatusStillGoesToTelegram() {
        Settings.LOCAL_EMOJI_STATUS.save(true);
        assertFalse(LocalEmojiStatus.keep(CONTROLLER, status(-1L, 0)));
        assertTrue(telegram.refreshed.isEmpty());
        assertTrue(prefs().getAll().isEmpty());
    }

    @Test public void aTimedPickRunsOut() {
        Settings.LOCAL_EMOJI_STATUS.save(true);
        LocalEmojiStatus.keep(CONTROLLER, status(42L, (int) now + 3600));
        assertEquals(Long.valueOf(42L), LocalEmojiStatus.documentId(null, USER));
        now += 3600;
        assertNull(LocalEmojiStatus.documentId(null, USER));
    }

    @Test public void eachAccountKeepsItsOwnPick() {
        Settings.LOCAL_EMOJI_STATUS.save(true);
        LocalEmojiStatus.keep(CONTROLLER, status(42L, 0));
        Object other = new Object();
        telegram.users.put(other, 888L);
        assertEquals(Long.valueOf(9L), LocalEmojiStatus.documentId(9L, other));
        telegram.users.put(other, 0L);
        assertEquals(Long.valueOf(9L), LocalEmojiStatus.documentId(9L, other));
    }

    @Test public void turningItOffLeavesThePickButDrawsAndSendsLikeTelegram() {
        Settings.LOCAL_EMOJI_STATUS.save(true);
        LocalEmojiStatus.keep(CONTROLLER, status(42L, 0));
        Settings.LOCAL_EMOJI_STATUS.save(false);
        assertEquals(Long.valueOf(5L), LocalEmojiStatus.documentId(5L, USER));
        assertFalse(LocalEmojiStatus.premium(0));
        assertFalse(LocalEmojiStatus.keep(CONTROLLER, status(43L, 0)));
        assertEquals(42L, prefs().getLong(String.valueOf(ME), 0));
    }

    @Test public void pausingAnEarlyStartOrAnUnreadableSwitchKeepsTelegramsWay() {
        Settings.LOCAL_EMOJI_STATUS.save(true);
        LocalEmojiStatus.keep(CONTROLLER, status(42L, 0));
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertEquals(reason.name(), Long.valueOf(5L), LocalEmojiStatus.documentId(5L, USER));
            assertFalse(reason.name(), LocalEmojiStatus.premium(0));
            assertFalse(reason.name(), LocalEmojiStatus.keep(CONTROLLER, status(43L, 0)));
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> {
            assertEquals(Long.valueOf(5L), LocalEmojiStatus.documentId(5L, USER));
            assertFalse(LocalEmojiStatus.keep(CONTROLLER, status(43L, 0)));
        });
        SettingReadsForTests.breakReads(Settings.LOCAL_EMOJI_STATUS);
        assertEquals(Long.valueOf(5L), LocalEmojiStatus.documentId(5L, USER));
        assertFalse(LocalEmojiStatus.premium(0));
        assertFalse(HookStatus.missing(FamilyNames.HIDE_COMMERCE).isEmpty());
        assertEquals(42L, prefs().getLong(String.valueOf(ME), 0));
    }

    @Test public void aFailingTelegramCallLeavesTheStatusToTelegram() {
        Settings.LOCAL_EMOJI_STATUS.save(true);
        telegram.broken = true;
        assertFalse(LocalEmojiStatus.keep(CONTROLLER, status(42L, 0)));
        assertEquals(Long.valueOf(5L), LocalEmojiStatus.documentId(5L, USER));
        assertTrue(String.join("\n", HookStatus.report()).contains("keep emoji status"));
    }

    @Test public void theStubsDoNothingUntilThePatchFillsThem() {
        assertEquals(0, LocalEmojiStatus.userId(USER));
        assertEquals(0, LocalEmojiStatus.controllerUser(CONTROLLER));
        assertEquals(-1, LocalEmojiStatus.statusDocument(new Object()));
        assertEquals(0, LocalEmojiStatus.statusUntil(new Object()));
        LocalEmojiStatus.refresh(CONTROLLER);
    }

    private static SharedPreferences prefs() {
        return LocalEmojiStatus.store.apply(Utils.getContext());
    }

    private static Object status(long document, int until) {
        return new long[] {document, until};
    }

    private static final class Telegram implements LocalEmojiStatus.Telegram {
        final Map<Object, Long> users = new HashMap<>();
        final List<Object> refreshed = new ArrayList<>();
        boolean broken;

        Telegram() { users.put(USER, ME); }

        @Override public long userId(Object user) { return users.getOrDefault(user, 0L); }
        @Override public long controllerUser(Object controller) {
            if (broken) throw new IllegalStateException("no UserConfig");
            return controller == CONTROLLER ? ME : 0;
        }
        @Override public long statusDocument(Object status) { return ((long[]) status)[0]; }
        @Override public int statusUntil(Object status) { return (int) ((long[]) status)[1]; }
        @Override public void refresh(Object controller) { refreshed.add(controller); }
    }
}
