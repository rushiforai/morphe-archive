package patches.bright;

import java.net.URI;

/**
 * The single owner of WebView request classification. The reader route is
 * exactly the audited publisher article shape; everything else passes
 * through to the original client untouched. The consent control additionally
 * suppresses the traced Bright Consentmanager bootstrap on article pages.
 * Hosted advertising and measurement remain outside this policy.
 */
final class WebPolicies {

    enum Decision {PASS_THROUGH, READER_ARTICLE}

    static final class RequestFacts {
        final String url;
        final String method;
        final boolean mainFrame;

        RequestFacts(String url, String method, boolean mainFrame) {
            this.url = url;
            this.method = method;
            this.mainFrame = mainFrame;
        }
    }

    private static final String ARTICLE_HOST = "www.bright.nl";
    /** Audited canonical route: /{category-slug}/{numeric-id}/{title-slug}.html. */
    private static final String ARTICLE_PATH = "^/[a-z0-9-]+/[0-9]{3,}/[a-z0-9-]+\\.html$";

    private WebPolicies() {
    }

    static Decision classify(RequestFacts facts) {
        if (!BrightPolicy.articles || !facts.mainFrame || !"GET".equals(facts.method)) {
            return Decision.PASS_THROUGH;
        }
        return eligibleArticle(facts.url) != null ? Decision.READER_ARTICLE : Decision.PASS_THROUGH;
    }

    /** Suppress only Bright's traced web consent wall, never an account page or another CMP configuration. */
    static boolean suppressConsentBootstrap(String pageUrl, RequestFacts facts) {
        if (!BrightPolicy.consent || facts.mainFrame || !"GET".equals(facts.method)
                || publisherArticleUri(pageUrl) == null) {
            return false;
        }
        try {
            URI uri = URI.create(facts.url);
            String host = uri.getHost();
            if (!"https".equals(uri.getScheme()) || uri.getRawUserInfo() != null
                    || (uri.getPort() != -1 && uri.getPort() != 443)
                    || !("a.delivery.consentmanager.net".equals(host)
                    || "b.delivery.consentmanager.net".equals(host)
                    || "c.delivery.consentmanager.net".equals(host)
                    || "d.delivery.consentmanager.net".equals(host))
                    || !"/delivery/cmp.php".equals(uri.getRawPath()) || uri.getRawQuery() == null) {
                return false;
            }
            int ids = 0;
            boolean bright = false;
            for (String part : uri.getRawQuery().split("&")) {
                if (part.startsWith("cdid=")) {
                    ids++;
                    bright = "cdid=98aecc97427db".equals(part) || "cdid=5bd4faf7d2edc".equals(part);
                }
            }
            return ids == 1 && bright;
        } catch (Exception invalid) {
            return false;
        }
    }

    static boolean suppressConsentPage(String address) {
        return BrightPolicy.consent && publisherArticleUri(address) != null;
    }

    /**
     * Eligible main-frame article navigations only: canonical publisher host,
     * default port, no userinfo, https, numeric article id in the canonical
     * /category/id/slug route and no query. Login, comments, account,
     * payment, draft/admin and arbitrary paths keep their original route.
     */
    static ArticleRef eligibleArticle(String address) {
        URI uri = publisherArticleUri(address);
        if (uri == null) {
            return null;
        }
        String query = uri.getRawQuery();
        if (query != null && !query.isEmpty()) {
            return null;
        }
        String[] segments = uri.getRawPath().split("/");
        long id;
        try {
            id = Long.parseLong(segments[2]);
        } catch (NumberFormatException notNumeric) {
            return null;
        }
        return ArticleRef.create(id, uri.toString());
    }

    private static URI publisherArticleUri(String address) {
        URI uri;
        try {
            uri = URI.create(address);
        } catch (Exception invalid) {
            return null;
        }
        if (uri == null || !"https".equals(uri.getScheme()) || !ARTICLE_HOST.equals(uri.getHost())) {
            return null;
        }
        if (uri.getPort() != -1 && uri.getPort() != 443) {
            return null;
        }
        if (uri.getRawUserInfo() != null) {
            return null;
        }
        String path = uri.getRawPath() == null ? "/" : uri.getRawPath();
        if (!path.toLowerCase().matches(ARTICLE_PATH)) {
            return null;
        }
        return uri;
    }
}
