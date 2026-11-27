// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.extension.shared.redgifs;

import app.reseam.runtime.Export;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public final class Redgifs {
    private static final String SLUG = "([A-Za-z0-9]+)(?:-[A-Za-z0-9_-]+)?";
    private static final Pattern PAGE = Pattern.compile("/(?:watch|ifr)/" + SLUG + "/?");
    private static final Pattern DELIVERY = Pattern.compile("/" + SLUG + "/?");
    private static final Pattern API = Pattern.compile("/(?:v2/gifs|v1/gfycats)/([A-Za-z0-9]+)/?");
    private static final Pattern MEDIA = Pattern.compile("/" + SLUG + "\\.(?:mp4|webm|gif)");

    private Redgifs() {}

    @Export
    public static String embedUrl(String link) {
        return embedUrl(link, true);
    }

    @Export
    public static String pageEmbedUrl(String link) {
        return embedUrl(link, false);
    }

    private static String embedUrl(String link, boolean includeMediaFiles) {
        if (link == null) return null;
        try {
            URI uri = new URI(link);
            String scheme = uri.getScheme();
            if (!"https".equalsIgnoreCase(scheme) && !"http".equalsIgnoreCase(scheme)) return null;
            String host = uri.getHost();
            if (host == null || uri.getRawUserInfo() != null || uri.getPort() != -1) return null;

            Pattern path;
            switch (host.toLowerCase(Locale.ROOT)) {
                case "www.redgifs.com":
                case "redgifs.com":
                    path = PAGE;
                    break;
                case "gifdeliverynetwork.com":
                case "www.gifdeliverynetwork.com":
                    path = DELIVERY;
                    break;
                case "api.redgifs.com":
                    path = API;
                    break;
                case "media.redgifs.com":
                    if (!includeMediaFiles) return null;
                    path = MEDIA;
                    break;
                default:
                    return null;
            }

            Matcher match = path.matcher(uri.getRawPath());
            if (!match.matches()) return null;
            return "https://www.redgifs.com/ifr/" + match.group(1).toLowerCase(Locale.ROOT);
        } catch (URISyntaxException ignored) {
            return null;
        }
    }
}
