package app.morphe.extension.syncforreddit.http.imgur;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.requests.PatchedditInterceptor;
import app.morphe.extension.syncforreddit.RedirectGfycatPatch;
import okhttp3.HttpUrl;
import okhttp3.Request;
import okhttp3.Response;

/**
 * Reddit generates its own preview of what a post links to and serves it from
 * external-preview.redd.it, and that is what a feed tile loads. For old posts those previews
 * have been purged and answer 404, so the tile is blank even when the linked image is still
 * recoverable. An album post is the clearest case: opening it works, because that goes to
 * Imgur, while its tile never does.
 *
 * <p>The preview address says nothing about what it was a preview of, so the tile cannot be
 * recovered from the request alone. Sync hands the post to the thumbnail view, so the patch
 * records which link each preview belongs to as the view is bound, and a dead preview is then
 * answered with the link's own image instead.
 *
 * @noinspection unused
 */
public class RecoverThumbnailsPatch extends PatchedditInterceptor {
    private static final int CACHE_SIZE = 256;

    /**
     * Preview address to the link its post pointed at, keyed by host and path only. The query
     * carries a signature that is rewritten before the request is made, and okhttp may not
     * spell the rest of it the way Sync did, while the path alone already identifies the
     * preview. Bounded because it grows with scrolling, and holding the most recent is enough:
     * a tile is loaded as it comes on screen, which is when its entry was added.
     */
    private static final Map<String, String> previewLinks =
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

    /**
     * Called as a post's thumbnail view is bound. Sync picks one of the two addresses depending
     * on the post, and which one is not worth reproducing here, so both are recorded.
     */
    public static void rememberThumbnails(@Nullable String thumbnail, @Nullable String preview,
                                          @Nullable String link) {
        try {
            if (link == null || link.isEmpty()) {
                return;
            }
            remember(thumbnail, link);
            remember(preview, link);
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not record the thumbnail for " + link, ex);
        }
    }

    private static void remember(@Nullable String url, String link) {
        String key = keyOf(url);
        if (key == null) {
            return;
        }
        synchronized (previewLinks) {
            previewLinks.put(key, link);
        }
    }

    /**
     * @return The host and path of an address, or null if it is not one.
     */
    @Nullable
    private static String keyOf(@Nullable String url) {
        if (url == null || url.isEmpty()) {
            return null;
        }
        HttpUrl parsed = HttpUrl.parse(url);
        return parsed == null ? null : parsed.host() + parsed.encodedPath();
    }

    @NonNull
    @Override
    protected Response doIntercept(@NonNull Chain chain) throws IOException {
        Request request = chain.request();
        Response response = chain.proceed(request);

        if (response.code() != HttpURLConnection.HTTP_NOT_FOUND) {
            return response;
        }

        String link;
        synchronized (previewLinks) {
            link = previewLinks.get(request.url().host() + request.url().encodedPath());
        }
        if (link == null) {
            return response;
        }

        try {
            String replacement = imageFor(link);
            if (replacement == null) {
                Logger.printInfo(() -> "Nothing to recover the thumbnail of " + link + " with");
                return response;
            }

            // Closed only once a replacement is certain, so the original is still returned
            // intact on the paths above.
            response.close();
            Logger.printInfo(() -> "Recovered the thumbnail of " + link + " from " + replacement);
            return chain.proceed(request.newBuilder().url(replacement).build());
        } catch (JSONException ex) {
            Logger.printInfo(() -> "Could not read the archive for " + link, ex);
            return response;
        } catch (IOException ex) {
            // The archive being unreachable should leave the original 404 in place.
            Logger.printInfo(() -> "Archive request failed for " + link + ": " + ex);
            return response;
        }
    }

    /**
     * @return An address holding the image the post linked to, or null if there is none to be
     *         had.
     */
    @Nullable
    private static String imageFor(String link) throws IOException, JSONException {
        // Gfycat is gone and RedGifs keeps what survived it, including the stills.
        String poster = RedirectGfycatPatch.posterFor(link);
        if (poster != null) {
            return poster;
        }

        String albumId = albumIdOf(link);
        if (albumId != null) {
            List<JSONObject> images = ImgurAlbum.imagesOf(albumId);
            if (images.isEmpty()) {
                return null;
            }
            String cover = images.get(0).optString("link", "");
            return cover.isEmpty() ? null : archivedOrOriginal(cover);
        }

        return isImgurImage(link) ? archivedOrOriginal(stripQuery(link)) : null;
    }

    /**
     * Prefers an archived copy, since a preview only dies along with the post's age and the
     * image it was made from is usually long gone as well. The original is the fallback so an
     * album whose images are still up keeps working without the archive.
     */
    private static String archivedOrOriginal(String url) throws IOException, JSONException {
        String snapshot = WaybackMachine.findSnapshot(url);
        return snapshot != null ? snapshot : url;
    }

    @Nullable
    private static String albumIdOf(String link) {
        String lower = link.toLowerCase(Locale.ROOT);
        int marker = lower.indexOf("imgur.com/a/");
        int length = "imgur.com/a/".length();
        if (marker < 0) {
            marker = lower.indexOf("imgur.com/gallery/");
            length = "imgur.com/gallery/".length();
        }
        if (marker < 0) {
            return null;
        }

        String id = link.substring(marker + length);
        int end = indexOfFirst(id, "/?#");
        if (end >= 0) {
            id = id.substring(0, end);
        }
        return id.isEmpty() ? null : id;
    }

    private static boolean isImgurImage(String link) {
        HttpUrl url = HttpUrl.parse(link);
        return url != null && url.host().endsWith("imgur.com")
                && url.encodedPath().lastIndexOf('.') > url.encodedPath().lastIndexOf('/');
    }

    private static String stripQuery(String link) {
        int cut = indexOfFirst(link, "?#");
        return cut >= 0 ? link.substring(0, cut) : link;
    }

    private static int indexOfFirst(String text, String characters) {
        for (int i = 0; i < text.length(); i++) {
            if (characters.indexOf(text.charAt(i)) >= 0) {
                return i;
            }
        }
        return -1;
    }
}
