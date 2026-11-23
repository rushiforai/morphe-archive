package nl.johninnl.eclipse.auto.data;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertThrows;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.List;
import org.json.JSONException;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/** Parsing against the sanitised capture under src/test/resources/compose (no token, account id or email in it). */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 33, manifest = Config.NONE)
public class ComposeParserTest {
    private static ComposeFeed.Row row(ComposeFeed.Home home, String key) {
        for (ComposeFeed.Row row : home.rows) if (row.key.equals(key)) return row;
        throw new AssertionError("no row " + key);
    }

    @Test public void theHomeCaptureKeepsEveryRowInServerOrderWithItsKindAndProvenance() {
        ComposeFeed.Home home = Views.home();
        List<String> keys = new ArrayList<>();
        for (ComposeFeed.Row row : home.rows) keys.add(row.key);
        assertEquals("[recently_played, ai_dj, made_for_you, daily_mixes, ytmusic_mixes, new_for_you, eclipse_stations, top_songs, "
            + "featured_artist, fresh_drops, mood_mixes, popular_artists, your_playlists, your_shows, mystery_row]", keys.toString());
        assertEquals("native", row(home, "ai_dj").kind);
        assertEquals("linked", row(home, "ytmusic_mixes").provenance);
        assertTrue("native rows carry no items", row(home, "ai_dj").items.isEmpty());
        assertEquals("Daily Mixes", row(home, "daily_mixes").title);
        assertEquals("Recently Played", row(home, "recently_played").title);
    }

    @Test public void tracksKeepTheirRawJsonSoTheAppsOwnParserCanReadThem() throws Exception {
        ComposeFeed.Item track = row(Views.home(), "top_songs").items.get(0);
        assertEquals("Track 21", track.title);
        assertEquals("Artist Eleven", track.subtitle);
        assertNotNull(track.json);
        org.json.JSONObject raw = new org.json.JSONObject(track.json);
        assertEquals("9000000021", raw.getString("appleMusicTrackId"));
        Model.Track converted = track.toTrack();
        assertTrue("a feed track is playable once the bridge converts it", converted.isPlayable());
        assertEquals(track.json, converted.deferredJson);
        assertNull(converted.song);
    }

    @Test public void playlistsCarryTheirOwnIdTheEditorialIdAndTheFavouritesFlag() {
        ComposeFeed.Home home = Views.home();
        ComposeFeed.Item own = row(home, "your_playlists").items.get(0);
        assertEquals("own-playlist-3", own.playlistId);
        assertTrue(own.favorites);
        assertNull("a JSON null description is null, not the text 'null'", own.subtitle);
        assertEquals(Integer.valueOf(39), own.trackCount);
        ComposeFeed.Item editorial = row(home, "mood_mixes").items.get(0);
        assertEquals("pl.00000000000000000000000000000001", editorial.appleMusicPlaylistId);
        assertNull(editorial.playlistId);
        assertFalse(editorial.favorites);
        assertEquals("Curator A", editorial.subtitle);
    }

    @Test public void albumsArtistsMixesAndStationsReadTheirOwnFields() {
        ComposeFeed.Home home = Views.home();
        ComposeFeed.Item album = row(home, "fresh_drops").items.get(0);
        assertEquals("2000000001", album.appleMusicAlbumId);
        assertEquals("Artist Fourteen", album.subtitle);
        assertEquals("2000-01-01", album.releaseDate);
        assertEquals(Integer.valueOf(27), album.trackCount);
        assertEquals(Boolean.TRUE, album.explicit);
        ComposeFeed.Item artist = row(home, "featured_artist").items.get(0);
        assertEquals("1000000001", artist.appleMusicArtistId);
        assertEquals("Featured Artist One", artist.title);
        ComposeFeed.Item mix = row(home, "daily_mixes").items.get(0);
        assertEquals("mix-1", mix.mixId);
        assertEquals("Artist One, Artist Two, Artist Three", mix.subtitle);
        assertEquals("a mix carries its songs inline", 3, mix.tracks.size());
        assertNotNull(mix.artUrl);
        ComposeFeed.Item station = row(home, "eclipse_stations").items.get(0);
        assertEquals("st_hits", station.stationId);
        assertEquals("Track 41", station.nowTitle);
        assertEquals("Artist Nine", station.nowArtist);
        assertNotNull(station.nowCover);
    }

    @Test public void aMixWithoutItsOwnArtWearsItsFirstSongsArt() throws Exception {
        ComposeFeed.Home home = ComposeParser.parseHome("{\"rows\":[{\"key\":\"daily_mixes\",\"kind\":\"mixes\",\"items\":[{\"name\":\"Mix\","
            + "\"mixId\":\"m\",\"artists\":[\"A\",\"\",\"B\"],\"tracks\":[{\"title\":\"T\",\"artist\":\"A\",\"artworkUrl\":\"https://art/t\"}]}]}]}");
        ComposeFeed.Item mix = home.rows.get(0).items.get(0);
        assertEquals("https://art/t", mix.artUrl);
        assertEquals("A, B", mix.subtitle);
    }

    @Test public void aRowTheCarHasNeverHeardOfStillParsesByItsKind() {
        ComposeFeed.Row mystery = row(Views.home(), "mystery_row");
        assertEquals("tracks", mystery.kind);
        assertEquals("Mystery Song", mystery.items.get(0).title);
    }

    @Test public void discoverHasItsOwnShapeSectionsWithLayoutAndCardsWithInlineTracks() {
        ComposeFeed.Discover discover = Views.discover();
        assertEquals(2, discover.sections.size());
        ComposeFeed.Section hero = discover.sections.get(0);
        assertEquals("dailyDrop", hero.key);
        assertEquals("hero", hero.layout);
        assertEquals("Your Daily Drop", hero.title);
        ComposeFeed.Card card = hero.cards.get(0);
        assertEquals("Today's Drop", card.title);
        assertEquals(4, card.tracks.size());
        assertEquals(1, card.signals.size());
        assertEquals("Cold start - charts until we learn your taste", card.signals.get(0));
        assertNotNull(card.tracks.get(0).json);
        ComposeFeed.Section grid = discover.sections.get(1);
        assertEquals("grid", grid.layout);
        assertEquals("Chill Picks", grid.cards.get(0).title);
    }

    @Test public void missingAndNullFieldsNeverBecomeTheWordNull() throws Exception {
        ComposeFeed.Home home = ComposeParser.parseHome("{\"rows\":[{\"key\":\"x\",\"kind\":\"tracks\",\"title\":null,\"provenance\":null,"
            + "\"items\":[{\"title\":\"A\",\"artist\":null,\"artworkUrl\":null}]}]}");
        ComposeFeed.Row row = home.rows.get(0);
        assertEquals("", row.title);
        assertNull(row.provenance);
        assertEquals("A", row.items.get(0).title);
        assertNull(row.items.get(0).subtitle);
        assertNull(row.items.get(0).artUrl);
    }

    @Test public void aNativeRowKeepsTheArtworkTheServerNamesForItsCards() {
        ComposeFeed.Row made = row(Views.home(), "made_for_you");
        assertEquals("https://example.invalid/img/home/replay.jpg?v=0000000000", made.art.get("replay"));
        assertEquals("https://example.invalid/img/home/top-songs.jpg?v=0000000000", made.art.get("top_songs"));
        assertTrue("rows without art have none", row(Views.home(), "ai_dj").art.isEmpty());
        assertEquals("a renamed row keeps its art", made.art, made.withTitle("Mine").art);
    }

    @Test public void linkedCardsAndLinkedSongsKeepTheIdsTheAppsOwnLoadersNeed() throws Exception {
        ComposeFeed.Row mixes = row(Views.home(), "ytmusic_mixes");
        assertEquals("ytmusic-0123456789abcdef0123", mixes.items.get(0).linkedListId);
        ComposeFeed.Home home = ComposeParser.parseHome("{\"rows\":[{\"key\":\"x\",\"kind\":\"playlists\",\"items\":["
            + "{\"name\":\"Odd\",\"id\":\"ytmusic-nothex\"},{\"name\":\"Other\",\"id\":\"spotify-0123456789abcdef0123\"},"
            + "{\"name\":\"Lib\",\"type\":\"linked_playlist\",\"provider\":\"ytmusic\",\"providerPlaylistId\":\"PL1\"},"
            + "{\"name\":\"Not linked\",\"provider\":\"ytmusic\",\"providerPlaylistId\":\"PL2\"}]},"
            + "{\"key\":\"y\",\"kind\":\"tracks\",\"items\":[{\"title\":\"Song\",\"artist\":\"A\",\"explicit\":true,\"addonId\":\"default\","
            + "\"addonTrackId\":\"linked_ytmusic_abc-1\"},{\"title\":\"Wrong addon\",\"artist\":\"A\",\"addonId\":\"other\","
            + "\"addonTrackId\":\"linked_ytmusic_abc-2\"},{\"title\":\"Bad id\",\"artist\":\"A\",\"addonId\":\"default\","
            + "\"addonTrackId\":\"abc\"}]}]}");
        List<ComposeFeed.Item> lists = home.rows.get(0).items;
        assertNull("an id that is not twenty hex digits is not a linked list", lists.get(0).linkedListId);
        assertEquals("spotify-0123456789abcdef0123", lists.get(1).linkedListId);
        assertEquals("ytmusic", lists.get(2).provider);
        assertEquals("PL1", lists.get(2).providerPlaylistId);
        assertNull("only a linked_playlist item names a provider", lists.get(3).provider);
        List<ComposeFeed.Item> songs = home.rows.get(1).items;
        assertEquals("linked_ytmusic_abc-1", songs.get(0).linkedTrackId);
        assertEquals("linked_ytmusic_abc-1", songs.get(0).toTrack().linkedId);
        assertTrue(songs.get(0).toTrack().explicit);
        assertNull(songs.get(1).linkedTrackId);
        assertNull(songs.get(2).linkedTrackId);
        assertNull(songs.get(1).toTrack().linkedId);
    }

    @Test public void rowsWithoutAKeyOrKindAreSkippedAndAnEmptyFeedIsEmpty() throws Exception {
        assertEquals(0, ComposeParser.parseHome("{\"rows\":[{\"kind\":\"tracks\"},{\"key\":\"k\"},7]}").rows.size());
        assertEquals(0, ComposeParser.parseHome("{}").rows.size());
        assertEquals(0, ComposeParser.parseDiscover("{}").sections.size());
    }

    @Test public void aBodyThatIsNotJsonFailsToParseInsteadOfShowingGarbage() {
        assertThrows(JSONException.class, () -> ComposeParser.parseHome("<html>maintenance</html>"));
        assertThrows(JSONException.class, () -> ComposeParser.parseDiscover("[1,2]"));
    }
}
