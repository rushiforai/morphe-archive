/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.media;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.content.SharedPreferences;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import java.util.ArrayList;
import java.util.List;

import app.morphe.extension.facebook.media.RecentlyWatched.Entry;
import app.morphe.extension.facebook.media.RecentlyWatched.Keep;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.settings.Setting;

/**
 * The Recently watched list as it's kept: one entry per reel, video or story, the one watched last
 * first, a second watch moving it up, the oldest dropped past the limit, entries leaving once their
 * time is up, one taken off and put back, and the file read back as it was written.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class WatchedListTest {
    @Rule
    public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** Where the clock stands unless a test moves it: well past the small times most entries carry. */
    private static final long NOW = 1_000_000L;
    private static final long DAY = RecentlyWatched.DAY_MS;

    private SharedPreferences store;

    @Before
    public void start() {
        store = RuntimeEnvironment.getApplication().getSharedPreferences("watched_list_test", Context.MODE_PRIVATE);
        store.edit().clear().commit();
        // A keep time saved below ages the installed list, at once and on this thread.
        RecentlyWatchedForTests.install();
        RecentlyWatchedForTests.clockAt(NOW);
    }

    @After
    public void restore() {
        store.edit().clear().commit();
        Settings.RECENTLY_WATCHED_KEEP.resetToDefault();
        Settings.RECENTLY_WATCHED.resetToDefault();
        RecentlyWatchedForTests.forget();
    }

    private static void keep(Keep time) {
        Settings.RECENTLY_WATCHED_KEEP.save(time);
    }

    private static Entry reel(String id, long at) {
        return new Entry(RecentlyWatched.REEL, id, null, null, null, at, 30_000);
    }

    private static List<String> ids(List<Entry> entries) {
        List<String> ids = new ArrayList<>();
        for (Entry entry : entries) ids.add(entry.kind + ":" + entry.id);
        return ids;
    }

    @Test
    public void theOneWatchedLastComesFirst() {
        WatchedList list = new WatchedList(store);
        assertTrue(list.add(reel("a", 1)));
        assertTrue(list.add(reel("b", 2)));
        assertTrue(list.add(reel("c", 3)));
        assertEquals("[reel:c, reel:b, reel:a]", ids(list.newestFirst()).toString());
    }

    @Test
    public void aSecondWatchMovesItUpWithItsNewTime() {
        WatchedList list = new WatchedList(store);
        list.add(reel("a", 1));
        list.add(reel("b", 2));
        assertFalse("a second watch counted as new", list.add(reel("a", 9)));
        List<Entry> entries = list.newestFirst();
        assertEquals("[reel:a, reel:b]", ids(entries).toString());
        assertEquals(9, entries.get(0).watchedAt);
        assertEquals(2, list.size());
    }

    @Test
    public void aReelAndAVideoWithOneIdAreOneEntryUnderTheLastKind() {
        WatchedList list = new WatchedList(store);
        list.add(reel("1", 1));
        assertFalse("the same video counted as new",
                list.add(new Entry(RecentlyWatched.VIDEO, "1", null, null, null, 2, 0)));
        List<Entry> entries = list.newestFirst();
        assertEquals("[video:1]", ids(entries).toString());
        assertEquals("the reel's length went", 30_000, entries.get(0).durationMs);
        list.add(reel("1", 3));
        assertEquals("[reel:1]", ids(list.newestFirst()).toString());
    }

    @Test
    public void aStoryAndAReelWithOneIdStayTwo() {
        WatchedList list = new WatchedList(store);
        list.add(new Entry(RecentlyWatched.STORY, "1", null, null, "b", 1, 0));
        assertTrue(list.add(reel("1", 2)));
        assertEquals("[reel:1, story:1]", ids(list.newestFirst()).toString());
    }

    @Test
    public void aFileListingOneVideoTwiceReadsAsOne() {
        store.edit().putString(WatchedList.KEY, "[{\"k\":\"reel\",\"i\":\"1\",\"t\":1,\"d\":30000},"
                + "{\"k\":\"video\",\"i\":\"2\",\"t\":2},{\"k\":\"video\",\"i\":\"1\",\"t\":3}]").commit();
        List<Entry> read = new WatchedList(store).newestFirst();
        assertEquals("[video:1, video:2]", ids(read).toString());
        assertEquals(30_000, read.get(0).durationMs);
        assertEquals(3, read.get(0).watchedAt);
    }

    @Test
    public void aSecondWatchKeepsWhatTheFirstKnew() {
        WatchedList list = new WatchedList(store);
        list.add(new Entry(RecentlyWatched.STORY, "s", "Ana", "Hello", "b", 1, 15_000));
        list.add(new Entry(RecentlyWatched.STORY, "s", null, null, null, 5, 0));
        Entry entry = list.newestFirst().get(0);
        assertEquals("Ana", entry.owner);
        assertEquals("Hello", entry.caption);
        assertEquals("b", entry.parent);
        assertEquals(15_000, entry.durationMs);
        assertEquals(5, entry.watchedAt);
    }

    @Test
    public void theOldestGoesPastTheLimit() {
        WatchedList list = new WatchedList(store);
        int over = WatchedList.MAX_ENTRIES + 5;
        for (int i = 0; i < over; i++) list.add(reel("v" + i, i));
        assertEquals(WatchedList.MAX_ENTRIES, list.size());
        List<Entry> entries = list.newestFirst();
        assertEquals("v" + (over - 1), entries.get(0).id);
        assertEquals("the oldest five stayed", "v5", entries.get(entries.size() - 1).id);

        List<Entry> reread = new WatchedList(store).newestFirst();
        assertEquals(WatchedList.MAX_ENTRIES, reread.size());
        assertEquals("v5", reread.get(reread.size() - 1).id);
    }

    @Test
    public void theFileReadsBackAsItWasWritten() {
        WatchedList list = new WatchedList(store);
        list.add(new Entry(RecentlyWatched.STORY, "s1", "Ana \"Q\" Lee", null, "b1", 100, 0));
        list.add(new Entry(RecentlyWatched.VIDEO, "v1", null, "A caption", null, 200, 61_000));
        list.add(reel("r1", 300));

        List<Entry> reread = new WatchedList(store).newestFirst();
        assertEquals("[reel:r1, video:v1, story:s1]", ids(reread).toString());
        Entry story = reread.get(2);
        assertEquals("Ana \"Q\" Lee", story.owner);
        assertEquals("b1", story.parent);
        assertNull(story.caption);
        assertEquals(100, story.watchedAt);
        Entry video = reread.get(1);
        assertEquals("A caption", video.caption);
        assertEquals(61_000, video.durationMs);
        assertNull(video.owner);
    }

    @Test
    public void whatDoesntParseIsLeftOut() {
        String saved = "[{\"k\":\"reel\",\"i\":\"good\",\"t\":5},"
                + "{\"k\":\"photo\",\"i\":\"unknown kind\",\"t\":6},"
                + "{\"k\":\"video\",\"t\":7},"
                + "{\"k\":\"video\",\"i\":\"\",\"t\":8},"
                + "\"not an object\","
                + "{\"k\":\"story\",\"i\":\"s\",\"p\":\"b\"}]";
        List<Entry> read = WatchedList.decode(saved);
        assertEquals(2, read.size());
        assertEquals("good", read.get(0).id);
        assertEquals("s", read.get(1).id);
        assertEquals(0, read.get(1).watchedAt);

        assertTrue(WatchedList.decode("not json").isEmpty());
        store.edit().putString(WatchedList.KEY, "{broken").commit();
        WatchedList list = new WatchedList(store);
        assertEquals(0, list.size());
        assertTrue("a broken file kept the list from taking a new entry", list.add(reel("a", 1)));
        assertEquals(1, new WatchedList(store).size());
    }

    @Test
    public void clearForgetsEveryEntryAndTheFile() {
        WatchedList list = new WatchedList(store);
        list.add(reel("a", 1));
        list.add(reel("b", 2));
        list.clear();
        assertEquals(0, list.size());
        assertFalse(store.contains(WatchedList.KEY));
        assertEquals(0, new WatchedList(store).size());
        assertTrue(list.add(reel("a", 3)));
        assertEquals(1, list.size());
    }

    // ------------------------------------------------------------------ how long entries stay

    @Test
    public void theAgeRuleAtItsEdges() {
        long week = 7 * DAY;
        assertTrue("a week old stayed", WatchedList.expired(0, week, week));
        assertFalse("a millisecond short of a week went", WatchedList.expired(1, week, week));
        assertFalse("no limit dropped one", WatchedList.expired(0, 100 * week, 0));
        assertFalse("a day ahead of the clock went", WatchedList.expired(week + DAY, week, week));
        assertTrue("past a day ahead of the clock stayed", WatchedList.expired(week + DAY + 1, week, week));
    }

    @Test
    public void anEntryLeavesTheMomentItsTimeIsUp() {
        keep(Keep.SEVEN_DAYS);
        long now = 100 * DAY;
        RecentlyWatchedForTests.clockAt(now);
        WatchedList list = new WatchedList(store);
        list.add(reel("due", now - 7 * DAY));
        list.add(reel("kept", now - 7 * DAY + 1));
        assertEquals("[reel:kept]", ids(list.newestFirst()).toString());
        assertEquals("the file kept what left", "[reel:kept]", ids(new WatchedList(store).newestFirst()).toString());

        RecentlyWatchedForTests.clockAt(now + 1);
        assertEquals(0, list.size());
    }

    @Test
    public void aNewListKeepsEntriesThirtyDays() {
        assertEquals(Keep.THIRTY_DAYS, Settings.RECENTLY_WATCHED_KEEP.savedValue());
        long now = 100 * DAY;
        RecentlyWatchedForTests.clockAt(now);
        WatchedList list = new WatchedList(store);
        list.add(reel("month", now - 30 * DAY));
        list.add(reel("week", now - 8 * DAY));
        assertEquals("[reel:week]", ids(list.newestFirst()).toString());
    }

    @Test
    public void untilClearedKeepsEveryEntryWhateverTheClockSays() {
        keep(Keep.UNTIL_CLEARED);
        long now = 1000 * DAY;
        RecentlyWatchedForTests.clockAt(now);
        WatchedList list = new WatchedList(store);
        list.add(reel("old", 1));
        list.add(reel("ahead", now + 5 * DAY));
        assertEquals(2, list.size());
    }

    @Test
    public void aClockSetBackALittleKeepsTheListAndALotDropsWhatCantBeAged() {
        long now = 100 * DAY;
        RecentlyWatchedForTests.clockAt(now);
        WatchedList list = new WatchedList(store);
        list.add(reel("a", now - DAY));
        list.add(reel("b", now));
        RecentlyWatchedForTests.clockAt(now - DAY / 2);
        assertEquals("half a day back dropped an entry", 2, list.size());
        RecentlyWatchedForTests.clockAt(now - DAY - 1);
        assertEquals("[reel:a]", ids(list.newestFirst()).toString());
    }

    @Test
    public void aShorterTimeTakesWhatsPastItOffAtOnce() {
        long now = 100 * DAY;
        RecentlyWatchedForTests.clockAt(now);
        RecentlyWatchedForTests.watched(RecentlyWatched.REEL, "old", null, null, null, now - 10 * DAY, 0);
        RecentlyWatchedForTests.watched(RecentlyWatched.REEL, "new", null, null, null, now - DAY, 0);
        keep(Keep.SEVEN_DAYS);
        assertEquals("[reel:new]", ids(savedList()).toString());
    }

    @Test
    public void theRunsFirstStartAgesTheListWithRecordingOff() {
        Settings.RECENTLY_WATCHED.save(false);
        keep(Keep.SEVEN_DAYS);
        long now = 100 * DAY;
        // Both written two days back, when neither was past seven days; a write ages the list too.
        RecentlyWatchedForTests.clockAt(now - 2 * DAY);
        RecentlyWatchedForTests.watched(RecentlyWatched.REEL, "old", null, null, null, now - 8 * DAY, 0);
        RecentlyWatchedForTests.watched(RecentlyWatched.REEL, "new", null, null, null, now - 2 * DAY, 0);
        assertEquals(2, savedList().size());

        RecentlyWatchedForTests.clockAt(now);
        RecentlyWatched.started(new Object());
        assertEquals("[reel:new]", ids(savedList()).toString());
        assertTrue("a start with recording off was checked", RecentlyWatchedForTests.CHECKS.isEmpty());
    }

    /** What the installed list's file holds, oldest first. */
    private static List<Entry> savedList() {
        String saved = RecentlyWatchedForTests.store().getString(WatchedList.KEY, null);
        return saved == null ? new ArrayList<>() : WatchedList.decode(saved);
    }

    // ------------------------------------------------------------------ a list from an earlier build

    @Test
    public void aListFromBeforeEntriesExpiredStaysUntilCleared() {
        SharedPreferences settings = settingsStore();
        store.edit().putString(WatchedList.KEY, "[{\"k\":\"reel\",\"i\":\"1\",\"t\":1}]").commit();
        try {
            assertTrue(RecentlyWatched.keepOlderListAsItWas(settings, store));
            assertEquals(Keep.UNTIL_CLEARED.name(), settings.getString(RecentlyWatched.KEEP_KEY, null));
            assertFalse("the list is still taken for an older one", WatchedList.olderList(store));
            assertEquals("[reel:1]", ids(WatchedList.decode(store.getString(WatchedList.KEY, null))).toString());

            // Picking 30 days, the default, takes the saved time away again. That's no older list.
            settings.edit().remove(RecentlyWatched.KEEP_KEY).commit();
            assertFalse(RecentlyWatched.keepOlderListAsItWas(settings, store));
            assertFalse(settings.contains(RecentlyWatched.KEEP_KEY));
        } finally {
            settings.edit().clear().commit();
        }
    }

    @Test
    public void aNewListOrASavedTimeIsLeftAsItIs() {
        SharedPreferences settings = settingsStore();
        try {
            assertFalse("nothing listed yet", RecentlyWatched.keepOlderListAsItWas(settings, store));
            assertFalse(settings.contains(RecentlyWatched.KEEP_KEY));

            new WatchedList(store).add(reel("a", NOW));
            assertFalse("this build's list taken for an older one", WatchedList.olderList(store));
            assertFalse(RecentlyWatched.keepOlderListAsItWas(settings, store));
            assertFalse(settings.contains(RecentlyWatched.KEEP_KEY));

            store.edit().clear().putString(WatchedList.KEY, "[]").commit();
            settings.edit().putString(RecentlyWatched.KEEP_KEY, Keep.SEVEN_DAYS.name()).commit();
            assertTrue(RecentlyWatched.keepOlderListAsItWas(settings, store));
            assertEquals("a saved time was replaced", Keep.SEVEN_DAYS.name(),
                    settings.getString(RecentlyWatched.KEEP_KEY, null));
            assertFalse(WatchedList.olderList(store));
        } finally {
            settings.edit().clear().commit();
        }
    }

    @Test
    public void theSettingsFirstLoadSettlesTheAppsOwnFiles() {
        SharedPreferences listStore = RuntimeEnvironment.getApplication()
                .getSharedPreferences(WatchedList.FILE, Context.MODE_PRIVATE);
        SharedPreferences settings = Setting.preferences.preferences;
        listStore.edit().clear().putString(WatchedList.KEY, "[]").commit();
        settings.edit().remove(RecentlyWatched.KEEP_KEY).commit();
        try {
            RecentlyWatched.keepOlderListAsItWas();
            assertEquals(Keep.UNTIL_CLEARED.name(), settings.getString(RecentlyWatched.KEEP_KEY, null));
            assertFalse(WatchedList.olderList(listStore));
        } finally {
            listStore.edit().clear().commit();
            settings.edit().remove(RecentlyWatched.KEEP_KEY).commit();
        }
    }

    private static SharedPreferences settingsStore() {
        SharedPreferences settings = RuntimeEnvironment.getApplication()
                .getSharedPreferences("watched_keep_settings_test", Context.MODE_PRIVATE);
        settings.edit().clear().commit();
        return settings;
    }

    // ------------------------------------------------------------------ one taken off, and Undo

    @Test
    public void oneTakenOffGoesBackWhereItsTimePutsIt() {
        WatchedList list = new WatchedList(store);
        list.add(reel("a", 1));
        list.add(reel("b", 2));
        list.add(reel("c", 3));
        Entry gone = list.remove(RecentlyWatched.REEL, "b");
        assertEquals("b", gone.id);
        assertNull("taken off twice", list.remove(RecentlyWatched.REEL, "b"));
        assertEquals("[reel:c, reel:a]", ids(new WatchedList(store).newestFirst()).toString());

        assertTrue(list.restore(gone));
        assertEquals("[reel:c, reel:b, reel:a]", ids(list.newestFirst()).toString());
        assertEquals("[reel:c, reel:b, reel:a]", ids(new WatchedList(store).newestFirst()).toString());
    }

    @Test
    public void undoNeverWritesOverANewerWatch() {
        WatchedList list = new WatchedList(store);
        list.add(reel("a", 1));
        Entry gone = list.remove(RecentlyWatched.REEL, "a");
        list.add(new Entry(RecentlyWatched.VIDEO, "a", null, null, null, 9, 0));
        assertFalse(list.restore(gone));
        List<Entry> entries = list.newestFirst();
        assertEquals("[video:a]", ids(entries).toString());
        assertEquals(9, entries.get(0).watchedAt);
    }

    @Test
    public void undoPutsNothingBackPastItsTime() {
        keep(Keep.SEVEN_DAYS);
        long now = 100 * DAY;
        RecentlyWatchedForTests.clockAt(now);
        WatchedList list = new WatchedList(store);
        list.add(reel("a", now - 7 * DAY + 10));
        Entry gone = list.remove(RecentlyWatched.REEL, "a");
        RecentlyWatchedForTests.clockAt(now + 10);
        assertFalse(list.restore(gone));
        assertEquals(0, list.size());
    }

    @Test
    public void puttingOneBackKeepsTheLimit() {
        WatchedList list = new WatchedList(store);
        for (int i = 0; i < WatchedList.MAX_ENTRIES; i++) list.add(reel("v" + i, i + 1));
        Entry gone = list.remove(RecentlyWatched.REEL, "v10");
        list.add(reel("new", 10_000));
        assertTrue(list.restore(gone));
        assertEquals(WatchedList.MAX_ENTRIES, list.size());
        List<Entry> entries = list.newestFirst();
        assertEquals("new", entries.get(0).id);
        assertEquals("the oldest didn't make room", "v1", entries.get(entries.size() - 1).id);
    }
}
