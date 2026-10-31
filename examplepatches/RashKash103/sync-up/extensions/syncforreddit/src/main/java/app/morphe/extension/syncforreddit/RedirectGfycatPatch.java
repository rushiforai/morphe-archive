package app.morphe.extension.syncforreddit;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.fixes.redgifs.RedgifsTokenManager;
import app.morphe.extension.shared.requests.PatchedditInterceptor;
import app.morphe.extension.shared.requests.Requester;
import app.morphe.extension.syncforreddit.http.OkHttpRequestHook;
import okhttp3.HttpUrl;
import okhttp3.MediaType;
import okhttp3.Protocol;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;

/**
 * Gfycat shut down and its domains no longer resolve, so every Gfycat request Sync makes
 * fails outright. Much of the content moved to RedGifs under the same slug before the
 * shutdown, so answer Sync's Gfycat requests from RedGifs instead.
 *
 * <p>Sync asks for a Gfycat link twice. First it calls the API, and if that fails it falls
 * back to scraping the original link for an mp4 URL. Both are answered here: the API request
 * with the JSON Sync expects, the scrape with a body holding the media URLs. RedGifs kept
 * Gfycat's URL scheme, so the scraper's own parsing works on it unchanged.
 *
 * @noinspection unused
 */
public class RedirectGfycatPatch extends PatchedditInterceptor {
    private static final String GFYCAT_HOST = "gfycat.com";
    private static final String GFYCAT_API_HOST = "api.gfycat.com";
    private static final String GFYCAT_API_PATH = "/v1/gfycats/";
    private static final String REDGIFS_GIF_ENDPOINT = RedgifsTokenManager.REDGIFS_API_HOST + "/v2/gifs/";

    /** Sync's own proxy, which is still there and refuses everything. */
    private static final String THEIR_PROXY = "ap.syncforreddit.com";

    private static final String THEIR_PROXY_PATH = "/image";

    private static final String THE_TARGET = "url";

    /**
     * How the proxy was asked for a video rather than an address. With Sync's enhanced autoplay
     * setting on, a Gfycat or RedGifs post in a feed is played from the proxy rather than from
     * the site itself, so with the proxy refusing everything that setting stops those playing
     * at all — which is worse than leaving it off.
     */
    private static final String[] PROXY_TOKENS = { "redgifs-", "gfycat-" };

    private static final RedirectGfycatPatch INSTANCE = new RedirectGfycatPatch();

    private RedirectGfycatPatch() {}

    /**
     * Registered on the shared request hook, which covers the client Sync's Volley uses and
     * the one it hands to Glide. Installing it on a single client left image loads, and so
     * every Gfycat thumbnail, going straight to a domain that no longer resolves.
     */
    public static RedirectGfycatPatch get() {
        return INSTANCE;
    }

    @Override
    public boolean isPatchIncluded() {
        // Overridden by patch.
        return false;
    }

    /**
     * Sync's user agent. RedGifs ties a token to the user agent it was issued for and rejects
     * later requests that use a different one, so the same value must be used throughout.
     */
    public static String getUserAgent() {
        // To be filled in by patch
        return "";
    }

    @NonNull
    @Override
    protected Response doIntercept(@NonNull Chain chain) throws IOException {
        Request request = chain.request();
        HttpUrl url = request.url();
        String host = url.host();

        String proxied = whatTheProxyWasAskedFor(url);
        if (proxied != null) {
            return autoplay(chain, request, proxied);
        }

        if (!host.equals(GFYCAT_HOST) && !host.endsWith("." + GFYCAT_HOST)) {
            return chain.proceed(request);
        }

        boolean isApiRequest = host.equals(GFYCAT_API_HOST)
                && url.encodedPath().startsWith(GFYCAT_API_PATH);
        boolean isPageRequest = host.equals(GFYCAT_HOST) || host.equals("www." + GFYCAT_HOST);

        // Assigned once: the lambdas below capture it, so it has to stay effectively final.
        String id = normalizeId(isApiRequest
                ? url.encodedPath().substring(GFYCAT_API_PATH.length())
                : lastPathSegment(url));

        if (id.isEmpty()) {
            return gone(request);
        }

        try {
            // Lets a genuine connection failure surface as one, rather than being reported as
            // content that no longer exists.
            MediaUrls media = lookup(id);
            if (media == null) {
                Logger.printDebug(() -> "No RedGifs mirror for Gfycat id " + id);
                return gone(request);
            }

            // Sync's own scraper reads a Gfycat page for the video in it, and whatever draws
            // pictures asks for the very same address wanting a picture. Answering both with the
            // page leaves one of them with something it cannot use.
            if (isPageRequest && request.header(OkHttpRequestHook.IMAGE_REQUEST) != null) {
                String still = media.poster != null ? media.poster : media.thumbnail;
                if (still == null) {
                    return gone(request);
                }
                Logger.printInfo(() -> "Drawing Gfycat id " + id + " from its RedGifs still");
                return chain.proceed(request.newBuilder()
                        .url(still)
                        .header("User-Agent", getUserAgent())
                        .build());
            }

            if (!isApiRequest && !isPageRequest) {
                // A request to one of Gfycat's media subdomains, which is how every thumbnail in
                // a feed is loaded. Reissuing it against the mirror is what makes those load,
                // rather than leaving a feed of blank tiles.
                String mirrored = mediaFor(media, url.encodedPath());
                if (mirrored == null) {
                    return gone(request);
                }
                Logger.printDebug(() -> "Serving Gfycat media " + id + " from RedGifs");
                return chain.proceed(request.newBuilder()
                        .url(mirrored)
                        .header("User-Agent", getUserAgent())
                        .build());
            }

            Logger.printDebug(() -> "Serving Gfycat id " + id + " from RedGifs");
            return isApiRequest
                    ? respond(request, "application/json", apiBody(media))
                    : respond(request, "text/html", scrapeBody(media));
        } catch (JSONException ex) {
            Logger.printInfo(() -> "Could not parse RedGifs response for Gfycat id " + id, ex);
            return gone(request);
        }
    }

    /**
     * @return The id the proxy was asked to resolve into a video, or null where the request is
     *         not one of those. What Sync sends is already the id: it takes the last part of the
     *         link and strips the extension and the size suffix before asking.
     */
    @Nullable
    private static String whatTheProxyWasAskedFor(HttpUrl url) {
        if (!THEIR_PROXY.equals(url.host())
                || !url.encodedPath().startsWith(THEIR_PROXY_PATH)) {
            return null;
        }

        String target = url.queryParameter(THE_TARGET);
        if (target == null) {
            return null;
        }

        for (String token : PROXY_TOKENS) {
            if (target.startsWith(token)) {
                return normalizeId(target.substring(token.length()));
            }
        }
        return null;
    }

    /**
     * Answers what the proxy was asked with the video itself, which is what it served. RedGifs
     * holds both what it always did and what came over from Gfycat, so one lookup covers both
     * tokens.
     */
    private Response autoplay(Chain chain, Request request, String id) throws IOException {
        if (id.isEmpty()) {
            return gone(request);
        }

        MediaUrls media;
        try {
            media = lookup(id);
        } catch (JSONException ex) {
            Logger.printInfo(() -> "Could not parse the RedGifs response for " + id, ex);
            return gone(request);
        }

        if (media == null) {
            Logger.printDebug(() -> "RedGifs has no " + id + " to autoplay");
            return gone(request);
        }

        // The same proxy served the still beside a feed tile, and whatever draws pictures says
        // so, since a video is of no use to it.
        boolean drawing = request.header(OkHttpRequestHook.IMAGE_REQUEST) != null;
        String instead = drawing
                ? (media.poster != null ? media.poster : media.thumbnail)
                : media.highQuality;
        if (instead == null || instead.isEmpty()) {
            return gone(request);
        }

        Logger.printDebug(() -> "Autoplaying " + id + " from RedGifs");
        return chain.proceed(request.newBuilder()
                .url(instead)
                .header("User-Agent", getUserAgent())
                .build());
    }

    private static String lastPathSegment(HttpUrl url) {
        List<String> segments = url.pathSegments();
        for (int i = segments.size() - 1; i >= 0; i--) {
            String segment = segments.get(i);
            if (!segment.isEmpty()) {
                return segment;
            }
        }
        return "";
    }

    /**
     * A still of what a Gfycat or RedGifs link points at, for standing in where a thumbnail of it
     * has gone. Both are answered from RedGifs, which is where the one that survived them both
     * keeps its pictures.
     *
     * @return The address of a still, or null where RedGifs has no such gif.
     */
    @Nullable
    public static String posterFor(String link) throws IOException, JSONException {
        String lower = link.toLowerCase(Locale.ROOT);
        if (!lower.contains("gfycat.com") && !lower.contains("redgifs.com")) {
            return null;
        }

        HttpUrl url = HttpUrl.parse(link);
        if (url == null) {
            return null;
        }
        String id = normalizeId(lastPathSegment(url));
        if (id.isEmpty()) {
            return null;
        }

        MediaUrls media = lookup(id);
        if (media == null) {
            return null;
        }
        return media.poster != null ? media.poster : media.thumbnail;
    }

    /**
     * Strips the extension and the size suffixes Gfycat links carry, then lowercases, since
     * Gfycat ids are CamelCase and RedGifs only resolves the lowercase form.
     */
    private static String normalizeId(String id) {
        int cut = id.length();
        int dot = id.indexOf('.');
        if (dot >= 0) cut = dot;
        int dash = id.indexOf('-');
        if (dash >= 0 && dash < cut) cut = dash;
        return id.substring(0, cut).toLowerCase(Locale.ROOT);
    }

    private static final class MediaUrls {
        final String highQuality;
        final String lowQuality;
        @Nullable final String poster;
        @Nullable final String thumbnail;

        MediaUrls(String highQuality, String lowQuality, @Nullable String poster,
                  @Nullable String thumbnail) {
            this.highQuality = highQuality;
            this.lowQuality = lowQuality;
            this.poster = poster;
            this.thumbnail = thumbnail;
        }
    }

    /**
     * Stands in for an id RedGifs does not have, so that a feed full of dead Gfycat links asks
     * about each one once rather than on every pass Glide makes over it.
     */
    private static final MediaUrls NO_MIRROR = new MediaUrls("", "", null, null);

    private static final int CACHE_SIZE = 64;

    private static final Map<String, MediaUrls> lookups =
            new LinkedHashMap<String, MediaUrls>(CACHE_SIZE, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(Map.Entry<String, MediaUrls> eldest) {
                    return size() > CACHE_SIZE;
                }
            };

    /**
     * @return The mirrored media, or null if RedGifs has no such gif.
     */
    @Nullable
    private static MediaUrls lookup(String id) throws IOException, JSONException {
        synchronized (lookups) {
            MediaUrls cached = lookups.get(id);
            if (cached != null) {
                return cached == NO_MIRROR ? null : cached;
            }
        }

        MediaUrls media = fetchFromRedgifs(id);

        synchronized (lookups) {
            lookups.put(id, media == null ? NO_MIRROR : media);
        }
        return media;
    }

    /**
     * Picks the mirrored URL matching what the original request asked for. Sync loads a still
     * for a feed tile and the video itself when a post is opened, and both go to the same
     * subdomains, so the extension is what distinguishes them.
     */
    @Nullable
    private static String mediaFor(MediaUrls media, String path) {
        String lower = path.toLowerCase(Locale.ROOT);
        if (lower.endsWith(".mp4")) {
            return lower.contains("-mobile") ? media.lowQuality : media.highQuality;
        }
        if (lower.endsWith(".gif")) {
            return media.thumbnail != null ? media.thumbnail : media.poster;
        }
        return media.poster != null ? media.poster : media.thumbnail;
    }

    /**
     * @return The media URLs, or null if RedGifs has no such gif.
     */
    @Nullable
    private static MediaUrls fetchFromRedgifs(String id) throws IOException, JSONException {
        String userAgent = getUserAgent();
        HttpURLConnection connection = ask(id, userAgent, false);

        // A temporary token is tied to the address it was issued for, so moving between
        // networks leaves one that is refused while still looking perfectly valid. Asking again
        // with a new one costs a request, and only on the reply that says the old one is no
        // longer any good.
        if (isRefusal(connection.getResponseCode())) {
            connection.disconnect();
            Logger.printInfo(() -> "The Redgifs token was refused, asking for another");
            connection = ask(id, userAgent, true);
        }

        if (connection.getResponseCode() != HttpURLConnection.HTTP_OK) {
            connection.disconnect();
            return null;
        }

        JSONObject urls = Requester.parseJSONObjectAndDisconnect(connection)
                .getJSONObject("gif")
                .getJSONObject("urls");

        String highQuality = optionalString(urls, "hd");
        String lowQuality = optionalString(urls, "sd");
        if (highQuality == null) highQuality = lowQuality;
        if (lowQuality == null) lowQuality = highQuality;
        if (highQuality == null) {
            return null;
        }
        return new MediaUrls(highQuality, lowQuality,
                optionalString(urls, "poster"), optionalString(urls, "thumbnail"));
    }

    private static HttpURLConnection ask(String id, String userAgent, boolean withNewToken)
            throws IOException, JSONException {
        RedgifsTokenManager.RedgifsToken token =
                RedgifsTokenManager.refreshToken(userAgent, withNewToken);

        HttpURLConnection connection =
                (HttpURLConnection) new URL(REDGIFS_GIF_ENDPOINT + id).openConnection();
        connection.setRequestMethod("GET");
        connection.setRequestProperty("User-Agent", userAgent);
        connection.setRequestProperty("Authorization", "Bearer " + token.getAccessToken());
        connection.setRequestProperty("Accept", "application/json");
        connection.setUseCaches(false);
        return connection;
    }

    private static boolean isRefusal(int code) {
        return code == HttpURLConnection.HTTP_UNAUTHORIZED
                || code == HttpURLConnection.HTTP_FORBIDDEN;
    }

    /**
     * Sync always reads mp4Url, and prefers mobileUrl when it is present.
     */
    private static String apiBody(MediaUrls media) throws JSONException {
        JSONObject gfyItem = new JSONObject();
        gfyItem.put("mp4Url", media.highQuality);
        gfyItem.put("mobileUrl", media.lowQuality);

        JSONObject response = new JSONObject();
        response.put("gfyItem", gfyItem);
        return response.toString();
    }

    /**
     * Sync's scraper scans the body for URLs ending in .mp4 and treats a -mobile.mp4 one as the
     * lower quality option. RedGifs kept Gfycat's naming, so its URLs already fit that.
     */
    private static String scrapeBody(MediaUrls media) {
        return media.highQuality + "\n" + media.lowQuality;
    }

    @Nullable
    private static String optionalString(JSONObject object, String key) throws JSONException {
        return object.isNull(key) ? null : object.getString(key);
    }

    private static Response respond(Request request, String contentType, String body) {
        return new Response.Builder()
                .message("OK")
                .code(HttpURLConnection.HTTP_OK)
                .protocol(Protocol.HTTP_1_1)
                .request(request)
                .header("Content-Type", contentType)
                .body(ResponseBody.create(body, MediaType.get(contentType)))
                .build();
    }

    /**
     * Deliberately not a 404. Sync answers a 404 on a Gfycat link with a dialog whose only
     * action is to open the link in a browser, which can never work now that the domain is
     * gone, and it would appear for every unmirrored link. Any other status falls through to
     * Sync's ordinary error instead, which is the lesser annoyance.
     */
    private static Response gone(Request request) {
        return new Response.Builder()
                .message("Gone")
                .code(HttpURLConnection.HTTP_GONE)
                .protocol(Protocol.HTTP_1_1)
                .request(request)
                .header("Content-Type", "application/json")
                .body(ResponseBody.create("{}", MediaType.get("application/json")))
                .build();
    }
}
