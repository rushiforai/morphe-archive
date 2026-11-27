package app.ayham.extension.music.addons;

import java.io.IOException;
import java.net.SocketTimeoutException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import app.ayham.extension.music.automix.Json;

/**
 * The addon client (spec/addons/protocol.md): BitChord-compatible addons, asked in the user's
 * priority order for a YouTube Music song. A port of the extension's src/addons/client.js with
 * the I/O behind {@link Transport} (the real one is {@link HttpTransport}) and the time behind
 * {@link StreamLimits.Clock}, so all of it runs in JVM tests. Calls block: use a background thread.
 *
 *   find(target, addons, opt)  search and pick only, no /stream: safe for the look-ahead (§8)
 *   open(found, target, opt)   /stream and the probe, just before the song is needed
 *   resolve(...)               find, then open
 *
 * Addon links hold their owner's token: every log line, error and health entry shows the host only.
 */
public final class AddonClient {
    /** One GET. Throws IOException on a network failure (SocketTimeoutException when the call timed out). */
    public interface Transport {
        Response get(Protocol.Request request) throws IOException;
    }

    public interface Sleeper {
        void sleep(long ms) throws InterruptedException;
    }

    /** Called from the race's lane threads at the same time: must be thread-safe (Android's Log is). */
    public interface Log {
        void log(String line);
    }

    public static final class Response {
        public final int status;
        /** Header names in lower case. */
        public final Map<String, String> headers;
        public final String body;

        public Response(int status, Map<String, String> headers, String body) {
            this.status = status;
            this.headers = headers == null ? new HashMap<String, String>() : headers;
            this.body = body == null ? "" : body;
        }
    }

    /** An addon in the user's list: its link (holds the token), the user's lossless pick, the tier wanted. */
    public static final class Addon {
        public String base;
        public String quality;
        public String tier;
        public String name;
        /** The host only: safe to show. */
        public String host;

        public Addon(String base) {
            this.base = base;
        }

        Addon copy() {
            Addon a = new Addon(base);
            a.quality = quality;
            a.tier = tier;
            a.name = name;
            a.host = host;
            return a;
        }
    }

    public static final class Options {
        public double slackSec = 5;
        public String tier = Pick.LOSSLESS;
        /** Downloads: ±2 s, addons with allowDownloads only, lossy files over 256 kbps only (§8). */
        public boolean forDownload;
        /**
         * The last say on an opened row before it is taken (the phone's fit: the file fetched and
         * fitted to YouTube's audio): a reason refuses it and the next row, then addon, is tried.
         */
        public Check check;
        /**
         * Rows ("base\trowId"; in memory only, the base holds the key) refused for this song before (protocol.md 8.1.4: "refused" is per row
         * and per song): passed over before their /stream, so a pass doesn't open them again.
         */
        public java.util.function.Predicate<String> refusedBefore;
        /** True once the song is no longer wanted (skipped): the search and the opening stop there. */
        public java.util.function.BooleanSupplier cancelled;
        /**
         * The phone's Dolby Atmos switch: addons with an atmos setting are asked atmos=true, and every
         * addon's matching Atmos rows are tried first (in priority order), then the stereo rows as before.
         */
        public boolean atmos;
        /** An Atmos download: Atmos rows only (the next step down is the stereo tiers). */
        public boolean atmosOnly;
        /** Whether the phone decodes an Atmos stream's codec (null: any). An Atmos stream it can't decode is passed over. */
        public java.util.function.Predicate<String> atmosDecodes;
    }

    private static boolean cancelled(Options opt) {
        return opt.cancelled != null && opt.cancelled.getAsBoolean();
    }

    public interface Check {
        /** null to take the row, else why not (logged; no link in it). */
        String refuse(Opened o);
    }

    /** Why an addon or a row was passed over. Never holds a link. */
    public static final class Tried {
        public final String addon, row, why;
        public final List<Pick.Refusal> refused;

        Tried(String addon, String row, String why, List<Pick.Refusal> refused) {
            this.addon = addon;
            this.row = row;
            this.why = why;
            this.refused = refused;
        }
    }

    public static final class Found {
        public final Addon addon;
        public final List<Pick.Row> rows;
        /** Atmos rows: their /stream asks atmos=true and an Atmos answer is taken. */
        public final boolean atmos;

        Found(Addon addon, List<Pick.Row> rows) {
            this(addon, rows, false);
        }

        Found(Addon addon, List<Pick.Row> rows, boolean atmos) {
            this.addon = addon;
            this.rows = rows;
            this.atmos = atmos;
        }
    }

    public static final class FindResult {
        public final List<Found> found = new ArrayList<>();
        public final List<Tried> tried = new ArrayList<>();
    }

    /** The row to play and its stream, or none (with why) when no addon has it. */
    public static final class Opened {
        public Addon addon;
        public Pick.Row row;
        public Protocol.Stream stream;
        public String none;
        public List<Tried> tried;
    }

    public static final class Discovered {
        public final String base;
        public final Protocol.Manifest manifest;

        Discovered(String base, Protocol.Manifest manifest) {
            this.base = base;
            this.manifest = manifest;
        }
    }

    public static final class Health {
        public int fails;
        public long coolUntil;
        long rest = REST_MS;
        public String last = "";
        public Long ms;

        Health copy() {
            Health h = new Health();
            h.fails = fails;
            h.coolUntil = coolUntil;
            h.rest = rest;
            h.last = last;
            h.ms = ms;
            return h;
        }
    }

    static final long TTL_MANIFEST = 10 * 60_000L, TTL_SEARCH = 10 * 60_000L, TTL_STREAM = 5 * 60_000L;
    static final int CACHE_MAX = 128;
    static final int RETRIES_429 = 2;
    // health: this many failures in a row (not misses) put an addon to rest, 2 min doubling to 30 min
    static final int FAILS_TO_REST = 3;
    static final long REST_MS = 2 * 60_000L, REST_MAX_MS = 30 * 60_000L;

    private final Transport transport;
    private final StreamLimits.Clock clock;
    private final Sleeper sleeper;
    private final Log log;
    private final StreamLimits limits;
    private boolean allowLocalHttp;

    private static final class Entry {
        final long until;
        final Object value;

        Entry(long until, Object value) {
            this.until = until;
            this.value = value;
        }
    }

    private final LinkedHashMap<String, Entry> cache = new LinkedHashMap<>();
    private final Map<String, Long> quietUntil = new HashMap<>();
    private final Map<String, Health> healthOf = new LinkedHashMap<>();

    public AddonClient(Transport transport, StreamLimits.Clock clock, Sleeper sleeper, Log log) {
        this.transport = transport;
        this.clock = clock;
        this.sleeper = sleeper;
        this.log = log == null ? line -> { } : log;
        this.limits = new StreamLimits(clock);
    }

    /** The real thing: HttpURLConnection, the wall clock, Thread.sleep. */
    public static AddonClient create(Log log) {
        return new AddonClient(new HttpTransport(), System::currentTimeMillis, Thread::sleep, log);
    }

    /** Debug only: allow plain http to the device itself (a mock addon running on the phone). Never in a release. */
    public AddonClient allowLocalHttp(boolean allow) {
        this.allowLocalHttp = allow;
        return this;
    }

    /** Whether plain http to the device is allowed (an HLS or DASH stream's segment links follow the same rule). */
    public boolean allowsLocalHttp() {
        return allowLocalHttp;
    }

    private long now() {
        return clock.nowMs();
    }

    // ---- cache (§6) ----

    private synchronized Object cached(String key) {
        Entry e = cache.get(key);
        if (e == null) return null;
        if (e.until < now()) {
            cache.remove(key);
            return null;
        }
        return e.value;
    }

    private synchronized void remember(String key, Object value, long ttl) {
        cache.remove(key);
        cache.put(key, new Entry(now() + ttl, value));
        Iterator<String> it = cache.keySet().iterator();
        while (cache.size() > CACHE_MAX && it.hasNext()) {
            it.next();
            it.remove();
        }
    }

    // ---- one GET of JSON (§1, §5) ----

    Object getJson(String base, String url, boolean manifest, boolean retry429) {
        if (!Protocol.allowed(url, allowLocalHttp)) throw new AddonError("error", "https only");
        for (int attempt = 0; ; attempt++) {
            Long quiet;
            synchronized (this) {
                quiet = quietUntil.get(base);
            }
            long wait = (quiet != null ? quiet : 0) - now();
            if (wait > 0) sleep(wait);
            Response r;
            try {
                r = transport.get(Protocol.api(url));
            } catch (SocketTimeoutException e) {
                throw new AddonError("down", "timed out");
            } catch (IOException e) {
                throw new AddonError("down", "network: " + (e.getMessage() != null ? e.getMessage() : e.toString()));
            }
            if (r.status == 429) {
                Double ra = Js.num(r.headers.get("retry-after"));
                double ms = Math.min(8000, Math.max(500, ra != null ? ra * 1000 : 500 << attempt));
                synchronized (this) {
                    quietUntil.put(base, now() + (long) ms);
                }
                if (!retry429 || attempt >= RETRIES_429) throw new AddonError("down", "rate limited (429)", 429, ra);
                continue;
            }
            if (r.status == 404) throw new AddonError(manifest ? "error" : "miss", "not found (404)", 404, null);
            if (r.status >= 500) throw new AddonError("down", "server error (" + r.status + ")", r.status, null);
            if (r.status >= 400) {
                String detail = "";
                try {
                    Object j = Json.parse(r.body);
                    if (j instanceof Map) detail = Js.text(((Map<?, ?>) j).get("detail"));
                    if (detail.length() > 120) detail = detail.substring(0, 120);
                } catch (RuntimeException notJson) {
                    detail = "";
                }
                throw new AddonError("error", "refused (" + r.status + ")" + (detail.isEmpty() ? "" : ": " + detail), r.status, null);
            }
            if (Js.blank(r.body)) throw new AddonError("error", "empty answer", r.status, null);
            try {
                return Json.parse(Js.trim(r.body));
            } catch (RuntimeException e) {
                throw new AddonError("error", "not JSON", r.status, null);
            }
        }
    }

    private void sleep(long ms) {
        try {
            sleeper.sleep(ms);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            throw new AddonError("down", "interrupted");
        }
    }

    // ---- manifest and discovery (§2) ----

    public Protocol.Manifest manifest(String base) {
        String key = "m|" + base;
        Object hit = cached(key);
        if (hit != null) return (Protocol.Manifest) hit;
        Protocol.Manifest m = Protocol.readManifest(getJson(base, Protocol.manifestUrl(base), true, true));
        if (m == null) throw new AddonError("error", "not an addon manifest");
        remember(key, m, TTL_MANIFEST);
        return m;
    }

    /** §2: an addon from a pasted link. An addon that needs the official BitChord app is refused. */
    public Discovered discover(String pasted) {
        String raw = Js.trim(Js.text(pasted)).replaceAll("/+$", "");
        String base = Protocol.baseOf(raw);
        Protocol.Url u = Protocol.parse(raw);
        if (u == null) throw new AddonError("error", "not a link");
        if (!Protocol.allowed(raw, allowLocalHttp)) throw new AddonError("error", "https only");
        String[] tries = u.path.toLowerCase(java.util.Locale.ROOT).endsWith(".json")
                ? new String[]{raw, Protocol.manifestUrl(base)} : new String[]{Protocol.manifestUrl(raw), raw};
        AddonError last = null;
        for (String t : tries) {
            try {
                Object j = getJson(base, t, true, true);
                if (Protocol.looksLikeManifest(j)) {
                    Protocol.Manifest m = Protocol.readManifest(j);
                    if (m != null && m.needsOfficial) throw new AddonError("error", Protocol.NEEDS_OFFICIAL);
                    if (m != null) {
                        remember("m|" + base, m, TTL_MANIFEST);
                        return new Discovered(base, m);
                    }
                }
            } catch (AddonError e) {
                if (Protocol.NEEDS_OFFICIAL.equals(e.getMessage())) throw e;
                last = keepReason(last, e);   // (a 403's reason beats a later 404)
            }
        }
        try {   // last resort: a search answers
            Object j = getJson(base, base + "/search?q=music", false, true);
            if (j instanceof Map && ((Map<?, ?>) j).get("tracks") instanceof List) {
                Protocol.Manifest m = new Protocol.Manifest();
                m.id = base;
                m.name = Protocol.redact(base);
                m.version = "";
                m.resources.add("search");
                m.resources.add("stream");
                m.usable = true;
                m.allowDownloads = true;
                remember("m|" + base, m, TTL_MANIFEST);
                return new Discovered(base, m);
            }
        } catch (AddonError e) {
            last = keepReason(last, e);
        }
        throw last != null ? last : new AddonError("error", "no addon there");
    }

    private static AddonError keepReason(AddonError last, AddonError e) {
        return last != null && (last.status == null || last.status != 404) ? last : e;
    }

    // ---- search (§3) ----

    /** The addon's rows for a query (first 15, cached 10 min). */
    public List<Object> search(Addon addon, TrackMatcher.Target target, String query, Protocol.Manifest man) {
        return search(addon, target, query, man, false);
    }

    /** atmos: an addon with an atmos setting is asked atmos=true (its Atmos rows come back too). */
    @SuppressWarnings("unchecked")
    public List<Object> search(Addon addon, TrackMatcher.Target target, String query, Protocol.Manifest man, boolean atmos) {
        String url = Protocol.searchUrl(addon.base, Protocol.paramsFor(man, addon.tier, addon.quality, atmos), target, query);
        String key = "s|" + url;
        Object hit = cached(key);
        if (hit != null) return (List<Object>) hit;
        Object j = getJson(addon.base, url, false, true);
        Map<String, Object> m = j instanceof Map ? (Map<String, Object>) j : new HashMap<String, Object>();
        if (Js.truthy(m.get("error"))) {
            String e = Js.text(m.get("error"));
            throw new AddonError("miss", e.length() > 120 ? e.substring(0, 120) : e);
        }
        List<Object> rows = new ArrayList<>();
        if (m.get("tracks") instanceof List) {
            List<Object> tracks = (List<Object>) m.get("tracks");
            for (int i = 0; i < tracks.size() && i < Pick.MAX_ROWS; i++) rows.add(tracks.get(i));
        }
        remember(key, rows, TTL_SEARCH);
        return rows;
    }

    // ---- stream (§4, §4a) ----

    /** How long until this addon takes another /stream call (0: now). */
    public long streamWait(Addon addon, Protocol.Manifest man) {
        return limits.waitMs(Protocol.baseOf(addon.base), man.limits);
    }

    /** /stream for a row: cached 5 min (a cached answer costs nothing), else within the §4a budget. */
    public Protocol.Stream stream(Addon addon, Pick.Row row, Protocol.Manifest man) {
        return stream(addon, row, man, false);
    }

    /** atmos: an Atmos row (asked atmos=true; an Atmos answer is taken, marked atmos). */
    public Protocol.Stream stream(Addon addon, Pick.Row row, Protocol.Manifest man, boolean atmos) {
        String url = Protocol.streamUrl(addon.base, row.id, Protocol.paramsFor(man, addon.tier, addon.quality, atmos));
        String key = "t|" + url;
        Object hit = cached(key);
        if (hit != null) return (Protocol.Stream) hit;
        // one budget per addon, however its link was written (streamWait counts the same way)
        String base = Protocol.baseOf(addon.base);
        long wait = limits.tryStart(base, man.limits);
        if (wait > 0) throw new AddonError("limit", "stream limit, free in " + (long) Math.ceil(wait / 1000.0) + " s");
        Protocol.Stream s;
        try {
            Object j = getJson(addon.base, url, false, false);
            s = Protocol.readStream(j, man.limits.cachedMarker, atmos);
            limits.answered(base, s.cached);
            // §4: a 200 with a blank url or an error falls back to the row's streamURL, as a 404 does
            if (s.miss != null && row.streamURL != null && noUrl(j)) s = fromRow(row, atmos);
        } catch (AddonError e) {
            if (e.status != null && e.status == 429) {
                int perMinute = limits.rateLimited(base, e.retryAfterSec);
                throw new AddonError("limit", "stream limit (429), " + perMinute + "/min from now on");
            }
            if (!"miss".equals(e.kind) || row.streamURL == null) throw e;
            s = fromRow(row, atmos);
        }
        // §6: a miss isn't remembered (a passing "rate limit" error would hold the row for 5 min)
        if (s.miss == null) remember(key, s, TTL_STREAM);
        return s;
    }

    private static Protocol.Stream fromRow(Pick.Row row, boolean atmos) {
        Map<String, Object> fallback = new HashMap<>();
        fallback.put("url", row.streamURL);
        return Protocol.readStream(fallback, null, atmos);
    }

    /** A /stream answer with no link: a blank url, or an error (§4). Other misses (not https, Atmos) are not. */
    @SuppressWarnings("unchecked")
    private static boolean noUrl(Object j) {
        if (!(j instanceof Map)) return true;
        Map<String, Object> m = (Map<String, Object>) j;
        return Js.trim(Js.text(m.get("url"))).isEmpty() || Js.truthy(m.get("error"));
    }

    /**
     * "Upgrade quality" (protocol.md 8.1.7): the song's remembered search answers (empty ones
     * too: every search that named its title) and the /stream answers of the rows tried for it.
     * Returns how many went.
     */
    public synchronized int forgetSong(String title, java.util.Collection<String> rowIds) {
        String tt = Js.trim(Js.text(title));   // searchUrl sends it trimmed
        String t = tt.isEmpty() ? null : "title=" + Js.encode(tt) + "&";
        int n = 0;
        Iterator<String> it = cache.keySet().iterator();
        while (it.hasNext()) {
            String k = it.next();
            boolean drop = t != null && k.startsWith("s|") && (k + "&").contains(t);
            if (!drop && k.startsWith("t|") && rowIds != null)
                for (String r : rowIds) if (k.contains("/stream/" + Js.encode(r) + "?")) drop = true;
            if (drop) {
                it.remove();
                n++;
            }
        }
        return n;
    }

    /**
     * A fresh /stream answer for a row whose link stopped working (an addon's links can expire
     * within a minute, while the player still reads the file): the remembered answer is dropped.
     */
    public Protocol.Stream streamAgain(Addon addon, Pick.Row row, boolean atmos) {
        Protocol.Manifest man = manifest(addon.base);
        String url = Protocol.streamUrl(addon.base, row.id, Protocol.paramsFor(man, addon.tier, addon.quality, atmos));
        synchronized (this) {
            cache.remove("t|" + url);
        }
        Protocol.Stream s = stream(addon, row, man, atmos);
        // the same checks as the first answer (openRow): a new link is never plain http or a manifest
        if (s.miss != null || !"file".equals(s.transport) || !Protocol.allowed(s.url, allowLocalHttp)) return null;
        return s;
    }

    /** §7: Range bytes=0-0 (4 s): the file must hold the whole song. Unmeasurable is not refused. */
    public Pick.Verdict probe(String url, String tier, Double kbps, Double songSec, double slackSec, Map<String, String> headers) {
        try {
            Response r = transport.get(Protocol.probe(url, headers));
            if (r.status >= 400) return new Pick.Verdict(false, "stream answered " + r.status, null);
            Pick.Head head = new Pick.Head();
            head.status = r.status;
            head.contentRange = r.headers.get("content-range");
            head.contentLength = r.headers.get("content-length");
            return Pick.probeVerdict(head, tier, kbps, songSec, slackSec);
        } catch (IOException e) {
            return new Pick.Verdict(true, null, null);
        }
    }

    // ---- health ----

    private synchronized void note(String base, Boolean ok, String last, Long ms) {
        Health h = healthOf.get(base);
        if (h == null) {
            h = new Health();
            healthOf.put(base, h);
        }
        if (Boolean.TRUE.equals(ok)) {
            h.fails = 0;
            h.rest = REST_MS;
        } else if (Boolean.FALSE.equals(ok) && ++h.fails >= FAILS_TO_REST) {
            h.coolUntil = now() + h.rest;
            h.rest = Math.min(REST_MAX_MS, h.rest * 2);
            h.fails = 0;
        }
        h.last = last;
        if (ms != null) h.ms = ms;
    }

    private synchronized boolean resting(String base) {
        Health h = healthOf.get(base);
        return h != null && h.coolUntil > now();
    }

    /** Each addon's health, keyed by host (never the link). */
    public synchronized Map<String, Health> health() {
        Map<String, Health> out = new LinkedHashMap<>();
        for (Map.Entry<String, Health> e : healthOf.entrySet()) out.put(Protocol.redact(e.getKey()), e.getValue().copy());
        return out;
    }

    private void failed(String base, String host, RuntimeException e, long t0, List<Tried> tried) {
        String kind = e instanceof AddonError ? ((AddonError) e).kind : "error";
        String why = Protocol.scrub(e.getMessage() != null ? e.getMessage() : e.toString());
        note(base, "miss".equals(kind) ? null : Boolean.FALSE, why, now() - t0);
        tried.add(new Tried(host, null, why, null));
        log.log("addons: " + host + ": " + why);
    }

    // ---- the look-ahead and the opening (§8) ----

    /** Search and pick only, every addon in priority order. No /stream calls: safe for the next song. */
    public FindResult find(TrackMatcher.Target target, List<Addon> addons, Options opt) {
        if (opt == null) opt = new Options();
        FindResult out = new FindResult();
        List<Found> stereo = new ArrayList<>();
        for (Addon a : addons) {
            if (cancelled(opt)) break;
            findOne(a, target, opt, out.found, stereo, out.tried);
        }
        out.found.addAll(stereo);
        return out;
    }

    /** One addon's searches: its Atmos rows to atmosOut, its stereo rows to stereoOut, or why not to tried. */
    private void findOne(Addon a, TrackMatcher.Target target, Options opt, List<Found> atmosOut, List<Found> stereoOut, List<Tried> tried) {
        boolean atmosOk = opt.atmos || opt.atmosOnly;
        Addon addon = a.copy();
        if (addon.tier == null) addon.tier = opt.tier;
        addon.base = Protocol.baseOf(a.base);
        String host = Protocol.redact(addon.base);
        if (resting(addon.base)) {
            tried.add(new Tried(host, null, "resting after failures", null));
            return;
        }
        long t0 = now();
        try {
            Protocol.Manifest man = manifest(addon.base);
            if (man.needsOfficial) {
                tried.add(new Tried(host, null, Protocol.NEEDS_OFFICIAL, null));
                return;
            }
            if (!man.usable) {
                tried.add(new Tried(host, null, "no search", null));
                return;
            }
            if (opt.forDownload && !man.allowDownloads) {
                tried.add(new Tried(host, null, "no downloads", null));
                return;
            }
            Pick.Choice choice = new Pick.Choice();
            List<Pick.Row> atmosRows = new ArrayList<>();
            for (String q : TrackMatcher.queries(target)) {
                choice = Pick.rowsToOpen(search(addon, target, q, man, atmosOk), target, opt.slackSec, opt.forDownload, atmosOk);
                // the first query's Atmos rows are kept; the stereo fallback still needs its own match
                if (atmosRows.isEmpty()) atmosRows.addAll(choice.atmos);
                if (opt.atmosOnly ? !atmosRows.isEmpty() : !choice.open.isEmpty()) break;
            }
            choice.atmos.clear();
            choice.atmos.addAll(atmosRows);
            boolean none = opt.atmosOnly ? choice.atmos.isEmpty() : choice.open.isEmpty() && choice.atmos.isEmpty();
            note(addon.base, true, none ? "no match" : "ok", now() - t0);
            if (none) {
                tried.add(new Tried(host, null, opt.atmosOnly ? "no Atmos match" : "no match", choice.refused));
                return;
            }
            addon.name = man.name;
            addon.host = host;
            // Atmos rows of every addon first, in priority order; then the stereo rows as before
            if (!choice.atmos.isEmpty()) atmosOut.add(new Found(addon, choice.atmos, true));
            if (!opt.atmosOnly && !choice.open.isEmpty()) stereoOut.add(new Found(addon, choice.open));
        } catch (RuntimeException e) {
            failed(addon.base, host, e, t0, tried);
        }
    }

    /** Just before the song is needed: /stream and the probe, row by row, addon by addon. */
    public Opened open(List<Found> found, TrackMatcher.Target target, Options opt, List<Tried> tried) {
        if (opt == null) opt = new Options();
        if (tried == null) tried = new ArrayList<>();
        for (Found f : found) {
            Addon addon = f.addon;
            long t0 = now();
            try {
                Protocol.Manifest man = manifest(addon.base);
                for (Pick.Row row : f.rows) {
                    if (cancelled(opt)) {
                        Opened none = new Opened();
                        none.none = "cancelled";
                        none.tried = tried;
                        return none;
                    }
                    Opened o = openRow(f, man, row, target, opt, tried, t0, null);
                    if (o == null) continue;
                    String refused = opt.check == null ? null : opt.check.refuse(o);
                    if (refused != null) {
                        log.log("addons: " + man.name + " row " + row.id + " refused: " + refused);
                        tried.add(new Tried(addon.host, row.id, refused, null));
                        continue;
                    }
                    return o;
                }
            } catch (AddonError e) {
                if ("limit".equals(e.kind)) {   // not a fault
                    tried.add(new Tried(addon.host, null, e.getMessage(), null));
                    continue;
                }
                failed(addon.base, addon.host, e, t0, tried);
            } catch (RuntimeException e) {
                failed(addon.base, addon.host, e, t0, tried);
            }
        }
        Opened none = new Opened();
        none.none = "no addon has it";
        none.tried = tried;
        return none;
    }

    /** One row: its /stream answer and the probe. The answer to check, or null (why in tried). */
    /** The race is won by another lane (protocol.md 8.1.4): a loser sends no /stream and no probe. */
    private interface Lost {
        boolean now();
    }

    private Opened openRow(Found f, Protocol.Manifest man, Pick.Row row, TrackMatcher.Target target, Options opt, List<Tried> tried, long t0, Lost lost) {
        Addon addon = f.addon;
        // a row refused for this song before is not opened again: no second /stream (8.1.4)
        if (opt.refusedBefore != null && row.id != null && opt.refusedBefore.test(addon.base + "\t" + row.id)) {
            tried.add(new Tried(addon.host, row.id, "refused for this song before", null));
            return null;
        }
        Protocol.Stream s;
        try {
            s = stream(addon, row, man, f.atmos);
        } catch (AddonError e) {
            if (!"miss".equals(e.kind)) throw e;
            s = Protocol.Stream.miss(e.getMessage());
        }
        if (s.miss != null) {
            tried.add(new Tried(addon.host, row.id, Protocol.scrub(s.miss), null));
            return null;
        }
        if (!Protocol.allowed(s.url, allowLocalHttp)) {
            tried.add(new Tried(addon.host, row.id, "not https", null));
            return null;
        }
        if (s.atmos && opt.atmosDecodes != null && !opt.atmosDecodes.test(s.codec)) {
            tried.add(new Tried(addon.host, row.id, "Atmos in " + (s.codec != null ? s.codec : "an unknown codec") + ": no decoder on this phone", null));
            return null;
        }
        if (opt.atmosOnly && !s.atmos) {
            tried.add(new Tried(addon.host, row.id, "not Atmos", null));
            return null;
        }
        if (opt.forDownload && !s.atmos && !Protocol.goodForDownload(s)) {
            tried.add(new Tried(addon.host, row.id, "lossy at 256 kbps or under", null));
            return null;
        }
        if (lost != null && lost.now()) return null;   // its /stream ran out; the race was won meanwhile
        // HLS and DASH (protocol.md 8.1.5): the link is a playlist or manifest, whose size says nothing
        // of the song's length; the window check (the fit) still decides
        Pick.Verdict p = !"file".equals(s.transport) ? new Pick.Verdict(true, null, null) : probe(s.url, s.tier != null ? s.tier : row.tier, s.bitrate != null ? s.bitrate : row.kbps,
                target.durationSec, opt.forDownload ? Pick.DOWNLOAD_SLACK_SEC : opt.slackSec, s.headers);
        if (!p.ok) {
            tried.add(new Tried(addon.host, row.id, p.why, null));
            return null;
        }
        note(addon.base, true, "ok", now() - t0);
        log.log("addons: " + man.name + " (" + addon.host + ") has it: row " + row.id
                + " (\"" + row.title + "\" by " + row.artist
                + (row.durationSec != null ? ", " + Js.number(Math.round(row.durationSec)) + " s" : "") + "), "
                + (s.atmos ? "Dolby Atmos " : "") + (s.codec != null ? s.codec : "?")
                + (s.sampleRate != null && s.sampleRate != 0 ? " " + Js.number(s.sampleRate / 1000) + " kHz" : "")
                + (s.bitDepth != null && s.bitDepth != 0 ? "/" + Js.number(s.bitDepth) : ""));
        Opened o = new Opened();
        o.addon = new Addon(addon.base);
        o.addon.name = man.name;
        o.addon.host = addon.host;
        // what this row was asked at: the kept file's key (StreamCache.rowKey) and a new link (streamAgain) ask the same
        o.addon.tier = addon.tier;
        o.addon.quality = addon.quality;
        o.row = row;
        o.stream = s;
        o.tried = tried;
        return o;
    }

    /** The first addon, in priority order, with a row that opens and passes the probe. */
    public Opened resolve(TrackMatcher.Target target, List<Addon> addons, Options opt) {
        FindResult f = find(target, addons, opt);
        return open(f.found, target, opt, f.tried);
    }

    /** One addon's lane in the race: the answer waiting for the check, its misses, and whether it ended. */
    private static final class Lane {
        Opened ready;
        boolean done;
        final List<Tried> tried = java.util.Collections.synchronizedList(new ArrayList<Tried>());
    }

    /**
     * The race (protocol.md 8.1.4): each addon is a lane of its own (its search, then its rows in
     * order: /stream and the probe), all at once. The first answer ready wins, and of answers ready
     * together the higher-ranked addon's. The check (the fetch and the fit) runs on the calling
     * thread, one answer at a time; a refusal sends that lane on to its next row. Once one is taken,
     * a lane still searching finishes (its answers land in the cache) but makes no further /stream
     * call. tried holds each lane's misses in rank order. Dolby Atmos (its rows of every addon go
     * first) and a single addon keep resolve.
     */
    public Opened race(TrackMatcher.Target target, List<Addon> addons, Options opt) {
        if (opt == null) opt = new Options();
        if (opt.atmos || opt.atmosOnly || addons.size() < 2) return resolve(target, addons, opt);
        final Options o = opt;
        final int n = addons.size();
        final Lane[] lanes = new Lane[n];
        final Object lock = new Object();
        // over[0]: the race is decided; over[1]: an answer is being checked (the lanes wait it out)
        final boolean[] over = new boolean[2];
        for (int i = 0; i < n; i++) lanes[i] = new Lane();
        for (int i = 0; i < n; i++) {
            final Lane lane = lanes[i];
            final Addon a = addons.get(i);
            Thread t = new Thread(() -> runLane(a, target, o, lane, lock, over), "addon-lane-" + i);
            t.setDaemon(true);
            t.start();
        }
        Opened won = null;
        String why = "no addon has it";
        try {
            while (true) {
                int pick = -1;
                Opened c;
                synchronized (lock) {
                    while (true) {
                        boolean all = true;
                        for (int i = 0; i < n && pick < 0; i++) {
                            if (lanes[i].ready != null) pick = i;
                            else if (!lanes[i].done) all = false;
                        }
                        if (pick >= 0 || all || cancelled(o)) break;
                        lock.wait(200);
                    }
                    c = pick < 0 ? null : lanes[pick].ready;
                    if (c != null) over[1] = true;
                }
                if (c == null) {
                    if (cancelled(o)) why = "cancelled";
                    break;
                }
                String refused = o.check == null ? null : o.check.refuse(c);
                synchronized (lock) {
                    over[1] = false;
                    if (refused == null) {
                        won = c;
                        over[0] = true;
                    } else {
                        log.log("addons: " + c.addon.name + " row " + c.row.id + " refused: " + refused);
                        lanes[pick].tried.add(new Tried(c.addon.host, c.row.id, refused, null));
                        lanes[pick].ready = null;
                    }
                    lock.notifyAll();
                }
                if (won != null) break;
            }
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            why = "cancelled";
        } finally {
            synchronized (lock) {
                over[0] = true;
                lock.notifyAll();
            }
        }
        List<Tried> tried = new ArrayList<>();
        for (Lane l : lanes) synchronized (l.tried) {
            tried.addAll(l.tried);
        }
        if (won != null) {
            won.tried = tried;
            return won;
        }
        Opened none = new Opened();
        none.none = why;
        none.tried = tried;
        return none;
    }

    /**
     * Whether the race is decided, after waiting out an answer being checked: on the phone the check
     * (the window fit) takes ~3 s, and a lane going on meanwhile sent its /stream and probe for a race
     * already won (phone, 2026-11-24: Tidotido 1.7 s after Nebula's answer; each adds a debrid entry).
     */
    private static boolean decided(Object lock, boolean[] over) throws InterruptedException {
        synchronized (lock) {
            while (over[1] && !over[0]) lock.wait();
            return over[0];
        }
    }

    private void runLane(Addon a, TrackMatcher.Target target, Options o, Lane lane, Object lock, boolean[] over) {
        try {
            List<Found> found = new ArrayList<>();
            findOne(a, target, o, new ArrayList<Found>(), found, lane.tried);
            for (Found f : found) {
                long t0 = now();
                try {
                    Protocol.Manifest man = manifest(f.addon.base);
                    for (Pick.Row row : f.rows) {
                        if (decided(lock, over)) return;
                        if (cancelled(o)) return;
                        Opened c = openRow(f, man, row, target, o, lane.tried, t0, () -> {
                            try {
                                return decided(lock, over);
                            } catch (InterruptedException e) {
                                Thread.currentThread().interrupt();
                                return true;
                            }
                        });
                        if (decided(lock, over)) return;
                        if (c == null) continue;
                        synchronized (lock) {
                            lane.ready = c;
                            lock.notifyAll();
                            while (lane.ready != null && !over[0]) lock.wait();
                            if (over[0]) return;
                        }
                    }
                } catch (AddonError e) {
                    if ("limit".equals(e.kind)) lane.tried.add(new Tried(f.addon.host, null, e.getMessage(), null));
                    else failed(f.addon.base, f.addon.host, e, t0, lane.tried);
                } catch (RuntimeException e) {
                    failed(f.addon.base, f.addon.host, e, t0, lane.tried);
                }
            }
        } catch (InterruptedException ignored) {
            // the race is over
        } catch (RuntimeException e) {
            lane.tried.add(new Tried(Protocol.redact(Protocol.baseOf(a.base)), null, Protocol.scrub(String.valueOf(e)), null));
        } finally {
            synchronized (lock) {
                lane.done = true;
                lock.notifyAll();
            }
        }
    }
}
