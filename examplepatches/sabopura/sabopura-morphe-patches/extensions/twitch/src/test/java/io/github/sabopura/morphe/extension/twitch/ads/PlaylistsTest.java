package io.github.sabopura.morphe.extension.twitch.ads;

import org.junit.Test;

import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

/** Real Twitch playlists captured on 2026-10-13, with addresses and identifiers replaced. */
public class PlaylistsTest {
    @org.junit.BeforeClass
    public static void allPatches() {
        io.github.sabopura.morphe.extension.twitch.ui.Features.enableAllForPreview();
    }

    private static String fixture(String name) {
        InputStream in = PlaylistsTest.class.getResourceAsStream("/playlists/" + name);
        assertNotNull(name, in);
        try (Scanner s = new Scanner(in, StandardCharsets.UTF_8.name()).useDelimiter("\\A")) {
            return s.hasNext() ? s.next() : "";
        }
    }

    @Test
    public void prerollPlaylistsAreAds() {
        for (String name : Arrays.asList("preroll-start.m3u8", "preroll-later.m3u8")) {
            String text = fixture(name);
            assertTrue(name, Playlists.hasStitchedAd(text));
            assertFalse(name, Playlists.isCleanLive(text));
            assertEquals(name, -1, Playlists.liveSequence(text));
        }
    }

    @Test
    public void backupPlaylistIsCleanLive() {
        String text = fixture("backup-live.m3u8");
        assertFalse(Playlists.hasStitchedAd(text));
        assertTrue(Playlists.isCleanLive(text));
        assertEquals(12456, Playlists.liveSequence(text));
    }

    @Test
    public void prepareKeepsStitchedCuesWhileAnAdIsPresent() {
        String prepared = Playlists.prepare(fixture("preroll-start.m3u8"));
        assertTrue(prepared.contains("CLASS=\"twitch-stitched-ad\""));
        assertTrue(Playlists.hasStitchedAd(prepared));
    }

    @Test
    public void prepareNumbersByLiveSequenceAndDropsClientAdCues() {
        String text = "#EXTM3U\n#EXT-X-VERSION:3\n#EXT-X-TARGETDURATION:6\n#EXT-X-MEDIA-SEQUENCE:15\n"
                + "#EXT-X-TWITCH-LIVE-SEQUENCE:15170\n"
                + "#EXT-X-DATERANGE:ID=\"maf-1\",CLASS=\"twitch-maf-ad\",START-DATE=\"2026-10-13T14:08:23.736Z\"\n"
                + "#EXT-X-DATERANGE:ID=\"p-1\",CLASS=\"live-video-net-metadata\",X-NET-LIVE-VIDEO-METADATA-TYPE=\"pbyp-preflight\"\n"
                + "#EXT-X-DATERANGE:ID=\"q-1\",CLASS=\"twitch-ad-quartile\",START-DATE=\"2026-10-13T14:08:23.736Z\"\n"
                + "#EXT-X-PROGRAM-DATE-TIME:2026-10-13T14:08:23.736Z\n#EXTINF:2.000,live\nhttps://a.ttvnw.net/1.ts\n";
        String prepared = Playlists.prepare(text);
        assertTrue(prepared.contains("#EXT-X-MEDIA-SEQUENCE:15170\n"));
        assertFalse(prepared.contains("twitch-maf-ad"));
        assertFalse(prepared.contains("pbyp-preflight"));
        assertFalse(prepared.contains("twitch-ad-quartile"));
        assertTrue(prepared.contains("#EXTINF:2.000,live\nhttps://a.ttvnw.net/1.ts"));
    }

    @Test
    public void prepareLeavesNormalLivePlaylistsAlone() {
        String text = fixture("backup-live.m3u8");
        assertEquals(text, Playlists.prepare(text));
    }

    @Test
    public void readsVariantsOfTheMasterPlaylist() {
        List<Playlists.Variant> variants = Playlists.variants(fixture("master.m3u8"),
                "https://usher.ttvnw.net/api/channel/hls/test.m3u8?token=x");
        assertEquals(6, variants.size());
        Playlists.Variant source = null;
        for (Playlists.Variant v : variants) if ("chunked".equals(v.group)) source = v;
        assertNotNull(source);
        assertTrue(source.uri.startsWith("https://"));
        assertTrue(variants.stream().anyMatch(Playlists.Variant::audioOnly));
    }

    @Test
    public void matchesTheSameRenditionAcrossSessions() {
        List<Playlists.Variant> primary = Playlists.variants(fixture("master.m3u8"), "https://usher.ttvnw.net/a.m3u8");
        for (Playlists.Variant wanted : primary) {
            assertSame(wanted, Playlists.match(primary, wanted));
        }
    }

    @Test
    public void fallsBackToTheClosestLowerBitrate() {
        List<Playlists.Variant> backup = Playlists.variants(
                "#EXTM3U\n"
                        + "#EXT-X-STREAM-INF:BANDWIDTH=630000,RESOLUTION=640x360,VIDEO=\"360p30\",FRAME-RATE=30.000\nhttps://b/360.m3u8\n"
                        + "#EXT-X-STREAM-INF:BANDWIDTH=230000,RESOLUTION=284x160,VIDEO=\"160p30\",FRAME-RATE=30.000\nhttps://b/160.m3u8\n",
                "https://usher.ttvnw.net/a.m3u8");
        Playlists.Variant wanted = Playlists.variants(
                "#EXTM3U\n#EXT-X-STREAM-INF:BANDWIDTH=8000000,RESOLUTION=1920x1080,VIDEO=\"chunked\",FRAME-RATE=60.000\nhttps://p/src.m3u8\n",
                "https://usher.ttvnw.net/a.m3u8").get(0);
        assertEquals("https://b/360.m3u8", Playlists.match(backup, wanted).uri);
    }

    @Test
    public void readsTheChannelOnlyFromLiveUsherUrls() {
        assertEquals("kato_junichi0817", Playlists.channel("https://usher.ttvnw.net/api/channel/hls/kato_junichi0817.m3u8?token=x"));
        assertEquals("abc", Playlists.channel("https://usher.ttvnw.net/api/v2/channel/hls/ABC.m3u8"));
        assertNull(Playlists.channel("https://usher.ttvnw.net/vod/123.m3u8"));
        assertNull(Playlists.channel("https://example.com/api/channel/hls/abc.m3u8"));
    }


    @Test
    public void swapsOnlyTheTokenOfAUsherUrl() {
        String url = Playlists.withToken(
                "https://usher.ttvnw.net/api/channel/hls/a.m3u8?token=old&sig=s1&allow_source=true&play_session_id=p&cdm=wv",
                "{\"a\":1}", "s2");
        assertTrue(url.startsWith("https://usher.ttvnw.net/api/channel/hls/a.m3u8?"));
        assertTrue(url.contains("token=%7B%22a%22%3A1%7D"));
        assertTrue(url.contains("sig=s2"));
        assertTrue(url.contains("allow_source=true"));
        assertTrue(url.contains("cdm=wv"));
        assertFalse(url.contains("play_session_id"));
        assertFalse(url.contains("old"));
    }

    @Test
    public void identifiesPlaylistsByPathWhateverTheQuery() {
        String a = "https://video-weaver.tyo05.hls.ttvnw.net/v1/playlist/ABCDEFGH.m3u8";
        assertEquals(Playlists.path(a), Playlists.path(a + "?_HLS_msn=5&player=x"));
        assertEquals(Playlists.path(a), Playlists.path(a.replace("tyo05", "tyo03")));
        assertNull(Playlists.path("https://x/"));
    }

    private static String media(String extra) {
        return "#EXTM3U\n#EXT-X-MEDIA-SEQUENCE:5\n#EXT-X-TWITCH-LIVE-SEQUENCE:5\n" + extra + "#EXTINF:2.000,live\nhttps://a/1.ts\n";
    }

    private static List<Playlists.Variant> variants(String... streams) {
        StringBuilder master = new StringBuilder("#EXTM3U\n");
        int n = 0;
        for (String stream : streams) master.append("#EXT-X-STREAM-INF:").append(stream).append("\nhttps://h/").append(n++).append(".m3u8\n");
        return Playlists.variants(master.toString(), "https://usher.ttvnw.net/");
    }

    @Test
    public void aSegmentNotTitledLiveIsAnAdEvenFromAnUnknownServer() {
        assertTrue(Playlists.hasStitchedAd(media("#EXTINF:2.000,NewAdServer|1\nhttps://a/ad.ts\n")));
        assertFalse(Playlists.hasStitchedAd(media("#EXTINF:2.000,\nhttps://a/x.ts\n")));
        assertFalse(Playlists.hasStitchedAd(fixture("backup-live.m3u8")));
    }

    @Test
    public void adAttributesOnlyCountOutsideInformationalCues() {
        String quartile = "#EXT-X-DATERANGE:ID=\"q\",CLASS=\"twitch-ad-quartile\",X-TV-TWITCH-AD-ROLL-TYPE=\"PREROLL\"\n";
        String clientAd = "#EXT-X-DATERANGE:ID=\"m\",CLASS=\"twitch-maf-ad\",X-TV-TWITCH-AD-URL=\"x\"\n";
        String unknown = "#EXT-X-DATERANGE:ID=\"n\",CLASS=\"twitch-new-ad\",X-TV-TWITCH-AD-URL=\"x\"\n";
        assertFalse(Playlists.hasStitchedAd(media(quartile)));
        assertFalse(Playlists.hasStitchedAd(media(clientAd)));
        assertTrue(Playlists.hasStitchedAd(media(unknown)));
        assertNull(Playlists.unknownAdMarker(media(quartile)));
        assertEquals("cue twitch-new-ad", Playlists.unknownAdMarker(media(unknown)));
    }

    @Test
    public void knownAdsAreNotReportedAsUnknownMarkers() {
        assertNull(Playlists.unknownAdMarker(fixture("preroll-start.m3u8")));
        assertNull(Playlists.unknownAdMarker(fixture("preroll-later.m3u8")));
        assertNull(Playlists.unknownAdMarker(fixture("backup-live.m3u8")));
        assertEquals("segment title Other|1", Playlists.unknownAdMarker(media("#EXTINF:2.000,Other|1\nhttps://a/ad.ts\n")));
    }

    @Test
    public void anUnknownPlaylistFormatIsLeftAlone() {
        assertTrue(Playlists.isMediaPlaylist(media("")));
        assertTrue(Playlists.isMediaPlaylist(fixture("preroll-start.m3u8")));
        assertFalse(Playlists.isMediaPlaylist("{\"error\":\"x\"}"));
        assertFalse(Playlists.isMediaPlaylist("#EXTM3U\n#EXT-X-MEDIA-SEQUENCE:1\n"));
    }

    @Test
    public void aBackupOfAnotherCodecIsNeverChosen() {
        Playlists.Variant wanted = variants("BANDWIDTH=9000000,RESOLUTION=1920x1080,CODECS=\"hev1.1.6.L120,mp4a.40.2\",VIDEO=\"chunked\",FRAME-RATE=60.000").get(0);
        List<Playlists.Variant> avc = variants("BANDWIDTH=8000000,RESOLUTION=1920x1080,CODECS=\"avc1.64002A,mp4a.40.2\",VIDEO=\"chunked\",FRAME-RATE=60.000");
        assertNull(Playlists.match(avc, wanted));
        List<Playlists.Variant> both = variants("BANDWIDTH=8000000,RESOLUTION=1920x1080,CODECS=\"avc1.64002A,mp4a.40.2\",VIDEO=\"chunked\",FRAME-RATE=60.000",
                "BANDWIDTH=9000000,RESOLUTION=1920x1080,CODECS=\"hev1.1.6.L120,mp4a.40.2\",VIDEO=\"chunked\",FRAME-RATE=60.000");
        assertEquals("hev1.1.6.l120", Playlists.match(both, wanted).codec);
    }

    @Test
    public void anotherProfileOfTheSameCodecIsABackup() {
        Playlists.Variant source = null;
        for (Playlists.Variant v : Playlists.variants(fixture("master.m3u8"), "https://usher.ttvnw.net/a.m3u8")) {
            if ("chunked".equals(v.group)) source = v;
        }
        List<Playlists.Variant> autoplay = variants(
                "BANDWIDTH=630000,RESOLUTION=640x360,CODECS=\"avc1.4D401E,mp4a.40.2\",VIDEO=\"360p30\",FRAME-RATE=30.000");
        assertEquals("https://h/0.m3u8", Playlists.match(autoplay, source).uri);
    }

    @Test
    public void previewPlayersAreRecognisedFromTheToken() throws Exception {
        String feed = "https://usher.ttvnw.net/api/channel/hls/a.m3u8?token="
                + java.net.URLEncoder.encode("{\"player_type\":\"mobile_feed\",\"channel\":\"a\"}", "UTF-8") + "&sig=x";
        String watched = "https://usher.ttvnw.net/api/channel/hls/a.m3u8?token="
                + java.net.URLEncoder.encode("{\"player_type\":\"site\"}", "UTF-8");
        assertEquals("mobile_feed", Playlists.playerType(feed));
        assertTrue(Playlists.isPreview(feed));
        assertFalse(Playlists.isPreview(watched));
        assertFalse(Playlists.isPreview("https://usher.ttvnw.net/api/channel/hls/a.m3u8"));
    }

    @Test
    public void aMovedPlaylistIsRecognisedBySharedSegments() {
        assertTrue(Playlists.shareSegment(media(""), media("")));
        assertFalse(Playlists.shareSegment(media(""), "#EXTM3U\n#EXTINF:2.000,live\nhttps://b/9.ts\n"));
    }
}
