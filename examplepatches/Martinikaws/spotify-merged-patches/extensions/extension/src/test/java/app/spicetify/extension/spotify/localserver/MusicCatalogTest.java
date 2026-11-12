package app.spicetify.extension.spotify.localserver;

import static org.junit.Assert.*;
import java.net.URI;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.Test;

public class MusicCatalogTest {
    private static final String ALBUM_A = "11111111111111111111111111111111";
    private static final String ALBUM_B = "22222222222222222222222222222222";
    private static final String ARTIST_A = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
    private static final String ARTIST_B = "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb";
    private final JellyfinConnection connection = new JellyfinConnection(
            new JellyfinClient.Account(new ServerConnection("https://music.example/", "", ""),
                    "device", "cccccccccccccccccccccccccccccccc", "Listener", "secret"),
            "dddddddddddddddddddddddddddddddd", "Music");

    private RemoteTrack track(String itemId, String title, String albumId, int disc, int number,
            List<BrowseMetadata.ArtistCredit> credits) {
        return track(itemId, title, albumId, "Shared album title", "Band", disc, number, credits);
    }

    private RemoteTrack track(String itemId, String title, String albumId, String albumTitle,
            String albumArtist, int disc, int number, List<BrowseMetadata.ArtistCredit> credits) {
        BrowseMetadata browse = new BrowseMetadata(albumId, "", albumArtist, "", credits,
                Collections.singletonList(new BrowseMetadata.ArtistCredit(ARTIST_A, albumArtist)), disc, number);
        return new RemoteTrack(connection, URI.create("https://music.example/Audio/" + itemId + "/stream"),
                itemId, "source", 1024, "v1", "flac", title, albumTitle, "Band", 120, browse);
    }

    @Test public void playbackUsesSpotifysLocalFileUriEncoding() {
        MusicCatalog catalog = MusicCatalog.from(Collections.singletonList(track("1", "A * B", ALBUM_A, "Café & Co", "Band", 1, 1,
                Collections.singletonList(new BrowseMetadata.ArtistCredit(ARTIST_A, "Band")))));
        assertEquals("spotify:local:Band:Caf%C3%A9+%26+Co:A+%2A+B:120",
                ServerPlayback.localUri(catalog.album("id:" + ALBUM_A).tracks.get(0)));
    }

    @Test public void dropsSinglesFiledUnderTheAlbumButKeepsRepeatedTitles() {
        List<BrowseMetadata.ArtistCredit> band = Collections.singletonList(new BrowseMetadata.ArtistCredit(ARTIST_A, "Band"));
        MusicCatalog catalog = MusicCatalog.from(Arrays.asList(
                track("1", "Opening", ALBUM_A, 1, 1, band),
                track("2", "Hit", ALBUM_A, 1, 2, band),
                track("3", "Intro", ALBUM_A, 1, 3, band),
                track("4", "Intro", ALBUM_A, 1, 4, band),
                track("5", "Hit", ALBUM_A, 1, 1, band)));
        List<MusicCatalog.Track> tracks = catalog.album("id:" + ALBUM_A).tracks;
        assertEquals(4, tracks.size());
        assertEquals("Opening", tracks.get(0).title);
        assertEquals("Hit", tracks.get(1).title);
        assertEquals(2, tracks.get(1).trackNumber);
        assertEquals("Intro", tracks.get(2).title);
        assertEquals("Intro", tracks.get(3).title);
    }

    @Test public void tracksWithoutADiscSitOnTheFirstDisc() {
        List<BrowseMetadata.ArtistCredit> band = Collections.singletonList(new BrowseMetadata.ArtistCredit(ARTIST_A, "Band"));
        MusicCatalog catalog = MusicCatalog.from(Arrays.asList(
                track("1", "Bonus", ALBUM_A, 1, 3, band),
                track("2", "Opening", ALBUM_A, 0, 1, band),
                track("3", "Middle", ALBUM_A, 0, 2, band),
                track("4", "Middle", ALBUM_A, 1, 1, band)));
        List<MusicCatalog.Track> tracks = catalog.album("id:" + ALBUM_A).tracks;
        assertEquals(3, tracks.size());
        assertEquals("Opening", tracks.get(0).title);
        assertEquals("Middle", tracks.get(1).title);
        assertEquals(2, tracks.get(1).trackNumber);
        assertEquals("Bonus", tracks.get(2).title);
    }

    @Test public void keepsSameNamedAlbumsDistinctAndOrdersDiscs() {
        List<BrowseMetadata.ArtistCredit> artists = Collections.singletonList(
                new BrowseMetadata.ArtistCredit(ARTIST_A, "Band"));
        MusicCatalog catalog = MusicCatalog.from(Arrays.asList(
                track("1", "Second", ALBUM_A, 1, 2, artists),
                track("2", "First", ALBUM_A, 1, 1, artists),
                track("3", "Other release", ALBUM_B, 1, 1, artists),
                track("4", "Disc two", ALBUM_A, 2, 1, artists)));
        assertEquals(2, catalog.albumCount());
        MusicCatalog.Album first = catalog.album("id:" + ALBUM_A);
        assertEquals(3, first.tracks.size());
        assertEquals("First", first.tracks.get(0).title);
        assertEquals("Second", first.tracks.get(1).title);
        assertEquals("Disc two", first.tracks.get(2).title);
        assertEquals(2, catalog.artist("id:" + ARTIST_A).albumIds.size());
        assertTrue(catalog.artist("id:" + ARTIST_A).otherTrackIds.isEmpty());
        assertEquals(1, catalog.search("disc two", 10).tracks.size());
    }

    @Test public void trackCreditsDoNotChangeAlbumArtistGrouping() {
        List<BrowseMetadata.ArtistCredit> credits = Arrays.asList(
                new BrowseMetadata.ArtistCredit(ARTIST_A, "Band"),
                new BrowseMetadata.ArtistCredit(ARTIST_B, "Guest"));
        MusicCatalog catalog = MusicCatalog.from(Collections.singletonList(track("1", "Duet", ALBUM_A, 0, 0, credits)));
        assertEquals(2, catalog.artistCount());
        assertEquals(1, catalog.artist("id:" + ARTIST_B).otherTrackIds.size());
        assertTrue(catalog.artist("id:" + ARTIST_B).albumIds.isEmpty());
        assertEquals(1, catalog.artist("id:" + ARTIST_A).albumIds.size());
        assertTrue(catalog.artist("id:" + ARTIST_A).otherTrackIds.isEmpty());
    }

    @Test public void missingJellyfinAlbumIdUsesSharedAlbumMetadata() {
        MusicCatalog catalog = MusicCatalog.from(Arrays.asList(
                track("1", "One", "", 0, 0, Collections.emptyList()),
                track("2", "Two", "", 0, 0, Collections.emptyList())));
        assertEquals(1, catalog.albumCount());
        assertEquals(2, catalog.albums(0, 1).get(0).tracks.size());
        assertThrows(IllegalArgumentException.class, () -> catalog.albums(0, 101));
    }

    @Test public void missingJellyfinIdJoinsOneKnownAlbumButKeepsDifferentTitlesSeparate() {
        MusicCatalog catalog = MusicCatalog.from(Arrays.asList(
                track("1", "One", ALBUM_A, 1, 1, Collections.emptyList()),
                track("2", "Two", "", 1, 2, Collections.emptyList()),
                track("3", "Other", "", "Another album", "Band", 1, 1, Collections.emptyList())));
        assertEquals(2, catalog.albumCount());
        assertEquals(2, catalog.album("id:" + ALBUM_A).tracks.size());
    }

    @Test public void missingJellyfinIdDoesNotGuessBetweenSameNamedReleases() {
        MusicCatalog catalog = MusicCatalog.from(Arrays.asList(
                track("1", "One", ALBUM_A, 1, 1, Collections.emptyList()),
                track("2", "Two", ALBUM_B, 1, 2, Collections.emptyList()),
                track("3", "Three", "", 1, 3, Collections.emptyList())));
        assertEquals(3, catalog.albumCount());
        assertEquals(1, catalog.album("id:" + ALBUM_A).tracks.size());
        assertEquals(1, catalog.album("id:" + ALBUM_B).tracks.size());
    }

    @Test public void webDavUsesFolderAndTagsWithoutDependingOnStreamVersion() {
        ServerConnection dav = new ServerConnection("https://files.example/music/", "listener", "secret");
        RemoteTrack one = new RemoteTrack(dav, URI.create("https://files.example/music/album-a/one.flac"), 1024, "v1")
                .withMetadata(dav, "One", "Same name", "Singer", "Singer", 1, 1, 120);
        RemoteTrack changed = new RemoteTrack(dav, URI.create("https://files.example/music/album-a/one.flac"), 2048, "v2")
                .withMetadata(dav, "One", "Same name", "Singer", "Singer", 1, 1, 120);
        RemoteTrack other = new RemoteTrack(dav, URI.create("https://files.example/music/album-b/two.flac"), 1024, "v1")
                .withMetadata(dav, "Two", "Same name", "Singer", "Singer", 1, 2, 120);
        MusicCatalog before = MusicCatalog.from(Arrays.asList(one, other));
        MusicCatalog after = MusicCatalog.from(Arrays.asList(changed, other));
        assertEquals(2, before.albumCount());
        assertEquals(before.albums(0, 2).get(0).id, after.albums(0, 2).get(0).id);
        assertNotEquals(one.id, changed.id);
    }

    @Test public void largeLibraryStillPagesAndSearchesGroupedAlbums() {
        List<RemoteTrack> tracks = new ArrayList<>(36000);
        List<BrowseMetadata.ArtistCredit> credits = Collections.singletonList(
                new BrowseMetadata.ArtistCredit(ARTIST_A, "Band"));
        for (int index = 0; index < 36000; index++) {
            String albumId = String.format("%032x", index / 18);
            tracks.add(track(Integer.toString(index), "Song " + index, albumId,
                    1, index % 18 + 1, credits));
        }
        MusicCatalog catalog = MusicCatalog.from(tracks);
        assertEquals(36000, catalog.trackCount());
        assertEquals(2000, catalog.albumCount());
        assertEquals(80, catalog.albums(0, 80).size());
        assertEquals(80, catalog.albums(80, 80).size());
        assertEquals(1, catalog.search("Song 35999", 30).tracks.size());
    }
}
