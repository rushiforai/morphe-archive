package app.spicetify.extension.spotify.extensions;

import static app.spicetify.extension.spotify.extensions.PlayerBridgeTest.CEILING_SECONDS;
import static app.spicetify.extension.spotify.extensions.PlayerBridgeTest.onBridge;
import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;
import app.spicetify.extension.spotify.extensions.PlayerBridgeTest.FakeRequest;
import app.spicetify.extension.spotify.extensions.PlayerBridgeTest.FakeRouter;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Random;
import java.util.concurrent.FutureTask;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35, manifest = Config.NONE)
public class ShufflePlusTest {
    private static final String GET_STATE = "sp://esperanto/spotify.player.esperanto.proto.ContextPlayer/GetState";
    private static final String PLAY = "sp://esperanto/spotify.player.esperanto.proto.ContextPlayer/Play";
    private static final String SKIP_NEXT = "sp://esperanto/spotify.player.esperanto.proto.ContextPlayer/SkipNext";
    private static final String PLAYLIST_GET =
            "sp://esperanto/spotify.playlist_esperanto.proto.PlaylistDataService/Get";
    private static final String GET_ENTITY =
            "sp://esperanto/spotify.metadata_esperanto.proto.ClassicMetadataService/GetEntity";
    private static final String UNSUPPORTED = "Shuffle+ works on playlists, albums and Liked Songs";
    private static final String REFUSED = "Spotify refused Shuffle+ (free accounts can't choose the order)";
    private static final String BRIDGE_THREAD = "Spicetify player bridge";
    /** The runs here shuffle with {@code new Random(SEED)}, so a test can work out the order they play. */
    private static final long SEED = 42;

    private final Context context = RuntimeEnvironment.getApplication();
    private final FakeRouter router = new FakeRouter();

    @Before
    public void setUp() {
        Extensions.setAppContext(context);
        PlayerBridge.attach(router);
        // The status outlives a test, so no test may pass on the line the last one left.
        Extensions.status(Extensions.SHUFFLE_PLUS, "not run");
    }

    @After
    public void tearDown() {
        // Off removes each switch listener, which would otherwise keep a stream open into the next test.
        Extensions.setOn(context, Extensions.SHUFFLE_PLUS, false);
        Extensions.setOn(context, Extensions.TRASH_BIN, false);
        TrashBin.clear(context);
    }

    // ---- Fisher-Yates ----

    @Test
    public void fisherYatesWithSeed42GivesOneFixedPermutationOfOneToFive() {
        List<Integer> list = new ArrayList<>(Arrays.asList(1, 2, 3, 4, 5));

        ShufflePlus.fisherYates(list, new Random(42));

        List<Integer> sorted = new ArrayList<>(list);
        Collections.sort(sorted);
        assertEquals("a permutation", Arrays.asList(1, 2, 3, 4, 5), sorted);
        assertEquals(Arrays.asList(2, 3, 4, 5, 1), list);
    }

    // ---- The state stream ----

    @Test
    public void turningShufflePlusOnKeepsThePlayerStateStreamingAndOffStopsIt() throws Exception {
        Extensions.setOn(context, Extensions.SHUFFLE_PLUS, true);

        FakeRequest stream = router.next();
        assertEquals("SUB", stream.action);
        assertEquals(GET_STATE, stream.uri);
        stream.callback.onResponse(200, state("spotify:playlist:p"));
        assertEquals("spotify:playlist:p", onBridge(PlayerBridge::lastState).contextUri);

        // On again, as when Spotify's core starts once more: still one listener and one stream.
        Extensions.setOn(context, Extensions.SHUFFLE_PLUS, true);
        assertEquals(1, router.requests.size());

        Extensions.setOn(context, Extensions.SHUFFLE_PLUS, false);

        assertTrue("with nothing else listening, off releases the stream", stream.cancelled);
        assertNull(PlayerBridge.lastState());
    }

    @Test
    public void turningShufflePlusOffLeavesTrashBinsStreamRunning() throws Exception {
        Extensions.setOn(context, Extensions.TRASH_BIN, true);
        FakeRequest stream = router.next(); // Trash Bin's listener opened it
        Extensions.setOn(context, Extensions.SHUFFLE_PLUS, true);
        stream.callback.onResponse(200, state("spotify:playlist:p", "spotify:track:kept", "uid-shuffle-kept"));
        onBridge(() -> null);

        Extensions.setOn(context, Extensions.SHUFFLE_PLUS, false);

        assertFalse("Trash Bin still listens", stream.cancelled);
        assertEquals("spotify:track:kept", PlayerBridge.lastState().trackUri);
        // Trash Bin still hears the stream: the next track, trashed, is skipped.
        TrashBin.setSong(context, "spotify:track:trashed", true);
        stream.callback.onResponse(200, state("spotify:playlist:p", "spotify:track:trashed", "uid-shuffle-trashed"));
        assertEquals(SKIP_NEXT, router.next().uri);
        assertEquals("one stream all along, then the skip", 2, router.requests.size());
    }

    @Test
    public void aStreamThatEndsOpensAgainWithNoPressAndThenShufflePlusWorks() throws Exception {
        String playlist = "spotify:playlist:p";
        FakeRequest first = playing(playlist);

        // A press in the gap can't see what's playing, and it doesn't reopen the stream itself. The
        // count is taken on the bridge thread, queued behind the press, so it runs before the reopen.
        FutureTask<Integer> sent = new FutureTask<>(router.requests::size);
        onBridge(() -> {
            first.callback.onError(new IllegalStateException("stream gone"));
            ShufflePlus.shuffleWhatsPlaying(context, 0, new Random(SEED));
            PlayerBridge.post(sent);
            return null;
        });
        assertEquals("the press sent nothing", 1, (int) sent.get(CEILING_SECONDS, TimeUnit.SECONDS));
        awaitStatus("Couldn't shuffle: Spotify hasn't said what's playing yet; try again in a moment");

        FakeRequest reopened = router.next(); // the bridge's own retry, a second after the error
        assertEquals("SUB", reopened.action);
        assertEquals(GET_STATE, reopened.uri);
        assertTrue("the stream that ended was released", first.cancelled);
        reopened.callback.onResponse(200, state(playlist));

        ShufflePlus.shuffleWhatsPlaying(context, 0, new Random(SEED));
        FakeRequest get = router.next();
        assertArrayEquals(Esperanto.playlistGet(playlist, 0, 500), get.body);
        List<String> songs = Arrays.asList("spotify:track:a", "spotify:track:b");
        get.callback.onResponse(200, RandomSongTest.playlistPage(2, songs.toArray(new String[0])));
        FakeRequest play = router.next();
        assertArrayEquals(Esperanto.playOrder(playlist, shuffled(songs)), play.body);
        play.callback.onResponse(200, new byte[0]);
        awaitStatus("Shuffled 2 songs");
    }

    @Test
    public void aSavedOnOpensTheStreamWhenSpotifysCoreStarts() throws Exception {
        context.getSharedPreferences("spicetify_extensions", Context.MODE_PRIVATE).edit()
                .putBoolean(Extensions.SHUFFLE_PLUS, true).commit();

        Extensions.startEnabled(context);

        FakeRequest stream = router.next();
        assertEquals("SUB", stream.action);
        assertEquals(GET_STATE, stream.uri);
    }

    @Test
    public void anOnFromSpotifysStartThatLostARaceWithTheSwitchGoingOffOpensNoStream() throws Exception {
        // startEnabled reads the switch as on, and the user's off is saved before the listener runs.
        AtomicInteger reads = new AtomicInteger();
        SharedPreferences saved = context.getSharedPreferences("spicetify_extensions", Context.MODE_PRIVATE);
        SharedPreferences flipping = (SharedPreferences) Proxy.newProxyInstance(
                SharedPreferences.class.getClassLoader(), new Class<?>[] {SharedPreferences.class},
                (proxy, method, args) -> {
                    boolean flips = method.getName().equals("getBoolean")
                            && Extensions.SHUFFLE_PLUS.equals(args[0]);
                    return flips ? reads.getAndIncrement() == 0 : method.invoke(saved, args);
                });
        Context racing = new ContextWrapper(context) {
            @Override
            public Context getApplicationContext() {
                return this;
            }

            @Override
            public SharedPreferences getSharedPreferences(String name, int mode) {
                return flipping;
            }
        };

        Extensions.startEnabled(racing);

        assertEquals("startEnabled's read, then the listener's", 2, reads.get());
        assertTrue("no stream for an extension that's off", router.requests.isEmpty());
    }

    // ---- Listing and playing ----

    @Test
    public void aPlaylistOf1200SongsIsListedIn3PagesThenPlayedInOneShuffledOrder() throws Exception {
        String playlist = "spotify:playlist:big";
        List<String> songs = songs(1200);
        playing(playlist);

        ShufflePlus.shuffleWhatsPlaying(context, 0, new Random(SEED));

        for (int start = 0; start < 1200; start += 500) {
            FakeRequest get = router.next();
            assertEquals(PLAYLIST_GET, get.uri);
            assertArrayEquals("the page from " + start, Esperanto.playlistGet(playlist, start, 500), get.body);
            List<String> page = songs.subList(start, Math.min(start + 500, songs.size()));
            get.callback.onResponse(200, RandomSongTest.playlistPage(1200, page.toArray(new String[0])));
        }
        FakeRequest play = router.next();
        assertEquals(PLAY, play.uri);
        assertNotEquals("the order changes", songs, shuffled(songs));
        assertArrayEquals(Esperanto.playOrder(playlist, shuffled(songs)), play.body);
        play.callback.onResponse(200, new byte[0]);

        awaitStatus("Shuffled 1200 songs");
        assertEquals("the stream, 3 pages and one Play", 5, router.requests.size());
        assertRunSentFromTheBridgeThread();
    }

    @Test
    public void aListShorterThanItsLengthEndsAtItsFirstEmptyPage() throws Exception {
        String playlist = "spotify:playlist:short";
        playing(playlist);
        ShufflePlus.shuffleWhatsPlaying(context, 0, new Random(SEED));

        List<String> songs = Arrays.asList("spotify:track:a", "spotify:track:b");
        router.next().callback.onResponse(200, RandomSongTest.playlistPage(3, songs.toArray(new String[0])));
        FakeRequest second = router.next();
        assertArrayEquals(Esperanto.playlistGet(playlist, 2, 500), second.body);
        second.callback.onResponse(200, RandomSongTest.playlistPage(3));

        FakeRequest play = router.next();
        assertEquals("an empty page ends the listing", PLAY, play.uri);
        assertArrayEquals(Esperanto.playOrder(playlist, shuffled(songs)), play.body);
        play.callback.onResponse(200, new byte[0]);
        awaitStatus("Shuffled 2 songs");
    }

    @Test
    public void anAlbumIsListedWithGetEntity() throws Exception {
        String album = "spotify:album:a";
        playing(album);

        ShufflePlus.shuffleWhatsPlaying(context, 0, new Random(SEED));

        FakeRequest entity = router.next();
        assertEquals(GET_ENTITY, entity.uri);
        assertArrayEquals(Esperanto.getEntity(album), entity.body);
        entity.callback.onResponse(200,
                RandomSongTest.albumTracks(RandomSongTest.gid(1), RandomSongTest.gid(2), RandomSongTest.gid(3)));

        List<String> tracks = new ArrayList<>();
        for (int i = 1; i <= 3; i++) tracks.add("spotify:track:" + Esperanto.base62(RandomSongTest.gid(i)));
        FakeRequest play = router.next();
        assertEquals(PLAY, play.uri);
        assertArrayEquals(Esperanto.playOrder(album, shuffled(tracks)), play.body);
        play.callback.onResponse(200, new byte[0]);

        awaitStatus("Shuffled 3 songs");
        assertEquals("the stream, GetEntity and Play", 3, router.requests.size());
    }

    @Test
    public void likedSongsByAnotherOfItsUrisIsListedAndPlayedAsTheListUri() throws Exception {
        playing("spotify:collection:tracks");

        ShufflePlus.shuffleWhatsPlaying(context, 0, new Random(SEED));

        FakeRequest get = router.next();
        assertArrayEquals(Esperanto.playlistGet(Esperanto.LIKED_SONGS, 0, 500), get.body);
        List<String> liked = Arrays.asList("spotify:track:a", "spotify:track:b", "spotify:track:c");
        get.callback.onResponse(200, RandomSongTest.playlistPage(3, liked.toArray(new String[0])));
        FakeRequest play = router.next();
        assertArrayEquals(Esperanto.playOrder(Esperanto.LIKED_SONGS, shuffled(liked)), play.body);
        play.callback.onResponse(200, new byte[0]);

        awaitStatus("Shuffled 3 songs");
    }

    @Test
    public void anArtistContextSendsNoPlayAndSaysWhatShufflePlusWorksOn() throws Exception {
        playing("spotify:artist:a");

        ShufflePlus.shuffleWhatsPlaying(context);

        RandomSongTest.awaitToast(UNSUPPORTED);
        awaitStatus(UNSUPPORTED);
        assertEquals("only the stream: no listing and no Play", 1, router.requests.size());
    }

    @Test
    public void aPlaylistWithNoSongsToListSaysSoAndPlaysNothing() throws Exception {
        playing("spotify:playlist:empty");

        ShufflePlus.shuffleWhatsPlaying(context, 0, new Random(SEED));
        router.next().callback.onResponse(200, RandomSongTest.playlistPage(0));

        RandomSongTest.awaitToast("Found no songs to shuffle");
        awaitStatus("Found no songs to shuffle");
        assertEquals("the stream and one page, and no Play", 2, router.requests.size());
    }

    // ---- Refusals ----

    @Test
    public void aPlaySpotifyRefusesSaysFreeAccountsCantChooseTheOrder() throws Exception {
        playing("spotify:playlist:p");
        ShufflePlus.shuffleWhatsPlaying(context, 0, new Random(SEED));
        router.next().callback.onResponse(200, RandomSongTest.playlistPage(2, "spotify:track:a", "spotify:track:b"));
        FakeRequest play = router.next();
        assertEquals(PLAY, play.uri);

        play.callback.onResponse(200, result(Esperanto.FORBIDDEN));

        RandomSongTest.awaitToast(REFUSED);
        awaitStatus(REFUSED);
    }

    @Test
    public void aPlayThatFailsWithAnotherErrorEndsTheRunWithIt() throws Exception {
        playing("spotify:playlist:p");
        ShufflePlus.shuffleWhatsPlaying(context, 0, new Random(SEED));
        router.next().callback.onResponse(200, RandomSongTest.playlistPage(2, "spotify:track:a", "spotify:track:b"));

        router.next().callback.onResponse(200, result(2));

        RandomSongTest.awaitToast("Couldn't shuffle: Spotify answered error 2");
        awaitStatus("Couldn't shuffle: Spotify answered error 2");
    }

    // ---- A list still loading ----

    @Test
    public void aPlaylistStillLoadingIsAskedAgainAfterTheDelayWhileTheBridgeThreadRunsOtherWork() throws Exception {
        String playlist = "spotify:playlist:slow";
        playing(playlist);
        ShufflePlus.shuffleWhatsPlaying(context, 2000, new Random(SEED));
        FakeRequest first = router.next();

        // By the bridge's own clock: a probe due 1 ms before the retry finds none, and one due as
        // late finds it. The bridge runs tasks in the order they fall due, ties in the order they
        // were posted, so a slow machine can hold the probes up but can't move them around the retry.
        FutureTask<Integer> sooner = new FutureTask<>(router.requests::size);
        FutureTask<Integer> onTime = new FutureTask<>(router.requests::size);
        onBridge(() -> {
            PlayerBridge.postDelayed(sooner, 1999); // before the answer, so due before its retry
            first.callback.onResponse(200, RandomSongTest.playlistPage(true, 1, "spotify:track:partial")); // posts the step
            PlayerBridge.post(() -> PlayerBridge.postDelayed(onTime, 2000)); // after the step put off its retry
            return null;
        });
        assertEquals("no retry within 1999 ms, and the bridge thread ran the probe meanwhile",
                2, (int) sooner.get(CEILING_SECONDS, TimeUnit.SECONDS));
        assertEquals("the retry by 2000 ms", 3, (int) onTime.get(CEILING_SECONDS, TimeUnit.SECONDS));

        FakeRequest retry = router.next();
        assertArrayEquals("the same page again, since a loading answer's songs don't count", first.body, retry.body);
        List<String> songs = Arrays.asList("spotify:track:a", "spotify:track:b");
        retry.callback.onResponse(200, RandomSongTest.playlistPage(2, songs.toArray(new String[0])));
        FakeRequest play = router.next();
        assertArrayEquals(Esperanto.playOrder(playlist, shuffled(songs)), play.body);
        play.callback.onResponse(200, new byte[0]);
        awaitStatus("Shuffled 2 songs");
    }

    @Test
    public void aPlaylistStillLoadingAfterThreeRetriesEndsTheRun() throws Exception {
        playing("spotify:playlist:stuck");

        ShufflePlus.shuffleWhatsPlaying(context, 0, new Random(SEED));
        for (int i = 0; i < 4; i++) router.next().callback.onResponse(200, RandomSongTest.playlistPage(true, 0));

        RandomSongTest.awaitToast("Couldn't shuffle: the playlist is still loading");
        awaitStatus("Couldn't shuffle: the playlist is still loading");
        assertEquals("the stream, the first ask and 3 retries, and no Play", 5, router.requests.size());
    }

    // ---- No player state ----

    @Test
    public void offNothingShufflesEvenWhileTrashBinsStreamSaysWhatsPlaying() throws Exception {
        // Off, with nothing listening to the player: nothing sent and nothing said.
        ShufflePlus.shuffleWhatsPlaying(context, 0, new Random(SEED));
        onBridge(() -> null); // runs after the run
        assertTrue("nothing sent", router.requests.isEmpty());

        // Trash Bin keeps the stream open, and it says a playlist is playing: still nothing shuffles.
        Extensions.setOn(context, Extensions.TRASH_BIN, true);
        router.next().callback.onResponse(200, state("spotify:playlist:p"));
        ShufflePlus.shuffleWhatsPlaying(context, 0, new Random(SEED));
        ShufflePlus.shuffle(context, "spotify:playlist:asked", 0, new Random(SEED)); // a menu opened before it went off
        onBridge(() -> null); // runs after the state and the runs
        assertEquals("only Trash Bin's stream", 1, router.requests.size());
        assertEquals("nothing said", "not run", Extensions.latestStatus(Extensions.SHUFFLE_PLUS));
    }

    @Test
    public void onButBeforeTheFirstStateItSaysSpotifyHasntSaidWhatsPlaying() throws Exception {
        Extensions.setOn(context, Extensions.SHUFFLE_PLUS, true);
        assertEquals(GET_STATE, router.next().uri); // open, and no state has come yet

        ShufflePlus.shuffleWhatsPlaying(context, 0, new Random(SEED));

        String line = "Couldn't shuffle: Spotify hasn't said what's playing yet; try again in a moment";
        RandomSongTest.awaitToast(line);
        awaitStatus(line);
        assertEquals("only the stream", 1, router.requests.size());
    }

    @Test
    public void aStateWithNoContextSaysWhatShufflePlusWorksOn() throws Exception {
        playing(null); // nothing loaded, so the state has no context_uri

        ShufflePlus.shuffleWhatsPlaying(context, 0, new Random(SEED));

        RandomSongTest.awaitToast(UNSUPPORTED);
        awaitStatus(UNSUPPORTED);
        assertEquals("only the stream", 1, router.requests.size());
    }

    // ---- A list asked for, from the playlist menu ----

    @Test
    public void aPlaylistAskedForIsListedAndPlayedBeforeSpotifySaysWhatsPlaying() throws Exception {
        Extensions.setOn(context, Extensions.SHUFFLE_PLUS, true);
        assertEquals(GET_STATE, router.next().uri); // open, and no state has come yet
        String playlist = "spotify:playlist:asked";

        ShufflePlus.shuffle(context, playlist, 0, new Random(SEED));

        FakeRequest get = router.next();
        assertEquals(PLAYLIST_GET, get.uri);
        assertArrayEquals(Esperanto.playlistGet(playlist, 0, 500), get.body);
        List<String> songs = Arrays.asList("spotify:track:a", "spotify:track:b", "spotify:track:c");
        get.callback.onResponse(200, RandomSongTest.playlistPage(3, songs.toArray(new String[0])));
        FakeRequest play = router.next();
        assertEquals(PLAY, play.uri);
        assertArrayEquals(Esperanto.playOrder(playlist, shuffled(songs)), play.body);
        play.callback.onResponse(200, new byte[0]);

        awaitStatus("Shuffled 3 songs");
        assertNull("still nothing said about what's playing", PlayerBridge.lastState());
        assertRunSentFromTheBridgeThread();
    }

    @Test
    public void likedSongsAskedForWhileAnotherListPlaysIsListedAndPlayedAsTheListUri() throws Exception {
        playing("spotify:playlist:other");

        ShufflePlus.shuffle(context, "spotify:collection:tracks", 0, new Random(SEED));

        FakeRequest get = router.next();
        assertArrayEquals(Esperanto.playlistGet(Esperanto.LIKED_SONGS, 0, 500), get.body);
        List<String> liked = Arrays.asList("spotify:track:a", "spotify:track:b", "spotify:track:c");
        get.callback.onResponse(200, RandomSongTest.playlistPage(3, liked.toArray(new String[0])));
        FakeRequest play = router.next();
        assertArrayEquals(Esperanto.playOrder(Esperanto.LIKED_SONGS, shuffled(liked)), play.body);
        play.callback.onResponse(200, new byte[0]);

        awaitStatus("Shuffled 3 songs");
    }

    // ---- Helpers ----

    /**
     * Turns Shuffle+ on, which opens the state stream, and answers it with {@code contextUri} playing,
     * or no context when it's null. The bridge thread takes that state before any run posted after
     * this returns.
     */
    private FakeRequest playing(String contextUri) throws InterruptedException {
        Extensions.setOn(context, Extensions.SHUFFLE_PLUS, true);
        FakeRequest stream = router.next();
        assertEquals(GET_STATE, stream.uri);
        stream.callback.onResponse(200, state(contextUri));
        return stream;
    }

    /** Waits for Shuffle+'s latest status to read {@code line}. */
    static void awaitStatus(String line) throws InterruptedException {
        RandomSongTest.awaitStatus(Extensions.SHUFFLE_PLUS, line);
    }

    /** A run sends every request from the bridge thread; only the state stream went out from the test's. */
    private void assertRunSentFromTheBridgeThread() {
        for (FakeRequest request : router.requests) {
            if (!GET_STATE.equals(request.uri)) assertEquals(request.uri, BRIDGE_THREAD, request.thread);
        }
    }

    /** {@code songs} in the order a run shuffling with {@code new Random(SEED)} plays them. */
    static List<String> shuffled(List<String> songs) {
        List<String> order = new ArrayList<>(songs);
        ShufflePlus.fisherYates(order, new Random(SEED));
        return order;
    }

    private static List<String> songs(int count) {
        List<String> songs = new ArrayList<>();
        for (int i = 0; i < count; i++) songs.add("spotify:track:song" + i);
        return songs;
    }

    /** A {@code ContextPlayerState} in {@code contextUri}, or with no context when it's null. */
    static byte[] state(String contextUri) {
        return state(contextUri, "spotify:track:now", "uid-now");
    }

    private static byte[] state(String contextUri, String trackUri, String trackUid) {
        Wire.Writer contextTrack = new Wire.Writer();
        contextTrack.string(1, trackUri);
        contextTrack.string(2, trackUid);
        Wire.Writer providedTrack = new Wire.Writer();
        providedTrack.message(1, contextTrack);
        Wire.Writer state = new Wire.Writer();
        if (contextUri != null) state.string(2, contextUri);
        state.message(7, providedTrack);
        return state.toByteArray();
    }

    /** A {@code ResponseWithReasons} whose error is {@code error}. */
    private static byte[] result(int error) {
        Wire.Writer result = new Wire.Writer();
        result.varint(1, error);
        return result.toByteArray();
    }
}
