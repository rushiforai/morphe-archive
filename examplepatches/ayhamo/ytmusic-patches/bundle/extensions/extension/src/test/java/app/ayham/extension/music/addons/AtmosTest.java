package app.ayham.extension.music.addons;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;

import app.ayham.extension.music.automix.Json;

/**
 * Dolby Atmos (the phone's switch): Atmos rows asked for (atmos=true), matched by the usual rules
 * and tried before every addon's stereo rows; an Atmos stream taken only for an Atmos row and only
 * when the phone decodes its codec; stereo exactly as before with the switch off.
 */
public class AtmosTest {
    private final List<String> queries = new ArrayList<>();
    /** The dolby addon answers its first query with Atmos rows only, and the second with stereo only. */
    private boolean split;

    /** Two addons: "plain" (no atmos setting, stereo rows) first, "dolby" (NullBeat-like) second. */
    private AddonClient client(String atmosCodec) {
        AddonClient.Transport t = r -> {
            String rest = r.url.substring("https://h.example/".length());
            int q = rest.indexOf('?');
            String query = q >= 0 ? rest.substring(q) : "";
            if (q >= 0) rest = rest.substring(0, q);
            String[] p = rest.split("/", -1);
            String name = p[0], kind = p.length > 2 ? p[2] : "", id = p.length > 3 ? p[3] : null;
            queries.add(name + " " + kind + (id != null ? "/" + id : "") + " " + query);
            if (kind.equals("file")) {
                Map<String, String> h = new HashMap<>();
                h.put("content-range", "bytes 0-0/30000000");
                return new AddonClient.Response(206, h, "x");
            }
            if (kind.equals("manifest.json")) {
                String settings = name.equals("dolby") ? "[{\"key\":\"atmos\",\"default\":true}]" : "[]";
                return new AddonClient.Response(200, null, "{\"id\":\"m." + name + "\",\"name\":\"" + name + "\",\"resources\":[\"search\",\"stream\"],\"settings\":" + settings + "}");
            }
            if (kind.equals("search")) {
                if (name.equals("plain")) return new AddonClient.Response(200, null, "{\"tracks\":[" + row("p1", "") + "]}");
                boolean atmos = query.contains("atmos=true");
                if (split) return new AddonClient.Response(200, null, "{\"tracks\":[" + (query.endsWith("q=blinding%20lights%20the%20weeknd") ? row("a1", ",\"isAtmos\":true") : row("s1", "")) + "]}");
                return new AddonClient.Response(200, null, "{\"tracks\":[" + (atmos ? row("a1", ",\"isAtmos\":true") + "," : "") + row("s1", "") + "]}");
            }
            if (kind.equals("stream")) {
                String file = "https://h.example/" + name + "/x/file/" + id;
                if (id.startsWith("a")) return new AddonClient.Response(200, null,
                        "{\"url\":\"" + file + "\",\"codec\":\"" + atmosCodec + "\",\"audioMode\":\"DOLBY_ATMOS\",\"container\":\"fmp4\",\"sampleRate\":48000}");
                return new AddonClient.Response(200, null, "{\"url\":\"" + file + "\",\"codec\":\"flac\",\"quality\":\"Hi-Res\"}");
            }
            return new AddonClient.Response(404, null, "{}");
        };
        return new AddonClient(t, () -> 1_000_000L, ms -> { }, line -> { });
    }

    private static String row(String id, String extra) {
        return "{\"id\":\"" + id + "\",\"title\":\"Blinding Lights\",\"artist\":\"The Weeknd\",\"duration\":200" + extra + "}";
    }

    private static List<AddonClient.Addon> addons() {
        return Arrays.asList(new AddonClient.Addon("https://h.example/plain/tok"), new AddonClient.Addon("https://h.example/dolby/tok"));
    }

    private static TrackMatcher.Target song() {
        TrackMatcher.Target t = new TrackMatcher.Target();
        t.title = "Blinding Lights";
        t.artist = "The Weeknd";
        t.durationSec = 200.0;
        return t;
    }

    @Test
    public void switchOffStaysStereoAndAsksAtmosFalse() {
        AddonClient.Opened o = client("eac3_joc").resolve(song(), addons(), new AddonClient.Options());
        assertEquals("p1", o.row.id);
        assertFalse(o.stream.atmos);
        for (String q : queries) if (q.startsWith("dolby search")) assertTrue(q, q.contains("atmos=false"));
    }

    @Test
    public void switchOnTriesTheAtmosRowBeforeEveryStereoRow() {
        AddonClient.Options opt = new AddonClient.Options();
        opt.atmos = true;
        opt.atmosDecodes = codec -> true;
        AddonClient.FindResult f = client("eac3_joc").find(song(), addons(), opt);
        // the second addon's Atmos row goes ahead of the first addon's stereo row
        assertEquals(3, f.found.size());
        assertTrue(f.found.get(0).atmos);
        assertEquals("a1", f.found.get(0).rows.get(0).id);
        assertEquals("p1", f.found.get(1).rows.get(0).id);
        assertEquals("s1", f.found.get(2).rows.get(0).id);
        AddonClient.Opened o = client("eac3_joc").resolve(song(), addons(), opt);
        assertEquals("a1", o.row.id);
        assertTrue(o.stream.atmos);
        assertEquals(Pick.DOLBY, o.stream.tier);
        assertEquals("eac3_joc", o.stream.codec);
        boolean asked = false;
        for (String q : queries) if (q.startsWith("dolby stream/a1")) asked = q.contains("atmos=true");
        assertTrue("the Atmos row's stream asks atmos=true", asked);
    }

    @Test
    public void anAtmosCodecThePhoneCannotDecodeFallsBackToStereo() {
        AddonClient.Options opt = new AddonClient.Options();
        opt.atmos = true;
        opt.atmosDecodes = codec -> !"ac4".equals(codec);
        AddonClient.Opened o = client("ac4").resolve(song(), addons(), opt);
        assertEquals("p1", o.row.id);
        assertFalse(o.stream.atmos);
        assertEquals("Atmos in ac4: no decoder on this phone", o.tried.get(0).why);
    }

    @Test
    public void anAtmosDownloadTakesOnlyAtmos() {
        AddonClient.Options opt = new AddonClient.Options();
        opt.atmosOnly = true;
        opt.forDownload = true;
        opt.atmosDecodes = codec -> true;
        AddonClient.FindResult f = client("eac3_joc").find(song(), addons(), opt);
        assertEquals(1, f.found.size());
        assertTrue(f.found.get(0).atmos);
        assertEquals("no Atmos match", f.tried.get(0).why);
        // Atmos has no stated bitrate: it is not refused as lossy for a download
        AddonClient.Opened o = client("eac3_joc").resolve(song(), addons(), opt);
        assertEquals("a1", o.row.id);
    }

    @Test
    public void anAtmosAnswerToAStereoRowIsStillAMiss() {
        Object j = Json.parse("{\"url\":\"https://x/y.m4a\",\"codec\":\"eac3_joc\"}");
        assertEquals("atmos", Protocol.readStream(j, null).miss);
        Protocol.Stream s = Protocol.readStream(j, null, true);
        assertNull(s.miss);
        assertTrue(s.atmos);
        assertEquals("file", s.transport);
    }

    @Test
    public void paramsAskAtmosOnlyWhenOn() {
        List<Protocol.Setting> settings = Protocol.readSettings(Json.parse("[{\"key\":\"atmos\",\"default\":true}]"));
        assertEquals("atmos=false&quality=LOSSLESS", Protocol.qs(Protocol.paramsFor(settings, Pick.LOSSLESS, null)));
        assertEquals("atmos=true&quality=LOSSLESS", Protocol.qs(Protocol.paramsFor(settings, Pick.LOSSLESS, null, true)));
        // an Atmos download asks for the addon's best quality
        assertEquals("atmos=true&quality=LOSSLESS", Protocol.qs(Protocol.paramsFor(settings, Pick.DOLBY, null, true)));
    }

    @Test
    public void pickMatchesAtmosRowsByTheSameRules() {
        List<Object> rows = new ArrayList<>();
        rows.add(Json.parse(row("a1", ",\"isAtmos\":true")));
        rows.add(Json.parse("{\"id\":\"a2\",\"title\":\"Save Your Tears\",\"artist\":\"The Weeknd\",\"duration\":215,\"isAtmos\":true}"));
        rows.add(Json.parse(row("s1", "")));
        Pick.Choice off = Pick.rowsToOpen(rows, song(), 5, false);
        assertTrue(off.atmos.isEmpty());
        assertEquals("a1", off.refused.get(0).id);
        assertEquals("atmos", off.refused.get(0).why);
        Pick.Choice on = Pick.rowsToOpen(rows, song(), 5, false, true);
        assertEquals(1, on.atmos.size());
        assertEquals("a1", on.atmos.get(0).id);
        assertEquals("s1", on.open.get(0).id);
        assertEquals("not this song", on.refused.get(0).why);
    }

    @Test
    public void codecNamesMapToDecoders() {
        assertEquals(Atmos.EAC3_JOC, Atmos.mimeOf("eac3_joc"));
        assertEquals(Atmos.EAC3_JOC, Atmos.mimeOf("EC-3"));
        assertEquals(Atmos.AC4, Atmos.mimeOf("ac-4"));
        assertNull(Atmos.mimeOf("flac"));
        assertTrue(Atmos.isAtmosMime("audio/eac3-joc"));
        assertFalse(Atmos.isAtmosMime("audio/eac3"));
    }

    @Test
    public void badgeAndLineReadTheDecodedFormat() {
        assertEquals(Quality.Badge.DOLBY_ATMOS, Quality.badge(false, "audio/eac3-joc", 48000, -1, 768000));
        assertEquals(Quality.Badge.DOLBY_ATMOS, Quality.badge(true, "audio/ac4", 48000, -1, -1));
        assertEquals("Dolby Atmos", Quality.Badge.DOLBY_ATMOS.label());
        assertTrue(Quality.Badge.DOLBY_ATMOS.shimmers());
        // plain E-AC-3 (5.1, no objects) is not Atmos
        assertEquals(Quality.Badge.HIGH_QUALITY, Quality.badge(false, "audio/eac3", 48000, -1, 640000));
        assertEquals("Dolby Atmos 768 kbps · NullBeat", Quality.line("audio/eac3-joc", 48000, -1, 768000, "NullBeat"));
    }

    @Test
    public void downloadsStepFromAtmosToBest() {
        assertEquals(Arrays.asList(Pick.DOLBY, Pick.LOSSLESS, Pick.HIRES, Pick.CD), Arrays.asList(AddonDownloads.steps(AddonDownloads.ATMOS)));
        Protocol.Stream s = new Protocol.Stream();
        s.codec = "flac";
        assertEquals("not Atmos", Fetch.statedRefusal(s, Pick.DOLBY));
        s.atmos = true;
        s.codec = "eac3_joc";
        assertNull(Fetch.statedRefusal(s, Pick.DOLBY));
    }

    @Test
    public void atmosFileBytes() {
        byte[] b = new byte[64];
        b[4] = 'f';
        b[5] = 't';
        b[6] = 'y';
        b[7] = 'p';
        byte[] ec3 = {'e', 'c', '-', '3'};
        System.arraycopy(ec3, 0, b, 40, 4);
        Fetch.Info i = Fetch.dolby(b, 64);
        assertNotNull(i);
        assertEquals("Dolby Atmos (E-AC-3) 48 kHz", i.toString());
        assertNull(Fetch.info(b, 64)); // not lossless
    }

    @Test
    public void anAtmosOnlyFirstQueryStillLooksForStereo() {
        split = true;
        AddonClient.Options opt = new AddonClient.Options();
        opt.atmos = true;
        AddonClient.FindResult f = client("eac3_joc").find(song(), Arrays.asList(new AddonClient.Addon("https://h.example/dolby/tok")), opt);
        assertEquals(queries.toString(), 2, f.found.size());
        assertEquals("a1", f.found.get(0).rows.get(0).id);
        assertEquals("s1", f.found.get(1).rows.get(0).id);
    }

    @Test
    public void aBareDolbyCodecIsAtmosOnlyForAnAtmosRow() {
        Object j = Json.parse("{\"url\":\"https://x/y.m4a\",\"codec\":\"ac4\"}");
        assertTrue(Protocol.readStream(j, null, true).atmos);
        Protocol.Stream stereo = Protocol.readStream(j, null);
        assertNull(stereo.miss);
        assertFalse(stereo.atmos);
    }
}
