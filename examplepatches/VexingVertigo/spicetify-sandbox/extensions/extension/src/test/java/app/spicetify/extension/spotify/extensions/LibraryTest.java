package app.spicetify.extension.spotify.extensions;

import static app.spicetify.extension.spotify.extensions.EsperantoTest.namedEntity;
import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.Resources;
import android.os.Looper;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.FutureTask;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLog;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35, manifest = Config.NONE)
public class LibraryTest {
    private static final String ALL = "sp://esperanto/spotify.your_library_esperanto.proto.YourLibraryService/All";
    private static final int ALBUM = 2;
    private static final int ARTIST = 3;
    private static final int PLAYLIST = 4;
    private static final int FOLDER = 6;

    private final Context context = RuntimeEnvironment.getApplication();
    private final PlayerBridgeTest.FakeRouter router = new PlayerBridgeTest.FakeRouter();

    @Before
    public void setUp() {
        // The bridge is process-wide, so each test points it at its own router.
        Extensions.setAppContext(context);
        PlayerBridge.attach(router);
    }

    @Test
    public void givesLikedSongsThenEachSavedPlaylistAndAlbumOnceWithItsNameAndCover() throws Exception {
        Answer answer = new Answer();
        Library.fetch(context, answer);

        PlayerBridgeTest.FakeRequest request = router.next();
        assertEquals(ALL, request.uri);
        assertArrayEquals(Esperanto.yourLibraryAll(), request.body);
        assertEquals("sent from the bridge thread", "Spicetify player bridge", request.thread);
        Wire.Writer response = new Wire.Writer();
        response.message(2, namedEntity("spotify:playlist:road", "Road trip", "spotify:image:ab", PLAYLIST));
        response.message(2, namedEntity("spotify:album:blue", "Blue", "spotify:image:cd", ALBUM));
        response.message(2, namedEntity("spotify:playlist:mix", "Mix", "spotify:mosaic:1:2:3:4", PLAYLIST));
        response.message(2, namedEntity("spotify:playlist:bare", "Bare", null, PLAYLIST));
        response.message(2, namedEntity("spotify:user:u:folder:00000000000000ff", "Folder", null, FOLDER));
        response.message(2, namedEntity("spotify:artist:x", "Artist", "spotify:image:ef", ARTIST));
        // Liked Songs in each of the four forms the app accepts.
        response.message(2, namedEntity("spotify:collection:tracks", "Liked Songs", "spotify:image:1", PLAYLIST));
        response.message(2, namedEntity("spotify:user:u:collection", "Liked Songs", "spotify:image:2", PLAYLIST));
        response.message(3, namedEntity(Esperanto.LIKED_SONGS, "Liked Songs", "spotify:image:3", PLAYLIST));
        response.message(3, namedEntity("spotify:internal:collection:tracks", "Liked Songs", "spotify:image:4", PLAYLIST));
        // A pinned copy: the first one wins.
        response.message(3, namedEntity("spotify:playlist:road", "Old name", "spotify:image:old", PLAYLIST));
        response.varint(98, 200);
        request.callback.onResponse(200, response.toByteArray());
        answer.await();

        assertTrue("told on the main thread", answer.onMain);
        List<Library.Item> items = answer.items;
        assertEquals(Arrays.asList("spotify:collection:tracks", "spotify:playlist:road", "spotify:album:blue",
                "spotify:playlist:mix", "spotify:playlist:bare"), uris(items));
        assertEquals(Arrays.asList("Liked Songs", "Road trip", "Blue", "Mix", "Bare"), titles(items));
        // The covers as Your Library gives them; Liked Songs gets the one Spotify shows for it.
        assertEquals(Arrays.asList("https://misc.scdn.co/liked-songs/liked-songs-300.png", "spotify:image:ab",
                "spotify:image:cd", "spotify:mosaic:1:2:3:4", null), images(items));
        assertEquals(Arrays.asList(false, false, true, false, false), albums(items));
    }

    @Test
    public void likedSongsTakesSpotifysOwnNameForIt() throws Exception {
        Resources base = context.getResources();
        Resources spotify = new Resources(base.getAssets(), base.getDisplayMetrics(), base.getConfiguration()) {
            @Override
            public int getIdentifier(String name, String type, String defPackage) {
                boolean title = "collection_liked_songs_title".equals(name) && "string".equals(type)
                        && context.getPackageName().equals(defPackage);
                return title ? 0x7f130853 : 0;
            }

            @Override
            public String getString(int id) {
                return id == 0x7f130853 ? "Lieblingssongs" : super.getString(id);
            }
        };
        Context german = new ContextWrapper(context) {
            @Override
            public Resources getResources() {
                return spotify;
            }
        };
        Answer answer = new Answer();

        Library.fetch(german, answer);
        router.next().callback.onResponse(200, EsperantoTest.yourLibrary(false));
        answer.await();

        assertEquals(Arrays.asList("spotify:collection:tracks"), uris(answer.items));
        assertEquals("Lieblingssongs", answer.items.get(0).title);
    }

    @Test
    public void withoutTheBridgeItSaysSoOnTheMainThread() throws Exception {
        PlayerBridgeTest.attachRouter(true); // Spotify destroyed its router, as on a logout
        Answer answer = new Answer();

        Library.fetch(context, answer);
        answer.await();

        assertEquals(PlayerBridge.NOT_CONNECTED, answer.reason);
        assertNull(answer.items);
        assertTrue(answer.onMain);
    }

    @Test
    public void anAnswerThatCantBeReadFailsWithTheCoresError() throws Exception {
        Answer answer = new Answer();
        Library.fetch(context, answer);
        Wire.Writer failed = new Wire.Writer();
        failed.varint(98, 500);
        failed.string(99, "database error");

        router.next().callback.onResponse(200, failed.toByteArray());
        answer.await();

        assertEquals("status 500: database error", answer.reason);
        assertNull(answer.items);
    }

    @Test
    public void aLibraryStillLoadingIsAskedAgainASecondLater() throws Exception {
        Answer answer = new Answer();
        Library.fetch(context, answer);
        PlayerBridgeTest.FakeRequest first = router.next();
        int sent = router.requests.size();
        // By the bridge's own clock: a probe due 1 ms sooner than the retry finds no new request, and one due
        // as late finds it. The bridge runs tasks in the order they fall due, ties in the order they were posted.
        FutureTask<Integer> sooner = new FutureTask<>(router.requests::size);
        FutureTask<Integer> onTime = new FutureTask<>(router.requests::size);
        PlayerBridgeTest.onBridge(() -> {
            PlayerBridge.postDelayed(sooner, Library.LOADING_RETRY_MILLIS - 1); // before the answer, so due before its retry
            first.callback.onResponse(200, EsperantoTest.yourLibrary(true));
            PlayerBridge.post(() -> PlayerBridge.postDelayed(onTime, Library.LOADING_RETRY_MILLIS)); // after its handling
            return null;
        });

        assertEquals(1000, Library.LOADING_RETRY_MILLIS);
        assertEquals("not asked again sooner", sent, (int) sooner.get(PlayerBridgeTest.CEILING_SECONDS, TimeUnit.SECONDS));
        assertEquals("asked again", sent + 1, (int) onTime.get(PlayerBridgeTest.CEILING_SECONDS, TimeUnit.SECONDS));
        PlayerBridgeTest.FakeRequest retry = router.next();
        assertEquals(ALL, retry.uri);
        retry.callback.onResponse(200, EsperantoTest.yourLibrary(false,
                namedEntity("spotify:playlist:road", "Road trip", null, PLAYLIST)));
        answer.await();

        assertEquals(Arrays.asList("spotify:collection:tracks", "spotify:playlist:road"), uris(answer.items));
        assertEquals(2, router.requests.size());
    }

    @Test
    public void afterThreeRetriesALibraryStillLoadingComesAsItIs() throws Exception {
        Answer answer = new Answer();

        Library.fetch(context, answer, 0);
        for (int i = 0; i < 3; i++) router.next().callback.onResponse(200, EsperantoTest.yourLibrary(true));
        router.next().callback.onResponse(200, EsperantoTest.yourLibrary(true,
                namedEntity("spotify:playlist:road", "Road trip", null, PLAYLIST)));
        answer.await();

        assertEquals(Arrays.asList("spotify:collection:tracks", "spotify:playlist:road"), uris(answer.items));
        assertEquals("the first ask and 3 retries", 4, router.requests.size());
    }

    @Test
    public void aCallbackThatThrowsIsLoggedInsteadOfReachingSpotify() throws Exception {
        Library.fetch(context, new Library.Callback() {
            @Override
            public void loaded(List<Library.Item> items) {
                throw new IllegalStateException("the picker is gone");
            }

            @Override
            public void failed(String reason) {
                throw new IllegalStateException("the picker is gone");
            }
        });
        router.next().callback.onResponse(200, EsperantoTest.yourLibrary(false));

        awaitFetch();
        shadowOf(Looper.getMainLooper()).idle(); // would throw here without the catch

        assertTrue("the failure is logged", ShadowLog.getLogsForTag("Spicetify").stream().anyMatch(item ->
                item.throwable != null && "the picker is gone".equals(item.throwable.getMessage())));
    }

    // ---- Helpers ----

    /**
     * Attaches a router that answers Your Library's request with {@code items}, each {uri, name, image},
     * an album when its uri is one, and answers nothing else; for the picker's tests, since the bridge
     * is package-private.
     */
    public static void attachLibrary(String[]... items) {
        Wire.Writer[] entities = new Wire.Writer[items.length];
        for (int i = 0; i < items.length; i++) {
            entities[i] = namedEntity(items[i][0], items[i][1], items[i][2],
                    items[i][0].startsWith("spotify:album:") ? ALBUM : PLAYLIST);
        }
        byte[] library = EsperantoTest.yourLibrary(false, entities);
        PlayerBridge.attach(new CosmosRouter() {
            @Override
            public Cancel resolve(String action, String uri, byte[] body, Callback callback) {
                if (ALL.equals(uri)) callback.onResponse(200, library);
                return () -> {};
            }

            @Override
            public boolean destroyed() {
                return false;
            }
        });
    }

    /**
     * Returns once the bridge thread has done its part of a {@link Library#fetch} made before: the ask,
     * then the answer's handling, which the ask posts and which posts the answer to the main looper. The
     * bridge runs tasks in the order they fall due, ties in the order they were posted, so a probe posted
     * now runs after the ask, and the probe it posts runs after the answer's handling. Public for the
     * picker's tests, since the bridge is package-private. Only a hung bridge thread reaches the ceiling.
     */
    public static void awaitFetch() throws Exception {
        FutureTask<Void> probe = new FutureTask<>(() -> null);
        PlayerBridge.post(() -> PlayerBridge.post(probe));
        try {
            probe.get(PlayerBridgeTest.CEILING_SECONDS, TimeUnit.SECONDS);
        } catch (TimeoutException e) {
            throw new AssertionError("the bridge thread didn't finish the library fetch within "
                    + PlayerBridgeTest.CEILING_SECONDS + " s");
        }
    }

    private static List<String> uris(List<Library.Item> items) {
        List<String> uris = new ArrayList<>();
        for (Library.Item item : items) uris.add(item.uri);
        return uris;
    }

    private static List<String> titles(List<Library.Item> items) {
        List<String> titles = new ArrayList<>();
        for (Library.Item item : items) titles.add(item.title);
        return titles;
    }

    private static List<String> images(List<Library.Item> items) {
        List<String> images = new ArrayList<>();
        for (Library.Item item : items) images.add(item.image);
        return images;
    }

    private static List<Boolean> albums(List<Library.Item> items) {
        List<Boolean> albums = new ArrayList<>();
        for (Library.Item item : items) albums.add(item.album);
        return albums;
    }

    /** Keeps what {@link Library#fetch} told it, and whether it heard it on the main thread. */
    private static final class Answer implements Library.Callback {
        List<Library.Item> items;
        String reason;
        boolean onMain;

        @Override
        public void loaded(List<Library.Item> items) {
            onMain = Looper.myLooper() == Looper.getMainLooper();
            this.items = items;
        }

        @Override
        public void failed(String reason) {
            onMain = Looper.myLooper() == Looper.getMainLooper();
            this.reason = reason;
        }

        /** Lets the fetch end, then runs the main looper, where the answer is posted. */
        void await() throws Exception {
            awaitFetch();
            shadowOf(Looper.getMainLooper()).idle();
            assertTrue("no answer", items != null || reason != null);
        }
    }
}
