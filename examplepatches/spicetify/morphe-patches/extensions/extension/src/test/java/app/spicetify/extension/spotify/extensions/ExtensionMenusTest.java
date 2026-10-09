package app.spicetify.extension.spotify.extensions;

import static app.spicetify.extension.spotify.extensions.PlayerBridgeTest.onBridge;
import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import app.spicetify.extension.spotify.extensions.PlayerBridgeTest.FakeRequest;
import app.spicetify.extension.spotify.extensions.PlayerBridgeTest.FakeRouter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
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
public class ExtensionMenusTest {
    private static final String PLAY = "sp://esperanto/spotify.player.esperanto.proto.ContextPlayer/Play";
    private static final String PLAYLIST_GET =
            "sp://esperanto/spotify.playlist_esperanto.proto.PlaylistDataService/Get";

    private final Context context = RuntimeEnvironment.getApplication();

    @Before
    public void setUp() {
        Extensions.setAppContext(context);
        TrashBin.clear(context);
        // The status outlives a test, so no test may pass on the line the last one left.
        Extensions.status(Extensions.TRASH_BIN, "not run");
        Extensions.status(Extensions.SHUFFLE_PLUS, "not run");
    }

    @After
    public void tearDown() {
        Extensions.setOn(context, Extensions.TRASH_BIN, false);
        Extensions.setOn(context, Extensions.SHUFFLE_PLUS, false);
    }

    @Test
    public void aSongThatIsNotTrashedCanBeThrownToTrash() {
        Extensions.setOn(context, Extensions.TRASH_BIN, true);

        assertEquals(Collections.singletonList("trash_song|Throw song to trash"),
                rows(ExtensionMenus.trackItems(new Track(new Metadata("spotify:track:a")))));
    }

    @Test
    public void aTrashedSongCanBeTakenOut() {
        Extensions.setOn(context, Extensions.TRASH_BIN, true);
        TrashBin.setSong(context, "spotify:track:a", true);

        assertEquals(Collections.singletonList("trash_song|Take song out of trash"),
                rows(ExtensionMenus.trackItems(new Track(new Metadata("spotify:track:a")))));
    }

    @Test
    public void withTrashBinOffBothMenusGetNothing() {
        assertTrue(ExtensionMenus.trackItems(new Track(new Metadata("spotify:track:a"))).isEmpty());
        assertTrue(ExtensionMenus.artistItems(new Artist(new Metadata("spotify:artist:z"))).isEmpty());
    }

    @Test
    public void withoutAUriThereIsNoTrashItemAndTheTapDoesNothing() throws Exception {
        Extensions.setOn(context, Extensions.TRASH_BIN, true);
        Object[] noUri = {new Object(), new Track(null), new Track(new Metadata(""))};

        for (Object track : noUri) {
            assertTrue(ExtensionMenus.trackItems(track).isEmpty());
            ExtensionMenus.onTrackItem("trash_song", track);
        }
        assertTrue(ExtensionMenus.artistItems(new Object()).isEmpty());
        ExtensionMenus.onArtistItem("trash_artist", new Artist(new Metadata("")));

        JSONObject trash = new JSONObject(TrashBin.exportJson());
        assertEquals("no song was trashed", 0, trash.getJSONObject("songs").length());
        assertEquals("no artist was trashed", 0, trash.getJSONObject("artists").length());
        // artistItems(new Object()) was the last reflection failure.
        assertEquals("Couldn't read the menu's artistMetadata_: java.lang.NoSuchFieldException: artistMetadata_",
                Extensions.latestStatus(Extensions.TRASH_BIN));
    }

    @Test
    public void aGetLinkThatThrowsDropsTheTrashItem() {
        Extensions.setOn(context, Extensions.TRASH_BIN, true);

        assertTrue(ExtensionMenus.trackItems(new Track(new ThrowingMetadata())).isEmpty());
    }

    @Test
    public void theTrashSongItemTogglesTheMenusSong() {
        Track track = new Track(new Metadata("spotify:track:a"));

        ExtensionMenus.onTrackItem("trash_song", track);
        assertTrue(TrashBin.isSongTrashed("spotify:track:a"));

        ExtensionMenus.onTrackItem("trash_song", track);
        assertFalse(TrashBin.isSongTrashed("spotify:track:a"));
    }

    @Test
    public void anotherIdDoesNothing() {
        Track track = new Track(new Metadata("spotify:track:a"));

        ExtensionMenus.onTrackItem("trash_artist", track);
        ExtensionMenus.onArtistItem("trash_song", new Artist(new Metadata("spotify:artist:z")));

        assertFalse(TrashBin.isSongTrashed("spotify:track:a"));
        assertFalse(TrashBin.isArtistTrashed("spotify:artist:z"));
    }

    @Test
    public void theArtistMenuThrowsTheArtistToTrashAndTakesItBack() {
        Extensions.setOn(context, Extensions.TRASH_BIN, true);
        Artist artist = new Artist(new Metadata("spotify:artist:z"));

        assertEquals(Collections.singletonList("trash_artist|Throw artist to trash"),
                rows(ExtensionMenus.artistItems(artist)));
        ExtensionMenus.onArtistItem("trash_artist", artist);
        assertTrue(TrashBin.isArtistTrashed("spotify:artist:z"));
        assertEquals(Collections.singletonList("trash_artist|Take artist out of trash"),
                rows(ExtensionMenus.artistItems(artist)));

        ExtensionMenus.onArtistItem("trash_artist", artist);
        assertFalse(TrashBin.isArtistTrashed("spotify:artist:z"));
    }

    @Test
    public void thePlaylistMenuOffersShufflePlusForAPlaylistOrLikedSongsWhileShufflePlusIsOn() {
        Extensions.setOn(context, Extensions.SHUFFLE_PLUS, true);
        String[] lists = {"spotify:playlist:p", Esperanto.LIKED_SONGS, "spotify:collection:tracks",
                "spotify:internal:collection:tracks", "spotify:user:someone:collection"};

        for (String uri : lists) {
            assertArrayEquals(uri, new String[] {"shuffle_playlist", "Shuffle+ this playlist"},
                    ExtensionMenus.playlistItem(uri));
        }
    }

    @Test
    public void thePlaylistMenuOffersNothingForAnAlbumOrAnArtistOrWithShufflePlusOff() {
        Extensions.setOn(context, Extensions.SHUFFLE_PLUS, true);
        for (String uri : new String[] {"spotify:album:a", "spotify:artist:z", "", null}) {
            assertNull(uri, ExtensionMenus.playlistItem(uri));
        }

        Extensions.setOn(context, Extensions.SHUFFLE_PLUS, false);
        Extensions.setOn(context, Extensions.TRASH_BIN, true);
        assertNull(ExtensionMenus.playlistItem("spotify:playlist:p"));
        assertNull(ExtensionMenus.playlistItem("spotify:collection:tracks"));
    }

    @Test
    public void aTapOnThePlaylistItemListsAndPlaysThatPlaylistWithNothingPlaying() throws Exception {
        FakeRouter router = new FakeRouter();
        PlayerBridge.attach(router);
        Extensions.setOn(context, Extensions.SHUFFLE_PLUS, true);
        FakeRequest stream = router.next();
        assertEquals("SUB", stream.action);
        stream.callback.onResponse(200, ShufflePlusTest.state(null)); // nothing loaded
        String playlist = "spotify:playlist:p";

        ExtensionMenus.onPlaylistItem("shuffle_playlist", playlist);

        FakeRequest get = router.next();
        assertEquals(PLAYLIST_GET, get.uri);
        assertArrayEquals(Esperanto.playlistGet(playlist, 0, 500), get.body);
        assertEquals("the tap only posts the run", "Spicetify player bridge", get.thread);
        get.callback.onResponse(200, RandomSongTest.playlistPage(2, "spotify:track:a", "spotify:track:b"));
        FakeRequest play = router.next();
        assertEquals(PLAY, play.uri);
        // The menu's run shuffles with SecureRandom, so either order of the two songs is right.
        assertTrue("plays that playlist in a shuffled order",
                Arrays.equals(Esperanto.playOrder(playlist, Arrays.asList("spotify:track:a", "spotify:track:b")), play.body)
                        || Arrays.equals(Esperanto.playOrder(playlist,
                                Arrays.asList("spotify:track:b", "spotify:track:a")), play.body));
        play.callback.onResponse(200, new byte[0]);
        ShufflePlusTest.awaitStatus("Shuffled 2 songs");
    }

    @Test
    public void anotherIdOrATargetThatIsNotAUriDoesNothingFromThePlaylistMenu() throws Exception {
        FakeRouter router = new FakeRouter();
        PlayerBridge.attach(router);
        Extensions.setOn(context, Extensions.SHUFFLE_PLUS, true); // so only the id and the target can stop a run
        assertEquals("SUB", router.next().action);

        ExtensionMenus.onPlaylistItem("trash_song", "spotify:playlist:p");
        ExtensionMenus.onPlaylistItem("shuffle_playlist", new Object());

        onBridge(() -> null); // runs after anything a tap posted
        assertEquals("only the stream: nothing listed or played", 1, router.requests.size());
    }

    private static List<String> rows(List<String[]> items) {
        List<String> rows = new ArrayList<>();
        for (String[] item : items) rows.add(String.join("|", item));
        return rows;
    }

    /** Stands in for CollectionTrack: R8 renamed its getter, but protobuf-lite needs the field's name. */
    private static final class Track {
        @SuppressWarnings({"unused", "FieldCanBeLocal"})
        private final Object trackMetadata_;

        Track(Object metadata) {
            trackMetadata_ = metadata;
        }
    }

    /** Stands in for CollectionArtist, the same way. */
    private static final class Artist {
        @SuppressWarnings({"unused", "FieldCanBeLocal"})
        private final Object artistMetadata_;

        Artist(Object metadata) {
            artistMetadata_ = metadata;
        }
    }

    /** Stands in for TrackMetadata and ArtistMetadata, whose getLink() keeps its name. */
    public static final class Metadata {
        private final String link;

        Metadata(String link) {
            this.link = link;
        }

        public String getLink() {
            return link;
        }
    }

    /** Metadata whose getLink() throws. */
    public static final class ThrowingMetadata {
        public String getLink() {
            throw new IllegalStateException("boom");
        }
    }
}
