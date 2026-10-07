/*
 * Forked from https://github.com/SysAdminDoc/HushGram at 539b646 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.extension.hushthreads.download;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.ContentUris;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;
import android.os.Looper;
import android.provider.MediaStore;

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
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.shadow.api.Shadow;
import org.robolectric.shadows.ShadowToast;
import org.robolectric.util.ReflectionHelpers.ClassParameter;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.OutputStream;
import java.lang.reflect.Proxy;
import java.net.InetAddress;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

import app.morphe.extension.hushthreads.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.preference.LogBufferManager;

/** Batch ownership, ordered real transfers, snapshots and cleanup were absent from single-save coverage. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, shadows = {CarouselSaveTest.LocalCandidates.class})
public class CarouselSaveTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    private Context context;
    private LocalServer server;
    private MediaSaveTest.Gallery gallery;
    private final CountDownLatch release = new CountDownLatch(1);
    private final List<ByteArrayOutputStream> files = new ArrayList<>();

    @Before public void setUp() throws Exception {
        context = RuntimeEnvironment.getApplication();
        context.getApplicationInfo().targetSdkVersion = 36;
        server = new LocalServer();
        LocalCandidates.origin = server.origin();
        MediaSave.policyForTests = new MediaUrlPolicy(host -> new InetAddress[]{InetAddress.getByName("10.9.8.7")}) {
            @Override Refusal refusal(URL url) {
                return url.toString().startsWith(server.origin() + "/") ? null : super.refusal(url);
            }
        };
        gallery = Robolectric.setupContentProvider(MediaSaveTest.Gallery.class, MediaStore.AUTHORITY);
        for (int id = 1; id <= 4; id++) {
            ByteArrayOutputStream bytes = new ByteArrayOutputStream();
            files.add(bytes);
            Shadows.shadowOf(context.getContentResolver()).registerOutputStream(gallery.videoUri(id), bytes);
            Shadows.shadowOf(context.getContentResolver()).registerOutputStream(
                    ContentUris.withAppendedId(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, id), bytes);
        }
        SaveLeftovers.forgetSweepForTests();
        LogBufferManager.clearLogBuffer();
    }

    @After public void tearDown() throws Exception {
        release.countDown();
        for (SaveControl.Running save : SaveControl.running()) SaveControl.cancel(save.id);
        SavesForTests.endAll();
        waitForSaves();
        server.close();
        MediaSave.policyForTests = null;
        MediaSave.detailsForTests = null;
        Downloader.readTimeoutMs = 20_000;
        SaveSettings.DOWNLOAD_QUALITY.resetToDefault();
        Settings.DOWNLOAD_COMPATIBLE.resetToDefault();
        Utils.awaitBackgroundTasksForTests();
        SaveLeftovers.forgetSweepForTests();
        LogBufferManager.clearLogBuffer();
    }

    private static byte[] body(boolean video) {
        byte[] bytes = new byte[4096];
        byte[] head = video ? new byte[]{0, 0, 0, 24, 'f', 't', 'y', 'p', 'm', 'p', '4', '2'}
                : new byte[]{(byte) 0xff, (byte) 0xd8, (byte) 0xff, (byte) 0xe0};
        System.arraycopy(head, 0, bytes, 0, head.length);
        return bytes;
    }

    private MediaSave.Item page(boolean video, String path, String id) {
        server.serve(path, video ? "video/mp4" : "image/jpeg", body(video));
        return new MediaSave.Item(video, SavesForTests.renditions(server.origin() + path), null, PostDetails.of(id));
    }

    private void waitForSaves() throws Exception {
        long deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(20);
        while (MediaSave.savesInFlight() != 0) {
            assertTrue("the save never ended", System.nanoTime() < deadline);
            Thread.sleep(10);
        }
        Shadows.shadowOf(Looper.getMainLooper()).idle();
    }

    private void assertClean() {
        assertTrue("a pending row survived", context.getSharedPreferences("hushthreads_saves", 0)
                .getStringSet("pending_rows", new HashSet<>()).isEmpty());
        assertTrue("a logical job survived", active().isEmpty());
        File[] work = DashSave.workFolder(context).listFiles();
        assertNotNull(work);
        assertEquals("temporary files survived", 0, work.length);
        assertTrue("Cancel outlived the batch", SaveControl.running().isEmpty());
    }

    private Set<String> active() {
        return new HashSet<>(context.getSharedPreferences("hushthreads_saves", 0)
                .getStringSet("active_jobs", new HashSet<>()));
    }

    @Test public void aMixedBatchPreservesOrderSnapshotsAndQuality() throws Exception {
        MediaSave.Item first = page(false, "/first.jpg", "101");
        MediaSave.Item last = page(false, "/last.jpg", "103");
        server.serve("/720.mp4", "video/mp4", body(true));
        server.serve("/1080.mp4", "video/mp4", body(true));
        List<MediaSave.Rendition> video = new ArrayList<>(Arrays.asList(
                new MediaSave.Rendition(server.origin() + "/1080.mp4", 1080, 1920, 0),
                new MediaSave.Rendition(server.origin() + "/720.mp4", 720, 1280, 0)));
        MediaSave.Item middle = new MediaSave.Item(true, video, null, PostDetails.of("102"));
        List<MediaSave.Item> pages = new ArrayList<>(Arrays.asList(first, middle, last));
        SaveSettings.DOWNLOAD_QUALITY.save(DownloadQuality.P720);
        List<String> order = Collections.synchronizedList(new ArrayList<>());
        List<Integer> controls = Collections.synchronizedList(new ArrayList<>());
        CountDownLatch entered = new CountDownLatch(1);
        MediaSave.detailsForTests = details -> {
            assertEquals("a nested logical job was created", 1, active().size());
            assertEquals("a nested in-flight slot was created", 1, MediaSave.savesInFlight());
            order.add(details.videoId);
            controls.add(SaveControl.running().get(0).id);
            if (order.size() == 1) { entered.countDown(); await(release); }
        };
        CompletableFuture<MediaSave.BatchResult> ended = new CompletableFuture<>();
        assertTrue(MediaSave.saveBatch(context, pages, ended::complete));
        assertTrue(entered.await(10, TimeUnit.SECONDS));
        pages.clear(); video.clear();
        SaveSettings.DOWNLOAD_QUALITY.save(DownloadQuality.BEST);
        release.countDown();
        MediaSave.BatchResult result = ended.get(20, TimeUnit.SECONDS);
        waitForSaves();
        assertEquals(Arrays.asList("101", "102", "103"), order);
        assertEquals(1, new HashSet<>(controls).size());
        assertEquals(3, result.saved); assertEquals(0, result.failed); assertEquals(0, result.skipped);
        assertFalse(result.cancelled);
        assertEquals(1, server.hits("/720.mp4")); assertEquals(0, server.hits("/1080.mp4"));
        assertEquals(Arrays.asList("image/jpeg", "video/mp4", "image/jpeg"), Arrays.asList(
                gallery.rows.get(1L).getAsString(MediaStore.MediaColumns.MIME_TYPE),
                gallery.rows.get(2L).getAsString(MediaStore.MediaColumns.MIME_TYPE),
                gallery.rows.get(3L).getAsString(MediaStore.MediaColumns.MIME_TYPE)));
        for (android.content.ContentValues row : gallery.rows.values()) assertEquals(Integer.valueOf(0), row.getAsInteger(MediaStore.MediaColumns.IS_PENDING));
        assertEquals("Saved 3. Failed 0. Skipped 0.", ShadowToast.getTextOfLatestToast());
        assertEquals("Saved 3. Failed 0. Skipped 0.", SaveControl.batchOutcome());
        assertClean();
    }

    @Test public void failedAndDisabledPagesHaveExactCountsAndNoRetry() throws Exception {
        MediaSave.Item first = page(false, "/good.jpg", "1");
        MediaSave.Item broken = new MediaSave.Item(true, SavesForTests.renditions(server.origin() + "/gone.mp4"), null, null);
        CompletableFuture<MediaSave.BatchResult> ended = new CompletableFuture<>();
        assertTrue(MediaSave.saveBatch(context, Arrays.asList(first, broken, null), ended::complete));
        MediaSave.BatchResult result = ended.get(20, TimeUnit.SECONDS);
        waitForSaves();
        assertEquals(1, result.saved); assertEquals(1, result.failed); assertEquals(1, result.skipped);
        assertEquals(1, server.hits("/gone.mp4"));
        assertEquals("Saved 1. Failed 1. Skipped 1.", ShadowToast.getTextOfLatestToast());
        String report = LogBufferManager.buildExportText();
        assertFalse(report, report.contains(server.origin()));
        assertFalse(report, report.contains("/gone.mp4"));
        assertClean();
    }

    @Test public void tooManyPagesAreRejectedAndTheExactLimitIsAccepted() throws Exception {
        assertFalse(MediaSave.saveBatch(context, Collections.nCopies(33, page(true, "/unused.mp4", "1")), null));
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertEquals("Not saved: a carousel can have at most 32 pages", ShadowToast.getTextOfLatestToast());
        assertEquals(0, server.hits("/unused.mp4"));
        assertEquals(0, MediaSave.savesInFlight());
        CompletableFuture<MediaSave.BatchResult> ended = new CompletableFuture<>();
        assertTrue(MediaSave.saveBatch(context, Collections.nCopies(32, null), ended::complete));
        MediaSave.BatchResult result = ended.get(20, TimeUnit.SECONDS);
        assertEquals(32, result.skipped); assertEquals(0, result.saved); assertEquals(0, result.failed);
        assertClean();
    }

    @Test public void oneCancelStopsTheTransferAndAllRemainingPages() throws Exception {
        Downloader.readTimeoutMs = 500;
        MediaSave.Item first = page(false, "/first.jpg", "1");
        MediaSave.Item second = new MediaSave.Item(true, SavesForTests.renditions(server.origin() + "/held.mp4"), null, null);
        MediaSave.Item last = page(false, "/last.jpg", "3");
        server.serveHeld("/held.mp4", "video/mp4", body(true), 256 * 1024, 64 * 1024, release);
        CompletableFuture<MediaSave.BatchResult> ended = new CompletableFuture<>();
        assertTrue(MediaSave.saveBatch(context, Arrays.asList(first, second, last), ended::complete));
        long deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(10);
        SaveControl.Running shown;
        do {
            assertTrue(System.nanoTime() < deadline);
            Thread.sleep(10);
            shown = SaveControl.running().get(0);
        } while (shown.batchPage != 2 || shown.done < 64 * 1024);
        assertEquals("Saving a carousel", SaveControl.title(shown));
        assertTrue(SaveControl.status(shown).startsWith("Page 2 of 3\n"));
        assertEquals(1, active().size());
        assertTrue(SaveControl.cancel(shown.id));
        MediaSave.BatchResult result = ended.get(10, TimeUnit.SECONDS);
        release.countDown();
        waitForSaves();
        assertTrue(result.cancelled);
        assertEquals(1, result.saved); assertEquals(0, result.failed); assertEquals(2, result.skipped);
        assertEquals(0, server.hits("/last.jpg"));
        assertEquals(1, gallery.rows.size());
        assertEquals(Integer.valueOf(0), gallery.rows.get(1L).getAsInteger(MediaStore.MediaColumns.IS_PENDING));
        assertEquals("Carousel cancelled. Saved 1. Failed 0. Skipped 2.", ShadowToast.getTextOfLatestToast());
        assertEquals("Carousel cancelled. Saved 1. Failed 0. Skipped 2.", SaveControl.batchOutcome());
        assertClean();
    }

    @Test public void cancelBeforeCommitRemovesThePendingRowAndKeepsEarlierFiles() throws Exception {
        MediaSave.Item first = page(false, "/first.jpg", "1");
        MediaSave.Item middle = page(true, "/middle.mp4", "2");
        MediaSave.Item last = page(false, "/last.jpg", "3");
        Shadows.shadowOf(context.getContentResolver()).registerOutputStream(gallery.videoUri(2), new OutputStream() {
            @Override public void write(int value) {}
            @Override public void flush() {
                assertEquals(2, gallery.rows.size());
                assertEquals(Integer.valueOf(1), gallery.rows.get(2L).getAsInteger(MediaStore.MediaColumns.IS_PENDING));
                assertTrue(SaveControl.cancel(SaveControl.running().get(0).id));
            }
        });
        CompletableFuture<MediaSave.BatchResult> ended = new CompletableFuture<>();
        assertTrue(MediaSave.saveBatch(context, Arrays.asList(first, middle, last), ended::complete));
        MediaSave.BatchResult result = ended.get(20, TimeUnit.SECONDS);
        assertEquals(1, result.saved); assertEquals(0, result.failed); assertEquals(2, result.skipped);
        assertTrue(result.cancelled); assertEquals(0, server.hits("/last.jpg"));
        assertEquals(1, gallery.rows.size());
        assertTrue(gallery.rows.containsKey(1L));
        assertClean();
    }

    @Test public void aBatchUsesOneSlotAndNeverQueuesPastTheExistingLimit() throws Exception {
        CountDownLatch singles = new CountDownLatch(2);
        List<Thread> workers = new ArrayList<>();
        for (int i = 0; i < 2; i++) workers.add(MediaSave.start(context, true, (writer, progress) -> {
            singles.countDown(); await(release);
            return Downloader.Result.fail(Downloader.Status.CANCELLED, "test ended");
        }));
        assertTrue(singles.await(10, TimeUnit.SECONDS));
        MediaSave.Item held = new MediaSave.Item(true, SavesForTests.renditions(server.origin() + "/held.mp4"), null, null);
        server.serveHeld("/held.mp4", "video/mp4", body(true), 256 * 1024, 64 * 1024, release);
        CompletableFuture<MediaSave.BatchResult> ended = new CompletableFuture<>();
        assertTrue(MediaSave.saveBatch(context, Arrays.asList(held, held), ended::complete));
        assertEquals(3, MediaSave.savesInFlight());
        assertFalse(MediaSave.saveBatch(context, Arrays.asList(held, held), null));
        assertFalse(MediaSave.saveVideo(context, SavesForTests.renditions(server.origin() + "/held.mp4"), null, null));
        release.countDown();
        ended.get(20, TimeUnit.SECONDS);
        for (Thread worker : workers) worker.join(10_000);
        waitForSaves();
        assertEquals("a refused batch was queued", 2, server.hits("/held.mp4"));
        assertClean();
    }

    @Test public void exhaustedPreferenceRetirementDoesNotTurnTheBatchIntoAnInterruption() throws Exception {
        Context wrapped = withRetirementFailure();
        CompletableFuture<MediaSave.BatchResult> ended = new CompletableFuture<>();
        assertTrue(MediaSave.saveBatch(wrapped, Collections.nCopies(3, null), ended::complete));
        assertEquals(3, ended.get(20, TimeUnit.SECONDS).skipped);
        assertTerminalOutcomeSurvivesRetirement();
    }

    @Test public void cancellationSurvivesExhaustedPreferenceRetirementToo() throws Exception {
        CountDownLatch entered = new CountDownLatch(1);
        MediaSave.detailsForTests = details -> { entered.countDown(); await(release); };
        CompletableFuture<MediaSave.BatchResult> ended = new CompletableFuture<>();
        MediaSave.Item first = page(false, "/unused.jpg", "1");
        assertTrue(MediaSave.saveBatch(withRetirementFailure(), Arrays.asList(first, first, first), ended::complete));
        assertTrue(entered.await(10, TimeUnit.SECONDS));
        assertTrue(SaveControl.cancel(SaveControl.running().get(0).id));
        release.countDown();
        MediaSave.BatchResult result = ended.get(20, TimeUnit.SECONDS);
        assertTrue(result.cancelled); assertEquals(3, result.skipped);
        assertEquals(0, result.saved); assertEquals(0, result.failed);
        assertEquals(0, server.hits("/unused.jpg"));
        assertTerminalOutcomeSurvivesRetirement();
    }

    private Context withRetirementFailure() {
        SharedPreferences original = context.getSharedPreferences("hushthreads_saves", 0);
        SharedPreferences faulty = (SharedPreferences) Proxy.newProxyInstance(SharedPreferences.class.getClassLoader(),
                new Class[]{SharedPreferences.class}, (proxy, method, args) -> {
                    Object value = method.invoke(original, args);
                    if (!method.getName().equals("edit")) return value;
                    SharedPreferences.Editor editor = (SharedPreferences.Editor) value;
                    boolean[] retires = {false};
                    return Proxy.newProxyInstance(SharedPreferences.Editor.class.getClassLoader(), new Class[]{SharedPreferences.Editor.class},
                            (wrapped, call, parameters) -> {
                                if (call.getName().equals("remove") && "active_jobs".equals(parameters[0])) retires[0] = true;
                                if (call.getName().equals("commit") && retires[0]) return false;
                                Object answer = call.invoke(editor, parameters);
                                return answer == editor ? wrapped : answer;
                            });
                });
        return new ContextWrapper(context) {
            @Override public Context getApplicationContext() { return this; }
            @Override public SharedPreferences getSharedPreferences(String name, int mode) {
                return name.equals("hushthreads_saves") ? faulty : super.getSharedPreferences(name, mode);
            }
        };
    }

    private void assertTerminalOutcomeSurvivesRetirement() throws Exception {
        assertEquals("nested page markers were persisted", 1, active().size());
        File[] markers = new File(context.getFilesDir(), "hushthreads-save-outcomes").listFiles();
        assertNotNull(markers); assertEquals(1, markers.length);
        assertArrayEquals(new byte[]{1}, java.nio.file.Files.readAllBytes(markers[0].toPath()));
        SaveLeftovers.forgetSweepForTests();
        SaveLeftovers.sweepOnce(context);
        SaveLeftovers.showInterrupted(context);
        Utils.awaitBackgroundTasksForTests();
        assertEquals(0, SaveLeftovers.interruptedCount());
        assertClean();
    }

    @Test public void completeCountsArePublishedBeforeTheRowEndsAndRefusedStartsKeepThem() throws Exception {
        CompletableFuture<String> published = new CompletableFuture<>();
        SaveControl.Watcher watcher = () -> {
            if (SaveControl.batchOutcome() != null && !SaveControl.running().isEmpty()) {
                published.complete(SaveControl.batchOutcome());
            }
        };
        SaveControl.watch(watcher);
        try {
            CompletableFuture<MediaSave.BatchResult> ended = new CompletableFuture<>();
            assertTrue(MediaSave.saveBatch(context, Arrays.asList(null, null), ended::complete));
            ended.get(20, TimeUnit.SECONDS);
            assertEquals("Saved 0. Failed 0. Skipped 2.", published.get(10, TimeUnit.SECONDS));
            assertFalse(MediaSave.saveBatch(context, Collections.emptyList(), null));
            assertFalse(MediaSave.saveBatch(context, Collections.nCopies(33, null), null));
            assertEquals("Saved 0. Failed 0. Skipped 2.", SaveControl.batchOutcome());
            MediaSave.detailsForTests = details -> await(release);
            assertTrue(MediaSave.saveBatch(context, Arrays.asList(page(false, "/held.jpg", "1"), null), null));
            assertNull("a newly admitted carousel retained stale counts", SaveControl.batchOutcome());
            assertCleanAfterRelease();
        } finally {
            SaveControl.unwatch(watcher);
        }
    }

    private void assertCleanAfterRelease() throws Exception {
        release.countDown();
        waitForSaves();
        assertClean();
    }

    @Test @Config(sdk = {28, 37})
    public void theSameNotificationCancelSurvivesEveryPageAndPhase() throws Exception {
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        int id = SavesForTests.beginCarousel(context, 3);
        try {
            PendingIntent cancel = batchNotification(manager, id).actions[0].actionIntent;
            for (int page = 1; page <= 3; page++) {
                SavesForTests.page(id, page, page == 2);
                SavesForTests.transferred(id, 4096, 8192);
                assertBatchNotification(manager, id, page, cancel);
                SavesForTests.joining(id);
                assertBatchNotification(manager, id, page, cancel);
                SavesForTests.saving(id);
                assertBatchNotification(manager, id, page, cancel);
            }
            cancel.send();
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            assertTrue(SavesForTests.cancelled(id));
            assertTrue(SaveControl.running().isEmpty());
        } finally {
            SavesForTests.end(id);
        }
    }

    private static Notification batchNotification(NotificationManager manager, int id) {
        for (android.service.notification.StatusBarNotification shown : manager.getActiveNotifications()) {
            if (SaveControl.TAG.equals(shown.getTag()) && shown.getId() == id) return shown.getNotification();
        }
        throw new AssertionError("the batch notification disappeared");
    }

    private static void assertBatchNotification(NotificationManager manager, int id, int page, PendingIntent cancel) {
        assertEquals(1, manager.getActiveNotifications().length);
        Notification shown = batchNotification(manager, id);
        assertEquals("Saving a carousel", String.valueOf(shown.extras.getCharSequence(Notification.EXTRA_TITLE)));
        assertTrue(String.valueOf(shown.extras.getCharSequence(Notification.EXTRA_TEXT)).startsWith("Page " + page + " of 3\n"));
        assertEquals(1, shown.actions.length);
        assertEquals(cancel, shown.actions[0].actionIntent);
        assertEquals(id, SaveControl.running().get(0).id);
    }

    private static void await(CountDownLatch latch) {
        try { if (!latch.await(10, TimeUnit.SECONDS)) throw new IllegalStateException("test release timed out"); }
        catch (InterruptedException failure) { throw new IllegalStateException(failure); }
    }

    /** Only this suite admits its loopback candidates; production URL checks and other suites stay intact. */
    @Implements(value = MediaUrlPolicy.class, isInAndroidSdk = false)
    public static class LocalCandidates {
        static String origin;
        @Implementation protected static String shapeRefusal(String url) {
            return url != null && url.startsWith(origin + "/") ? null
                    : Shadow.directlyOn(MediaUrlPolicy.class, "shapeRefusal", ClassParameter.from(String.class, url));
        }
    }
}
