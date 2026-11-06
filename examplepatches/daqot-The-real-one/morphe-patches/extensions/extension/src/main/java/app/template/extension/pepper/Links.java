package app.template.extension.pepper;

import android.net.Uri;

import java.util.Locale;

/**
 * Link utilities shared by the Pepper patches.
 */
final class Links {

    private static final String PEPPER_DOMAIN = "pepper.nl";

    /**
     * Prefix of the query parameters used to track where a link was shared or opened from.
     */
    private static final String TRACKING_PARAMETER_PREFIX = "utm_";

    private Links() {
    }

    /**
     * @return The link without utm tracking parameters,
     *         or null if it is not an absolute http or https link.
     */
    static String sanitizeWebLink(String link) {
        if (link == null) {
            return null;
        }

        Uri uri = Uri.parse(link);
        String scheme = uri.getScheme();
        if (!("https".equals(scheme) || "http".equals(scheme)) || uri.getHost() == null) {
            return null;
        }

        return removeTrackingParameters(uri).toString();
    }

    /**
     * @return If the link points to Pepper or one of its subdomains.
     */
    static boolean isPepperLink(Uri uri) {
        String host = uri.getHost();
        if (host == null) {
            return false;
        }

        host = host.toLowerCase(Locale.ROOT);
        return host.equals(PEPPER_DOMAIN) || host.endsWith("." + PEPPER_DOMAIN);
    }

    private static Uri removeTrackingParameters(Uri uri) {
        if (uri.getQuery() == null) {
            return uri;
        }

        Uri.Builder builder = uri.buildUpon().clearQuery();
        for (String name : uri.getQueryParameterNames()) {
            if (name.toLowerCase(Locale.ROOT).startsWith(TRACKING_PARAMETER_PREFIX)) {
                continue;
            }
            for (String value : uri.getQueryParameters(name)) {
                builder.appendQueryParameter(name, value);
            }
        }

        return builder.build();
    }
}
