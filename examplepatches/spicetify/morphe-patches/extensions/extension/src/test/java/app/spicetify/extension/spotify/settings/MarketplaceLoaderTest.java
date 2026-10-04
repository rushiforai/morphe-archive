package app.spicetify.extension.spotify.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.Executor;
import java.util.concurrent.TimeUnit;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35, manifest = Config.NONE)
public class MarketplaceLoaderTest {
    private static final Executor DIRECT = Runnable::run;
    private static final long ONE_HOUR_MILLIS = 60 * 60 * 1000L;
    /** The shape of Marketplace's resources/blacklist.json, comment strings included. */
    private static final String USABLE = "[dark]\nmain = 121212\n";
    private static final String BLACKLIST =
            "{\"repos\":[\"// for old versions:\",\"// for new bl syntax:\",\"https://github.com/bad/*\"]}";

    private static final Marketplace.Repo ONE =
            new Marketplace.Repo("a", "one", "main", "https://github.com/a/one", 30);
    private static final Marketplace.Repo TWO =
            new Marketplace.Repo("bad", "two", "main", "https://github.com/bad/two", 20);
    private static final Marketplace.Repo THREE =
            new Marketplace.Repo("c", "three", "main", "https://github.com/c/three", 10);
    private static final Marketplace.Repo FOUR =
            new Marketplace.Repo("d", "four", "main", "https://github.com/d/four", 20);
    private static final String TOO_LONG = "Couldn't load the Marketplace: GitHub took too long to answer.";

    @Rule public TemporaryFolder tempFolder = new TemporaryFolder();

    private final Map<String, String> responses = new HashMap<>();
    private final List<String> requested = Collections.synchronizedList(new ArrayList<>());
    private final long[] now = {10_000_000L};
    private File cacheFile;

    @Before
    public void setUp() {
        cacheFile = new File(tempFolder.getRoot(), "marketplace.json");
    }

    private Marketplace.Fetcher fetcher() {
        return url -> {
            requested.add(url);
            String value = responses.get(url);
            // Every theme's color.ini has a scheme Spotify can use, unless a test says otherwise.
            if (value == null && url.endsWith("/c.ini")) value = USABLE;
            if (value == null) throw new FileNotFoundException(url);
            if ("RATE".equals(value)) throw new Marketplace.RateLimitException(url);
            if ("FAIL".equals(value)) throw new IOException("Connection reset");
            if ("HUGE".equals(value)) throw new Marketplace.TooLargeException(url);
            return value;
        };
    }

    private Marketplace.Cached cached() throws Exception {
        return Marketplace.fromJson(new String(Files.readAllBytes(cacheFile.toPath()), StandardCharsets.UTF_8));
    }

    private MarketplaceLoader loader() {
        return new MarketplaceLoader(fetcher(), DIRECT, cacheFile, () -> now[0]);
    }

    /** Uses the 6-argument constructor so a test can pick short waits for the manifests and the checks. */
    private MarketplaceLoader loader(Executor tasks, long manifestsTimeoutMillis, long checksTimeoutMillis) {
        return new MarketplaceLoader(fetcher(), tasks, cacheFile, () -> now[0], manifestsTimeoutMillis, checksTimeoutMillis);
    }

    private static String repoJson(Marketplace.Repo repo) {
        return "{\"full_name\":\"" + repo.owner + "/" + repo.name + "\",\"default_branch\":\"" + repo.branch + "\","
                + "\"html_url\":\"" + repo.url + "\",\"stargazers_count\":" + repo.stars + "}";
    }

    private static String searchJson(int total, List<Marketplace.Repo> repos) {
        StringBuilder items = new StringBuilder();
        for (int i = 0; i < repos.size(); i++) {
            if (i > 0) items.append(',');
            items.append(repoJson(repos.get(i)));
        }
        return "{\"total_count\":" + total + ",\"items\":[" + items + "]}";
    }

    private static String themeJson(String name) {
        return themeJson(name, "c.ini");
    }

    private static String themeJson(String name, String schemes) {
        return "{\"name\":\"" + name + "\",\"description\":\"d\",\"usercss\":\"u.css\",\"schemes\":\"" + schemes + "\"}";
    }

    private static List<String> titles(List<Marketplace.Theme> themes) {
        List<String> titles = new ArrayList<>();
        for (Marketplace.Theme theme : themes) titles.add(theme.title);
        return titles;
    }

    /** Blacklist, a 3-repo search page, and manifests for everything but the blacklisted repo. */
    private void putFreshData() {
        responses.put(Marketplace.BLACKLIST_URL, BLACKLIST);
        responses.put(Marketplace.SEARCH_URL + "1", searchJson(3, Arrays.asList(ONE, TWO, THREE)));
        responses.put(Marketplace.manifestUrl(ONE), themeJson("One"));
        responses.put(Marketplace.manifestUrl(THREE), "[" + themeJson("Three A") + "," + themeJson("Three B") + "]");
    }

    private final class Recorder implements MarketplaceLoader.Listener {
        List<Marketplace.Theme> lastThemes;
        boolean lastDone;
        int themeCalls;
        String error;
        /** Every call in order: "update" or "done" with the titles listed, or "error" with the message. */
        final List<String> calls = Collections.synchronizedList(new ArrayList<>());
        /** How many requests had gone out at each call. */
        final List<Integer> requestsAt = Collections.synchronizedList(new ArrayList<>());

        @Override
        public void onThemes(List<Marketplace.Theme> themes, boolean done) {
            lastThemes = themes;
            lastDone = done;
            themeCalls++;
            calls.add((done ? "done " : "update ") + titles(themes));
            requestsAt.add(requested.size());
        }

        @Override
        public void onError(String message) {
            error = message;
            calls.add("error " + message);
            requestsAt.add(requested.size());
        }
    }

    /** Collects submitted manifest tasks instead of running them, so a test can run them by hand. */
    private static final class StoringExecutor implements Executor {
        final List<Runnable> tasks = new ArrayList<>();

        @Override
        public void execute(Runnable command) {
            tasks.add(command);
        }
    }

    @Test
    public void maxAgeIsSixHours() {
        assertEquals(6 * 60 * 60 * 1000L, MarketplaceLoader.MAX_AGE_MILLIS);
    }

    @Test
    public void freshLoad_skipsBlacklistedRepoAndCachesTheResult() throws Exception {
        putFreshData();

        Recorder listener = new Recorder();
        loader().load(false, listener);

        assertNull(listener.error);
        assertTrue(listener.lastDone);
        assertEquals(3, listener.themeCalls); // one onThemes(false) per accepted repo, then the final onThemes(true)
        List<Marketplace.Theme> themes = listener.lastThemes;
        assertEquals(3, themes.size());
        assertEquals("One", themes.get(0).title);
        assertEquals("Three A", themes.get(1).title);
        assertEquals("Three B", themes.get(2).title);
        assertFalse(requested.contains(Marketplace.manifestUrl(TWO)));

        String json = new String(Files.readAllBytes(cacheFile.toPath()), StandardCharsets.UTF_8);
        Marketplace.Cached cached = Marketplace.fromJson(json);
        assertEquals(3, cached.themes.size());
        assertEquals(now[0], cached.savedAt);
    }

    @Test
    public void freshCache_isReturnedWithoutAnyNetworkRequest() throws Exception {
        putFreshData();
        loader().load(false, new Recorder()); // populates the cache

        now[0] += ONE_HOUR_MILLIS;
        responses.clear();
        requested.clear();
        Recorder listener = new Recorder();
        loader().load(false, listener);

        assertNull(listener.error);
        assertTrue(listener.lastDone);
        assertEquals(3, listener.lastThemes.size());
        assertTrue(requested.isEmpty());
    }

    @Test
    public void aCacheSixHoursOld_staysListedWhileTheListLoadsAgain_thenGivesWayToIt() throws Exception {
        putFreshData();
        loader().load(false, new Recorder()); // populates the cache

        now[0] += MarketplaceLoader.MAX_AGE_MILLIS;
        responses.put(Marketplace.manifestUrl(ONE), "[" + themeJson("One") + "," + themeJson("One B") + "]");
        requested.clear();
        Recorder listener = new Recorder();
        loader().load(false, listener);

        // The old list first, then no partial list over it, then the new one, as on a refresh.
        assertEquals(Arrays.asList("update [One, Three A, Three B]", "done [One, One B, Three A, Three B]"), listener.calls);
        assertEquals(Integer.valueOf(0), listener.requestsAt.get(0));
        assertTrue(requested.contains(Marketplace.SEARCH_URL + "1"));
        assertEquals(now[0], cached().savedAt);
        assertEquals(4, cached().themes.size());
    }

    @Test
    public void aRefreshGitHubRateLimits_keepsTheOldList_andSaysWhy() throws Exception {
        putFreshData();
        MarketplaceLoader loader = loader();
        loader.load(false, new Recorder()); // populates the cache

        now[0] += ONE_HOUR_MILLIS;
        responses.clear();
        responses.put(Marketplace.SEARCH_URL + "1", "RATE");
        Recorder listener = new Recorder();
        loader.load(true, listener);

        assertEquals(Arrays.asList("update [One, Three A, Three B]", "error " + MarketplaceLoader.RATE_LIMITED), listener.calls);
    }

    @Test
    public void noCacheAndRateLimitedSearch_reportsTheRateLimitMessage() {
        responses.put(Marketplace.BLACKLIST_URL, BLACKLIST);
        responses.put(Marketplace.SEARCH_URL + "1", "RATE");

        Recorder listener = new Recorder();
        loader().load(false, listener);

        assertEquals("GitHub's rate limit was reached. Try again in a few minutes.", listener.error);
        assertEquals(0, listener.themeCalls);
    }

    @Test
    public void missingBlacklist_stillLoadsThemes() throws Exception {
        // No BLACKLIST_URL response: the fetch throws, so nothing is blacklisted this time.
        responses.put(Marketplace.SEARCH_URL + "1", searchJson(3, Arrays.asList(ONE, TWO, THREE)));
        responses.put(Marketplace.manifestUrl(ONE), themeJson("One"));
        responses.put(Marketplace.manifestUrl(THREE), "[" + themeJson("Three A") + "," + themeJson("Three B") + "]");

        Recorder listener = new Recorder();
        loader().load(false, listener);

        assertNull(listener.error);
        assertTrue(listener.lastDone);
        assertEquals(3, listener.lastThemes.size());
        assertTrue(requested.contains(Marketplace.manifestUrl(TWO))); // not filtered without a blacklist
        assertEquals(3, cached().themes.size()); // a 404 is an answer, so the list is cached
    }

    @Test
    public void aBlacklistThatFailedToDownload_leavesTheListUncached() {
        putFreshData();
        responses.put(Marketplace.BLACKLIST_URL, "FAIL");

        Recorder listener = new Recorder();
        loader().load(false, listener);

        assertNull(listener.error);
        assertEquals(3, listener.lastThemes.size());
        assertTrue(requested.contains(Marketplace.manifestUrl(TWO))); // nothing was filtered
        assertFalse(cacheFile.exists());
    }

    @Test
    public void searchPaging_stopsOncePagesReachTheTotalCount() {
        List<Marketplace.Repo> repos = new ArrayList<>();
        for (int i = 0; i < 150; i++) {
            repos.add(new Marketplace.Repo("owner" + i, "repo" + i, "main",
                    "https://github.com/owner" + i + "/repo" + i, 150 - i));
        }
        responses.put(Marketplace.SEARCH_URL + "1", searchJson(150, repos.subList(0, 100)));
        responses.put(Marketplace.SEARCH_URL + "2", searchJson(150, repos.subList(100, 150)));

        Recorder listener = new Recorder();
        loader().load(false, listener);

        assertNull(listener.error);
        assertTrue(requested.contains(Marketplace.SEARCH_URL + "1"));
        assertTrue(requested.contains(Marketplace.SEARCH_URL + "2"));
        assertFalse(requested.contains(Marketplace.SEARCH_URL + "3"));
    }

    @Test
    public void searchPaging_countsArchivedRepositoriesTowardTheTotal() {
        String archived = "{\"full_name\":\"old/theme\",\"default_branch\":\"main\","
                + "\"html_url\":\"https://github.com/old/theme\",\"stargazers_count\":5,\"archived\":true}";
        responses.put(Marketplace.SEARCH_URL + "1", "{\"total_count\":2,\"items\":[" + repoJson(ONE) + "," + archived + "]}");
        responses.put(Marketplace.manifestUrl(ONE), themeJson("One"));

        Recorder listener = new Recorder();
        loader().load(false, listener);

        assertNull(listener.error);
        assertEquals(1, listener.lastThemes.size());
        assertFalse(requested.contains(Marketplace.SEARCH_URL + "2"));
        assertFalse(requested.contains("https://raw.githubusercontent.com/old/theme/main/manifest.json"));
    }

    @Test
    public void aRepositoryOnTwoSearchPages_isListedOnce() {
        // Stars changed between the two requests, so THREE moved from page 1 to page 2.
        responses.put(Marketplace.SEARCH_URL + "1", searchJson(3, Arrays.asList(ONE, THREE)));
        responses.put(Marketplace.SEARCH_URL + "2", searchJson(3, Arrays.asList(THREE)));
        responses.put(Marketplace.manifestUrl(ONE), themeJson("One"));
        responses.put(Marketplace.manifestUrl(THREE), themeJson("Three"));

        Recorder listener = new Recorder();
        loader().load(false, listener);

        assertNull(listener.error);
        assertEquals(2, listener.lastThemes.size());
        assertEquals(1, Collections.frequency(requested, Marketplace.manifestUrl(THREE)));
    }

    @Test
    public void aDeeplyNestedManifest_contributesNothing_andTheOtherRepositoryStillLoads() {
        char[] nested = new char[1_000_000];
        Arrays.fill(nested, '[');
        responses.put(Marketplace.SEARCH_URL + "1", searchJson(2, Arrays.asList(ONE, THREE)));
        responses.put(Marketplace.manifestUrl(ONE), new String(nested));
        responses.put(Marketplace.manifestUrl(THREE), themeJson("Three"));

        Recorder listener = new Recorder();
        loader().load(false, listener);

        assertNull(listener.error);
        assertTrue(listener.lastDone);
        assertEquals(1, listener.lastThemes.size());
        assertEquals("Three", listener.lastThemes.get(0).title);
    }

    @Test
    public void themesWithoutAColorSchemeSpotifyCanUse_areLeftOut_andTheListIsStillCached() throws Exception {
        responses.put(Marketplace.SEARCH_URL + "1", searchJson(1, Arrays.asList(ONE)));
        responses.put(Marketplace.manifestUrl(ONE), "[" + themeJson("Usable", "usable.ini") + "," + themeJson("Missing", "missing.ini")
                + "," + themeJson("Unusable", "unusable.ini") + "," + themeJson("Huge", "huge.ini") + ","
                + themeJson("No scheme", "empty.ini") + "]");
        responses.put(Marketplace.resolve("usable.ini", ONE, "main"), USABLE);
        responses.put(Marketplace.resolve("unusable.ini", ONE, "main"), "[turntable]\nmain = ${xrdb:color0}\n");
        responses.put(Marketplace.resolve("huge.ini", ONE, "main"), "HUGE");
        responses.put(Marketplace.resolve("empty.ini", ONE, "main"), "; only a comment\n");

        Recorder listener = new Recorder();
        loader().load(false, listener);

        assertNull(listener.error);
        assertEquals(Collections.singletonList("Usable"), titles(listener.lastThemes));
        assertEquals(Collections.singletonList("Usable"), titles(cached().themes)); // each is an answer
    }

    @Test
    public void aColorIniThatFailedToDownload_keepsItsTheme_butTheListIsNotCached() {
        responses.put(Marketplace.SEARCH_URL + "1", searchJson(2, Arrays.asList(ONE, THREE)));
        responses.put(Marketplace.manifestUrl(ONE), themeJson("One"));
        responses.put(Marketplace.manifestUrl(THREE), themeJson("Three"));
        responses.put(Marketplace.resolve("c.ini", ONE, "main"), "FAIL");
        responses.put(Marketplace.resolve("c.ini", THREE, "main"), "RATE");

        Recorder listener = new Recorder();
        loader().load(false, listener);

        assertNull(listener.error);
        assertEquals(Arrays.asList("One", "Three"), titles(listener.lastThemes)); // a tap tries them again
        assertFalse(cacheFile.exists());
    }

    @Test
    public void aMissingManifest_isStillCached_andSendsNoUpdate() throws Exception {
        responses.put(Marketplace.SEARCH_URL + "1", searchJson(2, Arrays.asList(ONE, THREE)));
        responses.put(Marketplace.manifestUrl(ONE), themeJson("One")); // THREE has no manifest: 404

        Recorder listener = new Recorder();
        loader().load(false, listener);

        assertEquals(2, listener.themeCalls); // One's update, then the final call; nothing for THREE
        assertEquals(1, cached().themes.size());
    }

    @Test
    public void aRefreshWithAFailedManifest_keepsTheOldList_andSaysItFailed() throws Exception {
        putFreshData();
        loader().load(false, new Recorder()); // populates the cache
        long savedAt = now[0];

        now[0] += ONE_HOUR_MILLIS;
        responses.put(Marketplace.manifestUrl(THREE), "FAIL");
        Recorder listener = new Recorder();
        loader().load(true, listener);

        // The cached list, not the one theme that arrived; no partial list showed over it.
        assertEquals(Arrays.asList("update [One, Three A, Three B]", "error " + MarketplaceLoader.REFRESH_FAILED), listener.calls);
        assertEquals(savedAt, cached().savedAt);
        assertEquals(3, cached().themes.size());
    }

    @Test
    public void aRefreshWhoseManifestsRunOutOfTime_keepsTheOldList_andSaysItFailed() throws Exception {
        putFreshData();
        loader().load(false, new Recorder()); // populates the cache

        now[0] += ONE_HOUR_MILLIS;
        Recorder listener = new Recorder();
        loader(new StoringExecutor(), 50, 50).load(true, listener);

        assertEquals(Arrays.asList("update [One, Three A, Three B]", "error " + MarketplaceLoader.REFRESH_FAILED), listener.calls);
    }

    @Test
    public void aRefreshThatComesUpShort_withoutACache_sendsNoShorterList_andSaysItFailed() {
        // The first list wasn't cached, because its blacklist failed.
        responses.put(Marketplace.BLACKLIST_URL, "FAIL");
        responses.put(Marketplace.SEARCH_URL + "1", searchJson(2, Arrays.asList(ONE)));
        responses.put(Marketplace.SEARCH_URL + "2", searchJson(2, Arrays.asList(THREE)));
        responses.put(Marketplace.manifestUrl(ONE), themeJson("One"));
        responses.put(Marketplace.manifestUrl(THREE), themeJson("Three"));
        Recorder first = new Recorder();
        loader().load(false, first);
        assertEquals("done [One, Three]", first.calls.get(first.calls.size() - 1));
        assertFalse(cacheFile.exists());

        // A refresh whose second search page is rate limited: the partial lists, which a page that shows a
        // list holds back, then the error, and no shorter list in that list's place.
        responses.put(Marketplace.BLACKLIST_URL, BLACKLIST);
        responses.put(Marketplace.SEARCH_URL + "2", "RATE");
        Recorder listener = new Recorder();
        loader().load(true, listener);
        assertEquals(Arrays.asList("update [One]", "error " + MarketplaceLoader.RATE_LIMITED), listener.calls);

        responses.put(Marketplace.SEARCH_URL + "2", "FAIL");
        listener = new Recorder();
        loader().load(true, listener);
        assertEquals(Arrays.asList("update [One]", "error " + MarketplaceLoader.REFRESH_FAILED), listener.calls);
        assertFalse(cacheFile.exists());
    }

    @Test
    public void everyManifestFailing_withoutACache_saysWhy() {
        responses.put(Marketplace.SEARCH_URL + "1", searchJson(2, Arrays.asList(ONE, THREE)));
        responses.put(Marketplace.manifestUrl(ONE), "RATE");
        responses.put(Marketplace.manifestUrl(THREE), "RATE");
        Recorder listener = new Recorder();
        loader().load(false, listener);
        assertEquals(Collections.singletonList("error " + MarketplaceLoader.RATE_LIMITED), listener.calls);

        responses.put(Marketplace.manifestUrl(ONE), "FAIL");
        responses.put(Marketplace.manifestUrl(THREE), "FAIL");
        listener = new Recorder();
        loader().load(false, listener);
        assertEquals(Collections.singletonList("error Couldn't load the Marketplace: Connection reset"), listener.calls);
        assertFalse(cacheFile.exists());
    }

    @Test
    public void manifestsStartWithTheFirstSearchPage_andTheChecksComeAfterTheManifests_topThemesFirst() {
        responses.put(Marketplace.BLACKLIST_URL, BLACKLIST);
        responses.put(Marketplace.SEARCH_URL + "1", searchJson(3, Arrays.asList(ONE, THREE)));
        responses.put(Marketplace.SEARCH_URL + "2", searchJson(3, Arrays.asList(FOUR)));
        responses.put(Marketplace.manifestUrl(ONE), themeJson("One"));
        responses.put(Marketplace.manifestUrl(THREE), themeJson("Three"));
        responses.put(Marketplace.manifestUrl(FOUR), themeJson("Four"));

        Recorder listener = new Recorder();
        loader().load(false, listener);

        assertEquals(Arrays.asList(Marketplace.BLACKLIST_URL, Marketplace.SEARCH_URL + "1",
                Marketplace.manifestUrl(ONE), Marketplace.manifestUrl(THREE), Marketplace.SEARCH_URL + "2",
                Marketplace.manifestUrl(FOUR), Marketplace.resolve("c.ini", ONE, "main"),
                Marketplace.resolve("c.ini", FOUR, "main"), Marketplace.resolve("c.ini", THREE, "main")), requested);
        // Each manifest's themes are listed as it arrives, by stars.
        assertEquals(Arrays.asList("update [One]", "update [One, Three]", "update [One, Four, Three]",
                "done [One, Four, Three]"), listener.calls);
    }

    @Test
    public void themesAreListedBeforeTheirChecks_andOneWithoutAUsableSchemeDropsOut() throws Exception {
        responses.put(Marketplace.SEARCH_URL + "1", searchJson(2, Arrays.asList(ONE, THREE)));
        responses.put(Marketplace.manifestUrl(ONE), "[" + themeJson("One") + "," + themeJson("One B", "b.ini") + "]");
        responses.put(Marketplace.manifestUrl(THREE), themeJson("Three"));
        responses.put(Marketplace.resolve("b.ini", ONE, "main"), "[turntable]\n");

        Recorder listener = new Recorder();
        loader().load(false, listener);

        assertEquals(Arrays.asList("update [One, One B]", "update [One, One B, Three]", "update [One, Three]",
                "done [One, Three]"), listener.calls);
        // One B was listed before its color.ini was read.
        int listedAfter = listener.requestsAt.get(0);
        assertFalse(requested.subList(0, listedAfter).contains(Marketplace.resolve("b.ini", ONE, "main")));
        assertEquals(Arrays.asList("One", "Three"), titles(cached().themes));
    }

    @Test
    public void theChecksHaveTheirOwnDeadline_andALateCheckSendsNothing() throws Exception {
        responses.put(Marketplace.SEARCH_URL + "1", searchJson(1, Arrays.asList(ONE)));
        responses.put(Marketplace.manifestUrl(ONE), themeJson("One"));
        responses.put(Marketplace.resolve("c.ini", ONE, "main"), "[turntable]\n");
        CountDownLatch started = new CountDownLatch(1);
        CountDownLatch release = new CountDownLatch(1);
        CountDownLatch finished = new CountDownLatch(2);
        Marketplace.Fetcher fetcher = fetcher();
        Marketplace.Fetcher slow = url -> {
            if (url.endsWith("/c.ini")) {
                started.countDown();
                try {
                    release.await();
                } catch (InterruptedException e) {
                    throw new IOException(e);
                }
            }
            return fetcher.get(url);
        };
        Executor threads = task -> new Thread(() -> {
            task.run();
            finished.countDown();
        }).start();

        Recorder listener = new Recorder();
        long begun = System.nanoTime();
        new MarketplaceLoader(slow, threads, cacheFile, () -> now[0], 60_000, 200).load(false, listener);
        long millis = (System.nanoTime() - begun) / 1_000_000;

        assertTrue("took " + millis + " ms", millis < 10_000); // the checks' deadline, not the manifests'
        assertTrue(started.await(5, TimeUnit.SECONDS));
        assertEquals(Arrays.asList("update [One]", "done [One]"), listener.calls); // unchecked, so still listed
        assertFalse(cacheFile.exists()); // and not cached
        release.countDown();
        assertTrue(finished.await(5, TimeUnit.SECONDS));
        assertEquals("no callback should follow the terminal one", 2, listener.calls.size());
    }

    @Test
    public void aManifestOverTheSizeCap_isLeftOut_andTheListIsStillCached() throws Exception {
        responses.put(Marketplace.SEARCH_URL + "1", searchJson(2, Arrays.asList(ONE, THREE)));
        responses.put(Marketplace.manifestUrl(ONE), "HUGE");
        responses.put(Marketplace.manifestUrl(THREE), themeJson("Three"));

        Recorder listener = new Recorder();
        loader().load(false, listener);

        assertNull(listener.error);
        assertEquals(1, listener.lastThemes.size());
        assertEquals(1, cached().themes.size());
        assertEquals("Three", cached().themes.get(0).title);
    }

    @Test
    public void anEmptyList_isNotCached() {
        responses.put(Marketplace.SEARCH_URL + "1", searchJson(0, Collections.emptyList()));

        Recorder listener = new Recorder();
        loader().load(false, listener);

        assertNull(listener.error);
        assertTrue(listener.lastDone);
        assertTrue(listener.lastThemes.isEmpty());
        assertFalse(cacheFile.exists());
    }

    @Test
    public void aManifestStillDownloadingAtTheTimeout_sendsNothingAfterTheLastCall() throws Exception {
        responses.put(Marketplace.SEARCH_URL + "1", searchJson(1, Arrays.asList(ONE)));
        responses.put(Marketplace.manifestUrl(ONE), themeJson("One"));
        CountDownLatch started = new CountDownLatch(1);
        CountDownLatch release = new CountDownLatch(1);
        CountDownLatch finished = new CountDownLatch(1);
        Marketplace.Fetcher fetcher = fetcher();
        Marketplace.Fetcher slow = url -> {
            if (url.equals(Marketplace.manifestUrl(ONE))) {
                started.countDown();
                try {
                    release.await();
                } catch (InterruptedException e) {
                    throw new IOException(e);
                }
            }
            return fetcher.get(url);
        };
        Executor thread = task -> new Thread(() -> {
            task.run();
            finished.countDown();
        }).start();

        Recorder listener = new Recorder();
        new MarketplaceLoader(slow, thread, cacheFile, () -> now[0], 200, 200).load(false, listener);
        assertTrue(started.await(5, TimeUnit.SECONDS)); // it began before the load gave up on it
        assertEquals(Collections.singletonList("error " + TOO_LONG), listener.calls);
        release.countDown();
        assertTrue(finished.await(5, TimeUnit.SECONDS));

        assertEquals("no callback should follow the terminal one", 1, listener.calls.size());
    }

    @Test
    public void aManifestThatArrivesAfterItsDeadline_listsNothingUnchecked() throws Exception {
        responses.put(Marketplace.SEARCH_URL + "1", searchJson(2, Arrays.asList(ONE, THREE)));
        responses.put(Marketplace.manifestUrl(ONE), themeJson("One"));
        responses.put(Marketplace.manifestUrl(THREE), themeJson("Three"));
        CountDownLatch lateStarted = new CountDownLatch(1);
        CountDownLatch lateManifest = new CountDownLatch(1);
        CountDownLatch checking = new CountDownLatch(1);
        CountDownLatch checkMayEnd = new CountDownLatch(1);
        CountDownLatch finished = new CountDownLatch(3);
        Thread[] late = new Thread[1];
        Marketplace.Fetcher fetcher = fetcher();
        Marketplace.Fetcher slow = url -> {
            try {
                if (url.equals(Marketplace.manifestUrl(THREE))) {
                    late[0] = Thread.currentThread();
                    lateStarted.countDown();
                    lateManifest.await();
                }
                if (url.equals(Marketplace.resolve("c.ini", ONE, "main"))) {
                    checking.countDown();
                    checkMayEnd.await();
                }
            } catch (InterruptedException e) {
                throw new IOException(e);
            }
            return fetcher.get(url);
        };
        Executor threads = task -> new Thread(() -> {
            task.run();
            finished.countDown();
        }).start();
        Recorder listener = new Recorder();
        Thread load = new Thread(() -> new MarketplaceLoader(slow, threads, cacheFile, () -> now[0], 200, 60_000)
                .load(false, listener));
        load.start();

        // THREE's manifest misses its deadline and is done while One is still being checked.
        assertTrue(lateStarted.await(5, TimeUnit.SECONDS)); // it began before its deadline
        assertTrue(checking.await(5, TimeUnit.SECONDS));
        lateManifest.countDown();
        late[0].join(5000);
        checkMayEnd.countDown();
        load.join(5000);
        assertTrue(finished.await(5, TimeUnit.SECONDS));

        assertEquals(Arrays.asList("update [One]", "done [One]"), listener.calls);
        assertFalse(cacheFile.exists());
    }

    @Test
    public void manifestsTimeout_withoutACache_saysGitHubTookTooLong_andCachesNothing() throws Exception {
        responses.put(Marketplace.SEARCH_URL + "1", searchJson(2, Arrays.asList(ONE, THREE)));
        responses.put(Marketplace.manifestUrl(ONE), themeJson("One"));
        responses.put(Marketplace.manifestUrl(THREE), themeJson("Three"));

        StoringExecutor executor = new StoringExecutor();
        Recorder listener = new Recorder();
        loader(executor, 50, 50).load(false, listener);

        assertEquals(Collections.singletonList("error " + TOO_LONG), listener.calls);
        assertFalse("the timed-out run must not cache a partial list", cacheFile.exists());

        for (Runnable task : executor.tasks) {
            task.run();
        }

        assertEquals("no callback should follow the terminal one", 1, listener.calls.size());
        assertFalse("a task that starts after the load ended downloads nothing", requested.contains(Marketplace.manifestUrl(ONE)));
    }
}
