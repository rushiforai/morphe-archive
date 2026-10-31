package app.morphe.extension.shared.fixes.slink;

import java.net.MalformedURLException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.Locale;

/** Validates destinations before a Reddit access token can be attached to a request. */
final class RedditSLink {
    private RedditSLink() {}

    static URL parse(String link) {
        URL url = parseRedditUrl(link);
        if (url == null || !url.getPath().matches("/r/[A-Za-z0-9_]+/s/[A-Za-z0-9]+/?")) {
            return null;
        }
        return url;
    }

    static URL parseRedditUrl(String link) {
        if (link == null) {
            return null;
        }
        try {
            URI uri = new URI(link);
            String host = uri.getHost();
            if (!"https".equalsIgnoreCase(uri.getScheme()) || host == null
                    || uri.getRawUserInfo() != null
                    || (uri.getPort() != -1 && uri.getPort() != 443)) {
                return null;
            }
            host = host.toLowerCase(Locale.ROOT);
            if (!host.equals("reddit.com") && !host.endsWith(".reddit.com")) {
                return null;
            }
            return uri.toURL();
        } catch (URISyntaxException | MalformedURLException | IllegalArgumentException ex) {
            return null;
        }
    }

    static String bypass(String link) {
        int fragment = link.indexOf('#');
        return (fragment < 0 ? link : link.substring(0, fragment)) + "#bypass";
    }
}
