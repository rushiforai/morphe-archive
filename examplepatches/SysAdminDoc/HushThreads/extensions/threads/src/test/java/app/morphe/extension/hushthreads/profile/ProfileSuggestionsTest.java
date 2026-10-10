/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.extension.hushthreads.profile;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import app.morphe.extension.hushthreads.settings.FamilyNames;
import app.morphe.extension.hushthreads.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushThreadsPause;
import app.morphe.extension.shared.settings.PauseForTests;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ProfileSuggestionsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** The accounts a profile's carousel would draw. The hook never looks inside. */
    private final List<String> users = Arrays.asList("an account", "another account");

    /** Cleared first as well, so a test that stopped half way, or another class, leaves nothing behind. */
    @Before public void startClean() {
        restore();
    }

    @After public void restore() {
        ThrowingSettingsRead.fail = false;
        PauseForTests.resume();
        Settings.HIDE_SUGGESTED_USERS.resetToDefault();
        HookStatus.clear();
    }

    /** The switch starts on, so a default build keeps both the carousel and the row off profiles. */
    @Test public void theSwitchStartsOnAndHidesTheCarouselAndTheRow() {
        assertTrue("the switch starts off", Settings.HIDE_SUGGESTED_USERS.defaultValue);
        assertNull(ProfileSuggestions.carousel(users));
        assertNull(ProfileSuggestions.carousel(users));
        assertFalse(ProfileSuggestions.showRow());
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains(FamilyNames.HIDE_SUGGESTED_USERS + ": invoked 3"));
        assertTrue(report, report.contains(ProfileSuggestions.HIDDEN_CAROUSEL + " 2"));
        assertTrue(report, report.contains(ProfileSuggestions.HIDDEN_ROW + " 1"));
        assertEquals(Collections.emptyList(), HookStatus.missing(FamilyNames.HIDE_SUGGESTED_USERS));
    }

    /** A profile Threads draws without a carousel stays without one, and isn't counted as hidden. */
    @Test public void noCarouselStaysNoCarousel() {
        assertNull(ProfileSuggestions.carousel(null));
        Settings.HIDE_SUGGESTED_USERS.save(false);
        assertNull(ProfileSuggestions.carousel(null));
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains(ProfileSuggestions.NO_CAROUSEL + " 2"));
        assertFalse(report, report.contains(ProfileSuggestions.HIDDEN_CAROUSEL));
    }

    /** Off, Threads keeps its carousel, the very list it read, and its row. */
    @Test public void offLeavesBothToThreads() {
        Settings.HIDE_SUGGESTED_USERS.save(false);
        assertSame(users, ProfileSuggestions.carousel(users));
        assertTrue(ProfileSuggestions.showRow());
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains(ProfileSuggestions.LEFT_TO_THREADS + "switch off 2"));
        assertFalse(report, report.contains(ProfileSuggestions.HIDDEN_CAROUSEL));
        assertFalse(report, report.contains(ProfileSuggestions.HIDDEN_ROW));
    }

    /** Paused or in safe mode, the saved switch stays on and Threads' suggestions come back. */
    @Test public void pauseAndSafeModeLeaveBothToThreads() {
        PauseForTests.pause(HushThreadsPause.Reason.SWITCH);
        assertSame(users, ProfileSuggestions.carousel(users));
        assertTrue(ProfileSuggestions.showRow());
        assertTrue(Settings.HIDE_SUGGESTED_USERS.savedValue());
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains(ProfileSuggestions.LEFT_TO_THREADS + "HushThreads paused 2"));
        PauseForTests.resume();

        // Safe mode is the pause a crash loop starts.
        PauseForTests.pause(HushThreadsPause.Reason.CRASH_LOOP);
        assertSame(users, ProfileSuggestions.carousel(users));
        assertTrue(ProfileSuggestions.showRow());
        assertTrue(Settings.HIDE_SUGGESTED_USERS.savedValue());
    }

    /** A failure inside the carousel hook hands Threads its own list, and the report names the hook. */
    @Test @Config(shadows = ThrowingSettingsRead.class, instrumentedPackages = "app.morphe.extension.shared")
    public void aFailureInTheCarouselHookLeavesTheCarousel() {
        try {
            ThrowingSettingsRead.fail = true;
            assertSame(users, ProfileSuggestions.carousel(users));
        } finally {
            ThrowingSettingsRead.fail = false;
        }
        assertEquals(Collections.singletonList("a working 'profile carousel' hook (it threw "
                        + IllegalStateException.class.getName() + ")"),
                HookStatus.missing(FamilyNames.HIDE_SUGGESTED_USERS));
    }

    /** A failure inside the row hook lets Threads add its row, and the report names the hook. */
    @Test @Config(shadows = ThrowingSettingsRead.class, instrumentedPackages = "app.morphe.extension.shared")
    public void aFailureInTheRowHookLeavesTheRow() {
        try {
            ThrowingSettingsRead.fail = true;
            assertTrue(ProfileSuggestions.showRow());
        } finally {
            ThrowingSettingsRead.fail = false;
        }
        assertEquals(Collections.singletonList("a working 'profile row' hook (it threw "
                        + IllegalStateException.class.getName() + ")"),
                HookStatus.missing(FamilyNames.HIDE_SUGGESTED_USERS));
    }

    /**
     * Threads asks again each time it draws a profile, so a change needs no restart. A profile
     * already on screen keeps what it drew until Threads draws it again.
     */
    @Test public void aChangeNeedsNoRestart() {
        assertFalse(Settings.HIDE_SUGGESTED_USERS.rebootApp);
        Settings.HIDE_SUGGESTED_USERS.save(false);
        assertTrue(ProfileSuggestions.showRow());
        Settings.HIDE_SUGGESTED_USERS.save(true);
        assertFalse(ProfileSuggestions.showRow());
    }

    @Implements(Utils.class)
    public static class ThrowingSettingsRead {
        static boolean fail;

        @Implementation
        protected static boolean settingsReady() {
            if (fail) throw new IllegalStateException("settings unavailable");
            return true;
        }
    }
}
