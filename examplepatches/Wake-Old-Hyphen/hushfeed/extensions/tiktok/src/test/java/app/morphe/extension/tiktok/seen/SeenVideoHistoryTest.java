package app.morphe.extension.tiktok.seen;

import static org.junit.Assert.*;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.tiktok.SignedInUser;
import app.morphe.extension.tiktok.feedfilter.SeenVideoFilter;
import app.morphe.extension.tiktok.settings.Settings;
import com.ss.android.ugc.aweme.feed.model.Aweme;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class SeenVideoHistoryTest {
    /** The account most tests are signed in as. */
    private static final String ME = "me";

    @Before public void setUp() throws Exception {
        Utils.setContext(RuntimeEnvironment.getApplication());
        SignedInUser.idForTests = ME;
        Settings.HIDE_SEEN_VIDEOS.save(true);
        Settings.SEEN_VIDEO_RETENTION_DAYS.save(30);
        Settings.SEEN_VIDEO_MARK_PERCENT.save(0);
        SeenVideoHistory.clear();
        drain();
        // Other accounts' rows outlive a clear on purpose, so the table is emptied by hand.
        database().execSQL("DELETE FROM seen_videos");
        SeenVideoHistory.size();
        drain();
    }

    @After public void tearDown() {
        SignedInUser.idForTests = null;
        SignedInUser.handleForTests = null;
    }

    @Test public void aChosenShareDecidesWhenALongVideoCountsAsSeen() throws Exception {
        // Five seconds used to hide a ten-minute video for good. At half, it takes five minutes.
        Settings.SEEN_VIDEO_MARK_PERCENT.save(50);
        SeenVideoHistory.onPlayProgressChange("long", 5_000, 600_000);
        SeenVideoHistory.onPlayProgressChange("long", 299_999, 600_000);
        drain();
        assertFalse(SeenVideoHistory.shouldHide("long"));
        SeenVideoHistory.onPlayProgressChange("long", 300_000, 600_000);
        drain();
        assertTrue(SeenVideoHistory.shouldHide("long"));
    }

    @Test public void withNoShareChosenTheFewSecondsRuleStays() throws Exception {
        SeenVideoHistory.onPlayProgressChange("long", 5_000, 600_000);
        drain();
        assertTrue(SeenVideoHistory.shouldHide("long"));
        assertFalse(SeenVideoHistory.hasReachedSeenThreshold(999, 5_000));
        assertTrue(SeenVideoHistory.hasReachedSeenThreshold(1_000, 5_000));
        assertFalse(SeenVideoHistory.hasReachedSeenThreshold(4_999, 600_000));
    }

    @Test public void aShareIsHeldInsideTheClipAndUnknownLengthsKeepTwoSeconds() {
        Settings.SEEN_VIDEO_MARK_PERCENT.save(90);
        // 90% of three seconds is 2.7 s, past the last second, where a report may never land.
        assertFalse(SeenVideoHistory.hasReachedSeenThreshold(1_999, 3_000));
        assertTrue(SeenVideoHistory.hasReachedSeenThreshold(2_000, 3_000));
        Settings.SEEN_VIDEO_MARK_PERCENT.save(10);
        // A tenth of a four-second clip is under the one-second floor.
        assertFalse(SeenVideoHistory.hasReachedSeenThreshold(999, 4_000));
        assertTrue(SeenVideoHistory.hasReachedSeenThreshold(1_000, 4_000));
        // No length, no share of it: two seconds, as before.
        assertFalse(SeenVideoHistory.hasReachedSeenThreshold(1_999, 0));
        assertTrue(SeenVideoHistory.hasReachedSeenThreshold(2_000, -1));
    }

    @Test public void clearingKeepsAWayBackUntilTheNextClear() throws Exception {
        SeenVideoHistory.onPlayProgressChange("42", 5000, 10000);
        SeenVideoHistory.onPlayProgressChange("43", 5000, 10000);
        drain();
        assertEquals(2, SeenVideoHistory.size());

        SeenVideoHistory.clear();
        drain();
        assertEquals(0, SeenVideoHistory.size());
        assertTrue(SeenVideoHistory.canUndo());
        assertEquals(2, SeenVideoHistory.undoSize());
        assertFalse(SeenVideoHistory.shouldHide("42"));

        assertTrue(SeenVideoHistory.undoClear());
        drain();
        assertEquals(2, SeenVideoHistory.size());
        assertTrue(SeenVideoHistory.shouldHide("42"));
        assertTrue(SeenVideoHistory.shouldHide("43"));
        // The way back is used up once it has been taken.
        assertFalse(SeenVideoHistory.canUndo());
        assertEquals(0, SeenVideoHistory.undoSize());
        assertFalse(SeenVideoHistory.undoClear());
    }

    @Test public void whatWasPutBackSurvivesAReload() throws Exception {
        SeenVideoHistory.onPlayProgressChange("77", 5000, 10000);
        drain();
        SeenVideoHistory.clear();
        drain();
        assertTrue(SeenVideoHistory.undoClear());
        drain();

        // The rows go back to the database, not just to memory: a reload finds them again.
        Field started = SeenVideoHistory.class.getDeclaredField("LOAD_STARTED");
        started.setAccessible(true);
        ((AtomicBoolean) started.get(null)).set(false);
        Field seen = SeenVideoHistory.class.getDeclaredField("SEEN");
        seen.setAccessible(true);
        ((java.util.Map<?, ?>) seen.get(null)).clear();

        // The reload runs on the same worker, so the first read only starts it.
        SeenVideoHistory.size();
        drain();

        assertEquals(1, SeenVideoHistory.size());
        assertTrue(SeenVideoHistory.shouldHide("77"));
    }

    @Test public void nothingToClearMeansNothingToPutBack() throws Exception {
        assertEquals(0, SeenVideoHistory.size());
        SeenVideoHistory.clear();
        drain();
        assertEquals(0, SeenVideoHistory.undoSize());
        assertFalse(SeenVideoHistory.undoClear());
    }

    @Test public void aClearBeforeTheHistoryLoadsStillKeepsAWayBack() throws Exception {
        // The rows are on disk but memory has never been loaded, which is what happens when
        // the feature is off. Clearing has to read the database, not the empty map.
        SeenVideoHistory.onPlayProgressChange("91", 5000, 10000);
        SeenVideoHistory.onPlayProgressChange("92", 5000, 10000);
        drain();

        Field started = SeenVideoHistory.class.getDeclaredField("LOAD_STARTED");
        started.setAccessible(true);
        ((AtomicBoolean) started.get(null)).set(false);
        Field seen = SeenVideoHistory.class.getDeclaredField("SEEN");
        seen.setAccessible(true);
        ((java.util.Map<?, ?>) seen.get(null)).clear();

        SeenVideoHistory.clear();
        drain();
        assertEquals("the copy comes off the database", 2, SeenVideoHistory.undoSize());

        assertTrue(SeenVideoHistory.undoClear());
        drain();
        assertTrue(SeenVideoHistory.shouldHide("91"));
        assertTrue(SeenVideoHistory.shouldHide("92"));
    }

    @Test public void refreshedPageRejectsTheVideoJustWatched() throws Exception {
        SeenVideoHistory.onPlayProgressChange("42", 5000, 10000);
        drain();
        assertTrue(SeenVideoHistory.shouldHide("42"));
    }

    /** The feed activity built again for a new window width, issue #26's second report. */
    @Test public void theVideoOnScreenIsKeptThroughARebuildUntilPlaybackMovesOn() throws Exception {
        SeenVideoHistory.onPlayProgressChange("41", 5000, 10000);
        SeenVideoHistory.onPlayProgressChange("42", 5000, 10000);
        drain();
        assertTrue(SeenVideoHistory.shouldHide("42"));

        SeenVideoHistory.keepThroughRebuild();
        assertFalse("the video that was playing", SeenVideoHistory.shouldHide("42"));
        assertTrue("an earlier video", SeenVideoHistory.shouldHide("41"));
        // TikTok restores the kept video and plays it on: still kept.
        SeenVideoHistory.onPlayProgressChange("42", 6000, 10000);
        assertFalse(SeenVideoHistory.shouldHide("42"));

        SeenVideoHistory.onPlayProgressChange("43", 0, 10000);
        assertTrue("once the user swiped on, a refreshed page drops it again", SeenVideoHistory.shouldHide("42"));
    }

    @Test public void aRebuildWithNothingPlayingKeepsNothing() throws Exception {
        SeenVideoHistory.onPlayProgressChange("42", 5000, 10000);
        drain();
        SeenVideoHistory.clear();
        drain();
        SeenVideoHistory.keepThroughRebuild();
        SeenVideoHistory.onPlayProgressChange("42", 5000, 10000);
        drain();
        assertTrue(SeenVideoHistory.shouldHide("42"));
    }

    @Test public void disabledFilterPreservesWatchedVideos() throws Exception {
        SeenVideoHistory.onPlayProgressChange("42", 5000, 10000);
        drain();
        Settings.HIDE_SEEN_VIDEOS.save(false);
        assertFalse(SeenVideoHistory.shouldHide("42"));
    }

    @Test public void initialFeedFilteringLoadsRetainedHistoryAndPrunesExpiredSqlRows() throws Exception {
        Settings.SEEN_VIDEO_RETENTION_DAYS.save(7);
        long now = System.currentTimeMillis();
        insert("recent", now - TimeUnit.DAYS.toMillis(2));
        insert("expired", now - TimeUnit.DAYS.toMillis(8));
        resetLoadedMemory();
        SeenVideoFilter filter = new SeenVideoFilter();
        CountDownLatch ready = new CountDownLatch(1);
        CountDownLatch release = new CountDownLatch(1);
        io().execute(() -> {
            ready.countDown();
            try { release.await(5, TimeUnit.SECONDS); }
            catch (InterruptedException error) { Thread.currentThread().interrupt(); }
        });
        try {
            assertTrue(ready.await(5, TimeUnit.SECONDS));
            assertTrue(filter.getEnabled());
            assertFalse("the first feed read must not wait for SQLite", filter.getFiltered(video("recent")));
            assertEquals(Set.of("recent", "expired"), persistedIds());
        } finally {
            release.countDown();
        }
        drain();

        assertEquals("initial loading must remove expired rows from SQLite",
                Set.of("recent"), persistedIds());
        assertTrue("the loaded record never reached the feed filter", filter.getFiltered(video("recent")));
        assertFalse(filter.getFiltered(video("expired")));
        assertFalse(filter.getFiltered(video("unwatched")));
        assertEquals(1, SeenVideoHistory.size());
    }

    @Test public void filteringAnExpiredLoadedVideoRemovesOnlyItsPersistedRecord() throws Exception {
        Settings.SEEN_VIDEO_RETENTION_DAYS.save(0);
        long now = System.currentTimeMillis();
        insert("expired", now - TimeUnit.DAYS.toMillis(2));
        insert("recent", now);
        resetLoadedMemory();
        SeenVideoFilter filter = new SeenVideoFilter();
        filter.getFiltered(video("expired"));
        drain();
        assertTrue("zero retention must preserve the older record", filter.getFiltered(video("expired")));
        assertTrue(filter.getFiltered(video("recent")));
        assertEquals(Set.of("expired", "recent"), persistedIds());

        Settings.SEEN_VIDEO_RETENTION_DAYS.save(1);
        assertFalse(filter.getFiltered(video("expired")));
        assertTrue(filter.getFiltered(video("recent")));
        drain();
        assertEquals("filtering expiry must also delete its SQLite row",
                Set.of("recent"), persistedIds());
        assertEquals(1, SeenVideoHistory.size());
    }

    @Test public void theTwoHundredthRecordedProgressPrunesSqlAndMemoryWithoutPruningEarly() throws Exception {
        Settings.SEEN_VIDEO_RETENTION_DAYS.save(0);
        long now = System.currentTimeMillis();
        insert("expired", now - TimeUnit.DAYS.toMillis(2));
        insert("recent", now);
        resetLoadedMemory();
        SeenVideoFilter filter = new SeenVideoFilter();
        filter.getFiltered(video("recent"));
        drain();
        assertTrue(filter.getFiltered(video("expired")));
        ((AtomicInteger) field("writesSincePrune")).set(0);
        Settings.SEEN_VIDEO_RETENTION_DAYS.save(1);

        for (int number = 1; number <= 199; number++) {
            SeenVideoHistory.onPlayProgressChange("watched-" + number, 1000, 10000);
        }
        // Later progress for the same video and a new video below the threshold are not writes.
        SeenVideoHistory.onPlayProgressChange("watched-199", 9000, 10000);
        SeenVideoHistory.onPlayProgressChange("watched-200", 999, 10000);
        drain();
        Set<String> before = persistedIds();
        assertEquals(201, before.size());
        assertTrue("the sweep ran before 200 recorded videos", before.contains("expired"));
        assertFalse(before.contains("watched-200"));
        assertEquals(201, SeenVideoHistory.size());

        SeenVideoHistory.onPlayProgressChange("watched-200", 1000, 10000);
        drain();
        Set<String> after = persistedIds();
        assertFalse("the 200th progress write never pruned expired SQLite history", after.contains("expired"));
        assertEquals(201, after.size());
        assertEquals("the same sweep must discard expired memory entries", 201, SeenVideoHistory.size());
        assertTrue(filter.getFiltered(video("recent")));
        assertTrue(filter.getFiltered(video("watched-1")));
        assertTrue(filter.getFiltered(video("watched-200")));
        assertFalse(filter.getFiltered(video("expired")));
    }

    private static Aweme video(String aid) {
        return new Aweme() { @Override public String getAid() { return aid; } };
    }

    private static void insert(String aid, long seenAt) throws Exception {
        database().execSQL("INSERT INTO seen_videos (account, aid, last_seen_ms) VALUES (?, ?, ?)", new Object[]{ME, aid, seenAt});
    }

    private static void resetLoadedMemory() throws Exception {
        ((AtomicBoolean) field("LOAD_STARTED")).set(false);
        ((java.util.Map<?, ?>) field("SEEN")).clear();
    }

    private static Set<String> persistedIds() throws Exception {
        Set<String> result = new HashSet<>();
        try (android.database.Cursor cursor = database().rawQuery(
                "SELECT aid FROM seen_videos WHERE account = ?", new String[]{ME})) {
            while (cursor.moveToNext()) result.add(cursor.getString(0));
        }
        return result;
    }

    /** Every row on disk as "account|aid", unowned rows with an empty account. */
    private static Set<String> rows() throws Exception {
        Set<String> result = new HashSet<>();
        try (android.database.Cursor cursor = database().rawQuery("SELECT account, aid FROM seen_videos", null)) {
            while (cursor.moveToNext()) result.add(cursor.getString(0) + "|" + cursor.getString(1));
        }
        return result;
    }

    @Test public void pendingLoadCannotRestoreClearedHistory() throws Exception {
        database().execSQL("INSERT INTO seen_videos (account, aid, last_seen_ms) VALUES ('me', 'old', ?)",
                new Object[]{System.currentTimeMillis()});
        ((AtomicBoolean) field("LOAD_STARTED")).set(false);
        CountDownLatch ready = new CountDownLatch(1);
        CountDownLatch release = new CountDownLatch(1);
        io().execute(() -> {
            ready.countDown();
            try { release.await(5, TimeUnit.SECONDS); }
            catch (InterruptedException e) { Thread.currentThread().interrupt(); }
        });
        assertTrue(ready.await(5, TimeUnit.SECONDS));
        try {
            SeenVideoHistory.size();
            SeenVideoHistory.clear();
        } finally { release.countDown(); }
        drain();
        assertEquals(0, SeenVideoHistory.size());
        assertFalse(SeenVideoHistory.shouldHide("old"));
    }

    @Test public void failedInitialOpenCanRetryAndLoadHistory() throws Exception {
        Field databaseField = SeenVideoHistory.class.getDeclaredField("database");
        databaseField.setAccessible(true);
        Object previousDatabase = databaseField.get(null);
        databaseField.set(null, null);
        ((AtomicBoolean) field("LOAD_STARTED")).set(false);

        Field factoryField = SeenVideoHistory.class.getDeclaredField("databaseFactory");
        factoryField.setAccessible(true);
        Object previousFactory = factoryField.get(null);
        AtomicBoolean failOnce = new AtomicBoolean(true);
        factoryField.set(null, (SeenVideoHistory.DatabaseFactory) context ->
                new SeenVideoHistory.Database(context) {
                    @Override public SQLiteDatabase getReadableDatabase() {
                        if (failOnce.compareAndSet(true, false)) {
                            throw new IllegalStateException("injected open failure");
                        }
                        return super.getReadableDatabase();
                    }
                });
        try {
            SeenVideoHistory.size();
            drain();
            assertFalse("a failed open must allow a later retry",
                    ((AtomicBoolean) field("LOAD_STARTED")).get());

            // The failed helper remains usable once the transient open error is gone.
            database().execSQL("INSERT OR REPLACE INTO seen_videos (account, aid, last_seen_ms) VALUES ('me', 'retry', ?)",
                    new Object[]{System.currentTimeMillis()});
            SeenVideoHistory.size();
            drain();
            try (android.database.Cursor cursor = database().rawQuery(
                    "SELECT aid FROM seen_videos WHERE aid = 'retry'", null)) {
                assertEquals("the retried database should still contain the row", 1, cursor.getCount());
            }
            assertEquals("the retried load should see the persisted row", 1, SeenVideoHistory.size());
            assertTrue(SeenVideoHistory.shouldHide("retry"));
        } finally {
            factoryField.set(null, previousFactory);
            databaseField.set(null, previousDatabase);
            failOnce.set(false);
        }
    }

    @Test public void failedInitialOpenAfterClearStillAllowsALaterRetry() throws Exception {
        Field databaseField = SeenVideoHistory.class.getDeclaredField("database");
        databaseField.setAccessible(true);
        Object previousDatabase = databaseField.get(null);
        databaseField.set(null, null);
        Field factoryField = SeenVideoHistory.class.getDeclaredField("databaseFactory");
        factoryField.setAccessible(true);
        Object previousFactory = factoryField.get(null);
        CountDownLatch openStarted = new CountDownLatch(1);
        CountDownLatch release = new CountDownLatch(1);
        AtomicBoolean failOnce = new AtomicBoolean(true);
        factoryField.set(null, (SeenVideoHistory.DatabaseFactory) context ->
                new SeenVideoHistory.Database(context) {
                    @Override public SQLiteDatabase getReadableDatabase() {
                        if (failOnce.compareAndSet(true, false)) {
                            openStarted.countDown();
                            try { release.await(5, TimeUnit.SECONDS); }
                            catch (InterruptedException error) {
                                Thread.currentThread().interrupt();
                            }
                            throw new IllegalStateException("injected open failure after clear");
                        }
                        return super.getReadableDatabase();
                    }
                });
        ((AtomicBoolean) field("LOAD_STARTED")).set(false);
        try {
            SeenVideoHistory.size();
            assertTrue(openStarted.await(5, TimeUnit.SECONDS));
            SeenVideoHistory.clear(); // Advances the generation while the first open waits.
            release.countDown();
            drain();
            assertFalse("a failed open after clear must release the retry gate",
                    ((AtomicBoolean) field("LOAD_STARTED")).get());
        } finally {
            release.countDown();
            factoryField.set(null, previousFactory);
            databaseField.set(null, previousDatabase);
            failOnce.set(false);
        }
    }

    @Test public void failedUndoCommitRetainsRecoveryAndReportsFailure() throws Exception {
        SeenVideoHistory.onPlayProgressChange("failed-undo", 5000, 10000);
        drain();
        SeenVideoHistory.clear();
        drain();
        assertEquals(1, SeenVideoHistory.undoSize());

        Field writerField = SeenVideoHistory.class.getDeclaredField("rowWriter");
        writerField.setAccessible(true);
        Object previousWriter = writerField.get(null);
        writerField.set(null, (SeenVideoHistory.RowWriter) (database, values) -> -1L);
        AtomicReference<SeenVideoHistory.UndoResult> result = new AtomicReference<>();
        CountDownLatch callback = new CountDownLatch(1);
        try {
            assertTrue(SeenVideoHistory.undoClear(undoResult -> {
                result.set(undoResult);
                callback.countDown();
            }));
            drain();
            org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
            assertTrue(callback.await(5, TimeUnit.SECONDS));
            assertEquals(SeenVideoHistory.UndoResult.FAILED, result.get());
            assertTrue("a rejected insert must keep the recovery copy", SeenVideoHistory.canUndo());
            assertEquals(1, SeenVideoHistory.undoSize());
        } finally {
            writerField.set(null, previousWriter);
        }

        assertTrue(SeenVideoHistory.undoClear());
        drain();
        assertFalse(SeenVideoHistory.canUndo());
        assertTrue(SeenVideoHistory.shouldHide("failed-undo"));
    }

    @Test public void staleExpiryCannotDeleteARefreshedRecord() throws Exception {
        long now = System.currentTimeMillis();
        database().execSQL("INSERT INTO seen_videos (account, aid, last_seen_ms) VALUES ('me', '42', ?)", new Object[]{now});
        Method delete = SeenVideoHistory.class.getDeclaredMethod("deleteAsync", String.class, String.class, long.class);
        delete.setAccessible(true);
        delete.invoke(null, ME, "42", now - 1000);
        drain();
        try (android.database.Cursor c = database().rawQuery("SELECT aid FROM seen_videos", null)) {
            assertEquals(1, c.getCount());
        }
    }

    @Test public void historyHasAHardLimitEvenWithoutAgeRetention() throws Exception {
        Settings.SEEN_VIDEO_RETENTION_DAYS.save(0);
        SQLiteDatabase db = database();
        db.beginTransaction();
        try {
            for (int i = 0; i < 10005; i++) {
                db.execSQL("INSERT INTO seen_videos (account, aid, last_seen_ms) VALUES (?, ?, ?)", new Object[]{ME, "id" + i, (long) i});
            }
            db.setTransactionSuccessful();
        } finally { db.endTransaction(); }
        ((AtomicBoolean) field("LOAD_STARTED")).set(false);
        SeenVideoHistory.size();
        drain();
        assertEquals(10000, SeenVideoHistory.size());
        assertFalse(SeenVideoHistory.shouldHide("id0"));
        assertTrue(SeenVideoHistory.shouldHide("id10004"));
        try (android.database.Cursor c = db.rawQuery("SELECT aid FROM seen_videos", null)) {
            assertEquals(10000, c.getCount());
        }
    }

    @Test public void aTapBeforeTheCopyIsReadKeepsTheWayBack() throws Exception {
        SeenVideoHistory.onPlayProgressChange("91", 5000, 10000);
        SeenVideoHistory.onPlayProgressChange("92", 5000, 10000);
        drain();

        // Hold the worker so the clear queues its read behind the latch, which is the window
        // the toast invites a second tap into.
        CountDownLatch ready = new CountDownLatch(1);
        CountDownLatch release = new CountDownLatch(1);
        io().execute(() -> {
            ready.countDown();
            try { release.await(5, TimeUnit.SECONDS); }
            catch (InterruptedException e) { Thread.currentThread().interrupt(); }
        });
        assertTrue(ready.await(5, TimeUnit.SECONDS));
        try {
            SeenVideoHistory.clear();
            assertTrue(SeenVideoHistory.canUndo());
            // The copy is not there yet, so there is nothing to put back this instant, but the
            // way back must survive the attempt.
            assertFalse(SeenVideoHistory.undoClear());
            assertTrue("the offer is not spent by a tap that was too early",
                    SeenVideoHistory.canUndo());
        } finally { release.countDown(); }
        drain();

        assertTrue(SeenVideoHistory.canUndo());
        assertEquals(2, SeenVideoHistory.undoSize());
        assertTrue(SeenVideoHistory.undoClear());
        drain();
        assertTrue(SeenVideoHistory.shouldHide("91"));
        assertTrue(SeenVideoHistory.shouldHide("92"));
    }

    /**
     * An undo that a newer clear overtakes used to return from its worker without telling anyone,
     * so a caller waiting on the callback waited forever and its row stayed offering an undo that
     * would never run.
     */
    @Test public void anUndoOvertakenByANewerClearStillReportsBack() throws Exception {
        SeenVideoHistory.onPlayProgressChange("81", 5000, 10000);
        drain();
        SeenVideoHistory.clear();
        drain();
        assertTrue(SeenVideoHistory.canUndo());

        // Hold the worker so the undo queues, then let a newer clear take the generation.
        CountDownLatch ready = new CountDownLatch(1);
        CountDownLatch release = new CountDownLatch(1);
        io().execute(() -> {
            ready.countDown();
            try { release.await(5, TimeUnit.SECONDS); }
            catch (InterruptedException e) { Thread.currentThread().interrupt(); }
        });
        assertTrue(ready.await(5, TimeUnit.SECONDS));

        AtomicReference<SeenVideoHistory.UndoResult> result = new AtomicReference<>();
        CountDownLatch callback = new CountDownLatch(1);
        try {
            assertTrue(SeenVideoHistory.undoClear(undoResult -> {
                result.set(undoResult);
                callback.countDown();
            }));
            SeenVideoHistory.clear();
        } finally {
            release.countDown();
        }
        drain();
        org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();

        assertTrue("the overtaken undo never reported back", callback.await(5, TimeUnit.SECONDS));
        assertEquals(SeenVideoHistory.UndoResult.SUPERSEDED, result.get());
    }

    @Test public void puttingTheRecordBackKeepsTheNewerSighting() throws Exception {
        SeenVideoHistory.onPlayProgressChange("55", 5000, 10000);
        drain();
        SeenVideoHistory.clear();
        drain();

        // Watched again after the clear, so memory holds a newer time than the copy does.
        SeenVideoHistory.onPlayProgressChange("55", 5000, 10000);
        drain();
        long watchedAgain = seenAt("55");

        assertTrue(SeenVideoHistory.undoClear());
        drain();
        assertEquals("the older copy must not overwrite it", watchedAgain, seenAt("55"));

        // And what went back to the database is the newer time too, or the next load would
        // quietly undo the merge.
        try (android.database.Cursor c = database().rawQuery(
                "SELECT last_seen_ms FROM seen_videos WHERE account = 'me' AND aid = '55'", null)) {
            assertTrue(c.moveToFirst());
            assertEquals("the row on disk must match memory", watchedAgain, c.getLong(0));
        }
    }

    private static long seenAt(String aid) throws Exception {
        Field f = SeenVideoHistory.class.getDeclaredField("SEEN");
        f.setAccessible(true);
        Object value = ((java.util.Map<?, ?>) f.get(null)).get(aid);
        assertNotNull("nothing recorded for " + aid, value);
        return (Long) value;
    }

    @Test public void aSchemaChangeKeepsWhatWasAlreadyWatched() throws Exception {
        long watched = System.currentTimeMillis();
        insert("kept", watched);

        // What SQLiteOpenHelper calls when the version moves in either direction. Neither is
        // allowed to take the record with it, or the account it belongs to.
        SQLiteOpenHelper helper = (SQLiteOpenHelper) field("database");
        helper.onUpgrade(database(), 1, 2);
        helper.onDowngrade(database(), 3, 2);

        try (android.database.Cursor c = database().rawQuery(
                "SELECT last_seen_ms FROM seen_videos WHERE account = 'me' AND aid = 'kept'", null)) {
            assertTrue("the row survived the migration", c.moveToFirst());
            assertEquals(watched, c.getLong(0));
        }
    }

    /** One account's watching hides nothing from another, from the first read after a switch. */
    @Test public void eachAccountKeepsARecordOfItsOwn() throws Exception {
        SignedInUser.idForTests = "111";
        SeenVideoHistory.onPlayProgressChange("a1", 5000, 10000);
        drain();
        assertTrue(SeenVideoHistory.shouldHide("a1"));

        SignedInUser.idForTests = "222";
        assertFalse("the first account's record reached the feed after the switch",
                SeenVideoHistory.shouldHide("a1"));
        assertEquals(0, SeenVideoHistory.size());
        SeenVideoHistory.onPlayProgressChange("b1", 5000, 10000);
        drain();
        assertTrue(SeenVideoHistory.shouldHide("b1"));

        SignedInUser.idForTests = "111";
        SeenVideoHistory.size();
        drain();
        assertTrue(SeenVideoHistory.shouldHide("a1"));
        assertFalse(SeenVideoHistory.shouldHide("b1"));
        assertEquals(Set.of("111|a1", "222|b1"), rows());

        // Signed out is a record of its own too.
        SignedInUser.idForTests = "";
        assertFalse(SeenVideoHistory.shouldHide("a1"));
        SeenVideoHistory.onPlayProgressChange("g1", 5000, 10000);
        drain();
        assertTrue(rows().contains(SeenVideoHistory.SIGNED_OUT + "|g1"));
    }

    @Test public void clearingForgetsOnlyTheSignedInAccountAndItsWayBackStaysWithIt() throws Exception {
        SignedInUser.idForTests = "111";
        SeenVideoHistory.onPlayProgressChange("a1", 5000, 10000);
        drain();
        SignedInUser.idForTests = "222";
        SeenVideoHistory.onPlayProgressChange("b1", 5000, 10000);
        drain();

        SeenVideoHistory.clear();
        drain();
        assertTrue(SeenVideoHistory.canUndo());
        assertEquals(1, SeenVideoHistory.undoSize());
        assertEquals(Set.of("111|a1"), rows());

        SignedInUser.idForTests = "111";
        assertFalse("the other account was offered a way back to a record that isn't its own",
                SeenVideoHistory.canUndo());
        SeenVideoHistory.size();
        drain();
        assertTrue(SeenVideoHistory.shouldHide("a1"));
    }

    /**
     * Version 1 recorded no account. Its rows hide nothing, for anyone, until they're added to
     * an account on purpose, and then the newer sighting of a video both hold wins.
     */
    @Test public void versionOneRowsHideNothingUntilTheyAreAddedToAnAccount() throws Exception {
        long now = System.currentTimeMillis();
        replaceWithVersionOne(Map.of("old1", now - 5000, "both", now - 1000, "stale", now - 9000));
        SignedInUser.idForTests = "111";
        SeenVideoHistory.size();
        drain();
        assertFalse("an unowned row hid a video", SeenVideoHistory.shouldHide("old1"));
        assertEquals(3, SeenVideoHistory.unownedCount());
        assertEquals(Set.of("|old1", "|both", "|stale"), rows());

        // The account already holds two of them: "both" at an older time, "stale" at a newer one.
        database().execSQL("INSERT INTO seen_videos (account, aid, last_seen_ms) VALUES ('111', 'both', ?)",
                new Object[]{now - 3000});
        database().execSQL("INSERT INTO seen_videos (account, aid, last_seen_ms) VALUES ('111', 'stale', ?)",
                new Object[]{now - 2000});

        AtomicInteger added = new AtomicInteger(-2);
        CountDownLatch done = new CountDownLatch(1);
        SeenVideoHistory.adoptUnowned(count -> {
            added.set(count);
            done.countDown();
        });
        drain();
        org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
        assertTrue(done.await(5, TimeUnit.SECONDS));
        assertEquals(3, added.get());
        assertEquals(0, SeenVideoHistory.unownedCount());
        assertEquals(Set.of("111|old1", "111|both", "111|stale"), rows());
        assertTrue(SeenVideoHistory.shouldHide("old1"));
        assertEquals("the newer unowned sighting wins", now - 1000, lastSeen("111", "both"));
        assertEquals("the newer account sighting stays", now - 2000, lastSeen("111", "stale"));

        // Another account never sees them.
        SignedInUser.idForTests = "222";
        SeenVideoHistory.size();
        drain();
        assertFalse(SeenVideoHistory.shouldHide("old1"));
    }

    /**
     * An older bundle opens a version 2 database as version 1: it writes rows without an account
     * and sets the version back. Coming back to this bundle must not take the accounts off the
     * rows it wrote before.
     */
    @Test public void anOlderBundleRunningInBetweenLeavesEveryAccountOnItsRows() throws Exception {
        SignedInUser.idForTests = "111";
        SeenVideoHistory.onPlayProgressChange("mine", 5000, 10000);
        drain();
        SQLiteDatabase db = database();
        db.execSQL("INSERT OR REPLACE INTO seen_videos (aid, last_seen_ms) VALUES ('legacy', ?)",
                new Object[]{System.currentTimeMillis()});
        db.setVersion(1);
        ((SQLiteOpenHelper) field("database")).onUpgrade(db, 1, 2);
        assertEquals(Set.of("111|mine", "|legacy"), rows());
    }

    private static long lastSeen(String account, String aid) throws Exception {
        try (android.database.Cursor c = database().rawQuery(
                "SELECT last_seen_ms FROM seen_videos WHERE account = ? AND aid = ?", new String[]{account, aid})) {
            assertTrue("no row for " + account + "|" + aid, c.moveToFirst());
            return c.getLong(0);
        }
    }

    /** Swaps the database for one version 1 wrote, holding these rows, and forgets memory. */
    private static void replaceWithVersionOne(Map<String, Long> watched) throws Exception {
        Context context = RuntimeEnvironment.getApplication();
        Field databaseField = SeenVideoHistory.class.getDeclaredField("database");
        databaseField.setAccessible(true);
        ((SQLiteOpenHelper) databaseField.get(null)).close();
        databaseField.set(null, null);
        context.deleteDatabase("seen_videos.db");
        SQLiteDatabase v1 = context.openOrCreateDatabase("seen_videos.db", Context.MODE_PRIVATE, null);
        try {
            v1.execSQL("CREATE TABLE seen_videos (aid TEXT PRIMARY KEY NOT NULL, last_seen_ms INTEGER NOT NULL)");
            v1.execSQL("CREATE INDEX seen_videos_last_seen ON seen_videos (last_seen_ms)");
            for (Map.Entry<String, Long> row : watched.entrySet()) {
                v1.execSQL("INSERT INTO seen_videos VALUES (?, ?)", new Object[]{row.getKey(), row.getValue()});
            }
            v1.setVersion(1);
        } finally {
            v1.close();
        }
        resetLoadedMemory();
        Field partition = SeenVideoHistory.class.getDeclaredField("partition");
        partition.setAccessible(true);
        partition.set(null, null);
    }

    private static Object field(String name) throws Exception {
        Field f = SeenVideoHistory.class.getDeclaredField(name);
        f.setAccessible(true);
        return f.get(null);
    }
    private static ExecutorService io() throws Exception { return (ExecutorService) field("IO"); }
    private static void drain() throws Exception { io().submit(() -> {}).get(15, TimeUnit.SECONDS); }
    private static SQLiteDatabase database() throws Exception {
        return ((SQLiteOpenHelper) field("database")).getWritableDatabase();
    }
}
