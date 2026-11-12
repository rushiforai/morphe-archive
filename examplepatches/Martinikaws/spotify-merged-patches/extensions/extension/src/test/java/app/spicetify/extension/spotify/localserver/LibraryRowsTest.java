package app.spicetify.extension.spotify.localserver;

import java.net.URI;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35, manifest = Config.NONE)
public class LibraryRowsTest {
    @Test public void windowsInsideSpotifysRowsGetNoServerRows() {
        assertNull(LibraryRows.appended(0, 50, 50, 120, 10));
    }

    @Test public void theLastSpotifyWindowIsFilledWithTheFirstServerRows() {
        assertArrayEquals(new int[] {120, 150, 0}, LibraryRows.appended(100, 50, 20, 120, 40));
    }

    @Test public void windowsPastSpotifysRowsStartAtTheMatchingServerRow() {
        assertArrayEquals(new int[] {150, 160, 30}, LibraryRows.appended(150, 50, 0, 120, 40));
    }

    @Test public void aShortSpotifyWindowBeforeTheEndIsLeftAlone() {
        assertNull(LibraryRows.appended(0, 50, 30, 120, 40));
    }

    @Test public void windowsPastAllRowsAreEmpty() {
        assertNull(LibraryRows.appended(200, 50, 0, 120, 40));
    }

    @Test public void anEmptySpotifyLibraryShowsOnlyServerRows() {
        assertArrayEquals(new int[] {0, 25, 0}, LibraryRows.appended(0, 50, 0, 0, 25));
    }

    @Test public void anEmptyFirstWindowMeansSpotifyHasNoRows() {
        assertEquals(Integer.valueOf(0), LibraryRows.emptyWindowTotal(0, 120));
    }

    @Test public void anEmptyLaterWindowUsesTheLastKnownTotal() {
        assertEquals(Integer.valueOf(120), LibraryRows.emptyWindowTotal(150, 120));
        assertEquals(Integer.valueOf(100), LibraryRows.emptyWindowTotal(100, 120));
    }

    @Test public void anEmptyLaterWindowWithoutAKnownTotalIsLeftAlone() {
        assertNull(LibraryRows.emptyWindowTotal(150, null));
    }

    @Test public void jellyfinArtworkUsesTheItemImageWithItsTag() throws Exception {
        JellyfinConnection jellyfin = connection("https://media.example/jellyfin/");
        assertEquals("https://media.example/jellyfin/Items/abc/Images/Primary?fillHeight=320&fillWidth=320&quality=90&tag=t%2B1",
                LibraryRows.image(jellyfin, "id:abc", "t+1"));
        assertEquals("https://media.example/jellyfin/Items/abc/Images/Primary?fillHeight=320&fillWidth=320&quality=90",
                LibraryRows.image(jellyfin, "id:abc", ""));
    }

    private static JellyfinConnection connection(String root) {
        JellyfinClient.Account account = new JellyfinClient.Account(new ServerConnection(root, "", "", true),
                "cccccccccccccccccccccccccccccccc", "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "Listener", "fixture-token");
        return new JellyfinConnection(account, "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb", "Music");
    }

    @Test public void rowsWithoutAServerIdHaveNoArtwork() throws Exception {
        assertEquals("", LibraryRows.image(connection("https://media.example/"), "name:abba", ""));
        assertEquals("", LibraryRows.image(null, "id:abc", "tag"));
    }

    @Test public void rowsListAlbumsBeforeArtistsAndHonourTheFilter() {
        JellyfinConnection jellyfin = connection("https://music.example/");
        List<BrowseMetadata.ArtistCredit> band = Collections.singletonList(new BrowseMetadata.ArtistCredit("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee", "Band"));
        MusicCatalog catalog = MusicCatalog.from(Arrays.asList(
                track(jellyfin, "1", "Alpha", "a1", "tag-a", band), track(jellyfin, "2", "Beta", "b1", "", band)));
        List<LibraryRows.Entry> all = LibraryRows.entries(catalog, jellyfin, LibraryRows.Filter.ALL);
        assertEquals(3, all.size());
        assertEquals("Alpha", all.get(0).title);
        assertEquals("Band", all.get(0).subtitle);
        assertEquals("spicetify:server:album:id%3Aa1", all.get(0).uri());
        assertTrue(all.get(0).image.endsWith("&tag=tag-a"));
        assertEquals("Beta", all.get(1).title);
        assertEquals(LibraryRows.Kind.ARTIST, all.get(2).kind);
        assertEquals("https://music.example/Items/eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee/Images/Primary?fillHeight=320&fillWidth=320&quality=90", all.get(2).image);
        assertEquals(2, LibraryRows.entries(catalog, jellyfin, LibraryRows.Filter.ALBUMS).size());
        assertEquals(1, LibraryRows.entries(catalog, jellyfin, LibraryRows.Filter.ARTISTS).size());
    }

    private static RemoteTrack track(JellyfinConnection jellyfin, String id, String album, String albumId, String tag,
            List<BrowseMetadata.ArtistCredit> artists) {
        BrowseMetadata browse = new BrowseMetadata(albumId, "", "Band", tag, artists, artists, 1, 1);
        return new RemoteTrack(jellyfin, URI.create("https://music.example/Audio/" + id + "/stream"),
                id, "source", 1024, "v1", "flac", "Song " + id, album, "Band", 120, browse);
    }
}
