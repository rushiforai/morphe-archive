package app.spicetify.extension.spotify.privacy;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

public final class SharingLinks {
    private static final Set<String> TRACKING_PARAMETERS = new HashSet<>(Arrays.asList(
            "si", "pi", "utm_source", "utm_medium", "utm_campaign", "utm_content", "utm_term", "utm_id"));

    private SharingLinks() {}

    public static String sanitizeUrl(String url) {
        if (url == null) return null;
        final URI uri;
        try {
            uri = new URI(url);
        } catch (URISyntaxException ignored) {
            return url;
        }
        if (!("https".equalsIgnoreCase(uri.getScheme()) || "http".equalsIgnoreCase(uri.getScheme()))
                || !"open.spotify.com".equalsIgnoreCase(uri.getHost()) || uri.getRawQuery() == null) {
            return url;
        }

        StringBuilder query = new StringBuilder();
        boolean changed = false;
        for (String part : uri.getRawQuery().split("&", -1)) {
            int equals = part.indexOf('=');
            String name = equals < 0 ? part : part.substring(0, equals);
            if (TRACKING_PARAMETERS.contains(name)) {
                changed = true;
            } else {
                if (query.length() > 0) query.append('&');
                query.append(part);
            }
        }
        if (!changed) return url;
        int queryStart = url.indexOf('?');
        int fragmentStart = url.indexOf('#', queryStart);
        return url.substring(0, queryStart)
                + (query.length() == 0 ? "" : "?" + query)
                + (fragmentStart < 0 ? "" : url.substring(fragmentStart));
    }
}
