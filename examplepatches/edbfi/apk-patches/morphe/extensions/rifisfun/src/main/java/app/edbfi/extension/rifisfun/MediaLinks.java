// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.extension.rifisfun;

import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URLDecoder;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

/**
 * Unwraps Reddit's media viewer links, {@code reddit.com/media?url=<image URL>}. The app reads the path {@code /media}
 * as a short link to a post with the ID "media", and opens that.
 */
public final class MediaLinks {
    /** Reddit's image hosts, the only ones its viewer wraps that are unwrapped. */
    private static final Set<String> MEDIA_HOSTS =
            new HashSet<>(Arrays.asList("i.redd.it", "preview.redd.it", "external-preview.redd.it"));

    private MediaLinks() {}

    /** Called first by the app's in-app link opener. Returns the wrapped image URL, or the link unchanged. */
    public static String unwrap(String url) {
        URI uri = ShareLinks.parse(url);
        if (uri == null || !ShareLinks.isReddit(uri)) return url;
        String path = uri.getRawPath();
        if (!"/media".equals(path) && !"/media/".equals(path)) return url;
        String wrapped = parameter(uri.getRawQuery(), "url");
        URI image = ShareLinks.parse(wrapped);
        if (image == null || !"https".equalsIgnoreCase(image.getScheme()) || image.getHost() == null) return url;
        return MEDIA_HOSTS.contains(image.getHost().toLowerCase(Locale.ROOT)) ? wrapped : url;
    }

    /** The decoded value of the first query parameter named {@code name}, or null. */
    static String parameter(String query, String name) {
        if (query == null) return null;
        for (String pair : query.split("&")) {
            String[] parts = pair.split("=", 2);
            if (parts.length == 2 && parts[0].equals(name)) {
                try {
                    return URLDecoder.decode(parts[1], "UTF-8");
                } catch (UnsupportedEncodingException | IllegalArgumentException error) {
                    return null;
                }
            }
        }
        return null;
    }
}
