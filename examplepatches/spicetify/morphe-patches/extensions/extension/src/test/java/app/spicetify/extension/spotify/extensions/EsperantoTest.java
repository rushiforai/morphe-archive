package app.spicetify.extension.spotify.extensions;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.junit.Test;

public class EsperantoTest {
    // ---- State ----

    @Test
    public void parseStateReadsTheContextTheTrackItsArtistsAndAdvertisement() throws IOException {
        Esperanto.PlayerState parsed = Esperanto.parseState(contextPlayerState("spotify:track:x"));

        assertEquals("spotify:playlist:p", parsed.contextUri);
        assertEquals("spotify:track:x", parsed.trackUri);
        assertEquals("uid-1", parsed.trackUid);
        assertEquals(Arrays.asList("spotify:artist:a1", "spotify:artist:a2"), parsed.artistUris);
        assertFalse(parsed.advertisement);
        assertFalse(parsed.episode);
    }

    @Test
    public void parseStateReadsAnAdvertisement() throws IOException {
        Wire.Writer contextTrack = new Wire.Writer();
        contextTrack.string(1, "spotify:ad:x");
        contextTrack.message(3, metadataEntry("is_advertisement", "true"));

        assertTrue(Esperanto.parseState(state(contextTrack)).advertisement);
    }

    @Test
    public void parseStateLeavesTheContextNullWhenNothingIsLoaded() throws IOException {
        Wire.Writer contextTrack = new Wire.Writer();
        contextTrack.string(1, "spotify:track:x");

        assertNull(Esperanto.parseState(state(contextTrack)).contextUri);
    }

    @Test
    public void parseStateDetectsEpisodeTracks() throws IOException {
        for (String uri : new String[] {"spotify:episode:x", "spotify:podcast-chapter:x", "spotify:clip:x"}) {
            Wire.Writer contextTrack = new Wire.Writer();
            contextTrack.string(1, uri);
            assertTrue(uri, Esperanto.parseState(state(contextTrack)).episode);
        }
    }

    // ---- Request builders ----

    @Test
    public void getStateAsksForNoTracksBeforeOrAfterTheCurrentOne() {
        // prev_tracks_cap{value 0}, next_tracks_cap{value 0}
        assertArrayEquals(new byte[] {0x0a, 0x02, 0x08, 0x00, 0x12, 0x02, 0x08, 0x00}, Esperanto.getState());
    }

    @Test
    public void skipNextHasNoFieldsAndItsResultIsTheErrorCode() throws IOException {
        assertEquals(0, Esperanto.skipNext().length);

        Wire.Writer forbidden = new Wire.Writer();
        forbidden.varint(1, Esperanto.FORBIDDEN);
        forbidden.string(2, "reason");
        assertEquals(Esperanto.FORBIDDEN, Esperanto.parseResult(forbidden.toByteArray()));
        assertEquals("no error field means it worked", 0, Esperanto.parseResult(new byte[0]));
    }

    @Test
    public void playContextSetsTheContextAndAnOptionalSkipTo() throws IOException {
        byte[] withSkip = Esperanto.playContext("spotify:playlist:p", "spotify:track:a");
        byte[] prepare = nestedBytes(withSkip, 1);
        byte[] context = nestedBytes(prepare, 1);
        assertEquals("spotify:playlist:p", stringField(context, 3));
        assertEquals("context://spotify:playlist:p", stringField(context, 4));
        byte[] skipTo = nestedBytes(nestedBytes(prepare, 2), 3);
        assertEquals("spotify:track:a", stringField(skipTo, 4));

        byte[] withoutSkip = Esperanto.playContext("spotify:track:a", null);
        assertTrue("no options", repeatedNestedBytes(nestedBytes(withoutSkip, 1), 2).isEmpty());
    }

    @Test
    public void playOrderPlaysTheListAsOneExplicitPageFromItsFirstSongWithSpotifysShuffleOff() throws IOException {
        byte[] request = Esperanto.playOrder("spotify:playlist:p", Arrays.asList("spotify:track:b", "spotify:track:a"));
        byte[] prepare = nestedBytes(request, 1);

        byte[] context = nestedBytes(prepare, 1);
        assertEquals("spotify:playlist:p", stringField(context, 3));
        assertTrue("no url, which could let the core load the context again", repeatedNestedBytes(context, 4).isEmpty());
        List<byte[]> pages = repeatedNestedBytes(context, 1);
        assertEquals(1, pages.size());
        List<byte[]> tracks = repeatedNestedBytes(pages.get(0), 1);
        assertEquals(2, tracks.size());
        assertEquals("spotify:track:b", stringField(tracks.get(0), 1));
        assertEquals("spotify:track:a", stringField(tracks.get(1), 1));

        byte[] options = nestedBytes(prepare, 2);
        assertEquals("from track index 0", 0L, varintField(nestedBytes(nestedBytes(options, 3), 5), 1));
        assertEquals("shuffling_context false", 0L, varintField(nestedBytes(nestedBytes(options, 7), 1), 1));
    }

    @Test
    public void playlistGetAsksForARangeWithTheListsLength() throws IOException {
        byte[] request = Esperanto.playlistGet("spotify:playlist:p", 10, 5);
        assertEquals("spotify:playlist:p", stringField(request, 1));

        byte[] query = nestedBytes(request, 2);
        assertArrayEquals(new byte[] {4, 3, 7, 6}, nestedBytes(query, 1));
        assertEquals("show_unavailable off", 0L, varintField(query, 8));
        byte[] range = nestedBytes(query, 4);
        assertEquals(10L, varintField(range, 1));
        assertEquals(5L, varintField(range, 2));

        byte[] policy = nestedBytes(request, 3);
        assertEquals("unranged_length", 1L, varintField(nestedBytes(policy, 1), 49));
        assertEquals("each item's uri", 1L, varintField(nestedBytes(policy, 4), 1));
    }

    @Test
    public void getEntityAsksForTheUri() throws IOException {
        assertEquals("spotify:album:a", stringField(Esperanto.getEntity("spotify:album:a"), 1));
    }

    @Test
    public void yourLibraryAllEncodesTheAppsRequestWithItsFieldsInOrder() {
        // header{12 length 0x7fffffff, 14 filters{1 [PLAYLIST 2, ALBUM 0]}, 17 all_playlists,
        // 25 num_link_types_in_playlists, 26 ignore_pinning}
        assertArrayEquals(hexToBytes("0a15" + "60ffffffff07" + "72040a020200" + "880101" + "c80101" + "d00101"),
                Esperanto.yourLibraryAll());
    }

    // ---- Response parsers ----

    @Test
    public void parsePlaylistGetReadsAForbiddenGoneOrBlockedListAsEmptyAndFailsOnOtherErrors() throws IOException {
        for (int status : new int[] {403, 404, 451}) {
            Esperanto.PlaylistPage page = parsePlaylistGetWithStatus(status);
            assertTrue(page.uris.isEmpty());
            assertEquals(0, page.length);
        }
        try {
            parsePlaylistGetWithStatus(500);
            fail("expected IOException");
        } catch (IOException expected) {
            assertEquals("status 500", expected.getMessage());
        }
    }

    @Test
    public void parsePlaylistGetReadsTheItemsAndTheLength() throws IOException {
        Wire.Writer status = new Wire.Writer();
        status.varint(1, 200);
        Wire.Writer itemA = new Wire.Writer();
        itemA.string(18, "spotify:track:a");
        Wire.Writer itemB = new Wire.Writer();
        itemB.string(18, "spotify:track:b");
        Wire.Writer data = new Wire.Writer();
        data.message(1, itemA);
        data.message(1, itemB);
        data.varint(4, 42);
        Wire.Writer response = new Wire.Writer();
        response.message(1, status);
        response.message(2, data);

        Esperanto.PlaylistPage page = Esperanto.parsePlaylistGet(response.toByteArray());

        assertEquals(Arrays.asList("spotify:track:a", "spotify:track:b"), page.uris);
        assertEquals(42, page.length);
        assertFalse(page.loading);
    }

    @Test
    public void parsePlaylistGetReadsWhetherTheCoreIsStillLoadingTheList() throws IOException {
        Wire.Writer status = new Wire.Writer();
        status.varint(1, 200);
        Wire.Writer data = new Wire.Writer();
        data.varint(4, 42);
        data.bool(6, true);
        Wire.Writer response = new Wire.Writer();
        response.message(1, status);
        response.message(2, data);

        assertTrue(Esperanto.parsePlaylistGet(response.toByteArray()).loading);
    }

    @Test
    public void parseAlbumTracksWalksDiscsAndTracks() throws IOException {
        byte[] gidA = new byte[16];
        gidA[15] = 1;
        byte[] gidB = new byte[16];
        gidB[15] = 2;
        Wire.Writer trackA = new Wire.Writer();
        trackA.bytes(1, gidA);
        Wire.Writer trackB = new Wire.Writer();
        trackB.bytes(1, gidB);
        Wire.Writer disc = new Wire.Writer();
        disc.message(3, trackA);
        disc.message(3, trackB);
        Wire.Writer album = new Wire.Writer();
        album.message(11, disc);
        Wire.Writer item = new Wire.Writer();
        item.message(3, album);
        Wire.Writer response = new Wire.Writer();
        response.message(1, item);

        assertEquals(Arrays.asList("spotify:track:" + Esperanto.base62(gidA), "spotify:track:" + Esperanto.base62(gidB)),
                Esperanto.parseAlbumTracks(response.toByteArray()));
    }

    @Test
    public void parseYourLibraryGivesLikedSongsFirstThenEachPlaylistAndAlbumOnce() throws IOException {
        Wire.Writer response = new Wire.Writer();
        response.message(1, new Wire.Writer());
        response.message(2, libraryEntity("spotify:playlist:p", 4, countedPlaylist(12)));
        // An album whose member is empty: the case is in the tag.
        response.message(2, libraryEntity("spotify:album:a", 2, new Wire.Writer()));
        Wire.Writer folder = new Wire.Writer();
        folder.varint(2, 3);
        response.message(2, libraryEntity("spotify:user:u:folder:00000000000000ff", 6, folder));
        response.message(2, libraryEntity("spotify:collection:tracks", 4, countedPlaylist(40)));
        response.message(3, libraryEntity("spotify:playlist:p", 4, countedPlaylist(99)));
        response.message(3, libraryEntity("spotify:playlist:pinned", 4, countedPlaylist(5)));
        response.varint(98, 200);

        Esperanto.Library library = Esperanto.parseYourLibrary(response.toByteArray());

        assertFalse(library.loading);
        List<String> uris = new ArrayList<>();
        for (Esperanto.LibrarySource source : library.sources) uris.add(source.uri);
        assertEquals(Arrays.asList(Esperanto.LIKED_SONGS, "spotify:playlist:p", "spotify:album:a", "spotify:playlist:pinned"),
                uris);
        assertFalse(library.sources.get(0).album);
        assertEquals("Liked Songs is sized by its playable length", -1, library.sources.get(0).trackCount);
        assertFalse(library.sources.get(1).album);
        assertEquals("the TRACK count, from the first occurrence", 12, library.sources.get(1).trackCount);
        assertTrue(library.sources.get(2).album);
        assertEquals(-1, library.sources.get(2).trackCount);
    }

    @Test
    public void parseYourLibraryReportsLoadingAndFailsWithTheErrorOfAStatusOtherThan200() throws IOException {
        Wire.Writer header = new Wire.Writer();
        header.bool(12, true);
        Wire.Writer loading = new Wire.Writer();
        loading.message(1, header);
        loading.varint(98, 200);
        assertTrue(Esperanto.parseYourLibrary(loading.toByteArray()).loading);

        Wire.Writer failed = new Wire.Writer();
        failed.varint(98, 500);
        failed.string(99, "database error");
        try {
            Esperanto.parseYourLibrary(failed.toByteArray());
            fail("expected IOException");
        } catch (IOException expected) {
            assertEquals("status 500: database error", expected.getMessage());
        }
    }

    @Test
    public void likedSongsGoesByTheFourUrisTheAppAccepts() {
        assertTrue(Esperanto.isLikedSongs("spotify:playlist:37i9dQZF1F5p3rmiWPIYgZ"));
        assertTrue(Esperanto.isLikedSongs("spotify:collection:tracks"));
        assertTrue(Esperanto.isLikedSongs("spotify:internal:collection:tracks"));
        assertTrue(Esperanto.isLikedSongs("spotify:user:someone:collection"));
        assertFalse(Esperanto.isLikedSongs("spotify:playlist:37i9dQZF1EYkqdzj48dyYq"));
        assertFalse(Esperanto.isLikedSongs("spotify:user:someone:collection:artist"));
        assertFalse(Esperanto.isLikedSongs("spotify:user:someone:playlist:x"));
    }

    @Test
    public void base62EncodesKnownGids() {
        byte[] one = new byte[16];
        one[15] = 1;
        assertEquals("0000000000000000000001", Esperanto.base62(one));
        byte[] allFf = new byte[16];
        Arrays.fill(allFf, (byte) 0xFF);
        assertEquals("7N42dgm5tFLK9N8MT7fHC7", Esperanto.base62(allFf));
        assertEquals("4uLU6hMCjMI75M1A2tKUQC", Esperanto.base62(hexToBytes("93bc414a606747b2b612491ef83d5a3e")));
    }

    @Test
    public void parseYourLibraryReadsEachEntitysNameAndCover() throws IOException {
        Wire.Writer response = new Wire.Writer();
        response.message(2, namedEntity("spotify:playlist:p", "Road trip", "spotify:image:p", 4));
        response.message(2, namedEntity("spotify:album:a", "Blue", null, 2));
        response.varint(98, 200);

        Esperanto.Library library = Esperanto.parseYourLibrary(response.toByteArray());

        List<String> names = new ArrayList<>();
        List<String> images = new ArrayList<>();
        for (Esperanto.LibrarySource source : library.sources) {
            names.add(source.name);
            images.add(source.image);
        }
        assertEquals("Liked Songs first, without a name of its own", Arrays.asList(null, "Road trip", "Blue"), names);
        assertEquals(Arrays.asList(null, "spotify:image:p", null), images);
    }

    // ---- Fixtures ----

    /**
     * A {@code ContextPlayerState} playing {@code trackUri} (uid {@code uid-1}) in {@code
     * spotify:playlist:p}: artists {@code a1} and {@code a2} plus a blank third, {@code
     * is_advertisement=false}, and a playback id the parser skips. Other tests send it as a state body.
     */
    static byte[] contextPlayerState(String trackUri) {
        Wire.Writer contextTrack = new Wire.Writer();
        contextTrack.string(1, trackUri);
        contextTrack.string(2, "uid-1");
        contextTrack.message(3, metadataEntry("artist_uri", "spotify:artist:a1"));
        contextTrack.message(3, metadataEntry("artist_uri:1", "spotify:artist:a2"));
        contextTrack.message(3, metadataEntry("artist_uri:2", ""));
        contextTrack.message(3, metadataEntry("is_advertisement", "false"));

        Wire.Writer providedTrack = new Wire.Writer();
        providedTrack.message(1, contextTrack);

        Wire.Writer state = new Wire.Writer();
        state.string(2, "spotify:playlist:p");
        state.message(7, providedTrack);
        state.string(8, "playback-1");
        return state.toByteArray();
    }

    /** A {@code ContextPlayerState} playing {@code trackUri} as row {@code trackUid}, by {@code artistUris}. */
    static byte[] contextPlayerState(String trackUri, String trackUid, String... artistUris) {
        Wire.Writer contextTrack = new Wire.Writer();
        contextTrack.string(1, trackUri);
        contextTrack.string(2, trackUid);
        for (int i = 0; i < artistUris.length; i++) {
            contextTrack.message(3, metadataEntry(i == 0 ? "artist_uri" : "artist_uri:" + i, artistUris[i]));
        }
        return state(contextTrack);
    }

    private static byte[] state(Wire.Writer contextTrack) {
        Wire.Writer providedTrack = new Wire.Writer();
        providedTrack.message(1, contextTrack);
        Wire.Writer state = new Wire.Writer();
        state.message(7, providedTrack);
        return state.toByteArray();
    }

    private static Wire.Writer metadataEntry(String key, String value) {
        Wire.Writer entry = new Wire.Writer();
        entry.string(1, key);
        entry.string(2, value);
        return entry;
    }

    /** A {@code YourLibraryDecoratedEntity} for {@code uri} whose oneof member is field {@code kind}. */
    static Wire.Writer libraryEntity(String uri, int kind, Wire.Writer member) {
        Wire.Writer info = new Wire.Writer();
        info.string(3, uri);
        Wire.Writer entity = new Wire.Writer();
        entity.message(1, info);
        entity.message(kind, member);
        return entity;
    }

    /** A {@code YourLibraryPlaylistExtraInfo} counting {@code tracks} songs (link type 4), then 2 episodes (63). */
    static Wire.Writer countedPlaylist(int tracks) {
        Wire.Writer playlist = new Wire.Writer();
        playlist.message(12, linkTypeCount(4, tracks));
        playlist.message(12, linkTypeCount(63, 2));
        return playlist;
    }

    private static Wire.Writer linkTypeCount(int linkType, int items) {
        Wire.Writer count = new Wire.Writer();
        count.varint(1, linkType);
        count.varint(2, items);
        return count;
    }

    /** A {@code YourLibraryResponse} with status 200 listing {@code entities}, still loading or not. */
    static byte[] yourLibrary(boolean loading, Wire.Writer... entities) {
        Wire.Writer header = new Wire.Writer();
        header.bool(12, loading);
        Wire.Writer response = new Wire.Writer();
        response.message(1, header);
        for (Wire.Writer entity : entities) response.message(2, entity);
        response.varint(98, 200);
        return response.toByteArray();
    }

    private static Esperanto.PlaylistPage parsePlaylistGetWithStatus(int statusCode) throws IOException {
        Wire.Writer status = new Wire.Writer();
        status.varint(1, statusCode);
        Wire.Writer response = new Wire.Writer();
        response.message(1, status);
        return Esperanto.parsePlaylistGet(response.toByteArray());
    }

    private static byte[] hexToBytes(String hex) {
        byte[] bytes = new byte[hex.length() / 2];
        for (int i = 0; i < bytes.length; i++) {
            bytes[i] = (byte) Integer.parseInt(hex.substring(i * 2, i * 2 + 2), 16);
        }
        return bytes;
    }

    // ---- Navigation ----

    /** The raw bytes of the first length-delimited {@code field} found in {@code data}. */
    static byte[] nestedBytes(byte[] data, int field) throws IOException {
        Wire.Reader reader = new Wire.Reader(data);
        while (reader.next()) {
            if (reader.field() == field) {
                return reader.bytes();
            }
            reader.skip();
        }
        throw new AssertionError("field " + field + " missing");
    }

    /** The raw bytes of every length-delimited occurrence of {@code field} in {@code data}, in order. */
    private static List<byte[]> repeatedNestedBytes(byte[] data, int field) throws IOException {
        List<byte[]> values = new ArrayList<>();
        Wire.Reader reader = new Wire.Reader(data);
        while (reader.next()) {
            if (reader.field() == field) {
                values.add(reader.bytes());
            } else {
                reader.skip();
            }
        }
        return values;
    }

    static long varintField(byte[] data, int field) throws IOException {
        Wire.Reader reader = new Wire.Reader(data);
        while (reader.next()) {
            if (reader.field() == field) {
                return reader.varint();
            }
            reader.skip();
        }
        throw new AssertionError("field " + field + " missing");
    }

    private static String stringField(byte[] data, int field) throws IOException {
        Wire.Reader reader = new Wire.Reader(data);
        while (reader.next()) {
            if (reader.field() == field) {
                return reader.string();
            }
            reader.skip();
        }
        throw new AssertionError("field " + field + " missing");
    }

    /**
     * A {@code YourLibraryDecoratedEntity} with {@code entity_info{2 name, 3 uri, 6 image}}, without an
     * image when it's null, then an empty member {@code kind}: 2 album, 3 artist, 4 playlist or 6 folder.
     */
    static Wire.Writer namedEntity(String uri, String name, String image, int kind) {
        Wire.Writer info = new Wire.Writer();
        info.string(2, name);
        info.string(3, uri);
        if (image != null) info.string(6, image);
        Wire.Writer entity = new Wire.Writer();
        entity.message(1, info);
        entity.message(kind, new Wire.Writer());
        return entity;
    }
}
