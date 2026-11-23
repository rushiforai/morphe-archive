package nl.johninnl.eclipse.auto.data;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import nl.johninnl.eclipse.auto.ui.Presentation;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/** Every row kind through the Presentation table, and every state of design section 4. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 33, manifest = Config.NONE)
public class HomeBuilderTest {
    private final FakeApp app = new FakeApp();

    private static Model.Section section(HomeView view, String key) {
        for (Model.Section section : view.sections) if (section.key.equals(key)) return section;
        throw new AssertionError("no section " + key + " in " + keys(view));
    }

    private static List<String> keys(HomeView view) {
        List<String> keys = new ArrayList<>();
        for (Model.Section section : view.sections) keys.add(section.key);
        return keys;
    }

    private static final class Capture implements Model.LoadCallback {
        Model.Collection loaded;
        boolean failed;

        @Override public void loaded(Model.Collection collection) { loaded = collection; }

        @Override public void failed() { failed = true; }
    }

    private HomeView home() { return Views.home(app, Catalog.Phase.READY, false); }

    // ---- Home content --------------------------------------------------------------------------

    @Test public void everyRowIsDrawnInThePhonesOrderAndOnlyRowsWithNothingToShowAreLeftOut() {
        HomeView view = home();
        // your_shows is native and the user follows no shows, so it is the only row that has nothing to draw.
        assertEquals("[recently_played, ai_dj, made_for_you, daily_mixes, ytmusic_mixes, new_for_you, eclipse_stations, top_songs, "
            + "featured_artist, fresh_drops, mood_mixes, popular_artists, your_playlists, mystery_row]", keys(view).toString());
        assertEquals(Model.Section.Type.TRACKS, section(view, "mystery_row").type);
        assertEquals("Unknown Key Row", section(view, "mystery_row").title);
    }

    @Test public void aTitleIsTheUsersRenameThenTheServersThenThePhonesBuiltInLabelThenTheKey() {
        ComposeFeed.Home feed = new ComposeFeed.Home(Arrays.asList(
            new ComposeFeed.Row("trending", "tracks", null, "chart:us", Arrays.asList(track("One"))),
            new ComposeFeed.Row("top_songs", "tracks", "Server title", "taste", Arrays.asList(track("Two"))),
            new ComposeFeed.Row("unheard_of", "tracks", null, "taste", Arrays.asList(track("Three")))));
        HomeView plain = Views.builder(app).home(new Catalog.State<>(Catalog.Phase.READY, feed, false), HomeLayout.defaults(),
            Collections.<Model.LiveStation>emptyList());
        assertEquals("the phone's own label", "Trending now", section(plain, "trending").title);
        assertEquals("the server's title", "Server title", section(plain, "top_songs").title);
        assertEquals("no label: the key", "unheard_of", section(plain, "unheard_of").title);
        HomeView renamed = Views.builder(app).home(new Catalog.State<>(Catalog.Phase.READY, feed, false),
            HomeLayout.parse("{\"titles\":{\"top_songs\":\"Mine\",\"trending\":\"Charts\"}}"), Collections.<Model.LiveStation>emptyList());
        assertEquals("Mine", section(renamed, "top_songs").title);
        assertEquals("Charts", section(renamed, "trending").title);
    }

    private static ComposeFeed.Item track(String title) {
        try {
            return ComposeParser.item("tracks", new org.json.JSONObject().put("title", title).put("artist", "A"));
        } catch (org.json.JSONException broken) {
            throw new IllegalStateException(broken);
        }
    }

    @Test public void theRecentsHaveNoTitleUnlessThePhoneRenamedThem() {
        assertEquals("", section(home(), "recently_played").title);
        assertEquals("the classic tree still groups them under a name", "Recent playlists", section(home(), "recently_played").label());
        FakeApp renamed = new FakeApp();
        ComposeFeed.Home feed = Views.home();
        HomeView view = Views.builder(renamed).home(new Catalog.State<>(Catalog.Phase.READY, feed, false),
            HomeLayout.parse("{\"titles\":{\"recently_played\":\"Again\"}}"), Collections.<Model.LiveStation>emptyList());
        assertEquals("Again", section(view, "recently_played").title);
    }

    @Test public void songRowsPlayFromTheTappedIndexUnderAHomeOriginWithTheRowsOwnKey() {
        Model.Section top = section(home(), "top_songs");
        assertEquals(3, top.tracks.size());
        assertEquals("composed:home:top_songs:Your Top Songs", top.origin);
        for (Model.Track track : top.tracks) assertTrue(track.isPlayable());
        assertEquals("songs rows are large tiles, not rows", "home.tracks", top.presentationKey);
    }

    @Test public void ownPlaylistsOpenTheLibraryPlaylistAndFavouritesOpenTheFavourites() {
        app.favorites = FakeApp.tracks("Fav one", "Fav two");
        app.playlists.add(new Model.Ref(null, "own-playlist-4", "Playlist 4", "2 songs", null));
        app.playlistSongs.put("own-playlist-4", FakeApp.tracks("a", "b"));
        Model.Section playlists = section(home(), "your_playlists");
        assertEquals(3, playlists.tiles.size());
        Model.Collection favourites = playlists.tiles.get(0).opener.open();
        assertEquals(2, favourites.tracks.size());
        Model.Collection own = playlists.tiles.get(1).opener.open();
        assertEquals(2, own.tracks.size());
        Model.Collection missing = playlists.tiles.get(2).opener.open();
        assertTrue("a playlist the library has not loaded is empty, never a crash", missing.tracks.isEmpty() && missing.loader == null);
    }

    @Test public void editorialPlaylistsAreFetchedThroughTheAppsOwnLoaderWhileASpinnerShows() {
        Model.Section moods = section(home(), "mood_mixes");
        Model.Collection collection = moods.tiles.get(0).opener.open();
        assertNotNull("deferred: the screen shows a spinner", collection.loader);
        assertTrue(app.calls.isEmpty());
        app.editorial = new Model.Loaded("Mood Playlist A", "Apple Music", null, FakeApp.tracks("x", "y"), "editorial-origin");
        Capture capture = new Capture();
        collection.loader.load(capture);
        assertEquals(Arrays.asList("loadEditorialPlaylist pl.00000000000000000000000000000001"), app.calls);
        assertEquals(2, capture.loaded.tracks.size());
        assertEquals("editorial-origin", capture.loaded.origin);
        assertEquals("Mood Playlist A", capture.loaded.title);
    }

    @Test public void aFailedCatalogueLoadIsAFailureNotAnEmptyPage() {
        Model.Collection collection = section(home(), "mood_mixes").tiles.get(0).opener.open();
        app.editorial = null;
        Capture capture = new Capture();
        collection.loader.load(capture);
        assertTrue(capture.failed);
        assertNull(capture.loaded);
        app.editorial = new Model.Loaded("Empty", "", null, new ArrayList<Model.Track>(), null);
        Capture empty = new Capture();
        collection.loader.load(empty);
        assertTrue("a playlist with no songs counts as a failure to load", empty.failed);
    }

    @Test public void albumsLoadThroughTheAppsAlbumLoaderWithTheFeedsOwnFields() {
        Model.Section drops = section(home(), "fresh_drops");
        Model.Tile tile = drops.tiles.get(0);
        assertEquals("Artist Fourteen", tile.subtitle);
        Model.Collection collection = tile.opener.open();
        app.album = new Model.Loaded("Album A", "Artist Fourteen", null, FakeApp.tracks("t1"), "album-origin");
        Capture capture = new Capture();
        collection.loader.load(capture);
        assertEquals(Arrays.asList("loadAlbum 2000000001"), app.calls);
        assertEquals(1, capture.loaded.tracks.size());
    }

    @Test public void artistsOpenAnArtistPageWithTopSongsAlbumsAndSingles() {
        Model.AlbumRef album = new Model.AlbumRef("a1", "An Album", "Artist One", null, null, 10, null, null, null);
        Model.AlbumRef single = new Model.AlbumRef("s1", "A Single", "Artist One", null, null, 1, null, null, null);
        app.artist = new Model.ArtistPage("Artist One", "https://img/artist", FakeApp.tracks("top1", "top2"), Arrays.asList(album), Arrays.asList(single));
        Model.Tile artist = section(home(), "popular_artists").tiles.get(0);
        Capture capture = new Capture();
        artist.opener.open().loader.load(capture);
        assertEquals(2, capture.loaded.tracks.size());
        assertEquals("Albums", capture.loaded.tilesTitle);
        assertEquals(1, capture.loaded.tiles.size());
        assertEquals("Singles", capture.loaded.moreGroups.get(0).title);
        assertTrue(capture.loaded.origin.toString().startsWith("composed:artist:"));
    }

    @Test public void theFeaturedArtistIsASpotlightWithPlayTopSongsAndOpenArtist() {
        Model.Section featured = section(home(), "featured_artist");
        assertEquals(Model.Section.Type.SPOTLIGHT, featured.type);
        assertEquals("Featured Artist One", featured.feature.title);
        assertNotNull("Play top songs needs a loader", featured.feature.playLoader);
        app.artist = new Model.ArtistPage("Artist One", null, FakeApp.tracks("top1"), new ArrayList<Model.AlbumRef>(), new ArrayList<Model.AlbumRef>());
        Capture capture = new Capture();
        featured.feature.playLoader.load(capture);
        assertEquals(1, capture.loaded.tracks.size());
        assertEquals("composed:artist:1000000001:Artist One", capture.loaded.origin);
    }

    @Test public void dailyMixesPlayTheirInlineSongsUnderTheDailyMixOrigin() {
        Model.Section mixes = section(home(), "daily_mixes");
        assertEquals(2, mixes.tiles.size());
        Model.Collection mix = mixes.tiles.get(0).opener.open();
        assertEquals(3, mix.tracks.size());
        assertEquals("composed:daily_mix:daily_mixes:Daily Mix 1", mix.origin);
        assertNull("inline songs: nothing to fetch", mix.loader);
        assertTrue(app.calls.isEmpty());
    }

    @Test public void theStationsRowIsAtItsFeedPositionAndTheLiveStationsFillItWhenKnown() {
        Model.Section stations = section(home(), "eclipse_stations");
        assertEquals(Model.Section.Type.STATIONS, stations.type);
        assertEquals("Eclipse Stations", stations.title);
        assertEquals("st_hits", stations.stations.get(0).id);
        assertEquals("LIVE · Track 41 – Artist Nine", stations.stations.get(0).nowPlaying());
        assertEquals("LIVE", new Model.LiveStation("s", "Name", "", "", "", null).nowPlaying());
        assertEquals("LIVE · Song", new Model.LiveStation("s", "Name", "", "Song", "", null).nowPlaying());
        List<Model.LiveStation> live = Arrays.asList(new Model.LiveStation("st_hits", "Hits", "", "Song", "Artist", "https://art/hits"));
        HomeView view = Views.home(app, Catalog.Phase.READY, false, live);
        assertEquals("the same place in the feed's order", keys(home()).indexOf("eclipse_stations"), keys(view).indexOf("eclipse_stations"));
        Model.Section replaced = section(view, "eclipse_stations");
        assertEquals("the app's own live data (with the cover on air) takes the row's place", 1, replaced.stations.size());
        assertEquals("Hits", replaced.stations.get(0).name);
        assertEquals("LIVE · Song – Artist", replaced.stations.get(0).nowPlaying());
        assertEquals("Eclipse Stations", replaced.title);
    }

    @Test public void aRowShowsEverythingTheFeedSendsUpToTheOneSilentCapAndNothingIsBehindSeeAll() {
        assertEquals(30, Presentation.SECTION_CAP);
        List<ComposeFeed.Item> songs = new ArrayList<>();
        List<ComposeFeed.Item> playlists = new ArrayList<>();
        for (int i = 0; i < 45; i++) {
            songs.add(track("Song " + i));
            playlists.add(playlist("own-" + i));
        }
        ComposeFeed.Home feed = new ComposeFeed.Home(Arrays.asList(
            new ComposeFeed.Row("top_songs", "tracks", "Top", "taste", songs.subList(0, 20)),
            new ComposeFeed.Row("trending", "tracks", "Trending", "taste", songs),
            new ComposeFeed.Row("your_playlists", "playlists", "Mine", "library", playlists)));
        HomeView view = Views.builder(app).home(new Catalog.State<>(Catalog.Phase.READY, feed, false), HomeLayout.defaults(),
            Collections.<Model.LiveStation>emptyList());
        assertEquals("twenty songs are twenty tiles: the old cap of five is gone", 20, section(view, "top_songs").tracks.size());
        assertEquals("a runaway feed is cut silently at the one safety cap", 30, section(view, "trending").tracks.size());
        assertEquals(30, section(view, "your_playlists").tiles.size());
        for (Model.Section any : home().sections) assertNotNull(any.key, any.presentationKey);
    }

    private static ComposeFeed.Item playlist(String id) {
        try {
            return ComposeParser.item("playlists", new org.json.JSONObject().put("name", id).put("playlistId", id));
        } catch (org.json.JSONException broken) {
            throw new IllegalStateException(broken);
        }
    }

    @Test public void theLayoutHidesReordersAndRenamesRows() {
        HomeView view = Views.builder(app).home(new Catalog.State<>(Catalog.Phase.READY, Views.home(), false),
            HomeLayout.parse("{\"order\":[\"top_songs\"],\"hidden\":[\"daily_mixes\"],\"titles\":{\"top_songs\":\"My hits\"}}"),
            Collections.<Model.LiveStation>emptyList());
        assertFalse(keys(view).contains("daily_mixes"));
        assertEquals("top_songs", keys(view).get(0));
        assertEquals("My hits", view.sections.get(0).title);
        assertTrue("rows the phone does not know keep their place", keys(view).contains("mystery_row"));
    }

    // ---- native rows ---------------------------------------------------------------------------

    @Test public void theUmbraCardIsTheNativeRowAtItsFeedPositionAndKnowsWhetherTheDjRuns() {
        HomeView view = home();
        assertEquals("the Umbra card sits right after the recents, where the feed puts ai_dj", 1, keys(view).indexOf("ai_dj"));
        Model.Section dj = section(view, "ai_dj");
        assertEquals(Model.Section.Type.DJ, dj.type);
        assertEquals("Umbra", dj.title);
        assertFalse(dj.active);
        app.djLive = true;
        assertTrue(section(home(), "ai_dj").active);
    }

    @Test public void madeForYouIsTheReplayAndTheAllTimeTopSongsCardsWithTheServersArtwork() {
        Model.Section made = section(home(), "made_for_you");
        assertEquals("home.made_for_you", made.presentationKey);
        assertEquals(2, made.tiles.size());
        Model.Tile replay = made.tiles.get(0);
        assertTrue(replay.title, replay.title.endsWith(" Replay"));
        assertEquals("https://example.invalid/img/home/replay.jpg?v=0000000000", replay.artUrl);
        Model.Tile top = made.tiles.get(1);
        assertEquals("All-Time Top Songs", top.title);
        assertEquals("Your most played, ever", top.subtitle);
        assertEquals("https://example.invalid/img/home/top-songs.jpg?v=0000000000", top.artUrl);
    }

    @Test public void aReplayThatIsStillBeingBuiltIsADisabledCardAndAReadyOneOpensItsSongs() {
        Model.Tile building = section(home(), "made_for_you").tiles.get(0);
        assertEquals("Building your replay…", building.subtitle);
        assertFalse("nothing to open yet: drawn without a tap target", building.enabled());
        app.replay = new Model.Replay(11, false, null, new ArrayList<Model.Track>());
        assertFalse("no content yet", section(home(), "made_for_you").tiles.get(0).enabled());
        app.replay = new Model.Replay(11, true, "3h 12m", FakeApp.tracks("one", "two"));
        Model.Tile ready = section(home(), "made_for_you").tiles.get(0);
        assertEquals("November Replay", ready.title);
        assertEquals("3h 12m listened", ready.subtitle);
        assertTrue(ready.enabled());
        Model.Collection collection = ready.opener.open();
        assertEquals(2, collection.tracks.size());
        assertEquals("composed:home:replay:November Replay", collection.origin);
        assertNull("the songs are already in hand: nothing to fetch", collection.loader);
    }

    @Test public void allTimeTopSongsLoadThroughTheAppsOwnLoaderAndAFailureIsAFailure() {
        Model.Tile top = section(home(), "made_for_you").tiles.get(1);
        Model.Collection collection = top.opener.open();
        assertNotNull("deferred: a spinner shows while the app's loader runs", collection.loader);
        Capture failed = new Capture();
        collection.loader.load(failed);
        assertTrue(failed.failed);
        app.topSongs = FakeApp.tracks("a", "b", "c");
        Capture capture = new Capture();
        collection.loader.load(capture);
        assertEquals(3, capture.loaded.tracks.size());
        assertEquals("composed:home:top_songs:All-Time Top Songs", capture.loaded.origin);
        assertEquals(Arrays.asList("loadTopSongs", "loadTopSongs"), app.calls);
    }

    @Test public void yourShowsAreLeftOutWithoutShowsAndOpenTheirEpisodesThroughTheAppsFeedLoader() {
        assertFalse(keys(home()).contains("your_shows"));
        Model.Show show = new Model.Show(new Object(), "show-1", "A Podcast", "Someone", "https://art/show");
        app.shows.add(show);
        HomeView view = home();
        assertEquals("the shows sit last, where the feed puts them", "your_shows", keys(view).get(keys(view).size() - 2));
        Model.Section shows = section(view, "your_shows");
        assertEquals("Your Shows", shows.title);
        assertEquals(1, shows.tiles.size());
        assertEquals("A Podcast", shows.tiles.get(0).title);
        assertEquals("Someone", shows.tiles.get(0).subtitle);
        Model.Collection collection = shows.tiles.get(0).opener.open();
        app.showEpisodes = new Model.Loaded("A Podcast", "Someone", null, FakeApp.tracks("ep1", "ep2"), null);
        Capture capture = new Capture();
        collection.loader.load(capture);
        assertEquals(Arrays.asList("loadShowEpisodes show-1"), app.calls);
        assertEquals(2, capture.loaded.tracks.size());
    }

    // ---- linked rows ---------------------------------------------------------------------------

    @Test public void aLinkedPlaylistRowOpensEachListThroughTheAppsLinkedListLoader() {
        Model.Section mixes = section(home(), "ytmusic_mixes");
        assertEquals("YouTube Music mixes", mixes.title);
        assertEquals(2, mixes.tiles.size());
        Model.Tile linkedMix = mixes.tiles.get(0);
        assertEquals("Linked Mix A", linkedMix.title);
        assertEquals("Artist One, Artist Two, Artist Three", linkedMix.subtitle);
        Model.Collection collection = linkedMix.opener.open();
        app.linkedList = new Model.Loaded("Linked Mix A", "2 songs", null, FakeApp.tracks("x", "y"), "linked-origin");
        Capture capture = new Capture();
        collection.loader.load(capture);
        assertEquals(Arrays.asList("loadLinkedList ytmusic_mixes ytmusic-0123456789abcdef0123"), app.calls);
        assertEquals(2, capture.loaded.tracks.size());
        assertEquals("linked-origin", capture.loaded.origin);
        app.linkedList = null;
        Capture missing = new Capture();
        collection.loader.load(missing);
        assertTrue("a list the app cannot load is a failed load, never an empty page", missing.failed);
    }

    @Test public void aLinkedCardWithoutALinkedListIdIsNotDrawnAndAnUnsupportedKindIsLeftOut() {
        ComposeFeed.Home feed = new ComposeFeed.Home(Arrays.asList(
            new ComposeFeed.Row("ytmusic_mixes", "playlists", "Mixes", "linked", Arrays.asList(
                ComposeParser.item("playlists", json("{\"name\":\"No id\",\"type\":\"playlist\"}")),
                ComposeParser.item("playlists", json("{\"name\":\"Odd id\",\"id\":\"not-a-list\"}")))),
            new ComposeFeed.Row("spotify_albums", "albums", "Albums", "linked", Arrays.asList(
                ComposeParser.item("albums", json("{\"title\":\"An album\",\"spotifyAlbumId\":\"x\"}"))))));
        HomeView view = Views.builder(app).home(new Catalog.State<>(Catalog.Phase.READY, feed, false), HomeLayout.defaults(),
            Collections.<Model.LiveStation>emptyList());
        assertTrue("no card goes nowhere", view.sections.isEmpty());
    }

    @Test public void aLinkedSongsRowPlaysUnderTheLinkedIds() {
        ComposeFeed.Home feed = new ComposeFeed.Home(Arrays.asList(new ComposeFeed.Row("spotify_liked", "tracks", "Liked", "linked",
            Arrays.asList(ComposeParser.item("tracks", json("{\"title\":\"Song\",\"artist\":\"A\",\"explicit\":true,"
                + "\"addonId\":\"default\",\"addonTrackId\":\"linked_ytmusic_abc-123\"}")),
                ComposeParser.item("tracks", json("{\"title\":\"Plain\",\"artist\":\"A\"}"))))));
        HomeView view = Views.builder(app).home(new Catalog.State<>(Catalog.Phase.READY, feed, false), HomeLayout.defaults(),
            Collections.<Model.LiveStation>emptyList());
        Model.Section liked = section(view, "spotify_liked");
        assertEquals(Model.Section.Type.TRACKS, liked.type);
        assertEquals("linked_ytmusic_abc-123", liked.tracks.get(0).linkedId);
        assertTrue(liked.tracks.get(0).explicit);
        assertNull("a song without a linked id plays like any feed song", liked.tracks.get(1).linkedId);
    }

    @Test public void aLinkedLibraryPlaylistInTheRecentsOpensThroughTheAppsLinkedPlaylistLoader() {
        ComposeFeed.Home feed = new ComposeFeed.Home(Arrays.asList(new ComposeFeed.Row("recently_played", "playlists", "Recently Played",
            "library", Arrays.asList(
                ComposeParser.item("playlists", json("{\"type\":\"linked_playlist\",\"provider\":\"ytmusic\",\"providerPlaylistId\":\"PL123\","
                    + "\"name\":\"Linked Library Playlist\",\"creator\":\"Me\",\"artworkUrl\":\"https://art/l\",\"trackCount\":12}")),
                ComposeParser.item("playlists", json("{\"type\":\"linked_playlist\",\"provider\":\"tidal\",\"providerPlaylistId\":\"X\",\"name\":\"Other\"}")),
                playlist("own-1")))));
        HomeView view = Views.builder(app).home(new Catalog.State<>(Catalog.Phase.READY, feed, false), HomeLayout.defaults(),
            Collections.<Model.LiveStation>emptyList());
        Model.Section recents = section(view, "recently_played");
        assertEquals("a provider the app cannot load is not drawn", 2, recents.tiles.size());
        Model.Tile linked = recents.tiles.get(0);
        assertEquals("Linked Library Playlist", linked.title);
        assertEquals("Me", linked.subtitle);
        assertEquals("linkedlib", linked.type);
        assertEquals("ytmusic|PL123", linked.key);
        app.linkedLibraryPlaylist = new Model.Loaded("Linked Library Playlist", "", null, FakeApp.tracks("a"), "origin");
        Capture capture = new Capture();
        linked.opener.open().loader.load(capture);
        assertEquals(Arrays.asList("loadLinkedLibraryPlaylist ytmusic PL123"), app.calls);
        assertEquals(1, capture.loaded.tracks.size());
    }

    @Test public void aPlaylistCardWithNoIdentityTheAppCouldOpenIsNotDrawn() {
        ComposeFeed.Home feed = new ComposeFeed.Home(Arrays.asList(new ComposeFeed.Row("your_playlists", "playlists", "Mine", "library",
            Arrays.asList(ComposeParser.item("playlists", json("{\"name\":\"Nothing to open\"}")), playlist("own-1")))));
        HomeView view = Views.builder(app).home(new Catalog.State<>(Catalog.Phase.READY, feed, false), HomeLayout.defaults(),
            Collections.<Model.LiveStation>emptyList());
        assertEquals(1, section(view, "your_playlists").tiles.size());
    }

    @Test public void theClassicTreeResolvesTheNewTilesFromTheirIdsAlone() {
        HomeBuilder builder = Views.builder(app);
        assertNotNull(builder.collectionFor("list", "ytmusic_mixes/ytmusic-0123456789abcdef0123"));
        assertNull(builder.collectionFor("list", "no-slash"));
        assertNotNull(builder.collectionFor("linkedlib", "ytmusic|PL123"));
        assertNotNull(builder.collectionFor("native", "top_songs"));
        assertNull("a replay that is not ready has no collection", builder.collectionFor("native", "replay"));
        app.replay = new Model.Replay(1, true, "1h", FakeApp.tracks("a"));
        assertNotNull(builder.collectionFor("native", "replay"));
        assertNull(builder.collectionFor("show", "missing"));
        app.shows.add(new Model.Show(new Object(), "show-1", "A Podcast", "", null));
        assertNotNull(builder.collectionFor("show", "show-1"));
    }

    // ---- search results ------------------------------------------------------------------------

    private static Model.SearchHit hit(Model.SearchHit.Kind kind, String id, String title, String subtitle) {
        return new Model.SearchHit(kind, "provider-a", id, title, subtitle, "https://art/" + id);
    }

    @Test public void anAlbumFoundBySearchShowsItsArtistAndOpensThroughTheAddonAlbumLoader() {
        Model.Tile tile = Views.builder(app).searchTile(hit(Model.SearchHit.Kind.ALBUM, "al1", "New World", "An Artist"));
        assertEquals("New World", tile.title);
        assertEquals("the album's artist is the second line", "An Artist", tile.subtitle);
        assertTrue(tile.enabled());
        Model.Collection collection = tile.opener.open();
        assertNotNull("fetched while a spinner shows", collection.loader);
        assertTrue(app.calls.isEmpty());
        app.addonAlbum = new Model.Loaded("New World", "An Artist", null, FakeApp.tracks("a", "b"), "album-origin");
        Capture capture = new Capture();
        collection.loader.load(capture);
        assertEquals(Arrays.asList("loadAddonAlbum provider-a al1"), app.calls);
        assertEquals(2, capture.loaded.tracks.size());
        assertEquals("album-origin", capture.loaded.origin);
        app.addonAlbum = null;
        Capture failed = new Capture();
        collection.loader.load(failed);
        assertTrue("an album the addon cannot give is a failed load", failed.failed);
    }

    @Test public void aPlaylistFoundBySearchOpensThroughTheAddonPlaylistLoader() {
        Model.Tile tile = Views.builder(app).searchTile(hit(Model.SearchHit.Kind.PLAYLIST, "pl1", "Chill", "A Creator"));
        assertEquals("A Creator", tile.subtitle);
        app.addonPlaylist = new Model.Loaded("Chill", "A Creator", null, FakeApp.tracks("x"), "playlist-origin");
        Capture capture = new Capture();
        tile.opener.open().loader.load(capture);
        assertEquals(Arrays.asList("loadAddonPlaylist provider-a pl1"), app.calls);
        assertEquals(1, capture.loaded.tracks.size());
    }

    @Test public void anArtistFoundBySearchOpensAnArtistPageWithSongsAlbumsAndSingles() {
        Model.AlbumRef album = new Model.AlbumRef("addon:provider-a:a1", "An Album", "Artist", null, null, 10, null, null, null);
        Model.AlbumRef single = new Model.AlbumRef("addon:provider-a:s1", "A Single", "Artist", null, null, 1, null, null, null);
        app.addonArtist = new Model.ArtistPage("Artist", "https://img", FakeApp.tracks("top1", "top2"), Arrays.asList(album), Arrays.asList(single));
        Model.Tile tile = Views.builder(app).searchTile(hit(Model.SearchHit.Kind.ARTIST, "ar1", "Artist", ""));
        assertEquals("an artist has no second line", "", tile.subtitle);
        Capture capture = new Capture();
        tile.opener.open().loader.load(capture);
        assertEquals(Arrays.asList("loadAddonArtist provider-a ar1"), app.calls);
        assertEquals(2, capture.loaded.tracks.size());
        assertEquals("Albums", capture.loaded.tilesTitle);
        assertEquals("Singles", capture.loaded.moreGroups.get(0).title);
        assertEquals("composed:artist:addon:provider-a:ar1:Artist", capture.loaded.origin);
        app.addonArtist = null;
        Capture failed = new Capture();
        tile.opener.open().loader.load(failed);
        assertTrue(failed.failed);
    }

    private static org.json.JSONObject json(String text) {
        try {
            return new org.json.JSONObject(text);
        } catch (org.json.JSONException broken) {
            throw new IllegalStateException(broken);
        }
    }

    // ---- states --------------------------------------------------------------------------------

    @Test public void theFirstLoadIsALoadingTemplateWithNothingElse() {
        HomeView view = Views.home(app, Catalog.Phase.LOADING, false);
        assertTrue(view.loading);
        assertTrue(view.sections.isEmpty());
        assertEquals(HomeView.Notice.NONE, view.notice);
        assertTrue(Views.discover(app, Catalog.Phase.LOADING, false).loading);
    }

    @Test public void signedOutAsksForThePhoneAndShowsNothingElse() {
        HomeView view = Views.home(app, Catalog.Phase.SIGNED_OUT, false);
        assertEquals(HomeView.Notice.SIGNED_OUT, view.notice);
        assertTrue(view.sections.isEmpty());
        assertEquals(HomeView.Notice.SIGNED_OUT, Views.discover(app, Catalog.Phase.SIGNED_OUT, false).notice);
    }

    @Test public void aDisabledServerGivesALibraryBackedHomeWithoutAnErrorBannerAndDiscoverSaysUnavailable() {
        app.favorites = FakeApp.tracks("Fav");
        app.history.add(new Model.HistoryEntry("Old song", "Old artist"));
        HomeView view = Views.home(app, Catalog.Phase.DISABLED, false);
        assertEquals("503 is not an error on Home", HomeView.Notice.NONE, view.notice);
        assertFalse(view.sections.isEmpty());
        assertEquals("library_shortcuts", view.sections.get(0).key);
        assertEquals(HomeView.Notice.UNAVAILABLE, Views.discover(app, Catalog.Phase.DISABLED, false).notice);
    }

    @Test public void offlineShowsTheLibraryAndABannerAndKeepsTheRadioCategories() {
        app.categories.add(new Model.Category("genre", "Genres"));
        HomeView view = Views.home(app, Catalog.Phase.OFFLINE, false);
        assertEquals(HomeView.Notice.OFFLINE, view.notice);
        assertEquals("library_shortcuts", view.sections.get(0).key);
        assertEquals(1, view.categories.size());
        assertEquals(HomeView.Notice.OFFLINE, Views.discover(app, Catalog.Phase.OFFLINE, false).notice);
    }

    @Test public void aFailedRefreshKeepsTheCachedRowsUnderABanner() {
        HomeView view = Views.home(app, Catalog.Phase.READY, true);
        assertEquals(HomeView.Notice.REFRESH_FAILED, view.notice);
        assertFalse(view.sections.isEmpty());
        assertEquals(HomeView.Notice.REFRESH_FAILED, Views.discover(app, Catalog.Phase.READY, true).notice);
    }

    @Test public void aFeedWithNothingToShowIsEmptyNotBroken() {
        HomeView view = Views.builder(app).home(new Catalog.State<>(Catalog.Phase.READY, new ComposeFeed.Home(new ArrayList<ComposeFeed.Row>()), false),
            HomeLayout.defaults(), Collections.<Model.LiveStation>emptyList());
        assertTrue(view.sections.isEmpty());
        assertEquals(HomeView.Notice.NONE, view.notice);
    }

    // ---- Discover ------------------------------------------------------------------------------

    @Test public void discoverHasAHeroWithItsSongsAndAGridOfCards() {
        HomeView view = Views.discover(app, Catalog.Phase.READY, false);
        assertEquals(Arrays.asList("dailyDrop", "stationsNew"), keys(view));
        Model.Section hero = section(view, "dailyDrop");
        assertEquals(Model.Section.Type.HERO, hero.type);
        assertEquals(4, hero.tracks.size());
        assertEquals("Today's Drop", hero.feature.title);
        assertEquals("composed:discover:dailyDrop:Today's Drop", hero.origin);
        Model.Section grid = section(view, "stationsNew");
        assertEquals("discover.cards", grid.presentationKey);
        assertEquals("Because you like chill", grid.subtitle);
        Model.Collection card = grid.tiles.get(0).opener.open();
        assertEquals("a card opens from its inline songs, with no request", 1, card.tracks.size());
        assertNull(card.loader);
        assertTrue(app.calls.isEmpty());
    }

    @Test public void aDiscoverCardWithoutSongsIsLeftOut() {
        ComposeFeed.Discover feed = new ComposeFeed.Discover(Arrays.asList(new ComposeFeed.Section("k", "T", "grid",
            Arrays.asList(new ComposeFeed.Card("c", "Empty", "", null, new ArrayList<String>(), new ArrayList<ComposeFeed.Item>())))));
        HomeView view = Views.builder(app).discover(new Catalog.State<>(Catalog.Phase.READY, feed, false));
        assertTrue(view.sections.isEmpty());
    }
}
