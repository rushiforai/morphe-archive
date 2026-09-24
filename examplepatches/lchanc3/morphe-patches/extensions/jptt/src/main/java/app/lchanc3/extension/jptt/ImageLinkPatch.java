package app.lchanc3.extension.jptt;

import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Rewrites the links an image host serves a web page for into the direct image
 * URL, before {@code ArticleUrlAsyncTask} decides what to show.
 *
 * <p>The task resolves a link to a picture in three ways: {@code i.imgur.com}
 * links are handed to the image loader unchanged, a bare seven character imgur
 * id is turned into {@code i.imgur.com/<id>.jpg}, and everything else is fetched
 * once to see whether the {@code Content-Type} is an image. A link whose page is
 * HTML falls through to the Open Graph reader, so the preview ends up showing
 * whatever {@code og:image} the site advertises.
 *
 * <p>That leaves three kinds of link showing the wrong thing or nothing:
 *
 * <ul>
 *   <li>{@code i.imgur.com/<id>.mp4} (and {@code .gifv}) go straight to the image
 *       loader, which cannot decode video. imgur serves a still frame for the
 *       same id under {@code .jpg}, so the preview can show that.
 *   <li>An imgur link without the {@code i.} subdomain, or without an extension,
 *       is only recognised when the id is exactly seven characters. imgur ignores
 *       the extension it is asked for, so {@code i.imgur.com/<id>.jpg} works for
 *       any id and any format.
 *   <li>{@code meee.com.tw/<id>} is a page whose {@code og:image} is meee's own
 *       banner, which is what the preview shows today. The picture itself is at
 *       {@code i.meee.com.tw/<id>} under the extension it was stored with, which
 *       is asked for one at a time because nothing on the page says which.
 * </ul>
 *
 * <p>Only the URL the preview and the full size viewer load is changed. The
 * article text keeps the link that was posted, because it is carried separately
 * from the picture URL this rewrites.
 *
 * <p>An album ({@code imgur.com/a/...}, {@code imgur.com/gallery/...}) has no
 * address of its own that is an image, so this one is looked up: the album page
 * names its first picture in {@code og:image}, which is fetched once per link and
 * remembered. The app reads the same tag today, but only to build a link preview
 * card; handing it over as the picture URL instead shows it the way any other
 * image in the article is shown. An album of several pictures therefore shows its
 * first, and an id that is not an album has no {@code og:image} at all, which
 * leaves the link exactly as it was.
 */
@SuppressWarnings("unused")
public final class ImageLinkPatch {

    /** Extensions imgur serves video for, none of which the image loader decodes. */
    private static final String[] VIDEO_EXTENSIONS = { "mp4", "gifv", "webm" };

    /** Called from {@code ArticleUrlAsyncTask.doInBackground()} with its arguments. */
    public static void rewriteFirst(String[] urls) {
        if (urls == null || urls.length == 0 || urls[0] == null) {
            return;
        }
        try {
            String rewritten = rewrite(urls[0]);
            if (rewritten != null) {
                urls[0] = rewritten;
            }
        } catch (Throwable ex) {
            // A preview that is wrong beats an article that will not open.
            android.util.Log.e(JpttContext.LOG_TAG, "Could not rewrite " + urls[0], ex);
        }
    }

    /** The direct image URL for {@code url}, or null to leave it as it is. */
    static String rewrite(String url) {
        String trimmed = url.trim();
        int schemeEnd = trimmed.indexOf("://");
        if (schemeEnd < 0) {
            return null;
        }

        String afterScheme = trimmed.substring(schemeEnd + 3);
        int firstSlash = afterScheme.indexOf('/');
        if (firstSlash < 0) {
            return null;
        }

        String host = afterScheme.substring(0, firstSlash).toLowerCase(Locale.US);
        String path = afterScheme.substring(firstSlash + 1);

        // The query and the fragment carry nothing the image host needs, and an
        // imgur fragment is an index into a list of ids the app resolves itself.
        int queryStart = indexOfAny(path, "?#");
        if (queryStart >= 0) {
            path = path.substring(0, queryStart);
        }
        while (path.endsWith("/")) {
            path = path.substring(0, path.length() - 1);
        }

        if (isHost(host, "imgur.com")) {
            return rewriteImgur(host, path);
        }
        if (isHost(host, "meee.com.tw")) {
            return rewriteMeee(host, path);
        }
        return null;
    }

    private static String rewriteImgur(String host, String path) {
        int slash = path.indexOf('/');
        if (slash >= 0) {
            String prefix = path.substring(0, slash);
            String rest = path.substring(slash + 1);
            if ((prefix.equals("a") || prefix.equals("gallery")) && isId(rest)) {
                return albumPicture("https://imgur.com/" + prefix + "/" + rest);
            }
            return null;
        }
        // The comma separated id lists the app resolves on its own.
        if (path.indexOf(',') >= 0) {
            return null;
        }

        String id = idOf(path);
        String extension = extensionOf(path);
        if (!isId(id)) {
            return null;
        }

        if (extension == null || contains(VIDEO_EXTENSIONS, extension)) {
            // imgur returns a still frame of a video under any image extension.
            return "https://i.imgur.com/" + id + ".jpg";
        }
        if (host.equals("i.imgur.com")) {
            return null;
        }
        return "https://i.imgur.com/" + id + "." + extension;
    }

    private static String rewriteMeee(String host, String path) {
        if (path.indexOf('/') >= 0) {
            return null;
        }

        String id = idOf(path);
        String extension = extensionOf(path);
        if (!isId(id)) {
            return null;
        }

        // Unlike imgur, meee serves the file it stored under the extension it had:
        // ask for the wrong one and it is a 404, and the page carries no og:image
        // or direct link to read the right one from. So the extensions it uses are
        // tried in turn, once per id, and the answer is remembered.
        if (extension == null) {
            return meeeDirect(id);
        }
        if (host.equals("i.meee.com.tw")) {
            return null;
        }
        return "https://i.meee.com.tw/" + id + "." + extension;
    }

    /** Extensions meee has been seen to store, in the order they are tried. */
    private static final String[] MEEE_EXTENSIONS = { ".png", ".jpg", ".gif", ".webp" };

    /** The direct URL for a meee id, or null when none of the extensions answer. */
    private static String meeeDirect(String id) {
        String key = "meee:" + id;
        synchronized (LOOKUPS) {
            if (LOOKUPS.containsKey(key)) {
                return LOOKUPS.get(key);
            }
        }

        String found = null;
        for (String extension : MEEE_EXTENSIONS) {
            String candidate = "https://i.meee.com.tw/" + id + extension;
            try {
                if (isImage(candidate)) {
                    found = candidate;
                    break;
                }
            } catch (Throwable ex) {
                // Offline: leave the link alone rather than remembering a failure.
                android.util.Log.e(JpttContext.LOG_TAG, "Could not reach " + candidate, ex);
                return null;
            }
        }

        synchronized (LOOKUPS) {
            LOOKUPS.put(key, found);
        }
        return found;
    }

    /** Whether the URL answers with an image, asking for as little of it as possible. */
    private static boolean isImage(String url) throws Exception {
        HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
        try {
            connection.setRequestProperty("User-Agent", "Chrome");
            connection.setRequestProperty("Range", "bytes=0-0");
            connection.setConnectTimeout(TIMEOUT_MS);
            connection.setReadTimeout(TIMEOUT_MS);
            int status = connection.getResponseCode();
            String type = connection.getContentType();
            return status >= 200 && status < 300 && type != null && type.startsWith("image/");
        } finally {
            connection.disconnect();
        }
    }

    /** Attributes sit between the two the tag is recognised by, in either order. */
    private static final Pattern OG_IMAGE = Pattern.compile(
            "<meta[^>]+property=\"og:image\"[^>]+content=\"([^\"]+)\""
                    + "|<meta[^>]+content=\"([^\"]+)\"[^>]+property=\"og:image\"");

    /** Lookups made so far, so reopening an article does not repeat them. */
    private static final Map<String, String> LOOKUPS = new LinkedHashMap<String, String>(16, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, String> eldest) {
            return size() > 64;
        }
    };

    /** As long as the app gives one of its own lookups. */
    private static final int TIMEOUT_MS = 10000;

    /** Enough for the head of the document, which is where the tag is. */
    private static final int MAX_BYTES = 128 * 1024;

    /** The first picture of an album page, or null when it does not name one. */
    private static String albumPicture(String albumUrl) {
        synchronized (LOOKUPS) {
            if (LOOKUPS.containsKey(albumUrl)) {
                return LOOKUPS.get(albumUrl);
            }
        }

        String picture = null;
        try {
            picture = readOgImage(albumUrl);
        } catch (Throwable ex) {
            // Offline, rate limited, or imgur changed its markup. The link is
            // then left alone, which is what the app did before this patch.
            android.util.Log.e(JpttContext.LOG_TAG, "Could not read " + albumUrl, ex);
        }

        synchronized (LOOKUPS) {
            LOOKUPS.put(albumUrl, picture);
        }
        return picture;
    }

    private static String readOgImage(String pageUrl) throws Exception {
        HttpURLConnection connection = (HttpURLConnection) new URL(pageUrl).openConnection();
        try {
            // imgur answers the default Java user agent with 429, and this is the
            // one the app sends for its own page lookups.
            connection.setRequestProperty("User-Agent", "Chrome");
            connection.setConnectTimeout(TIMEOUT_MS);
            connection.setReadTimeout(TIMEOUT_MS);

            StringBuilder head = new StringBuilder();
            InputStream stream = connection.getInputStream();
            try {
                byte[] buffer = new byte[8192];
                int read;
                while (head.length() < MAX_BYTES && (read = stream.read(buffer)) > 0) {
                    // The tag is ASCII wherever it sits in a UTF-8 document.
                    for (int i = 0; i < read; i++) {
                        head.append((char) (buffer[i] & 0xff));
                    }
                    String found = matchOgImage(head);
                    if (found != null) {
                        return found;
                    }
                }
            } finally {
                stream.close();
            }
            return matchOgImage(head);
        } finally {
            connection.disconnect();
        }
    }

    private static String matchOgImage(CharSequence html) {
        Matcher matcher = OG_IMAGE.matcher(html);
        if (!matcher.find()) {
            return null;
        }
        String content = matcher.group(1) != null ? matcher.group(1) : matcher.group(2);
        if (content == null || !content.startsWith("http")) {
            return null;
        }
        // imgur points the tag at "<id>.jpeg?fb", the same bytes under a query
        // that only means something to the site that asked for the tag.
        int query = indexOfAny(content, "?#");
        return query < 0 ? content : content.substring(0, query);
    }

    private static String idOf(String path) {
        int dot = path.lastIndexOf('.');
        return dot < 0 ? path : path.substring(0, dot);
    }

    /** The extension without its dot, or null when the path has none. */
    private static String extensionOf(String path) {
        int dot = path.lastIndexOf('.');
        if (dot < 0 || dot == path.length() - 1) {
            return null;
        }
        return path.substring(dot + 1).toLowerCase(Locale.US);
    }

    /** Both hosts hand out short alphanumeric ids; anything else is a page. */
    private static boolean isId(String id) {
        if (id.length() < 4 || id.length() > 12) {
            return false;
        }
        for (int i = 0; i < id.length(); i++) {
            char c = id.charAt(i);
            boolean alphanumeric = (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || (c >= '0' && c <= '9');
            if (!alphanumeric) {
                return false;
            }
        }
        return true;
    }

    private static boolean isHost(String host, String domain) {
        return host.equals(domain) || host.endsWith("." + domain);
    }

    private static boolean contains(String[] values, String value) {
        for (String candidate : values) {
            if (candidate.equals(value)) {
                return true;
            }
        }
        return false;
    }

    private static int indexOfAny(String text, String characters) {
        for (int i = 0; i < text.length(); i++) {
            if (characters.indexOf(text.charAt(i)) >= 0) {
                return i;
            }
        }
        return -1;
    }

    private ImageLinkPatch() {
    }
}
