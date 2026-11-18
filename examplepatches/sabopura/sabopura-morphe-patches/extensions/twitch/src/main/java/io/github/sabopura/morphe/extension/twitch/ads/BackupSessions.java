package io.github.sabopura.morphe.extension.twitch.ads;

import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

/**
 * Asks Twitch for an access token of another player type, without the user's credentials.
 *
 * <p>Twitch decides per session whether to stitch ads into the stream. Contexts where the app
 * itself never shows ads (the home feed preview, embeds, pop-outs) receive clean playlists of
 * the same stream, at full quality except {@code autoplay}. Only playlists come from these
 * sessions; nothing about the user is sent besides the channel name.
 */
final class BackupSessions {
    /** Twitch's own Android client ID, shipped in the app. */
    private static final String CLIENT_ID = "kd1unb4b3q4t58fwlpcbzcbnm76a8fp";
    private static final String GQL = "https://gql.twitch.tv/gql";
    private static final String QUERY = "query PlaybackAccessToken($login:String!,$playerType:String!)"
            + "{streamPlaybackAccessToken(channelName:$login,params:{platform:\"android\","
            + "playerBackend:\"mediaplayer\",playerType:$playerType}){value signature}}";
    /**
     * In order of preference. Measured on 2026-10-14 over 254 sessions that had a stitched ad:
     * mobile_feed and autoplay were ad-free in all of them, embed and popout almost never.
     * The stream proxy, when one is chosen in the playback settings, comes before autoplay,
     * which is the last resort because it stops at 360p.
     */
    static final String PROXY = "proxy";
    static final String[] SOURCES = {"mobile_feed", PROXY, "autoplay"};
    private static final long MAX_TOKEN_MS = 3000;

    static String sourceName(int index) {
        if (index < 0 || index >= SOURCES.length) return "?";
        return PROXY.equals(SOURCES[index]) ? "the stream proxy" : SOURCES[index];
    }

    /** A token, or null. Runs on a worker thread; connecting and reading share one time budget. */
    static String[] token(String login, String playerType, long deadline) {
        long limit = Math.min(deadline, System.currentTimeMillis() + MAX_TOKEN_MS);
        if (limit <= System.currentTimeMillis()) return null;
        HttpURLConnection c = null;
        try {
            JSONObject variables = new JSONObject().put("login", login).put("playerType", playerType);
            byte[] body = new JSONObject().put("query", QUERY).put("variables", variables)
                    .toString().getBytes(StandardCharsets.UTF_8);
            c = (HttpURLConnection) new URL(GQL).openConnection();
            c.setConnectTimeout(remaining(limit));
            c.setRequestMethod("POST");
            c.setDoOutput(true);
            c.setRequestProperty("Client-ID", CLIENT_ID);
            c.setRequestProperty("Content-Type", "application/json");
            try (OutputStream out = c.getOutputStream()) {
                out.write(body);
            }
            c.setReadTimeout(remaining(limit));
            if (c.getResponseCode() != 200) return null;
            JSONObject json = new JSONObject(read(c.getInputStream()));
            JSONObject data = json.optJSONObject("data");
            JSONObject token = data == null ? null : data.optJSONObject("streamPlaybackAccessToken");
            if (token == null) return null;
            String value = token.optString("value", "");
            String signature = token.optString("signature", "");
            return value.isEmpty() || signature.isEmpty() ? null : new String[]{value, signature};
        } catch (Exception e) {
            AdBlock.log("Backup token failed for " + playerType + ": " + e.getClass().getSimpleName());
            return null;
        } finally {
            if (c != null) c.disconnect();
        }
    }

    /** At least one millisecond: zero would mean no timeout at all. */
    private static int remaining(long limit) {
        return (int) Math.max(1, limit - System.currentTimeMillis());
    }

    private static String read(InputStream in) throws java.io.IOException {
        try (InputStream input = in) {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buffer = new byte[8192];
            int n;
            while ((n = input.read(buffer)) > 0) {
                if (out.size() + n > 256 * 1024) throw new java.io.IOException("token response too large");
                out.write(buffer, 0, n);
            }
            return new String(out.toByteArray(), StandardCharsets.UTF_8);
        }
    }
}
