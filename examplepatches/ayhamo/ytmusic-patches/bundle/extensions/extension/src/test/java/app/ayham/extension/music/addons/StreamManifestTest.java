package app.ayham.extension.music.addons;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;

/** HLS and DASH rows (protocol.md 8.1.5) on the phone: the playlist and manifest parsers and the join. */
public class StreamManifestTest {
    @Rule
    public TemporaryFolder tmp = new TemporaryFolder();

    private final Map<String, String> texts = new HashMap<>();
    private final List<String> asked = new ArrayList<>();

    private final StreamManifest.Texts fake = url -> {
        asked.add(url);
        String t = texts.get(url);
        if (t == null) throw new IOException("no such text");
        return new StreamManifest.Text(url, t);
    };

    private StreamManifest.Plan resolve(String url) throws IOException {
        return StreamManifest.resolve(url, fake, false);
    }

    private static String refusal(ThrowingRunnable r) {
        try {
            r.run();
        } catch (StreamManifest.Refused e) {
            return e.getMessage();
        } catch (Exception e) {
            fail("not a refusal: " + e);
        }
        fail("not refused");
        return null;
    }

    interface ThrowingRunnable {
        void run() throws Exception;
    }

    private static final String MEDIA = "#EXTM3U\n#EXT-X-TARGETDURATION:6\n#EXTINF:6.0,\nseg1.m4s\n#EXTINF:4.5,\nseg2.m4s\n#EXT-X-ENDLIST\n";

    // ---- HLS ----

    @Test
    public void hlsMasterWithVideoVariantsTakesTheAudioRendition() throws IOException {
        texts.put("https://cdn.example/a/master.m3u8", "#EXTM3U\n"
                + "#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID=\"lo\",NAME=\"lo\",DEFAULT=YES,URI=\"audio/lo.m3u8\"\n"
                + "#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID=\"hi\",NAME=\"x\",DEFAULT=NO,URI=\"audio/hi-x.m3u8\"\n"
                + "#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID=\"hi\",NAME=\"main\",DEFAULT=YES,URI=\"audio/hi.m3u8\"\n"
                + "#EXT-X-STREAM-INF:BANDWIDTH=800000,CODECS=\"avc1.4d401f,mp4a.40.2\",RESOLUTION=640x360,AUDIO=\"lo\"\nv/360.m3u8\n"
                + "#EXT-X-STREAM-INF:BANDWIDTH=5000000,CODECS=\"avc1.640028,mp4a.40.2\",RESOLUTION=1920x1080,AUDIO=\"hi\"\nv/1080.m3u8\n");
        texts.put("https://cdn.example/a/audio/hi.m3u8", MEDIA);
        StreamManifest.Plan p = resolve("https://cdn.example/a/master.m3u8");
        assertEquals("https://cdn.example/a/audio/hi.m3u8", asked.get(1));
        assertEquals(2, p.segments.size());
        assertEquals("https://cdn.example/a/audio/seg1.m4s", p.segments.get(0).url);
        assertEquals(4.5, p.segments.get(1).sec, 1e-9);
    }

    @Test
    public void hlsAudioVariantsGoByBandwidth() throws IOException {
        texts.put("https://cdn.example/m.m3u8", "﻿#EXTM3U\r\n"
                + "#EXT-X-STREAM-INF:BANDWIDTH=320000,CODECS=\"mp4a.40.2\"\r\nlossy.m3u8\r\n"
                + "#EXT-X-STREAM-INF:BANDWIDTH=1411000,CODECS=\"fLaC\"\r\nflac.m3u8\r\n"
                + "#EXT-X-STREAM-INF:BANDWIDTH=900000,CODECS=\"alac\"\r\nalac.m3u8\r\n"
                + "#EXT-X-STREAM-INF:BANDWIDTH=9000000,CODECS=\"avc1.640028,mp4a.40.2\"\r\nvideo.m3u8\r\n");
        texts.put("https://cdn.example/flac.m3u8", MEDIA);
        resolve("https://cdn.example/m.m3u8");
        assertEquals("https://cdn.example/flac.m3u8", asked.get(1));
    }

    @Test
    public void hlsMediaPlaylistWithMapAndByteRanges() throws IOException {
        texts.put("https://cdn.example/x/song.m3u8", "#EXTM3U\n#EXT-X-VERSION:7\n"
                + "#EXT-X-MAP:URI=\"song.mp4\",BYTERANGE=\"720@0\"\n"
                + "#EXTINF:6,\n#EXT-X-BYTERANGE:1000@720\nsong.mp4\n"
                + "#EXTINF:6,\n#EXT-X-BYTERANGE:500\nsong.mp4\n"
                + "#EXT-X-KEY:METHOD=NONE\n"
                + "#EXTINF:2,\n#EXT-X-BYTERANGE:300\nsong.mp4\n#EXT-X-ENDLIST\n");
        StreamManifest.Plan p = resolve("https://cdn.example/x/song.m3u8");
        assertEquals("https://cdn.example/x/song.mp4", p.init.url);
        assertEquals(0, p.init.from);
        assertEquals(719, p.init.to);
        assertEquals(3, p.segments.size());
        assertEquals(720, p.segments.get(0).from);
        assertEquals(1719, p.segments.get(0).to);
        assertEquals(1720, p.segments.get(1).from);
        assertEquals(2219, p.segments.get(1).to);
        assertEquals(2220, p.segments.get(2).from);
        assertEquals(2519, p.segments.get(2).to);
        assertFalse(p.wholeFile());
    }

    @Test
    public void hlsEncryptedIsRefused() {
        texts.put("https://cdn.example/e.m3u8", "#EXTM3U\n#EXT-X-KEY:METHOD=AES-128,URI=\"https://k.example/key\"\n#EXTINF:6,\na.ts\n#EXT-X-ENDLIST\n");
        assertEquals("HLS: encrypted (AES-128), not played", refusal(() -> resolve("https://cdn.example/e.m3u8")));
        texts.put("https://cdn.example/s.m3u8", "#EXTM3U\n#EXTINF:6,\na.ts\n#EXT-X-KEY:METHOD=SAMPLE-AES,URI=\"skd://x\"\n#EXTINF:6,\nb.ts\n#EXT-X-ENDLIST\n");
        assertTrue(refusal(() -> resolve("https://cdn.example/s.m3u8")).contains("encrypted"));
    }

    @Test
    public void hlsSessionKeyAndASecondInitAreRefused() {
        texts.put("https://cdn.example/sk.m3u8", "#EXTM3U\n#EXT-X-SESSION-KEY:METHOD=SAMPLE-AES,URI=\"skd://x\"\n"
                + "#EXT-X-STREAM-INF:BANDWIDTH=1,CODECS=\"mp4a.40.2\"\na.m3u8\n");
        assertEquals("HLS: encrypted (SAMPLE-AES), not played", refusal(() -> resolve("https://cdn.example/sk.m3u8")));
        texts.put("https://cdn.example/sk2.m3u8", "#EXTM3U\n#EXT-X-SESSION-KEY:METHOD=NONE\n"
                + "#EXT-X-STREAM-INF:BANDWIDTH=1,CODECS=\"mp4a.40.2\"\na.m3u8\n");
        texts.put("https://cdn.example/a.m3u8", MEDIA);
        try {
            resolve("https://cdn.example/sk2.m3u8");
        } catch (IOException e) {
            fail("METHOD=NONE refused: " + e);
        }
        texts.put("https://cdn.example/2i.m3u8", "#EXTM3U\n#EXT-X-MAP:URI=\"i1.mp4\"\n#EXTINF:6,\na.m4s\n"
                + "#EXT-X-MAP:URI=\"i2.mp4\"\n#EXTINF:6,\nb.m4s\n#EXT-X-ENDLIST\n");
        assertEquals("HLS: more than one init segment", refusal(() -> resolve("https://cdn.example/2i.m3u8")));
    }

    @Test
    public void hlsDolbyIsPassedOverOnAStereoRow() throws IOException {
        String master = "#EXTM3U\n"
                + "#EXT-X-STREAM-INF:BANDWIDTH=768000,CODECS=\"ec-3\"\natmos.m3u8\n"
                + "#EXT-X-STREAM-INF:BANDWIDTH=256000,CODECS=\"mp4a.40.2\"\naac.m3u8\n";
        texts.put("https://cdn.example/d.m3u8", master);
        texts.put("https://cdn.example/aac.m3u8", MEDIA);
        texts.put("https://cdn.example/atmos.m3u8", MEDIA);
        resolve("https://cdn.example/d.m3u8");
        assertEquals("https://cdn.example/aac.m3u8", asked.get(1));
        // an Atmos row (the phone's Dolby Atmos switch) keeps it
        asked.clear();
        StreamManifest.resolve("https://cdn.example/d.m3u8", fake, false, true);
        assertEquals("https://cdn.example/atmos.m3u8", asked.get(1));
        texts.put("https://cdn.example/donly.m3u8", "#EXTM3U\n"
                + "#EXT-X-STREAM-INF:BANDWIDTH=768000,CODECS=\"ec-3\"\natmos.m3u8\n"
                + "#EXT-X-STREAM-INF:BANDWIDTH=640000,CODECS=\"mp4a.a6\"\neac3.m3u8\n");
        assertEquals("HLS: Dolby audio only", refusal(() -> resolve("https://cdn.example/donly.m3u8")));
        assertTrue(StreamManifest.dolbyOnly("avc1.640028,ac-3"));
        assertFalse(StreamManifest.dolbyOnly("avc1.640028,mp4a.40.2"));
        assertFalse(StreamManifest.dolbyOnly(null));
    }

    @Test
    public void dashDolbyAndProtectedRepresentationsArePassedOver() throws IOException {
        String period = "<Period><AdaptationSet contentType=\"audio\" codecs=\"ec-3\">"
                + "<Representation id=\"atmos\" bandwidth=\"768000\"><BaseURL>https://cdn.example/atmos.mp4</BaseURL></Representation></AdaptationSet>"
                + "<AdaptationSet contentType=\"audio\"><ContentProtection schemeIdUri=\"urn:mpeg:dash:mp4protection:2011\"/>"
                + "<Representation id=\"drm\" codecs=\"flac\" bandwidth=\"900000\"><BaseURL>https://cdn.example/drm.mp4</BaseURL></Representation></AdaptationSet>"
                + "<AdaptationSet contentType=\"audio\">"
                + "<Representation id=\"aac\" codecs=\"mp4a.40.2\" bandwidth=\"256000\"><BaseURL>https://cdn.example/aac.mp4</BaseURL></Representation></AdaptationSet></Period>";
        assertEquals("https://cdn.example/aac.mp4", dash(mpd(period)).segments.get(0).url);
        assertEquals("https://cdn.example/atmos.mp4", StreamManifest.dash("https://cdn.example/m.mpd", mpd(period), true).segments.get(0).url);
        assertEquals("DASH: Dolby audio only", refusal(() -> dash(mpd("<Period><AdaptationSet contentType=\"audio\">"
                + "<Representation id=\"a\" codecs=\"ac-4\" bandwidth=\"5\"/></AdaptationSet></Period>"))));
    }

    @Test
    public void aSegmentLinkOffHttpsIsRefusedBeforeItIsAsked() {
        assertTrue(refusal(() -> StreamManifest.httpBytes(new HashMap<>(), false).open("http://cdn.example/a.ts", -1, -1)).contains("https"));
    }

    @Test
    public void hlsLivePlaylistIsRefused() {
        texts.put("https://cdn.example/live.m3u8", "#EXTM3U\n#EXT-X-PLAYLIST-TYPE:EVENT\n#EXTINF:6,\na.ts\n#EXTINF:6,\nb.ts\n");
        assertEquals("HLS: a live playlist (no end), not played", refusal(() -> resolve("https://cdn.example/live.m3u8")));
    }

    @Test
    public void hlsOverTheSegmentCapIsRefused() {
        StringBuilder b = new StringBuilder("#EXTM3U\n");
        for (int i = 0; i <= StreamManifest.MAX_SEGMENTS; i++) b.append("#EXTINF:1,\ns").append(i).append(".ts\n");
        b.append("#EXT-X-ENDLIST\n");
        texts.put("https://cdn.example/long.m3u8", b.toString());
        assertEquals("over " + StreamManifest.MAX_SEGMENTS + " segments", refusal(() -> resolve("https://cdn.example/long.m3u8")));
    }

    @Test
    public void aLinkThatIsNotHttpsIsRefused() {
        texts.put("https://cdn.example/p.m3u8", "#EXTM3U\n#EXTINF:6,\nhttp://other.example/a.ts\n#EXT-X-ENDLIST\n");
        assertEquals("a segment link that is not https", refusal(() -> resolve("https://cdn.example/p.m3u8")));
        // a master's playlist too, before it is asked
        texts.put("https://cdn.example/m.m3u8", "#EXTM3U\n#EXT-X-STREAM-INF:BANDWIDTH=1,CODECS=\"mp4a.40.2\"\nhttp://other.example/a.m3u8\n");
        asked.clear();
        assertEquals("a segment link that is not https", refusal(() -> resolve("https://cdn.example/m.m3u8")));
        assertEquals(1, asked.size());
        // plain http to the device only when the client allows it
        texts.put("https://cdn.example/l.m3u8", "#EXTM3U\n#EXTINF:6,\nhttp://127.0.0.1:8080/a.ts\n#EXT-X-ENDLIST\n");
        assertEquals("a segment link that is not https", refusal(() -> resolve("https://cdn.example/l.m3u8")));
        try {
            assertEquals(1, StreamManifest.resolve("https://cdn.example/l.m3u8", fake, true).segments.size());
        } catch (IOException e) {
            fail(e.toString());
        }
    }

    @Test
    public void relativeLinksResolve() {
        String base = "https://cdn.example/a/b/list.m3u8?token=t1";
        assertEquals("https://cdn.example/a/b/seg.ts", StreamManifest.resolveUrl(base, "seg.ts"));
        assertEquals("https://cdn.example/a/seg.ts?x=1", StreamManifest.resolveUrl(base, "../seg.ts?x=1"));
        assertEquals("https://cdn.example/seg.ts", StreamManifest.resolveUrl(base, "/seg.ts"));
        assertEquals("https://other.example/s.ts", StreamManifest.resolveUrl(base, "//other.example/s.ts"));
        assertEquals("https://x.example/s.ts", StreamManifest.resolveUrl(base, "https://x.example/s.ts"));
        assertEquals("https://cdn.example/a/b/c/s.ts", StreamManifest.resolveUrl(base, "./c/./s.ts"));
        assertEquals("https://cdn.example/s.ts", StreamManifest.resolveUrl("https://cdn.example", "s.ts"));
        assertEquals("https://cdn.example/a/b/list.m3u8?q=2", StreamManifest.resolveUrl(base, "?q=2"));
    }

    // ---- DASH ----

    private static String mpd(String period) {
        return "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"
                + "<MPD xmlns=\"urn:mpeg:dash:schema:mpd:2011\" type=\"static\" mediaPresentationDuration=\"PT3M20.5S\">\n"
                + "<BaseURL>https://cdn.example/d/</BaseURL>\n" + period + "</MPD>\n";
    }

    private StreamManifest.Plan dash(String body) throws IOException {
        texts.put("https://api.example/m.mpd", body);
        return resolve("https://api.example/m.mpd");
    }

    @Test
    public void dashTemplateNumberCountsFromTheDuration() throws IOException {
        StreamManifest.Plan p = dash(mpd("<Period>"
                + "<AdaptationSet contentType=\"video\"><Representation id=\"v\" bandwidth=\"9000000\" mimeType=\"video/mp4\"/></AdaptationSet>"
                + "<AdaptationSet mimeType=\"audio/mp4\">"
                + "<SegmentTemplate timescale=\"48000\" duration=\"192000\" startNumber=\"1\" initialization=\"$RepresentationID$/init.mp4\" media=\"$RepresentationID$/$Number%05d$.m4s?b=$Bandwidth$\"/>"
                + "<Representation id=\"aac\" bandwidth=\"128000\" codecs=\"mp4a.40.2\"/>"
                + "<Representation id=\"flac\" bandwidth=\"1000000\" codecs=\"flac\"/>"
                + "</AdaptationSet></Period>"));
        assertEquals("https://cdn.example/d/flac/init.mp4", p.init.url);
        // 200.5 s in 4 s segments: 51
        assertEquals(51, p.segments.size());
        assertEquals("https://cdn.example/d/flac/00001.m4s?b=1000000", p.segments.get(0).url);
        assertEquals("https://cdn.example/d/flac/00051.m4s?b=1000000", p.segments.get(50).url);
        assertEquals(0.5, p.segments.get(50).sec, 1e-9);
    }

    @Test
    public void dashTimelineRepeatsAndTime() throws IOException {
        StreamManifest.Plan p = dash(mpd("<Period duration=\"PT20S\"><AdaptationSet contentType=\"audio\">"
                + "<SegmentTemplate timescale=\"1000\" media=\"t/$Time$.m4s\" initialization=\"t/init.mp4\"><SegmentTimeline>"
                + "<S t=\"0\" d=\"4000\" r=\"2\"/><S d=\"2000\"/><S t=\"14000\" d=\"3000\" r=\"-1\"/>"
                + "</SegmentTimeline></SegmentTemplate>"
                + "<Representation id=\"a\" bandwidth=\"1\"/></AdaptationSet></Period>"));
        List<String> urls = new ArrayList<>();
        for (StreamManifest.Part s : p.segments) urls.add(s.url.substring("https://cdn.example/d/t/".length()));
        assertEquals(java.util.Arrays.asList("0.m4s", "4000.m4s", "8000.m4s", "12000.m4s", "14000.m4s", "17000.m4s"), urls);
        assertEquals(2.0, p.segments.get(3).sec, 1e-9);
    }

    @Test
    public void dashSegmentListWithRanges() throws IOException {
        StreamManifest.Plan p = dash(mpd("<Period><AdaptationSet>"
                + "<Representation id=\"a\" bandwidth=\"5\" mimeType=\"audio/mp4\"><BaseURL>sub/song.mp4</BaseURL>"
                + "<SegmentList timescale=\"10\" duration=\"60\"><Initialization range=\"0-799\"/>"
                + "<SegmentURL mediaRange=\"800-1799\"/><SegmentURL mediaRange=\"1800-2299\"/><SegmentURL media=\"other.mp4\" mediaRange=\"0-9\"/>"
                + "</SegmentList></Representation></AdaptationSet></Period>"));
        assertEquals("https://cdn.example/d/sub/song.mp4", p.init.url);
        assertEquals(799, p.init.to);
        assertEquals(3, p.segments.size());
        assertEquals(800, p.segments.get(0).from);
        assertEquals(2299, p.segments.get(1).to);
        assertEquals("https://cdn.example/d/sub/other.mp4", p.segments.get(2).url);
        assertEquals(6.0, p.segments.get(0).sec, 1e-9);
    }

    @Test
    public void dashSegmentBaseIsTheWholeFile() throws IOException {
        StreamManifest.Plan p = dash(mpd("<Period><BaseURL>p/</BaseURL><AdaptationSet contentType=\"audio\">"
                + "<Representation id=\"a\" bandwidth=\"5\"><BaseURL>a.mp4</BaseURL><SegmentBase indexRange=\"800-1000\"><Initialization range=\"0-799\"/></SegmentBase></Representation>"
                + "</AdaptationSet></Period>"));
        assertTrue(p.wholeFile());
        assertEquals("https://cdn.example/d/p/a.mp4", p.segments.get(0).url);
        // a BaseURL alone
        p = dash("<MPD><Period><AdaptationSet><Representation id=\"a\" bandwidth=\"5\" codecs=\"flac\"><BaseURL>f.flac</BaseURL></Representation></AdaptationSet></Period></MPD>");
        assertTrue(p.wholeFile());
        assertEquals("https://api.example/f.flac", p.segments.get(0).url);
    }

    @Test
    public void dashContentProtectionIsRefused() {
        assertEquals("DASH: encrypted, not played", refusal(() -> dash(mpd("<Period><AdaptationSet contentType=\"audio\">"
                + "<ContentProtection schemeIdUri=\"urn:mpeg:dash:mp4protection:2011\" value=\"cenc\"/>"
                + "<Representation id=\"a\" bandwidth=\"5\"/></AdaptationSet></Period>"))));
    }

    @Test
    public void dashWithADoctypeParses() throws IOException {
        StreamManifest.Plan p = dash("<?xml version=\"1.0\"?>\n<!-- made by x -->\n<!DOCTYPE MPD SYSTEM \"https://dtd.example/mpd.dtd\">\n"
                + "<MPD xmlns=\"urn:mpeg:dash:schema:mpd:2011\"><Period><AdaptationSet contentType=\"audio\">"
                + "<Representation id=\"a\" bandwidth=\"5\"><BaseURL>https://cdn.example/a.m4a</BaseURL></Representation></AdaptationSet></Period></MPD>");
        assertEquals("https://cdn.example/a.m4a", p.segments.get(0).url);
    }

    @Test
    public void dashMultiPeriodAndLiveAreRefused() {
        assertEquals("DASH: 2 periods (only a single-period manifest plays)", refusal(() -> dash(mpd(
                "<Period id=\"ad\"><AdaptationSet contentType=\"audio\"><Representation id=\"a\" bandwidth=\"5\"/></AdaptationSet></Period>"
                        + "<Period id=\"song\"><AdaptationSet contentType=\"audio\"><Representation id=\"a\" bandwidth=\"5\"/></AdaptationSet></Period>"))));
        assertEquals("DASH: a live manifest, not played", refusal(() -> dash("<MPD type=\"dynamic\"><Period/></MPD>")));
    }

    @Test
    public void notAManifestIsRefused() {
        texts.put("https://cdn.example/x", "<html>nope</html>");
        assertEquals("not an HLS playlist or a DASH manifest", refusal(() -> resolve("https://cdn.example/x")));
    }

    @Test
    public void templateTokens() {
        assertEquals("r1/42/0000000042/9/$/$Odd$", StreamManifest.fill("$RepresentationID$/$Number$/$Number%010d$/$Time$/$$/$Odd$", "r1", 42, 9, 7));
        assertEquals(205.5, StreamManifest.parseIsoDuration("PT3M25.5S"), 1e-9);
        assertEquals(3600 + 1, StreamManifest.parseIsoDuration("PT1H1S"), 1e-9);
        assertTrue(Double.isNaN(StreamManifest.parseIsoDuration("")));
    }

    // ---- the join ----

    private static byte[] box(String type, byte[]... body) {
        ByteArrayOutputStream o = new ByteArrayOutputStream();
        int n = 8;
        for (byte[] b : body) n += b.length;
        o.write(n >>> 24);
        o.write(n >>> 16);
        o.write(n >>> 8);
        o.write(n);
        o.write(type.charAt(0));
        o.write(type.charAt(1));
        o.write(type.charAt(2));
        o.write(type.charAt(3));
        for (byte[] b : body) o.write(b, 0, b.length);
        return o.toByteArray();
    }

    private static byte[] bytes(int... v) {
        byte[] b = new byte[v.length];
        for (int i = 0; i < v.length; i++) b[i] = (byte) v[i];
        return b;
    }

    private static byte[] u32(long v) {
        return bytes((int) (v >>> 24), (int) (v >>> 16), (int) (v >>> 8), (int) v);
    }

    private static byte[] concat(byte[]... parts) {
        ByteArrayOutputStream o = new ByteArrayOutputStream();
        for (byte[] b : parts) o.write(b, 0, b.length);
        return o.toByteArray();
    }

    private static byte[] init() {
        byte[] mdhd = box("mdhd", concat(u32(0), u32(0), u32(0), u32(44100), u32(0), u32(0)));
        byte[] hdlr = box("hdlr", concat(u32(0), u32(0), "soun".getBytes(), u32(0), u32(0), u32(0), bytes(0)));
        return concat(box("ftyp", "iso6".getBytes(), u32(0)), box("moov", box("trak", box("mdia", mdhd, hdlr))));
    }

    private static byte[] segment(long tfdt, int payload) {
        byte[] tfdtBox = box("tfdt", concat(bytes(1, 0, 0, 0), u32(tfdt >>> 32), u32(tfdt)));
        return concat(box("styp", "msdh".getBytes()), box("sidx", new byte[24]), box("moof", box("traf", tfdtBox)), box("mdat", new byte[payload]));
    }

    private StreamManifest.Bytes served(Map<String, byte[]> files) {
        return (url, from, to) -> {
            byte[] b = files.get(url);
            if (b == null) throw new IOException("404");
            return new ByteArrayInputStream(from < 0 ? b : java.util.Arrays.copyOfRange(b, (int) from, (int) to + 1));
        };
    }

    @Test
    public void fragmentedMp4IsJoinedWithAnIndexFromTimeZero() throws IOException {
        StreamManifest.Plan p = new StreamManifest.Plan();
        p.init = new StreamManifest.Part("https://c/init.mp4", -1, -1, Double.NaN);
        p.add(new StreamManifest.Part("https://c/1.m4s", -1, -1, 4));
        p.add(new StreamManifest.Part("https://c/2.m4s", -1, -1, 3));
        Map<String, byte[]> files = new HashMap<>();
        files.put("https://c/init.mp4", init());
        files.put("https://c/1.m4s", segment(441_000, 100));
        files.put("https://c/2.m4s", segment(441_000 + 176_400, 50));
        File dir = tmp.newFolder();
        StreamManifest.Got g = StreamManifest.fetch(p, served(files), dir, "song.hls1", 1 << 20, 60_000, null);
        assertEquals("song.hls1.m4a", g.file.getName());
        assertEquals(1, dir.listFiles().length);
        byte[] out = Files.readAllBytes(g.file.toPath());
        int at = init().length;
        assertEquals("sidx", new String(out, at + 4, 4));
        assertEquals(44100, StreamManifest.mdhdTimescale(init()));
        // two references: the segments' sizes (their own sidx dropped) and lengths from their decode times
        int seg1 = segment(0, 100).length - 32, seg2 = segment(0, 50).length - 32;
        int r = at + 40;
        assertEquals(seg1, readInt(out, r));
        assertEquals(176_400, readInt(out, r + 4));
        assertEquals(seg2, readInt(out, r + 12));
        assertEquals(3 * 44100, readInt(out, r + 16));
        // the first segment's decode time is 0 now, the second's 4 s
        int s1 = at + 40 + 24;
        byte[] first = java.util.Arrays.copyOfRange(out, s1, s1 + seg1);
        assertEquals(0, StreamManifest.firstTfdt(first));
        byte[] second = java.util.Arrays.copyOfRange(out, s1 + seg1, s1 + seg1 + seg2);
        assertEquals(176_400, StreamManifest.firstTfdt(second));
        assertEquals(out.length, s1 + seg1 + seg2);
    }

    @Test
    public void anEmptyFragmentIsLeftOutAndTheIndexStays() throws IOException {
        // ffmpeg's FLAC HLS ends on a segment that is only a styp: no moof, no audio. It used to turn
        // the whole index off, so YT's player couldn't seek in the joined file (live run 2026-11-26)
        StreamManifest.Plan p = new StreamManifest.Plan();
        p.init = new StreamManifest.Part("https://c/init.mp4", -1, -1, Double.NaN);
        p.add(new StreamManifest.Part("https://c/1.m4s", -1, -1, 4));
        p.add(new StreamManifest.Part("https://c/2.m4s", -1, -1, 3));
        p.add(new StreamManifest.Part("https://c/3.m4s", -1, -1, 0));
        Map<String, byte[]> files = new HashMap<>();
        files.put("https://c/init.mp4", init());
        files.put("https://c/1.m4s", segment(0, 100));
        files.put("https://c/2.m4s", segment(176_400, 50));
        files.put("https://c/3.m4s", box("styp", "msdh".getBytes()));
        StreamManifest.Got g = StreamManifest.fetch(p, served(files), tmp.newFolder(), "song.hls2", 1 << 20, 60_000, null);
        byte[] out = Files.readAllBytes(g.file.toPath());
        int at = init().length;
        // the room kept for a third reference is a free box before the index
        assertEquals(12, readInt(out, at));
        assertEquals("free", new String(out, at + 4, 4));
        int sx = at + 12;
        assertEquals("sidx", new String(out, sx + 4, 4));
        assertEquals(40 + 24, readInt(out, sx));
        assertEquals(2, readInt(out, sx + 36) & 0xffff);
        int seg1 = segment(0, 100).length - 32, seg2 = segment(0, 50).length - 32;
        assertEquals(seg1, readInt(out, sx + 40));
        assertEquals(176_400, readInt(out, sx + 44));
        assertEquals(seg2, readInt(out, sx + 52));
        assertEquals(3 * 44100, readInt(out, sx + 56));
        assertEquals(out.length, sx + 64 + seg1 + seg2);
    }

    @Test
    public void aPartAnswerMustBeTheRangeAsked() {
        assertTrue(StreamManifest.rangeAnswered("bytes 100-199/5000", 100, 199));
        assertTrue(StreamManifest.rangeAnswered("bytes 100-199/*", 100, 199));
        assertTrue(StreamManifest.rangeAnswered("Bytes 0-99/100", 0, 99));
        assertFalse(StreamManifest.rangeAnswered(null, 100, 199));
        assertFalse(StreamManifest.rangeAnswered("bytes 0-99/5000", 100, 199));     // another start
        assertFalse(StreamManifest.rangeAnswered("bytes 100-150/5000", 100, 199));  // cut short
        assertFalse(StreamManifest.rangeAnswered("bytes 100-299/5000", 100, 199));  // more than asked
        assertFalse(StreamManifest.rangeAnswered("bytes 100-199/150", 100, 199));   // past its own length
        assertFalse(StreamManifest.rangeAnswered("bytes */5000", 100, 199));
        assertFalse(StreamManifest.rangeAnswered("bytes 100-199/99999999999999999999", 100, 199));
    }

    private static int readInt(byte[] b, int at) {
        return (b[at] & 0xff) << 24 | (b[at + 1] & 0xff) << 16 | (b[at + 2] & 0xff) << 8 | (b[at + 3] & 0xff);
    }

    @Test
    public void packedAudioIsJoinedWithoutTheLaterTags() throws IOException {
        byte[] id3 = concat("ID3".getBytes(), bytes(4, 0, 0, 0, 0, 0, 2), bytes(1, 2));
        byte[] adts = bytes(0xff, 0xf1, 0x50, 0x80, 0, 0x1f, 0xfc);
        StreamManifest.Plan p = new StreamManifest.Plan();
        p.add(new StreamManifest.Part("https://c/1.aac", -1, -1, 6));
        p.add(new StreamManifest.Part("https://c/2.aac", -1, -1, 6));
        Map<String, byte[]> files = new HashMap<>();
        files.put("https://c/1.aac", concat(id3, adts));
        files.put("https://c/2.aac", concat(id3, adts));
        StreamManifest.Got g = StreamManifest.fetch(p, served(files), tmp.newFolder(), "s", 1 << 20, 60_000, null);
        assertEquals("s.aac", g.file.getName());
        assertArrayEquals(concat(id3, adts, adts), Files.readAllBytes(g.file.toPath()));
    }

    @Test
    public void segmentsAreFetchedFourAtATimeAndJoinedInOrder() throws IOException {
        int n = 40;
        StreamManifest.Plan p = new StreamManifest.Plan();
        ByteArrayOutputStream want = new ByteArrayOutputStream();
        Map<String, byte[]> files = new HashMap<>();
        for (int i = 0; i < n; i++) {
            byte[] s = bytes(0xff, 0xf1, 0x50, 0x80, 0, 0x1f, 0xfc, i);
            files.put("https://c/" + i + ".aac", s);
            p.add(new StreamManifest.Part("https://c/" + i + ".aac", -1, -1, 6));
            want.write(s, 0, s.length);
        }
        java.util.concurrent.atomic.AtomicInteger now = new java.util.concurrent.atomic.AtomicInteger(), most = new java.util.concurrent.atomic.AtomicInteger();
        java.util.Random rnd = new java.util.Random(7);
        StreamManifest.Bytes slow = (url, from, to) -> {
            most.accumulateAndGet(now.incrementAndGet(), Math::max);
            try {
                Thread.sleep(rnd.nextInt(15));
            } catch (InterruptedException e) {
                throw new java.io.InterruptedIOException();
            } finally {
                now.decrementAndGet();
            }
            return new ByteArrayInputStream(files.get(url));
        };
        StreamManifest.Got g = StreamManifest.fetch(p, slow, tmp.newFolder(), "s", 1 << 20, 60_000, null);
        assertArrayEquals(want.toByteArray(), Files.readAllBytes(g.file.toPath()));
        assertTrue("at most " + most.get(), most.get() <= StreamManifest.PARALLEL);
        assertTrue("in parallel: " + most.get(), most.get() > 1);
    }

    /** One MPEG-TS packet carrying a PSI section on pid. */
    private static byte[] tsSection(int pid, byte[] section) {
        byte[] p = new byte[188];
        java.util.Arrays.fill(p, (byte) 0xff);
        p[0] = 0x47;
        p[1] = (byte) (0x40 | pid >> 8);
        p[2] = (byte) pid;
        p[3] = 0x10;
        p[4] = 0;   // pointer field
        System.arraycopy(section, 0, p, 5, section.length);
        return p;
    }

    @Test
    public void sampleAesTransportStreamIsRefused() throws IOException {
        // PAT: program 1 on PMT pid 0x100; PMT: one stream of type t on pid 0x101
        byte[] pat = bytes(0x00, 0xb0, 13, 0, 1, 0xc1, 0, 0, 0, 1, 0xe1, 0x00, 0, 0, 0, 0);
        StreamManifest.Plan p = new StreamManifest.Plan();
        p.add(new StreamManifest.Part("https://c/1.ts", -1, -1, 6));
        for (int type : new int[]{0xcf, 0x0f}) {
            byte[] pmt = bytes(0x02, 0xb0, 18, 0, 1, 0xc1, 0, 0, 0xe1, 0x01, 0xf0, 0, type, 0xe1, 0x01, 0xf0, 0, 0, 0, 0, 0);
            byte[] seg = concat(tsSection(0, pat), tsSection(0x100, pmt));
            Map<String, byte[]> files = new HashMap<>();
            files.put("https://c/1.ts", seg);
            assertEquals(type == 0xcf, StreamManifest.tsEncrypted(seg));
            if (type == 0xcf)
                assertEquals("encrypted (SAMPLE-AES), not played", refusal(() -> StreamManifest.fetch(p, served(files), tmp.newFolder(), "s", 1 << 20, 60_000, null)));
            else assertEquals("s.ts", StreamManifest.fetch(p, served(files), tmp.newFolder(), "s", 1 << 20, 60_000, null).file.getName());
        }
    }

    @Test
    public void aFailedFetchLeavesNothing() throws IOException {
        StreamManifest.Plan p = new StreamManifest.Plan();
        p.add(new StreamManifest.Part("https://c/1.ts", -1, -1, 6));
        p.add(new StreamManifest.Part("https://c/gone.ts", -1, -1, 6));
        Map<String, byte[]> files = new HashMap<>();
        byte[] ts = new byte[188];
        ts[0] = 0x47;
        files.put("https://c/1.ts", ts);
        File dir = tmp.newFolder();
        try {
            StreamManifest.fetch(p, served(files), dir, "s", 1 << 20, 60_000, null);
            fail("fetched");
        } catch (IOException e) {
            assertEquals("404", e.getMessage());
        }
        assertEquals(0, dir.listFiles().length);
        // over the size cap
        files.put("https://c/gone.ts", ts);
        try {
            StreamManifest.fetch(p, served(files), dir, "s", 200, 60_000, null);
            fail("fetched");
        } catch (IOException e) {
            assertEquals("over 0 MB", e.getMessage());
        }
        assertEquals(0, dir.listFiles().length);

    }

    @Test
    public void extensionsFromTheFirstBytes() {
        assertEquals("m4a", StreamManifest.extOf(init(), init().length));
        assertEquals("ts", StreamManifest.extOf(bytes(0x47, 0x40, 0, 0x10), 4));
        assertEquals("flac", StreamManifest.extOf("fLaC\0\0\0\"".getBytes(), 8));
        assertEquals("aac", StreamManifest.extOf(bytes(0xff, 0xf1, 0x50), 3));
        assertEquals("mp3", StreamManifest.extOf(bytes(0xff, 0xfb, 0x90), 3));
    }
}
