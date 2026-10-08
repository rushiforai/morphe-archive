/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.feed;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import com.facebook.graphql.model.GraphQLStory;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicLong;

import app.morphe.extension.facebook.feed.SeenPostsForTests.Story;
import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * Hide seen posts: a post Facebook counts as seen is remembered by its cache id, and the feed guard
 * drops it on a later load for the days the setting names. The store is capped, expires on a lookup,
 * a read and a write, clears off the main thread, is forgotten when the switch goes off, survives a
 * restart through its file, and stays out of the way off, paused or before the settings are ready.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class SeenPostsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** Stands in for GraphQLFeedStoryCategory: only the constant names matter to the guard. */
    enum Category { ORGANIC }

    private static final long HOUR = 60L * 60 * 1000;
    private static final long DAY = 24 * HOUR;

    private File file;
    private final AtomicLong now = new AtomicLong(1_000_000_000_000L);

    @Before
    public void start() throws IOException {
        HookStatus.clear();
        FeedFilterCounters.clear();
        file = File.createTempFile("seen-posts", ".txt");
        SeenPosts.resetForTests();
        SeenPosts.inBuildForTests = Boolean.TRUE;
        SeenPosts.fileForTests = file;
        SeenPosts.laterForTests = () -> { };
        SeenPosts.backgroundForTests = Runnable::run;
        SeenPosts.clock = now::get;
        Settings.HIDE_SEEN_POSTS.save(true);
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.HIDE_SEEN_POSTS.resetToDefault();
        Settings.SEEN_POSTS_KEEP.resetToDefault();
        SeenPosts.resetForTests();
        //noinspection ResultOfMethodCallIgnored
        file.delete();
        HookStatus.clear();
        FeedFilterCounters.clear();
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.SEEN_POSTS + ":")) return line;
        }
        return null;
    }

    @Test
    public void aSeenPostIsHiddenOnALaterLoadAndAnotherPostIsNot() {
        Story first = new Story("post-one");
        assertNull("a post nobody saw was hidden", SeenPosts.hideReason(first));
        SeenPosts.seen(first);
        assertEquals(SeenPosts.REASON, SeenPosts.hideReason(first));
        assertNull("a different post was hidden", SeenPosts.hideReason(new Story("post-two")));
        assertEquals(FamilyNames.SEEN_POSTS + ": invoked 4, 2 found, 0 missing. Counted: " + SeenPosts.REMEMBERED
                + " 1, " + SeenPosts.HIDDEN + " 1", statusLine());
    }

    @Test
    public void theFeedGuardDropsASeenPostAndCountsIt() {
        Story story = new Story("guarded");
        assertFalse(FeedFilter.hideEdge(Category.ORGANIC, story));
        SeenPosts.seen(story);
        assertTrue("a seen post stayed in the feed", FeedFilter.hideEdge(Category.ORGANIC, story));
        assertFalse("a post nobody saw was dropped", FeedFilter.hideEdge(Category.ORGANIC, new Story("fresh")));
        assertTrue(FeedFilterCounters.report().toString(), FeedFilterCounters.report().toString().contains(SeenPosts.REASON));
    }

    @Test
    public void offNothingIsRememberedOrHidden() {
        Settings.HIDE_SEEN_POSTS.save(false);
        Story story = new Story("off");
        SeenPosts.seen(story);
        assertEquals("a post was remembered with the switch off", 0, SeenPosts.size());
        SeenPosts.remember(SeenPosts.idOf(story), now.get());
        assertNull("a post was hidden with the switch off", SeenPosts.hideReason(story));
        Settings.HIDE_SEEN_POSTS.save(true);
        SeenPosts.seen(story);
        assertEquals("the control: the same post is hidden with it on", SeenPosts.REASON, SeenPosts.hideReason(story));
    }

    /**
     * A list left from when the switch was on is forgotten once a hook finds it off, as after an
     * import or a reset turned it off, file and all. It isn't emptied again for every post, and
     * turning the switch back on starts from nothing.
     */
    @Test
    public void aHookThatFindsTheSwitchOffForgetsTheListOnce() {
        Story story = new Story("left over");
        SeenPosts.seen(story);
        SeenPosts.writeNow();
        assertTrue("the store wasn't written", file.length() > 0);
        List<Runnable> writes = new ArrayList<>();
        SeenPosts.backgroundForTests = writes::add;

        Settings.HIDE_SEEN_POSTS.save(false);
        assertNull(SeenPosts.hideReason(story));
        assertEquals("the list outlived the switch", 0, SeenPosts.size());
        assertEquals("the file was written on the hook's own thread", 1, writes.size());
        assertTrue("the file went before the background write ran", file.length() > 0);
        writes.get(0).run();
        assertFalse("the file outlived the switch", file.exists());

        SeenPosts.hideReason(new Story("another"));
        SeenPosts.seen(new Story("another"));
        assertEquals("the list was emptied again for every post", 1, writes.size());

        Settings.HIDE_SEEN_POSTS.save(true);
        assertNull("a post from before the switch went off was hidden", SeenPosts.hideReason(story));
    }

    /** A pause keeps the list: only the switch going off forgets it. */
    @Test
    public void aPauseKeepsTheList() {
        Story story = new Story("kept");
        SeenPosts.seen(story);
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        SeenPosts.hideReason(story);
        SeenPosts.seen(new Story("while paused"));
        PauseForTests.resume();
        assertEquals(1, SeenPosts.size());
        assertEquals(SeenPosts.REASON, SeenPosts.hideReason(story));
    }

    @Test
    public void pausedFacebookIsLeftAlone() {
        Story story = new Story("paused");
        SeenPosts.remember(SeenPosts.idOf(story), now.get());
        assertEquals(SeenPosts.REASON, SeenPosts.hideReason(story));
        for (HushfacebookPause.Reason reason : new HushfacebookPause.Reason[] {
                HushfacebookPause.Reason.SWITCH, HushfacebookPause.Reason.CRASH_LOOP}) {
            PauseForTests.pause(reason);
            assertNull("a Hushfacebook paused by " + reason + " hid a post", SeenPosts.hideReason(story));
            SeenPosts.seen(new Story("seen while paused"));
            PauseForTests.resume();
        }
        assertEquals("a post was remembered while paused", 1, SeenPosts.size());
    }

    @Test
    public void aPostIsForgottenAfterTheDaysTheSettingNames() {
        Story story = new Story("expiry");
        SeenPosts.seen(story);
        assertEquals(SeenPosts.Keep.SEVEN_DAYS, Settings.SEEN_POSTS_KEEP.get());
        now.addAndGet(6 * DAY + 23 * HOUR);
        assertEquals("a post was forgotten early", SeenPosts.REASON, SeenPosts.hideReason(story));
        now.addAndGet(2 * HOUR);
        assertNull("a post stayed hidden past its days", SeenPosts.hideReason(story));
        assertEquals("an expired post stayed in the store", 0, SeenPosts.size());

        Settings.SEEN_POSTS_KEEP.save(SeenPosts.Keep.THREE_DAYS);
        SeenPosts.seen(story);
        now.addAndGet(2 * DAY);
        assertEquals(SeenPosts.REASON, SeenPosts.hideReason(story));
        now.addAndGet(2 * DAY);
        assertNull("three days didn't expire a post", SeenPosts.hideReason(story));

        Settings.SEEN_POSTS_KEEP.save(SeenPosts.Keep.ONE_DAY);
        SeenPosts.seen(story);
        now.addAndGet(25 * HOUR);
        assertNull(SeenPosts.hideReason(story));

        Settings.SEEN_POSTS_KEEP.save(SeenPosts.Keep.THIRTY_DAYS);
        SeenPosts.seen(story);
        now.addAndGet(29 * DAY);
        assertEquals(SeenPosts.REASON, SeenPosts.hideReason(story));
    }

    @Test
    public void theStoreKeepsTheNewestAndDropsTheOldest() {
        for (int i = 0; i < SeenPosts.CAP + 5; i++) SeenPosts.remember("id" + i, now.get() + i);
        assertEquals(SeenPosts.CAP, SeenPosts.size());
        // Looked up after the newest was seen: a lookup before it would find a time ahead of the clock.
        long later = now.get() + SeenPosts.CAP + 5;
        assertFalse("the oldest post was kept", SeenPosts.isRemembered("id0", later, DAY));
        assertFalse(SeenPosts.isRemembered("id4", later, DAY));
        assertTrue("the first post past the cut was dropped", SeenPosts.isRemembered("id5", later, DAY));
        assertTrue("the newest post was dropped", SeenPosts.isRemembered("id" + (SeenPosts.CAP + 4), later, DAY));
    }

    @Test
    public void seeingAPostAgainMakesItTheNewest() {
        SeenPosts.remember("a", now.get());
        SeenPosts.remember("b", now.get());
        assertFalse("a post seen again counted as new", SeenPosts.remember("a", now.get() + HOUR));
        assertTrue(SeenPosts.isRemembered("a", now.get() + HOUR, DAY));
    }

    @Test
    public void forgetSeenPostsEmptiesTheStoreAndItsFile() throws IOException {
        Story story = new Story("clear");
        SeenPosts.seen(story);
        SeenPosts.writeNow();
        assertTrue("the store wasn't written", file.length() > 0);
        SeenPosts.clear();
        assertEquals(0, SeenPosts.size());
        assertNull(SeenPosts.hideReason(story));
        assertFalse("the file is still there", file.exists());
    }

    /**
     * Forget seen posts runs on the main thread, so it empties the list at once and hands the file
     * to a background thread. It works with the switch off too.
     */
    @Test
    public void forgetSeenPostsLeavesTheFileToABackgroundThread() {
        SeenPosts.seen(new Story("main thread"));
        SeenPosts.writeNow();
        Settings.HIDE_SEEN_POSTS.save(false);
        List<Runnable> writes = new ArrayList<>();
        SeenPosts.backgroundForTests = writes::add;
        SeenPosts.clear();
        assertEquals(0, SeenPosts.size());
        assertTrue("the file was touched on the caller's thread", file.length() > 0);
        assertEquals(1, writes.size());
        writes.get(0).run();
        assertFalse(file.exists());
    }

    /**
     * Posts past their days go when the file is read, so a list from before a long break doesn't
     * wait for each post to be looked up, and again when it's written. A time more than a day
     * ahead of the clock goes as well.
     */
    @Test
    public void postsPastTheirDaysArePrunedOnReadAndOnWrite() throws IOException {
        long fresh = now.get() - HOUR;
        Files.write(file.toPath(), ((now.get() - 8 * DAY) + " old\n" + fresh + " fresh\n" + (now.get() + 2 * DAY)
                + " ahead\n").getBytes(StandardCharsets.UTF_8));
        assertEquals("the read kept a post past its days or ahead of the clock", 1, SeenPosts.size());
        SeenPosts.writeNow();
        assertEquals(fresh + " fresh\n", new String(Files.readAllBytes(file.toPath()), StandardCharsets.UTF_8));

        now.addAndGet(7 * DAY);
        SeenPosts.writeNow();
        assertFalse("the write kept a post past its days", file.exists());
        assertEquals(0, SeenPosts.size());
    }

    /**
     * A clock set far back leaves times more than a day ahead of it. Such a post counts as past its
     * days rather than staying hidden until the clock catches up and the whole keep time after that.
     * This test used to set the clock back an hour, which the day of slack now covers.
     */
    @Test
    public void aPostSeenFarAheadOfTheClockIsNotHidden() {
        Story story = new Story("clock set back");
        SeenPosts.seen(story);
        now.addAndGet(-(DAY + HOUR));
        assertNull("a post seen over a day after now stayed hidden", SeenPosts.hideReason(story));
        assertEquals(0, SeenPosts.size());
        assertTrue(SeenPosts.expired(now.get() + DAY + 1, now.get(), DAY));
        assertFalse(SeenPosts.expired(now.get(), now.get(), DAY));
    }

    /**
     * A one-second correction, or a few minutes of drift, must not bring back the post just seen.
     * A time up to a day ahead counts as now, so the post stays hidden for its whole keep time from
     * the corrected clock, and not a moment longer.
     */
    @Test
    public void aSmallClockCorrectionKeepsAJustSeenPostHidden() {
        Settings.SEEN_POSTS_KEEP.save(SeenPosts.Keep.ONE_DAY);
        Story story = new Story("clock nudged");
        long seenAt = now.get();
        SeenPosts.seen(story);
        now.addAndGet(-1_000);
        assertEquals("one second back brought the post back", SeenPosts.REASON, SeenPosts.hideReason(story));
        now.addAndGet(-HOUR);
        assertEquals("an hour back brought the post back", SeenPosts.REASON, SeenPosts.hideReason(story));
        assertEquals(1, SeenPosts.size());
        assertFalse(SeenPosts.expired(now.get() + DAY, now.get(), DAY));
        assertFalse(SeenPosts.expired(now.get() + 1, now.get(), DAY));
        assertFalse(SeenPosts.expired(now.get() + HOUR, now.get() + HOUR + DAY - 1, DAY));
        assertTrue(SeenPosts.expired(now.get() + HOUR, now.get() + HOUR + DAY, DAY));
        now.set(seenAt + DAY - 1);
        assertEquals("the keep time hasn't run out yet", SeenPosts.REASON, SeenPosts.hideReason(story));
        now.set(seenAt + DAY);
        assertNull("a day on, the post is past its day", SeenPosts.hideReason(story));
    }

    /** A second post class whose getCacheId() is its own method, so the reader differs from Story's. */
    private static final class OtherStory extends GraphQLStory {
        private final String id;

        OtherStory(String id) {
            this.id = id;
        }

        public String getCacheId() {
            return id;
        }
    }

    /**
     * The reader and the class it was found on are one object, so a thread that sees a class never
     * gets another class's reader. Two classes asked from several threads each answer for their own
     * id, never a miss from a reader invoked on the wrong class.
     */
    @Test
    public void everyThreadGetsTheReaderOfItsOwnClass() throws Exception {
        String expectedStory = SeenPosts.idOf(new Story("one"));
        String expectedOther = SeenPosts.idOf(new OtherStory("two"));
        assertNotNull(expectedStory);
        assertNotNull(expectedOther);
        assertFalse(expectedStory.equals(expectedOther));
        java.util.concurrent.ExecutorService pool = java.util.concurrent.Executors.newFixedThreadPool(4);
        try {
            List<java.util.concurrent.Future<Integer>> runs = new ArrayList<>();
            for (int t = 0; t < 4; t++) {
                final boolean story = t % 2 == 0;
                runs.add(pool.submit(() -> {
                    int wrong = 0;
                    for (int i = 0; i < 20_000; i++) {
                        String got = story ? SeenPosts.idOf(new Story("one")) : SeenPosts.idOf(new OtherStory("two"));
                        if (!(story ? expectedStory : expectedOther).equals(got)) wrong++;
                    }
                    return wrong;
                }));
            }
            for (java.util.concurrent.Future<Integer> run : runs) assertEquals(0, (int) run.get());
        } finally {
            pool.shutdownNow();
        }
    }

    @Test
    public void theFileHoldsAHashAndTheTimeNeverTheId() throws IOException {
        SeenPosts.seen(new Story("secret-cache-id-12345"));
        SeenPosts.writeNow();
        String text = new String(Files.readAllBytes(file.toPath()), StandardCharsets.UTF_8);
        assertFalse("the cache id is in the file", text.contains("secret-cache-id"));
        assertTrue(text, text.matches("\\d+ [0-9a-f]{16}\\n"));
    }

    @Test
    public void aRestartReadsTheStoreBack() {
        Story story = new Story("restart");
        SeenPosts.seen(story);
        SeenPosts.writeNow();
        SeenPosts.resetForTests();
        SeenPosts.inBuildForTests = Boolean.TRUE;
        SeenPosts.fileForTests = file;
        SeenPosts.laterForTests = () -> { };
        SeenPosts.backgroundForTests = Runnable::run;
        SeenPosts.clock = now::get;
        assertEquals("a restart forgot the posts", 1, SeenPosts.size());
        assertEquals(SeenPosts.REASON, SeenPosts.hideReason(story));
    }

    @Test
    public void aDamagedFileLosesOnlyItsDamagedLines() throws IOException {
        Files.write(file.toPath(), ("garbage\n" + now.get() + " goodid\nnot-a-number x\n").getBytes(StandardCharsets.UTF_8));
        assertEquals(1, SeenPosts.size());
        assertTrue(SeenPosts.isRemembered("goodid", now.get(), DAY));
    }

    @Test
    public void aUnitWithNoIdOrNotAPostIsLeftAlone() {
        SeenPosts.seen(new Story(null));
        SeenPosts.seen(new Story(""));
        SeenPosts.seen(new Object());
        SeenPosts.seen(new GraphQLStory());
        SeenPosts.seen(new Story("throws") {
            @Override public String getCacheId() {
                throw new IllegalStateException("released");
            }
        });
        assertEquals(0, SeenPosts.size());
        assertNull(SeenPosts.hideReason(new Story(null)));
        assertNull(SeenPosts.hideReason(new Object()));
        assertNull(SeenPosts.hideReason(null));
        assertTrue(statusLine(), statusLine().contains(SeenPosts.NO_ID + " "));
    }

    @Test
    public void aPostNotInTheBuildIsNeverHidden() {
        Story story = new Story("not in build");
        SeenPosts.remember(SeenPosts.idOf(story), now.get());
        SeenPosts.inBuildForTests = Boolean.FALSE;
        assertNull(SeenPosts.hideReason(story));
        assertFalse(FeedFilter.hideEdge(Category.ORGANIC, story));
    }
}
