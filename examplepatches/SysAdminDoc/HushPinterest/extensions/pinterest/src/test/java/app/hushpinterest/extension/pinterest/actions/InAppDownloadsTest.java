/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.actions;

import static org.junit.Assert.*;

import android.app.Application;
import android.app.DownloadManager;
import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.media.MediaFormat;
import android.net.ConnectivityManager;
import android.net.NetworkCapabilities;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
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
import org.robolectric.shadow.api.Shadow;
import org.robolectric.shadows.ShadowDownloadManager;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowMediaExtractor;
import org.robolectric.shadows.ShadowNetworkCapabilities;
import org.robolectric.shadows.ShadowToast;
import org.robolectric.shadows.util.DataSource;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.EnumSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;
import java.util.function.Consumer;

import app.hushpinterest.extension.pinterest.settings.PatchFamily;
import app.hushpinterest.extension.pinterest.settings.PatchFamilyForTests;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.settings.PauseForTests;

/** #27 and #29: a request Android's Downloads holds back is saved by HushPinterest instead. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, shadows = DownloadLedgerTest.NativeDownloads.class)
public class InAppDownloadsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    private static final String SOURCE = "https://i.pinimg.com/originals/0b/b2/5b/0bb25b05de960e1fee5da5e9c4e8f12e.jpg";
    private static final byte[] PICTURE = "a real picture's bytes".getBytes(java.nio.charset.StandardCharsets.UTF_8);
    private Application app;
    private DownloadManager manager;
    private DownloadLedgerTest.NativeDownloads nativeJobs;
    private MediaStoreForTests media;
    private final List<String> asked = new ArrayList<>();
    private final AtomicInteger answer = new AtomicInteger(200);

    @Before public void prepare() {
        app = RuntimeEnvironment.getApplication();
        ShadowDownloadManager.reset();
        manager = (DownloadManager) app.getSystemService(Context.DOWNLOAD_SERVICE);
        nativeJobs = Shadow.extract(manager);
        preferences().edit().clear().commit();
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.PIN_DOWNLOADS));
        PauseForTests.resume();
        Settings.DOWNLOAD_PINS.save(true);
        media = Robolectric.setupContentProvider(MediaStoreForTests.class, MediaStore.AUTHORITY);
        network(NetworkCapabilities.NET_CAPABILITY_INTERNET, NetworkCapabilities.NET_CAPABILITY_NOT_METERED,
                NetworkCapabilities.NET_CAPABILITY_NOT_ROAMING);
        AtomicLong now = new AtomicLong(1_000_000L);
        InAppDownloads.clock = now::get;
        InAppDownloads.connection = uri -> {
            asked.add(uri.toString());
            return new FileHostForTests.Answer(uri.toURL(), answer.get(), new FileHostForTests.Body(PICTURE))
                    .header("Content-Type", "image/jpeg").header("Content-Length", String.valueOf(PICTURE.length));
        };
    }

    @After public void reset() throws Exception {
        InAppDownloads.awaitStreamsForTests();
        settle();
        InAppDownloads.forgetForTests();
        Settings.DOWNLOAD_PINS.save(false);
        Settings.DOWNLOAD_UNMETERED_ONLY.save(false);
        Settings.SAVE_IN_PINTEREST_FOLDER.save(false);
        PatchFamilyForTests.capabilities(null);
        PauseForTests.resume();
    }

    @Test public void aRequestAndroidNeverStartsIsSavedInTheSameFolderUnderTheSameName() throws Exception {
        long id = queued("111", null);
        // Within the grace Android gets, nothing changes.
        ShadowLooper.idleMainLooper(InAppDownloads.GRACE_MS - 1, TimeUnit.MILLISECONDS);
        settle();
        assertEquals(0, nativeJobs.removes);
        assertTrue(media.entries.isEmpty());

        ShadowLooper.idleMainLooper(1, TimeUnit.MILLISECONDS);
        settle();
        assertNull(nativeJobs.getRequest(id));
        assertEquals(Arrays.asList(SOURCE), asked);
        assertEquals(1, media.entries.size());
        Uri entry = media.entries.keySet().iterator().next();
        assertTrue(entry.toString(), entry.toString().startsWith("content://media/external_primary/downloads/"));
        ContentValues values = media.entries.get(entry);
        assertEquals("Pinterest_111_1.jpg", values.getAsString(MediaStore.MediaColumns.DISPLAY_NAME));
        assertEquals("Download/", values.getAsString(MediaStore.MediaColumns.RELATIVE_PATH));
        assertEquals("image/jpeg", values.getAsString(MediaStore.MediaColumns.MIME_TYPE));
        assertEquals(0, (int) values.getAsInteger(MediaStore.MediaColumns.IS_PENDING));
        assertArrayEquals(PICTURE, Files.readAllBytes(media.file(entry).toPath()));
        assertEquals("Saved in Download.", ShadowToast.getTextOfLatestToast());

        DownloadLedger.Job job = new DownloadLedger(app).reconcile().get(0);
        assertEquals(id, job.id);
        assertEquals(DownloadLedger.State.COMPLETED, job.state);
        assertTrue(job.canOpen());
        assertTrue(job.canSetAs());
        assertEquals("Check Downloads for the saved file.", job.reasonText());
        assertTrue(DownloadLedger.downloadedPinIds(app).contains("111"));
        // The saved line names only the entry written, never the media host's address.
        String saved = preferences().getString(DownloadLedger.SAVED, "");
        assertEquals(id + ",COMPLETED,image/jpeg," + entry + "\n", saved);

        assertTrue(DownloadLedger.openFile(app, job));
        settle();
        Intent view = Shadows.shadowOf(app).getNextStartedActivity();
        assertEquals(Intent.ACTION_VIEW, view.getAction());
        assertEquals(entry, view.getData());
        assertEquals("image/jpeg", view.getType());
        assertEquals(Intent.FLAG_GRANT_READ_URI_PERMISSION, view.getFlags() & Intent.FLAG_GRANT_READ_URI_PERMISSION);

        // Deleted in a gallery app, it isn't handed to another app.
        media.entries.remove(entry);
        assertTrue(DownloadLedger.openFile(app, job));
        settle();
        assertNull(Shadows.shadowOf(app).getNextStartedActivity());
        assertEquals("This download isn't a saved file anymore. Check Downloads.", ShadowToast.getTextOfLatestToast());
    }

    @Test public void aPinterestFolderSaveGoesToPicturesThroughTheImagesCollection() throws Exception {
        long id = queued("222", DownloadFolder.PINTEREST);
        ShadowLooper.idleMainLooper(InAppDownloads.GRACE_MS, TimeUnit.MILLISECONDS);
        settle();
        assertNull(nativeJobs.getRequest(id));
        Uri entry = media.entries.keySet().iterator().next();
        assertTrue(entry.toString(), entry.toString().startsWith("content://media/external_primary/images/media/"));
        assertEquals("Pictures/100PINT/Pins/", media.entries.get(entry).getAsString(MediaStore.MediaColumns.RELATIVE_PATH));
        assertEquals("Saved in Pictures/100PINT/Pins.", ShadowToast.getTextOfLatestToast());
        DownloadLedger.Job job = new DownloadLedger(app).reconcile().get(0);
        assertEquals(DownloadLedger.State.COMPLETED, job.state);
        assertEquals("Saved in Pictures/100PINT/Pins.", job.reasonText());
    }

    @Test public void nothingIsTakenWhileAndroidIsDownloadingOneOfThem() throws Exception {
        long running = queued("1", null);
        status(running, DownloadManager.STATUS_RUNNING);
        long waiting = queued("2", null);
        ShadowLooper.idleMainLooper(InAppDownloads.GRACE_MS, TimeUnit.MILLISECONDS);
        settle();
        assertEquals(0, nativeJobs.removes);
        assertTrue(asked.isEmpty());

        // Once Android finishes it and still hasn't started the other, the other is taken.
        status(running, DownloadManager.STATUS_SUCCESSFUL);
        ShadowLooper.idleMainLooper(InAppDownloads.RECHECK_MS, TimeUnit.MILLISECONDS);
        settle();
        assertNotNull(nativeJobs.getRequest(running));
        assertNull(nativeJobs.getRequest(waiting));
        assertEquals(1, media.entries.size());
    }

    @Test public void aMeteredNetworkWaitsWhenDownloadsMustBeUnmetered() throws Exception {
        Settings.DOWNLOAD_UNMETERED_ONLY.save(true);
        network(NetworkCapabilities.NET_CAPABILITY_INTERNET, NetworkCapabilities.NET_CAPABILITY_NOT_ROAMING);
        long id = queued("3", null);
        ShadowLooper.idleMainLooper(InAppDownloads.GRACE_MS, TimeUnit.MILLISECONDS);
        settle();
        assertNotNull(nativeJobs.getRequest(id));
        assertTrue(asked.isEmpty());

        network(NetworkCapabilities.NET_CAPABILITY_INTERNET, NetworkCapabilities.NET_CAPABILITY_NOT_ROAMING,
                NetworkCapabilities.NET_CAPABILITY_NOT_METERED);
        ShadowLooper.idleMainLooper(InAppDownloads.RECHECK_MS, TimeUnit.MILLISECONDS);
        settle();
        assertNull(nativeJobs.getRequest(id));
        assertEquals(1, asked.size());
    }

    @Test public void aFileTheMediaHostRefusesLeavesNoEntryAndReadsFailed() throws Exception {
        answer.set(404);
        long id = queued("4", null);
        ShadowLooper.idleMainLooper(InAppDownloads.GRACE_MS, TimeUnit.MILLISECONDS);
        settle();
        assertTrue(media.entries.isEmpty());
        assertEquals(1, media.deleted.get());
        assertEquals("Couldn't save this pin.", ShadowToast.getTextOfLatestToast());
        DownloadLedger.Job job = new DownloadLedger(app).reconcile().get(0);
        assertEquals(id, job.id);
        assertEquals(DownloadLedger.State.FAILED, job.state);
        assertFalse(job.canOpen());
        assertFalse(DownloadLedger.downloadedPinIds(app).contains("4"));
    }

    @Test public void switchedOffNothingIsTaken() throws Exception {
        long id = queued("5", null);
        Settings.DOWNLOAD_PINS.save(false);
        ShadowLooper.idleMainLooper(InAppDownloads.GRACE_MS, TimeUnit.MILLISECONDS);
        settle();
        assertNotNull(nativeJobs.getRequest(id));
        assertTrue(asked.isEmpty());
    }

    @Test public void aSaveTheAppStoppedPartWayIsCleanedUpAndReadsFailed() throws Exception {
        long id = queued("6", null);
        Uri left = media.insert(MediaStore.Downloads.getContentUri(MediaStore.VOLUME_EXTERNAL_PRIMARY), new ContentValues());
        manager.remove(id);
        preferences().edit().putString(DownloadLedger.SAVED, id + ",RUNNING,image/jpeg," + left + "\n").commit();
        assertEquals(DownloadLedger.State.FAILED, new DownloadLedger(app).reconcile().get(0).state);

        DownloadLedger.onStart(app);
        ShadowLooper.idleMainLooper(InAppDownloads.GRACE_MS, TimeUnit.MILLISECONDS);
        settle();
        assertFalse(media.entries.containsKey(left));
        assertEquals(id + ",FAILED,image/jpeg,\n", preferences().getString(DownloadLedger.SAVED, ""));
    }

    @Test public void removingTheHistoryEntryForgetsTheSaveButKeepsTheFile() throws Exception {
        long id = queued("7", null);
        ShadowLooper.idleMainLooper(InAppDownloads.GRACE_MS, TimeUnit.MILLISECONDS);
        settle();
        assertEquals(1, media.entries.size());
        assertTrue(DownloadLedger.removeHistory(app, id, null));
        settle();
        assertFalse(preferences().contains(DownloadLedger.SAVED));
        assertEquals(1, media.entries.size());
        assertFalse(DownloadLedger.downloadedPinIds(app).contains("7"));
    }

    @Test public void aStreamedVideoIsJoinedWithItsSoundIntoOneMp4() throws Exception {
        String base = HlsPlaylistTest.FOLDER + HlsPlaylistTest.HASH;
        serve(cmafStream(), null);
        long id = DownloadLedger.IN_APP;
        ShadowMediaExtractor.addTrack(DataSource.toDataSource(cached(id, ".video").getPath()),
                MediaFormat.createVideoFormat("video/avc", 720, 1280), PICTURE_SAMPLES);
        ShadowMediaExtractor.addTrack(DataSource.toDataSource(cached(id, ".audio").getPath()),
                MediaFormat.createAudioFormat("audio/mp4a-latm", 44100, 2), SOUND_SAMPLES);

        assertTrue(PinDownloads.start(streamedPin("444", HlsPlaylistTest.MASTER.toString()), app, null));
        streamsDone();
        // The master, the best variant and its sound, then the one file each of those is cut from.
        assertEquals(Arrays.asList(HlsPlaylistTest.MASTER.toString(), base + "_720w.m3u8", base + "_audio.m3u8",
                base + "_720w.cmfv", base + "_audio.cmfa"), asked);
        assertEquals(0, nativeJobs.getRequestCount());
        assertTrue(ShadowToast.showedToast("Download started. Check Downloads."));
        assertEquals("Saved in Download.", ShadowToast.getTextOfLatestToast());

        assertEquals(1, media.entries.size());
        Uri entry = media.entries.keySet().iterator().next();
        assertTrue(entry.toString(), entry.toString().startsWith("content://media/external_primary/downloads/"));
        ContentValues values = media.entries.get(entry);
        assertTrue(values.getAsString(MediaStore.MediaColumns.DISPLAY_NAME).matches("Pinterest_444_[0-9]+\\.mp4"));
        assertEquals("Download/", values.getAsString(MediaStore.MediaColumns.RELATIVE_PATH));
        assertEquals("video/mp4", values.getAsString(MediaStore.MediaColumns.MIME_TYPE));
        assertEquals(0, (int) values.getAsInteger(MediaStore.MediaColumns.IS_PENDING));
        ByteArrayOutputStream joined = new ByteArrayOutputStream();
        joined.write(PICTURE_SAMPLES);
        joined.write(SOUND_SAMPLES);
        assertArrayEquals(joined.toByteArray(), Files.readAllBytes(media.file(entry).toPath()));
        assertNoPartsLeft();

        DownloadLedger.Job job = new DownloadLedger(app).reconcile().get(0);
        assertEquals(id, job.id);
        assertEquals(DownloadLedger.State.COMPLETED, job.state);
        assertTrue(job.canOpen());
        assertFalse(job.canSetAs());
        assertTrue(DownloadLedger.downloadedPinIds(app).contains("444"));
        assertTrue(DownloadLedger.openFile(app, job));
        settle();
        Intent view = Shadows.shadowOf(app).getNextStartedActivity();
        assertEquals(entry, view.getData());
        assertEquals("video/mp4", view.getType());
    }

    @Test public void anOlderPinsPiecesAreJoinedInOrderAndABatchGetsNoToast() throws Exception {
        String base = "https://v1.pinimg.com/videos/mc/hls/4e/2a/1c/4e2a1c";
        Map<String, Object[]> files = new LinkedHashMap<>();
        files.put(base + ".m3u8", new Object[]{"application/x-mpegURL",
                "#EXTM3U\n#EXT-X-STREAM-INF:BANDWIDTH=2400000,RESOLUTION=720x1280\n4e2a1c_720w.m3u8\n"});
        files.put(base + "_720w.m3u8", new Object[]{"application/x-mpegURL", "#EXTM3U\n#EXT-X-TARGETDURATION:6\n"
                + "#EXTINF:6.0,\n4e2a1c_720w00000.ts\n#EXTINF:6.0,\n4e2a1c_720w00001.ts\n#EXTINF:2.4,\n4e2a1c_720w00002.ts\n#EXT-X-ENDLIST\n"});
        files.put(base + "_720w00000.ts", new Object[]{"video/MP2T", "piece one,"});
        files.put(base + "_720w00001.ts", new Object[]{"video/MP2T", "piece two,"});
        files.put(base + "_720w00002.ts", new Object[]{"video/MP2T", "piece three"});
        long id = DownloadLedger.IN_APP;
        AtomicReference<String> before = new AtomicReference<>();
        serve(files, url -> {
            // By the last piece, the two before it are in the file in order.
            if (url.endsWith("00002.ts")) before.set(read(cached(id, ".video")));
        });
        ShadowMediaExtractor.addTrack(DataSource.toDataSource(cached(id, ".video").getPath()),
                MediaFormat.createVideoFormat("video/avc", 720, 1280), PICTURE_SAMPLES);
        List<PinDownloads.Result> results = new ArrayList<>();

        assertTrue(PinDownloads.start(streamedPin("555", base + ".m3u8"), app, results::add));
        streamsDone();
        assertEquals(Arrays.asList(PinDownloads.Result.QUEUED), results);
        assertEquals("piece one,piece two,", before.get());
        assertEquals(5, asked.size());
        Uri entry = media.entries.keySet().iterator().next();
        assertArrayEquals(PICTURE_SAMPLES, Files.readAllBytes(media.file(entry).toPath()));
        assertNull(ShadowToast.getTextOfLatestToast());
        assertEquals(DownloadLedger.State.COMPLETED, new DownloadLedger(app).reconcile().get(0).state);
        assertNoPartsLeft();
    }

    @Test public void aStreamTheMediaHostCutsShortLeavesNoFileAndReadsFailed() throws Exception {
        Map<String, Object[]> files = cmafStream();
        files.remove(HlsPlaylistTest.FOLDER + HlsPlaylistTest.HASH + "_audio.cmfa");
        serve(files, null);
        assertTrue(PinDownloads.start(streamedPin("777", HlsPlaylistTest.MASTER.toString()), app, null));
        streamsDone();
        assertEquals(5, asked.size());
        assertTrue(media.entries.isEmpty());
        assertEquals(1, media.deleted.get());
        assertNoPartsLeft();
        assertEquals("Couldn't save this pin.", ShadowToast.getTextOfLatestToast());
        DownloadLedger.Job job = new DownloadLedger(app).reconcile().get(0);
        assertEquals(DownloadLedger.State.FAILED, job.state);
        assertFalse(job.canOpen());
        assertFalse(DownloadLedger.downloadedPinIds(app).contains("777"));

        // A page where the playlist should be makes no entry at all.
        media.deleted.set(0);
        files.put(HlsPlaylistTest.MASTER.toString(), new Object[]{"text/html", "<html>Sorry</html>"});
        ShadowToast.reset();
        assertTrue(PinDownloads.start(streamedPin("778", HlsPlaylistTest.MASTER.toString()), app, null));
        streamsDone();
        assertTrue(media.entries.isEmpty());
        assertEquals(0, media.deleted.get());
        assertEquals("Couldn't save this pin.", ShadowToast.getTextOfLatestToast());
        assertEquals(DownloadLedger.State.FAILED, new DownloadLedger(app).reconcile().get(0).state);
    }

    @Test public void aStreamOnANetworkTheSettingsBlockIsntStarted() throws Exception {
        Settings.DOWNLOAD_UNMETERED_ONLY.save(true);
        network(NetworkCapabilities.NET_CAPABILITY_INTERNET, NetworkCapabilities.NET_CAPABILITY_NOT_ROAMING);
        serve(cmafStream(), null);
        assertTrue(PinDownloads.start(streamedPin("888", HlsPlaylistTest.MASTER.toString()), app, null));
        streamsDone();
        assertTrue(asked.isEmpty());
        assertTrue(media.entries.isEmpty());
        assertEquals("Your download settings block this network. Try again on Wi-Fi.", ShadowToast.getTextOfLatestToast());
        assertTrue(new DownloadLedger(app).reconcile().isEmpty());
    }

    @Test public void foldersMapToTheCollectionsMediaStoreAccepts() {
        String volume = MediaStore.VOLUME_EXTERNAL_PRIMARY;
        assertEquals(MediaStore.Downloads.getContentUri(volume), InAppDownloads.collection(null, "video/mp4"));
        assertEquals(MediaStore.Images.Media.getContentUri(volume), InAppDownloads.collection("DCIM/Pins", "image/png"));
        assertEquals(MediaStore.Video.Media.getContentUri(volume), InAppDownloads.collection("DCIM", "video/mp4"));
        assertEquals(MediaStore.Video.Media.getContentUri(volume), InAppDownloads.collection("Pictures/Art", "video/mp4"));
        assertEquals(MediaStore.Files.getContentUri(volume), InAppDownloads.collection("Documents/Pins", "image/jpeg"));
        assertTrue(InAppDownloads.sameType("image/jpg; charset=binary", "image/jpeg"));
        assertFalse(InAppDownloads.sameType("text/html", "image/jpeg"));
        assertFalse(InAppDownloads.sameType(null, "image/jpeg"));
    }

    private static final byte[] PICTURE_SAMPLES = "the picture's samples".getBytes(StandardCharsets.UTF_8);
    private static final byte[] SOUND_SAMPLES = "the sound's samples".getBytes(StandardCharsets.UTF_8);

    /** A 2026 pin's stream on the media host: its playlists and the file each variant is cut from. */
    private static Map<String, Object[]> cmafStream() {
        String base = HlsPlaylistTest.FOLDER + HlsPlaylistTest.HASH;
        Map<String, Object[]> files = new LinkedHashMap<>();
        files.put(HlsPlaylistTest.MASTER.toString(), new Object[]{HlsPlaylist.TYPE, HlsPlaylistTest.MASTER_TEXT});
        files.put(base + "_720w.m3u8", new Object[]{HlsPlaylist.TYPE, HlsPlaylistTest.VARIANT_TEXT});
        files.put(base + "_audio.m3u8", new Object[]{HlsPlaylist.TYPE, HlsPlaylistTest.AUDIO_TEXT});
        files.put(base + "_720w.cmfv", new Object[]{"video/mp4", "a fragmented picture file"});
        files.put(base + "_audio.cmfa", new Object[]{"audio/mp4", "a fragmented sound file"});
        return files;
    }

    /** Serves [files] (URL to type and body), and 404 for any other. [opened] hears each URL first. */
    private void serve(Map<String, Object[]> files, Consumer<String> opened) {
        InAppDownloads.connection = uri -> {
            String url = uri.toString();
            asked.add(url);
            if (opened != null) opened.accept(url);
            Object[] file = files.get(url);
            byte[] body = file == null ? new byte[0] : ((String) file[1]).getBytes(StandardCharsets.UTF_8);
            FileHostForTests.Answer answer = new FileHostForTests.Answer(uri.toURL(), file == null ? 404 : 200,
                    new FileHostForTests.Body(body)).header("Content-Length", String.valueOf(body.length));
            return file == null ? answer : answer.header("Content-Type", (String) file[0]);
        };
    }

    private static Map<String, Object> streamedPin(String id, String playlist) {
        return Map.of("id", id, "videos", Map.of("video_list", Map.of(
                "hls", Map.of("url", playlist, "width", 720, "height", 1280))));
    }

    private File cached(long id, String suffix) {
        return new File(new File(app.getCacheDir(), InAppDownloads.STREAM_FOLDER), id + suffix);
    }

    private static String read(File file) {
        try {
            return new String(Files.readAllBytes(file.toPath()), StandardCharsets.UTF_8);
        } catch (java.io.IOException missing) {
            return null;
        }
    }

    private void assertNoPartsLeft() {
        String[] left = new File(app.getCacheDir(), InAppDownloads.STREAM_FOLDER).list();
        assertTrue(left == null ? "" : Arrays.toString(left), left == null || left.length == 0);
    }

    private static void streamsDone() throws Exception {
        settle();
        InAppDownloads.awaitStreamsForTests();
        settle();
    }

    /** A request queued to [folder] (null for Download) the way Download pin queues one. */
    private long queued(String pinId, String folder) {
        long id = manager.enqueue(PinDownloads.request(PinMedia.sourceUrl(SOURCE, false), "Pinterest_" + pinId + "_1.jpg", folder));
        status(id, DownloadManager.STATUS_PENDING);
        assertTrue(DownloadLedger.record(app, id, pinId, folder));
        return id;
    }

    private void status(long id, int state) {
        ShadowDownloadManager.ShadowRequest request = Shadow.extract(nativeJobs.getRequest(id));
        request.setStatus(state);
    }

    private void network(int... capabilities) {
        ConnectivityManager connectivity = (ConnectivityManager) app.getSystemService(Context.CONNECTIVITY_SERVICE);
        NetworkCapabilities abilities = ShadowNetworkCapabilities.newInstance();
        for (int capability : capabilities) Shadows.shadowOf(abilities).addCapability(capability);
        Shadows.shadowOf(connectivity).setNetworkCapabilities(connectivity.getActiveNetwork(), abilities);
    }

    private SharedPreferences preferences() { return app.getSharedPreferences(DownloadLedger.STORE, Context.MODE_PRIVATE); }

    private static void settle() throws Exception {
        for (int i = 0; i < 3; i++) {
            Utils.awaitBackgroundTasksForTests();
            ShadowLooper.idleMainLooper();
        }
    }

    /** MediaStore as far as a save uses it: insert a pending entry, write it, show it, delete it. */
    public static final class MediaStoreForTests extends ContentProvider {
        final Map<Uri, ContentValues> entries = new LinkedHashMap<>();
        final AtomicInteger deleted = new AtomicInteger();
        private final AtomicLong next = new AtomicLong(1);

        File file(Uri entry) {
            return new File(getContext().getCacheDir(), "media-" + entry.getLastPathSegment());
        }

        @Override public boolean onCreate() { return true; }

        @Override public synchronized Uri insert(Uri collection, ContentValues values) {
            Uri entry = Uri.withAppendedPath(collection, String.valueOf(next.getAndIncrement()));
            entries.put(entry, new ContentValues(values));
            return entry;
        }

        @Override public synchronized int update(Uri entry, ContentValues values, String where, String[] args) {
            ContentValues kept = entries.get(entry);
            if (kept == null) return 0;
            kept.putAll(values);
            return 1;
        }

        @Override public synchronized int delete(Uri entry, String where, String[] args) {
            if (entries.remove(entry) == null) return 0;
            deleted.incrementAndGet();
            return 1;
        }

        @Override public synchronized ParcelFileDescriptor openFile(Uri entry, String mode) throws FileNotFoundException {
            if (!entries.containsKey(entry)) throw new FileNotFoundException(entry.toString());
            return ParcelFileDescriptor.open(file(entry), ParcelFileDescriptor.parseMode(mode));
        }

        @Override public Cursor query(Uri uri, String[] projection, String selection, String[] args, String order) { return null; }

        @Override public String getType(Uri uri) { return null; }
    }
}
