package app.ayham.extension.music.addons;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * The addon protocol's pure readings and request shapes (spec/addons/protocol.md): base URLs,
 * the manifest, the query parameters, the /stream answer, and the headers every call sends.
 * A port of the pure parts of the extension's src/addons/client.js. No I/O here.
 */
public final class Protocol {
    private Protocol() {
    }

    /**
     * The one User-Agent for every addon call and the audio file (the user's call): a browser's,
     * never BitChord's (an addon developer blocks every agent that says "bitchord").
     */
    public static final String USER_AGENT = "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:159.0) Gecko/20100101 Firefox/159.0";

    public static final int TIMEOUT_MS = 45000;
    public static final int PROBE_TIMEOUT_MS = 4000;
    public static final String NEEDS_OFFICIAL = "needs official BitChord";

    // ---- links ----

    /** A link taken apart the way the WHATWG URL parser does for http(s): enough to compare and redact. */
    static final class Url {
        String scheme;
        String host;   // lower case, with a non-default port
        String path;   // "/" when empty; no query or fragment
    }

    private static final Pattern SCHEME = Pattern.compile("[a-zA-Z][a-zA-Z0-9+.-]*");

    static Url parse(String u) {
        if (u == null) return null;
        String s = Js.trim(u);
        int c = s.indexOf("://");
        if (c <= 0 || !SCHEME.matcher(s.substring(0, c)).matches()) return null;
        Url out = new Url();
        out.scheme = s.substring(0, c).toLowerCase(Locale.ROOT);
        String rest = s.substring(c + 3);
        int end = rest.length();
        for (int i = 0; i < rest.length(); i++) {
            char ch = rest.charAt(i);
            if (ch == '/' || ch == '?' || ch == '#' || ch == '\\') {
                end = i;
                break;
            }
        }
        String authority = rest.substring(0, end);
        int at = authority.lastIndexOf('@');
        if (at >= 0) authority = authority.substring(at + 1);
        String host = authority, port = "";
        int colon = authority.lastIndexOf(':');
        if (colon >= 0 && authority.indexOf(']', colon) < 0) {
            host = authority.substring(0, colon);
            port = authority.substring(colon + 1);
            if (!port.matches("[0-9]{0,5}")) return null;
            if (!port.isEmpty()) port = String.valueOf(Integer.parseInt(port));
        }
        host = host.toLowerCase(Locale.ROOT);
        if (host.isEmpty()) return null;
        if ((out.scheme.equals("https") && port.equals("443")) || (out.scheme.equals("http") && port.equals("80"))) port = "";
        out.host = port.isEmpty() ? host : host + ":" + port;
        String path = rest.substring(end);
        int q = path.length();
        for (int i = 0; i < path.length(); i++) {
            if (path.charAt(i) == '?' || path.charAt(i) == '#') {
                q = i;
                break;
            }
        }
        path = path.substring(0, q).replace('\\', '/');
        out.path = path.isEmpty() ? "/" : path;
        return out;
    }

    private static final Pattern TRAILING_SLASHES = Pattern.compile("/+$");
    private static final Pattern JSON_SEGMENT = Pattern.compile("/[^/]*\\.json$", Pattern.CASE_INSENSITIVE);

    /** §2: trimmed, no trailing '/', no final *.json segment; token path segments kept. */
    public static String baseOf(String url) {
        String u = TRAILING_SLASHES.matcher(Js.trim(Js.text(url))).replaceAll("");
        u = JSON_SEGMENT.matcher(u).replaceAll("");
        return TRAILING_SLASHES.matcher(u).replaceAll("");
    }

    /** §2: the same addon when scheme and host match case-insensitively and the path exactly. */
    public static boolean sameAddon(String a, String b) {
        Url x = parse(baseOf(a)), y = parse(baseOf(b));
        return x != null && y != null && x.scheme.equals(y.scheme) && x.host.equals(y.host) && x.path.equals(y.path);
    }

    /** A link as its host only: links hold their owner's token. */
    public static String redact(String url) {
        Url u = parse(url);
        return u == null ? "(addon)" : u.host;
    }

    private static final Pattern ANY_URL = Pattern.compile("https?://[^" + Js.WS + "'\"<>)]+", Pattern.CASE_INSENSITIVE);

    /** Every link inside a text (an error message, a log line) as its host. */
    public static String scrub(String text) {
        return Js.replace(Js.text(text), ANY_URL, m -> redact(m.group()));
    }

    /**
     * Whether the phone may call this link: https only. Plain http to the device itself
     * (localhost, 127.0.0.1) is only for a debug mock running on the phone, and only when the
     * client is built with allowLocalHttp (the release and the tests never are): on the phone
     * "localhost" is the phone, not the PC, and Android blocks cleartext anyway.
     */
    public static boolean allowed(String url, boolean allowLocalHttp) {
        Url u = parse(url);
        if (u == null) return false;
        // https to the device itself too only for that mock (protocol.md §1; extension audit M8)
        if (u.scheme.equals("https")) return allowLocalHttp || !loopback(u.host);
        if (!allowLocalHttp || !u.scheme.equals("http")) return false;
        String h = u.host.replaceFirst(":[0-9]+$", "");
        return h.equals("localhost") || h.equals("127.0.0.1");
    }

    /**
     * A host (with or without its port) that is this device: localhost and *.localhost (a final dot
     * too), 127.0.0.0/8 and 0.0.0.0 in any form an address parser takes (2130706433, 0x7f000001,
     * 0177.0.0.1, 127.1), and IPv6 ::1, :: and the IPv4-mapped or -compatible forms of those
     * (extension step 2, 6a1acb0). Read as numbers only: nothing is looked up.
     */
    static boolean loopback(String host) {
        String h = host == null ? "" : host.toLowerCase(Locale.ROOT);
        if (h.startsWith("[")) h = h.substring(1, Math.max(1, h.indexOf(']')));
        else if (h.indexOf(':') == h.lastIndexOf(':')) h = h.replaceFirst(":[0-9]+$", "");
        int zone = h.indexOf('%');
        if (zone >= 0) h = h.substring(0, zone);
        while (h.endsWith(".")) h = h.substring(0, h.length() - 1);
        if (h.equals("localhost") || h.endsWith(".localhost")) return true;
        if (h.indexOf(':') >= 0) {
            int[] g = ipv6(h);
            if (g == null) return false;
            for (int i = 0; i < 5; i++) if (g[i] != 0) return false;
            if (g[5] == 0 && g[6] == 0 && (g[7] == 0 || g[7] == 1)) return true;   // :: and ::1
            // ::ffff:a.b.c.d (mapped) and ::a.b.c.d (compatible)
            return (g[5] == 0xffff || g[5] == 0) && thisDevice4((long) g[6] << 16 | g[7]);
        }
        long v = ipv4(h);
        return v >= 0 && thisDevice4(v);
    }

    private static boolean thisDevice4(long v) {
        return v >>> 24 == 127 || v == 0;
    }

    /** An IPv4 address as an address parser reads it (1 to 4 parts, each decimal, 0x hex or 0 octal); -1: not one. */
    static long ipv4(String h) {
        if (h.isEmpty()) return -1;
        String[] p = h.split("\\.", -1);
        if (p.length > 4) return -1;
        long v = 0;
        for (int i = 0; i < p.length; i++) {
            long n = part(p[i]);
            boolean last = i == p.length - 1;
            long max = last ? (1L << (8 * (4 - i))) - 1 : 255;
            if (n < 0 || n > max) return -1;
            v = last ? v << (8 * (4 - i)) | n : v << 8 | n;
        }
        return v;
    }

    private static long part(String s) {
        if (s.isEmpty() || s.length() > 12) return -1;
        int radix = 10;
        if (s.startsWith("0x")) {
            s = s.substring(2);
            radix = 16;
            if (s.isEmpty()) return 0;
        } else if (s.length() > 1 && s.startsWith("0")) {
            s = s.substring(1);
            radix = 8;
        }
        long n = 0;
        for (char c : s.toCharArray()) {
            int d = Character.digit(c, radix);
            if (d < 0) return -1;
            n = n * radix + d;
        }
        return n;
    }

    /** An IPv6 address's eight groups (:: and a final dotted IPv4 read); null: not one. */
    static int[] ipv6(String h) {
        int dbl = h.indexOf("::");
        if (dbl >= 0 && h.indexOf("::", dbl + 1) >= 0) return null;
        List<Integer> head = groups(dbl >= 0 ? h.substring(0, dbl) : h), tail = dbl >= 0 ? groups(h.substring(dbl + 2)) : new ArrayList<>();
        if (head == null || tail == null) return null;
        int n = head.size() + tail.size();
        if (dbl < 0 ? n != 8 : n > 7) return null;
        int[] g = new int[8];
        for (int i = 0; i < head.size(); i++) g[i] = head.get(i);
        for (int i = 0; i < tail.size(); i++) g[8 - tail.size() + i] = tail.get(i);
        return g;
    }

    private static List<Integer> groups(String s) {
        List<Integer> out = new ArrayList<>();
        if (s.isEmpty()) return out;
        String[] p = s.split(":", -1);
        for (int i = 0; i < p.length; i++) {
            if (i == p.length - 1 && p[i].indexOf('.') >= 0) {
                // a final IPv4 part: dotted decimal only, four parts
                if (p[i].split("\\.", -1).length != 4 || !p[i].matches("[0-9.]+")) return null;
                long v = ipv4(p[i]);
                if (v < 0) return null;
                out.add((int) (v >>> 16));
                out.add((int) (v & 0xffff));
                continue;
            }
            if (p[i].isEmpty() || p[i].length() > 4) return null;
            int x = 0;
            for (char c : p[i].toCharArray()) {
                int d = Character.digit(c, 16);
                if (d < 0) return null;
                x = x * 16 + d;
            }
            out.add(x);
        }
        return out;
    }

    /**
     * Where a request ended up after redirects may be called too: [original] was checked before
     * the call, so a link that was already to this device (the debug mock) may stay on it.
     */
    public static boolean redirectAllowed(String original, String landed) {
        Url u = parse(original);
        return allowed(landed, u != null && loopback(u.host));
    }

    // ---- manifest (§2) ----

    public static final class Option {
        public final Object value;
        public final String label;

        Option(Object value, String label) {
            this.value = value;
            this.label = label;
        }
    }

    public static final class Setting {
        public final String key;
        public final Object def;
        public final List<Option> options;

        Setting(String key, Object def, List<Option> options) {
            this.key = key;
            this.def = def;
            this.options = options;
        }
    }

    /** §4a: the /stream budget (BitChord fork's manifest field), defaults 5 a minute, 60 uncached an hour. */
    public static final class Limits {
        public final int streamsPerMinute;
        public final int uncachedPerHour;
        public final String cachedMarker;

        public Limits(int streamsPerMinute, int uncachedPerHour, String cachedMarker) {
            this.streamsPerMinute = streamsPerMinute;
            this.uncachedPerHour = uncachedPerHour;
            this.cachedMarker = cachedMarker;
        }
    }

    public static final Limits DEFAULT_LIMITS = new Limits(5, 60, "cached");

    public static final class Manifest {
        public String id;
        public String name;
        public String version;
        public List<String> resources = new ArrayList<>();
        /** Resources empty or holding "search". */
        public boolean usable;
        public List<Setting> settings = new ArrayList<>();
        /** false: never used for downloads. */
        public boolean allowDownloads;
        /** bitchordAuth: needs the official, signed BitChord app; unsupported. */
        public boolean needsOfficial;
        public Limits limits = DEFAULT_LIMITS;
    }

    /** A manifest read leniently, or null when it isn't one (no id). */
    @SuppressWarnings("unchecked")
    public static Manifest readManifest(Object json) {
        if (!(json instanceof Map)) return null;
        Map<String, Object> j = (Map<String, Object>) json;
        if (Js.blank(Js.text(j.get("id")))) return null;
        Manifest m = new Manifest();
        m.id = Js.text(j.get("id"));
        m.name = Js.text(j.get("name")).isEmpty() ? m.id : Js.text(j.get("name"));
        m.version = Js.text(j.get("version"));
        if (j.get("resources") instanceof List) {
            for (Object r : (List<Object>) j.get("resources")) m.resources.add(Js.text(r).toLowerCase(Locale.ROOT));
        }
        m.usable = m.resources.isEmpty() || m.resources.contains("search");
        m.settings = readSettings(j.get("settings"));
        m.allowDownloads = Js.flag(j.get("allowDownloads"), true);
        m.needsOfficial = Js.flag(j.get("bitchordAuth"), false);
        m.limits = readLimits(j.get("limits"));
        return m;
    }

    /** The settings array: entries with a key, options labelled by their value when unlabelled. */
    @SuppressWarnings("unchecked")
    public static List<Setting> readSettings(Object settings) {
        List<Setting> out = new ArrayList<>();
        if (!(settings instanceof List)) return out;
        for (Object o : (List<Object>) settings) {
            if (!(o instanceof Map)) continue;
            Map<String, Object> s = (Map<String, Object>) o;
            if (Js.text(s.get("key")).isEmpty()) continue;
            List<Option> options = new ArrayList<>();
            if (s.get("options") instanceof List) {
                for (Object x : (List<Object>) s.get("options")) {
                    Object value = x instanceof Map ? ((Map<String, Object>) x).get("value") : null;
                    String label = x instanceof Map ? Js.text(((Map<String, Object>) x).get("label")) : "";
                    options.add(new Option(value, label.isEmpty() ? Js.text(value) : label));
                }
            }
            out.add(new Setting(Js.text(s.get("key")), s.get("default"), options));
        }
        return out;
    }

    @SuppressWarnings("unchecked")
    public static Limits readLimits(Object limits) {
        Map<String, Object> l = limits instanceof Map ? (Map<String, Object>) limits : Collections.<String, Object>emptyMap();
        String marker = Js.trim(Js.text(l.get("cachedMarker")));
        return new Limits(positive(l.get("streamsPerMinute"), DEFAULT_LIMITS.streamsPerMinute),
                positive(l.get("uncachedPerHour"), DEFAULT_LIMITS.uncachedPerHour),
                marker.isEmpty() ? DEFAULT_LIMITS.cachedMarker : marker);
    }

    private static int positive(Object v, int def) {
        Double n = Js.num(v);
        return n != null && n >= 1 ? (int) Math.min(Integer.MAX_VALUE, Math.floor(n)) : def;
    }

    /** §2 discovery: a body with a resources array, or an id plus a name or version. */
    @SuppressWarnings("unchecked")
    public static boolean looksLikeManifest(Object json) {
        if (!(json instanceof Map)) return false;
        Map<String, Object> j = (Map<String, Object>) json;
        return j.get("resources") instanceof List
                || (!Js.text(j.get("id")).isEmpty() && (j.get("name") != null || j.get("version") != null));
    }

    // ---- query parameters (§1) ----

    private static final Pattern LOW_QUALITY = Pattern.compile("low|96|128|min", Pattern.CASE_INSENSITIVE);
    private static final Pattern HIGH_QUALITY = Pattern.compile("high|320|normal|standard", Pattern.CASE_INSENSITIVE);
    /** Hi-Res and CD by name; sample rates only with their unit, so "96 kbps" is never Hi-Res. */
    private static final Pattern WANT_HIRES = Pattern.compile("hi[" + Js.WS + "_-]?res|24[" + Js.WS + "-]?bit|(192|176\\.4|96|88\\.2)[" + Js.WS + "]*k[" + Js.WS + "]*hz", Pattern.CASE_INSENSITIVE);
    private static final Pattern WANT_CD = Pattern.compile("\\bcd\\b|16[" + Js.WS + "-]?bit|44\\.1[" + Js.WS + "]*k[" + Js.WS + "]*hz", Pattern.CASE_INSENSITIVE);
    /** Lossy options never count as Hi-Res or CD. */
    private static final Pattern LOSSY = Pattern.compile("kbps|mp3|aac|opus|vorbis|\\bogg\\b", Pattern.CASE_INSENSITIVE);

    /**
     * §1: each declared setting's default in order, atmos=false in place of a declared atmos
     * setting (ours: stereo, unless the phone's Dolby Atmos switch asks for atmos=true), then
     * quality: the tier's option (or the tier name). An Atmos download asks for the addon's best.
     */
    public static List<String[]> paramsFor(List<Setting> settings, String tier, String picked) {
        return paramsFor(settings, tier, picked, false);
    }

    public static List<String[]> paramsFor(List<Setting> settings, String tier, String picked, boolean atmos) {
        if (tier == null || tier.equals(Pick.DOLBY)) tier = Pick.LOSSLESS;
        List<String[]> out = new ArrayList<>();
        Setting q = null;
        for (Setting s : settings) {
            if (s.key.equals("quality")) {
                if (q == null) q = s;
                continue;
            }
            if (s.key.toLowerCase(Locale.ROOT).equals("atmos")) {
                out.add(new String[]{"atmos", atmos ? "true" : "false"});
                continue;
            }
            if (s.def != null) out.add(new String[]{s.key, Js.text(s.def)});
        }
        Pattern want = tier.equals(Pick.HIRES) ? WANT_HIRES : tier.equals(Pick.CD) ? WANT_CD : null;
        // tiers: LOSSLESS (the addon's best: its first option), HIRES, CD, HIGH, LOW
        String quality = want != null ? Pick.LOSSLESS : tier;
        if (q != null && !q.options.isEmpty()) {
            List<String> vals = new ArrayList<>();
            for (Option o : q.options) vals.add(Js.text(o.value));
            if (tier.equals(Pick.LOSSLESS)) {
                quality = picked != null && vals.contains(picked) ? picked : vals.get(0);
            } else if (want != null) {
                // Hi-Res or CD: the option that names it, else (CD) one called "lossless", else the first
                quality = null;
                for (int i = 0; quality == null && i < vals.size(); i++) {
                    String v = vals.get(i), l = Js.text(q.options.get(i).label);
                    if (!LOSSY.matcher(v).find() && !LOSSY.matcher(l).find() && (want.matcher(v).find() || want.matcher(l).find())) quality = v;
                }
                if (quality == null && tier.equals(Pick.CD)) {
                    for (String v : vals) {
                        if (v.toLowerCase(Locale.ROOT).equals("lossless")) {
                            quality = v;
                            break;
                        }
                    }
                }
                if (quality == null) quality = vals.get(0);
            } else {
                Pattern re = tier.equals(Pick.LOW) ? LOW_QUALITY : HIGH_QUALITY;
                quality = null;
                for (String v : vals) {
                    if (v.toUpperCase(Locale.ROOT).equals(tier)) {
                        quality = v;
                        break;
                    }
                }
                for (int i = 0; quality == null && i < vals.size(); i++) {
                    if (re.matcher(vals.get(i)).find() || re.matcher(Js.text(q.options.get(i).label)).find()) quality = vals.get(i);
                }
                // Low with no low option: the high one, else the last (addons list it as the smallest)
                for (int i = 0; quality == null && tier.equals(Pick.LOW) && i < vals.size(); i++) {
                    if (HIGH_QUALITY.matcher(vals.get(i)).find() || HIGH_QUALITY.matcher(Js.text(q.options.get(i).label)).find()) quality = vals.get(i);
                }
                if (quality == null) quality = tier.equals(Pick.LOW) ? vals.get(vals.size() - 1) : vals.get(0);
            }
        }
        out.add(new String[]{"quality", quality});
        return out;
    }

    public static List<String[]> paramsFor(Manifest m, String tier, String picked) {
        return paramsFor(m, tier, picked, false);
    }

    public static List<String[]> paramsFor(Manifest m, String tier, String picked, boolean atmos) {
        return paramsFor(m == null ? new ArrayList<Setting>() : m.settings, tier, picked, atmos);
    }

    /** k=v pairs percent-encoded as encodeURIComponent does, joined by '&'. */
    public static String qs(List<String[]> pairs) {
        StringBuilder b = new StringBuilder();
        for (String[] p : pairs) {
            if (b.length() > 0) b.append('&');
            b.append(Js.encode(p[0])).append('=').append(Js.encode(p[1]));
        }
        return b.toString();
    }

    public static String manifestUrl(String base) {
        return base + "/manifest.json";
    }

    /** §3: settings, then the song's raw title and artist (when known), then the trimmed query (when not blank). */
    public static String searchUrl(String base, List<String[]> params, TrackMatcher.Target target, String query) {
        List<String[]> all = new ArrayList<>(params);
        // §3: trimmed, each sent only when known (a blank one is not)
        String title = target == null ? "" : Js.trim(Js.text(target.title)), artist = target == null ? "" : Js.trim(Js.text(target.artist));
        if (!title.isEmpty()) all.add(new String[]{"title", title});
        if (!artist.isEmpty()) all.add(new String[]{"artist", artist});
        String q = Js.trim(Js.text(query));
        if (!q.isEmpty()) all.add(new String[]{"q", q});
        return base + "/search?" + qs(all);
    }

    /** §4: the track id percent-encoded as one path segment. */
    public static String streamUrl(String base, String trackId, List<String[]> params) {
        return base + "/stream/" + Js.encode(trackId) + "?" + qs(params);
    }

    // ---- requests (§1) ----

    /** One GET: its link, headers in the order sent, and the whole-call timeout. */
    public static final class Request {
        public final String url;
        public final Map<String, String> headers;
        public final int timeoutMs;
        /** false for the probe: only the status and headers are read. */
        public final boolean readBody;

        Request(String url, Map<String, String> headers, int timeoutMs, boolean readBody) {
            this.url = url;
            this.headers = Collections.unmodifiableMap(headers);
            this.timeoutMs = timeoutMs;
            this.readBody = readBody;
        }
    }

    /** A manifest, search or stream call: Accept: application/json and the browser User-Agent, nothing else. */
    public static Request api(String url) {
        Map<String, String> h = new LinkedHashMap<>();
        h.put("Accept", "application/json");
        h.put("User-Agent", USER_AGENT);
        return new Request(url, h, TIMEOUT_MS, true);
    }

    /**
     * The audio file: the headers the /stream answer supplied, plus Range, Accept-Encoding:
     * identity (a compressed answer's sizes would be the compressed ones) and our User-Agent,
     * which replaces any the addon sent. range may be null (the whole file).
     */
    public static Request audio(String url, Map<String, String> streamHeaders, String range) {
        Map<String, String> h = new LinkedHashMap<>();
        if (streamHeaders != null) {
            for (Map.Entry<String, String> e : streamHeaders.entrySet()) {
                String k = e.getKey().toLowerCase(Locale.ROOT);
                if (k.equals("user-agent") || k.equals("range") || k.equals("accept-encoding")) continue;
                h.put(e.getKey(), e.getValue());
            }
        }
        if (range != null) h.put("Range", range);
        h.put("Accept-Encoding", "identity");
        h.put("User-Agent", USER_AGENT);
        return new Request(url, h, TIMEOUT_MS, true);
    }

    /** §7: the preview check, Range bytes=0-0 with a 4 s timeout; only the headers are read. */
    public static Request probe(String url, Map<String, String> streamHeaders) {
        Request a = audio(url, streamHeaders, "bytes=0-0");
        return new Request(url, new LinkedHashMap<>(a.headers), PROBE_TIMEOUT_MS, false);
    }

    // ---- the /stream answer (§4) ----

    public static final class Stream {
        /** Set when the answer is a miss (no url, an error, encrypted, Atmos not asked for); the rest is then empty. */
        public String miss;
        public String url;
        public String codec;
        /** "file", "hls" or "dash". */
        public String transport;
        public String tier;
        public Double sampleRate;
        public Double bitDepth;
        /** kbps. */
        public Double bitrate;
        public String mimeType;
        public Map<String, String> headers = new LinkedHashMap<>();
        /** The cached marker's flag: it came from the service's cache (no uncached cost). */
        public boolean cached;
        /** Dolby Atmos (only when asked for: an Atmos row with the switch on); tier is then Pick.DOLBY. */
        public boolean atmos;

        static Stream miss(String why) {
            Stream s = new Stream();
            s.miss = why;
            return s;
        }
    }

    private static final Pattern HTTPS = Pattern.compile("^https://", Pattern.CASE_INSENSITIVE);
    private static final Pattern LOCAL_HTTP = Pattern.compile("^http://(127\\.0\\.0\\.1|localhost)(:[0-9]+)?/", Pattern.CASE_INSENSITIVE);
    // whole words as JS's \b sees them (ASCII word characters): "Dashboard" isn't DASH
    private static final Pattern HLS = Pattern.compile("(?<![A-Za-z0-9_])(hls|m3u8)(?![A-Za-z0-9_])|mpegurl", Pattern.CASE_INSENSITIVE);
    private static final Pattern DASH = Pattern.compile("(?<![A-Za-z0-9_])(dash|mpd)(?![A-Za-z0-9_])|dash\\+xml", Pattern.CASE_INSENSITIVE);
    private static final Pattern KHZ = Pattern.compile("([0-9.]+)[" + Js.WS + "]*kHz", Pattern.CASE_INSENSITIVE);
    private static final Pattern BITS = Pattern.compile("([0-9]{1,2})[" + Js.WS + "]*-?bit", Pattern.CASE_INSENSITIVE);
    private static final Pattern KBPS = Pattern.compile("([0-9]{2,4})[" + Js.WS + "]*kbps", Pattern.CASE_INSENSITIVE);
    private static final Pattern AUDIO_EXT = Pattern.compile("\\.(flac|mp3|m4a|aac|ogg|oga|opus|wav|aiff?|alac)$", Pattern.CASE_INSENSITIVE);
    private static final Pattern CONTAINER = Pattern.compile("flac|wav|mp3|aiff");
    private static final Pattern HEADER_NAME = Pattern.compile("[!#$%&'*+.^_`|~0-9A-Za-z-]+");

    private static Object first(Map<String, Object> j, String... keys) {
        for (String k : keys) if (j.get(k) != null) return j.get(k);
        return null;
    }

    /** §4: the stream answer, read leniently. marker: the manifest's cachedMarker. */
    public static Stream readStream(Object json, String marker) {
        return readStream(json, marker, false);
    }

    /** atmosOk: an Atmos answer is taken (an Atmos row, the switch on), marked atmos; else a miss. */
    @SuppressWarnings("unchecked")
    public static Stream readStream(Object json, String marker, boolean atmosOk) {
        Map<String, Object> j = json instanceof Map ? (Map<String, Object>) json : Collections.<String, Object>emptyMap();
        if (marker == null) marker = DEFAULT_LIMITS.cachedMarker;
        String url = Js.trim(Js.text(j.get("url")));
        if (url.isEmpty() || Js.truthy(j.get("error"))) {
            String e = Js.text(j.get("error"));
            return Stream.miss(e.isEmpty() ? "no url" : e);
        }
        // https only, never probed otherwise (plain http to this device: the tests' mock server; the
        // client refuses that too unless the addon itself is local)
        if (!HTTPS.matcher(url).find() && !LOCAL_HTTP.matcher(url).find()) return Stream.miss("not https");
        Object enc = j.get("encrypted");
        String encText = Js.text(enc);
        if (!(Boolean.FALSE.equals(enc) || enc == null || Js.trim(encText).isEmpty()
                || encText.toLowerCase(Locale.ROOT).equals("none") || encText.toLowerCase(Locale.ROOT).equals("false"))) {
            return Stream.miss("encrypted");
        }
        String quality = Js.text(first(j, "quality", "streamQuality", "audioQuality"));
        String atmosText = Js.text(j.get("codec")) + " " + Js.text(j.get("audioMode")) + " " + Js.text(j.get("format")) + " " + quality;
        boolean atmos = Pick.ATMOS.matcher(atmosText).find();
        // an Atmos row whose answer names only its codec (eac3, ac4) is Atmos too
        if (atmosOk && !atmos) atmos = Atmos.mimeOf(Js.text(j.get("codec"))) != null;
        if (atmos && !atmosOk) return Stream.miss("atmos");

        Stream s = new Stream();
        s.atmos = atmos;
        s.url = url;
        // transport: the URL path's extension and the answer's own format fields, never words inside
        // the host, query or a token (a progressive /Dashboard.flac or ?t=..mpd.. is a file)
        Url pu = parse(url);
        String path = pu == null ? "" : pu.path.toLowerCase(Locale.ROOT);
        StringBuilder fields = new StringBuilder();
        for (Object v : new Object[]{j.get("format"), quality, j.get("codec"), j.get("fileCodec"), j.get("container"),
                j.get("containerFormat"), j.get("mimeType"), j.get("manifest"), j.get("mediaType")}) {
            fields.append(Js.text(v)).append(' ');
        }
        s.transport = path.endsWith(".m3u8") || HLS.matcher(fields).find() ? "hls"
                : path.endsWith(".mpd") || DASH.matcher(fields).find() ? "dash" : "file";
        // §4: missing numbers come from the answer's text, never the link (a token or file name
        // with "24bit" or "96khz" in it is not the file's format)
        String allText = fields.toString();
        Double sampleRate = Js.num(j.get("sampleRate"));
        if (sampleRate == null) sampleRate = Js.num(Js.group1(KHZ, allText));
        if (sampleRate != null && sampleRate < 1000) sampleRate *= 1000;
        s.sampleRate = sampleRate;
        Double bitDepth = Js.num(j.get("bitDepth"));
        s.bitDepth = bitDepth != null ? bitDepth : Js.num(Js.group1(BITS, allText));
        s.tier = atmos ? Pick.DOLBY : Pick.tierOf(Js.text(j.get("format")) + " " + quality + " " + Js.text(j.get("codec")));
        Double bitrate = Js.num(j.get("bitrate"));
        if (bitrate == null) bitrate = Js.num(Js.group1(KBPS, allText));
        if (bitrate != null && bitrate > 3000) bitrate /= 1000;
        if (bitrate == null) bitrate = Pick.HIGH.equals(s.tier) ? Double.valueOf(320) : Pick.LOW.equals(s.tier) ? Double.valueOf(128) : null;
        s.bitrate = bitrate;

        // codec, first that applies: stated codec, container, MIME subtype, flac when lossless, an audio extension
        Object codecValue = Js.truthy(j.get("codec")) ? j.get("codec") : j.get("fileCodec");
        String codec = Js.text(codecValue).toLowerCase(Locale.ROOT);
        if (codec.isEmpty()) {
            Object container = Js.truthy(j.get("container")) ? j.get("container") : j.get("containerFormat");
            Matcher cm = CONTAINER.matcher(Js.text(container).toLowerCase(Locale.ROOT));
            codec = cm.find() ? cm.group() : "";
        }
        if (codec.isEmpty()) {
            String mime = Js.text(j.get("mimeType"));
            String[] parts = mime.split("/", -1);
            codec = parts.length > 1 ? parts[1].toLowerCase(Locale.ROOT) : "";
        }
        if (codec.isEmpty() && Pick.LOSSLESS.equals(s.tier)) codec = "flac";
        if (codec.isEmpty()) {
            Url u = parse(url);
            Matcher em = u == null ? null : AUDIO_EXT.matcher(u.path);
            codec = em != null && em.find() ? em.group(1).toLowerCase(Locale.ROOT) : "";
        }
        s.codec = codec.isEmpty() ? null : codec;
        String mime = Js.text(j.get("mimeType"));
        s.mimeType = mime.isEmpty() ? null : mime;

        // the headers the addon wants on the file request: valid names, string or number values; never
        // its User-Agent, Range or Accept-Encoding (one fixed UA, and ours)
        if (j.get("headers") instanceof Map) {
            for (Map.Entry<String, Object> e : ((Map<String, Object>) j.get("headers")).entrySet()) {
                Object v = e.getValue();
                String k = e.getKey().toLowerCase(Locale.ROOT);
                if (k.equals("user-agent") || k.equals("range") || k.equals("accept-encoding")) continue;
                if (HEADER_NAME.matcher(e.getKey()).matches() && (v instanceof String || v instanceof Number)
                        && Js.string(v).indexOf('\r') < 0 && Js.string(v).indexOf('\n') < 0) {
                    s.headers.put(e.getKey(), Js.string(v));
                }
            }
        }
        s.cached = Js.flag(j.get(marker), false);
        return s;
    }

    /** §8: downloads take lossless, or a lossy file over 256 kbps. */
    public static boolean goodForDownload(Stream s) {
        return Pick.LOSSLESS.equals(s.tier) || (s.bitrate != null && s.bitrate > 256);
    }
}
