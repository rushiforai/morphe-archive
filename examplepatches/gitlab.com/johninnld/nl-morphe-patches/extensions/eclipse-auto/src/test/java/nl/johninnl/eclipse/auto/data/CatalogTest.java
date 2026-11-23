package nl.johninnl.eclipse.auto.data;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executor;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/**
 * The feed state machine of design section 4, driven with a recording transport (nothing reaches
 * the network), a manual clock, an executor the test runs by hand and a poster it drains by hand.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 33, manifest = Config.NONE)
public class CatalogTest {
    private static final String ONE_ROW = "{\"rows\":[{\"key\":\"top_songs\",\"kind\":\"tracks\",\"items\":[{\"title\":\"One\",\"artist\":\"A\"}]}]}";
    private static final String TWO_ROWS = "{\"rows\":[{\"key\":\"top_songs\",\"kind\":\"tracks\",\"items\":[{\"title\":\"One\",\"artist\":\"A\"}]},"
        + "{\"key\":\"new_for_you\",\"kind\":\"tracks\",\"items\":[{\"title\":\"Two\",\"artist\":\"B\"}]}]}";

    private static final class Time implements ComposeCache.Clock {
        long now = 10_000_000L;
        String day = "2026-11-22";

        @Override public long now() { return now; }

        @Override public String utcDay() { return day; }
    }

    private static final class Wire implements ComposeClient.Transport {
        final List<String> urls = new ArrayList<>();
        final List<ComposeClient.RawResponse> answers = new ArrayList<>();
        ComposeClient.RawResponse next = new ComposeClient.RawResponse(200, ONE_ROW);
        boolean offline;

        @Override public ComposeClient.RawResponse get(URL url, Map<String, String> headers) throws IOException {
            urls.add(url.toString());
            if (offline) throw new IOException("offline");
            return answers.isEmpty() ? next : answers.remove(0);
        }
    }

    private final Time time = new Time();
    private final Wire wire = new Wire();
    private final FakeApp app = new FakeApp();
    private final List<Runnable> posted = new ArrayList<>();
    private final List<Runnable> queued = new ArrayList<>();
    private boolean manualExecutor;
    private int changes;
    private final ComposeCache cache = new ComposeCache(null, time);
    private final Executor executor = new Executor() {
        @Override public void execute(Runnable task) {
            if (manualExecutor) queued.add(task);
            else task.run();
        }
    };
    private final Catalog catalog = new Catalog(app, new ComposeClient(wire), cache, executor, new Catalog.Poster() {
        @Override public void post(Runnable task) { posted.add(task); }
    }, time, new Runnable() { @Override public void run() { changes++; } });

    private void drain() {
        while (!posted.isEmpty()) posted.remove(0).run();
    }

    private static List<String> rowKeys(Catalog.State<ComposeFeed.Home> state) {
        List<String> keys = new ArrayList<>();
        for (ComposeFeed.Row row : state.value.rows) keys.add(row.key);
        return keys;
    }

    @Test public void beforeAnyRequestTheFeedIsLoadingSoTheTemplateCanShowItsSpinner() {
        assertEquals(Catalog.Phase.LOADING, catalog.home().phase);
        assertNull(catalog.home().value);
    }

    @Test public void withoutATokenNothingIsRequestedAndHomeAsksTheDriverToSignInOnThePhone() {
        app.auth = new Model.ComposeAuth(null, "device", "us", "");
        catalog.requestHome(false);
        drain();
        assertEquals(Catalog.Phase.SIGNED_OUT, catalog.home().phase);
        assertTrue("no request leaves the car without a token", wire.urls.isEmpty());
    }

    @Test public void theFirstLoadShowsTheFeedAndFillsTheCache() {
        catalog.requestHome(false);
        drain();
        assertEquals(Catalog.Phase.READY, catalog.home().phase);
        assertFalse(catalog.home().refreshFailed);
        assertEquals(Arrays.asList("top_songs"), rowKeys(catalog.home()));
        assertEquals(Arrays.asList("https://api.eclipsemusic.app/api/compose/home?storefront=us&caps=linkedRows:2,linkedPlaylists:2"), wire.urls);
        assertEquals(ONE_ROW, cache.lookup("home", "user-1|us").body);
        assertTrue("the screen was told", changes > 0);
    }

    @Test public void aFreshFeedIsNotFetchedAgainButARetryAndTheNextWindowAre() {
        catalog.requestHome(false);
        drain();
        time.now += ComposeCache.HOME_FRESH_MS - 1;
        catalog.requestHome(false);
        drain();
        assertEquals(1, wire.urls.size());
        catalog.requestHome(true);
        drain();
        assertEquals("an explicit retry always asks", 2, wire.urls.size());
        time.now += ComposeCache.HOME_FRESH_MS;
        catalog.requestHome(false);
        drain();
        assertEquals("past five minutes the next visit refreshes", 3, wire.urls.size());
    }

    @Test public void aStaleCacheShowsAtOnceWhileTheRefreshRuns() {
        cache.put("home", "user-1|us", ONE_ROW);
        time.now += 2 * ComposeCache.HOME_FRESH_MS;
        wire.next = new ComposeClient.RawResponse(200, TWO_ROWS);
        catalog.requestHome(false);
        // The cached rows are published before the network answer.
        assertTrue(posted.size() >= 2);
        posted.remove(0).run();
        assertEquals(Arrays.asList("top_songs"), rowKeys(catalog.home()));
        drain();
        assertEquals(Arrays.asList("top_songs", "new_for_you"), rowKeys(catalog.home()));
        assertEquals(1, wire.urls.size());
    }

    @Test public void aFreshCacheNeedsNoNetworkAtAll() {
        cache.put("home", "user-1|us", ONE_ROW);
        catalog.requestHome(false);
        drain();
        assertEquals(Catalog.Phase.READY, catalog.home().phase);
        assertTrue(wire.urls.isEmpty());
    }

    @Test public void aRejectedTokenMeansSignedOutAndIsNotRetriedInALoop() {
        wire.next = new ComposeClient.RawResponse(401, null);
        catalog.requestHome(false);
        drain();
        assertEquals(Catalog.Phase.SIGNED_OUT, catalog.home().phase);
        catalog.requestHome(false);
        drain();
        assertEquals("a second visit inside the retry window does not hit the server", 1, wire.urls.size());
        time.now += Catalog.MIN_RETRY_MS;
        catalog.requestHome(false);
        drain();
        assertEquals(2, wire.urls.size());
    }

    @Test public void aDisabledServerMeansADisabledFeedWithoutAnError() {
        wire.next = new ComposeClient.RawResponse(503, null);
        catalog.requestHome(false);
        drain();
        assertEquals(Catalog.Phase.DISABLED, catalog.home().phase);
        assertFalse(catalog.home().refreshFailed);
    }

    @Test public void aFailureWithNothingCachedIsOfflineAndWithACacheItKeepsTheCachedRowsAndSaysRefreshFailed() {
        wire.offline = true;
        catalog.requestHome(false);
        drain();
        assertEquals(Catalog.Phase.OFFLINE, catalog.home().phase);
        // A new account's catalogue with a stale cache: rows stay, the refresh is marked failed.
        Catalog second = new Catalog(app, new ComposeClient(wire), cache, executor, new Catalog.Poster() {
            @Override public void post(Runnable task) { posted.add(task); }
        }, time, new Runnable() { @Override public void run() { changes++; } });
        cache.put("home", "user-1|us", ONE_ROW);
        time.now += 2 * ComposeCache.HOME_FRESH_MS;
        second.requestHome(false);
        drain();
        assertEquals(Catalog.Phase.READY, second.home().phase);
        assertTrue(second.home().refreshFailed);
        assertEquals(Arrays.asList("top_songs"), rowKeys(second.home()));
    }

    @Test public void aMalformedBodyIsAFailureNotACrash() {
        wire.next = new ComposeClient.RawResponse(200, "<html>oops</html>");
        catalog.requestHome(false);
        drain();
        assertEquals(Catalog.Phase.OFFLINE, catalog.home().phase);
        assertNull("a body that does not parse is never cached", cache.lookup("home", "user-1|us"));
    }

    @Test public void anOlderRequestsResultThatReachesTheMainThreadLateIsDropped() {
        manualExecutor = true;
        wire.answers.add(new ComposeClient.RawResponse(200, ONE_ROW));
        wire.answers.add(new ComposeClient.RawResponse(200, TWO_ROWS));
        catalog.requestHome(true);
        queued.get(0).run();
        int olderPosts = posted.size();
        assertTrue(olderPosts > 0);
        catalog.requestHome(true);
        queued.get(1).run();
        // Deliver the newer request's results first, then the older request's: the older ones must not win.
        List<Runnable> older = new ArrayList<>(posted.subList(0, olderPosts));
        List<Runnable> newer = new ArrayList<>(posted.subList(olderPosts, posted.size()));
        posted.clear();
        for (Runnable task : newer) task.run();
        for (Runnable task : older) task.run();
        assertEquals(Arrays.asList("top_songs", "new_for_you"), rowKeys(catalog.home()));
    }

    @Test public void aSupersededLoadNeverFetchesOrWritesTheCache() {
        manualExecutor = true;
        catalog.requestHome(true);
        catalog.requestHome(true);
        queued.get(0).run();
        assertTrue("the first load was superseded before it started", wire.urls.isEmpty());
        queued.get(1).run();
        assertEquals(1, wire.urls.size());
        drain();
        assertEquals(Catalog.Phase.READY, catalog.home().phase);
    }

    @Test public void closingTheCatalogueDropsEverythingThatIsStillInFlight() {
        manualExecutor = true;
        catalog.requestHome(false);
        catalog.close();
        queued.get(0).run();
        drain();
        assertEquals(Catalog.Phase.LOADING, catalog.home().phase);
        assertEquals(0, changes);
        catalog.requestHome(true);
        assertEquals("a closed catalogue starts nothing", 1, queued.size());
    }

    @Test public void aDifferentAccountNeverSeesTheFeedOfThePreviousOne() {
        catalog.requestHome(false);
        drain();
        app.auth = new Model.ComposeAuth("other-token", "device-1", "us", "user-2|us");
        wire.next = new ComposeClient.RawResponse(200, TWO_ROWS);
        catalog.requestHome(false);
        drain();
        assertEquals(2, wire.urls.size());
        assertEquals(Arrays.asList("top_songs", "new_for_you"), rowKeys(catalog.home()));
        assertNull(cache.lookup("home", "user-3|us"));
        assertNotNull(cache.lookup("home", "user-2|us"));
    }

    @Test public void discoverIsItsOwnFeedWithItsOwnShapeAndNoCaps() {
        wire.next = new ComposeClient.RawResponse(200, "{\"sections\":[{\"key\":\"d\",\"title\":\"T\",\"layout\":\"hero\",\"cards\":[]}]}");
        catalog.requestDiscover(false);
        drain();
        assertEquals(Catalog.Phase.READY, catalog.discover().phase);
        assertEquals(1, catalog.discover().value.sections.size());
        assertEquals("https://api.eclipsemusic.app/api/compose/discover?storefront=us", wire.urls.get(0));
        assertEquals("Home was not touched", Catalog.Phase.LOADING, catalog.home().phase);
    }

    @Test public void theRadioBlockLoadsLiveStationsEveryTimeAndTheCategoriesAndTheReplayOnce() {
        app.live = Arrays.asList(new Model.LiveStation("s1", "Hits", "", "Song", "Artist", null));
        catalog.requestRadio();
        catalog.requestRadio();
        assertEquals(1, catalog.liveStations().size());
        int liveCalls = 0;
        int radioCalls = 0;
        int replayCalls = 0;
        for (String call : app.calls) {
            if (call.equals("liveStations")) liveCalls++;
            if (call.equals("loadRadioStations")) radioCalls++;
            if (call.equals("refreshReplay")) replayCalls++;
        }
        assertEquals(2, liveCalls);
        assertEquals("the categories' stations are loaded once", 1, radioCalls);
        assertEquals("the app's replay is asked to sync once, so the Replay card is not stuck on 'Building'", 1, replayCalls);
        assertTrue(changes > 0);
    }

    @Test public void theTokenIsReadFreshForEveryRequestAndNeverKeptByTheCatalogue() {
        catalog.requestHome(true);
        catalog.requestDiscover(true);
        drain();
        assertEquals(2, app.composeAuthReads);
        assertSame(Catalog.Phase.READY, catalog.home().phase);
    }

    @Test public void theLayoutIsReadFreshFromThePhonesPreferences() {
        assertEquals(Arrays.asList("recently_played", "top_songs"), keysOf(catalog.layout()));
        app.layoutJson = "{\"order\":[\"top_songs\"],\"hidden\":[\"recently_played\"],\"titles\":{}}";
        assertEquals(Arrays.asList("top_songs"), keysOf(catalog.layout()));
    }

    private static List<String> keysOf(HomeLayout layout) {
        List<ComposeFeed.Row> rows = new ArrayList<>();
        for (String key : new String[] {"top_songs", "recently_played"}) {
            rows.add(new ComposeFeed.Row(key, "tracks", "", null, new ArrayList<ComposeFeed.Item>()));
        }
        List<String> keys = new ArrayList<>();
        for (ComposeFeed.Row row : layout.apply(rows)) keys.add(row.key);
        return keys;
    }
}
