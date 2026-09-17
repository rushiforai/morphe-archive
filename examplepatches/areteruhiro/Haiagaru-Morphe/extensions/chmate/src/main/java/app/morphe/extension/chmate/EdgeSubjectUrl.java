package app.morphe.extension.chmate;

import java.net.URI;
import java.net.URISyntaxException;

/** Selects Edge's reporter-ID subject feed before ChMate constructs the request. */
public final class EdgeSubjectUrl {
    private EdgeSubjectUrl() {}

    public static String rewrite(String original, boolean enabled) {
        if (!enabled || original == null) return original;
        try {
            URI uri = new URI(original);
            String scheme = uri.getScheme();
            if (!("https".equalsIgnoreCase(scheme) || "http".equalsIgnoreCase(scheme))
                    || !"bbs.eddibb.cc".equalsIgnoreCase(uri.getHost())
                    || uri.getRawUserInfo() != null
                    || (uri.getPort() != -1
                    && uri.getPort() != ("https".equalsIgnoreCase(scheme) ? 443 : 80))
                    || !"/liveedge/subject.txt".equals(uri.getRawPath())) {
                return original;
            }
            int schemeSeparator = original.indexOf("://");
            int pathStart = schemeSeparator < 0 ? -1 : original.indexOf('/', schemeSeparator + 3);
            if (pathStart < 0) return original;
            int pathEnd = pathStart + uri.getRawPath().length();
            return original.substring(0, pathStart) + "/liveedge/subject-metadent.txt"
                    + original.substring(pathEnd);
        } catch (URISyntaxException ignored) {
            return original;
        }
    }
}
