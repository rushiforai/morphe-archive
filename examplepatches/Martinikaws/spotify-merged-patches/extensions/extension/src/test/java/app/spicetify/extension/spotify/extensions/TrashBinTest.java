package app.spicetify.extension.spotify.extensions;

import static app.spicetify.extension.spotify.extensions.EsperantoTest.contextPlayerState;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import android.content.Context;
import app.spicetify.extension.spotify.extensions.PlayerBridgeTest.FakeRequest;
import app.spicetify.extension.spotify.extensions.PlayerBridgeTest.FakeRouter;
import java.util.Arrays;
import java.util.Collections;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;
import org.json.JSONException;
import org.json.JSONObject;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35, manifest = Config.NONE)
public class TrashBinTest {
    private static final String SKIP_NEXT = "sp://esperanto/spotify.player.esperanto.proto.ContextPlayer/SkipNext";
    private static final String GET_STATE = "sp://esperanto/spotify.player.esperanto.proto.ContextPlayer/GetState";

    private final Context context = RuntimeEnvironment.getApplication();
    private final FakeRouter router = new FakeRouter();
    private final BlockingQueue<Esperanto.PlayerState> seen = new LinkedBlockingQueue<>();
    private PlayerBridge.StateListener probe;

    @Before
    public void setUp() {
        Extensions.setAppContext(context);
        PlayerBridge.attach(router);
        TrashBin.clear(context);
        // The status outlives a test, so no test may pass on the line the last one left.
        Extensions.status(Extensions.TRASH_BIN, "not run");
    }

    @After
    public void tearDown() {
        Extensions.setOn(context, Extensions.TRASH_BIN, false);
        if (probe != null) PlayerBridge.removeStateListener(probe);
    }

    // ---- shouldSkip ----

    @Test
    public void shouldSkipIsFalseForAnAdEvenWhenTheTrackIsTrashed() {
        TrashBin.setSong(context, "spotify:track:a", true);
        Esperanto.PlayerState state = state("spotify:track:a", "uid-1");
        state.advertisement = true;

        assertFalse(TrashBin.shouldSkip(state));
    }

    @Test
    public void shouldSkipIsFalseForAnEpisodeEvenWhenTheArtistIsTrashed() {
        TrashBin.setArtist(context, "spotify:artist:z", true);
        Esperanto.PlayerState state = state("spotify:episode:a", "uid-1");
        state.episode = true;
        state.artistUris = Collections.singletonList("spotify:artist:z");

        assertFalse(TrashBin.shouldSkip(state));
    }

    @Test
    public void shouldSkipIsTrueForATrashedSong() {
        TrashBin.setSong(context, "spotify:track:a", true);

        assertTrue(TrashBin.shouldSkip(state("spotify:track:a", "uid-1")));
    }

    @Test
    public void shouldSkipIsTrueWhenAnyArtistIsTrashed() {
        TrashBin.setArtist(context, "spotify:artist:z", true);
        Esperanto.PlayerState state = state("spotify:track:a", "uid-1");
        state.artistUris = Arrays.asList("spotify:artist:y", "spotify:artist:z");

        assertTrue(TrashBin.shouldSkip(state));
    }

    @Test
    public void shouldSkipIsFalseOtherwise() {
        assertFalse(TrashBin.shouldSkip(state("spotify:track:a", "uid-1")));
    }

    // ---- Import and export ----

    @Test
    public void importMergesTheDesktopExportIntoTheSetsWithoutReplacingThem() throws Exception {
        TrashBin.setArtist(context, "spotify:artist:z", true);

        TrashBin.importJson(context, "{\"songs\":{\"spotify:track:a\":true},\"artists\":{\"spotify:artist:y\":true}}");

        assertTrue(TrashBin.isSongTrashed("spotify:track:a"));
        assertTrue(TrashBin.isArtistTrashed("spotify:artist:y"));
        assertTrue("import merges rather than replacing", TrashBin.isArtistTrashed("spotify:artist:z"));
    }

    @Test
    public void exportWritesTheDesktopShapeAndRoundTrips() throws Exception {
        TrashBin.setSong(context, "spotify:track:a", true);
        TrashBin.setArtist(context, "spotify:artist:z", true);

        String exported = TrashBin.exportJson();
        JSONObject root = new JSONObject(exported);
        assertTrue(root.getJSONObject("songs").getBoolean("spotify:track:a"));
        assertTrue(root.getJSONObject("artists").getBoolean("spotify:artist:z"));
        TrashBin.clear(context);
        assertFalse(TrashBin.isSongTrashed("spotify:track:a"));
        TrashBin.importJson(context, exported);

        assertTrue(TrashBin.isSongTrashed("spotify:track:a"));
        assertTrue(TrashBin.isArtistTrashed("spotify:artist:z"));
    }

    @Test(expected = JSONException.class)
    public void importRejectsMalformedJson() throws Exception {
        TrashBin.importJson(context, "not json");
    }

    @Test
    public void importRefusesAListOfTheWrongShape_andLeavesTheTrashAsItWas() throws Exception {
        TrashBin.setSong(context, "spotify:track:kept", true);
        String[] wrong = {"{}", "{\"other\":{}}", "{\"songs\":[\"spotify:track:a\"]}", "{\"songs\":null}",
                "{\"songs\":{\"spotify:track:a\":\"yes\"}}",
                // A good songs list doesn't get in when the artists aren't one.
                "{\"songs\":{\"spotify:track:a\":true},\"artists\":[]}"};
        for (String json : wrong) {
            try {
                TrashBin.importJson(context, json);
                fail("imported " + json);
            } catch (JSONException expected) {
                // The sheet says it isn't an exported trash list.
            }
            assertFalse(json, TrashBin.isSongTrashed("spotify:track:a"));
            assertTrue(json, TrashBin.isSongTrashed("spotify:track:kept"));
        }
    }

    @Test
    public void aSongOrArtistSetToFalseIsNotTrashed_asOnDesktop() throws Exception {
        TrashBin.importJson(context, "{\"songs\":{\"spotify:track:a\":false,\"spotify:track:b\":true},"
                + "\"artists\":{\"spotify:artist:z\":false}}");

        assertFalse(TrashBin.isSongTrashed("spotify:track:a"));
        assertTrue(TrashBin.isSongTrashed("spotify:track:b"));
        assertFalse(TrashBin.isArtistTrashed("spotify:artist:z"));
    }

    // ---- Guard ----

    @Test
    public void guardAllowsFiveSkipsInAnyTenSeconds() {
        TrashBin.Guard guard = new TrashBin.Guard();

        for (long millis = 0; millis <= 4000; millis += 1000) assertTrue(guard.allow(millis));
        assertFalse("a sixth within ten seconds of the first is refused", guard.allow(5000));
        assertFalse("ten seconds after the first, it still counts", guard.allow(10_000));
        assertTrue("then the first leaves the window, so one more fits", guard.allow(10_001));
        assertFalse("and that makes five in the window again", guard.allow(10_002));
    }

    // ---- The real bridge, through a fake router ----

    @Test
    public void aTrashedArtistSendsExactlyOneSkipNextAndTheSameTrackUidSendsNone() throws Exception {
        Extensions.setOn(context, Extensions.TRASH_BIN, true);
        TrashBin.setArtist(context, "spotify:artist:a1", true);
        FakeRequest stream = listen();
        assertEquals(GET_STATE, stream.uri);

        byte[] state = contextPlayerState("spotify:track:x", "trk-artist-test", "spotify:artist:a1");
        stream.callback.onResponse(200, state);
        nextState();

        assertEquals(2, router.requests.size());
        FakeRequest skip = router.requests.get(1);
        assertEquals("POST", skip.action);
        assertEquals(SKIP_NEXT, skip.uri);
        skip.callback.onResponse(200, new byte[0]);

        // The same trackUid again: no additional SkipNext. It reaches the probe after the skip's answer.
        stream.callback.onResponse(200, state);
        nextState();

        assertEquals("the same trackUid sends no additional SkipNext", 2, router.requests.size());
        assertEquals("Skipped spotify:track:x", Extensions.latestStatus(Extensions.TRASH_BIN));
    }

    @Test
    public void aForbiddenResultReportsAndDoesNotRetry() throws Exception {
        Extensions.setOn(context, Extensions.TRASH_BIN, true);
        TrashBin.setSong(context, "spotify:track:forbidden", true);
        FakeRequest stream = listen();
        byte[] state = contextPlayerState("spotify:track:forbidden", "trk-forbidden-test");
        stream.callback.onResponse(200, state);
        nextState();

        assertEquals(2, router.requests.size());
        Wire.Writer forbidden = new Wire.Writer();
        forbidden.varint(1, Esperanto.FORBIDDEN);
        router.requests.get(1).callback.onResponse(200, forbidden.toByteArray());

        // A second push lets the bridge thread finish handling the forbidden result before we assert,
        // and doubles as the "same trackUid, no retry" check.
        stream.callback.onResponse(200, state);
        nextState();

        assertEquals("Spotify refused the skip", Extensions.latestStatus(Extensions.TRASH_BIN));
        assertEquals("no retry after a forbidden result", 2, router.requests.size());
    }

    @Test
    public void aSkipThatFailsSaysSo() throws Exception {
        Extensions.setOn(context, Extensions.TRASH_BIN, true);
        TrashBin.setSong(context, "spotify:track:failing", true);
        FakeRequest stream = listen();
        byte[] state = contextPlayerState("spotify:track:failing", "trk-failing-test");
        stream.callback.onResponse(200, state);
        nextState();

        router.requests.get(1).callback.onResponse(500, new byte[0]);
        stream.callback.onResponse(200, state);
        nextState();

        assertEquals("Couldn't skip: status 500", Extensions.latestStatus(Extensions.TRASH_BIN));
    }

    @Test
    public void trashingThePlayingSongSkipsItImmediately() throws Exception {
        Extensions.setOn(context, Extensions.TRASH_BIN, true);
        FakeRequest stream = listen();
        stream.callback.onResponse(200, contextPlayerState("spotify:track:playing", "trk-playing-test"));
        nextState();
        assertEquals("not trashed yet, so only the subscription so far", 1, router.requests.size());

        TrashBin.setSong(context, "spotify:track:playing", true);

        assertEquals("trashing the playing song skips it", 2, router.requests.size());
        assertEquals(SKIP_NEXT, router.requests.get(1).uri);
    }

    @Test
    public void trashingThePlayingArtistSkipsItImmediatelyButANonPlayingArtistDoesNot() throws Exception {
        Extensions.setOn(context, Extensions.TRASH_BIN, true);
        FakeRequest stream = listen();
        stream.callback.onResponse(200,
                contextPlayerState("spotify:track:by-artist", "trk-artist-playing-test", "spotify:artist:playing"));
        nextState();
        assertEquals("not trashed yet, so only the subscription so far", 1, router.requests.size());

        TrashBin.setArtist(context, "spotify:artist:elsewhere", true);
        assertEquals("trashing an artist who isn't playing sends no skip", 1, router.requests.size());

        TrashBin.setArtist(context, "spotify:artist:playing", true);
        assertEquals("trashing the playing artist skips it immediately", 2, router.requests.size());
        assertEquals(SKIP_NEXT, router.requests.get(1).uri);
    }

    @Test
    public void offThenOnResendsSkipNextForTheSameStillPlayingTrashedTrack() throws Exception {
        Extensions.setOn(context, Extensions.TRASH_BIN, true);
        TrashBin.setSong(context, "spotify:track:cycle", true);
        // The probe stands in for another extension's listener: it keeps the stream open across the
        // off and on below, so PlayerBridge.lastState() is kept instead of forgotten.
        FakeRequest stream = listen();
        stream.callback.onResponse(200, contextPlayerState("spotify:track:cycle", "trk-cycle-test"));
        nextState();
        assertEquals("the first push skips once", 2, router.requests.size());

        Extensions.setOn(context, Extensions.TRASH_BIN, false);
        Extensions.setOn(context, Extensions.TRASH_BIN, true);

        assertEquals("turning back on looks at the still-playing trashed track again",
                3, router.requests.size());
        assertEquals(SKIP_NEXT, router.requests.get(2).uri);
    }

    @Test
    public void offSkipsNothing_evenWhenAStartRacedTheSwitchAndKeptTheListener() throws Exception {
        Extensions.setOn(context, Extensions.TRASH_BIN, true);
        TrashBin.setSong(context, "spotify:track:off", true);
        FakeRequest stream = listen();
        // Spotify's start can add the listener just after the switch went off: setOn saved the
        // switch, and here its listener never heard, so the listener stays.
        context.getSharedPreferences("spicetify_extensions", Context.MODE_PRIVATE).edit()
                .putBoolean(Extensions.TRASH_BIN, false).commit();

        stream.callback.onResponse(200, contextPlayerState("spotify:track:off", "trk-off-test"));
        nextState();

        assertEquals("off, so no SkipNext", 1, router.requests.size());
    }

    @Test
    public void turningItOffReleasesTheStreamNothingElseListensTo() {
        Extensions.setOn(context, Extensions.TRASH_BIN, true);
        FakeRequest stream = router.only(); // Trash Bin's listener opened it

        Extensions.setOn(context, Extensions.TRASH_BIN, false);

        assertTrue("its listener is gone, so the stream is released", stream.cancelled);
    }

    @Test
    public void autoSkipGoesOnAfterTheStreamEndsWithNothingPressed() throws Exception {
        // Trash Bin's listener alone: nothing else listens, and nobody presses anything.
        Extensions.setOn(context, Extensions.TRASH_BIN, true);
        TrashBin.setSong(context, "spotify:track:after-error", true);
        router.next().callback.onError(new IllegalStateException("stream gone"));

        FakeRequest reopened = router.next(); // the bridge's own retry, a second later
        assertEquals("SUB", reopened.action);
        assertEquals(GET_STATE, reopened.uri);
        reopened.callback.onResponse(200, contextPlayerState("spotify:track:after-error", "trk-after-error-test"));

        assertEquals("Trash Bin skips again", SKIP_NEXT, router.next().uri);
    }

    // ---- Helpers ----

    /** Adds the probe, which opens the stream when Trash Bin hasn't, and returns that stream. */
    private FakeRequest listen() {
        probe = seen::add;
        PlayerBridge.addStateListener(probe);
        return router.only();
    }

    /** The next state the probe heard; listeners hear a state in order, so Trash Bin has handled it too. */
    private Esperanto.PlayerState nextState() throws InterruptedException {
        Esperanto.PlayerState state = seen.poll(PlayerBridgeTest.CEILING_SECONDS, TimeUnit.SECONDS);
        assertNotNull("no state within " + PlayerBridgeTest.CEILING_SECONDS + " s", state);
        return state;
    }

    private static Esperanto.PlayerState state(String trackUri, String trackUid) {
        Esperanto.PlayerState state = new Esperanto.PlayerState();
        state.trackUri = trackUri;
        state.trackUid = trackUid;
        return state;
    }
}
