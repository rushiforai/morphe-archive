package app.morphed.extension.twitch.adblock;

import org.junit.Test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

public class AccessTokenClientTest {
    @Test
    public void requestBodyUsesWebPlatformForSourceTypes() {
        String body = AccessTokenClient.requestBody("somechannel", "popout");

        assertTrue(body.contains("\"login\":\"somechannel\""));
        assertTrue(body.contains("\"playerType\":\"popout\""));
        assertTrue(body.contains("\"platform\":\"web\""));
        assertTrue(body.contains("\"sha256Hash\":\""));
    }

    @Test
    public void requestBodyUsesAndroidPlatformForAutoplay() {
        assertTrue(AccessTokenClient.requestBody("somechannel", "autoplay").contains("\"platform\":\"android\""));
    }

    @Test
    public void parsesTokenWithEscapedJsonValue() {
        AccessTokenClient.Token token = AccessTokenClient.parse(FakeHttp.tokenResponse("site"));

        assertEquals("{\"player_type\":\"site\"}", token.value);
        assertEquals("sig-site", token.signature);
    }

    @Test
    public void missingTokenIsNull() {
        assertNull(AccessTokenClient.parse("{\"errors\":[{\"message\":\"server error\"}]}"));
        assertNull(AccessTokenClient.parse("{\"data\":{\"streamPlaybackAccessToken\":null}}"));
    }

    @Test
    public void usherUrlSwapsTokenAndKeepsOtherParameters() {
        AccessTokenClient.Token token = AccessTokenClient.parse(FakeHttp.tokenResponse("site"));
        String url = BackupStreamFinder.usherUrl("https://usher.ttvnw.net/api/v2/channel/hls/x.m3u8?token=old&a=1&sig=old", token);

        assertEquals("https://usher.ttvnw.net/api/v2/channel/hls/x.m3u8?a=1&sig=sig-site"
                + "&token=%7B%22player_type%22%3A%22site%22%7D", url);
    }
}
