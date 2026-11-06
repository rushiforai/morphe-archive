package dev.twitchpatches.extension.ads.hls;

import org.junit.Test;
import java.net.URI;
import java.net.URLDecoder;
import static org.junit.Assert.*;

public class MasterIdentityTest {
    @Test public void preservesLastCharacterAndCaseForTokenQuery() {
        assertEquals("WhiskeyDing0", MasterIdentity.channel("https://usher.ttvnw.net/api/channel/hls/WhiskeyDing0.m3u8?token=placeholder"));
        assertEquals("trymacs", MasterIdentity.channel("https://usher.ttvnw.net/api/channel/hls/trymacs.m3u8"));
        assertEquals("a", MasterIdentity.channel("https://usher.ttvnw.net/api/channel/hls/a.m3u8"));
    }

    @Test public void excludesVodNestedAndUntrustedPaths() {
        assertNull(MasterIdentity.channel("https://usher.ttvnw.net/vod/123.m3u8"));
        assertNull(MasterIdentity.channel("https://usher.ttvnw.net/api/channel/hls/a/b.m3u8"));
        assertNull(MasterIdentity.channel("https://example.com/api/channel/hls/trymacs.m3u8"));
        assertNull(MasterIdentity.channel("http://usher.ttvnw.net/api/channel/hls/trymacs.m3u8"));
        assertNull(MasterIdentity.channel("https://usher.ttvnw.net/api/v3/channel/hls/trymacs.m3u8"));
        assertNull(MasterIdentity.channel("https://usher.ttvnw.net/api/v2/channel/hls/a/b.m3u8"));
        assertNull(MasterIdentity.channel("https://usher.ttvnw.net/api/v2/channel/hls/.m3u8"));
    }

    @Test public void multiformatRouteResolvesTheSameChannelWithoutWideningTrust() {
        String url = "https://usher.ttvnw.net/api/v2/channel/hls/WhiskeyDing0.m3u8?multigroup_video=true";
        assertEquals("WhiskeyDing0", MasterIdentity.channel(url));
        assertEquals("multiformat", MasterIdentity.route(url));
        assertEquals("legacy", MasterIdentity.route("https://usher.ttvnw.net/api/channel/hls/a.m3u8"));
        assertEquals("unrecognized", MasterIdentity.route("invalid URL"));
        assertNull(MasterIdentity.channel(url.replace("usher.ttvnw.net", "evil.ttvnw.net")));
    }

    @Test public void replacingSignedTokenPreservesMultiformatEndpointAndCapabilities() throws Exception {
        String original = "https://usher.ttvnw.net/api/v2/channel/hls/a.m3u8?allow_source=true&" +
                "multigroup_video=true&cdm=test%2Bvalue&sig=old&token=old&p=123&play_session_id=placeholder";
        URI result = URI.create(MasterIdentity.replaceToken(original, "new+sig", "{\"key\":\"test/value\"}"));
        assertEquals("/api/v2/channel/hls/a.m3u8", result.getPath());
        assertEquals("allow_source=true&multigroup_video=true&cdm=test%2Bvalue&play_session_id=placeholder&" +
                "sig=new%2Bsig&token=%7B%22key%22%3A%22test%2Fvalue%22%7D", result.getRawQuery());
        assertTrue(URLDecoder.decode(result.getRawQuery(), "UTF-8").contains("{\"key\":\"test/value\"}"));
        assertEquals("/api/channel/hls/a.m3u8", URI.create(MasterIdentity.replaceToken(
                "https://usher.ttvnw.net/api/channel/hls/a.m3u8", "sig", "value")).getPath());
    }

    @Test(expected = IllegalArgumentException.class)
    public void unknownEndpointCannotBecomeAnAlternateRequest() {
        MasterIdentity.replaceToken("https://example.com/api/v2/channel/hls/a.m3u8", "sig", "value");
    }
}
