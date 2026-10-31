package app.morphed.extension.twitch.adblock;

import java.io.IOException;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.Map;

/**
 * Requests an anonymous playback access token for a given player type, as vaft does.
 */
public final class AccessTokenClient {
    public static final class Token {
        public final String value;
        public final String signature;

        Token(String value, String signature) {
            this.value = value;
            this.signature = signature;
        }
    }

    private static final String GQL_URL = "https://gql.twitch.tv/gql";
    // Public web client id and the PlaybackAccessToken persisted query hash, both taken from vaft.
    private static final String CLIENT_ID = "kimne78kx3ncx6brgo4mv6wki5h1ko";
    private static final String QUERY_HASH = "ed230aa1e33e07eebb8928504583da78a5173989fadfb1ac94be06a04f3cdbe9";

    private final Http http;
    private final String deviceId;

    public AccessTokenClient(Http http) {
        this(http, randomDeviceId());
    }

    AccessTokenClient(Http http, String deviceId) {
        this.http = http;
        this.deviceId = deviceId;
    }

    /** The token, or null when Twitch did not hand one out for this player type. */
    public Token fetch(String channel, String playerType) throws IOException {
        Map<String, String> headers = new HashMap<>();
        headers.put("Client-ID", CLIENT_ID);
        headers.put("X-Device-Id", deviceId);
        headers.put("Content-Type", "text/plain;charset=UTF-8");

        Http.Response response = http.post(GQL_URL, headers, requestBody(channel, playerType));
        if (!response.isOk()) return null;
        return parse(response.body);
    }

    static String requestBody(String channel, String playerType) {
        // vaft asks for the 360p autoplay stream as an Android client.
        String platform = "autoplay".equals(playerType) ? "android" : "web";
        return "{\"operationName\":\"PlaybackAccessToken\",\"variables\":{"
                + "\"isLive\":true,\"login\":" + Json.quote(channel)
                + ",\"isVod\":false,\"vodID\":\"\",\"playerType\":" + Json.quote(playerType)
                + ",\"platform\":" + Json.quote(platform) + "},"
                + "\"extensions\":{\"persistedQuery\":{\"version\":1,\"sha256Hash\":\"" + QUERY_HASH + "\"}}}";
    }

    static Token parse(String body) {
        int tokenStart = body.indexOf("\"streamPlaybackAccessToken\"");
        if (tokenStart < 0) return null;
        String value = Json.stringValue(body, "value", tokenStart);
        String signature = Json.stringValue(body, "signature", tokenStart);
        if (value == null || signature == null) return null;
        return new Token(value, signature);
    }

    private static String randomDeviceId() {
        String characters = "abcdefghijklmnopqrstuvwxyz0123456789";
        SecureRandom random = new SecureRandom();
        StringBuilder id = new StringBuilder(32);
        for (int i = 0; i < 32; i++) id.append(characters.charAt(random.nextInt(characters.length())));
        return id.toString();
    }
}
