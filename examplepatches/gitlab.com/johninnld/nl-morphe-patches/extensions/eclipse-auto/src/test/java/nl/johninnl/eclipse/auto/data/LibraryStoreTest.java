package nl.johninnl.eclipse.auto.data;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.List;
import org.junit.Test;

public class LibraryStoreTest {
    private final FakeApp app = new FakeApp();
    private final LibraryStore store = new LibraryStore(app);

    private static Model.Tile tile(List<Model.Tile> tiles, String title) {
        for (Model.Tile tile : tiles) if (tile.title.equals(title)) return tile;
        return null;
    }

    @Test public void facetsAppearInOrderWithTheirCountsAndCloudIsHiddenWhenEmpty() {
        app.songs = FakeApp.tracks("a", "b", "c");
        app.downloadsCount = 2;
        LibraryStore.View view = store.view();
        List<String> titles = new ArrayList<>();
        for (Model.Tile facet : view.facets) titles.add(facet.title);
        assertEquals(java.util.Arrays.asList("Playlists", "Albums", "Artists", "Songs", "Favorites", "Downloads", "Recent"), titles);
        assertEquals("3", tile(view.facets, "Songs").subtitle);
        assertEquals("2", tile(view.facets, "Downloads").subtitle);
        assertEquals("0", tile(view.facets, "Playlists").subtitle);
        app.cloud = FakeApp.tracks("x");
        assertEquals("Cloud", store.view().facets.get(7).title);
    }

    @Test public void everyFacetTileCarriesAnIconAndOpensItsOwnCollection() {
        app.songs = FakeApp.tracks("a");
        app.favorites = FakeApp.tracks("f1", "f2");
        for (Model.Tile facet : store.view().facets) {
            assertNotNull(facet.title, facet.icon);
            assertNotNull(facet.title, facet.opener.open());
        }
        Model.Collection favorites = tile(store.view().facets, "Favorites").opener.open();
        assertEquals("Favorites", favorites.title);
        assertEquals("2 songs", favorites.subtitle);
        assertEquals("origin:favorites:Favorites", favorites.origin);
        assertTrue("alphabetical lists are indexed", favorites.indexed);
    }

    @Test public void songsPlayUnderTheLibraryOriginAndKeepTheFullList() {
        for (int i = 0; i < 500; i++) app.songs.add(FakeApp.track("s" + i, "x"));
        Model.Collection songs = tile(store.view().facets, "Songs").opener.open();
        assertSame(app.library, songs.origin);
        assertEquals("the play list is never capped, only what is displayed", 500, songs.tracks.size());
    }

    @Test public void recentsMatchHistoryToLibrarySongsIgnoringCaseNewestFirstWithoutDuplicates() {
        app.songs = new ArrayList<>(FakeApp.tracks("Alpha", "Bravo", "Charlie"));
        app.history.add(new Model.HistoryEntry("charlie", "ARTIST CHARLIE"));
        app.history.add(new Model.HistoryEntry("Unknown song", "nobody"));
        app.history.add(new Model.HistoryEntry("Alpha", "Artist Alpha"));
        app.history.add(new Model.HistoryEntry("CHARLIE", "artist charlie"));
        List<Model.Track> recents = LibraryStore.recents(app.songs, app.history, 10);
        assertEquals("the repeated Charlie collapses; the song the library lacks stays", 3, recents.size());
        assertEquals("Charlie", recents.get(0).title);
        assertEquals("Unknown song", recents.get(1).title);
        assertEquals("Alpha", recents.get(2).title);
    }

    @Test public void aHistoryEntryTheLibraryLacksStaysAsAnUnresolvedSongThatIsNotPlayableUntilLookedUp() {
        app.songs = new ArrayList<>(FakeApp.tracks("Alpha"));
        app.history.add(new Model.HistoryEntry("Unknown song", "nobody", "https://art/unknown"));
        app.history.add(new Model.HistoryEntry("", "no title"));
        List<Model.Track> recents = LibraryStore.recents(app.songs, app.history, 10);
        assertEquals("an entry without a title is dropped", 1, recents.size());
        Model.Track unresolved = recents.get(0);
        assertFalse(unresolved.isPlayable());
        assertEquals("nobody", unresolved.history.artist);
        assertEquals("https://art/unknown", unresolved.artUrl);
    }

    @Test public void recentRowsAreLimitedToTenAndTheRecentFacetToThirty() {
        for (int i = 0; i < 40; i++) {
            app.songs.add(FakeApp.track("s" + i, "x"));
            app.history.add(new Model.HistoryEntry("s" + i, "x"));
        }
        LibraryStore.View view = store.view();
        assertEquals(LibraryStore.RECENT_ROWS, view.recents.size());
        assertEquals("s0", view.recents.get(0).title);
        assertEquals(LibraryStore.RECENT_FACET, view.recentFacet.opener.open().tracks.size());
        assertFalse("recent songs are shown in history order, not alphabetically", view.recentFacet.opener.open().indexed);
    }

    @Test public void playlistTilesAreCappedAndSeeAllOpensThePlaylistsFacet() {
        for (int i = 0; i < 15; i++) app.playlists.add(new Model.Ref(null, "p" + i, "Playlist " + i, "3 songs", null));
        app.playlistSongs.put("p3", FakeApp.tracks("one", "two"));
        LibraryStore.View view = store.view();
        assertEquals(LibraryStore.PLAYLIST_TILES, view.playlists.size());
        assertNotNull(view.morePlaylists);
        assertEquals(15, view.morePlaylists.opener.open().tiles.size());
        Model.Collection playlist = view.playlists.get(3).opener.open();
        assertEquals("Playlist 3", playlist.title);
        assertEquals("2 songs", playlist.subtitle);
        assertEquals("origin:p3:Playlist 3", playlist.origin);
        app.playlists.subList(12, 15).clear();
        assertNull("nothing to expand when every playlist is already shown", store.view().morePlaylists);
    }

    @Test public void anArtistOpensItsSongsAndItsAlbums() {
        app.artists.add(new Model.Ref(null, "Artist One", "Artist One", "2 songs", null));
        app.albums.add(new Model.Ref(null, "k1", "First Album", "Artist One", null));
        app.albums.add(new Model.Ref(null, "k2", "Other Album", "Someone Else", null));
        app.artistSongs.put("Artist One", FakeApp.tracks("x", "y"));
        Model.Collection artist = tile(store.open(LibraryStore.Facet.ARTISTS).tiles, "Artist One").opener.open();
        assertEquals(2, artist.tracks.size());
        assertEquals("Albums", artist.tilesTitle);
        assertEquals(1, artist.tiles.size());
        assertEquals("First Album", artist.tiles.get(0).title);
    }

    @Test public void anAlbumPlaysUnderTheLibraryOrigin() {
        app.albums.add(new Model.Ref(null, "k1", "First Album", "Artist One", "https://art/1"));
        app.albumSongs.put("k1", FakeApp.tracks("t1", "t2", "t3"));
        Model.Collection album = tile(store.open(LibraryStore.Facet.ALBUMS).tiles, "First Album").opener.open();
        assertEquals(3, album.tracks.size());
        assertEquals("Artist One", album.subtitle);
        assertSame(app.library, album.origin);
    }

    @Test public void anEmptyLibraryStillProducesEveryCollectionWithoutFailing() {
        for (LibraryStore.Facet facet : LibraryStore.Facet.values()) assertNotNull(facet.title, store.open(facet));
        LibraryStore.View view = store.view();
        assertTrue(view.recents.isEmpty());
        assertTrue(view.playlists.isEmpty());
    }
}
