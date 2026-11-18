// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.extension.syncforreddit;

import android.net.Uri;
import android.util.Log;
import com.android.volley.NetworkResponse;
import com.google.android.exoplayer2.upstream.DataSource;
import com.google.android.exoplayer2.upstream.DataSpec;
import com.google.android.exoplayer2.upstream.ResolvingDataSource;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import org.json.JSONObject;

/**
 * Answers the app's three Redgifs requests with Redgifs' temporary-token API. The app's client credentials still
 * get a token, but it no longer returns video URLs, and the address lookup it needs first is gone (404). Enhanced
 * autoplay asked its developer's image server for a Redgifs video; that comes from the same API ({@link #autoplay}).
 */
public final class Redgifs {
    private static final String API = "https://api.redgifs.com";
    private static final String TOKEN_URL = API + "/v2/oauth/client";
    private static final String ADDRESS_URL = API + "/info";
    private static final String GIF_URL = API + "/v2/gifs/";
    // Temporary tokens last 24 hours; renew an hour early.
    private static final long TOKEN_LIFETIME_MS = 23L * 60 * 60 * 1000;
    private static final String AUTOPLAY = ImageServer.PREFIX + "redgifs-";
    // The player opens a video once per range it reads; look each one up once.
    private static final Map<String, String> VIDEOS = new LinkedHashMap<String, String>(16, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, String> eldest) {
            return size() > 64;
        }
    };

    private static final class Session {
        final String token;
        final String address;
        final long expiresAt;

        Session(String token, String address, long expiresAt) {
            this.token = token;
            this.address = address;
            this.expiresAt = expiresAt;
        }
    }

    private static Session session;

    private Redgifs() {}

    /** Turned on by the "Fix Redgifs" patch. */
    public static boolean isEnabled() {
        return false;
    }

    static boolean handles(String url) {
        return url != null && (url.startsWith(TOKEN_URL) || url.startsWith(ADDRESS_URL) || url.startsWith(GIF_URL));
    }

    /**
     * Never returns null: the app's own requests would send Redgifs its client credentials and the User-Agent it
     * sends to Reddit. A failure becomes an error response, which the app reports as a failed load.
     */
    static NetworkResponse answer(String url) {
        try {
            if (url.startsWith(TOKEN_URL)) return json(new JSONObject().put("access_token", session(false).token));
            if (url.startsWith(ADDRESS_URL)) return json(new JSONObject().put("remote-addr", session(false).address));
            String id = gifId(url);
            if (id == null) return failure();
            return VolleyHook.response(gif(id));
        } catch (Exception error) {
            Log.w(VolleyHook.TAG, "Redgifs request failed: " + url, error);
            return failure();
        }
    }

    /** The gif ID from the app's {@code /v2/gifs/<id>?user-addr=…} URL, lowercased as Redgifs requires, or null. */
    static String gifId(String url) {
        if (url == null || !url.startsWith(GIF_URL)) return null;
        String rest = url.substring(GIF_URL.length());
        int end = rest.length();
        for (char stop : new char[] {'?', '/', '#'}) {
            int at = rest.indexOf(stop);
            if (at >= 0 && at < end) end = at;
        }
        String id = rest.substring(0, end);
        // The app keeps the case of IDs it takes from media URLs (BothPrivatePigeon-mobile.mp4); the API answers 404.
        return id.matches("[A-Za-z0-9]+") ? id.toLowerCase(Locale.ROOT) : null;
    }

    /** Redgifs' answer for one gif, {@code {"gif":{…}}}. */
    private static Http.Reply gif(String id) throws Exception {
        Http.Reply reply = Http.send("GET", GIF_URL + id, headers(session(false).token), null, true);
        // A token is bound to the User-Agent it was issued for and may have been revoked early.
        if (reply.status == 401) reply = Http.send("GET", GIF_URL + id, headers(session(true).token), null, true);
        return reply;
    }

    /**
     * Wraps one of the app's video sources so that Enhanced autoplay's Redgifs URLs, {@code …?url=redgifs-<id>}, play
     * Redgifs' HD video; every other URL passes through as it was. The app's video cache sits in front of the
     * wrapped source, so it keeps a played video under the app's own URL.
     */
    public static DataSource.Factory autoplay(DataSource.Factory upstream) {
        return isEnabled() ? new ResolvingDataSource.Factory(upstream, new AutoplayResolver()) : upstream;
    }

    /** Runs on the player's loading thread. The app's player ignores errors: a failed video stays a still. */
    private static final class AutoplayResolver implements ResolvingDataSource.Resolver {
        @Override
        public DataSpec resolveDataSpec(DataSpec dataSpec) throws IOException {
            String video = resolve(dataSpec.uri.toString(), Redgifs::gif);
            return video == null ? dataSpec : dataSpec.withUri(Uri.parse(video));
        }

        @Override
        public Uri resolveReportedUri(Uri uri) {
            return uri;
        }
    }

    /**
     * The video to play for a URL the player opens, or null to open it as it is. Throws only IOException: a lost
     * connection as it was, which the player tries again, and everything else as FileNotFoundException, which it
     * doesn't. Other videos the app sends to its developer's image server fail without asking it.
     */
    static String resolve(String url, Gifs gifs) throws IOException {
        if (url == null || !url.startsWith(ImageServer.PREFIX)) return null;
        // Enhanced autoplay's other videos, Gfycat's: the image server isn't sent links, as in ImageServer.
        if (!url.startsWith(AUTOPLAY)) throw new FileNotFoundException("Sync's image server is gone: " + url);
        try {
            return video(url, gifs);
        } catch (IOException error) {
            throw error;
        } catch (Exception error) {
            FileNotFoundException missing = new FileNotFoundException("Redgifs autoplay failed: " + url);
            missing.initCause(error);
            throw missing;
        }
    }

    /** Looks up one gif; a fake in tests. */
    interface Gifs {
        Http.Reply get(String id) throws Exception;
    }

    /** The HD video, or the SD one if there is none, for an Enhanced autoplay URL. */
    static String video(String url, Gifs gifs) throws Exception {
        String id = autoplayId(url);
        if (id == null) throw new IllegalArgumentException("Unexpected Redgifs autoplay URL: " + url);
        synchronized (VIDEOS) {
            String video = VIDEOS.get(id);
            if (video != null) return video;
        }
        Http.Reply reply = gifs.get(id);
        if (reply.status != 200) throw new IllegalStateException("Redgifs answered " + reply.status + " for " + id);
        JSONObject urls = new JSONObject(new String(reply.body, StandardCharsets.UTF_8))
                .getJSONObject("gif")
                .getJSONObject("urls");
        String video = string(urls, "hd");
        if (video.isEmpty()) video = string(urls, "sd");
        // java.net.URI: android.net.Uri is a stub in unit tests.
        String host = video.isEmpty() ? null : new URI(video).getHost();
        if (!video.startsWith("https://") || host == null || !host.endsWith(".redgifs.com")) {
            throw new IllegalStateException("Redgifs has no video for " + id);
        }
        synchronized (VIDEOS) {
            VIDEOS.put(id, video);
        }
        return video;
    }

    /** The string at the key, or "" for anything else: Android's optString turns a JSON null into "null". */
    private static String string(JSONObject object, String key) {
        Object value = object.opt(key);
        return value instanceof String ? (String) value : "";
    }

    /**
     * The gif ID in an Enhanced autoplay URL, lowercased as Redgifs requires, or null. The app takes it from the
     * post's link and keeps its case ({@code BothPrivatePigeon}).
     */
    static String autoplayId(String url) {
        if (url == null || !url.startsWith(AUTOPLAY)) return null;
        String id = url.substring(AUTOPLAY.length());
        return id.matches("[A-Za-z0-9]+") ? id.toLowerCase(Locale.ROOT) : null;
    }

    private static synchronized Session session(boolean renew) throws Exception {
        if (renew || session == null || System.currentTimeMillis() >= session.expiresAt) {
            Http.Reply reply = Http.send("GET", API + "/v2/auth/temporary", headers(null), null, true);
            if (reply.status != 200) throw new IllegalStateException("Redgifs token request returned " + reply.status);
            JSONObject body = new JSONObject(new String(reply.body, StandardCharsets.UTF_8));
            session = new Session(
                    body.getString("token"), body.optString("addr", ""), System.currentTimeMillis() + TOKEN_LIFETIME_MS);
        }
        return session;
    }

    private static Map<String, String> headers(String bearer) {
        Map<String, String> headers = new HashMap<>();
        headers.put("User-Agent", Http.systemUserAgent());
        if (bearer != null) headers.put("Authorization", "Bearer " + bearer);
        return headers;
    }

    private static NetworkResponse json(JSONObject body) {
        return VolleyHook.json(200, body.toString().getBytes(StandardCharsets.UTF_8));
    }

    private static NetworkResponse failure() {
        return VolleyHook.json(502, new byte[0]);
    }
}
