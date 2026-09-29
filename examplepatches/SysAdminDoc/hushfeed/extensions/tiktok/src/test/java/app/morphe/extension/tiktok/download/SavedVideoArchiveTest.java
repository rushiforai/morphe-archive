/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.download;

import static org.junit.Assert.*;

import android.Manifest;
import android.app.AlertDialog;
import android.content.Intent;
import android.net.Uri;
import android.os.Environment;
import android.os.Looper;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.tiktok.SettingsContextRule;
import app.morphe.extension.tiktok.UiCapture;
import app.morphe.extension.tiktok.settings.SettingsPagesTest.PageActivity;
import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.settings.preference.SettingsUi;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLStreamHandler;
import java.nio.file.Files;
import java.nio.charset.StandardCharsets;
import java.util.Hashtable;
import java.util.List;
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
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.shadows.ShadowDialog;
import org.robolectric.shadows.ShadowToast;
import org.robolectric.util.ReflectionHelpers;

/** Exercises the save, paired details, duplicate choices and deleted-file recovery together. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28, qualifiers = "w360dp-h800dp-night-mdpi")
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class SavedVideoArchiveTest {
    @Rule public final SettingsContextRule settings = new SettingsContextRule();
    private static final String FOLDER = "DCIM/SavedVideoArchiveTest";
    private static final byte[] VIDEO = new byte[]{0, 0, 0, 16, 'f', 't', 'y', 'p', 'i', 's', 'o', 'm', 0, 0, 0, 0};
    private final AtomicInteger requests = new AtomicInteger();
    private Hashtable<String, URLStreamHandler> handlers;
    private URLStreamHandler oldHttps;
    private ActivityController<PageActivity> owner;
    private File root;
    private boolean oldDetails, oldCheck, oldMuted, oldAudio, oldSubtitles, oldProgress;
    private java.util.concurrent.CountDownLatch reachedEnd, releaseCopy;
    private String oldPath, oldTemplate, oldQuality, oldExternal;

    @Before public void setup() throws Exception {
        oldProgress = Settings.DOWNLOAD_PROGRESS.get(); Settings.DOWNLOAD_PROGRESS.save(false);
        oldExternal = Settings.EXTERNAL_DOWNLOADER_PACKAGE.get(); Settings.EXTERNAL_DOWNLOADER_PACKAGE.save("");
        oldDetails = Settings.DOWNLOAD_DETAILS.get(); oldCheck = Settings.CHECK_SAVED_VIDEOS.get();
        oldMuted = Settings.DOWNLOAD_WITHOUT_SOUND.get(); oldAudio = Settings.DOWNLOAD_AUDIO_TRACK.get();
        oldSubtitles = Settings.DOWNLOAD_SUBTITLES.get(); oldPath = Settings.DOWNLOAD_VIDEO_PATH.get();
        oldTemplate = Settings.DOWNLOAD_VIDEO_FILENAME_TEMPLATE.get(); oldQuality = Settings.DOWNLOAD_VIDEO_QUALITY.get();
        Settings.DOWNLOAD_DETAILS.save(true); Settings.CHECK_SAVED_VIDEOS.save(true);
        Settings.DOWNLOAD_WITHOUT_SOUND.save(false); Settings.DOWNLOAD_AUDIO_TRACK.save(false);
        Settings.DOWNLOAD_SUBTITLES.save(false); Settings.DOWNLOAD_VIDEO_PATH.save(FOLDER);
        Settings.DOWNLOAD_VIDEO_FILENAME_TEMPLATE.save("{creator}/{video_id}");
        Settings.DOWNLOAD_VIDEO_QUALITY.save("auto");
        RuntimeEnvironment.getApplication().deleteDatabase(SavedVideoArchive.DATABASE_NAME);
        Shadows.shadowOf(RuntimeEnvironment.getApplication()).grantPermissions(Manifest.permission.WRITE_EXTERNAL_STORAGE);
        owner = Robolectric.buildActivity(PageActivity.class).setup().visible();
        Utils.setActivity(owner.get());
        root = new File(Environment.getExternalStorageDirectory(), FOLDER);

        // Only the connection returns fixture bytes. Scheduling, copying, publication and SQLite run normally.
        new URL("https://8.8.8.8/video.mp4");
        handlers = ReflectionHelpers.getStaticField(URL.class, "handlers");
        oldHttps = handlers.put("https", new URLStreamHandler() {
            @Override protected URLConnection openConnection(URL url) {
                requests.incrementAndGet();
                return new HttpURLConnection(url) {
                    @Override public int getResponseCode() { return HTTP_OK; }
                    @Override public String getHeaderField(String name) {
                        return "Content-Length".equals(name) ? String.valueOf(VIDEO.length) : null;
                    }
                    @Override public InputStream getInputStream() {
                        return new ByteArrayInputStream(VIDEO) {
                            @Override public synchronized int read(byte[] bytes, int offset, int length) {
                                int count = super.read(bytes, offset, length);
                                if (count < 0 && reachedEnd != null) {
                                    reachedEnd.countDown();
                                    try {
                                        if (!releaseCopy.await(10, TimeUnit.SECONDS)) throw new AssertionError("Copy wasn't released");
                                    } catch (InterruptedException interrupted) {
                                        Thread.currentThread().interrupt();
                                        throw new AssertionError(interrupted);
                                    }
                                }
                                return count;
                            }
                        };
                    }
                    @Override public void connect() { }
                    @Override public void disconnect() { }
                    @Override public boolean usingProxy() { return false; }
                };
            }
        });
    }

    @After public void cleanup() throws Exception {
        try {
            if (releaseCopy != null) releaseCopy.countDown();
            if (ShadowDialog.getLatestDialog() != null) ShadowDialog.getLatestDialog().dismiss();
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            awaitJobs();
            if (owner != null) owner.close();
            Utils.setActivity(null);
            if (root != null && root.isDirectory()) {
                try (var paths = Files.walk(root.toPath())) {
                    for (var path : paths.sorted(java.util.Comparator.reverseOrder()).toList()) Files.delete(path);
                }
            }
            RuntimeEnvironment.getApplication().deleteDatabase(SavedVideoArchive.DATABASE_NAME);
        } finally {
            if (oldHttps != null) handlers.put("https", oldHttps);
            Settings.DOWNLOAD_PROGRESS.save(oldProgress);
            Settings.EXTERNAL_DOWNLOADER_PACKAGE.save(oldExternal);
            Settings.DOWNLOAD_DETAILS.save(oldDetails); Settings.CHECK_SAVED_VIDEOS.save(oldCheck);
            Settings.DOWNLOAD_WITHOUT_SOUND.save(oldMuted); Settings.DOWNLOAD_AUDIO_TRACK.save(oldAudio);
            Settings.DOWNLOAD_SUBTITLES.save(oldSubtitles); Settings.DOWNLOAD_VIDEO_PATH.save(oldPath);
            Settings.DOWNLOAD_VIDEO_FILENAME_TEMPLATE.save(oldTemplate); Settings.DOWNLOAD_VIDEO_QUALITY.save(oldQuality);
        }
    }

    @Test public void aSecondSaveOffersAChoiceAndSaveAgainKeepsBothPairs() throws Exception { repeatSave("dark"); }

    @Test @Config(qualifiers = "w360dp-h800dp-notnight-mdpi")
    public void theSavedVideoChoiceWorksInTheLightTheme() throws Exception { repeatSave("light"); }

    private void repeatSave(String theme) throws Exception {
        Post post = new Post();
        assertTrue(VideoDownloads.start(post, owner.get()));
        awaitJobs();
        File first = new File(root, "alice/123.mp4");
        assertArrayEquals(VIDEO, Files.readAllBytes(first.toPath()));
        String details = new String(Files.readAllBytes(new File(root, "alice/123.txt").toPath()), StandardCharsets.UTF_8);
        assertTrue(details.contains("Caption:\nA saved caption"));
        assertTrue(details.contains("Creator: @alice"));
        assertTrue(details.contains("https://www.tiktok.com/@alice/video/123"));
        assertTrue(details.contains("2023-11-14T22:13:20Z"));
        assertEquals(1, requests.get());
        // A prior screen can leave the shared palette on the opposite theme.
        Utils.setIsDarkModeEnabled(!theme.equals("dark"));
        assertTrue(VideoDownloads.start(post, owner.get()));
        awaitJobs();
        AlertDialog choice = (AlertDialog) ShadowDialog.getLatestDialog();
        assertTrue(choice.isShowing());
        assertEquals("Open", choice.getButton(AlertDialog.BUTTON_NEGATIVE).getText().toString());
        assertEquals("Save again", choice.getButton(AlertDialog.BUTTON_POSITIVE).getText().toString());
        assertEquals("The dialog retained another screen's colors", SettingsUi.accentOn(theme.equals("dark")),
                choice.getButton(AlertDialog.BUTTON_POSITIVE).getCurrentTextColor());
        assertEquals("The duplicate check fetched another video before asking", 1, requests.get());
        android.view.View dialog = choice.getWindow().getDecorView();
        dialog.measure(android.view.View.MeasureSpec.makeMeasureSpec(360, android.view.View.MeasureSpec.EXACTLY),
                android.view.View.MeasureSpec.makeMeasureSpec(800, android.view.View.MeasureSpec.AT_MOST));
        UiCapture.save(dialog, "pages/downloads/already-saved-" + theme + ".png", 360, dialog.getMeasuredHeight());
        choice.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        awaitJobs();
        assertEquals(2, requests.get());
        assertArrayEquals(VIDEO, Files.readAllBytes(new File(root, "alice/123_2.mp4").toPath()));
        assertEquals(details, new String(Files.readAllBytes(new File(root, "alice/123_2.txt").toPath()), StandardCharsets.UTF_8));
        assertEquals("123_2.mp4", SavedVideoArchive.find(owner.get(), "123").name);
    }

    @Test public void deletingTheRememberedFileAllowsANewSave() throws Exception {
        assertTrue(VideoDownloads.start(new Post(), owner.get()));
        awaitJobs();
        assertTrue(new File(root, "alice/123.mp4").delete());
        assertNull(SavedVideoArchive.find(owner.get(), "123"));
        assertTrue(VideoDownloads.start(new Post(), owner.get()));
        awaitJobs();
        assertEquals(2, requests.get());
        assertTrue(new File(root, "alice/123.mp4").isFile());
    }

    @Test public void aSavedFileIsOfferedEvenWhenThePostHasLostItsDownloadSource() throws Exception {
        assertTrue(VideoDownloads.start(new Post(), owner.get()));
        awaitJobs();
        File first = new File(root, "alice/123.mp4");
        Post unavailable = new Post();
        unavailable.video = null;
        assertTrue(VideoDownloads.start(unavailable, owner.get()));
        awaitJobs();
        AlertDialog choice = (AlertDialog) ShadowDialog.getLatestDialog();
        assertNotNull("A missing download source hid the existing file", choice);
        assertTrue(choice.isShowing());
        assertEquals("Open", choice.getButton(AlertDialog.BUTTON_NEGATIVE).getText().toString());
        assertEquals(1, requests.get());

        choice.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        awaitJobs();
        assertEquals("This video isn't available as a complete file. Try again later.",
                org.robolectric.shadows.ShadowToast.getTextOfLatestToast());
        assertEquals(1, requests.get());
        assertArrayEquals(VIDEO, Files.readAllBytes(first.toPath()));
        assertEquals("123.mp4", SavedVideoArchive.find(owner.get(), "123").name);

        // Refusing Save again must release this post so the saved file remains reachable.
        assertTrue(VideoDownloads.start(unavailable, owner.get()));
        awaitJobs();
        assertNotSame(choice, ShadowDialog.getLatestDialog());
        assertTrue(ShadowDialog.getLatestDialog().isShowing());
    }

    @Test public void openUsesTheSavedUriAndCancelReleasesThePendingSave() throws Exception {
        AtomicInteger again = new AtomicInteger(), released = new AtomicInteger();
        Uri uri = Uri.parse("content://media/external/video/media/77");
        SavedVideoArchive.offer(new MediaFileWriter.Saved("video.mp4", uri), again::incrementAndGet, released::incrementAndGet);
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        ((AlertDialog) ShadowDialog.getLatestDialog()).getButton(AlertDialog.BUTTON_NEGATIVE).performClick();
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        Intent opened = Shadows.shadowOf(owner.get()).getNextStartedActivity();
        assertEquals(Intent.ACTION_VIEW, opened.getAction());
        assertEquals(uri, opened.getData());
        assertNotEquals(0, opened.getFlags() & Intent.FLAG_GRANT_READ_URI_PERMISSION);
        assertEquals(0, again.get());
        assertEquals(1, released.get());
        SavedVideoArchive.offer(new MediaFileWriter.Saved("video.mp4", uri), again::incrementAndGet, released::incrementAndGet);
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        ((AlertDialog) ShadowDialog.getLatestDialog()).getButton(AlertDialog.BUTTON_NEUTRAL).performClick();
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertEquals(0, again.get());
        assertEquals(2, released.get());
    }

    @Test public void disablingTheOptionsLeavesAutomaticSavingWithTikTok() {
        Settings.DOWNLOAD_DETAILS.save(false); Settings.CHECK_SAVED_VIDEOS.save(false);
        Settings.DOWNLOAD_VIDEO_FILENAME_TEMPLATE.save("{creator}_{date}_{video_id}");
        assertFalse(VideoDownloads.start(new Post(), owner.get()));
        assertEquals(0, requests.get());
        assertFalse(RuntimeEnvironment.getApplication().getDatabasePath(SavedVideoArchive.DATABASE_NAME).exists());
    }

    @Test public void progressAloneUsesTheOwnedSaveAndFinishesAfterTheFileIsPublished() throws Exception {
        Settings.DOWNLOAD_DETAILS.save(false); Settings.CHECK_SAVED_VIDEOS.save(false);
        Settings.DOWNLOAD_PROGRESS.save(true);
        reachedEnd = new java.util.concurrent.CountDownLatch(1);
        releaseCopy = new java.util.concurrent.CountDownLatch(1);
        SaveNotice.windowRootsForTests = List.of();
        try {
            assertTrue(OriginalPhotos.start(new Post(), owner.get()));
            assertTrue("The save never reached the copy", reachedEnd.await(10, TimeUnit.SECONDS));
            Shadows.shadowOf(Looper.getMainLooper()).idleFor(SaveNotice.SHEET_SETTLE_MS + 1, TimeUnit.MILLISECONDS);
            android.view.ViewGroup row = owner.get().findViewById(android.R.id.content)
                    .findViewWithTag("hushfeed_save_progress");
            assertNotNull("Automatic must show progress when the switch alone is on", row);
            android.view.ViewGroup body = (android.view.ViewGroup) row.getChildAt(0);
            android.widget.ProgressBar bar = (android.widget.ProgressBar) body.getChildAt(1);
            assertFalse(bar.isIndeterminate());
            assertEquals("A file isn't complete before publication", 99, bar.getProgress());
            assertFalse(new File(root, "alice/123.mp4").exists());
            releaseCopy.countDown();
            awaitJobs();
            assertArrayEquals(VIDEO, Files.readAllBytes(new File(root, "alice/123.mp4").toPath()));
            assertNull(owner.get().findViewById(android.R.id.content).findViewWithTag("hushfeed_save_progress"));
            assertFalse(RuntimeEnvironment.getApplication().getDatabasePath(SavedVideoArchive.DATABASE_NAME).exists());
        } finally {
            releaseCopy.countDown();
            awaitJobs();
            SaveNotice.windowRootsForTests = null;
        }
    }

    /**
     * A post opened from a profile or search plays in an activity of its own. The choice used to
     * be built on the main activity behind it, a stopped window, so it never showed and the
     * pending save stayed held.
     */
    @Test public void theChoiceOpensOnTheScreenInFront() {
        try (var detail = Robolectric.buildActivity(
                com.ss.android.ugc.aweme.detail.ui.DetailActivity.class).setup().visible()) {
            SavedVideoArchive.offer(new MediaFileWriter.Saved("video.mp4",
                    Uri.parse("content://media/external/video/media/77")), () -> { }, () -> { });
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            android.app.Dialog dialog = ShadowDialog.getLatestDialog();
            android.content.Context context = dialog.getContext();
            while (context instanceof android.content.ContextWrapper && !(context instanceof android.app.Activity)) {
                context = ((android.content.ContextWrapper) context).getBaseContext();
            }
            assertSame(detail.get(), context);
            dialog.dismiss();
        }
    }

    @Test public void closingTheActivityReleasesThePendingChoice() {
        AtomicInteger released = new AtomicInteger();
        SavedVideoArchive.offer(new MediaFileWriter.Saved("video.mp4", Uri.parse("content://media/external/video/media/77")),
                () -> fail("Closing the activity must not start another save"), released::incrementAndGet);
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        owner.close();
        owner = null;
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertEquals(1, released.get());
    }

    @Test public void theArchivePrunesOldRowsAfterAReportedSave() throws Exception {
        File video = new File(RuntimeEnvironment.getApplication().getCacheDir(), "archive-limit.mp4");
        Files.write(video.toPath(), VIDEO);
        try {
            SavedVideoArchive.remember(owner.get(), "initial", new MediaFileWriter.Saved(video.getName(), null, video),
                    SavedVideoArchive.generation());
            try (var db = owner.get().openOrCreateDatabase(SavedVideoArchive.DATABASE_NAME, 0, null)) {
                db.beginTransaction();
                try {
                    for (int i = 0; i < 10000; i++) db.execSQL(
                            "INSERT INTO saved_videos(aid,name,uri,path,saved_at) VALUES(?,?,?, ?,?)",
                            new Object[]{"old-" + i, "old.mp4", "", "", 0});
                    db.setTransactionSuccessful();
                } finally { db.endTransaction(); }
            }
            SavedVideoArchive.remember(owner.get(), "newest", new MediaFileWriter.Saved(video.getName(), null, video),
                    SavedVideoArchive.generation());
            try (var db = owner.get().openOrCreateDatabase(SavedVideoArchive.DATABASE_NAME, 0, null);
                 var count = db.rawQuery("SELECT COUNT(*) FROM saved_videos", null)) {
                assertTrue(count.moveToFirst());
                assertEquals(10000, count.getInt(0));
            }
            assertNotNull(SavedVideoArchive.find(owner.get(), "newest"));
        } finally { assertTrue(video.delete()); }
    }

    /**
     * A video save that has to wait shows its row the moment it is taken, a second request is
     * told it is waiting, Cancel on the row lets the video go without fetching anything, and
     * asking again is taken and saves.
     */
    @Test public void aWaitingVideoShowsItsRowAtOnceAndCancelLetsItGo() throws Exception {
        Settings.DOWNLOAD_DETAILS.save(false); Settings.CHECK_SAVED_VIDEOS.save(false);
        Settings.DOWNLOAD_PROGRESS.save(true);
        SaveNotice.windowRootsForTests = List.of();
        java.util.concurrent.CountDownLatch hold = holdMediaQueue(0);
        try {
            ShadowToast.reset();
            assertTrue(VideoDownloads.start(new Post(), owner.get()));
            Shadows.shadowOf(Looper.getMainLooper()).idleFor(SaveNotice.SHEET_SETTLE_MS + 1, TimeUnit.MILLISECONDS);
            assertEquals("the row stands for the wait, so there's no toast beside it", 0, ShadowToast.shownToastCount());
            android.view.ViewGroup content = owner.get().findViewById(android.R.id.content);
            android.view.View row = content.findViewWithTag("hushfeed_save_progress");
            assertNotNull("a waiting video showed no row", row);
            assertEquals("Waiting to save video", labelOf(row));

            assertTrue(VideoDownloads.start(new Post(), owner.get()));
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            assertEquals("The last one is still waiting to start", ShadowToast.getTextOfLatestToast());
            assertEquals("a second request queued a second save", 1, MediaJobScheduler.queuedJobs());

            cancelOf(row).performClick();
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            assertEquals("Save cancelled. Nothing was saved.", ShadowToast.getTextOfLatestToast());
            assertNull(content.findViewWithTag("hushfeed_save_progress"));
            assertEquals(0, MediaJobScheduler.queuedJobs());

            assertTrue("the video was still held after Cancel", VideoDownloads.start(new Post(), owner.get()));
            hold.countDown();
            awaitJobs();
            assertEquals("the cancelled save fetched, or the retry didn't", 1, requests.get());
            assertArrayEquals(VIDEO, Files.readAllBytes(new File(root, "alice/123.mp4").toPath()));
            assertNull(content.findViewWithTag("hushfeed_save_progress"));
        } finally {
            hold.countDown();
            SaveNotice.windowRootsForTests = null;
        }
    }

    /**
     * The already-saved choice is part of the save it came from: a second request while it is
     * open is told so, and a Save again that the full queue refuses lets the video go, so the
     * next request asks again instead of calling it busy for good.
     */
    @Test public void theChoiceIsOneSaveUntilItIsAnswered() throws Exception {
        Post post = new Post();
        assertTrue(VideoDownloads.start(post, owner.get()));
        awaitJobs();
        assertTrue(VideoDownloads.start(post, owner.get()));
        awaitJobs();
        AlertDialog choice = (AlertDialog) ShadowDialog.getLatestDialog();
        assertTrue(choice.isShowing());

        ShadowToast.reset();
        assertTrue(VideoDownloads.start(post, owner.get()));
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertEquals("The saved-video choice is still open", ShadowToast.getTextOfLatestToast());
        assertSame("a second choice opened over the first", choice, ShadowDialog.getLatestDialog());
        assertEquals(0, MediaJobScheduler.queuedJobs() + MediaJobScheduler.runningJobs());

        java.util.concurrent.CountDownLatch hold = holdMediaQueue(MediaJobScheduler.MAX_QUEUED_JOBS);
        try {
            choice.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            assertEquals("Too many media saves are already running. Try again in a moment.",
                    ShadowToast.getTextOfLatestToast());
            assertFalse(choice.isShowing());
        } finally {
            hold.countDown();
        }
        awaitJobs();
        assertEquals("the refused Save again fetched", 1, requests.get());

        assertTrue(VideoDownloads.start(post, owner.get()));
        awaitJobs();
        assertNotSame("the video stayed held after the refusal", choice, ShadowDialog.getLatestDialog());
        assertTrue(ShadowDialog.getLatestDialog().isShowing());
    }

    /** Closing the screen under the choice ends that save, so the video can be asked for again. */
    @Test public void closingTheScreenUnderTheChoiceLetsTheVideoGo() throws Exception {
        Post post = new Post();
        assertTrue(VideoDownloads.start(post, owner.get()));
        awaitJobs();
        assertTrue(VideoDownloads.start(post, owner.get()));
        awaitJobs();
        AlertDialog choice = (AlertDialog) ShadowDialog.getLatestDialog();
        assertTrue(choice.isShowing());

        owner.close();
        owner = Robolectric.buildActivity(PageActivity.class).setup().visible();
        Utils.setActivity(owner.get());
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertFalse(choice.isShowing());

        ShadowToast.reset();
        assertTrue(VideoDownloads.start(post, owner.get()));
        awaitJobs();
        assertNotEquals("the closed choice kept the video held", "The saved-video choice is still open",
                ShadowToast.getTextOfLatestToast());
        assertNotSame(choice, ShadowDialog.getLatestDialog());
        assertTrue(ShadowDialog.getLatestDialog().isShowing());
        assertEquals(1, requests.get());
    }

    /** A save the full queue refuses leaves no row, no hold and no stray word behind the refusal. */
    @Test public void aRefusedVideoLeavesNothingBehind() throws Exception {
        Settings.DOWNLOAD_PROGRESS.save(true);
        SaveNotice.windowRootsForTests = List.of();
        java.util.concurrent.CountDownLatch hold = holdMediaQueue(MediaJobScheduler.MAX_QUEUED_JOBS);
        try {
            ShadowToast.reset();
            assertTrue("details are asked for, so TikTok's own save must not run instead",
                    VideoDownloads.start(new Post(), owner.get()));
            Shadows.shadowOf(Looper.getMainLooper()).idleFor(SaveNotice.SHEET_SETTLE_MS + 1, TimeUnit.MILLISECONDS);
            assertEquals(1, ShadowToast.shownToastCount());
            assertEquals("Too many media saves are already running. Try again in a moment.",
                    ShadowToast.getTextOfLatestToast());
            assertNull("a refused save left a row", owner.get().findViewById(android.R.id.content)
                    .findViewWithTag("hushfeed_save_progress"));
        } finally {
            hold.countDown();
            SaveNotice.windowRootsForTests = null;
        }
        awaitJobs();
        assertEquals(0, requests.get());
        assertTrue(VideoDownloads.start(new Post(), owner.get()));
        awaitJobs();
        assertEquals("the refused video stayed held", 1, requests.get());
        assertArrayEquals(VIDEO, Files.readAllBytes(new File(root, "alice/123.mp4").toPath()));
    }

    /**
     * Holds all three media workers and fills {@code queued} waiting places behind them, all
     * until the returned latch opens.
     */
    private static java.util.concurrent.CountDownLatch holdMediaQueue(int queued) throws Exception {
        awaitJobs();
        java.util.concurrent.CountDownLatch hold = new java.util.concurrent.CountDownLatch(1);
        java.util.concurrent.CountDownLatch started =
                new java.util.concurrent.CountDownLatch(MediaJobScheduler.MAX_RUNNING_JOBS);
        Runnable held = () -> {
            started.countDown();
            try {
                hold.await(10, TimeUnit.SECONDS);
            } catch (InterruptedException interrupted) {
                Thread.currentThread().interrupt();
            }
        };
        for (int index = 0; index < MediaJobScheduler.MAX_RUNNING_JOBS; index++) {
            assertTrue(MediaJobScheduler.submit("archive test hold", held));
        }
        assertTrue("the media workers never started", started.await(5, TimeUnit.SECONDS));
        for (int index = 0; index < queued; index++) {
            assertTrue(MediaJobScheduler.submit("archive test filler", () -> { }));
        }
        return hold;
    }

    private static String labelOf(android.view.View row) {
        android.view.View first = ((android.view.ViewGroup) row).getChildAt(0);
        if (first instanceof android.view.ViewGroup) first = ((android.view.ViewGroup) first).getChildAt(0);
        return ((android.widget.TextView) first).getText().toString();
    }

    private static android.view.View cancelOf(android.view.View row) {
        android.view.ViewGroup group = (android.view.ViewGroup) row;
        return group.getChildAt(group.getChildCount() - 1);
    }

    private static void awaitJobs() throws InterruptedException {
        long end = System.nanoTime() + TimeUnit.SECONDS.toNanos(10);
        do {
            Thread.sleep(10);
            assertTrue("Save didn't finish", System.nanoTime() < end);
        } while (MediaJobScheduler.runningJobs() != 0 || MediaJobScheduler.queuedJobs() != 0);
        Shadows.shadowOf(Looper.getMainLooper()).idle();
    }

    /** With only the progress row asked for, a video Hushfeed can't fetch goes back to TikTok. */
    @Test public void progressAloneLeavesAnUnavailableVideoToTikTok() {
        Settings.DOWNLOAD_DETAILS.save(false); Settings.CHECK_SAVED_VIDEOS.save(false);
        Settings.DOWNLOAD_PROGRESS.save(true);
        assertFalse("progress alone refused a save TikTok could still make",
                VideoDownloads.start(new BarePost(), owner.get()));
        assertEquals(0, requests.get());
    }

    /** A post whose video model offers no address Hushfeed can fetch. */
    public static final class BarePost extends DownloadDetailsTest.Post {
        BarePost() { super("alice", "124"); }
        public Object getVideo() { return new Object(); }
    }

    /** Taken over for its details or progress, Automatic keeps the watermark the switch asks for. */
    @Test public void automaticKeepsTheWatermarkSwitchsChoice() {
        boolean before = Settings.REMOVE_DOWNLOAD_WATERMARK.get();
        try {
            Settings.REMOVE_DOWNLOAD_WATERMARK.save(false);
            assertEquals(List.of("https://8.8.8.8/stamped.mp4"), VideoDownloads.automaticUrls(new BothAddresses()));
            Settings.REMOVE_DOWNLOAD_WATERMARK.save(true);
            assertEquals(List.of("https://8.8.8.8/clean.mp4"), VideoDownloads.automaticUrls(new BothAddresses()));
        } finally {
            Settings.REMOVE_DOWNLOAD_WATERMARK.save(before);
        }
    }

    public static final class BothAddresses {
        public UrlList getDownloadAddr() { return new UrlList("https://8.8.8.8/stamped.mp4"); }
        public UrlList getDownloadNoWatermarkAddr() { return new UrlList("https://8.8.8.8/clean.mp4"); }
    }

    public static final class UrlList {
        private final String url;
        UrlList(String url) { this.url = url; }
        public List<String> getUrlList() { return List.of(url); }
    }

    public static final class Post extends DownloadDetailsTest.Post {
        public Video video = new Video();
        Post() { super("alice", "123"); desc = "A saved caption"; }
        public Video getVideo() { return video; }
    }
    public static final class Video {
        public Address getDownloadNoWatermarkAddr() { return new Address(); }
    }
    public static final class Address {
        public List<String> getUrlList() { return List.of("https://8.8.8.8/video.mp4"); }
    }
}
