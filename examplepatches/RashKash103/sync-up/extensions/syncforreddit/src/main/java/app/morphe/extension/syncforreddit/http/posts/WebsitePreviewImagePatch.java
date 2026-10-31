package app.morphe.extension.syncforreddit.http.posts;

import androidx.annotation.NonNull;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.requests.PatchedditInterceptor;

import okhttp3.HttpUrl;
import okhttp3.Request;
import okhttp3.Response;

/**
 * The picture beside a link in a comment.
 *
 * <p>Sync shows a preview of a linked page, and asks its own proxy for the picture to put beside
 * it. That proxy answers 401 to everything now, so every preview but a video's — those are asked
 * of the site that hosts them — comes out as a broken image.
 *
 * <p>The picture the proxy would have found is the one the page names for exactly this purpose:
 * pages have carried a preview picture in their head for years, for anything that quotes a link.
 * So the page is read and asked, and the request goes to what it names instead.
 *
 * @noinspection unused
 */
public class WebsitePreviewImagePatch extends PatchedditInterceptor {
    /** Sync's own proxy, which is still there and refuses everything. */
    private static final String THEIR_PROXY = "ap.syncforreddit.com";

    private static final String THE_PICTURE_PATH = "/image";

    private static final String THE_PAGE = "url";

    /** What a page calls the picture it wants shown when it is quoted somewhere else. */
    private static final Pattern NAMES_A_PICTURE = Pattern.compile(
            "<meta[^>]+(?:property|name)\\s*=\\s*[\"'](?:og:image(?::url)?|twitter:image"
                    + "(?::src)?)[\"'][^>]+content\\s*=\\s*[\"']([^\"']+)[\"']",
            Pattern.CASE_INSENSITIVE);

    /** The same, where the page writes the two attributes the other way round. */
    private static final Pattern NAMES_IT_BACKWARDS = Pattern.compile(
            "<meta[^>]+content\\s*=\\s*[\"']([^\"']+)[\"'][^>]+(?:property|name)\\s*=\\s*[\"']"
                    + "(?:og:image(?::url)?|twitter:image(?::src)?)[\"']",
            Pattern.CASE_INSENSITIVE);

    /** Only the head is worth reading, and some pages are very large. */
    private static final int ENOUGH_OF_THE_PAGE = 200_000;

    /**
     * Said to be a browser, because a great many sites refuse anything that does not say so.
     * Asking as the app does by default is answered 403 by publishers often enough to matter,
     * and a page that will not be read is a preview with a broken picture on it.
     */
    private static final String AS_A_BROWSER = "Mozilla/5.0 (Linux; Android 13) "
            + "AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36";

    private static final String WANTING_A_PAGE =
            "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";

    private static final int CONNECT_TIMEOUT_MS = 8_000;
    private static final int READ_TIMEOUT_MS = 10_000;

    /** What each page named, so a thread full of links to one place asks it once. */
    private static final int REMEMBERED = 128;

    private static final Map<String, String> named = Collections.synchronizedMap(
            new LinkedHashMap<String, String>(REMEMBERED, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(Map.Entry<String, String> eldest) {
                    return size() > REMEMBERED;
                }
            });

    /** Kept apart from the pictures, so a page that names none is not read again either. */
    private static final String NAMED_NONE = "";

    @Override
    public boolean isPatchIncluded() {
        // Overridden by patch.
        return false;
    }

    @NonNull
    @Override
    protected Response doIntercept(@NonNull Chain chain) throws IOException {
        Request request = chain.request();
        HttpUrl asked = request.url();

        if (!isPatchIncluded()
                || !THEIR_PROXY.equals(asked.host())
                || !asked.encodedPath().startsWith(THE_PICTURE_PATH)) {
            return chain.proceed(request);
        }


        String page = asked.queryParameter(THE_PAGE);
        if (page == null || page.isEmpty()) {
            Logger.printInfo(() -> "The proxy was asked without a page: " + asked);
            return chain.proceed(request);
        }

        String picture = pictureFor(page);
        if (picture == null) {
            // The page names none, or would not be read. What the proxy says is what it has
            // always said, which is what was drawn before any of this.
            Logger.printInfo(() -> "No picture named by " + page);
            return chain.proceed(request);
        }

        HttpUrl instead = HttpUrl.parse(picture);
        if (instead == null) {
            Logger.printInfo(() -> "The picture named by " + page + " is not an address: "
                    + picture);
            return chain.proceed(request);
        }

        return chain.proceed(request.newBuilder().url(instead).build());
    }

    /** @return The picture the page names for being quoted, or null where it names none. */
    private static String pictureFor(String page) {
        String already = named.get(page);
        if (already != null) {
            return already.isEmpty() ? null : already;
        }

        String found = null;
        try {
            String head = headOf(page);
            if (head != null) {
                Matcher names = NAMES_A_PICTURE.matcher(head);
                if (names.find()) {
                    found = names.group(1);
                } else {
                    Matcher backwards = NAMES_IT_BACKWARDS.matcher(head);
                    if (backwards.find()) {
                        found = backwards.group(1);
                    }
                }
            }
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not read " + page + " for a picture: " + ex);
        }


        String picture = whereThatPoints(page, found);
        named.put(page, picture == null ? NAMED_NONE : picture);
        return picture;
    }

    /** What closes the head of a page, after which nothing wanted here can appear. */
    private static final byte[] CLOSES_THE_HEAD = "</head".getBytes(StandardCharsets.US_ASCII);

    /** @return Whether the head ends within this block. Tags are plain letters in any encoding. */
    private static boolean endsTheHead(byte[] block, int read) {
        for (int at = 0; at + CLOSES_THE_HEAD.length <= read; at++) {
            int same = 0;
            while (same < CLOSES_THE_HEAD.length
                    && (block[at + same] | 0x20) == CLOSES_THE_HEAD[same]) {
                same++;
            }
            if (same == CLOSES_THE_HEAD.length) {
                return true;
            }
        }
        return false;
    }

    /**
     * @return What the page named, made into an address that can be asked for: written as it is
     *         in a page rather than as it is in a request, and often given relative to the page
     *         it was found on.
     */
    private static String whereThatPoints(String page, String named) {
        if (named == null) {
            return null;
        }

        // A page is written as text, so an address in one carries its ampersands written out.
        String where = named.trim()
                .replace("&amp;", "&")
                .replace("&#38;", "&")
                .replace("&quot;", "\"")
                .replace("&#39;", "'");

        if (where.startsWith("//")) {
            where = "https:" + where;
        }
        if (where.startsWith("http")) {
            return where;
        }

        HttpUrl from = HttpUrl.parse(page);
        HttpUrl resolved = from == null ? null : from.resolve(where);
        return resolved == null ? null : resolved.toString();
    }

    /**
     * @return As much of the page as its head can be in, or null where it would not be given.
     *
     * <p>Read here rather than through what asks the archive for things: that waits its turn and
     * spaces its calls, which is right for one service being asked a great deal and wrong for a
     * page being read once.
     */
    private static String headOf(String page) throws IOException {
        HttpURLConnection asking = (HttpURLConnection) new URL(page).openConnection();
        try {
            asking.setRequestMethod("GET");
            asking.setInstanceFollowRedirects(true);
            asking.setConnectTimeout(CONNECT_TIMEOUT_MS);
            asking.setReadTimeout(READ_TIMEOUT_MS);
            asking.setRequestProperty("User-Agent", AS_A_BROWSER);
            asking.setRequestProperty("Accept", WANTING_A_PAGE);
            asking.setRequestProperty("Accept-Language", "en-US,en;q=0.9");

            int said = asking.getResponseCode();
            if (said != HttpURLConnection.HTTP_OK) {
                // Worth knowing: a site that will not be read cannot be previewed, and there is
                // nothing to be done about it from here.
                Logger.printInfo(() -> page + " answered " + said + " rather than a page");
                return null;
            }

            try (InputStream reading = asking.getInputStream()) {
                ByteArrayOutputStream head = new ByteArrayOutputStream();
                byte[] block = new byte[8192];
                int read;
                boolean done = false;

                while (!done && head.size() < ENOUGH_OF_THE_PAGE
                        && (read = reading.read(block)) > 0) {
                    head.write(block, 0, read);
                    // Everything wanted is in the head, and some pages run to megabytes. The
                    // block just read is what is looked at, since looking at the whole of what
                    // has been read so far would cost more each time round.
                    done = endsTheHead(block, read);
                }

                return head.toString(StandardCharsets.UTF_8.name());
            }
        } finally {
            asking.disconnect();
        }
    }
}
