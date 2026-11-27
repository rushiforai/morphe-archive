package app.ayham.extension.music.addons;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.junit.Test;

/** The request shapes (protocol.md §1), links and redaction, and the JS readings Android must not change. */
public class ProtocolTest {
    @Test
    public void apiCallsSendOnlyAcceptAndTheBrowserAgent() {
        Protocol.Request r = Protocol.api("https://h.example/tok/manifest.json");
        assertEquals(Arrays.asList("Accept", "User-Agent"), new ArrayList<>(r.headers.keySet()));
        assertEquals("application/json", r.headers.get("Accept"));
        assertEquals("Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:159.0) Gecko/20100101 Firefox/159.0", r.headers.get("User-Agent"));
        assertEquals(45000, r.timeoutMs);
        assertFalse(Protocol.USER_AGENT.toLowerCase(Locale.ROOT).contains("bitchord"));
    }

    @Test
    public void audioFetchSendsTheStreamHeadersRangeAndOurAgent() {
        Map<String, String> h = new LinkedHashMap<>();
        h.put("X-Token", "abc");
        h.put("user-agent", "BitChord/1.9");
        h.put("Range", "bytes=5-");
        Protocol.Request r = Protocol.audio("https://cdn/x.flac", h, "bytes=100-");
        assertEquals(Arrays.asList("X-Token", "Range", "Accept-Encoding", "User-Agent"), new ArrayList<>(r.headers.keySet()));
        assertEquals("bytes=100-", r.headers.get("Range"));
        assertEquals("identity", r.headers.get("Accept-Encoding"));
        assertEquals(Protocol.USER_AGENT, r.headers.get("User-Agent"));
    }

    @Test
    public void probeIsRangeZeroWithIdentityAndFourSeconds() {
        Map<String, String> h = new LinkedHashMap<>();
        h.put("X-Token", "abc");
        Protocol.Request r = Protocol.probe("https://cdn/x.flac", h);
        assertEquals("bytes=0-0", r.headers.get("Range"));
        assertEquals("identity", r.headers.get("Accept-Encoding"));
        assertEquals("abc", r.headers.get("X-Token"));
        assertEquals(Protocol.USER_AGENT, r.headers.get("User-Agent"));
        assertEquals(4000, r.timeoutMs);
        assertFalse(r.readBody);
        assertEquals(4, r.headers.size());
    }

    @Test
    public void percentEncodingIsEncodeUriComponent() {
        assertEquals("Blinding%20Lights", Js.encode("Blinding Lights"));
        assertEquals("a%2Bb%26c%3Dd%2Fe", Js.encode("a+b&c=d/e"));
        assertEquals("-_.!~*'()", Js.encode("-_.!~*'()"));
        assertEquals("%C5%9F%C4%B1mar%C4%B1k", Js.encode("şımarık"));
        assertEquals("%F0%9F%8E%B5", Js.encode("🎵"));
    }

    @Test
    public void searchAndStreamLinks() {
        List<String[]> params = new ArrayList<>();
        params.add(new String[]{"quality", "max"});
        TrackMatcher.Target t = new TrackMatcher.Target();
        t.title = "Blinding Lights";
        t.artist = "The Weeknd";
        assertEquals("https://h/t/search?quality=max&title=Blinding%20Lights&artist=The%20Weeknd&q=a%20b",
                Protocol.searchUrl("https://h/t", params, t, "  a b "));
        assertEquals("https://h/t/search?quality=max", Protocol.searchUrl("https://h/t", params, null, "  "));
        assertEquals("https://h/t/stream/a%2Fb%20c?quality=max", Protocol.streamUrl("https://h/t", "a/b c", params));
    }

    @Test
    public void linksShowOnlyTheirHost() {
        assertEquals("h.example", Protocol.redact("https://h.example/tok3n-x/stream/1?q=2"));
        assertEquals("127.0.0.1:9", Protocol.redact("http://127.0.0.1:9/tok3n-y/a"));
        assertEquals("(addon)", Protocol.redact("not a link"));
        assertEquals("fetch failed: h.example", Protocol.scrub("fetch failed: https://h.example/tok3n-x/stream/1?q=2"));
        assertEquals("at 127.0.0.1:9", new AddonError("down", "at http://127.0.0.1:9/tok3n-y/a").getMessage());
    }

    @Test
    public void httpsOnlyLocalHttpOnlyWhenAskedFor() {
        assertTrue(Protocol.allowed("https://h.example/x", false));
        assertFalse(Protocol.allowed("http://h.example/x", false));
        assertFalse(Protocol.allowed("http://localhost:8080/x", false));
        assertFalse(Protocol.allowed("http://127.0.0.1/x", false));
        assertTrue(Protocol.allowed("http://localhost:8080/x", true));
        assertTrue(Protocol.allowed("http://127.0.0.1/x", true));
        assertFalse(Protocol.allowed("http://192.168.0.2/x", true));
        assertFalse(Protocol.allowed("ftp://h/x", true));
        // https to this device: only for the debug mock (extension audit M8)
        assertFalse(Protocol.allowed("https://localhost/x", false));
        assertFalse(Protocol.allowed("https://127.0.0.1:8443/x", false));
        assertFalse(Protocol.allowed("https://127.1.2.3/x", false));
        assertFalse(Protocol.allowed("https://[::1]:443/x", false));
        assertFalse(Protocol.allowed("https://a.localhost/x", false));
        assertTrue(Protocol.allowed("https://localhost/x", true));
        assertTrue(Protocol.allowed("https://localhost.example/x", false));
        // the same device written other ways (extension step 2, 6a1acb0)
        for (String h : new String[]{"127.0.0.2", "2130706433", "0x7f000001", "0177.0.0.1", "127.1", "0.0.0.0", "0",
                "localhost.", "a.localhost.", "[::]", "[0:0:0:0:0:0:0:0]", "[::ffff:127.0.0.1]", "[::ffff:7f00:1]",
                "[0:0:0:0:0:ffff:7f00:2]", "[::127.0.0.1]", "[::1%25lo]", "2130706433:8443"})
            assertFalse(h, Protocol.allowed("https://" + h + "/x", false));
        // and what isn't it
        for (String h : new String[]{"128.0.0.1", "127.example.com", "1.2.3.4", "[::ffff:8.8.8.8]", "[2001:db8::1]",
                "localhostx.com", "[::2]", "0x7f.example"})
            assertTrue(h, Protocol.allowed("https://" + h + "/x", false));
        // a redirect: off a remote link onto this device refused; the mock may stay on it
        assertFalse(Protocol.redirectAllowed("https://h.example/s", "https://127.0.0.1/s"));
        assertFalse(Protocol.redirectAllowed("https://h.example/s", "http://h.example/s"));
        assertTrue(Protocol.redirectAllowed("https://h.example/s", "https://cdn.example/s"));
        assertTrue(Protocol.redirectAllowed("http://localhost:8080/s", "http://127.0.0.1:8080/t"));
    }

    @Test
    public void manifestFieldsAndFlags() {
        Map<String, Object> j = new LinkedHashMap<>();
        j.put("id", "x");
        j.put("resources", Arrays.<Object>asList("Search", "STREAM"));
        j.put("allowDownloads", 0.0);
        j.put("bitchordAuth", "yes");
        Map<String, Object> lim = new LinkedHashMap<>();
        lim.put("streamsPerMinute", "30/min");
        lim.put("uncachedPerHour", 0.5);
        j.put("limits", lim);
        Protocol.Manifest m = Protocol.readManifest(j);
        assertEquals("x", m.name);
        assertTrue(m.usable);
        assertFalse(m.allowDownloads);
        assertTrue(m.needsOfficial);
        assertEquals(30, m.limits.streamsPerMinute);   // "30/min": a lenient number, as parseFloat
        assertEquals(60, m.limits.uncachedPerHour);    // under 1: the default
        assertEquals("cached", m.limits.cachedMarker);
        j.put("resources", Arrays.<Object>asList("stream"));
        assertFalse(Protocol.readManifest(j).usable);
        j.put("id", " ");
        assertNull(Protocol.readManifest(j));
    }

    @Test
    public void jsReadingsOfJsonValues() {
        assertEquals(320.0, Js.num("320kbps"), 0);
        assertEquals(0.5, Js.num(" .5s"), 0);
        assertNull(Js.num("kbps"));
        assertNull(Js.num(true));
        assertEquals("5", Js.text(5.0));
        assertEquals("1.5", Js.text(1.5));
        assertEquals("true", Js.text(true));
        assertEquals("", Js.text(null));
        assertEquals("a b", Js.trim("　a b "));
        assertEquals(Boolean.TRUE, Js.flag(" On ", null));
        assertEquals(Boolean.FALSE, Js.flag(0.0, null));
        assertNull(Js.flag("maybe", null));
    }

    @Test
    public void downloadsTakeLosslessOrOver256() {
        Protocol.Stream s = new Protocol.Stream();
        s.tier = Pick.LOSSLESS;
        assertTrue(Protocol.goodForDownload(s));
        s.tier = Pick.HIGH;
        s.bitrate = 256.0;
        assertFalse(Protocol.goodForDownload(s));
        s.bitrate = 320.0;
        assertTrue(Protocol.goodForDownload(s));
    }
}
