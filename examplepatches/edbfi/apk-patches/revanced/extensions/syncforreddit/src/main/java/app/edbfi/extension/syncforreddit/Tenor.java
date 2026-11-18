// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.extension.syncforreddit;

import java.net.URI;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.json.JSONObject;

/**
 * Thumbnails for Tenor links in comments and posts, which the app loaded from its developer's image server
 * ({@link ImageServer}). Tenor's oEmbed answers a GIF page's link with a small still of it.
 */
public final class Tenor {
    private static final String OEMBED = "https://tenor.com/oembed?url=";
    // An optional locale (en-GB, es-419), the GIF's name, and an extension or slash oEmbed refuses.
    private static final Pattern PAGE = Pattern.compile("((?:/[A-Za-z0-9-]+)?/view/[^/]+?)(?:\\.(?:gif|webm|mp4))?/?");

    /** A request to Tenor, sent the system's own User-Agent; a fake in tests. */
    interface Api {
        Http.Reply send(String method, String url) throws Exception;
    }

    static final Api TENOR = (method, url) -> {
        Map<String, String> headers = new HashMap<>();
        headers.put("User-Agent", Http.systemUserAgent());
        // A share link redirects to its GIF's page: read where, without loading the page.
        return Http.send(method, url, headers, null, !method.equals("HEAD"));
    };

    private Tenor() {}

    /** Turned on by the "Fix Tenor previews" patch. */
    public static boolean isEnabled() {
        return false;
    }

    /** Whether the link is on Tenor. The app sends every link holding "tenor.com" to the image server. */
    static boolean handles(String link) {
        URI uri = uri(link);
        if (uri == null || uri.getHost() == null || uri.getRawUserInfo() != null) return false;
        String scheme = uri.getScheme() == null ? "" : uri.getScheme().toLowerCase(Locale.ROOT);
        String host = uri.getHost().toLowerCase(Locale.ROOT);
        return (scheme.equals("https") || scheme.equals("http")) && (host.equals("tenor.com") || host.endsWith(".tenor.com"));
    }

    /**
     * The image to show for a Tenor link: an image on Tenor's media hosts itself, or the still oEmbed gives for a GIF's
     * page or share link. Throws when there is none.
     */
    static String thumbnail(String link, Api api) throws Exception {
        if (!handles(link)) throw new IllegalArgumentException("Not a Tenor link: " + link);
        // Old comments link over http.
        if (link.regionMatches(true, 0, "http://", 0, 7)) link = "https://" + link.substring(7);
        String host = host(link);
        if (!host.equals("tenor.com") && !host.equals("www.tenor.com")) {
            // media.tenor.com, media1.tenor.com, c.tenor.com: the image itself. Other hosts serve pages.
            String path = new URI(link).getPath();
            boolean image = path != null && path.toLowerCase(Locale.ROOT).matches(".*\\.(gif|png|jpe?g|webp)");
            if (host.matches("(media\\d*|c)\\.tenor\\.com") && image) return link;
            throw new IllegalArgumentException("Not a Tenor image: " + link);
        }
        String page = page(link);
        if (page == null) page = page(redirect(link, api));
        if (page == null) throw new IllegalStateException("No Tenor GIF behind " + link);
        Http.Reply reply = api.send("GET", OEMBED + URLEncoder.encode(page, "UTF-8"));
        if (reply.status != 200) throw new IllegalStateException("Tenor answered " + reply.status + " for " + page);
        String image = new JSONObject(new String(reply.body, StandardCharsets.UTF_8)).optString("thumbnail_url", "");
        String imageHost = host(image);
        if (!image.startsWith("https://") || imageHost == null || !imageHost.endsWith(".tenor.com")) {
            throw new IllegalStateException("Tenor has no thumbnail for " + page);
        }
        return image;
    }

    /**
     * The GIF page a link names, {@code https://tenor.com/[<locale>/]view/<name>}, without the query, fragment or file
     * extension ({@code <name>.gif}) oEmbed refuses (404), or null for other links.
     */
    static String page(String link) {
        URI uri = uri(link);
        if (uri == null) return null;
        String host = uri.getHost() == null ? null : uri.getHost().toLowerCase(Locale.ROOT);
        String path = uri.getRawPath();
        if (!("tenor.com".equals(host) || "www.tenor.com".equals(host)) || path == null) return null;
        Matcher page = PAGE.matcher(path);
        return page.matches() ? "https://tenor.com" + page.group(1) : null;
    }

    /** Where a share link such as {@code https://tenor.com/bA1cD.gif} redirects. */
    private static String redirect(String link, Api api) throws Exception {
        Http.Reply reply = api.send("HEAD", link);
        String location = reply.header("Location");
        if (reply.status / 100 != 3 || location == null) {
            throw new IllegalStateException("Tenor answered " + reply.status + " for " + link);
        }
        return new URI(link).resolve(location).toString();
    }

    private static String host(String link) {
        URI uri = uri(link);
        return uri == null || uri.getHost() == null ? null : uri.getHost().toLowerCase(Locale.ROOT);
    }

    private static URI uri(String link) {
        if (link == null) return null;
        try {
            return new URI(link);
        } catch (Exception error) {
            return null;
        }
    }
}
