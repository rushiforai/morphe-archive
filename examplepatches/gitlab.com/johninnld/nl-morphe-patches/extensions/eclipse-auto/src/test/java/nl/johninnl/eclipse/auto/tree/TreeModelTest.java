package nl.johninnl.eclipse.auto.tree;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import nl.johninnl.eclipse.auto.data.Catalog;
import nl.johninnl.eclipse.auto.data.ComposeCache;
import nl.johninnl.eclipse.auto.data.ComposeClient;
import nl.johninnl.eclipse.auto.data.FakeApp;
import nl.johninnl.eclipse.auto.data.Fixtures;
import nl.johninnl.eclipse.auto.data.HomeBuilder;
import nl.johninnl.eclipse.auto.data.LibraryStore;
import nl.johninnl.eclipse.auto.data.Model;
import nl.johninnl.eclipse.auto.data.RadioStore;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/**
 * The classic tree against fake data: its shape, group titles, paging, the ids that come back as
 * playback, and the waiting and announcing around the feeds. Nothing reaches the network: the
 * catalogue talks to a recording transport that serves the sanitised captures.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 33, manifest = Config.NONE)
public class TreeModelTest {
    private static final class Time implements ComposeCache.Clock {
        long now = 10_000_000L;

        @Override public long now() { return now; }

        @Override public String utcDay() { return "2026-11-22"; }
    }

    private static final class Wire implements ComposeClient.Transport {
        final List<String> urls = new ArrayList<>();
        boolean offline;
        int status = 200;
        String homeBody;

        @Override public ComposeClient.RawResponse get(URL url, Map<String, String> headers) throws IOException {
            urls.add(url.toString());
            if (offline) throw new IOException("offline");
            if (status != 200) return new ComposeClient.RawResponse(status, null);
            boolean home = url.getPath().endsWith("/home");
            return new ComposeClient.RawResponse(200, home ? (homeBody != null ? homeBody : Fixtures.home()) : Fixtures.discover());
        }
    }

    /** What a sink received, and whether it has yet. */
    private static final class Capture implements TreeModel.Sink {
        TreeModel.Listing listing;

        @Override public void deliver(TreeModel.Listing delivered) { listing = delivered; }

        List<String> ids() {
            List<String> ids = new ArrayList<>();
            for (Node node : listing.nodes) ids.add(node.id);
            return ids;
        }
    }

    private final Time time = new Time();
    private final Wire wire = new Wire();
    private final FakeApp app = new FakeApp();
    private final List<Runnable> posted = new ArrayList<>();
    private final List<Runnable> scheduled = new ArrayList<>();
    private final List<String> announced = new ArrayList<>();
    private TreeModel model;

    @Before public void build() {
        final TreeModel[] holder = new TreeModel[1];
        Catalog catalog = new Catalog(app, new ComposeClient(wire), new ComposeCache(null, time), new java.util.concurrent.Executor() {
            @Override public void execute(Runnable task) { task.run(); }
        }, new Catalog.Poster() {
            @Override public void post(Runnable task) { posted.add(task); }
        }, time, new Runnable() {
            @Override public void run() { if (holder[0] != null) holder[0].catalogChanged(); }
        });
        LibraryStore library = new LibraryStore(app);
        holder[0] = model = new TreeModel(app, catalog, new HomeBuilder(app, library, new RadioStore(app)), new TreeModel.Scheduler() {
            @Override public void postDelayed(Runnable task, long delayMs) {
                assertEquals(TreeModel.FEED_WAIT_MS, delayMs);
                scheduled.add(task);
            }
        }, new TreeModel.Notifier() {
            @Override public void childrenChanged(String parentId, int itemCount) { announced.add(parentId); }
        });
        app.categories.add(new Model.Category("genre", "Genres"));
        app.categories.add(new Model.Category("mood", "Moods"));
        app.stations.put("genre", Arrays.asList(new Model.Station(new Object(), "Jazz FM", "", "genre")));
    }

    private void drain() {
        while (!posted.isEmpty()) posted.remove(0).run();
    }

    private Capture ask(String id) {
        Capture capture = new Capture();
        model.children(id, capture);
        return capture;
    }

    /** Asks, lets the feed answer, and returns the delivery. */
    private Capture askAfterFeed(String id) {
        Capture capture = ask(id);
        drain();
        assertNotNull(id + " was never answered", capture.listing);
        return capture;
    }

    private static Node find(Capture capture, String id) {
        for (Node node : capture.listing.nodes) if (node.id.equals(id)) return node;
        throw new AssertionError("no " + id + " in " + capture.ids());
    }

    private static List<String> groups(Capture capture) {
        List<String> groups = new ArrayList<>();
        for (Node node : capture.listing.nodes) if (!groups.contains(String.valueOf(node.group))) groups.add(String.valueOf(node.group));
        return groups;
    }

    private static Model.QueueSnapshot queue(int upNext, int tail, String origin) {
        List<Model.Track> up = new ArrayList<>();
        for (int i = 0; i < upNext; i++) up.add(FakeApp.track("Queued " + i, "A"));
        List<Object> all = new ArrayList<>();
        List<Model.Track> after = new ArrayList<>();
        all.add(new Object());
        for (int i = 0; i < tail; i++) {
            Model.Track track = FakeApp.track("Next " + i, "B");
            after.add(track);
            all.add(track.song);
        }
        return new Model.QueueSnapshot(FakeApp.track("Now", "N"), up, after, all, 0, origin, false);
    }

    // ---- fixed levels --------------------------------------------------------------------------

    @Test public void theRootHoldsHomeDiscoverLibraryAndRadioAsFoldersInThatOrder() {
        Capture root = ask(MediaIds.ROOT);
        assertEquals(Arrays.asList("eclipse:home", "eclipse:discover", "[library]", "[radio]"), root.ids());
        assertEquals(Arrays.asList("Home", "Discover", "Library", "Radio"), titles(root));
        for (Node node : root.listing.nodes) assertEquals(Node.Kind.FOLDER, node.kind);
    }

    private static List<String> titles(Capture capture) {
        List<String> titles = new ArrayList<>();
        for (Node node : capture.listing.nodes) titles.add(node.title);
        return titles;
    }

    @Test public void libraryKeepsTheAppsOwnFolderIdsAndGainsUpNextFirstOnlyWhileSomethingIsQueued() {
        Capture empty = ask(MediaIds.LIBRARY);
        assertEquals(Arrays.asList("[lib_songs]", "[lib_artists]", "[lib_albums]", "[playlists]", "[favorites]", "[recently_played]", "[cloud]"),
            empty.ids());
        app.queue = queue(1, 0, "");
        app.downloadsCount = 2;
        Capture queued = ask(MediaIds.LIBRARY);
        assertEquals("eclipse:queue", queued.ids().get(0));
        assertTrue("downloads appear once there are some", queued.ids().contains("[downloaded]"));
        assertFalse(empty.ids().contains("[downloaded]"));
    }

    @Test public void radioListsLiveStationsFirstThenOnlyTheCategoriesThatHoldStations() {
        app.live = Arrays.asList(new Model.LiveStation("st_hits", "Eclipse Hits", "", "Song", "Artist", "https://art/hits"));
        ask(MediaIds.RADIO);
        drain();
        Capture radio = ask(MediaIds.RADIO);
        assertEquals(Arrays.asList("eclipse:live/st_hits", "radiocat::GENRE"), radio.ids());
        Node live = radio.listing.nodes.get(0);
        assertEquals(Node.Kind.STATION, live.kind);
        assertEquals("LIVE · Song – Artist", live.subtitle);
        assertEquals("Live stations", live.group);
        assertEquals("Categories", radio.listing.nodes.get(1).group);
        assertTrue("the radio level asks the app for its stations", app.calls.contains("loadRadioStations"));
        assertTrue(app.calls.contains("liveStations"));
    }

    @Test public void withoutLiveStationsTheCategoriesAreNotGrouped() {
        Capture radio = ask(MediaIds.RADIO);
        assertEquals(Arrays.asList("radiocat::GENRE"), radio.ids());
        assertNull(radio.listing.nodes.get(0).group);
    }

    // ---- queue ---------------------------------------------------------------------------------

    @Test public void theQueueIsGroupedNextFromYouThenNextFromTheOriginWithJumpIds() {
        app.queue = queue(2, 3, "An Album");
        Capture capture = ask(MediaIds.QUEUE);
        assertEquals(Arrays.asList("eclipse:q/u/0", "eclipse:q/u/1", "eclipse:q/c/1", "eclipse:q/c/2", "eclipse:q/c/3"), capture.ids());
        assertEquals(Arrays.asList("Next from you", "Next from An Album"), groups(capture));
        for (Node node : capture.listing.nodes) assertEquals(Node.Kind.SONG, node.kind);
        assertEquals("Queued 0", capture.listing.nodes.get(0).title);
    }

    @Test public void anEmptyQueueIsAnEmptyListNotAnError() {
        assertTrue(ask(MediaIds.QUEUE).listing.nodes.isEmpty());
    }

    @Test public void queueIdsJumpWithoutDestroyingTheQueueInThePhonesOwnCallOrder() {
        app.queue = queue(3, 4, "Album");
        model.play(MediaIds.upNext(2));
        assertEquals(Arrays.asList("removeUpNext 0", "removeUpNext 0", "skipNext false"), app.calls);
        app.calls.clear();
        model.play(MediaIds.context(3));
        assertEquals(2, app.calls.size());
        assertEquals("setQueueIndex 3", app.calls.get(0));
        assertTrue(app.calls.get(1), app.calls.get(1).startsWith("playKeepingQueue"));
        assertFalse("a context jump never clears Up Next", app.calls.contains("clearUpNext"));
    }

    @Test public void aContextIdPastTheQueueDoesNothing() {
        app.queue = queue(0, 2, "Album");
        model.play(MediaIds.context(40));
        assertTrue(app.calls.toString(), app.calls.isEmpty());
        model.play(MediaIds.upNext(0));
        assertEquals("the first Up Next slot is simply the next song", Arrays.asList("skipNext false"), app.calls);
    }

    // ---- Home and Discover ---------------------------------------------------------------------

    @Test public void homeWaitsForTheFeedThenGroupsEveryRowUnderItsTitleInThePhonesOrder() {
        Capture home = ask(MediaIds.HOME);
        assertNull("the feed has not answered yet", home.listing);
        assertEquals(1, scheduled.size());
        drain();
        assertNotNull(home.listing);
        // The untitled recents are grouped under the phone's label for them; the order is the feed's.
        assertEquals(Arrays.asList("Recent playlists", "Umbra", "Made For You", "Daily Mixes", "YouTube Music mixes", "New For You",
            "Eclipse Stations", "Your Top Songs", "Featured Artist", "Fresh Drops", "Mood Mixes", "Popular Artists", "Your Playlists",
            "Unknown Key Row"), groups(home));
        Map<String, Integer> perGroup = new java.util.LinkedHashMap<>();
        for (Node node : home.listing.nodes) perGroup.merge(String.valueOf(node.group), 1, Integer::sum);
        assertEquals("every song of the row is there: no cap of eight", Integer.valueOf(3), perGroup.get("Your Top Songs"));
        for (Map.Entry<String, Integer> entry : perGroup.entrySet()) assertTrue(entry.getKey(), entry.getValue() <= 30);
        for (Node node : home.listing.nodes) assertFalse("nothing is behind a See all: " + node.id, "See all".equals(node.title));
    }

    @Test public void everyHomeNodeCarriesItsGroupTitleAsTheContentStyleExtra() {
        Capture home = askAfterFeed(MediaIds.HOME);
        int grouped = 0;
        for (Node node : home.listing.nodes) {
            if (node.group == null) {
                assertFalse(node.extras().containsKey(Node.EXTRA_GROUP_TITLE));
                continue;
            }
            grouped++;
            assertEquals(node.group, node.extras().getString(Node.EXTRA_GROUP_TITLE));
            assertEquals("android.media.browse.CONTENT_STYLE_GROUP_TITLE_HINT", Node.EXTRA_GROUP_TITLE);
            assertTrue(node.needsRebuild());
        }
        assertTrue(grouped > 10);
        assertFalse("an ungrouped node needs no rebuild", Node.folder("x", 20, "t", null, null).needsRebuild());
    }

    @Test public void homeRowsBecomeCollectionsAndPlayableSongsWithStableIds() {
        Capture home = askAfterFeed(MediaIds.HOME);
        assertTrue(home.ids().toString(), home.ids().contains(MediaIds.collection("album", "2000000001")));
        assertTrue(home.ids().contains(MediaIds.collection("artist", "1000000002")));
        assertTrue(home.ids().contains(MediaIds.collection("editorial", "pl.00000000000000000000000000000001")));
        assertTrue(home.ids().contains(MediaIds.collection("mix", "mix-1")));
        assertTrue(home.ids().contains(MediaIds.collection("favorites", "all")));
        Node song = find(home, MediaIds.track(MediaIds.row("top_songs"), 0));
        assertEquals(Node.Kind.SONG, song.kind);
        assertEquals("Track 21", song.title);
        assertEquals("Your Top Songs", song.group);
        assertEquals(Node.TYPE_ALBUM, find(home, MediaIds.collection("album", "2000000001")).mediaType);
        assertEquals(Node.TYPE_ARTIST, find(home, MediaIds.collection("artist", "1000000002")).mediaType);
        assertEquals(Node.TYPE_PLAYLIST, find(home, MediaIds.collection("mix", "mix-1")).mediaType);
    }

    @Test public void theNativeAndLinkedRowsAreInTheTreeAndACardThatCannotOpenIsNot() {
        Capture home = askAfterFeed(MediaIds.HOME);
        Node umbra = find(home, MediaIds.DJ);
        assertEquals(Node.Kind.STATION, umbra.kind);
        assertEquals("Umbra", umbra.title);
        assertEquals("Start the DJ", umbra.subtitle);
        assertEquals("Umbra", umbra.group);
        assertTrue("All-Time Top Songs opens", home.ids().contains(MediaIds.collection("native", "top_songs")));
        assertFalse("a replay that is still being built is not offered", home.ids().contains(MediaIds.collection("native", "replay")));
        Node linkedMix = find(home, MediaIds.collection("list", "ytmusic_mixes/ytmusic-0123456789abcdef0123"));
        assertEquals("Linked Mix A", linkedMix.title);
        assertEquals("YouTube Music mixes", linkedMix.group);
        assertFalse("no shows followed, nothing to show", groups(home).contains("Your Shows"));
        app.replay = new Model.Replay(11, true, "3h", FakeApp.tracks("r1"));
        assertTrue(askAfterFeed(MediaIds.HOME).ids().contains(MediaIds.collection("native", "replay")));
    }

    @Test public void startingTheDjFromTheTreeDoesWhatTheCardDoesAndNothingWhileItPlays() {
        model.play(MediaIds.DJ);
        assertEquals(Arrays.asList("startDj"), app.calls);
        model.play(MediaIds.DJ);
        assertEquals("already live: nothing more to do", Arrays.asList("startDj"), app.calls);
    }

    @Test public void aLongRowShowsEverySongWithNoSeeAllAndPlaysFromAnyIndex() {
        StringBuilder items = new StringBuilder();
        for (int i = 0; i < 12; i++) items.append(i == 0 ? "" : ",").append("{\"title\":\"Song ").append(i).append("\",\"artist\":\"A\"}");
        wire.homeBody = "{\"rows\":[{\"key\":\"top_songs\",\"kind\":\"tracks\",\"title\":\"Top\",\"provenance\":\"taste\",\"items\":[" + items + "]}]}";
        Capture home = askAfterFeed(MediaIds.HOME);
        assertEquals("all twelve, no cap of eight and no See all", 12, home.listing.nodes.size());
        assertEquals("Top", home.listing.nodes.get(0).group);
        assertEquals(MediaIds.track(MediaIds.row("top_songs"), 11), home.listing.nodes.get(11).id);
        app.calls.clear();
        model.play(home.listing.nodes.get(10).id);
        assertEquals(Arrays.asList("play 12@10 composed:home:top_songs:Top"), app.calls);
    }

    @Test public void aRunawayRowIsCutSilentlyAtTheOneSafetyCap() {
        StringBuilder items = new StringBuilder();
        for (int i = 0; i < 45; i++) items.append(i == 0 ? "" : ",").append("{\"title\":\"Song ").append(i).append("\",\"artist\":\"A\"}");
        wire.homeBody = "{\"rows\":[{\"key\":\"top_songs\",\"kind\":\"tracks\",\"title\":\"Top\",\"provenance\":\"taste\",\"items\":[" + items + "]}]}";
        Capture home = askAfterFeed(MediaIds.HOME);
        assertEquals(30, home.listing.nodes.size());
        for (Node node : home.listing.nodes) assertFalse(node.id, "See all".equals(node.title));
    }

    @Test public void theNewCollectionsOpenAndPlayThroughTheSameResolverTheScreensUse() {
        app.topSongs = FakeApp.tracks("a", "b", "c");
        String top = MediaIds.collection("native", "top_songs");
        assertEquals(3, ask(top).listing.nodes.size());
        app.calls.clear();
        model.play(MediaIds.track(top, 1));
        assertEquals(Arrays.asList("loadTopSongs", "play 3@1 composed:home:top_songs:All-Time Top Songs"), app.calls);
        app.linkedList = new Model.Loaded("Linked Mix A", "2 songs", null, FakeApp.tracks("x", "y"), "linked-origin");
        String list = MediaIds.collection("list", "ytmusic_mixes/ytmusic-0123456789abcdef0123");
        assertEquals(2, ask(list).listing.nodes.size());
        app.calls.clear();
        model.play(MediaIds.track(list, 1));
        assertEquals(Arrays.asList("loadLinkedList ytmusic_mixes ytmusic-0123456789abcdef0123", "play 2@1 linked-origin"), app.calls);
        app.linkedLibraryPlaylist = new Model.Loaded("Liked", "", null, FakeApp.tracks("l1"), "lib-origin");
        assertEquals(1, ask(MediaIds.collection("linkedlib", "ytmusic|PL123")).listing.nodes.size());
        app.shows.add(new Model.Show(new Object(), "show-1", "A Podcast", "Someone", null));
        app.showEpisodes = new Model.Loaded("A Podcast", "Someone", null, FakeApp.tracks("e1", "e2"), null);
        assertEquals(2, ask(MediaIds.collection("show", "show-1")).listing.nodes.size());
        assertTrue("a failed load is an empty list", ask(MediaIds.collection("show", "missing")).listing.nodes.isEmpty());
        app.topSongs = new ArrayList<>();
        assertTrue(ask(top).listing.nodes.isEmpty());
    }

    @Test public void homeAnnouncesChildrenChangedWhenTheFeedArrivesAfterItAnsweredFromTheLibrary() {
        app.favorites = FakeApp.tracks("Fav");
        Capture home = ask(MediaIds.HOME);
        assertNull(home.listing);
        // The wait runs out before the feed answers.
        scheduled.remove(0).run();
        assertNotNull("answered from the library", home.listing);
        assertTrue(home.ids().toString(), home.ids().contains(MediaIds.collection("facet", "FAVORITES")));
        assertTrue("nothing is announced yet", announced.isEmpty());
        drain();
        assertEquals("the real Home arrives later and the host is told once", Arrays.asList(MediaIds.HOME), announced);
        Capture again = ask(MediaIds.HOME);
        assertNotNull("served at once now", again.listing);
        assertTrue(again.ids().contains(MediaIds.collection("album", "2000000001")));
    }

    @Test public void aLaterRequestForTheAnsweredWaiterDoesNothingWhenItsTimerFiresAfterTheFeedCame() {
        Capture home = ask(MediaIds.HOME);
        drain();
        assertNotNull(home.listing);
        TreeModel.Listing first = home.listing;
        scheduled.remove(0).run();
        assertSame(first, home.listing);
    }

    private static void assertSame(Object expected, Object actual) { org.junit.Assert.assertSame(expected, actual); }

    @Test public void signedOutHomeShowsASignInNoticeWithNothingToTap() {
        app.auth = new Model.ComposeAuth(null, "d", "us", "");
        Capture signedOut = askAfterFeed(MediaIds.HOME);
        Node notice = signedOut.listing.nodes.get(0);
        assertEquals("Sign in to Eclipse on your phone", notice.title);
        assertEquals("Status", notice.group);
        assertEquals(MediaIds.Kind.NOTICE, MediaIds.parse(notice.id).kind);
    }

    @Test public void offlineHomeFallsBackToTheLibraryWithARetryThatRefreshesTheFeed() {
        wire.offline = true;
        app.favorites = FakeApp.tracks("Fav");
        Capture home = askAfterFeed(MediaIds.HOME);
        Node retry = home.listing.nodes.get(0);
        assertEquals(MediaIds.retry("home"), retry.id);
        assertEquals("Offline · Retry", retry.title);
        int before = wire.urls.size();
        Capture refresh = ask(retry.id);
        assertTrue("retry answers at once with nothing underneath", refresh.listing.nodes.isEmpty());
        assertEquals("and asks the server again", before + 1, wire.urls.size());
    }

    @Test public void aDisabledServerGivesAQuietLibraryHomeAndUnavailableDiscover() {
        wire.status = 503;
        app.favorites = FakeApp.tracks("Fav");
        Capture home = askAfterFeed(MediaIds.HOME);
        for (Node node : home.listing.nodes) assertFalse("no banner on Home for 503", "Status".equals(node.group));
        Capture discover = askAfterFeed(MediaIds.DISCOVER);
        assertEquals("Not available right now", discover.listing.nodes.get(0).title);
    }

    @Test public void discoverGroupsTheHeroSongsAndTheCardsByTheirSectionTitle() {
        Capture discover = askAfterFeed(MediaIds.DISCOVER);
        assertEquals(Arrays.asList("Your Daily Drop", "More For You"), groups(discover));
        Node heroSong = find(discover, MediaIds.track(MediaIds.section("dailyDrop"), 0));
        assertEquals("Your Daily Drop", heroSong.group);
        Node card = find(discover, MediaIds.collection("card", "stationsNew|grid-1"));
        assertEquals("More For You", card.group);
        assertEquals("Chill Picks", card.title);
    }

    // ---- collections ---------------------------------------------------------------------------

    @Test public void aFeedCardOpensFromItsInlineSongsAndPlaysUnderTheDiscoverOrigin() {
        Capture discoverFirst = askAfterFeed(MediaIds.DISCOVER);
        assertNotNull(discoverFirst);
        String card = MediaIds.collection("card", "stationsNew|grid-1");
        Capture songs = ask(card);
        assertNotNull(songs.listing);
        assertEquals(Arrays.asList(MediaIds.track(card, 0)), songs.ids());
        model.play(MediaIds.track(card, 0));
        assertEquals(Arrays.asList("play 1@0 composed:discover:stationsNew:Chill Picks"), app.calls);
    }

    @Test public void aMixOpensFromTheFeedAndPlaysUnderTheDailyMixOrigin() {
        askAfterFeed(MediaIds.HOME);
        String mix = MediaIds.collection("mix", "mix-1");
        Capture songs = ask(mix);
        assertEquals(3, songs.listing.nodes.size());
        app.calls.clear();
        model.play(MediaIds.track(mix, 2));
        assertEquals(Arrays.asList("play 3@2 composed:daily_mix:daily_mixes:Daily Mix 1"), app.calls);
    }

    @Test public void anAlbumIsFetchedThroughTheAppsLoaderThenListsAndPlaysItsSongs() {
        app.album = new Model.Loaded("An Album", "An Artist", null, FakeApp.tracks("one", "two", "three"), "album-origin");
        String album = MediaIds.collection("album", "2000000001");
        Capture songs = ask(album);
        assertNotNull(songs.listing);
        assertEquals(Arrays.asList(MediaIds.track(album, 0), MediaIds.track(album, 1), MediaIds.track(album, 2)), songs.ids());
        assertEquals(Arrays.asList("loadAlbum 2000000001"), app.calls);
        app.calls.clear();
        model.play(MediaIds.track(album, 1));
        assertEquals(Arrays.asList("loadAlbum 2000000001", "play 3@1 album-origin"), app.calls);
    }

    @Test public void anArtistListsSongsThenAlbumsThenSinglesInTitledGroups() {
        Model.AlbumRef album = new Model.AlbumRef("a1", "An Album", "Artist", null, null, 3, null, null, null);
        Model.AlbumRef single = new Model.AlbumRef("s1", "A Single", "Artist", null, null, 1, null, null, null);
        app.artist = new Model.ArtistPage("Artist", null, FakeApp.tracks("top1", "top2"), Arrays.asList(album), Arrays.asList(single));
        Capture page = ask(MediaIds.collection("artist", "1000000001"));
        assertEquals(Arrays.asList("Songs", "Albums", "Singles"), groups(page));
        assertTrue(page.ids().contains(MediaIds.collection("album", "a1")));
        assertTrue(page.ids().contains(MediaIds.collection("album", "s1")));
    }

    @Test public void anEditorialPlaylistAndFavouritesOpenThroughTheSameResolverTheScreensUse() {
        app.editorial = new Model.Loaded("Playlist A", "Apple Music", null, FakeApp.tracks("x", "y"), "editorial-origin");
        assertEquals(2, ask(MediaIds.collection("editorial", "pl.abc")).listing.nodes.size());
        app.favorites = FakeApp.tracks("f1", "f2", "f3");
        assertEquals(3, ask(MediaIds.collection("favorites", "all")).listing.nodes.size());
        app.playlists.add(new Model.Ref(null, "own-1", "Mine", "1 song", null));
        app.playlistSongs.put("own-1", FakeApp.tracks("p1"));
        assertEquals(1, ask(MediaIds.collection("playlist", "own-1")).listing.nodes.size());
        assertEquals(0, ask(MediaIds.collection("facet", "CLOUD")).listing.nodes.size());
        app.songs = FakeApp.tracks("s1", "s2");
        assertEquals(2, ask(MediaIds.collection("facet", "SONGS")).listing.nodes.size());
    }

    @Test public void aCollectionThatFailsToLoadOrDoesNotExistIsAnEmptyListNeverAnError() {
        assertTrue("no album loaded", ask(MediaIds.collection("album", "nope")).listing.nodes.isEmpty());
        assertTrue(ask(MediaIds.collection("playlist", "not-in-library")).listing.nodes.isEmpty());
        assertTrue(ask(MediaIds.collection("martian", "x")).listing.nodes.isEmpty());
        assertTrue(ask(MediaIds.collection("facet", "NOT_A_FACET")).listing.nodes.isEmpty());
    }

    // ---- paging and the rest of the grammar ----------------------------------------------------

    @Test public void moreReturnsTheRemainderOfItsParentFromTheOffsetAndPointsBackAtTheRealParent() {
        List<Model.Track> tracks = FakeApp.tracks("t0", "t1", "t2", "t3", "t4", "t5");
        app.favorites = tracks;
        String parent = MediaIds.collection("favorites", "all");
        Capture more = ask(MediaIds.more(parent, 4));
        assertEquals(Arrays.asList(MediaIds.track(parent, 4), MediaIds.track(parent, 5)), more.ids());
        assertEquals(parent, more.listing.parent);
        assertEquals(4, more.listing.offset);
        // The page that follows a first cut keeps pointing at the same parent, with the absolute offset.
        List<Node> next = Paging.cut(more.listing.nodes, more.listing.parent, more.listing.offset, 1);
        assertEquals(Arrays.asList(MediaIds.track(parent, 4)), idsOf(next));
    }

    private static List<String> idsOf(List<Node> nodes) {
        List<String> ids = new ArrayList<>();
        for (Node node : nodes) ids.add(node.id);
        return ids;
    }

    @Test public void anUnknownOrMalformedEclipseIdIsAnEmptyListAndNeverThrows() {
        for (String id : new String[] {"eclipse:nonsense", "eclipse:t/%ZZ/1", "eclipse:", "eclipse:q/u/-1", "eclipse:notice/signed-out",
            MediaIds.track(MediaIds.HOME, 3), MediaIds.upNext(2), MediaIds.live("x"), "eclipse:c/a/b/c",
            // The row ids only name the parent of a row's songs now; nothing lists a row on its own any more.
            MediaIds.row("top_songs"), MediaIds.section("dailyDrop"), MediaIds.DJ}) {
            Capture capture = ask(id);
            assertNotNull(id, capture.listing);
            assertTrue(id, capture.listing.nodes.isEmpty());
        }
    }

    @Test public void playingAnIdThatIsNotOursOrNotPlayableDoesNothingAndNeverThrows() {
        for (String id : new String[] {"playlist::abc::1", "eclipse:nonsense", "eclipse:t/%ZZ/1", "eclipse:home", "eclipse:discover",
            MediaIds.collection("album", "x"), MediaIds.track(MediaIds.collection("album", "x"), 99), MediaIds.notice("x"), "", null}) {
            model.play(id);
        }
        assertTrue(app.calls.toString(), app.calls.stream().noneMatch(call -> call.startsWith("play ")));
    }

    @Test public void aLiveStationIdTunesTheStation() {
        model.play(MediaIds.live("st_hits"));
        assertEquals(Arrays.asList("tuneLiveStation st_hits"), app.calls);
    }

    @Test public void aHomeSongPlaysItsRowFromThatIndexUnderTheRowsHomeOrigin() {
        askAfterFeed(MediaIds.HOME);
        app.calls.clear();
        model.play(MediaIds.track(MediaIds.row("top_songs"), 1));
        assertEquals(Arrays.asList("play 3@1 composed:home:top_songs:Your Top Songs"), app.calls);
    }

    // ---- announcing ----------------------------------------------------------------------------

    @Test public void aQueueChangeAnnouncesTheQueueAndTheNodesThatListItOnlyWhenSomethingBecomesQueued() {
        ask(MediaIds.LIBRARY);
        model.queueChanged();
        assertEquals(Arrays.asList(MediaIds.QUEUE), announced);
        announced.clear();
        app.queue = queue(1, 0, "");
        model.queueChanged();
        assertEquals(Arrays.asList(MediaIds.QUEUE, MediaIds.LIBRARY), announced);
        announced.clear();
        app.queue = queue(2, 0, "");
        model.queueChanged();
        assertEquals("the library node does not change again while something stays queued", Arrays.asList(MediaIds.QUEUE), announced);
    }

    @Test public void aRefetchOfTheSameLiveStationsAnnouncesNothingSoAHostThatAsksAgainCannotLoopForever() {
        app.live = Arrays.asList(new Model.LiveStation("s1", "Hits", "", "Song", "Artist", null));
        ask(MediaIds.RADIO);
        drain();
        announced.clear();
        for (int round = 0; round < 3; round++) {
            ask(MediaIds.RADIO);
            drain();
        }
        assertTrue(announced.toString(), announced.isEmpty());
        app.live = Arrays.asList(new Model.LiveStation("s1", "Hits", "", "Another song", "Artist", null));
        ask(MediaIds.RADIO);
        drain();
        assertEquals(Arrays.asList(MediaIds.RADIO), announced);
    }

    @Test public void aRefreshThatBringsTheSameContentAnnouncesNothingAndOneThatDiffersAnnouncesOnce() {
        askAfterFeed(MediaIds.HOME);
        announced.clear();
        ask(MediaIds.HOME);
        drain();
        assertTrue("a fresh feed is not fetched again", announced.isEmpty());
        time.now += ComposeCache.HOME_FRESH_MS + 1;
        int before = wire.urls.size();
        ask(MediaIds.HOME);
        drain();
        assertEquals("a stale feed is refetched", before + 1, wire.urls.size());
        assertTrue("the same content is nothing to announce", announced.isEmpty());
        time.now += ComposeCache.HOME_FRESH_MS + 1;
        wire.homeBody = "{\"rows\":[{\"key\":\"top_songs\",\"kind\":\"tracks\",\"title\":\"Top\",\"provenance\":\"taste\","
            + "\"items\":[{\"title\":\"Brand new\",\"artist\":\"A\"}]}]}";
        ask(MediaIds.HOME);
        drain();
        assertEquals(Collections.singletonList(MediaIds.HOME), announced);
    }
}
