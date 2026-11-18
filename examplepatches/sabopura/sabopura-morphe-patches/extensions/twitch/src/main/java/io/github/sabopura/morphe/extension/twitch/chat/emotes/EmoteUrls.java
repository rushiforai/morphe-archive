package io.github.sabopura.morphe.extension.twitch.chat.emotes;

import java.net.URI;

final class EmoteUrls {
    private static final String TWITCH = "https://static-cdn.jtvnw.net/emoticons/v2/";

    private EmoteUrls() {}

    /** The provider's larger copy of a chat-sized emote image, or the URL itself for anything else. */
    static String large(String url) {
        if (url.startsWith("https://cdn.7tv.app/") && url.endsWith("/2x.webp"))
            return url.substring(0, url.length() - "2x.webp".length()) + "4x.webp";
        if (url.startsWith("https://cdn.betterttv.net/") && url.endsWith("/2x.webp"))
            return url.substring(0, url.length() - "2x.webp".length()) + "3x.webp";
        if (url.startsWith("https://cdn.frankerfacez.com/") && url.endsWith("/2"))
            return url.substring(0, url.length() - 1) + "4";
        if (url.startsWith(TWITCH) && url.endsWith("/2.0"))
            return url.substring(0, url.length() - "2.0".length()) + "3.0";
        return url;
    }

    static boolean allowed(String value) {
        try {
            URI uri = new URI(value);
            String host = uri.getHost();
            return "https".equals(uri.getScheme())
                    && uri.getUserInfo() == null
                    && (uri.getPort() == -1 || uri.getPort() == 443)
                    && ("cdn.7tv.app".equals(host)
                            || "cdn.betterttv.net".equals(host)
                            || "cdn.frankerfacez.com".equals(host)
                            || ("static-cdn.jtvnw.net".equals(host)
                                    && uri.getPath().startsWith("/emoticons/v2/"))
                            || ("fourtf.com".equals(host)
                                    && uri.getPath().startsWith("/chatterino/badges/"))
                            || ("flxrs.com".equals(host)
                                    && uri.getPath().startsWith("/dankchat/badges/"))
                            || ("raw.githubusercontent.com".equals(host)
                                    && uri.getPath()
                                            .startsWith("/chatsen/resources/master/assets/")));
        } catch (Exception ignored) {
            return false;
        }
    }
}
