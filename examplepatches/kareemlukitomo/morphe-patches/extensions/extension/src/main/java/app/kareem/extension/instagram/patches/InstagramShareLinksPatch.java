package app.kareem.extension.instagram.patches;

import java.net.URI;

@SuppressWarnings("unused")
public final class InstagramShareLinksPatch {
    private static final String CUSTOM_HOST = "kittygram.kareem.one";

    private InstagramShareLinksPatch() {
    }

    public static String rewriteShareUrl(String url) {
        if (url == null || url.isBlank()) {
            return url;
        }

        try {
            URI uri = new URI(url);
            String host = uri.getHost();
            if (host == null) {
                return url;
            }

            String normalizedHost = host.toLowerCase();
            if (!normalizedHost.equals("instagram.com") && !normalizedHost.equals("www.instagram.com")) {
                return url;
            }

            return new URI(
                "https",
                uri.getUserInfo(),
                CUSTOM_HOST,
                uri.getPort(),
                uri.getPath(),
                uri.getQuery(),
                uri.getFragment()
            ).toString();
        } catch (Exception ignored) {
            return url;
        }
    }
}
