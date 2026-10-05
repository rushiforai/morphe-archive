package dev.twitchpatches.extension.ads.hls;

import java.net.URI;
import java.net.URLEncoder;
import java.io.UnsupportedEncodingException;

public final class MasterIdentity {
    private static final String PREFIX = "/api/channel/hls/";
    private static final String MULTIFORMAT_PREFIX = "/api/v2/channel/hls/";
    private static final String SUFFIX = ".m3u8";

    public static String channel(String url) {
        URI uri = URI.create(url);
        String path = uri.getPath();
        if (!HlsPlaylist.twitchUri(uri) || !"usher.ttvnw.net".equalsIgnoreCase(uri.getHost()) ||
                path == null || !path.endsWith(SUFFIX)) return null;
        String prefix = path.startsWith(MULTIFORMAT_PREFIX) ? MULTIFORMAT_PREFIX : PREFIX;
        if (!path.startsWith(prefix)) return null;
        String channel = path.substring(prefix.length(), path.length() - SUFFIX.length());
        return channel.matches("[A-Za-z0-9_]{1,50}") ? channel : null;
    }

    public static String route(String url) {
        try {
            if (channel(url) == null) return "unrecognized";
            return URI.create(url).getPath().startsWith(MULTIFORMAT_PREFIX) ? "multiformat" : "legacy";
        } catch (IllegalArgumentException exception) { return "unrecognized"; }
    }

    public static String replaceToken(String original, String signature, String token) {
        if (channel(original) == null) throw new IllegalArgumentException("Unrecognized live master endpoint");
        URI uri = URI.create(original);
        StringBuilder query = new StringBuilder();
        String raw = uri.getRawQuery();
        if (raw != null) for (String part : raw.split("&")) {
            String name = part.split("=", 2)[0];
            if (!name.equals("sig") && !name.equals("token") && !name.equals("p"))
                query.append(part).append('&');
        }
        query.append("sig=").append(encode(signature)).append("&token=").append(encode(token));
        return "https://usher.ttvnw.net" + uri.getRawPath() + "?" + query;
    }

    private static String encode(String input) {
        try { return URLEncoder.encode(input, "UTF-8"); }
        catch (UnsupportedEncodingException exception) { throw new IllegalStateException("UTF-8 is unavailable", exception); }
    }
}
