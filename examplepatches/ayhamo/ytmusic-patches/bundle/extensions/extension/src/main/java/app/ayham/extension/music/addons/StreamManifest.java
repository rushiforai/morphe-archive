package app.ayham.extension.music.addons;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.xml.sax.InputSource;

/**
 * HLS and DASH rows (protocol.md 8.1.5) on the phone. YT's player only builds progressive sources,
 * so the stream's audio is fetched whole into one local file (the init first, then every segment in
 * order) and fitted, played and mixed like any whole file. Never through the audio cache (8.1.6.1).
 * Refused (the next row opens): encrypted (a key not NONE, SAMPLE-AES, ContentProtection), live,
 * more than one init segment or Period, Dolby only on a stereo row, segments it can't read, and a
 * link or redirect off https or to this machine. Requests: the row's headers, 30 s each, 4 at a time,
 * one byte and time budget for the whole stream (the extension's stream-assemble.js, 3dce391).
 * Pure Java: the parsers run in JVM tests.
 */
public final class StreamManifest {
    /** A playlist or manifest bigger than this is not one. */
    static final int MAX_TEXT = 2 << 20;
    static final int MAX_SEGMENTS = 20000;
    /** Each request's own limit (the whole stream has the caller's). */
    static final long REQUEST_MS = 30_000;
    /** Segments fetched at once. */
    static final int PARALLEL = 4;
    /** One segment (or byte range) is read into memory: never this big. */
    static final int MAX_PART = 64 << 20;

    private StreamManifest() {
    }

    /** A stream this phone doesn't play; the message says why (never a link). */
    public static final class Refused extends IOException {
        Refused(String why) {
            super(why);
        }
    }

    /** One byte request: from < 0 is the whole resource, else the inclusive range from..to. */
    static final class Part {
        final String url;
        final long from, to;
        /** Its length in seconds, NaN when not known. */
        final double sec;

        Part(String url, long from, long to, double sec) {
            this.url = url;
            this.from = from;
            this.to = to;
            this.sec = sec;
        }
    }

    /** One audio stream's requests: the init (null when none), then the segments in order. */
    static final class Plan {
        Part init;
        final List<Part> segments = new ArrayList<>();

        void add(Part p) throws Refused {
            if (segments.size() >= MAX_SEGMENTS) throw new Refused("over " + MAX_SEGMENTS + " segments");
            segments.add(p);
        }

        /** One whole file, nothing to join. */
        boolean wholeFile() {
            return init == null && segments.size() == 1 && segments.get(0).from < 0;
        }
    }

    /** A playlist or manifest: its link after redirects (relative links resolve against it) and its text. */
    static final class Text {
        final String url, body;

        Text(String url, String body) {
            this.url = url;
            this.body = body;
        }
    }

    interface Texts {
        Text get(String url) throws IOException;
    }

    /** One byte request's body; throws when the server doesn't answer with it. */
    interface Bytes {
        InputStream open(String url, long from, long to) throws IOException;
    }

    /** Throws to stop the fetch (the song is no longer playing or next). */
    interface Cancel {
        void check() throws IOException;
    }

    // ---- resolving ----

    /** The requests for one audio stream of the HLS playlist or DASH manifest at url (told apart by its text). */
    static Plan resolve(String url, Texts texts, boolean allowLocalHttp) throws IOException {
        return resolve(url, texts, allowLocalHttp, false);
    }

    /**
     * As above; dolby: an Atmos row (the phone's Dolby Atmos switch, protocol.md §3a) keeps Dolby
     * audio, a stereo row passes it over.
     */
    static Plan resolve(String url, Texts texts, boolean allowLocalHttp, boolean dolby) throws IOException {
        check(url, allowLocalHttp);
        Text t = texts.get(url);
        check(t.url, allowLocalHttp);
        String head = stripBom(t.body).trim();
        Plan p;
        if (head.startsWith("#EXTM3U")) p = hls(t.url, t.body, texts, allowLocalHttp, dolby);
        else if (StreamCache.isManifest(head.substring(0, Math.min(head.length(), 4096)).getBytes(StandardCharsets.UTF_8), null))
            p = dash(t.url, t.body, dolby);
        else throw new Refused("not an HLS playlist or a DASH manifest");
        if (p.init != null) check(p.init.url, allowLocalHttp);
        for (Part s : p.segments) check(s.url, allowLocalHttp);
        return p;
    }

    /** The rule every link the phone calls follows (Protocol.allowed). */
    private static void check(String url, boolean allowLocalHttp) throws Refused {
        if (!Protocol.allowed(url, allowLocalHttp)) throw new Refused("a segment link that is not https");
    }

    private static String stripBom(String s) {
        return s != null && s.startsWith("﻿") ? s.substring(1) : s == null ? "" : s;
    }

    // ---- HLS ----

    private static List<String> lines(String body) {
        List<String> out = new ArrayList<>();
        for (String l : stripBom(body).split("\r?\n|\r")) {
            l = l.trim();
            if (!l.isEmpty()) out.add(l);
        }
        return out;
    }

    private static boolean master(List<String> lines) {
        for (String l : lines) if (l.startsWith("#EXT-X-STREAM-INF") || l.startsWith("#EXT-X-MEDIA:")) return true;
        return false;
    }

    static Plan hls(String url, String body, Texts texts, boolean allowLocalHttp) throws IOException {
        return hls(url, body, texts, allowLocalHttp, false);
    }

    static Plan hls(String url, String body, Texts texts, boolean allowLocalHttp, boolean dolby) throws IOException {
        List<String> ls = lines(body);
        if (ls.isEmpty() || !ls.get(0).startsWith("#EXTM3U")) throw new Refused("HLS: not a playlist");
        for (String l : ls) if (l.startsWith("#EXT-X-SESSION-KEY:") && encrypted(attrs(l)))
            throw new Refused("HLS: encrypted (" + attrs(l).get("METHOD") + "), not played");
        if (!master(ls)) return hlsMedia(url, ls);
        String media = pickAudio(url, ls, dolby);
        check(media, allowLocalHttp);
        Text t = texts.get(media);
        check(t.url, allowLocalHttp);
        List<String> ml = lines(t.body);
        if (ml.isEmpty() || !ml.get(0).startsWith("#EXTM3U")) throw new Refused("HLS: the audio playlist is not a playlist");
        if (master(ml)) throw new Refused("HLS: a master playlist inside a master playlist");
        return hlsMedia(t.url, ml);
    }

    private static final Pattern VIDEO_CODEC = Pattern.compile("^(avc[1-4]|hvc1|hev1|vp0?[89]|vp09|av01|dvh[1e]|dva[1v]|mp4v)", Pattern.CASE_INSENSITIVE);
    private static final Pattern AUDIO_CODEC = Pattern.compile("^(mp4a|flac|alac|opus|ac-3|ec-3|ac-4|mhm1|mha1|dts[a-z]|mp3|vorbis|\\.mp3)", Pattern.CASE_INSENSITIVE);

    private static boolean hasVideo(Map<String, String> v) {
        if (v.containsKey("RESOLUTION")) return true;
        for (String c : codecs(v.get("CODECS"))) if (VIDEO_CODEC.matcher(c).find()) return true;
        return false;
    }

    /** Every codec named, and all of them audio ones. */
    private static boolean audioCodecs(String codecs) {
        List<String> cs = codecs(codecs);
        if (cs.isEmpty()) return false;
        for (String c : cs) if (!AUDIO_CODEC.matcher(c).find()) return false;
        return true;
    }

    /** Dolby (AC-3, E-AC-3 / Atmos, AC-4); mp4a.a5 / a6 are AC-3 and E-AC-3 too. */
    private static final Pattern DOLBY = Pattern.compile("^(ac-3|ec-3|ac-4|eac3|ac3|mp4a\\.a[56])\\b", Pattern.CASE_INSENSITIVE);

    /** A codecs list whose audio is all Dolby (no list: not known, so not passed over). */
    static boolean dolbyOnly(String codecs) {
        boolean any = false;
        for (String c : codecs(codecs)) {
            if (VIDEO_CODEC.matcher(c).find()) continue;
            if (!DOLBY.matcher(c).find()) return false;
            any = true;
        }
        return any;
    }

    private static boolean encrypted(Map<String, String> a) {
        String m = a.get("METHOD");
        return m != null && !m.equalsIgnoreCase("NONE");
    }

    private static List<String> codecs(String codecs) {
        List<String> out = new ArrayList<>();
        if (codecs != null) for (String c : codecs.split(",")) if (!c.trim().isEmpty()) out.add(c.trim());
        return out;
    }

    /**
     * The audio playlist of a master playlist: the best audio-only variant by BANDWIDTH (stated audio
     * codecs first); when the variants are video, an audio rendition (EXT-X-MEDIA) with its own URI,
     * from the best variant's group, DEFAULT=YES first.
     */
    static String pickAudio(String url, List<String> ls) throws Refused {
        return pickAudio(url, ls, false);
    }

    /** As above; without dolby, Dolby-only variants and renditions are passed over. */
    static String pickAudio(String url, List<String> ls, boolean dolby) throws Refused {
        List<Map<String, String>> variants = new ArrayList<>(), renditions = new ArrayList<>();
        boolean dolbySeen = false;
        for (int i = 0; i < ls.size(); i++) {
            String l = ls.get(i);
            if (l.startsWith("#EXT-X-STREAM-INF:")) {
                Map<String, String> v = attrs(l);
                for (int j = i + 1; j < ls.size(); j++) {
                    if (ls.get(j).startsWith("#")) continue;
                    v.put("URI", ls.get(j));
                    i = j;
                    break;
                }
                if (!v.containsKey("URI")) continue;
                if (!dolby && dolbyOnly(v.get("CODECS"))) dolbySeen = true;
                else variants.add(v);
            } else if (l.startsWith("#EXT-X-MEDIA:")) {
                Map<String, String> m = attrs(l);
                if (!"AUDIO".equalsIgnoreCase(m.get("TYPE")) || m.get("URI") == null || m.get("URI").isEmpty()) continue;
                if (!dolby && dolbyOnly(m.get("CODECS"))) dolbySeen = true;
                else renditions.add(m);
            }
        }
        Map<String, String> best = null;
        for (Map<String, String> v : variants) {
            if (hasVideo(v)) continue;
            if (best == null) {
                best = v;
                continue;
            }
            boolean a = audioCodecs(v.get("CODECS")), b = audioCodecs(best.get("CODECS"));
            if (a != b ? a : bandwidth(v) > bandwidth(best)) best = v;
        }
        if (best != null) return resolveUrl(url, best.get("URI"));
        if (renditions.isEmpty()) throw new Refused(dolbySeen ? "HLS: Dolby audio only" : "HLS: no audio-only stream");
        // the group the best (video) variant plays with
        Map<String, String> top = null;
        for (Map<String, String> v : variants) if (v.get("AUDIO") != null && (top == null || bandwidth(v) > bandwidth(top))) top = v;
        List<Map<String, String>> pool = new ArrayList<>();
        if (top != null) for (Map<String, String> m : renditions) if (top.get("AUDIO").equals(m.get("GROUP-ID"))) pool.add(m);
        if (pool.isEmpty()) pool = renditions;
        Map<String, String> pick = pool.get(0);
        for (Map<String, String> m : pool) if ("YES".equalsIgnoreCase(m.get("DEFAULT"))) {
            pick = m;
            break;
        }
        return resolveUrl(url, pick.get("URI"));
    }

    private static long bandwidth(Map<String, String> v) {
        return parseLong(v.get("BANDWIDTH"), 0);
    }

    /** A tag's attribute list (KEY=value, KEY="quoted, with commas"). */
    static Map<String, String> attrs(String line) {
        Map<String, String> out = new HashMap<>();
        int c = line.indexOf(':');
        if (c < 0) return out;
        String s = line.substring(c + 1);
        int i = 0;
        while (i < s.length()) {
            int eq = s.indexOf('=', i);
            if (eq < 0) break;
            String key = s.substring(i, eq).trim().toUpperCase(Locale.ROOT);
            String val;
            int next;
            if (eq + 1 < s.length() && s.charAt(eq + 1) == '"') {
                int end = s.indexOf('"', eq + 2);
                if (end < 0) end = s.length();
                val = s.substring(eq + 2, end);
                next = s.indexOf(',', end);
            } else {
                next = s.indexOf(',', eq + 1);
                val = s.substring(eq + 1, next < 0 ? s.length() : next).trim();
            }
            out.put(key, val);
            if (next < 0) break;
            i = next + 1;
        }
        return out;
    }

    static Plan hlsMedia(String url, List<String> ls) throws Refused {
        Plan p = new Plan();
        boolean ended = false;
        double sec = Double.NaN;
        long[] range = null;
        Map<String, Long> nextAt = new HashMap<>();
        for (String l : ls) {
            if (l.startsWith("#EXT-X-ENDLIST")) ended = true;
            else if (l.startsWith("#EXT-X-KEY:") || l.startsWith("#EXT-X-SESSION-KEY:")) {
                String method = attrs(l).get("METHOD");
                if (method != null && !method.equalsIgnoreCase("NONE")) throw new Refused("HLS: encrypted (" + method + "), not played");
            } else if (l.startsWith("#EXT-X-MAP:")) {
                Map<String, String> a = attrs(l);
                if (a.get("URI") == null) throw new Refused("HLS: an init with no link");
                long[] r = a.get("BYTERANGE") != null ? byteRange(a.get("BYTERANGE"), 0L) : null;
                Part init = new Part(resolveUrl(url, a.get("URI")), r == null ? -1 : r[0], r == null ? -1 : r[1], Double.NaN);
                if (p.init != null && !(p.init.url.equals(init.url) && p.init.from == init.from && p.init.to == init.to))
                    throw new Refused("HLS: more than one init segment");
                p.init = init;
            } else if (l.startsWith("#EXTINF:")) {
                String v = l.substring(8);
                int comma = v.indexOf(',');
                sec = parseDouble(comma < 0 ? v : v.substring(0, comma));
            } else if (l.startsWith("#EXT-X-BYTERANGE:")) {
                String v = l.substring(17).trim();
                range = byteRange(v, null);
            } else if (!l.startsWith("#")) {
                String u = resolveUrl(url, l);
                long from = -1, to = -1;
                if (range != null) {
                    from = range[0] >= 0 ? range[0] : nextAt.containsKey(u) ? nextAt.get(u) : 0;
                    to = from + range[1] - 1;
                    nextAt.put(u, to + 1);
                }
                p.add(new Part(u, from, to, sec));
                sec = Double.NaN;
                range = null;
            }
        }
        if (!ended) throw new Refused("HLS: a live playlist (no end), not played");
        if (p.segments.isEmpty()) throw new Refused("HLS: no segments");
        return p;
    }

    /** "n@o" as {o, n} (o -1 when not given and no default); for the MAP, {from, to}. */
    private static long[] byteRange(String v, Long defaultOffset) throws Refused {
        int at = v.indexOf('@');
        long n = parseLong(at < 0 ? v : v.substring(0, at), -1);
        long o = at < 0 ? (defaultOffset != null ? defaultOffset : -1) : parseLong(v.substring(at + 1), -1);
        if (n <= 0 || (at >= 0 && o < 0)) throw new Refused("HLS: a bad byte range");
        if (defaultOffset != null) return new long[]{o, o + n - 1};
        return new long[]{o, n};
    }

    // ---- DASH ----

    static Plan dash(String url, String body) throws Refused {
        return dash(url, body, false);
    }

    static Plan dash(String url, String body, boolean dolby) throws Refused {
        Document d = parseXml(body);
        Element mpd = d.getDocumentElement();
        if (mpd == null || !"MPD".equals(local(mpd))) throw new Refused("DASH: not a manifest");
        if ("dynamic".equalsIgnoreCase(mpd.getAttribute("type"))) throw new Refused("DASH: a live manifest, not played");
        List<Element> periods = children(mpd, "Period");
        if (periods.isEmpty()) throw new Refused("DASH: no period");
        if (periods.size() > 1) throw new Refused("DASH: " + periods.size() + " periods (only a single-period manifest plays)");
        Element period = periods.get(0);
        // the audio: the Representation with the highest bandwidth over the audio AdaptationSets;
        // protected ones and (on a stereo row) Dolby ones passed over
        Element as = null, rep = null;
        long bw = -1;
        boolean protectedSeen = false, dolbySeen = false;
        for (Element a : children(period, "AdaptationSet")) {
            for (Element r : children(a, "Representation")) {
                if (!audio(a, r)) continue;
                if (!children(a, "ContentProtection").isEmpty() || !children(r, "ContentProtection").isEmpty()) {
                    protectedSeen = true;
                    continue;
                }
                if (!dolby && dolbyOnly(r.getAttribute("codecs").isEmpty() ? a.getAttribute("codecs") : r.getAttribute("codecs"))) {
                    dolbySeen = true;
                    continue;
                }
                long b = parseLong(r.getAttribute("bandwidth"), 0);
                if (b > bw) {
                    bw = b;
                    as = a;
                    rep = r;
                }
            }
        }
        if (rep == null) throw new Refused(protectedSeen ? "DASH: encrypted, not played" : dolbySeen ? "DASH: Dolby audio only" : "DASH: no audio");
        String base = url;
        for (Element e : new Element[]{mpd, period, as, rep}) base = baseUrl(base, e);
        double periodSec = parseIsoDuration(period.getAttribute("duration"));
        if (Double.isNaN(periodSec)) {
            double all = parseIsoDuration(mpd.getAttribute("mediaPresentationDuration"));
            double start = parseIsoDuration(period.getAttribute("start"));
            periodSec = Double.isNaN(all) ? Double.NaN : all - (Double.isNaN(start) ? 0 : start);
        }
        String repId = rep.getAttribute("id");
        Element[] levels = {period, as, rep};
        // the most specific level that says how it is segmented decides the kind
        String kind = null;
        for (int i = levels.length - 1; i >= 0 && kind == null; i--) {
            for (String k : new String[]{"SegmentTemplate", "SegmentList", "SegmentBase"}) {
                if (!children(levels[i], k).isEmpty()) {
                    kind = k;
                    break;
                }
            }
        }
        Plan p = new Plan();
        if ("SegmentTemplate".equals(kind)) template(p, chain(levels, "SegmentTemplate"), base, repId, bw, periodSec);
        else if ("SegmentList".equals(kind)) segmentList(p, chain(levels, "SegmentList"), base, periodSec);
        else p.add(new Part(base, -1, -1, periodSec));   // SegmentBase or a BaseURL alone: the whole file
        if (p.segments.isEmpty()) throw new Refused("DASH: no segments");
        return p;
    }

    private static boolean audio(Element as, Element rep) {
        String mime = (rep.getAttribute("mimeType").isEmpty() ? as.getAttribute("mimeType") : rep.getAttribute("mimeType")).toLowerCase(Locale.ROOT);
        if (mime.startsWith("video/")) return false;
        if ("audio".equalsIgnoreCase(as.getAttribute("contentType")) || mime.startsWith("audio/")) return true;
        for (Element c : children(as, "ContentComponent")) if ("audio".equalsIgnoreCase(c.getAttribute("contentType"))) return true;
        String codecs = rep.getAttribute("codecs").isEmpty() ? as.getAttribute("codecs") : rep.getAttribute("codecs");
        return audioCodecs(codecs);
    }

    /** The elements named kind at each level, most specific first (their attributes inherit downwards). */
    private static List<Element> chain(Element[] levels, String kind) {
        List<Element> out = new ArrayList<>();
        for (int i = levels.length - 1; i >= 0; i--) {
            List<Element> c = children(levels[i], kind);
            if (!c.isEmpty()) out.add(c.get(0));
        }
        return out;
    }

    private static String attr(List<Element> chain, String name) {
        for (Element e : chain) if (e.hasAttribute(name) && !e.getAttribute(name).isEmpty()) return e.getAttribute(name);
        return "";
    }

    private static Element child(List<Element> chain, String name) {
        for (Element e : chain) {
            List<Element> c = children(e, name);
            if (!c.isEmpty()) return c.get(0);
        }
        return null;
    }

    private static void template(Plan p, List<Element> ts, String base, String repId, long bw, double periodSec) throws Refused {
        long timescale = Math.max(1, parseLong(attr(ts, "timescale"), 1));
        String media = attr(ts, "media");
        if (media.isEmpty()) throw new Refused("DASH: a template with no media");
        String init = attr(ts, "initialization");
        if (init.isEmpty()) {
            Element i = child(ts, "Initialization");
            if (i != null) init = i.getAttribute("sourceURL");
        }
        long start = parseLong(attr(ts, "startNumber"), 1);
        if (!init.isEmpty()) p.init = new Part(resolveUrl(base, fill(init, repId, start, 0, bw)), -1, -1, Double.NaN);
        Element timeline = child(ts, "SegmentTimeline");
        if (timeline != null) {
            List<Element> ss = children(timeline, "S");
            long t = 0, number = start;
            for (int i = 0; i < ss.size(); i++) {
                Element s = ss.get(i);
                if (s.hasAttribute("t")) t = parseLong(s.getAttribute("t"), t);
                long d = parseLong(s.getAttribute("d"), 0);
                if (d <= 0) throw new Refused("DASH: a timeline entry with no length");
                long r = parseLong(s.getAttribute("r"), 0);
                if (r < 0) {
                    // to the next entry's start, or to the period's end
                    long end;
                    if (i + 1 < ss.size() && ss.get(i + 1).hasAttribute("t")) end = parseLong(ss.get(i + 1).getAttribute("t"), t);
                    else if (!Double.isNaN(periodSec)) end = Math.round(periodSec * timescale);
                    else throw new Refused("DASH: no length");
                    r = (end - t + d - 1) / d - 1;
                }
                if (p.segments.size() + r + 1 > MAX_SEGMENTS) throw new Refused("over " + MAX_SEGMENTS + " segments");
                for (long k = 0; k <= r; k++) {
                    p.add(new Part(resolveUrl(base, fill(media, repId, number, t, bw)), -1, -1, d / (double) timescale));
                    t += d;
                    number++;
                }
            }
            return;
        }
        long dur = parseLong(attr(ts, "duration"), 0);
        if (dur <= 0) throw new Refused("DASH: a template with no duration or timeline");
        if (Double.isNaN(periodSec)) throw new Refused("DASH: no length");
        long count = (long) Math.ceil(periodSec * timescale / dur - 1e-9);
        long endNumber = parseLong(attr(ts, "endNumber"), -1);
        if (endNumber >= start) count = Math.min(count, endNumber - start + 1);
        if (count > MAX_SEGMENTS) throw new Refused("over " + MAX_SEGMENTS + " segments");
        for (long k = 0; k < count; k++) {
            double sec = Math.min(dur, periodSec * timescale - k * dur) / timescale;
            p.add(new Part(resolveUrl(base, fill(media, repId, start + k, k * dur, bw)), -1, -1, sec));
        }
    }

    private static void segmentList(Plan p, List<Element> ls, String base, double periodSec) throws Refused {
        long timescale = Math.max(1, parseLong(attr(ls, "timescale"), 1));
        long dur = parseLong(attr(ls, "duration"), 0);
        Element init = child(ls, "Initialization");
        if (init != null) {
            String src = init.getAttribute("sourceURL");
            long[] r = range(init.getAttribute("range"));
            p.init = new Part(src.isEmpty() ? base : resolveUrl(base, src), r[0], r[1], Double.NaN);
        }
        Element list = ls.get(0);
        for (Element e : ls) if (!children(e, "SegmentURL").isEmpty()) {
            list = e;
            break;
        }
        for (Element su : children(list, "SegmentURL")) {
            String m = su.getAttribute("media");
            long[] r = range(su.getAttribute("mediaRange"));
            p.add(new Part(m.isEmpty() ? base : resolveUrl(base, m), r[0], r[1], dur > 0 ? dur / (double) timescale : Double.NaN));
        }
    }

    /** "a-b" as {a, b}; {-1, -1} when blank. */
    private static long[] range(String v) throws Refused {
        if (v == null || v.trim().isEmpty()) return new long[]{-1, -1};
        String[] ab = v.trim().split("-");
        long a = ab.length == 2 ? parseLong(ab[0], -1) : -1, b = ab.length == 2 ? parseLong(ab[1], -1) : -1;
        if (a < 0 || b < a) throw new Refused("DASH: a bad byte range");
        return new long[]{a, b};
    }

    private static final Pattern TOKEN_FORMAT = Pattern.compile("%0?(\\d*)d");

    /** A SegmentTemplate's $RepresentationID$, $Number$, $Time$, $Bandwidth$ (with %0Nd widths) and $$. */
    static String fill(String template, String repId, long number, long time, long bandwidth) {
        StringBuilder out = new StringBuilder();
        int i = 0;
        while (i < template.length()) {
            char c = template.charAt(i);
            int j = c == '$' ? template.indexOf('$', i + 1) : -1;
            if (c != '$' || j < 0) {
                out.append(c);
                i++;
                continue;
            }
            String tok = template.substring(i + 1, j);
            i = j + 1;
            if (tok.isEmpty()) {
                out.append('$');
                continue;
            }
            int pc = tok.indexOf('%');
            String name = pc < 0 ? tok : tok.substring(0, pc), fmt = pc < 0 ? null : tok.substring(pc);
            switch (name) {
                case "RepresentationID":
                    out.append(repId);
                    break;
                case "Number":
                    out.append(number(number, fmt));
                    break;
                case "Time":
                    out.append(number(time, fmt));
                    break;
                case "Bandwidth":
                    out.append(number(bandwidth, fmt));
                    break;
                default:
                    out.append('$').append(tok).append('$');
            }
        }
        return out.toString();
    }

    private static String number(long v, String fmt) {
        Matcher m = fmt == null ? null : TOKEN_FORMAT.matcher(fmt);
        if (m == null || !m.matches() || m.group(1).isEmpty()) return String.valueOf(v);
        return String.format(Locale.ROOT, "%0" + Integer.parseInt(m.group(1)) + "d", v);
    }

    private static String baseUrl(String base, Element e) {
        List<Element> b = children(e, "BaseURL");
        if (b.isEmpty()) return base;
        String t = b.get(0).getTextContent();
        return t == null || t.trim().isEmpty() ? base : resolveUrl(base, t.trim());
    }

    private static Document parseXml(String body) throws Refused {
        try {
            DocumentBuilderFactory f = DocumentBuilderFactory.newInstance();
            f.setNamespaceAware(true);
            f.setExpandEntityReferences(false);
            // no external entities or DTDs; Android's parser may not know every feature
            for (String feature : new String[]{"http://xml.org/sax/features/external-general-entities",
                    "http://xml.org/sax/features/external-parameter-entities",
                    "http://apache.org/xml/features/nonvalidating/load-external-dtd"}) {
                try {
                    f.setFeature(feature, false);
                } catch (Throwable ignored) {
                }
            }
            try {
                f.setFeature(javax.xml.XMLConstants.FEATURE_SECURE_PROCESSING, true);
            } catch (Throwable ignored) {
            }
            try {
                f.setXIncludeAware(false);
            } catch (Throwable ignored) {
            }
            DocumentBuilder b = f.newDocumentBuilder();
            b.setEntityResolver((publicId, systemId) -> new InputSource(new StringReader("")));
            b.setErrorHandler(new org.xml.sax.ErrorHandler() {
                @Override
                public void warning(org.xml.sax.SAXParseException e) {
                }

                @Override
                public void error(org.xml.sax.SAXParseException e) {
                }

                @Override
                public void fatalError(org.xml.sax.SAXParseException e) throws org.xml.sax.SAXException {
                    throw e;
                }
            });
            return b.parse(new InputSource(new StringReader(stripBom(body))));
        } catch (Exception e) {
            throw new Refused("DASH: the manifest doesn't parse");
        }
    }

    private static String local(Node n) {
        String l = n.getLocalName();
        return l != null ? l : n.getNodeName();
    }

    private static List<Element> children(Element e, String name) {
        List<Element> out = new ArrayList<>();
        for (Node n = e.getFirstChild(); n != null; n = n.getNextSibling())
            if (n.getNodeType() == Node.ELEMENT_NODE && name.equals(local(n))) out.add((Element) n);
        return out;
    }

    private static final Pattern ISO_DURATION = Pattern.compile(
            "^P(?:([\\d.]+)Y)?(?:([\\d.]+)M)?(?:([\\d.]+)W)?(?:([\\d.]+)D)?(?:T(?:([\\d.]+)H)?(?:([\\d.]+)M)?(?:([\\d.]+)S)?)?$");

    /** An xs:duration (PT3M25.5S) in seconds; NaN when blank or not one. */
    static double parseIsoDuration(String v) {
        if (v == null) return Double.NaN;
        Matcher m = ISO_DURATION.matcher(v.trim());
        if (v.trim().length() < 2 || !m.matches()) return Double.NaN;
        double[] unit = {365 * 86400.0, 30 * 86400.0, 7 * 86400.0, 86400, 3600, 60, 1};
        double s = 0;
        for (int i = 0; i < unit.length; i++) {
            if (m.group(i + 1) == null) continue;
            double x = parseDouble(m.group(i + 1));
            if (Double.isNaN(x)) return Double.NaN;
            s += x * unit[i];
        }
        return s;
    }

    // ---- links and numbers ----

    private static final Pattern ABSOLUTE = Pattern.compile("^[a-zA-Z][a-zA-Z0-9+.-]*:");

    /** ref against base (RFC 3986 reference resolution, enough for playlists and manifests). */
    static String resolveUrl(String base, String ref) {
        ref = ref.trim();
        if (ABSOLUTE.matcher(ref).find()) return ref;
        int sc = base.indexOf("://");
        if (sc < 0) return ref;
        String scheme = base.substring(0, sc);
        int authEnd = sc + 3;
        while (authEnd < base.length() && "/?#".indexOf(base.charAt(authEnd)) < 0) authEnd++;
        String origin = base.substring(0, authEnd);
        if (ref.startsWith("//")) return scheme + ":" + ref;
        int qf = authEnd;
        while (qf < base.length() && "?#".indexOf(base.charAt(qf)) < 0) qf++;
        String basePath = base.substring(authEnd, qf);
        if (ref.isEmpty()) return base.substring(0, qf) + (qf < base.length() && base.charAt(qf) == '?' ? stripFragment(base.substring(qf)) : "");
        if (ref.startsWith("#")) return stripFragment(base);
        if (ref.startsWith("?")) return origin + basePath + ref;
        int rq = ref.length();
        for (int i = 0; i < ref.length(); i++) if (ref.charAt(i) == '?' || ref.charAt(i) == '#') {
            rq = i;
            break;
        }
        String refPath = ref.substring(0, rq), tail = ref.substring(rq);
        String path = refPath.startsWith("/") ? refPath
                : (basePath.isEmpty() ? "/" : basePath.substring(0, basePath.lastIndexOf('/') + 1)) + refPath;
        return origin + removeDots(path) + tail;
    }

    private static String stripFragment(String s) {
        int h = s.indexOf('#');
        return h < 0 ? s : s.substring(0, h);
    }

    private static String removeDots(String path) {
        String[] segs = path.split("/", -1);
        List<String> out = new ArrayList<>();
        for (int i = 0; i < segs.length; i++) {
            String s = segs[i];
            boolean last = i == segs.length - 1;
            if (s.equals(".")) {
                if (last) out.add("");
            } else if (s.equals("..")) {
                if (out.size() > 1) out.remove(out.size() - 1);
                if (last) out.add("");
            } else out.add(s);
        }
        String r = String.join("/", out);
        return r.startsWith("/") ? r : "/" + r;
    }

    private static long parseLong(String v, long otherwise) {
        if (v == null) return otherwise;
        try {
            return Long.parseLong(v.trim());
        } catch (NumberFormatException e) {
            return otherwise;
        }
    }

    private static double parseDouble(String v) {
        try {
            return Double.parseDouble(v.trim());
        } catch (RuntimeException e) {
            return Double.NaN;
        }
    }

    // ---- fetching ----

    /** The phone's own requests: the row's headers (Protocol.audio) on every playlist, manifest and segment. */
    static Texts httpTexts(Map<String, String> headers) {
        return url -> {
            HttpURLConnection h = HttpTransport.open(Protocol.audio(url, headers, null));
            h.setReadTimeout(30_000);
            try {
                int code = h.getResponseCode();
                if (code != 200) throw new IOException("manifest: HTTP " + code);
                ByteArrayOutputStream out = new ByteArrayOutputStream();
                try (InputStream in = h.getInputStream()) {
                    byte[] b = new byte[16 * 1024];
                    for (int n; (n = in.read(b)) > 0; ) {
                        out.write(b, 0, n);
                        if (out.size() > MAX_TEXT) throw new Refused("a manifest over 2 MB");
                    }
                }
                return new Text(h.getURL().toString(), new String(out.toByteArray(), StandardCharsets.UTF_8));
            } finally {
                h.disconnect();
            }
        };
    }

    static Bytes httpBytes(Map<String, String> headers) {
        return httpBytes(headers, false);
    }

    /** Every segment's link after redirects is checked too (off https or to this machine: refused). */
    static Bytes httpBytes(Map<String, String> headers, boolean allowLocalHttp) {
        return (url, from, to) -> {
            check(url, allowLocalHttp);
            HttpURLConnection h = HttpTransport.open(Protocol.audio(url, headers, from >= 0 ? "bytes=" + from + "-" + to : null));
            h.setConnectTimeout((int) REQUEST_MS);
            h.setReadTimeout((int) REQUEST_MS);
            int code;
            InputStream in;
            try {
                code = h.getResponseCode();
                if (!Protocol.allowed(h.getURL().toString(), allowLocalHttp)) throw new Refused("a segment was redirected off https");
                if (code != 200 && code != 206) throw new IOException("segment: HTTP " + code);
                // a part answer must be the range asked for (its length is checked as it is read)
                if (from >= 0 && code == 206 && !rangeAnswered(h.getHeaderField("Content-Range"), from, to))
                    throw new IOException("segment: another range was sent (" + h.getHeaderField("Content-Range") + ")");
                in = h.getInputStream();
            } catch (IOException e) {
                h.disconnect();
                throw e;
            }
            InputStream body = new FilterInputStream(in) {
                @Override
                public void close() throws IOException {
                    try {
                        super.close();
                    } finally {
                        h.disconnect();
                    }
                }
            };
            // a server that ignores the range sends the whole file: the range is cut out of it
            if (from >= 0 && code == 200) return slice(body, from, to - from + 1);
            return body;
        };
    }

    /**
     * A 206's Content-Range is bytes from-to/total for the range asked: its start and end those, and
     * its total (when known) past the end (extension step 2, HLS byte ranges).
     */
    static boolean rangeAnswered(String contentRange, long from, long to) {
        if (contentRange == null) return false;
        java.util.regex.Matcher m = java.util.regex.Pattern.compile("(?i)\\s*bytes\\s+(\\d+)-(\\d+)/(\\d+|\\*)\\s*").matcher(contentRange);
        if (!m.matches()) return false;
        try {
            long a = Long.parseLong(m.group(1)), b = Long.parseLong(m.group(2));
            return a == from && b == to && (m.group(3).equals("*") || Long.parseLong(m.group(3)) > b);
        } catch (NumberFormatException e) {
            return false;
        }
    }

    private static InputStream slice(InputStream in, long skip, long len) throws IOException {
        for (long left = skip; left > 0; ) {
            long n = in.skip(left);
            if (n <= 0) {
                if (in.read() < 0) {
                    in.close();
                    throw new IOException("segment ended early");
                }
                n = 1;
            }
            left -= n;
        }
        return new FilterInputStream(in) {
            long left = len;

            @Override
            public int read() throws IOException {
                if (left <= 0) return -1;
                int b = super.read();
                if (b >= 0) left--;
                return b;
            }

            @Override
            public int read(byte[] b, int off, int n) throws IOException {
                if (left <= 0) return -1;
                int r = super.read(b, off, (int) Math.min(n, left));
                if (r > 0) left -= r;
                return r;
            }
        };
    }

    /** What a fetch made: the file, its segment count and the time it took. */
    static final class Got {
        File file;
        int segments;
        long ms;
    }

    /**
     * Fetches the plan into dir/name.ext (via name.part; nothing is left behind on a failure). ext
     * from the first bytes. Fragmented MP4 gets a segment index (sidx) after its init, so the player
     * can seek in it; MPEG-TS and packed audio are joined as they are.
     */
    static Got fetch(Plan plan, Bytes bytes, File dir, String name, long maxBytes, long maxMs, Cancel cancel) throws IOException {
        long t0 = System.nanoTime();
        long until = t0 / 1_000_000 + maxMs;
        //noinspection ResultOfMethodCallIgnored
        dir.mkdirs();
        File part = new File(dir, name + ".part");
        //noinspection ResultOfMethodCallIgnored
        part.delete();
        Budget budget = new Budget(maxBytes, until, cancel);
        String ext;
        boolean done = false;
        try {
            if (plan.wholeFile()) ext = whole(plan.segments.get(0), bytes, part, budget);
            else ext = joined(plan, bytes, part, budget);
            done = true;
        } finally {
            if (!done) //noinspection ResultOfMethodCallIgnored
                part.delete();
        }
        File out = new File(dir, name + "." + ext);
        if (out.exists() && !out.delete()) {
            //noinspection ResultOfMethodCallIgnored
            part.delete();
            throw new IOException("could not replace the file");
        }
        if (!part.renameTo(out)) {
            //noinspection ResultOfMethodCallIgnored
            part.delete();
            throw new IOException("could not keep the file");
        }
        Got g = new Got();
        g.file = out;
        g.segments = plan.segments.size();
        g.ms = (System.nanoTime() - t0) / 1_000_000;
        return g;
    }

    /** The caps every fetch keeps: bytes, wall time, and whether the song is still wanted. */
    private static final class Budget {
        final long maxBytes, until;
        final Cancel cancel;
        long total;

        Budget(long maxBytes, long until, Cancel cancel) {
            this.maxBytes = maxBytes;
            this.until = until;
            this.cancel = cancel;
        }

        synchronized void add(long n) throws IOException {
            total += n;
            if (total > maxBytes) throw new IOException("over " + (maxBytes >> 20) + " MB");
            if (System.nanoTime() / 1_000_000 > until) throw new IOException("fetch over the time allowed");
            if (cancel != null) cancel.check();
        }
    }

    private static String whole(Part p, Bytes bytes, File part, Budget budget) throws IOException {
        byte[] head = new byte[1 << 16];
        int headN = 0;
        long until = Math.min(budget.until, System.nanoTime() / 1_000_000 + REQUEST_MS);
        try (InputStream in = bytes.open(p.url, -1, -1); OutputStream out = new FileOutputStream(part)) {
            byte[] b = new byte[1 << 16];
            for (int n; (n = in.read(b)) > 0; ) {
                if (System.nanoTime() / 1_000_000 > until) throw new IOException("fetch over the time allowed");
                if (headN < head.length) {
                    int k = Math.min(n, head.length - headN);
                    System.arraycopy(b, 0, head, headN, k);
                    headN += k;
                }
                out.write(b, 0, n);
                budget.add(n);
            }
        }
        if (headN == 0) throw new IOException("an empty stream");
        String ext = extOf(head, headN);
        if (ext.equals("ts") && tsEncrypted(java.util.Arrays.copyOf(head, headN))) throw new Refused("encrypted (SAMPLE-AES), not played");
        return ext;
    }

    /** One part into memory; a dropped connection is tried once more. */
    private static byte[] read(Part p, Bytes bytes, Budget budget) throws IOException {
        IOException last = null;
        for (int attempt = 0; attempt < 2; attempt++) {
            if (budget.cancel != null) budget.cancel.check();
            byte[] got;
            try {
                got = readOnce(p, bytes, budget.until);
            } catch (Refused e) {
                throw e;
            } catch (IOException e) {
                last = e;
                if (System.nanoTime() / 1_000_000 > budget.until) throw e;
                continue;
            }
            budget.add(got.length);
            return got;
        }
        throw last;
    }

    private static byte[] readOnce(Part p, Bytes bytes, long until) throws IOException {
        // this request's own limit, inside the whole stream's
        until = Math.min(until, System.nanoTime() / 1_000_000 + REQUEST_MS);
        ByteArrayOutputStream buf = new ByteArrayOutputStream(p.from >= 0 ? (int) Math.min(MAX_PART, p.to - p.from + 1) : 1 << 20);
        try (InputStream in = bytes.open(p.url, p.from, p.to)) {
            byte[] b = new byte[1 << 16];
            for (int n; (n = in.read(b)) > 0; ) {
                buf.write(b, 0, n);
                if (buf.size() > MAX_PART) throw new Refused("a segment over " + (MAX_PART >> 20) + " MB");
                if (System.nanoTime() / 1_000_000 > until) throw new IOException("fetch over the time allowed");
            }
        }
        if (p.from >= 0 && buf.size() != p.to - p.from + 1) throw new IOException("a short segment");
        return buf.toByteArray();
    }

    /** A segment fetched on the pool: its bytes, or the fetch's own exception. */
    private static byte[] take(java.util.concurrent.Future<byte[]> f) throws IOException {
        try {
            return f.get();
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            throw new java.io.InterruptedIOException("segment fetch interrupted");
        } catch (java.util.concurrent.ExecutionException e) {
            Throwable c = e.getCause();
            if (c instanceof IOException) throw (IOException) c;
            if (c instanceof RuntimeException) throw (RuntimeException) c;
            if (c instanceof Error) throw (Error) c;
            throw new IOException(c);
        }
    }

    private static final int TS = 188;

    /**
     * An MPEG-TS segment whose program map lists a SAMPLE-AES stream (AAC, H.264, AC-3, E-AC-3:
     * stream types 0xcf, 0xdb, 0xc1, 0xc2).
     */
    static boolean tsEncrypted(byte[] b) {
        int pmt = -1;
        for (int at = 0; at + TS <= b.length; at += TS) {
            if (b[at] != 0x47) return false;
            int pid = (b[at + 1] & 0x1f) << 8 | (b[at + 2] & 0xff);
            boolean start = (b[at + 1] & 0x40) != 0;
            int afc = (b[at + 3] >> 4) & 3;
            int p = at + 4;
            if (afc == 2 || afc == 0) continue;
            if (afc == 3) p += 1 + (b[p] & 0xff);
            if (!start || p >= at + TS) continue;
            p += 1 + (b[p] & 0xff);   // pointer field
            if (p + 3 > at + TS) continue;
            int sectionLen = (b[p + 1] & 0x0f) << 8 | (b[p + 2] & 0xff);
            int end = Math.min(at + TS, p + 3 + sectionLen) - 4;   // the CRC left out
            if (pid == 0 && pmt < 0 && (b[p] & 0xff) == 0x00) {
                for (int q = p + 8; q + 4 <= end; q += 4) {
                    int prog = (b[q] & 0xff) << 8 | (b[q + 1] & 0xff);
                    if (prog != 0) {
                        pmt = (b[q + 2] & 0x1f) << 8 | (b[q + 3] & 0xff);
                        break;
                    }
                }
            } else if (pid == pmt && (b[p] & 0xff) == 0x02) {
                if (p + 12 > end) return false;
                int q = p + 12 + ((b[p + 10] & 0x0f) << 8 | (b[p + 11] & 0xff));
                while (q + 5 <= end) {
                    int type = b[q] & 0xff;
                    if (type == 0xcf || type == 0xdb || type == 0xc1 || type == 0xc2) return true;
                    q += 5 + ((b[q + 3] & 0x0f) << 8 | (b[q + 4] & 0xff));
                }
                return false;
            }
        }
        return false;
    }

    private static String joined(Plan plan, Bytes bytes, File part, Budget budget) throws IOException {
        byte[] init = plan.init == null ? null : read(plan.init, bytes, budget);
        byte[] first = read(plan.segments.get(0), bytes, budget);
        byte[] head = init != null && init.length > 0 ? init : first;
        String ext = extOf(head, head.length);
        if (ext.equals("ts") && tsEncrypted(first)) throw new Refused("encrypted (SAMPLE-AES), not played");
        boolean fmp4 = ext.equals("m4a") && init != null && init.length > 0;
        int n = plan.segments.size();
        java.util.concurrent.ExecutorService pool = n > 1 ? java.util.concurrent.Executors.newFixedThreadPool(Math.min(PARALLEL, n - 1), r -> {
            Thread t = new Thread(r, "ayham-stream-segments");
            t.setDaemon(true);
            return t;
        }) : null;
        java.util.ArrayDeque<java.util.concurrent.Future<byte[]>> ahead = new java.util.ArrayDeque<>();
        int next = 1;
        long sidxAt = -1;
        long timescale = fmp4 ? mdhdTimescale(init) : 0;
        long[] sizes = new long[n], times = new long[n];
        double[] secs = new double[n];
        int kept = 0;
        boolean index = fmp4 && timescale > 0;
        long base = -1;
        try (FileOutputStream fo = new FileOutputStream(part); OutputStream out = new java.io.BufferedOutputStream(fo, 1 << 16)) {
            if (init != null) out.write(init);
            if (fmp4) {
                // room for the index, a 'free' box until it is written
                sidxAt = init.length;
                byte[] free = new byte[40 + 12 * n];
                putInt(free, 0, free.length);
                free[4] = 'f';
                free[5] = 'r';
                free[6] = 'e';
                free[7] = 'e';
                out.write(free);
            }
            for (int i = 0; i < n; i++) {
                // PARALLEL segments in flight, written in order
                while (next < n && ahead.size() < PARALLEL) {
                    Part sp = plan.segments.get(next++);
                    ahead.add(pool.submit(() -> read(sp, bytes, budget)));
                }
                byte[] seg = i == 0 ? first : take(ahead.poll());
                if (fmp4) {
                    // no moof, no audio (ffmpeg's FLAC HLS ends on a lone styp): left out, so it
                    // doesn't turn the index off for the whole file
                    if (find(seg, 0, seg.length, "moof") < 0) continue;
                    long t = firstTfdt(seg);
                    if (t < 0) index = false;
                    if (kept == 0) base = t;
                    // times from 0: the player's position is the song's
                    if (index && base > 0) rebaseTfdt(seg, base);
                    times[kept] = t;
                    secs[kept] = plan.segments.get(i).sec;
                    seg = withoutSidx(seg);
                } else if (i > 0 && !ext.equals("ts")) {
                    seg = withoutId3(seg);   // packed audio: each segment's own timestamp tag
                }
                sizes[kept++] = seg.length;
                out.write(seg);
            }
        } finally {
            if (pool != null) pool.shutdownNow();
        }
        if (index && kept > 0) {
            try (RandomAccessFile r = new RandomAccessFile(part, "rw")) {
                r.seek(sidxAt);
                int room = 12 * (n - kept);
                if (room > 0) {
                    // the room kept for the fragments left out: a free box before the index
                    byte[] free = new byte[room];
                    putInt(free, 0, room);
                    free[4] = 'f';
                    free[5] = 'r';
                    free[6] = 'e';
                    free[7] = 'e';
                    r.write(free);
                }
                r.write(sidx(secs, timescale, sizes, times, kept));
            }
        }
        return ext;
    }

    /** The index (sidx v1, EPT 0, first offset 0): one reference for each of the first n segments, with its size and length. */
    static byte[] sidx(double[] secs, long timescale, long[] sizes, long[] times, int n) {
        byte[] b = new byte[40 + 12 * n];
        putInt(b, 0, b.length);
        b[4] = 's';
        b[5] = 'i';
        b[6] = 'd';
        b[7] = 'x';
        b[8] = 1;   // version 1, flags 0
        putInt(b, 12, 1);   // reference_ID
        putInt(b, 16, (int) timescale);
        // earliest_presentation_time and first_offset: 0 (8 bytes each), reserved: 0
        b[38] = (byte) (n >> 8);
        b[39] = (byte) n;
        long sum = 0;
        for (int i = 0; i < n; i++) {
            long d;
            if (i + 1 < n && times[i + 1] > times[i]) d = times[i + 1] - times[i];
            else if (!Double.isNaN(secs[i])) d = Math.round(secs[i] * timescale);
            else d = i > 0 ? sum / i : timescale;
            sum += d;
            int at = 40 + 12 * i;
            putInt(b, at, (int) (sizes[i] & 0x7fffffffL));
            putInt(b, at + 4, (int) d);
            putInt(b, at + 8, 0x90000000);   // starts with a SAP of type 1
        }
        return b;
    }

    private static void putInt(byte[] b, int at, int v) {
        b[at] = (byte) (v >>> 24);
        b[at + 1] = (byte) (v >>> 16);
        b[at + 2] = (byte) (v >>> 8);
        b[at + 3] = (byte) v;
    }

    private static long u32(byte[] b, int at) {
        return (b[at] & 0xffL) << 24 | (b[at + 1] & 0xffL) << 16 | (b[at + 2] & 0xffL) << 8 | (b[at + 3] & 0xffL);
    }

    private static boolean is(byte[] b, int at, String type) {
        return at + 8 <= b.length && b[at + 4] == type.charAt(0) && b[at + 5] == type.charAt(1) && b[at + 6] == type.charAt(2) && b[at + 7] == type.charAt(3);
    }

    /** A box's size from at (to its end), or -1 when it doesn't fit in [at, end). */
    private static long boxSize(byte[] b, int at, int end) {
        if (at + 8 > end) return -1;
        long size = u32(b, at);
        if (size == 1) {
            if (at + 16 > end) return -1;
            size = u32(b, at + 8) << 32 | u32(b, at + 12);
        } else if (size == 0) size = end - at;
        return size < 8 || at + size > end ? -1 : size;
    }

    /** The first box of type inside [from, end) at that level; -1 when none. */
    private static int find(byte[] b, int from, int end, String type) {
        for (int at = from; at + 8 <= end; ) {
            long size = boxSize(b, at, end);
            if (size < 0) return -1;
            if (is(b, at, type)) return at;
            at += (int) size;
        }
        return -1;
    }

    /** The init's audio track timescale (moov/trak/mdia/mdhd, the 'soun' track first); 0 when not found. */
    static long mdhdTimescale(byte[] init) {
        int moov = find(init, 0, init.length, "moov");
        if (moov < 0) return 0;
        int moovEnd = moov + (int) boxSize(init, moov, init.length);
        long any = 0;
        for (int at = moov + 8; at + 8 <= moovEnd; ) {
            long size = boxSize(init, at, moovEnd);
            if (size < 0) break;
            if (is(init, at, "trak")) {
                int end = at + (int) size;
                int mdia = find(init, at + 8, end, "mdia");
                if (mdia >= 0) {
                    int mEnd = mdia + (int) boxSize(init, mdia, end);
                    int mdhd = find(init, mdia + 8, mEnd, "mdhd");
                    int hdlr = find(init, mdia + 8, mEnd, "hdlr");
                    if (mdhd >= 0 && mdhd + 32 <= mEnd) {
                        long ts = u32(init, mdhd + 8 + 4 + (init[mdhd + 8] == 1 ? 16 : 8));
                        boolean sound = hdlr >= 0 && hdlr + 20 <= mEnd && init[hdlr + 16] == 's' && init[hdlr + 17] == 'o' && init[hdlr + 18] == 'u' && init[hdlr + 19] == 'n';
                        if (sound) return ts;
                        if (any == 0) any = ts;
                    }
                }
            }
            at += (int) size;
        }
        return any;
    }

    /** Every tfdt (moof/traf/tfdt) of a segment: its offset. */
    private static List<Integer> tfdts(byte[] seg) {
        List<Integer> out = new ArrayList<>();
        for (int at = 0; at + 8 <= seg.length; ) {
            long size = boxSize(seg, at, seg.length);
            if (size < 0) break;
            if (is(seg, at, "moof")) {
                int end = at + (int) size;
                for (int t = at + 8; t + 8 <= end; ) {
                    long ts = boxSize(seg, t, end);
                    if (ts < 0) break;
                    if (is(seg, t, "traf")) {
                        int d = find(seg, t + 8, t + (int) ts, "tfdt");
                        if (d >= 0 && d + 16 <= t + ts) out.add(d);
                    }
                    t += (int) ts;
                }
            }
            at += (int) size;
        }
        return out;
    }

    private static long tfdtAt(byte[] seg, int d) {
        return seg[d + 8] == 1 ? (u32(seg, d + 12) << 32 | u32(seg, d + 16)) : u32(seg, d + 12);
    }

    /** The segment's first decode time, or -1 when it has none. */
    static long firstTfdt(byte[] seg) {
        List<Integer> t = tfdts(seg);
        return t.isEmpty() || (seg[t.get(0) + 8] == 1 && t.get(0) + 20 > seg.length) ? -1 : tfdtAt(seg, t.get(0));
    }

    /** Every decode time minus base, in place (the box sizes don't change). */
    static void rebaseTfdt(byte[] seg, long base) {
        for (int d : tfdts(seg)) {
            boolean v1 = seg[d + 8] == 1;
            if (v1 && d + 20 > seg.length) continue;
            long t = tfdtAt(seg, d);
            if (t < base) continue;
            long nt = t - base;
            if (v1) {
                putInt(seg, d + 12, (int) (nt >>> 32));
                putInt(seg, d + 16, (int) nt);
            } else putInt(seg, d + 12, (int) nt);
        }
    }

    /** The segment without its own top-level sidx (the file's index is the one written after the init). */
    static byte[] withoutSidx(byte[] seg) {
        if (find(seg, 0, seg.length, "sidx") < 0) return seg;
        ByteArrayOutputStream out = new ByteArrayOutputStream(seg.length);
        int at = 0;
        while (at + 8 <= seg.length) {
            long size = boxSize(seg, at, seg.length);
            if (size < 0) break;
            if (!is(seg, at, "sidx")) out.write(seg, at, (int) size);
            at += (int) size;
        }
        if (at < seg.length) out.write(seg, at, seg.length - at);
        return out.toByteArray();
    }

    /** Packed audio (ADTS, MP3, AC-3) segments start with an ID3 timestamp tag: cut off after the first. */
    static byte[] withoutId3(byte[] seg) {
        int at = 0;
        while (at + 10 <= seg.length && seg[at] == 'I' && seg[at + 1] == 'D' && seg[at + 2] == '3') {
            int len = 10 + ((seg[at + 6] & 0x7f) << 21 | (seg[at + 7] & 0x7f) << 14 | (seg[at + 8] & 0x7f) << 7 | (seg[at + 9] & 0x7f));
            if ((seg[at + 5] & 0x10) != 0) len += 10;   // a footer
            if (at + len > seg.length) break;
            at += len;
        }
        return at == 0 ? seg : java.util.Arrays.copyOfRange(seg, at, seg.length);
    }

    /** The file's extension from its first bytes. */
    static String extOf(byte[] b, int n) {
        if (n >= 8) {
            for (String t : new String[]{"ftyp", "styp", "moof", "sidx", "moov"}) if (b[4] == t.charAt(0) && b[5] == t.charAt(1) && b[6] == t.charAt(2) && b[7] == t.charAt(3)) return "m4a";
        }
        if (n >= 1 && (b[0] & 0xff) == 0x47) return "ts";
        if (n >= 4 && b[0] == 'f' && b[1] == 'L' && b[2] == 'a' && b[3] == 'C') return "flac";
        if (n >= 4 && b[0] == 'O' && b[1] == 'g' && b[2] == 'g' && b[3] == 'S') return "ogg";
        if (n >= 12 && b[0] == 'R' && b[1] == 'I' && b[2] == 'F' && b[3] == 'F') return "wav";
        if (n >= 3 && b[0] == 'I' && b[1] == 'D' && b[2] == '3') {
            if (n >= 10) {
                int at = 10 + ((b[6] & 0x7f) << 21 | (b[7] & 0x7f) << 14 | (b[8] & 0x7f) << 7 | (b[9] & 0x7f));
                if (at + 4 <= n) return extOf(java.util.Arrays.copyOfRange(b, at, n), n - at);
            }
            return "mp3";
        }
        if (n >= 2 && (b[0] & 0xff) == 0xff && (b[1] & 0xf6) == 0xf0) return "aac";
        if (n >= 2 && (b[0] & 0xff) == 0xff && (b[1] & 0xe0) == 0xe0) return "mp3";
        if (n >= 2 && (b[0] & 0xff) == 0x0b && (b[1] & 0xff) == 0x77) return "ac3";
        return "audio";
    }
}
