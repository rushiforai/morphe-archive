package app.morphe.extension.syncforreddit.http.comments;

import androidx.annotation.NonNull;

import androidx.annotation.Nullable;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.requests.PatchedditInterceptor;
import app.morphe.extension.shared.requests.Requester;
import okhttp3.HttpUrl;
import okhttp3.MediaType;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;

/**
 * Shows a video posted in a comment where it was posted.
 *
 * <p>Reddit writes one into the comment as a link to a player page on its own site, which is a
 * page rather than anything playable: Sync shows the link, and following it opens a browser at
 * an address that names no subreddit and is answered with a banned notice. The video itself sits
 * where every other Reddit video does, under the id the player link already carries.
 *
 * <p>Sync draws a preview beside a link in a comment when the link looks like media, which it
 * decides by the file on the end of it. A playlist does not look like one, so the link is
 * pointed at one of the video's own files instead: it is then drawn in the comment, and Sync
 * plays the whole video when it is tapped, since it works back to the playlist from any address
 * under the video's id.
 *
 * @noinspection unused
 */
public class PlayCommentVideoPatch extends PatchedditInterceptor {
    /**
     * Short: a thread is waiting on this, and a video whose manifest is slow is better shown as
     * a working link than held up behind it.
     */
    private static final int TIMEOUT_MS = 4_000;

    /**
     * The player page Reddit writes into a comment, whose last part but one is the id the video
     * is stored under.
     */
    private static final Pattern PLAYER_LINK = Pattern.compile(
            "https?:\\\\?/\\\\?/(?:www\\.)?reddit\\.com\\\\?/link\\\\?/[A-Za-z0-9]+"
                    + "\\\\?/video\\\\?/([A-Za-z0-9]+)\\\\?/player");

    private static final String VIDEO_HOST = "https://v.redd.it/";

    /** What Sync falls back to for a video whose own files could not be listed. */
    private static final String PLAYLIST = "/HLSPlaylist.m3u8";

    /** Where a video says which files it is made of. */
    private static final String MANIFEST = "/DASHPlaylist.mpd";

    private static final Pattern FILE = Pattern.compile("<BaseURL>([^<]+\\.mp4)</BaseURL>");

    /** Bounded: a thread's worth of videos is all that is ever wanted at once. */
    private static final int CACHE_SIZE = 64;

    private static final Map<String, String> previews =
            new LinkedHashMap<String, String>(CACHE_SIZE, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(Map.Entry<String, String> eldest) {
                    return size() > CACHE_SIZE;
                }
            };

    @Override
    public boolean isPatchIncluded() {
        // Overridden by patch.
        return false;
    }

    @NonNull
    @Override
    protected Response doIntercept(@NonNull Chain chain) throws IOException {
        Request request = chain.request();
        HttpUrl url = request.url();

        if (!url.host().endsWith("reddit.com")) {
            return chain.proceed(request);
        }

        Response response = chain.proceed(request);
        if (!response.isSuccessful() || response.body() == null) {
            return response;
        }

        MediaType contentType = response.body().contentType();
        if (!worthReading(contentType)) {
            return response;
        }

        // Reading the body consumes it, so the response has to be rebuilt either way.
        String original = response.body().string();
        response.close();

        Matcher player = PLAYER_LINK.matcher(original);
        if (!player.find()) {
            return rebuilt(response, request, contentType, original);
        }

        // Rewritten in the response rather than in the comment it belongs to: the same link is
        // written the same way wherever a comment is served, and the id is all that is needed.
        StringBuffer rewritten = new StringBuffer(original.length());
        player.reset();
        while (player.find()) {
            player.appendReplacement(rewritten, Matcher.quoteReplacement(shownFor(player.group(1))));
        }
        player.appendTail(rewritten);

        Logger.printInfo(() -> "Pointed a comment's video in " + url.encodedPath()
                + " at where it is kept");
        return rebuilt(response, request, contentType, rewritten.toString());
    }

    /**
     * Whether a response is worth looking through for a link.
     *
     * <p>Anything Reddit answers with that is not a picture or a video may carry one, and what
     * it calls itself is not to be relied on: the interceptor that puts removed text back asks
     * nothing about the kind and works on every listing, while this one asked for the kind to be
     * stated as JSON and passed over responses that were not labelled that way.
     */
    private static boolean worthReading(@Nullable MediaType contentType) {
        return contentType == null
                || "text".equals(contentType.type())
                || contentType.subtype().contains("json");
    }

    /**
     * The id a Reddit video address is under, whatever else the address carries.
     *
     * <p>Sync works this out by taking off the endings it knows, which are the playlists and the
     * files an older video was made of. A video made of files named otherwise, which is what
     * Reddit serves now, comes out as the file rather than the video, and everything built from
     * it afterwards points nowhere. The id is simply the first thing after the host.
     *
     * @return The id, or null for an address that is not a Reddit video, leaving Sync to its own
     *         reckoning.
     */
    @Nullable
    public static String redditVideoId(String url) {
        try {
            if (url == null) {
                return null;
            }
            HttpUrl parsed = HttpUrl.parse(url.trim());
            if (parsed == null || !parsed.host().equals("v.redd.it")) {
                return null;
            }
            List<String> segments = parsed.pathSegments();
            if (segments.isEmpty()) {
                return null;
            }
            String id = segments.get(0);
            return id.isEmpty() ? null : id;
        } catch (Exception ex) {
            // Sync resolves an address for every video it shows, so this is no place to put
            // anything in front of the reader: leave it to work the id out for itself.
            Logger.printInfo(() -> "Could not read the video id from " + url + ": " + ex);
            return null;
        }
    }

    /**
     * @return An address under the video that Sync will draw a preview of, or the playlist when
     *         the video will not say what files it is made of, which leaves the link working
     *         without a preview beside it.
     */
    private static String shownFor(String id) {
        synchronized (previews) {
            String held = previews.get(id);
            if (held != null) {
                return held;
            }
        }

        String shown = VIDEO_HOST + id + PLAYLIST;
        try {
            String file = smallestFile(VIDEO_HOST + id + MANIFEST);
            if (file != null) {
                shown = VIDEO_HOST + id + "/" + file;
            }
        } catch (IOException ex) {
            Logger.printInfo(() -> "Could not read what video " + id + " is made of: " + ex);
        }

        synchronized (previews) {
            previews.put(id, shown);
        }
        return shown;
    }

    /**
     * The first video file a manifest names, which is its smallest: a preview is drawn at the
     * size of a line of text, and the whole video is played from the playlist regardless.
     */
    @Nullable
    private static String smallestFile(String manifest) throws IOException {
        HttpURLConnection connection = (HttpURLConnection) new URL(manifest).openConnection();
        connection.setRequestMethod("GET");
        connection.setConnectTimeout(TIMEOUT_MS);
        connection.setReadTimeout(TIMEOUT_MS);
        connection.setUseCaches(false);
        try {
            if (connection.getResponseCode() != HttpURLConnection.HTTP_OK) {
                return null;
            }
            Matcher file = FILE.matcher(Requester.parseString(connection));
            while (file.find()) {
                String name = file.group(1);
                // A manifest names the sound apart from the picture, and a preview wants neither
                // the sound nor a file that carries only it.
                if (!name.toUpperCase(Locale.ROOT).contains("AUDIO")) {
                    return name;
                }
            }
            return null;
        } finally {
            connection.disconnect();
        }
    }

    private static Response rebuilt(Response response, Request request, MediaType contentType,
                                    String body) {
        return response.newBuilder()
                .request(request)
                .body(ResponseBody.create(body, contentType))
                .build();
    }
}
