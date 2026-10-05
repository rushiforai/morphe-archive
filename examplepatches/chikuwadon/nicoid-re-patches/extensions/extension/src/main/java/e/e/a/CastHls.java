package e.e.a;

import java.io.IOException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** One playback's opaque routes and immutable delivery credential. No remote URLs on the LAN. */
final class CastHls {
    private static final Pattern URI_ATTRIBUTE = Pattern.compile("([,:])URI=\"([^\"]*)\"");
    final String prefix = "/cast/" + UUID.randomUUID().toString() + "/";
    final String cookie;
    private final Map<String, URL> routes = new HashMap<>();
    private final Map<String, String> reverse = new HashMap<>();
    CastHls(String cookie) { this.cookie = cookie == null ? "" : cookie.split(";", 2)[0]; }
    synchronized String route(URL url) throws IOException {
        validate(url);
        String value = url.toExternalForm();
        String existing = reverse.get(value);
        if (existing != null) return existing;
        if (routes.size() >= 20000) throw new IOException("Too many HLS resources");
        String path = url.getPath();
        String extension = path.endsWith(".m3u8") ? ".m3u8" : path.endsWith(".mp4") ? ".mp4" :
            path.endsWith(".m4s") ? ".m4s" : path.endsWith(".ts") ? ".ts" : ".bin";
        String key = prefix + routes.size() + extension;
        routes.put(key, url); reverse.put(value, key); return key;
    }
    synchronized URL lookup(String path) { return routes.get(path); }
    synchronized void clear() { routes.clear(); reverse.clear(); }
    static void validate(URL url) throws IOException {
        if (!"https".equalsIgnoreCase(url.getProtocol()) || url.getHost().isEmpty() || url.getUserInfo() != null)
            throw new IOException("Unsupported HLS URL");
    }
    static boolean deliveryHost(URL url) {
        String host = url.getHost().toLowerCase(java.util.Locale.ROOT);
        return host.equals("domand.nicovideo.jp") || host.endsWith(".domand.nicovideo.jp");
    }
    String cookieFor(URL url) { return deliveryHost(url) && cookie.startsWith("domand_bid=") ? cookie : ""; }
    private String rewriteUri(URL base, String value) throws IOException {
        if (value.startsWith("data:")) return value;
        return route(new URL(base, value));
    }
    String rewrite(URL base, String playlist) throws IOException {
        if (playlist.startsWith("\ufeff")) playlist = playlist.substring(1);
        if (!playlist.startsWith("#EXTM3U")) throw new IOException("Invalid HLS playlist");
        StringBuilder result = new StringBuilder();
        for (String line : playlist.split("\\r?\\n", -1)) {
            if (!line.trim().isEmpty() && !line.startsWith("#")) {
                result.append(rewriteUri(base, line.trim()));
            } else {
                Matcher matcher = URI_ATTRIBUTE.matcher(line);
                StringBuffer changed = new StringBuffer();
                while (matcher.find()) matcher.appendReplacement(changed, Matcher.quoteReplacement(
                    matcher.group(1) + "URI=\"" + rewriteUri(base, matcher.group(2)) + "\""));
                matcher.appendTail(changed); result.append(changed);
            }
            result.append('\n');
        }
        return result.toString();
    }
}
