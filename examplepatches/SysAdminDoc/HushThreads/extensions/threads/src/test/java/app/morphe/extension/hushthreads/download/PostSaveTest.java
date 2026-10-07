/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.extension.hushthreads.download;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Context;
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
import org.robolectric.shadows.ShadowToast;

import java.io.ByteArrayOutputStream;
import java.net.InetAddress;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

import app.morphe.extension.hushthreads.settings.Settings;
import app.morphe.extension.shared.L10nTablesForTests;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.HushThreadsPause;
import app.morphe.extension.shared.settings.PauseForTests;
import app.morphe.extension.shared.settings.preference.LogBufferManager;

/**
 * The Save row of a Threads post's menu, fed posts through the reader seam: when it shows, what it
 * says, and that a tap saves every page of the post, in order, with nothing mixed between two posts
 * saved at once. The files come from a local server and land in a fake gallery.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, shadows = {CarouselSaveTest.LocalCandidates.class})
public class PostSaveTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    private Context context;
    private LocalServer server;
    private MediaSaveTest.Gallery gallery;
    private final CountDownLatch release = new CountDownLatch(1);
    /** What the gallery received, by the row's id. */
    private final Map<Long, ByteArrayOutputStream> files = new HashMap<>();
    private final List<String> paths = new ArrayList<>();

    @Before public void setUp() throws Exception {
        context = RuntimeEnvironment.getApplication();
        context.getApplicationInfo().targetSdkVersion = 36;
        server = new LocalServer();
        CarouselSaveTest.LocalCandidates.origin = server.origin();
        MediaSave.policyForTests = new MediaUrlPolicy(host -> new InetAddress[]{InetAddress.getByName("10.9.8.7")}) {
            @Override Refusal refusal(URL url) {
                return url.toString().startsWith(server.origin() + "/") ? null : super.refusal(url);
            }
        };
        gallery = Robolectric.setupContentProvider(MediaSaveTest.Gallery.class, MediaStore.AUTHORITY);
        for (long id = 1; id <= 4; id++) {
            ByteArrayOutputStream bytes = new ByteArrayOutputStream();
            files.put(id, bytes);
            Shadows.shadowOf(context.getContentResolver()).registerOutputStream(gallery.videoUri(id), bytes);
            Shadows.shadowOf(context.getContentResolver()).registerOutputStream(
                    ContentUris.withAppendedId(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, id), bytes);
        }
        SaveLeftovers.forgetSweepForTests();
        PostSave.reader = FAKE;
        LogBufferManager.clearLogBuffer();
    }

    @After public void tearDown() throws Exception {
        release.countDown();
        for (SaveControl.Running save : SaveControl.running()) SaveControl.cancel(save.id);
        SavesForTests.endAll();
        waitForSaves();
        server.close();
        PostSave.reader = PostSave.BRIDGES;
        MediaSave.policyForTests = null;
        MediaSave.detailsForTests = null;
        Settings.SAVE_MEDIA.resetToDefault();
        PauseForTests.resume();
        Utils.awaitBackgroundTasksForTests();
        SaveLeftovers.forgetSweepForTests();
        LogBufferManager.clearLogBuffer();
    }

    @Test public void theRowIsOfferedOnlyWithTheSwitchOnAndSomethingToSave() {
        Post photo = photo("3001_7", "/photo.jpg");
        assertTrue(PostSave.canSave(photo));
        assertTrue("a video", PostSave.canSave(video("3002_7", "/video.mp4")));
        assertTrue("a video Threads streams only as DASH", PostSave.canSave(dashOnly("3003_7")));
        assertTrue("a carousel with one page to save", PostSave.canSave(carousel("3004_7", text("3005_7"), photo)));

        assertFalse("nothing at all", PostSave.canSave(null));
        assertFalse("a text post", PostSave.canSave(text("3006_7")));
        assertFalse("a carousel of nothing readable", PostSave.canSave(carousel("3007_7", text("3008_7"), null)));

        Settings.SAVE_MEDIA.save(false);
        assertFalse("the switch is off", PostSave.canSave(photo));
        Settings.SAVE_MEDIA.save(true);
        PauseForTests.pause(HushThreadsPause.Reason.SWITCH);
        assertFalse("HushThreads is paused", PostSave.canSave(photo));
        PauseForTests.resume();
        assertTrue(PostSave.canSave(photo));

        PostSave.reader = THROWING;
        assertFalse("a reader that throws", PostSave.canSave(photo));
        PostSave.reader = PostSave.BRIDGES;
        assertFalse("the bridges as built read nothing", PostSave.canSave(new Object()));
        assertEquals("nothing was fetched to decide", 0, fetched());
    }

    @Test public void theLabelSaysWhatTheRowSaves() {
        assertEquals("Save photo", PostSave.label(photo("3101_7", "/a.jpg")));
        assertEquals("Save video", PostSave.label(video("3102_7", "/b.mp4")));
        assertEquals("Save video", PostSave.label(dashOnly("3103_7")));
        assertEquals("Save all", PostSave.label(carousel("3104_7", photo("3105_7", "/c.jpg"), video("3106_7", "/d.mp4"))));
        assertEquals("a carousel of one page is that page", "Save video",
                PostSave.label(carousel("3107_7", video("3108_7", "/e.mp4"))));
        assertEquals("Save photo", PostSave.label(null));
        PostSave.reader = THROWING;
        assertEquals("Save photo", PostSave.label(photo("3109_7", "/f.jpg")));
        assertEquals(0, fetched());
    }

    @Test @Config(qualifiers = "de")
    public void theLabelIsInThePhonesLanguage() {
        Map<String, String> german = L10nTablesForTests.of("de");
        assertEquals(german.get("Save all"), PostSave.label(carousel("3201_7", photo("3202_7", "/a.jpg"), photo("3203_7", "/b.jpg"))));
        assertEquals(german.get("Save video"), PostSave.label(video("3204_7", "/c.mp4")));
        assertEquals(german.get("Save photo"), PostSave.label(photo("3205_7", "/d.jpg")));
    }

    @Test public void aCarouselOfAPhotoAndAVideoSavesBothInPageOrder() throws Exception {
        Post post = carousel("3301_77", photo("3302_77", "/first.jpg"), video("3303_77", "/second.mp4"));
        List<String> order = Collections.synchronizedList(new ArrayList<>());
        MediaSave.detailsForTests = details -> order.add(details.videoId);
        Activity activity = Robolectric.buildActivity(Activity.class).get();

        PostSave.save(activity, post);
        waitForSaves();

        assertEquals(Arrays.asList("3302", "3303"), order);
        assertEquals(1, server.hits("/first.jpg"));
        assertEquals(1, server.hits("/second.mp4"));
        assertEquals(2, gallery.rows.size());
        ContentValues first = gallery.rows.get(1L), second = gallery.rows.get(2L);
        assertEquals("image/jpeg", first.getAsString(MediaStore.MediaColumns.MIME_TYPE));
        assertEquals("video/mp4", second.getAsString(MediaStore.MediaColumns.MIME_TYPE));
        assertTrue(name(first), name(first).matches("TH_IMG_\\d{8}_\\d{6}_3301_01\\.jpg"));
        assertTrue(name(second), name(second).startsWith("TH_VID_") && name(second).endsWith("_3301_02.mp4"));
        assertArrayEquals(body(false, "/first.jpg"), files.get(1L).toByteArray());
        assertArrayEquals(body(true, "/second.mp4"), files.get(2L).toByteArray());
        for (ContentValues row : gallery.rows.values()) {
            assertEquals(Integer.valueOf(0), row.getAsInteger(MediaStore.MediaColumns.IS_PENDING));
        }
        assertEquals("Saved 2. Failed 0. Skipped 0.", ShadowToast.getTextOfLatestToast());
        assertTrue(SaveControl.running().isEmpty());
    }

    @Test public void twoPostsSavedAtOnceKeepTheirFilesApart() throws Exception {
        Post one = carousel("3401_77", photo("3402_77", "/one-a.jpg"), photo("3403_77", "/one-b.jpg"));
        Post two = carousel("3501_88", photo("3502_88", "/two-a.jpg"), photo("3503_88", "/two-b.jpg"));
        // Each post's first page waits until the other post's save has started, so the two run
        // side by side rather than one after the other.
        CountDownLatch both = new CountDownLatch(2);
        List<String> order = Collections.synchronizedList(new ArrayList<>());
        MediaSave.detailsForTests = details -> {
            order.add(details.videoId);
            if (details.videoId.equals("3402") || details.videoId.equals("3502")) {
                both.countDown();
                await(both);
            }
        };

        int toasts = ShadowToast.shownToastCount();
        PostSave.save(context, one);
        PostSave.save(context, two);
        assertTrue("the two saves never ran side by side", both.await(10, TimeUnit.SECONDS));
        assertEquals(2, SaveControl.running().size());
        waitForSaves();

        assertTrue(order.toString(), order.indexOf("3402") < order.indexOf("3403"));
        assertTrue(order.toString(), order.indexOf("3502") < order.indexOf("3503"));
        Map<String, String> pageOfSuffix = new HashMap<>();
        pageOfSuffix.put("_3401_01.jpg", "/one-a.jpg");
        pageOfSuffix.put("_3401_02.jpg", "/one-b.jpg");
        pageOfSuffix.put("_3501_01.jpg", "/two-a.jpg");
        pageOfSuffix.put("_3501_02.jpg", "/two-b.jpg");
        assertEquals(4, gallery.rows.size());
        HashSet<String> names = new HashSet<>();
        HashSet<String> saved = new HashSet<>();
        for (Map.Entry<Long, ContentValues> row : gallery.rows.entrySet()) {
            String name = name(row.getValue());
            assertTrue("two files got one name: " + name, names.add(name));
            String path = null;
            for (Map.Entry<String, String> suffix : pageOfSuffix.entrySet()) {
                if (name.endsWith(suffix.getKey())) path = suffix.getValue();
            }
            assertNotNull("a name that says no post and page: " + name, path);
            assertTrue(path + " was saved twice", saved.add(path));
            // The bytes under each name are the page the name says, never the other post's.
            assertArrayEquals(name, body(false, path), files.get(row.getKey()).toByteArray());
            assertEquals(Integer.valueOf(0), row.getValue().getAsInteger(MediaStore.MediaColumns.IS_PENDING));
        }
        for (String path : pageOfSuffix.values()) assertEquals(path, 1, server.hits(path));
        assertEquals("each save says it started and how it ended", 4, ShadowToast.shownToastCount() - toasts);
        assertEquals("Saved 2. Failed 0. Skipped 0.", ShadowToast.getTextOfLatestToast());
    }

    @Test public void aPostOfOnePhotoSavesOneFileUnderThePlainName() throws Exception {
        PostSave.save(context, photo("3601_77", "/single.jpg"));
        waitForSaves();
        assertEquals(1, server.hits("/single.jpg"));
        assertEquals(1, gallery.rows.size());
        assertTrue(name(gallery.rows.get(1L)), name(gallery.rows.get(1L)).matches("TH_IMG_\\d{8}_\\d{6}\\.jpg"));
        assertArrayEquals(body(false, "/single.jpg"), files.get(1L).toByteArray());
        assertTrue(ShadowToast.getTextOfLatestToast(), ShadowToast.getTextOfLatestToast().startsWith("Saved to "));
    }

    @Test public void aTapSavesNothingWithTheSwitchOffOrPausedAndSaysSoWhenTheReadFails() throws Exception {
        Post post = carousel("3701_77", photo("3702_77", "/a.jpg"), photo("3703_77", "/b.jpg"));
        int toasts = ShadowToast.shownToastCount();
        Settings.SAVE_MEDIA.save(false);
        PostSave.save(context, post);
        Settings.SAVE_MEDIA.save(true);
        PauseForTests.pause(HushThreadsPause.Reason.SWITCH);
        PostSave.save(context, post);
        PauseForTests.resume();
        PostSave.save(context, null);
        waitForSaves();
        assertEquals(toasts, ShadowToast.shownToastCount());

        PostSave.reader = THROWING;
        PostSave.save(context, post);
        waitForSaves();
        assertEquals("Download failed", ShadowToast.getTextOfLatestToast());
        assertEquals(0, fetched());
        assertTrue(gallery.rows.isEmpty());
    }

    @Test public void aPageThatReadsAsNothingFailsOnceInItsPlace() throws Exception {
        Post post = carousel("3801_77", photo("3802_77", "/a.jpg"), text("3803_77"), null, photo("3804_77", "/b.jpg"));
        PostSave.save(context, post);
        waitForSaves();
        assertEquals("Saved 2. Failed 1. Skipped 1.", ShadowToast.getTextOfLatestToast());
        List<String> names = new ArrayList<>();
        for (ContentValues row : gallery.rows.values()) names.add(name(row));
        Collections.sort(names);
        assertEquals(names.toString(), 2, names.size());
        assertTrue(names.toString(), names.get(0).endsWith("_3801_01.jpg"));
        assertTrue("the last page keeps its place: " + names, names.get(1).endsWith("_3801_04.jpg"));
    }

    @Test public void aCarouselOverTheLimitIsTurnedDownBeforeAnythingMoves() throws Exception {
        Post[] pages = new Post[MediaSave.MAX_BATCH_PAGES + 1];
        for (int i = 0; i < pages.length; i++) pages[i] = photo(String.valueOf(3900 + i), "/page" + i + ".jpg");
        PostSave.save(context, carousel("3999_77", pages));
        waitForSaves();
        assertEquals("Not saved: a carousel can have at most 32 pages", ShadowToast.getTextOfLatestToast());
        assertEquals(0, fetched());
        assertTrue(gallery.rows.isEmpty());
    }

    private void waitForSaves() throws Exception {
        long deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(20);
        while (MediaSave.savesInFlight() != 0) {
            assertTrue("the save never ended", System.nanoTime() < deadline);
            Thread.sleep(10);
        }
        Shadows.shadowOf(Looper.getMainLooper()).idle();
    }

    private static void await(CountDownLatch latch) {
        try { if (!latch.await(10, TimeUnit.SECONDS)) throw new IllegalStateException("test release timed out"); }
        catch (InterruptedException failure) { throw new IllegalStateException(failure); }
    }

    private int fetched() {
        int hits = 0;
        for (String path : paths) hits += server.hits(path);
        return hits;
    }

    private static String name(ContentValues row) {
        return row.getAsString(MediaStore.MediaColumns.DISPLAY_NAME);
    }

    /** A body that starts the way its kind does and carries its own path, so two files never match. */
    private static byte[] body(boolean video, String path) {
        byte[] bytes = new byte[4096];
        byte[] head = video ? new byte[]{0, 0, 0, 24, 'f', 't', 'y', 'p', 'm', 'p', '4', '2'}
                : new byte[]{(byte) 0xff, (byte) 0xd8, (byte) 0xff, (byte) 0xe0};
        System.arraycopy(head, 0, bytes, 0, head.length);
        byte[] mark = path.getBytes(java.nio.charset.StandardCharsets.US_ASCII);
        System.arraycopy(mark, 0, bytes, 64, mark.length);
        return bytes;
    }

    private Post photo(String id, String path) {
        server.serve(path, "image/jpeg", body(false, path));
        paths.add(path);
        Post post = new Post(id);
        post.pictures = Arrays.asList(new MediaSave.Rendition(server.origin() + path, 1080, 1350, 0),
                new MediaSave.Rendition(server.origin() + "/small" + path, 320, 400, 0));
        return post;
    }

    private Post video(String id, String path) {
        server.serve(path, "video/mp4", body(true, path));
        paths.add(path);
        Post post = new Post(id);
        post.videos = Collections.singletonList(new MediaSave.Rendition(server.origin() + path, 720, 1280, 0));
        post.pictures = Collections.singletonList(new MediaSave.Rendition(server.origin() + "/cover" + path, 720, 1280, 0));
        return post;
    }

    private static Post dashOnly(String id) {
        Post post = new Post(id);
        post.manifest = "<MPD/>";
        return post;
    }

    private static Post text(String id) {
        return new Post(id);
    }

    private static Post carousel(String id, Post... pages) {
        Post post = new Post(id);
        post.pages = Arrays.asList(pages);
        post.owner = "poster";
        post.takenAt = 1_790_000_000L;
        return post;
    }

    /** A Threads post, or a page of one, as the test's reader hands it over. */
    static final class Post {
        final String id;
        String owner;
        Long takenAt;
        List<Post> pages;
        List<MediaSave.Rendition> videos;
        String manifest;
        List<MediaSave.Rendition> pictures;

        Post(String id) {
            this.id = id;
        }
    }

    /** Reads {@link Post}s, the way the patch's bridges read Threads' own media. */
    static final PostSave.Reader FAKE = new PostSave.Reader() {
        @Override public List<?> carouselMedia(Object media) { return ((Post) media).pages; }
        @Override public List<?> videoVersions(Object media) { return ((Post) media).videos; }
        @Override public String dashManifest(Object media) { return ((Post) media).manifest; }
        @Override public String versionUrl(Object version) { return ((MediaSave.Rendition) version).url; }
        @Override public Integer versionWidth(Object version) { return ((MediaSave.Rendition) version).width; }
        @Override public Integer versionHeight(Object version) { return ((MediaSave.Rendition) version).height; }
        @Override public Object imageVersions(Object media) { return ((Post) media).pictures == null ? null : media; }
        @Override public List<?> imageCandidates(Object versions) { return ((Post) versions).pictures; }
        @Override public String candidateUrl(Object candidate) { return ((MediaSave.Rendition) candidate).url; }
        @Override public int candidateWidth(Object candidate) { return ((MediaSave.Rendition) candidate).width; }
        @Override public int candidateHeight(Object candidate) { return ((MediaSave.Rendition) candidate).height; }
        @Override public String mediaId(Object media) { return ((Post) media).id; }
        @Override public Object owner(Object media) { return ((Post) media).owner; }
        @Override public Long takenAt(Object media) { return ((Post) media).takenAt; }
        @Override public String username(Object user) { return (String) user; }
    };

    /** A reader whose every read throws, the way a bridge does when Threads changes its model. */
    static final PostSave.Reader THROWING = (PostSave.Reader) java.lang.reflect.Proxy.newProxyInstance(
            PostSave.Reader.class.getClassLoader(), new Class<?>[]{PostSave.Reader.class}, (proxy, method, args) -> {
                throw new ClassCastException("Threads changed its media model");
            });
}
