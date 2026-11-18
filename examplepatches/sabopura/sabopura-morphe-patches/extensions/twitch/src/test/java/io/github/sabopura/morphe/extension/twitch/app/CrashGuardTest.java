package io.github.sabopura.morphe.extension.twitch.app;

import static android.app.ApplicationExitInfo.*;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.lang.reflect.Field;

import io.github.sabopura.morphe.extension.twitch.ui.Features;

public class CrashGuardTest {
    @Test
    public void crashesPauseAfterThree() {
        assertFalse(CrashGuard.shouldPause(2));
        assertTrue(CrashGuard.shouldPause(3));
    }

    @Test
    public void onlyEarlyCrashesCount() {
        long started = 1_000_000L;
        assertTrue(CrashGuard.withinWindow(started + 59_000, started));
        assertFalse(CrashGuard.withinWindow(started + 60_000, started));
        assertFalse(CrashGuard.withinWindow(started - 1, started));
    }

    @Test
    public void aRunEndedWithoutACrashBreaksTheStreak() {
        assertEquals(0, CrashGuard.crashesAfter(2, false, REASON_USER_REQUESTED, true));
        assertEquals(0, CrashGuard.crashesAfter(2, false, REASON_LOW_MEMORY, true));
        assertEquals(0, CrashGuard.crashesAfter(2, false, REASON_PACKAGE_UPDATED, false));
    }

    @Test
    public void nativeCrashesAndAnrsCountWithinTheWindow() {
        assertEquals(3, CrashGuard.crashesAfter(2, false, REASON_CRASH_NATIVE, true));
        assertEquals(3, CrashGuard.crashesAfter(2, false, REASON_ANR, true));
        assertEquals(2, CrashGuard.crashesAfter(2, false, REASON_CRASH_NATIVE, false));
    }

    @Test
    public void anEndThatMayHideACrashKeepsTheCount() {
        for (int reason : new int[] {REASON_UNKNOWN, REASON_CRASH, REASON_SIGNALED, REASON_EXIT_SELF,
                REASON_INITIALIZATION_FAILURE, 99})
            assertEquals(2, CrashGuard.crashesAfter(2, false, reason, true));
    }

    @Test
    public void aCrashTheHandlerCountedIsNeitherCountedAgainNorUndone() {
        assertEquals(2, CrashGuard.crashesAfter(2, true, REASON_CRASH, true));
        assertEquals(2, CrashGuard.crashesAfter(2, true, REASON_SIGNALED, true));
        assertEquals(2, CrashGuard.crashesAfter(2, true, REASON_USER_REQUESTED, true));
    }

    @Test
    public void threeEarlyCrashesInARowStillPause() {
        // A Java crash (counted by the handler), a native crash, then another Java crash.
        int crashes = CrashGuard.crashesAfter(1, true, REASON_CRASH, true);
        crashes = CrashGuard.crashesAfter(crashes, false, REASON_CRASH_NATIVE, true);
        crashes = CrashGuard.crashesAfter(crashes + 1, true, REASON_CRASH, true);
        assertTrue(CrashGuard.shouldPause(crashes));
    }

}
