package dev.rikunode.futatabi.bridge;

import java.net.URI;

/** Strict top-level URL classification; never log URLs or credentials. */
final class AimogeLoginFlow {
    enum Page { OFFICIAL, CALLBACK, BLOCKED }
    static Page page(String raw) {
        if (raw == null || raw.length() > 4096) return Page.BLOCKED;
        try {
            URI u = new URI(raw);
            if (u.getUserInfo() != null) return Page.BLOCKED;
            if ("https".equals(u.getScheme()) && "nijiurachan.net".equalsIgnoreCase(u.getHost())
                    && (u.getPort() == -1 || u.getPort() == 443)) return Page.OFFICIAL;
            if ("http".equals(u.getScheme()) && "127.0.0.1".equals(u.getHost())
                    && u.getPort() == 18765 && "/ext/login/aimoge/callback".equals(u.getRawPath())
                    && u.getRawQuery() != null && u.getRawFragment() == null && raw.length() <= 2000)
                return Page.CALLBACK;
        } catch (Exception ignored) {}
        return Page.BLOCKED;
    }

    static boolean retryable(int status, String body) {
        return status == 503 && body.startsWith("Aimoge credential exchange: DNS failed for api.nijiurachan.net.");
    }
}
