package dev.rikunode.futatabi.bridge;

/** Classifies top-level navigation without retaining URLs, queries or credentials. */
final class MebukiLoginFlow {
    enum Page { SITE, CALLBACK, ERROR_RETURN, X, DISCORD, GOOGLE_UNSUPPORTED, OTHER }
    static Page page(String scheme, String host, String path, boolean errorReturn) {
        if (!"https".equalsIgnoreCase(scheme) || host == null) return Page.OTHER;
        String h = host.toLowerCase(java.util.Locale.ROOT);
        if ("mebuki.moe".equals(h)) {
            if (errorReturn) return Page.ERROR_RETURN;
            if ("/auth/callback".equals(path)) return Page.CALLBACK;
            return Page.SITE;
        }
        if (domain(h, "x.com") || domain(h, "twitter.com")) return Page.X;
        if (domain(h, "discord.com") || domain(h, "discordapp.com")) return Page.DISCORD;
        if (domain(h, "accounts.google.com")) return Page.GOOGLE_UNSUPPORTED;
        return Page.OTHER;
    }

    // Observe failures from the real page, without inspecting credentials,
    // response bodies, URL queries or authorization state.
    static boolean discordLoginPost(String scheme, String host, String path, String method) {
        return "https".equalsIgnoreCase(scheme) && "discord.com".equalsIgnoreCase(host)
                && "POST".equals(method) && path != null
                && path.matches("/api/v[0-9]{1,2}/auth/(login|mfa/[a-z]+)");
    }

    private static boolean domain(String host, String base) {
        return host.equals(base) || host.endsWith("." + base);
    }
}
