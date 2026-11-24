package app.morphed.extension.twitch.unlock;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;

import java.nio.charset.StandardCharsets;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.Collections;
import java.util.List;

import app.morphed.extension.twitch.net.JsonParser;
import app.morphed.extension.twitch.net.Web;
import app.morphed.extension.twitch.vpn.crypto.X25519;

/** The quality unlock's requests, decisions and VPN server storage. */
public class UnlockTest {
    @Rule
    public TemporaryFolder folder = new TemporaryFolder();

    static final String DIRECT = "#EXTM3U\n#EXT-X-MEDIA:TYPE=VIDEO,GROUP-ID=\"chunked\",NAME=\"1080p60\"\n"
            + "#EXT-X-STREAM-INF:BANDWIDTH=8000000,IVS-NAME=\"1080p60\",STABLE-VARIANT-ID=\"1080p60\"\nhttps://a.playlist.ttvnw.net/v1/1080.m3u8\n"
            + "#EXT-X-STREAM-INF:BANDWIDTH=3000000,IVS-NAME=\"720p60\"\nhttps://a.playlist.ttvnw.net/v1/720.m3u8\n"
            + "#EXT-X-STREAM-INF:BANDWIDTH=160000,IVS-NAME=\"audio_only\"\nhttps://a.playlist.ttvnw.net/v1/audio.m3u8\n";
    static final String UNLOCKED = DIRECT.replace("#EXTM3U\n", "#EXTM3U\n#EXT-X-STREAM-INF:BANDWIDTH=12000000,IVS-NAME=\"1440p60\","
            + "CODECS=\"hev1.1.6.L150\"\nhttps://b.playlist.ttvnw.net/v1/1440.m3u8\n");

    @Test
    public void readsQualitiesAndWhatOnlyTheVpnOffers() {
        assertEquals(Arrays.asList("1080p60", "720p60"), UnlockFetcher.qualities(DIRECT));
        List<String> unlocked = UnlockFetcher.qualities(UNLOCKED);
        assertEquals(Arrays.asList("1440p60", "1080p60", "720p60"), unlocked);
        assertEquals(Collections.singletonList("1440p60"), UnlockFetcher.unlockedOnly(UnlockFetcher.qualities(DIRECT), unlocked));
        assertTrue(UnlockFetcher.unlockedOnly(unlocked, unlocked).isEmpty());
    }

    @Test
    public void asksForATokenThenThePlaylistWithHevc() throws UnlockFetcher.Failed {
        List<Web.Request> asked = new ArrayList<>();
        Web web = request -> {
            asked.add(request);
            if (request.url.contains("gql.twitch.tv")) {
                return ok("{\"data\":{\"streamPlaybackAccessToken\":{\"value\":\"{\\\"a\\\":1}\",\"signature\":\"sig1\"}}}");
            }
            return ok(UNLOCKED);
        };
        UnlockFetcher.Result result = new UnlockFetcher().fetch(web, "SomeStreamer", "tok", 5000);
        assertEquals(UNLOCKED, result.master);
        assertEquals("OAuth tok", asked.get(0).headers.get("Authorization"));
        assertEquals(UnlockFetcher.ANDROID_CLIENT_ID, asked.get(0).headers.get("Client-ID"));
        Object body = JsonParser.parse(new String(asked.get(0).body, StandardCharsets.UTF_8));
        assertEquals("somestreamer", JsonParser.string(body, "variables", "login"));
        String usher = asked.get(1).url;
        assertTrue(usher, usher.startsWith("https://usher.ttvnw.net/api/v2/channel/hls/somestreamer.m3u8?"));
        assertTrue(usher, usher.contains("supported_codecs=h264,h265") && usher.contains("sig=sig1")
                && usher.contains("token=%7B%22a%22%3A1%7D"));
    }

    @Test
    public void aRejectedLoginIsToldAsSuch() {
        Web web = request -> new Web.Response(401, Collections.emptyMap(),
                "{\"error\":\"Unauthorized\",\"message\":\"The \\\"Authorization\\\" token is invalid.\"}".getBytes(StandardCharsets.UTF_8));
        try {
            new UnlockFetcher().fetch(web, "a", "bad", 5000);
            fail();
        } catch (UnlockFetcher.Failed failed) {
            assertTrue(failed.login);
            assertTrue(failed.getMessage(), failed.getMessage().startsWith("Twitch rejected the login (app client, 401: "));
            assertTrue(failed.getMessage(), failed.getMessage().contains("; Twitch rejected the login (web client, 401: "));
            assertTrue(failed.getMessage(), failed.getMessage().contains("token is invalid"));
        }
    }

    @Test
    public void anOfflineChannelIsToldAsSuch() {
        Web web = request -> request.url.contains("gql")
                ? ok("{\"data\":{\"streamPlaybackAccessToken\":{\"value\":\"v\",\"signature\":\"s\"}}}")
                : new Web.Response(404, Collections.emptyMap(), new byte[0]);
        try {
            new UnlockFetcher().fetch(web, "sleepy", "t", 5000);
            fail();
        } catch (UnlockFetcher.Failed failed) {
            assertEquals("sleepy isn't live (Twitch said so through the VPN)", failed.getMessage());
        }
    }

    private static Web.Response ok(String body) {
        return new Web.Response(200, Collections.emptyMap(), body.getBytes(StandardCharsets.UTF_8));
    }

    @Test
    public void onlyTheUnlockedStreamsOwnAddressesGoThroughTheTunnel() {
        QualityUnlock.learnAddresses(UNLOCKED + "#EXT-X-PREFETCH:https://edge-1.abs.hls.ttvnw.net/v1/segment/S9.ts\n"
                + "https://edge-1.abs.hls.ttvnw.net/v1/segment/S8.ts?x=1\n");
        assertTrue(QualityUnlock.knows("https://b.playlist.ttvnw.net/v1/1440.m3u8?p=2"));
        assertTrue(QualityUnlock.knows("https://edge-1.abs.hls.ttvnw.net/v1/segment/S8.ts"));
        assertTrue(QualityUnlock.knows("https://edge-1.abs.hls.ttvnw.net/v1/segment/S9.ts"));
        // a preview served from the same video server is not the unlocked stream
        assertTrue(!QualityUnlock.knows("https://edge-1.abs.hls.ttvnw.net/v1/segment/PREVIEW1.ts"));
    }

    @Test
    public void aLongStreamKeepsItsPlaylistsInTheTunnel() {
        QualityUnlock.learnAddresses(UNLOCKED);
        // hours of video pieces: past the limit, the old pieces are forgotten
        StringBuilder pieces = new StringBuilder();
        for (int i = 0; i < 4100; i++) pieces.append("https://edge-1.abs.hls.ttvnw.net/v1/segment/L").append(i).append(".ts\n");
        QualityUnlock.learnAddresses(pieces.toString());
        QualityUnlock.learnAddresses("https://edge-1.abs.hls.ttvnw.net/v1/segment/NEW.ts\n");
        assertTrue("the playlist is still the stream's", QualityUnlock.knows("https://b.playlist.ttvnw.net/v1/1440.m3u8?p=3"));
        assertTrue(QualityUnlock.knows("https://edge-1.abs.hls.ttvnw.net/v1/segment/NEW.ts"));
        assertTrue("old pieces forgotten", !QualityUnlock.knows("https://edge-1.abs.hls.ttvnw.net/v1/segment/L0.ts"));
    }

    @Test
    public void aVpnFailureIsToldOnceForEachUnlockedStream() {
        QualityUnlock.TUNNEL_FAILURE_TOLD.set(false);
        QualityUnlock.tunnelFailed("timed out");
        assertTrue(QualityUnlock.status().problem);
        assertTrue(QualityUnlock.TUNNEL_FAILURE_TOLD.get());
        QualityUnlock.tunnelFailed("timed out again"); // the next pieces: not told again
        assertTrue(QualityUnlock.TUNNEL_FAILURE_TOLD.get());
    }

    @Test
    public void findsTheChannelOfALivePlaylistRequest() {
        assertEquals("streamer", QualityUnlock.channelOf("https://usher.ttvnw.net/api/v2/channel/hls/Streamer.m3u8?token=x"));
        assertEquals("streamer", QualityUnlock.channelOf("https://usher.ttvnw.net/api/channel/hls/streamer.m3u8"));
        assertNull(QualityUnlock.channelOf("https://usher.ttvnw.net/vod/v2/123.m3u8"));
        assertNull(QualityUnlock.channelOf("https://video-edge.abs.hls.ttvnw.net/v1/segment/x.ts"));
    }

    @Test
    public void keepsVpnServersAndRefusesOthers() throws Exception {
        VpnServers servers = new VpnServers(folder.getRoot());
        SecureRandom random = new SecureRandom();
        String key = Base64.getEncoder().encodeToString(X25519.generatePrivateKey(random));
        String config = "[Interface]\nPrivateKey = " + key + "\nAddress = 10.2.0.2/32\n[Peer]\nPublicKey = " + key
                + "\nEndpoint = 1.2.3.4:51820\n";
        assertEquals("wg-NL-FREE-1", servers.add("/storage/emulated/0/Download/wg-NL-FREE-1.conf", config));
        assertEquals("Server 2", servers.add("Server 2", config));
        assertEquals(Arrays.asList("Server 2", "wg-NL-FREE-1"), servers.names());
        try {
            servers.add("notes.txt", "just some notes");
            fail();
        } catch (IllegalArgumentException expected) {
            assertTrue(expected.getMessage().contains("isn't a WireGuard config"));
        }
        List<String> problems = new ArrayList<>();
        assertEquals(2, servers.configs(problems).size());
        assertTrue(servers.remove("Server 2"));
        assertEquals(Collections.singletonList("wg-NL-FREE-1"), servers.names());
    }

    @Test
    public void aPasteTakesAFreeNameAndNeverOverwrites() throws Exception {
        VpnServers servers = new VpnServers(folder.getRoot());
        String key = Base64.getEncoder().encodeToString(X25519.generatePrivateKey(new SecureRandom()));
        String config = "[Interface]\nPrivateKey = " + key + "\nAddress = 10.2.0.2/32\n[Peer]\nPublicKey = " + key
                + "\nEndpoint = 1.2.3.4:51820\n";
        assertEquals("Server 1", servers.freeName());
        servers.add(servers.freeName(), config);
        servers.add(servers.freeName(), config + "# second\n");
        assertTrue(servers.remove("Server 1"));
        // Server 2 is kept: the next paste takes the free Server 1, not a count that lands on Server 2
        assertEquals("Server 1", servers.freeName());
        assertTrue(servers.text("Server 2").contains("# second"));
        assertTrue(servers.has("Server 2"));
        assertTrue(servers.has("Server 2.conf"));
    }

    @Test
    public void aFileOfTheSameNameReplacesAndCanBePutBack() throws Exception {
        VpnServers servers = new VpnServers(folder.getRoot());
        String key = Base64.getEncoder().encodeToString(X25519.generatePrivateKey(new SecureRandom()));
        String config = "[Interface]\nPrivateKey = " + key + "\nAddress = 10.2.0.2/32\n[Peer]\nPublicKey = " + key
                + "\nEndpoint = 1.2.3.4:51820\n";
        servers.add("nl.conf", config);
        assertTrue("an import of the same name is a replacement", servers.has("/sdcard/Download/nl.conf"));
        servers.add("nl.conf", config.replace("1.2.3.4", "5.6.7.8"));
        assertEquals(Collections.singletonList("nl"), servers.names());
        String kept = servers.text("nl");
        assertTrue(kept.contains("5.6.7.8"));
        assertTrue(servers.remove("nl"));
        assertNull(servers.text("nl"));
        servers.add("nl", kept); // the undo
        assertEquals("5.6.7.8", servers.configs(new ArrayList<>()).get(0).endpointHost);
    }
}
