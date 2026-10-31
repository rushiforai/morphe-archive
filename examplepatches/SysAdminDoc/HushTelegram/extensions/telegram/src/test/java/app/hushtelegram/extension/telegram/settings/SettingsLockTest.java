/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowToast;

import java.util.Locale;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.settings.FailingStore;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.telegram.settings.SettingsLock.State;
import app.hushtelegram.extension.telegram.settings.SettingsLock.Stored;

/** The settings lock's states, on clocks the test moves by hand. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class SettingsLockTest {
    private static final long START = 1_800_000_000_000L;
    private static final long UP_START = 5_000_000L;
    private static final long HOUR = 60 * 60 * 1000L;
    private static final long MINUTE = 60 * 1000L;
    private static final String LOCKED_NOTE = "Settings are locked. Tap Start unlock, then wait 24 hours.";
    private static final String LOCKED_TOAST = "Settings locked. Changed your mind? Tap again within 10 min.";

    @Rule public final SettingsContextRule settings = new SettingsContextRule();

    private final long[] now = {START};
    /** The time since the phone started, which the wall clock's changes leave alone. */
    private final long[] up = {UP_START};

    @Before public void handClocks() {
        forget();
        SettingsLock.clock = () -> now[0];
        SettingsLock.uptime = () -> up[0];
        ShadowToast.reset();
    }

    @After public void realClocks() {
        SettingsLockForTests.forget();
        PauseForTests.resume();
    }

    private static void forget() {
        Stored.LOCKED.resetToDefault();
        Stored.UNLOCK_STARTED.resetToDefault();
        Stored.LOCKED_AT.resetToDefault();
        Stored.LOCKED_AT_UPTIME.resetToDefault();
    }

    /** Both clocks on by the same amount, as they go when nobody touches the clock. */
    private void pass(long millis) {
        now[0] += millis;
        up[0] += millis;
    }

    @Test public void offUntilLockedAndOffChangesNothing() {
        assertEquals(State.OFF, SettingsLock.state());
        assertFalse(SettingsLock.locked());
        assertEquals(0L, SettingsLock.remaining());
        assertFalse(SettingsLock.refuses());
        assertNull("an unlocked change said something", ShadowToast.getTextOfLatestToast());
        assertEquals("Lock HushTelegram settings", SettingsLock.title(State.OFF));
    }

    @Test public void lockedStaysLockedHoweverLongPassesUntilAnUnlockStarts() {
        assertTrue(SettingsLock.lock());
        assertEquals(State.JUST_LOCKED, SettingsLock.state());
        assertTrue(Stored.LOCKED.savedValue());
        assertEquals(0L, (long) Stored.UNLOCK_STARTED.savedValue());
        assertEquals(START, (long) Stored.LOCKED_AT.savedValue());
        assertEquals(UP_START, (long) Stored.LOCKED_AT_UPTIME.savedValue());
        pass(400 * SettingsLock.WAIT_MILLIS);
        assertEquals(State.LOCKED, SettingsLock.state());
        assertEquals("a closed window is forgotten", 0L, (long) Stored.LOCKED_AT.savedValue());
        assertEquals(0L, (long) Stored.LOCKED_AT_UPTIME.savedValue());
        assertEquals(0L, SettingsLock.remaining());
        assertTrue(SettingsLock.refuses());
        assertEquals(LOCKED_NOTE, ShadowToast.getTextOfLatestToast());
        // Locking again keeps it as it is.
        assertTrue(SettingsLock.lock());
        assertEquals(State.LOCKED, SettingsLock.state());
    }

    @Test public void anUnlockWaitsTwentyFourHoursByTheWallClock() {
        SettingsLock.lock();
        assertTrue(SettingsLock.startUnlock());
        assertEquals(START, (long) Stored.UNLOCK_STARTED.savedValue());
        assertEquals(State.UNLOCKING, SettingsLock.state());
        assertEquals(SettingsLock.WAIT_MILLIS, SettingsLock.remaining());
        assertEquals("Settings unlock in 24 h 0 min. Tap to cancel and keep them locked.", SettingsLock.summary(State.UNLOCKING));

        now[0] = START + 90_000L;
        assertEquals("Settings unlock in 23 h 59 min. Tap to cancel and keep them locked.", SettingsLock.summary(State.UNLOCKING));

        // A millisecond short, still locked, and the last of it reads as a minute.
        now[0] = START + SettingsLock.WAIT_MILLIS - 1;
        assertEquals(State.UNLOCKING, SettingsLock.state());
        assertEquals(1L, SettingsLock.remaining());
        assertTrue(SettingsLock.refuses());
        assertEquals("Settings are locked. They unlock in 0 h 1 min.", ShadowToast.getTextOfLatestToast());

        // On the hour, the lock is off and nothing of it is kept.
        now[0] = START + SettingsLock.WAIT_MILLIS;
        assertEquals(State.OFF, SettingsLock.state());
        assertFalse(Stored.LOCKED.savedValue());
        assertEquals(0L, (long) Stored.UNLOCK_STARTED.savedValue());
        ShadowToast.reset();
        assertFalse(SettingsLock.refuses());
        assertNull(ShadowToast.getTextOfLatestToast());
    }

    @Test public void startingAgainKeepsTheFirstStart() {
        SettingsLock.lock();
        SettingsLock.startUnlock();
        now[0] += 5 * HOUR;
        assertTrue(SettingsLock.startUnlock());
        assertEquals(START, (long) Stored.UNLOCK_STARTED.savedValue());
        assertEquals(SettingsLock.WAIT_MILLIS - 5 * HOUR, SettingsLock.remaining());
    }

    @Test public void cancelingKeepsTheLockAndForgetsTheWait() {
        SettingsLock.lock();
        SettingsLock.startUnlock();
        now[0] += 23 * HOUR;
        assertTrue(SettingsLock.cancelUnlock());
        assertEquals(State.LOCKED, SettingsLock.state());
        assertEquals(0L, (long) Stored.UNLOCK_STARTED.savedValue());
        now[0] += 10 * SettingsLock.WAIT_MILLIS;
        assertEquals(State.LOCKED, SettingsLock.state());
        // A second cancel finds it locked already.
        assertTrue(SettingsLock.cancelUnlock());
    }

    @Test public void aClockSetBackBeforeTheStartBeginsTheWaitAgain() {
        SettingsLock.lock();
        SettingsLock.startUnlock();
        now[0] = START + 20 * HOUR;
        assertEquals(4 * HOUR, SettingsLock.remaining());

        // Set back an hour before the start: the whole wait again, from now.
        now[0] = START - HOUR;
        assertEquals(State.UNLOCKING, SettingsLock.state());
        assertEquals(START - HOUR, (long) Stored.UNLOCK_STARTED.savedValue());
        assertEquals(SettingsLock.WAIT_MILLIS, SettingsLock.remaining());

        // Set forward again to where it was, the new start counts.
        now[0] = START + 20 * HOUR;
        assertEquals(State.UNLOCKING, SettingsLock.state());
        assertEquals(3 * HOUR, SettingsLock.remaining());
        now[0] = START - HOUR + SettingsLock.WAIT_MILLIS;
        assertEquals(State.OFF, SettingsLock.state());
    }

    @Test public void aClockAtNineteenSeventyStillStartsAWait() {
        now[0] = 0L;
        SettingsLock.lock();
        assertTrue(SettingsLock.startUnlock());
        assertEquals(1L, (long) Stored.UNLOCK_STARTED.savedValue());
        assertEquals(State.UNLOCKING, SettingsLock.state());
    }

    /** Locked, a switch goes through only to resume, or for Debug logging, which only changes a report. */
    @Test public void onlyResumeAndDebugLoggingGoThroughALock() {
        assertTrue(SettingsLock.exempts(app.hushtelegram.extension.shared.settings.BaseSettings.DEBUG.key, true));
        assertTrue(SettingsLock.exempts(app.hushtelegram.extension.shared.settings.BaseSettings.DEBUG.key, false));
        assertTrue(SettingsLock.exempts(app.hushtelegram.extension.shared.settings.BaseSettings.PAUSED.key, false));
        assertFalse(SettingsLock.exempts(app.hushtelegram.extension.shared.settings.BaseSettings.PAUSED.key, true));
        assertFalse(SettingsLock.exempts(Settings.HIDE_ADS.key, false));
        assertFalse(SettingsLock.exempts(Settings.SEARCH_ONLY_MY_CHATS.key, false));
        // The parental block is what a lock is for: it can't be turned off, or on, while locked.
        assertFalse(SettingsLock.exempts(Settings.BLOCK_NEW_CHATS.key, false));
        assertFalse(SettingsLock.exempts(Settings.BLOCK_NEW_CHATS.key, true));
        assertFalse(SettingsLock.exempts(null, false));
    }

    @Test public void unlockedThereIsNothingToStartOrCancel() {
        assertFalse(SettingsLock.startUnlock());
        assertFalse(SettingsLock.cancelUnlock());
        assertEquals(State.OFF, SettingsLock.state());
        assertFalse(Stored.LOCKED.savedValue());
    }

    @Test public void aStartLeftWithoutTheFlagIsClearedAndMeansNothing() {
        Stored.UNLOCK_STARTED.save(START);
        assertEquals(State.OFF, SettingsLock.state());
        assertEquals(0L, (long) Stored.UNLOCK_STARTED.savedValue());
    }

    @Test public void theRowStepsThroughLockStartAndCancelAndSaysWhich() {
        assertEquals("Makes every setting here read-only. A tap within 10 min unlocks them again. After that, unlocking takes 24 hours.",
                SettingsLock.summary(State.OFF));
        assertEquals(LOCKED_TOAST, SettingsLock.advance());
        assertEquals(State.JUST_LOCKED, SettingsLock.state());
        assertEquals("Unlock now", SettingsLock.title(State.JUST_LOCKED));
        pass(SettingsLock.QUICK_UNLOCK_MILLIS);
        assertEquals(State.LOCKED, SettingsLock.state());
        assertEquals("Start unlock", SettingsLock.title(State.LOCKED));
        assertEquals("Your settings are locked. Tap to start the 24-hour wait. You can cancel it while it runs.",
                SettingsLock.summary(State.LOCKED));

        assertEquals("Unlock started. Settings open in 24 hours unless you cancel.", SettingsLock.advance());
        assertEquals(State.UNLOCKING, SettingsLock.state());
        assertEquals("Cancel unlock", SettingsLock.title(State.UNLOCKING));

        assertEquals("Unlock canceled. Settings stay locked.", SettingsLock.advance());
        assertEquals(State.LOCKED, SettingsLock.state());
    }

    /** A wait that ran out just before a tap on Cancel unlock locks again, which is what the tap was for. */
    @Test public void aCancelAfterTheWaitRanOutLocksAgain() {
        SettingsLock.lock();
        SettingsLock.startUnlock();
        now[0] += SettingsLock.WAIT_MILLIS;
        assertEquals(LOCKED_TOAST, SettingsLock.advance());
        assertEquals(State.JUST_LOCKED, SettingsLock.state());
    }

    /** A lock tapped in a hurry (#23) comes off with the next tap, as long as it comes within ten minutes. */
    @Test public void aTapWithinTenMinutesUnlocksAtOnce() {
        assertEquals(LOCKED_TOAST, SettingsLock.advance());
        pass(4 * MINUTE);
        assertEquals(State.JUST_LOCKED, SettingsLock.state());
        assertTrue(SettingsLock.locked());
        assertEquals("Locked just now. Tap within 6 min to unlock right away. After that, unlocking takes 24 hours.",
                SettingsLock.summary(State.JUST_LOCKED));
        assertTrue("the window still turns changes down", SettingsLock.refuses());
        assertEquals("Settings are locked. Tap Unlock now within 6 min.", ShadowToast.getTextOfLatestToast());
        assertEquals(0L, SettingsLock.remaining());

        assertEquals("Settings unlocked. They change as usual again.", SettingsLock.advance());
        assertEquals(State.OFF, SettingsLock.state());
        assertFalse(Stored.LOCKED.savedValue());
        assertEquals(0L, (long) Stored.LOCKED_AT.savedValue());
        assertEquals(0L, (long) Stored.LOCKED_AT_UPTIME.savedValue());
        // Unlocked, there's nothing left for a second Unlock now to do.
        assertTrue(SettingsLock.unlockNow());
    }

    /** The window closes after ten minutes on either clock, whichever gets there first. */
    @Test public void theWindowClosesAfterTenMinutesByEitherClock() {
        SettingsLock.lock();
        pass(SettingsLock.QUICK_UNLOCK_MILLIS - 1);
        assertEquals(State.JUST_LOCKED, SettingsLock.state());
        assertEquals("the last of it reads as a minute",
                "Settings are locked. Tap Unlock now within 1 min.", SettingsLock.note(State.JUST_LOCKED));
        pass(1);
        assertEquals(State.LOCKED, SettingsLock.state());
        assertFalse(SettingsLock.unlockNow());

        // The wall clock set ten minutes on, a minute after locking.
        forget();
        SettingsLock.lock();
        now[0] += SettingsLock.QUICK_UNLOCK_MILLIS;
        up[0] += MINUTE;
        assertEquals(State.LOCKED, SettingsLock.state());

        // Ten minutes since the phone started counting, with the wall clock held back.
        forget();
        SettingsLock.lock();
        now[0] += MINUTE;
        up[0] += SettingsLock.QUICK_UNLOCK_MILLIS;
        assertEquals(State.LOCKED, SettingsLock.state());
        assertEquals("Start unlock", SettingsLock.title(SettingsLock.state()));
    }

    /** A clock set back, or a restart, closes the window, and putting the clock right doesn't open it again. */
    @Test public void aClockSetBackOrARestartClosesTheWindowForGood() {
        SettingsLock.lock();
        now[0] = START - MINUTE;
        assertEquals(State.LOCKED, SettingsLock.state());
        now[0] = START + MINUTE;
        assertEquals(State.LOCKED, SettingsLock.state());

        forget();
        now[0] = START;
        up[0] = UP_START;
        SettingsLock.lock();
        // A restart starts the count again from about zero.
        up[0] = 30_000L;
        now[0] += MINUTE;
        assertEquals(State.LOCKED, SettingsLock.state());
        up[0] = UP_START + MINUTE;
        assertEquals(State.LOCKED, SettingsLock.state());
    }

    /** Start unlock inside the window closes it, so a cancel later lands on a plain lock. */
    @Test public void startingTheWaitInsideTheWindowClosesIt() {
        SettingsLock.lock();
        pass(MINUTE);
        assertTrue(SettingsLock.startUnlock());
        assertEquals(State.UNLOCKING, SettingsLock.state());
        assertEquals(0L, (long) Stored.LOCKED_AT.savedValue());
        assertTrue(SettingsLock.cancelUnlock());
        assertEquals(State.LOCKED, SettingsLock.state());
    }

    /** Inside the window, a cancel finds nothing under way and leaves the window open. */
    @Test public void aCancelInsideTheWindowChangesNothing() {
        SettingsLock.lock();
        assertTrue(SettingsLock.cancelUnlock());
        assertEquals(State.JUST_LOCKED, SettingsLock.state());
    }

    @Test public void anUnlockNowTheStoreCanNotKeepStaysLockedAndSaysSo() {
        SettingsLock.lock();
        try (FailingStore ignored = FailingStore.install(FailingStore.Fault.COMMIT_THROWS)) {
            assertEquals("Couldn't change the lock. Try again in a moment.", SettingsLock.advance());
        }
        assertEquals(State.JUST_LOCKED, SettingsLock.state());
        assertTrue(Stored.LOCKED.savedValue());
    }

    @Test public void aLockTheStoreCanNotKeepStaysOffAndSaysSo() {
        try (FailingStore ignored = FailingStore.install(FailingStore.Fault.COMMIT_THROWS, FailingStore.Fault.COMMIT_THROWS)) {
            assertEquals("Couldn't change the lock. Try again in a moment.", SettingsLock.advance());
        }
        assertEquals(State.OFF, SettingsLock.state());
        assertFalse(Stored.LOCKED.savedValue());
    }

    @Test public void pausingLeavesTheLockAlone() {
        SettingsLock.lock();
        SettingsLock.startUnlock();
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertTrue(reason.name(), Stored.LOCKED.isKeptWhenPaused());
            assertTrue(reason.name(), Stored.UNLOCK_STARTED.isKeptWhenPaused());
            assertTrue(reason.name(), Stored.LOCKED_AT.isKeptWhenPaused());
            assertTrue(reason.name(), Stored.LOCKED_AT_UPTIME.isKeptWhenPaused());
            assertEquals(reason.name(), State.UNLOCKING, SettingsLock.state());
            assertTrue(reason.name(), Stored.LOCKED.get());
            PauseForTests.resume();
        }
    }

    @Test public void theLockStaysOutOfSettingsFiles() throws Exception {
        SettingsLock.lock();
        for (app.hushtelegram.extension.shared.settings.Setting<?> stored : java.util.Arrays.asList(
                Stored.LOCKED, Stored.UNLOCK_STARTED, Stored.LOCKED_AT, Stored.LOCKED_AT_UPTIME)) {
            assertFalse(stored.key, stored.includeWithImportExport);
            assertFalse(stored.key, SettingsBackup.ALLOWLIST.contains(stored));
        }
        assertEquals(State.JUST_LOCKED, SettingsLock.state());
        String file = SettingsBackup.create();
        SettingsLock.startUnlock();
        file += SettingsBackup.create();
        for (String key : new String[] {Stored.LOCKED.key, Stored.UNLOCK_STARTED.key, Stored.LOCKED_AT.key,
                Stored.LOCKED_AT_UPTIME.key}) {
            assertFalse(file, file.contains(key));
        }
    }

    /** Nothing the lock says promises it can't be taken off: it always can, after the wait. */
    @Test public void noLinePromisesTheLockIsForever() {
        SettingsLock.lock();
        SettingsLock.startUnlock();
        StringBuilder all = new StringBuilder();
        for (State state : State.values()) {
            all.append(SettingsLock.title(state)).append('\n').append(SettingsLock.summary(state)).append('\n')
                    .append(SettingsLock.note(state)).append('\n');
        }
        // And what each tap on the row says: off, an unlock at once, and then past the window
        // through a canceled unlock.
        forget();
        for (int tap = 0; tap < 2; tap++) all.append(SettingsLock.advance()).append('\n');
        all.append(SettingsLock.advance()).append('\n');
        pass(SettingsLock.QUICK_UNLOCK_MILLIS);
        for (int tap = 0; tap < 2; tap++) all.append(SettingsLock.advance()).append('\n');
        String text = all.toString().toLowerCase(Locale.ROOT);
        for (String promise : new String[] {"undone", "undo", "forever", "permanent", "can't", "cannot", "never", "irreversible"}) {
            assertFalse(promise + " in:\n" + text, text.contains(promise));
        }
    }
}
