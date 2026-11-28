package app.ayham.extension.music.addons;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;

/** A hostile playlist, manifest or segment is refused or read safely (audit 2026-11-27, B2-01..B2-06). */
public class StreamHardeningTest {
    private final Map<String, String> texts = new HashMap<>();
    @Rule
    public TemporaryFolder tmp = new TemporaryFolder();

    private final StreamManifest.Texts fake = url -> {
        if (url.endsWith("/broken.m3u8")) throw new IllegalStateException("a reader's own error");
        String t = texts.get(url);
        if (t == null) throw new IOException("no such text");
        return new StreamManifest.Text(url, t);
    };

    private String refusal(String url, String body) {
        texts.put(url, body);
        try {
            StreamManifest.resolve(url, fake, false);
        } catch (StreamManifest.Refused e) {
            return e.getMessage();
        } catch (Exception e) {
            fail("not a refusal: " + e);
        }
        fail("not refused");
        return null;
    }

    private static void box(byte[] b, int at, long size, String type) {
        b[at] = (byte) (size >>> 24);
        b[at + 1] = (byte) (size >>> 16);
        b[at + 2] = (byte) (size >>> 8);
        b[at + 3] = (byte) size;
        for (int i = 0; i < 4; i++) b[at + 4 + i] = (byte) type.charAt(i);
    }

    /** B2-01: a 64-bit box size near 2^63 after the first box no longer wraps round into a loop. */
    @Test(timeout = 5000)
    public void aHugeLargesizeBoxEndsTheWalk() {
        byte[] b = new byte[64];
        box(b, 0, 8, "free");
        box(b, 8, 1, "mdat");
        b[16] = 0x7f;
        for (int i = 17; i < 24; i++) b[i] = (byte) 0xff;
        assertEquals(0, StreamManifest.mdhdTimescale(b));
        assertEquals(b, StreamManifest.withoutSidx(b));
    }

    /** B2-01: a 64-bit size under its 16-byte header is not a box. */
    @Test(timeout = 5000)
    public void aLargesizeUnderSixteenIsNotABox() {
        byte[] b = new byte[32];
        box(b, 0, 1, "moov");
        b[15] = 12;
        assertEquals(0, StreamManifest.mdhdTimescale(b));
    }

    /** B2-02: %0Nd widths are capped; 0 or absurd pads nothing, a normal one still pads. */
    @Test
    public void templateWidthsAreCapped() {
        assertEquals("5.m4s", StreamManifest.fill("$Number%0999999999d$.m4s", "a", 5, 0, 0));
        assertEquals("5.m4s", StreamManifest.fill("$Number%00d$.m4s", "a", 5, 0, 0));
        assertEquals("5.m4s", StreamManifest.fill("$Number%099999999999999999999d$.m4s", "a", 5, 0, 0));
        assertEquals("00005.m4s", StreamManifest.fill("$Number%05d$.m4s", "a", 5, 0, 0));
        assertEquals("0000000005", StreamManifest.fill("$Number%010d$", "a", 5, 0, 0));
    }

    /** B2-03: an HLS byte range over a part's 64 MB is refused before anything is fetched. */
    @Test
    public void anHlsRangeOverSixtyFourMbIsRefused() {
        String why = refusal("https://cdn.example/r.m3u8", "#EXTM3U\n#EXT-X-TARGETDURATION:6\n#EXTINF:6.0,\n"
                + "#EXT-X-BYTERANGE:70000000@0\nsong.mp4\n#EXT-X-ENDLIST\n");
        assertTrue(why, why.contains("64 MB"));
    }

    /** B2-03: an HLS range whose end would pass 2^63 is refused. */
    @Test
    public void anHlsRangePastTwoToTheSixtyThreeIsRefused() {
        String why = refusal("https://cdn.example/o.m3u8", "#EXTM3U\n#EXT-X-TARGETDURATION:6\n#EXTINF:6.0,\n"
                + "#EXT-X-BYTERANGE:1000@9223372036854775000\nsong.mp4\n#EXT-X-ENDLIST\n");
        assertTrue(why, why.contains("byte range"));
    }

    private static String mpd(String period) {
        return "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"
                + "<MPD xmlns=\"urn:mpeg:dash:schema:mpd:2011\" type=\"static\" mediaPresentationDuration=\"PT3M20.5S\">\n"
                + "<BaseURL>https://cdn.example/d/</BaseURL>\n" + period + "</MPD>\n";
    }

    /** B2-03: a DASH mediaRange over 64 MB is refused. */
    @Test
    public void aDashRangeOverSixtyFourMbIsRefused() {
        String why = refusal("https://api.example/r.mpd", mpd("<Period><AdaptationSet mimeType=\"audio/mp4\">"
                + "<Representation id=\"a\" bandwidth=\"5\"><BaseURL>song.mp4</BaseURL>"
                + "<SegmentList timescale=\"10\" duration=\"60\"><SegmentURL mediaRange=\"0-70000000\"/>"
                + "</SegmentList></Representation></AdaptationSet></Period>"));
        assertTrue(why, why.contains("64 MB"));
    }

    /** B2-06: a repeat count near 2^63 is refused at once, not after 20000 parts. */
    @Test(timeout = 5000)
    public void aHugeRepeatCountIsRefused() {
        String why = refusal("https://api.example/t.mpd", mpd("<Period><AdaptationSet mimeType=\"audio/mp4\">"
                + "<SegmentTemplate timescale=\"1000\" media=\"t/$Time$.m4s\" initialization=\"t/init.mp4\"><SegmentTimeline>"
                + "<S t=\"0\" d=\"4000\" r=\"9223372036854775807\"/></SegmentTimeline></SegmentTemplate>"
                + "<Representation id=\"a\" bandwidth=\"1\"/></AdaptationSet></Period>"));
        assertTrue(why, why.contains("segments"));
    }

    /** B2-05: stacked ID3 tags are skipped in place: no deep recursion, no copies. */
    @Test(timeout = 5000)
    public void stackedId3TagsAreSkippedInPlace() {
        int tags = 200_000;
        byte[] b = new byte[tags * 10 + 8];
        for (int t = 0; t < tags; t++) {
            b[t * 10] = 'I';
            b[t * 10 + 1] = 'D';
            b[t * 10 + 2] = '3';
        }
        int at = tags * 10;
        b[at] = 'f';
        b[at + 1] = 'L';
        b[at + 2] = 'a';
        b[at + 3] = 'C';
        assertEquals("flac", StreamManifest.extOf(b, b.length));
        // a tag that runs past the bytes read: an MP3's (as before)
        byte[] cut = {'I', 'D', '3', 4, 0, 0, 0, 0, 1, 0};
        assertEquals("mp3", StreamManifest.extOf(cut, cut.length));
        // a footer flag adds its 10 bytes
        byte[] footer = new byte[24];
        footer[0] = 'I';
        footer[1] = 'D';
        footer[2] = '3';
        footer[5] = 0x10;
        footer[20] = 'O';
        footer[21] = 'g';
        footer[22] = 'g';
        footer[23] = 'S';
        assertEquals("ogg", StreamManifest.extOf(footer, footer.length));
    }

    /** The extension's L4 (protocol.md 8.1.5, 2026-11-27): any error reading a playlist is a refusal, so the next row is tried. */
    @Test
    public void anErrorReadingAPlaylistIsARefusal() {
        String why = refusal("https://cdn.example/m.m3u8", "#EXTM3U\n#EXT-X-STREAM-INF:BANDWIDTH=1000,CODECS=\"flac\"\nbroken.m3u8\n");
        assertTrue(why, why.contains("doesn't read"));
    }

    /** The extension's L3: one segment that fails stops the others in flight at once, not each at its own 30 s limit. */
    @Test(timeout = 10000)
    public void aFailedSegmentStopsTheOthersInFlight() throws Exception {
        texts.put("https://cdn.example/s.m3u8", "#EXTM3U\n#EXT-X-TARGETDURATION:6\n#EXTINF:6.0,\ns0.flac\n#EXTINF:6.0,\ns1.flac\n"
                + "#EXTINF:6.0,\ns2.flac\n#EXT-X-ENDLIST\n");
        StreamManifest.Plan plan = StreamManifest.resolve("https://cdn.example/s.m3u8", fake, false);
        java.util.concurrent.atomic.AtomicLong trickled = new java.util.concurrent.atomic.AtomicLong();
        // s0 a FLAC start, s1 fails, s2 a server that sends a byte now and then, never ending
        StreamManifest.Bytes bytes = (url, from, to) -> {
            if (url.endsWith("s0.flac")) return new java.io.ByteArrayInputStream(new byte[]{'f', 'L', 'a', 'C', 0, 0, 0, 0});
            if (url.endsWith("s1.flac")) throw new IOException("segment 1 failed");
            return new InputStream() {
                @Override
                public int read() {
                    java.util.concurrent.locks.LockSupport.parkNanos(2_000_000);
                    trickled.incrementAndGet();
                    return 0;
                }

                @Override
                public int read(byte[] b, int off, int len) {
                    b[off] = (byte) read();
                    return 1;
                }
            };
        };
        try {
            StreamManifest.fetch(plan, bytes, tmp.getRoot(), "s", 1L << 30, 600_000, null);
            fail("fetched");
        } catch (IOException e) {
            assertTrue(e.getMessage(), e.getMessage().contains("segment 1 failed"));
        }
        Thread.sleep(300);
        long then = trickled.get();
        Thread.sleep(500);
        assertEquals("segment 2's read went on after the fetch failed", then, trickled.get());
    }
}
