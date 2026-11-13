/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.extension.hushthreads.comments;

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

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import app.morphe.extension.hushthreads.profile.ProfileSuggestions;
import app.morphe.extension.hushthreads.search.SearchSuggestions;
import app.morphe.extension.hushthreads.settings.FamilyNames;
import app.morphe.extension.hushthreads.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushThreadsPause;
import app.morphe.extension.shared.settings.PauseForTests;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class SuggestedThreadsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** Cleared first as well, so a test that stopped half way, or another class, leaves nothing behind. */
    @Before public void startClean() {
        restore();
    }

    @After public void restore() {
        ThrowingSettingsRead.fail = false;
        PauseForTests.resume();
        Settings.HIDE_SUGGESTED_THREADS.resetToDefault();
        Settings.HIDE_SEARCH_SUGGESTIONS.resetToDefault();
        Settings.HIDE_SUGGESTED_USERS.resetToDefault();
        HookStatus.clear();
    }

    /** Two cards Threads read off a page, in the shape the parse walks: a list it iterates. */
    private static List<Object> page() {
        return new ArrayList<>(Arrays.asList("first related thread", "second related thread"));
    }

    /** The switch starts on like the rest of Hide suggested users, so a default build keeps the cards out. */
    @Test public void theSwitchStartsOnAndKeepsTheCardsOut() {
        assertTrue("the switch starts off", Settings.HIDE_SUGGESTED_THREADS.defaultValue);
        assertEquals(Collections.emptyList(), SuggestedThreads.relatedThreads(page()));
        assertEquals(Collections.emptyList(), SuggestedThreads.relatedThreads(page()));
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains(FamilyNames.HIDE_SUGGESTED_USERS + ": invoked 2"));
        assertTrue(report, report.contains(SuggestedThreads.HIDDEN + " 2"));
        assertEquals(Collections.emptyList(), HookStatus.missing(FamilyNames.HIDE_SUGGESTED_USERS));
    }

    /** Off, Threads keeps the very list it read, and the report says why. */
    @Test public void offHandsBackThreadsOwnList() {
        Settings.HIDE_SUGGESTED_THREADS.save(false);
        List<Object> threads = page();
        assertSame(threads, SuggestedThreads.relatedThreads(threads));
        assertEquals(2, threads.size());
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains(SuggestedThreads.LEFT_TO_THREADS + "switch off 1"));
        assertFalse(report, report.contains(SuggestedThreads.HIDDEN));
    }

    /** A page without suggested threads, or with none read, goes back as it came and counts nothing. */
    @Test public void aPageWithoutCardsIsLeftAlone() {
        List<Object> none = new ArrayList<>();
        assertSame(none, SuggestedThreads.relatedThreads(none));
        assertNull(SuggestedThreads.relatedThreads(null));
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains(FamilyNames.HIDE_SUGGESTED_USERS + ": invoked 2"));
        assertFalse(report, report.contains(SuggestedThreads.HIDDEN));
        assertFalse(report, report.contains(SuggestedThreads.LEFT_TO_THREADS));
    }

    /** Threads' own list is never emptied in place: the parse may hold it elsewhere. */
    @Test public void threadsOwnListIsNeverChanged() {
        List<Object> threads = page();
        assertEquals(Collections.emptyList(), SuggestedThreads.relatedThreads(threads));
        assertEquals(page(), threads);
    }

    /**
     * The three switches of Hide suggested users answer apart: an opened post follows its own,
     * whatever the feed and profile switch or Search's says, and neither of those follows it.
     */
    @Test public void eachSwitchWorksWithoutTheOthers() {
        Settings.HIDE_SUGGESTED_USERS.save(false);
        Settings.HIDE_SEARCH_SUGGESTIONS.save(false);
        assertEquals(Collections.emptyList(), SuggestedThreads.relatedThreads(page()));
        assertTrue(ProfileSuggestions.showRow());
        assertTrue(SearchSuggestions.showCarousel());
        Settings.HIDE_SUGGESTED_USERS.save(true);
        Settings.HIDE_SEARCH_SUGGESTIONS.save(true);
        Settings.HIDE_SUGGESTED_THREADS.save(false);
        assertEquals(2, SuggestedThreads.relatedThreads(page()).size());
        assertFalse(ProfileSuggestions.showRow());
        assertFalse(SearchSuggestions.showCarousel());
    }

    /** Paused or in safe mode, the saved switch stays on and Threads keeps its cards. */
    @Test public void pauseAndSafeModeLeaveTheCardsToThreads() {
        PauseForTests.pause(HushThreadsPause.Reason.SWITCH);
        List<Object> threads = page();
        assertSame(threads, SuggestedThreads.relatedThreads(threads));
        assertTrue(Settings.HIDE_SUGGESTED_THREADS.savedValue());
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains(SuggestedThreads.LEFT_TO_THREADS + "HushThreads paused 1"));
        PauseForTests.resume();

        // Safe mode is the pause a crash loop starts.
        PauseForTests.pause(HushThreadsPause.Reason.CRASH_LOOP);
        assertSame(threads, SuggestedThreads.relatedThreads(threads));
        assertTrue(Settings.HIDE_SUGGESTED_THREADS.savedValue());
    }

    /** A failure inside the hook hands Threads its list back, and the report names the hook. */
    @Test @Config(shadows = ThrowingSettingsRead.class, instrumentedPackages = "app.morphe.extension.shared")
    public void aFailureInTheHookLeavesTheCards() {
        List<Object> threads = page();
        try {
            ThrowingSettingsRead.fail = true;
            assertSame(threads, SuggestedThreads.relatedThreads(threads));
        } finally {
            ThrowingSettingsRead.fail = false;
        }
        assertEquals(Collections.singletonList("a working 'suggested threads' hook (it threw "
                        + IllegalStateException.class.getName() + ")"),
                HookStatus.missing(FamilyNames.HIDE_SUGGESTED_USERS));
    }

    /** Threads asks again for each page of replies, so a change needs no restart. */
    @Test public void aChangeNeedsNoRestart() {
        assertFalse(Settings.HIDE_SUGGESTED_THREADS.rebootApp);
        Settings.HIDE_SUGGESTED_THREADS.save(false);
        assertEquals(2, SuggestedThreads.relatedThreads(page()).size());
        Settings.HIDE_SUGGESTED_THREADS.save(true);
        assertEquals(Collections.emptyList(), SuggestedThreads.relatedThreads(page()));
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
