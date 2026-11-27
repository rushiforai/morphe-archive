package app.ayham.extension.music.addons;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.io.IOException;
import java.net.SocketTimeoutException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;

import app.ayham.extension.music.automix.Json;

/**
 * The client against fake addons (no network, a fake clock): the extension's
 * scripts/addon_client_tests.mjs, plus the phone's own rules (one browser User-Agent, https only).
 * Addons live under https://h.example/{name}/tok3n-{name}/...
 */
public class AddonClientTest {
    interface Route {
        AddonClient.Response answer(String kind, String id, String query);
    }

    static final class Hit {
        final String name, kind, id, query;
        final Map<String, String> headers;
        final int timeoutMs;

        Hit(String name, String kind, String id, String query, Map<String, String> headers, int timeoutMs) {
            this.name = name;
            this.kind = kind;
            this.id = id;
            this.query = query;
            this.headers = headers;
            this.timeoutMs = timeoutMs;
        }
    }

    private long now = 1_000_000;
    private final List<Long> sleeps = new ArrayList<>();
    // the race logs from its lane threads at once: a plain ArrayList could throw there, which ended a
    // lane and gave "no addon has it" (raceGoesOnPastARefusal, 1 run in 5 under load, 2026-11-24)
    private final List<String> logs = Collections.synchronizedList(new ArrayList<String>());
    private final List<Hit> hits = Collections.synchronizedList(new ArrayList<Hit>());
    private final Map<String, Map<String, Route>> addons = new HashMap<>();
    private final Map<String, Long> fileBytes = new HashMap<>();

    private final AddonClient.Transport transport = r -> {
        String rest = r.url.substring("https://h.example/".length());
        String query = "";
        int q = rest.indexOf('?');
        if (q >= 0) {
            query = rest.substring(q);
            rest = rest.substring(0, q);
        }
        String[] parts = rest.split("/", -1);
        String name = parts[0], kind = parts.length > 2 ? parts[2] : "", id = parts.length > 3 ? parts[3] : null;
        hits.add(new Hit(name, kind, id, query, new LinkedHashMap<>(r.headers), r.timeoutMs));
        if (kind.equals("file")) {
            Map<String, String> h = new HashMap<>();
            Long size = fileBytes.get(id);
            h.put("content-range", "bytes 0-0/" + (size != null ? size : 30_000_000L));
            h.put("content-length", "1");
            return new AddonClient.Response(206, h, "x");
        }
        Map<String, Route> b = addons.containsKey(name) ? addons.get(name) : Collections.<String, Route>emptyMap();
        Route route = b.get(kind);
        if (route != null) return route.answer(kind, id, query);
        if (kind.equals("manifest.json")) return json(200, "{\"id\":\"mock." + name + "\",\"name\":\"Mock " + name + "\",\"version\":\"1\",\"resources\":[\"search\",\"stream\"],\"settings\":[]}");
        return json(404, "{\"detail\":\"nope\"}");
    };

    private AddonClient client() {
        return new AddonClient(transport, () -> now, ms -> {
            sleeps.add(ms);
            now += ms;
        }, logs::add);
    }

    static AddonClient.Response json(int status, String body) {
        return new AddonClient.Response(status, new HashMap<String, String>(), body);
    }

    static AddonClient.Response json(int status, String body, String retryAfter) {
        Map<String, String> h = new HashMap<>();
        h.put("retry-after", retryAfter);
        return new AddonClient.Response(status, h, body);
    }

    static String base(String name) {
        return "https://h.example/" + name + "/tok3n-" + name;
    }

    static String fileUrl(String name, String id) {
        return base(name) + "/file/" + id;
    }

    static String row(String id, String extra) {
        return "{\"id\":\"" + id + "\",\"title\":\"Blinding Lights\",\"artist\":\"The Weeknd\",\"duration\":200,\"album\":\"After Hours\"" + extra + "}";
    }

    static String tracks(String... rows) {
        return "{\"tracks\":[" + String.join(",", rows) + "]}";
    }

    static TrackMatcher.Target song() {
        TrackMatcher.Target t = new TrackMatcher.Target();
        t.title = "Blinding Lights";
        t.artist = "The Weeknd";
        t.durationSec = 200.0;
        t.album = "After Hours";
        return t;
    }

    private void addon(String name, String kind, Route r) {
        if (!addons.containsKey(name)) addons.put(name, new HashMap<String, Route>());
        addons.get(name).put(kind, r);
    }

    private List<Hit> hitsOf(String name, String kind) {
        List<Hit> out = new ArrayList<>();
        for (Hit h : hits) if (h.name.equals(name) && (kind == null || h.kind.equals(kind))) out.add(h);
        return out;
    }

    private static List<AddonClient.Addon> list(String... names) {
        List<AddonClient.Addon> out = new ArrayList<>();
        for (String n : names) out.add(new AddonClient.Addon(base(n)));
        return out;
    }

    private static String kind(Runnable r) {
        try {
            r.run();
            return "ok";
        } catch (AddonError e) {
            return e.kind;
        }
    }

    // ---- request shape (§1) ----

    @Test
    public void searchSendsSettingsQualityTitleArtistQAndOnlyTwoHeaders() {
        addon("params", "manifest.json", (k, id, q) -> json(200, "{\"id\":\"p\",\"name\":\"P\",\"resources\":[\"search\",\"stream\"],\"settings\":["
                + "{\"key\":\"region\",\"default\":\"eu\"},{\"key\":\"atmos\",\"default\":true},"
                + "{\"key\":\"quality\",\"default\":\"hires\",\"options\":[{\"value\":\"max\",\"label\":\"MAX\"},{\"value\":\"hires\",\"label\":\"HiRes\"},{\"value\":\"high\",\"label\":\"AAC (320kbps)\"}]}]}"));
        addon("params", "search", (k, id, q) -> json(200, tracks(row("a", ""))));
        AddonClient c = client();
        Protocol.Manifest man = c.manifest(base("params"));
        AddonClient.Addon a = new AddonClient.Addon(base("params"));
        a.tier = Pick.LOSSLESS;
        c.search(a, song(), "Blinding Lights The Weeknd", man);
        Hit h = hitsOf("params", "search").get(0);
        assertEquals("?region=eu&atmos=false&quality=max&title=Blinding%20Lights&artist=The%20Weeknd&q=Blinding%20Lights%20The%20Weeknd", h.query);
        assertEquals(Arrays.asList("Accept", "User-Agent"), new ArrayList<>(h.headers.keySet()));
        assertEquals(Protocol.USER_AGENT, h.headers.get("User-Agent"));
        assertEquals("application/json", h.headers.get("Accept"));
        assertEquals(45000, h.timeoutMs);
    }

    // ---- caching (§6) ----

    @Test
    public void searchesAndManifestsAreCachedTenMinutes() {
        addon("plain", "search", (k, id, q) -> json(200, tracks(row("a", ""))));
        AddonClient c = client();
        Protocol.Manifest man = c.manifest(base("plain"));
        AddonClient.Addon a = new AddonClient.Addon(base("plain"));
        for (int i = 0; i < 3; i++) c.search(a, song(), "shared query", man);
        assertEquals(1, hitsOf("plain", "search").size());
        c.manifest(base("plain"));
        assertEquals(1, hitsOf("plain", "manifest.json").size());
        now += 10 * 60_000 + 1;
        c.search(a, song(), "shared query", man);
        c.manifest(base("plain"));
        assertEquals(2, hitsOf("plain", "search").size());
        assertEquals(2, hitsOf("plain", "manifest.json").size());
    }

    // ---- statuses (§5) ----

    @Test
    public void a429WaitsRetryAfterThenAnswers() {
        final int[] n = {0};
        addon("busy", "search", (k, id, q) -> ++n[0] <= 1 ? json(429, "{}", "0.5") : json(200, tracks(row("a", ""))));
        AddonClient c = client();
        List<Object> rows = c.search(new AddonClient.Addon(base("busy")), song(), "q", c.manifest(base("busy")));
        assertEquals(1, rows.size());
        assertEquals(Collections.singletonList(500L), sleeps);
    }

    @Test
    public void threeTimes429IsDownAfterTwoRetries() {
        addon("flooded", "search", (k, id, q) -> json(429, "{}"));
        AddonClient c = client();
        Protocol.Manifest man = c.manifest(base("flooded"));
        try {
            c.search(new AddonClient.Addon(base("flooded")), song(), "q", man);
            throw new AssertionError("answered");
        } catch (AddonError e) {
            assertEquals("down", e.kind);
            assertEquals("rate limited (429)", e.getMessage());
        }
        assertEquals(3, hitsOf("flooded", "search").size());
        assertEquals(Arrays.asList(500L, 1000L), sleeps);   // 500 ms << attempt without Retry-After
    }

    @Test
    public void statusKinds() {
        addon("e404", "search", (k, id, q) -> json(404, "{}"));
        addon("e500", "search", (k, id, q) -> json(503, "{}"));
        addon("e401", "search", (k, id, q) -> json(401, "{}"));
        addon("blank", "search", (k, id, q) -> json(200, "  "));
        addon("errfield", "search", (k, id, q) -> json(200, "{\"error\":\"quota\"}"));
        addon("notjson", "search", (k, id, q) -> json(200, "<html>"));
        String[][] want = {{"e404", "miss"}, {"e500", "down"}, {"e401", "error"}, {"blank", "error"}, {"errfield", "miss"}, {"notjson", "error"}};
        for (final String[] w : want) {
            final AddonClient c = client();
            final Protocol.Manifest man = c.manifest(base(w[0]));
            assertEquals(w[0], w[1], kind(() -> c.search(new AddonClient.Addon(base(w[0])), song(), "q", man)));
        }
        addon("nomanifest", "manifest.json", (k, id, q) -> json(404, "{}"));
        assertEquals("a manifest 404 is an error", "error", kind(() -> client().manifest(base("nomanifest"))));
        AddonClient.Transport slow = r -> {
            throw new SocketTimeoutException("Read timed out");
        };
        AddonClient c = new AddonClient(slow, () -> now, ms -> { }, null);
        try {
            c.manifest(base("x"));
            throw new AssertionError("answered");
        } catch (AddonError e) {
            assertEquals("down", e.kind);
            assertEquals("timed out", e.getMessage());
        }
    }

    // ---- discovery (§2) ----

    @Test
    public void discovery() {
        AddonClient.Discovered d = client().discover(base("plain") + "/manifest.json");
        assertEquals(base("plain"), d.base);
        assertEquals("Mock plain", d.manifest.name);
        assertEquals("mock.plain", client().discover(base("plain")).manifest.id);

        addon("nomanifest", "manifest.json", (k, id, q) -> json(404, "{}"));
        addon("nomanifest", "search", (k, id, q) -> json(200, "{\"tracks\":[]}"));
        Protocol.Manifest stand = client().discover(base("nomanifest")).manifest;
        assertEquals(Arrays.asList("search", "stream"), stand.resources);
        assertEquals("h.example", stand.name);

        addon("refuses", "manifest.json", (k, id, q) -> json(403, "{\"detail\":\"This app is not supported by Mock.\"}"));
        try {
            client().discover(base("refuses"));
            throw new AssertionError("found");
        } catch (AddonError e) {
            assertEquals("refused (403): This app is not supported by Mock.", e.getMessage());
        }
    }

    // ---- the whole path ----

    /** The race (protocol.md 8.1.4): a slow addon ranked first loses to a quick one. */
    @Test
    public void raceTakesTheFirstAnswerReady() {
        String rows = tracks(row("fine", ""));
        good("quick", rows);
        addon("slow", "search", (k, id, q) -> {
            try {
                Thread.sleep(400);
            } catch (InterruptedException ignored) {
            }
            return json(200, rows);
        });
        addon("slow", "stream", (k, id, q) -> json(200, "{\"url\":\"" + fileUrl("slow", id) + "\",\"format\":\"flac\",\"codec\":\"flac\"}"));
        AddonClient.Opened got = client().race(song(), list("slow", "quick"), null);
        assertNull(got.none);
        assertEquals("Mock quick", got.addon.name);
    }

    /** A refused answer (the fit) sends the race on to the other lane's; tried in rank order. */
    @Test
    public void raceGoesOnPastARefusal() {
        String rows = tracks(row("fine", ""));
        good("one", rows);
        good("two", rows);
        AddonClient.Options opt = new AddonClient.Options();
        final List<String> checked = Collections.synchronizedList(new ArrayList<String>());
        opt.check = o -> {
            checked.add(o.addon.name);
            return checked.size() == 1 ? "does not fit" : null;
        };
        AddonClient.Opened got = client().race(song(), list("one", "two"), opt);
        assertNull(got.none);
        assertEquals(2, checked.size());
        assertFalse(checked.get(0).equals(got.addon.name));
        assertEquals(1, got.tried.size());
        assertEquals("does not fit", got.tried.get(0).why);
    }

    /** protocol.md 8.1.4: a row refused for the song is not opened again (no second /stream; extension audit M13). */
    @Test
    public void aRowRefusedBeforeGetsNoSecondStream() {
        // both mocks on one host with the same row id: refusing one's row doesn't pass over the other's
        String rows = tracks(row("fine", ""));
        good("one", rows);
        good("two", rows);
        final List<String> refused = Collections.synchronizedList(new ArrayList<String>());
        AddonClient.Options opt = new AddonClient.Options();
        opt.check = o -> {
            if (!o.addon.name.equals("Mock one")) return null;
            refused.add(o.addon.base + "\t" + o.row.id);
            return "does not fit";
        };
        AddonClient.Opened first = client().race(song(), list("one"), opt);
        assertEquals("does not fit", first.tried.get(0).why);
        assertEquals(1, hitsOf("one", "stream").size());
        // the pass: the refused row is passed over before its /stream, the other addon wins
        opt.refusedBefore = refused::contains;
        AddonClient.Opened again = client().race(song(), list("one", "two"), opt);
        assertEquals("Mock two", again.addon.name);
        assertEquals(1, hitsOf("one", "stream").size());
    }

    /** protocol.md 8.1.4: a lane still searching when another wins sends no /stream (each could add the song to a debrid account). */
    @Test
    public void aLoserStillSearchingSendsNoStream() throws InterruptedException {
        String rows = tracks(row("fine", ""));
        good("quick", rows);
        good("slow", rows);
        addon("slow", "search", (k, id, q) -> {
            try {
                Thread.sleep(300);
            } catch (InterruptedException ignored) {
            }
            return json(200, rows);
        });
        AddonClient.Opened got = client().race(song(), list("slow", "quick"), null);
        assertEquals("Mock quick", got.addon.name);
        Thread.sleep(700);   // the loser's search lands after the win
        assertEquals(1, hitsOf("slow", "search").size());
        assertEquals(0, hitsOf("slow", "stream").size());
    }

    /** A /stream already sent runs out, but the race won meanwhile: no probe of its file. */
    @Test
    public void aLoserWhoseStreamRunsOutSendsNoProbe() throws InterruptedException {
        String rows = tracks(row("fine", ""));
        good("quick", rows);
        addon("slow", "search", (k, id, q) -> json(200, rows));
        addon("slow", "stream", (k, id, q) -> {
            try {
                Thread.sleep(300);
            } catch (InterruptedException ignored) {
            }
            return json(200, "{\"url\":\"" + fileUrl("slow", id) + "\",\"format\":\"flac\",\"codec\":\"flac\"}");
        });
        AddonClient.Opened got = client().race(song(), list("slow", "quick"), null);
        assertEquals("Mock quick", got.addon.name);
        Thread.sleep(700);
        assertEquals(1, hitsOf("slow", "stream").size());
        assertEquals(0, hitsOf("slow", "file").size());
    }

    /** The phone's race is decided by the check (the window fit, ~3 s): a lane whose search lands meanwhile waits, and sends no /stream once the answer is taken. */
    @Test
    public void aLaneWaitsOutTheCheckBeforeItsStream() throws InterruptedException {
        String rows = tracks(row("fine", ""));
        good("quick", rows);
        good("slow", rows);
        addon("slow", "search", (k, id, q) -> {
            sleep(150);
            return json(200, rows);
        });
        AddonClient.Options opt = new AddonClient.Options();
        opt.check = o -> {
            sleep(500);
            return null;
        };
        AddonClient.Opened got = client().race(song(), list("slow", "quick"), opt);
        assertEquals("Mock quick", got.addon.name);
        sleep(300);
        assertEquals(0, hitsOf("slow", "stream").size());
    }

    /** A /stream that returns while another answer is checked: no probe once that answer is taken. */
    @Test
    public void aLaneWaitsOutTheCheckBeforeItsProbe() throws InterruptedException {
        String rows = tracks(row("fine", ""));
        good("quick", rows);
        addon("slow", "search", (k, id, q) -> json(200, rows));
        addon("slow", "stream", (k, id, q) -> {
            sleep(150);
            return json(200, "{\"url\":\"" + fileUrl("slow", id) + "\",\"format\":\"flac\",\"codec\":\"flac\"}");
        });
        AddonClient.Options opt = new AddonClient.Options();
        opt.check = o -> {
            sleep(500);
            return null;
        };
        AddonClient.Opened got = client().race(song(), list("slow", "quick"), opt);
        assertEquals("Mock quick", got.addon.name);
        sleep(300);
        assertEquals(0, hitsOf("slow", "file").size());
    }

    private static void sleep(long ms) {
        try {
            Thread.sleep(ms);
        } catch (InterruptedException ignored) {
        }
    }

    /** No lane has it: every lane's misses, in rank order. */
    @Test
    public void raceWithNoAnswerListsEveryLane() {
        addon("a", "search", (k, id, q) -> json(200, tracks()));
        addon("b", "manifest.json", (k, id, q) -> json(500, "{}"));
        AddonClient.Opened got = client().race(song(), list("a", "b"), null);
        assertEquals("no addon has it", got.none);
        assertEquals(2, got.tried.size());
        assertEquals("no match", got.tried.get(0).why);
        assertEquals("server error (500)", got.tried.get(1).why);
    }

    private void good(String name, String rowsJson) {
        addon(name, "search", (k, id, q) -> json(200, rowsJson));
        addon(name, "stream", (k, id, q) -> {
            if (id.equals("hls")) return json(200, "{\"url\":\"https://cdn/x.m3u8\",\"format\":\"aac\"}");
            if (id.equals("plain")) return json(200, "{\"url\":\"http://cdn/x.flac\",\"format\":\"flac\"}");
            if (id.equals("atmosstream")) return json(200, "{\"url\":\"" + fileUrl("good", id) + "\",\"codec\":\"eac3_joc\"}");
            return json(200, "{\"url\":\"" + fileUrl("good", id) + "\",\"format\":\"flac\",\"quality\":\"Hi-Res\",\"codec\":\"flac\"}");
        });
    }

    /** protocol.md 8.1.5: an HLS row opens (no longer "not played yet"); its playlist link gets no byte probe. */
    @Test
    public void anHlsRowOpensWithoutAProbe() {
        good("good", tracks(row("hls", "")));
        AddonClient.Opened got = client().resolve(song(), list("good"), null);
        assertNull(got.none);
        assertEquals("hls", got.row.id);
        assertEquals("hls", got.stream.transport);
        for (Hit h : hits) assertFalse(h.kind, "bytes=0-0".equals(h.headers.get("Range")));
    }

    @Test
    public void resolvePassesOverADownAddonAndRefusesBadRows() {
        addon("down", "manifest.json", (k, id, q) -> json(500, "{}"));
        good("good", tracks(row("atmos", ",\"isAtmosOnly\":true"), row("cut", ""), row("plain", ""), row("atmosstream", ""), row("fine", "")));
        fileBytes.put("cut", 700_000L);
        AddonClient.Opened got = client().resolve(song(), list("down", "good"), null);
        assertEquals("server error (500)", got.tried.get(0).why);
        List<String> rest = new ArrayList<>();
        for (AddonClient.Tried t : got.tried.subList(1, got.tried.size())) rest.add(t.row + ": " + t.why);
        assertEquals(Arrays.asList("cut: file holds at most 28 s", "plain: not https", "atmosstream: atmos"), rest);
        assertEquals("no addon has it", got.none);
    }

    @Test
    public void resolveFindsItAndNeverShowsTheToken() {
        addon("down", "manifest.json", (k, id, q) -> json(500, "{}"));
        good("good2", tracks(row("atmos", ",\"isAtmos\":true"), row("fine", "")));
        AddonClient c = client();
        AddonClient.Opened got = c.resolve(song(), list("down", "good2"), null);
        assertNull(got.none);
        assertEquals("h.example", got.addon.host);
        assertEquals("fine", got.row.id);
        assertEquals("flac", got.stream.codec);
        assertFalse(logs.isEmpty());
        StringBuilder seen = new StringBuilder(String.join("\n", logs));
        for (AddonClient.Tried t : got.tried) seen.append(t.addon).append(t.why);
        seen.append(c.health().keySet());
        for (AddonClient.Health h : c.health().values()) seen.append(h.last);
        assertFalse(seen.toString(), seen.toString().contains("tok3n"));
        Hit probe = hitsOf("good", "file").get(hitsOf("good", "file").size() - 1);
        assertEquals("bytes=0-0", probe.headers.get("Range"));
        assertEquals("identity", probe.headers.get("Accept-Encoding"));
        assertEquals(Protocol.USER_AGENT, probe.headers.get("User-Agent"));
        assertEquals(4000, probe.timeoutMs);
    }

    /** The opened row keeps what it was asked at: its kept file's key (StreamCache.rowKey) and a new link (streamAgain) use it. */
    @Test
    public void anOpenedRowKeepsTheTierAndQualityAsked() {
        good("tq", tracks(row("fine", "")));
        List<AddonClient.Addon> l = list("tq");
        l.get(0).quality = "max";
        AddonClient.Opened got = client().resolve(song(), l, null);
        assertNull(got.none);
        assertEquals(Pick.LOSSLESS, got.addon.tier);
        assertEquals("max", got.addon.quality);
        AddonClient.Options hiRes = new AddonClient.Options();
        hiRes.tier = Pick.HIRES;
        assertEquals(Pick.HIRES, client().resolve(song(), list("tq"), hiRes).addon.tier);
    }

    @Test
    public void threeFailuresPutAnAddonToRest() {
        addon("down", "manifest.json", (k, id, q) -> json(500, "{}"));
        good("good2", tracks(row("fine", "")));
        AddonClient c = client();
        for (int i = 0; i < 3; i++) c.resolve(song(), list("down"), null);
        int n = hitsOf("down", null).size();
        AddonClient.Opened got = c.resolve(song(), list("down", "good2"), null);
        assertEquals("resting after failures", got.tried.get(0).why);
        assertEquals(n, hitsOf("down", null).size());
        now += 2 * 60_000 + 1;
        c.resolve(song(), list("down"), null);
        assertEquals("asked again after its rest", n + 1, hitsOf("down", null).size());
    }

    @Test
    public void aStream404FallsBackToTheRowsStreamUrl() {
        addon("withfallback", "search", (k, id, q) -> json(200, tracks(row("a", ",\"streamURL\":\"" + fileUrl("withfallback", "a") + "\""))));
        addon("withfallback", "stream", (k, id, q) -> json(404, "{}"));
        AddonClient.Opened got = client().resolve(song(), list("withfallback"), null);
        assertEquals(fileUrl("withfallback", "a"), got.stream.url);
    }

    // ---- §4a stream limits, the look-ahead, the stream's own headers ----

    @Test
    public void lookAheadIsSearchOnlyAndStreamsAreLimited() {
        addon("limited", "search", (k, id, q) -> json(200, tracks(row("a", ""))));
        addon("limited", "stream", (k, id, q) -> json(200, "{\"url\":\"" + fileUrl("limited", id)
                + "\",\"format\":\"flac\",\"codec\":\"flac\",\"headers\":{\"X-Token\":\"abc\",\"User-Agent\":\"BitChord\",\"bad header\":\"x\",\"obj\":{}}}"));
        AddonClient c = client();
        Protocol.Manifest man = c.manifest(base("limited"));
        AddonClient.FindResult f = c.find(song(), list("limited"), null);
        assertEquals(1, f.found.size());
        assertEquals("a", f.found.get(0).rows.get(0).id);
        assertEquals("find: no /stream call", 0, hitsOf("limited", "stream").size());
        assertEquals("h.example", f.found.get(0).addon.host);

        AddonClient.Opened got = c.open(f.found, song(), null, null);
        assertEquals("a", got.row.id);
        assertEquals(1, hitsOf("limited", "stream").size());
        Map<String, String> want = new LinkedHashMap<>();
        want.put("X-Token", "abc");
        assertEquals("the addon's User-Agent is dropped when read", want, got.stream.headers);
        Hit probe = hitsOf("limited", "file").get(0);
        assertEquals("abc", probe.headers.get("X-Token"));
        assertEquals("our agent replaces the addon's", Protocol.USER_AGENT, probe.headers.get("User-Agent"));
        assertEquals("bytes=0-0", probe.headers.get("Range"));
        assertEquals("identity", probe.headers.get("Accept-Encoding"));

        final AddonClient.Addon a = new AddonClient.Addon(base("limited"));
        List<String> out = new ArrayList<>();
        for (final String id : new String[]{"b", "c", "d", "e", "f"}) out.add(kind(() -> c.stream(a, row(id), man)));
        assertEquals("5 a minute, the first above counts", Arrays.asList("ok", "ok", "ok", "ok", "limit"), out);
        assertEquals("a cached answer costs nothing", "ok", kind(() -> c.stream(a, row("b"), man)));
        assertTrue(c.streamWait(a, man) > 0);
        now += 61_000;
        assertEquals("a minute later, free again", "ok", kind(() -> c.stream(a, row("g"), man)));
        assertEquals(0, c.health().get("h.example").fails);
    }

    @Test
    public void a429OnStreamIsNotRetriedAndTeachesTheCount() {
        final int[] n = {0};
        addon("streams429", "stream", (k, id, q) -> ++n[0] >= 3 ? json(429, "{}", "30") : json(200, "{\"url\":\"" + fileUrl("streams429", id) + "\",\"codec\":\"flac\"}"));
        final AddonClient c = client();
        final Protocol.Manifest man = c.manifest(base("streams429"));
        final AddonClient.Addon a = new AddonClient.Addon(base("streams429"));
        List<String> r = new ArrayList<>();
        for (String id : new String[]{"a", "b", "c"}) {
            try {
                c.stream(a, row(id), man);
                r.add("ok");
            } catch (AddonError e) {
                r.add(e.getMessage());
            }
        }
        assertEquals(Arrays.asList("ok", "ok", "stream limit (429), 2/min from now on"), r);
        assertEquals(3, hitsOf("streams429", "stream").size());
        assertTrue(sleeps.isEmpty());
        assertEquals("closed until Retry-After", 30_000, c.streamWait(a, man));
        now += 31_000;
        assertEquals("limit", kind(() -> c.stream(a, row("d"), man)));
        assertEquals("the learnt 2 a minute holds", "limit", kind(() -> c.stream(a, row("e"), man)));
        assertEquals(3, hitsOf("streams429", "stream").size());
    }

    @Test
    public void theManifestsOwnLimits() {
        addon("ownlimits", "manifest.json", (k, id, q) -> json(200,
                "{\"id\":\"o\",\"name\":\"O\",\"resources\":[\"search\",\"stream\"],\"limits\":{\"streamsPerMinute\":30,\"uncachedPerHour\":2,\"cachedMarker\":\"fromCache\"}}"));
        addon("ownlimits", "stream", (k, id, q) -> json(200, "{\"url\":\"" + fileUrl("ownlimits", id) + "\",\"codec\":\"flac\",\"fromCache\":" + id.startsWith("c") + "}"));
        final AddonClient c = client();
        final Protocol.Manifest man = c.manifest(base("ownlimits"));
        assertEquals(30, man.limits.streamsPerMinute);
        assertEquals(2, man.limits.uncachedPerHour);
        assertEquals("fromCache", man.limits.cachedMarker);
        final AddonClient.Addon a = new AddonClient.Addon(base("ownlimits"));
        List<String> r = new ArrayList<>();
        for (final String id : new String[]{"u1", "c1", "c2", "u2", "u3"}) r.add(kind(() -> c.stream(a, row(id), man)));
        assertEquals(Arrays.asList("ok", "ok", "ok", "ok", "limit"), r);
    }

    @Test
    public void bitchordAuthIsUnsupportedNotAFailure() {
        addon("official", "manifest.json", (k, id, q) -> json(200, "{\"id\":\"x\",\"name\":\"X\",\"resources\":[\"search\",\"stream\"],\"bitchordAuth\":true}"));
        try {
            client().discover(base("official"));
            throw new AssertionError("found");
        } catch (AddonError e) {
            assertEquals(Protocol.NEEDS_OFFICIAL, e.getMessage());
        }
        AddonClient c = client();
        int n0 = hitsOf("official", null).size();
        c.resolve(song(), list("official"), null);
        AddonClient.Opened got = c.resolve(song(), list("official"), null);
        assertEquals(Protocol.NEEDS_OFFICIAL, got.tried.get(0).why);
        assertEquals("manifest cached, nothing else asked", n0 + 1, hitsOf("official", null).size());
        assertNull(c.health().get("h.example"));
    }

    @Test
    public void allowDownloadsZeroBlocksDownloadsOnly() {
        addon("nodl", "manifest.json", (k, id, q) -> json(200, "{\"id\":\"n\",\"name\":\"N\",\"resources\":[\"search\",\"stream\"],\"allowDownloads\":0}"));
        good("nodl", tracks(row("fine", "")));
        AddonClient c = client();
        AddonClient.Options dl = new AddonClient.Options();
        dl.forDownload = true;
        AddonClient.FindResult f = c.find(song(), list("nodl"), dl);
        assertTrue(f.found.isEmpty());
        assertEquals("no downloads", f.tried.get(0).why);
        assertEquals(0, hitsOf("nodl", "search").size());
        assertEquals("playback may still use it", 1, c.find(song(), list("nodl"), null).found.size());
    }

    @Test
    public void downloadsRefuseLossyAt256OrUnder() {
        addon("lossy", "search", (k, id, q) -> json(200, tracks(row("a", ""))));
        addon("lossy", "stream", (k, id, q) -> json(200, "{\"url\":\"" + fileUrl("lossy", id) + "\",\"format\":\"AAC\",\"bitrate\":256}"));
        AddonClient.Options dl = new AddonClient.Options();
        dl.forDownload = true;
        AddonClient.Opened got = client().resolve(song(), list("lossy"), dl);
        assertEquals("no addon has it", got.none);
        assertEquals("lossy at 256 kbps or under", got.tried.get(0).why);
    }

    @Test
    public void plainHttpIsRefusedAndNothingIsSent() {
        final AddonClient c = client();
        assertEquals("error", kind(() -> c.manifest("http://localhost:8080/tok")));
        assertEquals("error", kind(() -> c.discover("http://127.0.0.1:9/tok/manifest.json")));
        assertEquals("error", kind(() -> c.manifest("http://h.example/plain/tok3n-plain")));
        assertTrue(hits.isEmpty());
        // a stream link that isn't https is passed over
        addon("cleartext", "search", (k, id, q) -> json(200, tracks(row("a", ""))));
        addon("cleartext", "stream", (k, id, q) -> json(200, "{\"url\":\"http://cdn.example/x.flac\",\"codec\":\"flac\"}"));
        AddonClient.Opened got = c.resolve(song(), list("cleartext"), null);
        assertEquals("not https", got.tried.get(0).why);
    }

    @Test
    public void networkFailureMessagesAreScrubbed() {
        AddonClient.Transport broken = r -> {
            throw new IOException("failed to connect to " + r.url);
        };
        AddonClient c = new AddonClient(broken, () -> now, ms -> { }, logs::add);
        AddonClient.Opened got = c.resolve(song(), list("x"), null);
        assertEquals("network: failed to connect to h.example", got.tried.get(0).why);
        assertFalse(String.join("\n", logs).contains("tok3n"));
    }

    private static Pick.Row row(String id) {
        Map<String, Object> raw = new HashMap<>();
        raw.put("id", id);
        raw.put("title", "t");
        return Pick.rowOf(raw);
    }

    @Test
    public void streamAnswersReadAsJson() {
        Protocol.Stream s = Protocol.readStream(Json.parse("{\"url\":\"https://cdn/x.flac\",\"codec\":\"FLAC\",\"sampleRate\":\"44.1\",\"bitDepth\":16}"), null);
        assertEquals("flac", s.codec);
        assertEquals(44100, s.sampleRate, 1e-9);
        assertEquals(16, s.bitDepth, 0);
        assertNotNull(s.headers);
    }

    private static String quality(String settingsJson, String tier) {
        List<String[]> p = Protocol.paramsFor(Protocol.readSettings(Json.parse(settingsJson)), tier, null);
        return p.get(p.size() - 1)[1];
    }

    @Test
    public void qualityTiersHiResAndCd() {
        // the extension's addon_client_tests (90574a6): Hi-Res and CD by name, never a lossy option
        String kbps = "[{\"key\":\"quality\",\"options\":[{\"value\":\"LOSSLESS\",\"label\":\"FLAC\"},{\"value\":\"HIGH\",\"label\":\"AAC 320 kbps\"},{\"value\":\"LOW\",\"label\":\"AAC 96 kbps\"}]}]";
        assertEquals("Hi-Res never takes \"96 kbps\"", "LOSSLESS", quality(kbps, Pick.HIRES));
        String tidal = "[{\"key\":\"quality\",\"options\":[{\"value\":\"LOSSLESS\",\"label\":\"Lossless\"},{\"value\":\"HI_RES_LOSSLESS\",\"label\":\"Max\"}]}]";
        assertEquals("Hi-Res finds HI_RES_LOSSLESS", "HI_RES_LOSSLESS", quality(tidal, Pick.HIRES));
        String rate = "[{\"key\":\"quality\",\"options\":[{\"value\":\"a\",\"label\":\"FLAC 44.1 kHz\"},{\"value\":\"b\",\"label\":\"FLAC 96 kHz\"}]}]";
        assertEquals("Hi-Res by sample rate with its unit", "b", quality(rate, Pick.HIRES));
        assertEquals("CD by 44.1 kHz", "a", quality(rate, Pick.CD));
    }

    /** The race's lanes log at the same moment (both have it): the Log sink must be thread-safe. */
    @Test
    public void raceLanesLogAtTheSameTime() throws Exception {
        String rows = tracks(row("fine", ""));
        good("one", rows);
        good("two", rows);
        final java.util.concurrent.CountDownLatch both = new java.util.concurrent.CountDownLatch(2);
        AddonClient cl = new AddonClient(transport, () -> now, ms -> { }, line -> {
            if (!line.contains(" has it: ")) return;
            both.countDown();
            try {
                // the first lane's line waits here until the second lane logs too
                both.await(5, java.util.concurrent.TimeUnit.SECONDS);
            } catch (InterruptedException ignored) {
            }
        });
        AddonClient.Opened got = cl.race(song(), list("one", "two"), null);
        assertNull(got.none);
        assertEquals(0, both.getCount());
    }
}
