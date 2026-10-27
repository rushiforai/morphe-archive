/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.reels;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.PatchFamily;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * Newest reels first: on, a Reels tab rerank puts the reels it has a posting time for in their own
 * slots newest first, keeps everything else where Facebook put it, and keeps Facebook's order for
 * reels posted in the same second. Off, paused, before the settings are ready, for a feed that isn't
 * one of the Reels feeds, or when reading a time fails, the order is Facebook's.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class NewestReelsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final String REELS_TAB = "fb_shorts_tab";

    /** Each stand-in edge's posting time, in seconds. */
    private final Map<Object, Long> postedAt = new HashMap<>();

    @Before
    public void times() {
        NewestReels.timeForTests = edge -> {
            Long seconds = postedAt.get(edge);
            return seconds == null ? 0 : seconds;
        };
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.NEWEST_REELS_FIRST.resetToDefault();
        NewestReels.forgetForTests();
        HookStatus.clear();
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.NEWEST_REELS_FIRST + ":")) return line;
        }
        return "";
    }

    /** A reel's signal as Facebook makes it, for the edge posted at [seconds], in [feed]. */
    private Object signal(String feed, long seconds) {
        Object edge = new Object();
        Object signal = new Object();
        postedAt.put(edge, seconds);
        if (NewestReels.records(feed)) NewestReels.posted(feed, edge, signal);
        return signal;
    }

    private static List<Object> ranked(Object... signals) {
        return new ArrayList<>(Arrays.asList(signals));
    }

    @Test
    public void theSwitchStartsOffAndOffKeepsFacebooksOrder() {
        assertFalse(Settings.NEWEST_REELS_FIRST.defaultValue);
        assertTrue(PatchFamily.NEWEST_REELS_FIRST.switches.contains(Settings.NEWEST_REELS_FIRST));
        Object older = signal(REELS_TAB, 100);
        Object newer = signal(REELS_TAB, 200);
        List<Object> list = ranked(older, newer);
        NewestReels.sort(list);
        assertEquals(Arrays.asList(older, newer), list);
        assertFalse(statusLine().contains(NewestReels.SORTED));
    }

    @Test
    public void onTheNewestReelComesFirst() {
        Settings.NEWEST_REELS_FIRST.save(true);
        Object oldest = signal(REELS_TAB, 100);
        Object newest = signal(REELS_TAB, 300);
        Object middle = signal(REELS_TAB, 200);
        List<Object> list = ranked(oldest, middle, newest);
        NewestReels.sort(list);
        assertEquals(Arrays.asList(newest, middle, oldest), list);
        String line = statusLine();
        assertTrue(line, line.contains(NewestReels.SORTED + " 1"));
        assertTrue(line, line.contains("0 missing"));
    }

    @Test
    public void itemsWithoutATimeKeepTheirSlots() {
        Settings.NEWEST_REELS_FIRST.save(true);
        Object older = signal(REELS_TAB, 100);
        Object untimed = new Object();
        Object newer = signal(REELS_TAB, 200);
        Object alsoUntimed = new Object();
        List<Object> list = ranked(untimed, older, alsoUntimed, newer);
        NewestReels.sort(list);
        assertEquals(Arrays.asList(untimed, newer, alsoUntimed, older), list);
    }

    @Test
    public void reelsPostedInTheSameSecondKeepFacebooksOrder() {
        Settings.NEWEST_REELS_FIRST.save(true);
        Object first = signal(REELS_TAB, 100);
        Object second = signal(REELS_TAB, 100);
        Object newest = signal(REELS_TAB, 150);
        Object third = signal(REELS_TAB, 100);
        List<Object> list = ranked(first, second, newest, third);
        NewestReels.sort(list);
        assertEquals(Arrays.asList(newest, first, second, third), list);
    }

    @Test
    public void anOrderAlreadyNewestFirstIsLeftAndNotCounted() {
        Settings.NEWEST_REELS_FIRST.save(true);
        Object newer = signal(REELS_TAB, 200);
        Object older = signal(REELS_TAB, 100);
        List<Object> list = ranked(newer, older);
        NewestReels.sort(list);
        assertEquals(Arrays.asList(newer, older), list);
        assertFalse(statusLine().contains(NewestReels.SORTED));
    }

    @Test
    public void otherFeedsAndUntimedReelsAreNotKept() {
        Settings.NEWEST_REELS_FIRST.save(true);
        Object home = signal("most_recent", 100);
        Object homeNewer = signal("most_recent", 200);
        Object noTime = signal(REELS_TAB, 0);
        Object reel = signal(REELS_TAB, 50);
        List<Object> list = ranked(home, noTime, homeNewer, reel);
        NewestReels.sort(list);
        assertEquals(Arrays.asList(home, noTime, homeNewer, reel), list);
    }

    @Test
    public void onlyTheReelsFeedsHaveTheirEdgeRead() {
        Settings.NEWEST_REELS_FIRST.save(true);
        assertTrue(NewestReels.records(REELS_TAB));
        assertTrue(NewestReels.records("fb_shorts_warion"));
        assertFalse(NewestReels.records("most_recent"));
        assertFalse(NewestReels.records("unknown"));
        assertFalse(NewestReels.records(null));
        Settings.NEWEST_REELS_FIRST.save(false);
        assertFalse(NewestReels.records(REELS_TAB));
    }

    @Test
    public void otherReelsFeedsCount() {
        Settings.NEWEST_REELS_FIRST.save(true);
        Object older = signal("fb_shorts_viewer", 100);
        Object newer = signal(REELS_TAB, 200);
        List<Object> list = ranked(older, newer);
        NewestReels.sort(list);
        assertEquals(Arrays.asList(newer, older), list);
    }

    @Test
    public void aSignalMadeWhileOffStaysUntimed() {
        Object madeWhileOff = signal(REELS_TAB, 300);
        Settings.NEWEST_REELS_FIRST.save(true);
        Object older = signal(REELS_TAB, 100);
        Object newer = signal(REELS_TAB, 200);
        List<Object> list = ranked(older, madeWhileOff, newer);
        NewestReels.sort(list);
        assertEquals(Arrays.asList(newer, madeWhileOff, older), list);
    }

    @Test
    public void pausedKeepsFacebooksOrder() {
        Settings.NEWEST_REELS_FIRST.save(true);
        Object older = signal(REELS_TAB, 100);
        Object newer = signal(REELS_TAB, 200);
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        List<Object> list = ranked(older, newer);
        NewestReels.sort(list);
        assertEquals(Arrays.asList(older, newer), list);
        assertFalse(NewestReels.records(REELS_TAB));
        PauseForTests.resume();
        NewestReels.sort(list);
        assertEquals(Arrays.asList(newer, older), list);
    }

    @Test
    public void beforeTheSettingsAreReadyNothingIsKeptOrMoved() {
        Settings.NEWEST_REELS_FIRST.save(true);
        Object older = new Object();
        Object newer = new Object();
        Object olderEdge = new Object();
        Object newerEdge = new Object();
        postedAt.put(olderEdge, 100L);
        postedAt.put(newerEdge, 200L);
        List<Object> list = ranked(older, newer);
        SettingsContextRule.withoutContext(() -> {
            assertFalse(NewestReels.records(REELS_TAB));
            NewestReels.posted(REELS_TAB, olderEdge, older);
            NewestReels.posted(REELS_TAB, newerEdge, newer);
            NewestReels.sort(list);
        });
        assertEquals(Arrays.asList(older, newer), list);
        NewestReels.sort(list);
        assertEquals("nothing was kept while the settings weren't ready", Arrays.asList(older, newer), list);
    }

    @Test
    public void aFailingTimeReadKeepsFacebooksOrder() {
        Settings.NEWEST_REELS_FIRST.save(true);
        NewestReels.timeForTests = edge -> {
            throw new IllegalStateException("for this test");
        };
        Object older = signal(REELS_TAB, 100);
        Object newer = signal(REELS_TAB, 200);
        List<Object> list = ranked(older, newer);
        NewestReels.sort(list);
        assertEquals(Arrays.asList(older, newer), list);
        String line = statusLine();
        assertTrue(line, line.contains("'reel signal' hook (it threw java.lang.IllegalStateException)"));
    }

    @Test
    public void anUnloadedLazyEdgeIsCountedAndLeavesItsSignalUntimed() {
        Settings.NEWEST_REELS_FIRST.save(true);
        Object older = signal(REELS_TAB, 100);
        Object unavailable = new Object();
        Object newer = signal(REELS_TAB, 200);
        NewestReels.edgeFailed(new IllegalStateException("Inflated edge is null"));
        NewestReels.posted(REELS_TAB, null, unavailable);
        List<Object> list = ranked(older, unavailable, newer);
        NewestReels.sort(list);
        assertEquals(Arrays.asList(newer, unavailable, older), list);
        String line = statusLine();
        assertTrue(line, line.contains(" 0 missing"));
        assertTrue(line, line.contains(NewestReels.UNLOADED + " 1"));
    }

    @Test
    public void anyOtherEdgeFailureIsReportedAsABrokenHook() {
        Settings.NEWEST_REELS_FIRST.save(true);
        NewestReels.edgeFailed(new ClassCastException("not a tree"));
        String line = statusLine();
        assertTrue(line, line.contains("'reel edge' hook (it threw java.lang.ClassCastException)"));
    }

    @Test
    public void aListThatRefusesChangesIsLeftAsItWas() {
        Settings.NEWEST_REELS_FIRST.save(true);
        Object older = signal(REELS_TAB, 100);
        Object newer = signal(REELS_TAB, 200);
        List<Object> list = java.util.Collections.unmodifiableList(ranked(older, newer));
        NewestReels.sort(list);
        assertEquals(Arrays.asList(older, newer), list);
        String line = statusLine();
        assertTrue(line, line.contains("'reels sort' hook (it threw java.lang.UnsupportedOperationException)"));
    }

    @Test
    public void nullsChangeNothing() {
        Settings.NEWEST_REELS_FIRST.save(true);
        NewestReels.posted(null, new Object(), new Object());
        NewestReels.posted(REELS_TAB, null, new Object());
        NewestReels.posted(REELS_TAB, new Object(), null);
        NewestReels.sort(null);
        Object reel = signal(REELS_TAB, 100);
        List<Object> list = ranked(null, reel);
        NewestReels.sort(list);
        assertEquals(Arrays.asList(null, reel), list);
    }

    /** Unpatched, there's no tree to read, so a real edge gives no time and nothing moves. */
    @Test
    public void aPlainObjectHasNoPostingTime() {
        assertEquals(0, NewestReels.postedSeconds(new Object()));
    }
}
