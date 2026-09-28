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
            SavedVideoArchive.remember(owner.get(), "initial", new MediaFileWriter.Saved(video.getName(), null, video));
            try (var db = owner.get().openOrCreateDatabase(SavedVideoArchive.DATABASE_NAME, 0, null)) {
                db.beginTransaction();
                try {
                    for (int i = 0; i < 10000; i++) db.execSQL(
                            "INSERT INTO saved_videos(aid,name,uri,path,saved_at) VALUES(?,?,?, ?,?)",
                            new Object[]{"old-" + i, "old.mp4", "", "", 0});
                    db.setTransactionSuccessful();
                } finally { db.endTransaction(); }
            }
            SavedVideoArchive.remember(owner.get(), "newest", new MediaFileWriter.Saved(video.getName(), null, video));
            try (var db = owner.get().openOrCreateDatabase(SavedVideoArchive.DATABASE_NAME, 0, null);
                 var count = db.rawQuery("SELECT COUNT(*) FROM saved_videos", null)) {
                assertTrue(count.moveToFirst());
                assertEquals(10000, count.getInt(0));
            }
            assertNotNull(SavedVideoArchive.find(owner.get(), "newest"));
        } finally { assertTrue(video.delete()); }
    }

    private static void awaitJobs() throws InterruptedException {
        long end = System.nanoTime() + TimeUnit.SECONDS.toNanos(10);
        do {
            Thread.sleep(10);
            assertTrue("Save didn't finish", System.nanoTime() < end);
        } while (MediaJobScheduler.runningJobs() != 0 || MediaJobScheduler.queuedJobs() != 0);
        Shadows.shadowOf(Looper.getMainLooper()).idle();
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
