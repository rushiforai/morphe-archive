/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.pinedrama.download;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.pinedrama.SettingsContextRule;
import app.morphe.extension.pinedrama.live.LiveRecordChip;
import app.morphe.extension.pinedrama.settings.Settings;
import app.morphe.extension.pinedrama.settings.preference.SavesNowPreference;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowAlertDialog;
import org.robolectric.shadows.ShadowToast;

/**
 * The Downloads page's list of saves under way and Saves at once (#27): every save in the order
 * it was accepted with what it's doing, Cancel only where it still does something, and a new
 * limit that holds a waiting save back or starts it at once.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28, qualifiers = "en")
public class SaveQueueTest {
    @Rule public final SettingsContextRule settings = new SettingsContextRule();
    private final List<CountDownLatch> holds = new ArrayList<>();
    private Context context;

    @Before public void setUp() throws Exception {
        context = RuntimeEnvironment.getApplication();
        Utils.setContext(context);
        SaveNotice.windowRootsForTests = List.of();
        SaveProgress.announcementsForTests = new ArrayList<>();
        // The media pool is process-wide, so an earlier class's jobs would sit in this one's list.
        drainPool();
        MediaJobScheduler.clearEndedForTests();
        ShadowToast.reset();
    }

    @After public void tearDown() throws Exception {
        for (CountDownLatch hold : holds) hold.countDown();
        holds.clear();
        Settings.DOWNLOAD_SAVES_AT_ONCE.resetToDefault();
        MediaJobScheduler.applyLimit();
        drainPool();
        idle();
        Utils.setActivity(null);
        SaveNotice.windowRootsForTests = null;
        SaveProgress.announcementsForTests = null;
    }

    private static void drainPool() throws Exception {
        for (int wait = 0; wait < 500; wait++) {
            if (MediaJobScheduler.idle()) return;
            Thread.sleep(10);
        }
        throw new IllegalStateException("the media pool never emptied");
    }

    /** Holds all three media workers until the latch opens, so every save after this waits. */
    private CountDownLatch holdWorkers() throws Exception {
        CountDownLatch release = new CountDownLatch(1);
        holds.add(release);
        CountDownLatch started = new CountDownLatch(MediaJobScheduler.MAX_RUNNING_JOBS);
        for (int index = 0; index < MediaJobScheduler.MAX_RUNNING_JOBS; index++) {
            assertTrue(MediaJobScheduler.submit("queue test hold", () -> {
                started.countDown();
                await(release);
            }));
        }
        assertTrue("the media workers never started", started.await(5, TimeUnit.SECONDS));
        return release;
    }

    /** One save that runs until the returned latch opens. */
    private CountDownLatch hold(CountDownLatch started, AtomicInteger ended) {
        CountDownLatch release = new CountDownLatch(1);
        holds.add(release);
        assertNotNull(MediaJobScheduler.submit("queue test hold", null, () -> {
            started.countDown();
            await(release);
        }, ended::incrementAndGet));
        return release;
    }

    private static void await(CountDownLatch latch) {
        try {
            latch.await(10, TimeUnit.SECONDS);
        } catch (InterruptedException interrupted) {
            Thread.currentThread().interrupt();
        }
    }

    private static void waitFor(AtomicInteger counter, int value) throws Exception {
        for (int wait = 0; wait < 500 && counter.get() < value; wait++) Thread.sleep(10);
        assertEquals(value, counter.get());
    }

    private static void idle() {
        Shadows.shadowOf(Looper.getMainLooper()).idle();
    }

    /** Saves at once as the pool reads it: one to three, and anything else the most. */
    @Test public void savesAtOnceReadsOneToThreeAndAnythingElseAsThree() {
        assertEquals(1, MediaJobScheduler.limitFrom("1"));
        assertEquals(2, MediaJobScheduler.limitFrom(" 2 "));
        assertEquals(3, MediaJobScheduler.limitFrom("3"));
        for (String odd : new String[]{"0", "4", "-1", "two", "", null}) {
            assertEquals(String.valueOf(odd), 3, MediaJobScheduler.limitFrom(odd));
        }
        Settings.DOWNLOAD_SAVES_AT_ONCE.save("1");
        assertEquals(1, MediaJobScheduler.runningLimit());
    }

    /**
     * Three saves running when the limit drops to one: they finish, and a new save waits for all
     * three, since none of them hands its place on.
     */
    @Test public void aLowerLimitHoldsANewSaveUntilEveryRunningOneEnds() throws Exception {
        CountDownLatch started = new CountDownLatch(MediaJobScheduler.MAX_RUNNING_JOBS);
        AtomicInteger ended = new AtomicInteger();
        CountDownLatch first = hold(started, ended);
        CountDownLatch second = hold(started, ended);
        CountDownLatch third = hold(started, ended);
        assertTrue("the media workers never started", started.await(5, TimeUnit.SECONDS));
        Settings.DOWNLOAD_SAVES_AT_ONCE.save("1");
        SaveQueue.applyLimit();
        assertEquals(1, MediaJobScheduler.poolLimit());
        AtomicInteger ran = new AtomicInteger();
        MediaJobScheduler.Job job = MediaJobScheduler.submit("video", null, ran::incrementAndGet, null);
        assertNotNull(job);
        assertEquals(3, job.ahead);
        assertTrue(job.waiting());
        List<SaveQueue.Entry> entries = SaveQueue.entries(context);
        assertEquals(4, entries.size());
        assertEquals("Video", entries.get(3).title);
        assertEquals("Starts after 3 other saves", entries.get(3).detail);

        // At three it would start the moment one ended. At one it waits out the other two as well.
        first.countDown();
        second.countDown();
        waitFor(ended, 2);
        assertFalse("a save started past the lower limit", job.running() || ran.get() > 0);
        Thread.sleep(300);
        assertTrue("a save started past the lower limit", job.waiting());
        third.countDown();
        waitFor(ran, 1);
    }

    /** One save running and one in line at a limit of one: raising it starts the waiting save at once. */
    @Test public void aHigherLimitStartsAWaitingSaveAtOnce() throws Exception {
        CountDownLatch started = new CountDownLatch(MediaJobScheduler.MAX_RUNNING_JOBS);
        AtomicInteger ended = new AtomicInteger();
        CountDownLatch first = hold(started, ended);
        CountDownLatch second = hold(started, ended);
        hold(started, ended);
        assertTrue("the media workers never started", started.await(5, TimeUnit.SECONDS));
        Settings.DOWNLOAD_SAVES_AT_ONCE.save("1");
        SaveQueue.applyLimit();
        CountDownLatch inside = new CountDownLatch(1);
        MediaJobScheduler.Job job = MediaJobScheduler.submit("sound", null, inside::countDown, null);
        assertNotNull(job);
        first.countDown();
        second.countDown();
        waitFor(ended, 2);
        assertFalse("a save started past the limit", inside.await(300, TimeUnit.MILLISECONDS));
        assertTrue(job.waiting());
        SaveQueue.Entry waiting = SaveQueue.entries(context).get(1);
        assertEquals("Sound", waiting.title);
        assertEquals("Starts after one other save", waiting.detail);

        Settings.DOWNLOAD_SAVES_AT_ONCE.save("2");
        SaveQueue.applyLimit();
        assertTrue("the waiting save didn't start", inside.await(5, TimeUnit.SECONDS));
    }

    /** The list keeps the order saves were accepted in, counts each place from it, and the row names them. */
    @Test public void theListKeepsTheOrderAndTheRowNamesTheSaves() throws Exception {
        assertTrue(SaveQueue.entries(context).isEmpty());
        assertEquals("Nothing is saving right now", SaveQueue.summary(context, SaveQueue.entries(context)));
        holdWorkers();
        MediaJobScheduler.Job video = MediaJobScheduler.submit("video", null, () -> { }, null);
        MediaJobScheduler.Job sound = MediaJobScheduler.submit("sound", null, () -> { }, null);
        MediaJobScheduler.Job story = MediaJobScheduler.submit("story", null, () -> { }, null);
        assertEquals(List.of(video, sound, story), MediaJobScheduler.jobs().subList(3, 6));

        assertTrue(sound.cancel());
        assertEquals("a save out of line stayed listed", List.of(video, story), MediaJobScheduler.jobs().subList(3, 5));
        List<SaveQueue.Entry> entries = SaveQueue.entries(context);
        assertEquals("Starts after one other save", entries.get(3).detail);
        assertEquals("Starts after 2 other saves", entries.get(4).detail);
        assertEquals("Media save, Media save, Media save, Video, Story", SaveQueue.summary(context, entries));
    }

    /** A save in line shows its own wait and its place, and Cancel takes it out of line with the row's word. */
    @Test public void cancelOnAWaitingSaveTakesItOutOfLine() throws Exception {
        try (var owner = Robolectric.buildActivity(SaveNoticeTest.HostActivity.class).setup().visible()) {
            Utils.setActivity(owner.get());
            holdWorkers();
            SaveProgress progress = SaveProgress.queuedFiles(3);
            AtomicInteger ended = new AtomicInteger();
            MediaJobScheduler.Job job = progress.submit("original photos", null, () -> { }, ended::incrementAndGet);
            List<SaveQueue.Entry> entries = SaveQueue.entries(context);
            assertEquals(4, entries.size());
            for (SaveQueue.Entry running : entries.subList(0, 3)) {
                assertEquals("Media save", running.title);
                assertEquals("Saving", running.detail);
                assertFalse("a save with no row of its own can't stop after its file", running.canCancel());
            }
            SaveQueue.Entry photos = entries.get(3);
            assertEquals(job, photos.key);
            assertEquals("Original photos", photos.title);
            assertEquals("Waiting to save 3 files\nStarts after one other save", photos.detail);
            assertTrue(photos.canCancel());

            photos.cancel();
            idle();
            assertEquals("Save cancelled. Nothing was saved.", ShadowToast.getTextOfLatestToast());
            assertEquals(1, ended.get());
            assertFalse(job.waiting());
            assertEquals(3, SaveQueue.entries(context).size());
        }
    }

    /** A save of several files under way offers Cancel, which stops it after the file it's on. */
    @Test public void cancelOnARunningSaveStopsItAfterItsFile() throws Exception {
        try (var owner = Robolectric.buildActivity(SaveNoticeTest.HostActivity.class).setup().visible()) {
            Utils.setActivity(owner.get());
            SaveProgress progress = SaveProgress.queued(3, false);
            CountDownLatch inFirst = new CountDownLatch(1);
            CountDownLatch finishFirst = new CountDownLatch(1);
            holds.add(finishFirst);
            AtomicInteger files = new AtomicInteger();
            AtomicInteger ended = new AtomicInteger();
            assertNotNull(progress.submit(BatchSave.LABEL, null, () -> progress.run(index -> {
                files.incrementAndGet();
                if (index == 0) {
                    inFirst.countDown();
                    await(finishFirst);
                }
            }), ended::incrementAndGet));
            assertTrue("the save never started", inFirst.await(5, TimeUnit.SECONDS));
            idle();
            SaveQueue.Entry picked = SaveQueue.entries(context).get(0);
            assertEquals("Picked videos", picked.title);
            assertEquals("Saving 1 of 3", picked.detail);
            assertTrue(picked.canCancel());

            picked.cancel();
            idle();
            SaveQueue.Entry stopping = SaveQueue.entries(context).get(0);
            assertEquals("Stopping after this file", stopping.detail);
            assertFalse("Cancel offered twice", stopping.canCancel());
            finishFirst.countDown();
            waitFor(ended, 1);
            assertEquals("a file after Cancel was saved", 1, files.get());
            assertTrue(SaveQueue.entries(context).isEmpty());
        }
    }

    /** A single video under way has nothing after it to stop, so it shows no Cancel. */
    @Test public void aSingleVideoUnderWayShowsNoCancel() throws Exception {
        try (var owner = Robolectric.buildActivity(SaveNoticeTest.HostActivity.class).setup().visible()) {
            Utils.setActivity(owner.get());
            SaveProgress progress = SaveProgress.queued(1, true);
            CountDownLatch inside = new CountDownLatch(1);
            CountDownLatch finish = new CountDownLatch(1);
            holds.add(finish);
            AtomicInteger ended = new AtomicInteger();
            assertNotNull(progress.submit("video", null, () -> progress.run(index -> {
                inside.countDown();
                await(finish);
            }), ended::incrementAndGet));
            assertTrue("the save never started", inside.await(5, TimeUnit.SECONDS));
            idle();
            SaveQueue.Entry video = SaveQueue.entries(context).get(0);
            assertEquals("Video", video.title);
            assertEquals("Saving video", video.detail);
            assertFalse(video.canCancel());
            finish.countDown();
            waitFor(ended, 1);
        }
    }

    /**
     * A save that ended stays listed under Earlier this session with the last thing it told the
     * reader, its count or its reason, newest first and the last few only. A word said off the
     * save's own thread belongs to no save.
     */
    @Test public void anEndedSaveStaysListedWithItsLastWord() throws Exception {
        AtomicInteger ended = new AtomicInteger();
        CountDownLatch started = new CountDownLatch(1);
        CountDownLatch finish = new CountDownLatch(1);
        holds.add(finish);
        MediaJobScheduler.Job video = MediaJobScheduler.submit("video", null, () -> {
            Utils.showToastShort("Writing the caption in didn't work, so the video was saved without it");
            Utils.showToastShort("Saved one video");
            started.countDown();
            await(finish);
        }, ended::incrementAndGet);
        assertNotNull(video);
        assertTrue(started.await(5, TimeUnit.SECONDS));
        // Said on this thread while the save still runs on its own: not the save's word.
        Utils.showToastShort("A word from somewhere else");
        finish.countDown();
        waitFor(ended, 1);
        idle();
        // Cancel on a save that's over does nothing, and lists it no second time.
        assertFalse(video.cancel());
        assertTrue(SaveQueue.entries(context).isEmpty());
        List<SaveQueue.Entry> earlier = SaveQueue.endedEntries(context);
        assertEquals(1, earlier.size());
        assertEquals("Video", earlier.get(0).title);
        assertEquals("Saved one video", earlier.get(0).detail);
        assertFalse(earlier.get(0).canCancel());

        // A save whose result is a banner with Retry says it without a toast.
        assertNotNull(MediaJobScheduler.submit(BatchSave.LABEL, null,
                () -> SaveNotice.saved("Saved 2 of 3, 1 skipped", null, () -> { }), ended::incrementAndGet));
        waitFor(ended, 2);
        assertEquals("Saved 2 of 3, 1 skipped", SaveQueue.endedEntries(context).get(0).detail);
        assertEquals("Picked videos", SaveQueue.endedEntries(context).get(0).title);

        for (int index = 0; index < MediaJobScheduler.MAX_ENDED; index++) {
            String word = "Sound " + index;
            assertNotNull(MediaJobScheduler.submit("sound", null, () -> Utils.showToastShort(word), ended::incrementAndGet));
            waitFor(ended, index + 3);
        }
        earlier = SaveQueue.endedEntries(context);
        assertEquals(MediaJobScheduler.MAX_ENDED, earlier.size());
        assertEquals("Sound " + (MediaJobScheduler.MAX_ENDED - 1), earlier.get(0).detail);
        assertEquals("Sound 0", earlier.get(MediaJobScheduler.MAX_ENDED - 1).detail);
    }

    /** One taken out of line says so, one an error stopped says that, and one that said nothing reads as done. */
    @Test public void aCancelledFailedOrSilentSaveSaysHowItEnded() throws Exception {
        CountDownLatch release = holdWorkers();
        MediaJobScheduler.Job waiting = MediaJobScheduler.submit("story", null, () -> { }, null);
        assertTrue(waiting.cancel());
        SaveQueue.Entry cancelled = SaveQueue.endedEntries(context).get(0);
        assertEquals("Story", cancelled.title);
        assertEquals("Save cancelled. Nothing was saved.", cancelled.detail);
        release.countDown();
        drainPool();

        AtomicInteger ended = new AtomicInteger();
        assertNotNull(MediaJobScheduler.submit("sound", null, () -> {
            Utils.showToastShort("Saving the sound");
            throw new IllegalStateException("a failure the save didn't expect");
        }, ended::incrementAndGet));
        waitFor(ended, 1);
        assertNotNull(MediaJobScheduler.submit("video", null, () -> { }, ended::incrementAndGet));
        waitFor(ended, 2);
        List<SaveQueue.Entry> earlier = SaveQueue.endedEntries(context);
        assertEquals("Video", earlier.get(0).title);
        assertEquals("Done", earlier.get(0).detail);
        assertEquals("Sound", earlier.get(1).title);
        assertEquals("Stopped by an unexpected error", earlier.get(1).detail);
    }

    /**
     * A sticker's result and the already-saved offer both speak from the main thread, after the
     * save is over, so each tells the list itself what happened.
     */
    @Test public void aStickerOrAnAlreadySavedVideoSaysWhatHappened() throws Exception {
        AtomicInteger ended = new AtomicInteger();
        assertNotNull(MediaJobScheduler.submit("sticker", null, StickerGallerySaver.stickerSaveWork(context,
                new StickerGallerySaver.StickerAsset(List.of(), false)), ended::incrementAndGet));
        waitFor(ended, 1);
        idle();
        SaveQueue.Entry sticker = SaveQueue.endedEntries(context).get(0);
        assertEquals("Sticker", sticker.title);
        assertEquals("The sticker couldn't be saved. Try again.", sticker.detail);

        MediaFileWriter.Saved previous = new MediaFileWriter.Saved("tiktok_1.mp4", null, null);
        assertNotNull(MediaJobScheduler.submit("video", null,
                () -> SavedVideoArchive.offer(previous, () -> { }, () -> { }), ended::incrementAndGet));
        waitFor(ended, 2);
        idle();
        SaveQueue.Entry video = SaveQueue.endedEntries(context).get(0);
        assertEquals("Video", video.title);
        assertEquals("This video is already saved", video.detail);
    }

    /**
     * The open list: Earlier this session stays hidden until a save ends, then shows it without a
     * Cancel, and the refresh after keeps the same line rather than drawing it again.
     */
    @Test public void theOpenListShowsAnEndedSaveUnderItsOwnHeader() throws Exception {
        try (var controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            activity.setTheme(android.R.style.Theme_Material_Light);
            SavesNowPreference row = new SavesNowPreference(activity);
            row.getOnPreferenceClickListener().onPreferenceClick(row);
            AlertDialog dialog = (AlertDialog) ShadowAlertDialog.getLatestAlertDialog();
            View root = dialog.getWindow().getDecorView();
            TextView header = findText(root, "Earlier this session");
            assertNotNull(header);
            assertEquals(View.GONE, header.getVisibility());
            assertEquals(View.VISIBLE, findText(root, "Nothing is saving right now").getVisibility());

            AtomicInteger ended = new AtomicInteger();
            assertNotNull(MediaJobScheduler.submit("sound", null,
                    () -> Utils.showToastShort("Saved the sound"), ended::incrementAndGet));
            waitFor(ended, 1);
            Shadows.shadowOf(Looper.getMainLooper()).idleFor(600, TimeUnit.MILLISECONDS);
            assertEquals(View.VISIBLE, header.getVisibility());
            TextView detail = findText(root, "Saved the sound");
            assertNotNull(detail);
            ViewGroup line = (ViewGroup) detail.getParent().getParent();
            TextView cancel = findText(line, "Cancel");
            assertEquals(View.GONE, cancel.getVisibility());

            Shadows.shadowOf(Looper.getMainLooper()).idleFor(1100, TimeUnit.MILLISECONDS);
            assertSame(detail, findText(root, "Saved the sound"));
            dialog.dismiss();
            idle();
        }
    }

    private static TextView findText(View view, String text) {
        if (view instanceof TextView && text.contentEquals(((TextView) view).getText())) return (TextView) view;
        if (!(view instanceof ViewGroup)) return null;
        ViewGroup group = (ViewGroup) view;
        for (int index = 0; index < group.getChildCount(); index++) {
            TextView found = findText(group.getChildAt(index), text);
            if (found != null) return found;
        }
        return null;
    }

    /** A LIVE recording being saved is listed last, after the saves, and offers no Cancel. */
    @Test public void aLiveRecordingBeingSavedIsListedLast() throws Exception {
        holdWorkers();
        assertNotNull(MediaJobScheduler.submit("video", null, () -> { }, null));
        LiveRecordChip.holdForTests(new LiveRecorder(null, null, null, null, null), true);
        try {
            List<SaveQueue.Entry> entries = SaveQueue.entries(context);
            SaveQueue.Entry live = entries.get(entries.size() - 1);
            assertEquals("LIVE", live.title);
            assertEquals("Saving the recording", live.detail);
            assertFalse(live.canCancel());
            assertEquals("Video", entries.get(entries.size() - 2).title);
            assertTrue(SaveQueue.summary(context, entries).endsWith(", Video, LIVE"));
        } finally {
            LiveRecordChip.holdForTests(null, false);
        }
        List<SaveQueue.Entry> after = SaveQueue.entries(context);
        assertEquals("Video", after.get(after.size() - 1).title);
    }

    /** A save the full line refused was never accepted, so it isn't listed as one that ended. */
    @Test public void aRefusedSaveIsNotListed() throws Exception {
        holdWorkers();
        for (int index = 0; index < MediaJobScheduler.MAX_QUEUED_JOBS; index++) {
            assertNotNull(MediaJobScheduler.submit("video", null, () -> { }, null));
        }
        MediaJobScheduler.clearEndedForTests();
        assertNull(MediaJobScheduler.submit("sound", null, () -> { }, null));
        assertTrue(SaveQueue.endedEntries(context).isEmpty());
    }
}
