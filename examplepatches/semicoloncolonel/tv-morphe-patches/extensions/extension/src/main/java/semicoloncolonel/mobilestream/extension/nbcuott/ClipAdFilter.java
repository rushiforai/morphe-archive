package semicoloncolonel.mobilestream.extension.nbcuott;

import android.net.Uri;
import android.util.Log;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Clip ads in the NBCU news web apps on Android TV.
 *
 * MS NOW and CNBC play each clip through an AWS MediaTailor session, which
 * stitches FreeWheel ads into the clip's HLS playlists. MediaTailor's paths
 * keep the clip's path on its origin:
 * /v1/master/{account}/{configuration}/{path on the origin}. For a
 * configuration whose origin is known, the master playlist request is
 * answered with the origin's own playlist, so the clip plays from the origin
 * with no ads in it. The session's tracking request is answered with no ad
 * breaks, so the player shows no ad markers.
 *
 * NBC News plays clips straight from the origin and asks FreeWheel for a
 * preroll first (/ad/g/1, a VMAP). That request is answered with an empty
 * VMAP, which the player treats like an unfilled break.
 *
 * Anything else, or any failure, goes to the network as before.
 */
@SuppressWarnings("unused")
public final class ClipAdFilter {
    private static final String TAG = "MSP-NBCU-ADS";

    private static final Pattern MEDIATAILOR_PATH =
            Pattern.compile("^/v1/(master|dash|tracking)/[^/]+/([^/]+)/(.+)$");

    // MediaTailor configuration -> the origin host its content comes from.
    private static final Map<String, String> ORIGINS = new HashMap<>();

    static {
        ORIGINS.put("usanetwork-vod-sf-external-newsencoding", "vs-newsencoding.akamaized.net");
        ORIGINS.put("usanetwork-vod-sf-external-prodamdnewsencoding", "prodamdnewsencoding.akamaized.net");
        ORIGINS.put("usanetwork-vod-sf-external-cnbcawsmpvod", "cnbcawsmpvod.akamaized.net");
        ORIGINS.put("usanetwork-vod-sf-external-cnbchls", "cnbc-hls.akamaized.net");
    }

    private static final byte[] EMPTY_VMAP =
            "<vmap:VMAP xmlns:vmap=\"http://www.iab.net/videosuite/vmap\" version=\"1.0\"/>"
                    .getBytes(StandardCharsets.UTF_8);

    private ClipAdFilter() {
    }

    public static WebResourceResponse filter(WebResourceRequest request) {
        try {
            if (request == null || request.getUrl() == null) return null;
            Uri url = request.getUrl();
            String host = url.getHost();
            String path = url.getPath();
            if (host == null || path == null || !"GET".equalsIgnoreCase(request.getMethod())) return null;
            if (host.endsWith(".v.fwmrm.net") && path.equals("/ad/g/1")) {
                Log.i(TAG, "No preroll from " + host);
                return respond(request, "text/xml", EMPTY_VMAP);
            }
            if (!host.contains(".mediatailor.") || !host.endsWith(".amazonaws.com")) return null;
            Matcher match = MEDIATAILOR_PATH.matcher(path);
            if (!match.matches()) {
                Log.i(TAG, "Not a clip playlist: " + host + path.substring(0, Math.min(path.length(), 40)));
                return null;
            }
            String origin = ORIGINS.get(match.group(2));
            if (origin == null) {
                Log.i(TAG, "No origin known for " + match.group(2));
                return null;
            }

            if ("tracking".equals(match.group(1))) {
                Log.i(TAG, "No ad breaks for " + match.group(2));
                return respond(request, "application/json", "{\"avails\":[]}".getBytes(StandardCharsets.UTF_8));
            }

            String originUrl = "https://" + origin + "/" + match.group(3) + originQuery(url);
            byte[] playlist = fetch(originUrl);
            if (playlist == null) {
                Log.w(TAG, "The origin did not answer, so the ads stay: " + origin);
                return null;
            }
            Log.i(TAG, "Playing from the origin: " + origin + " (" + match.group(1) + ")");
            String withoutQuery = originUrl.split("\\?", 2)[0];
            String base = withoutQuery.substring(0, withoutQuery.lastIndexOf('/') + 1);
            String text = new String(playlist, StandardCharsets.UTF_8);
            if ("dash".equals(match.group(1))) {
                return respond(request, "application/dash+xml", withBaseUrl(text, base).getBytes(StandardCharsets.UTF_8));
            }
            return respond(request, "application/vnd.apple.mpegurl", absolutize(text, base).getBytes(StandardCharsets.UTF_8));
        } catch (Throwable t) {
            Log.w(TAG, "Left the request to the network", t);
            return null;
        }
    }

    /** The request's own query (such as an origin token), without MediaTailor's aws.* parameters. */
    private static String originQuery(Uri url) {
        StringBuilder query = new StringBuilder();
        for (String name : url.getQueryParameterNames()) {
            if (name.startsWith("aws.")) continue;
            for (String value : url.getQueryParameters(name)) {
                query.append(query.length() == 0 ? '?' : '&')
                        .append(Uri.encode(name)).append('=').append(Uri.encode(value));
            }
        }
        return query.toString();
    }

    private static byte[] fetch(String address) throws Exception {
        HttpURLConnection connection = (HttpURLConnection) new URL(address).openConnection();
        connection.setConnectTimeout(10_000);
        connection.setReadTimeout(10_000);
        try {
            int status = connection.getResponseCode();
            if (status != 200) {
                Log.w(TAG, "HTTP " + status + " from " + address.split("\\?", 2)[0]);
                return null;
            }
            try (InputStream in = connection.getInputStream()) {
                ByteArrayOutputStream out = new ByteArrayOutputStream();
                byte[] buffer = new byte[8192];
                int read;
                while ((read = in.read(buffer)) != -1) out.write(buffer, 0, read);
                return out.toByteArray();
            }
        } finally {
            connection.disconnect();
        }
    }

    /**
     * Relative URLs in a DASH manifest would resolve against MediaTailor. A
     * BaseURL at the top of the MPD makes them resolve against the origin;
     * deeper relative BaseURLs resolve against it in turn.
     */
    static String withBaseUrl(String mpd, String base) {
        int open = openTagEnd(mpd, "<MPD");
        if (open < 0) return mpd;
        Matcher existing = Pattern.compile("<BaseURL>\\s*(https?://)").matcher(mpd);
        if (existing.find() && existing.start() < mpd.indexOf("<Period")) return mpd;
        return mpd.substring(0, open) + "<BaseURL>" + base + "</BaseURL>" + mpd.substring(open);
    }

    /**
     * The index just past the first start tag named tag, as the pattern
     * tag\b[^>]*> finds it, or -1. A pattern would retry from every unclosed
     * tag, which on a long manifest takes time that grows with the square of
     * its length. This scan reads the text once.
     */
    static int openTagEnd(String text, String tag) {
        for (int at = text.indexOf(tag); at >= 0; at = text.indexOf(tag, at + tag.length())) {
            int next = at + tag.length();
            if (next < text.length()) {
                char c = text.charAt(next);
                if (Character.isLetterOrDigit(c) || c == '_') continue;
            }
            int close = text.indexOf('>', next);
            return close < 0 ? -1 : close + 1;
        }
        return -1;
    }

    /** Relative URIs would resolve against MediaTailor, so point them at the origin. */
    static String absolutize(String playlist, String base) {
        StringBuilder out = new StringBuilder(playlist.length() + 1024);
        for (String line : playlist.split("\n", -1)) {
            String trimmed = line.trim();
            if (!trimmed.isEmpty() && !trimmed.startsWith("#")) {
                out.append(isAbsolute(trimmed) ? trimmed : base + trimmed);
            } else if (trimmed.startsWith("#") && trimmed.contains("URI=\"")) {
                Matcher uri = Pattern.compile("URI=\"([^\"]+)\"").matcher(line);
                StringBuffer replaced = new StringBuffer();
                while (uri.find()) {
                    String value = uri.group(1);
                    uri.appendReplacement(replaced, Matcher.quoteReplacement(
                            "URI=\"" + (isAbsolute(value) ? value : base + value) + "\""));
                }
                uri.appendTail(replaced);
                out.append(replaced);
            } else {
                out.append(line);
            }
            out.append('\n');
        }
        out.setLength(Math.max(0, out.length() - 1));
        return out.toString();
    }

    private static boolean isAbsolute(String uri) {
        return uri.startsWith("http://") || uri.startsWith("https://") || uri.startsWith("data:");
    }

    private static WebResourceResponse respond(WebResourceRequest request, String type, byte[] body) {
        Map<String, String> headers = new HashMap<>();
        String origin = null;
        Map<String, String> requestHeaders = request.getRequestHeaders();
        if (requestHeaders != null) {
            for (Map.Entry<String, String> header : requestHeaders.entrySet()) {
                if ("origin".equalsIgnoreCase(header.getKey())) origin = header.getValue();
            }
        }
        if (origin != null) {
            headers.put("Access-Control-Allow-Origin", origin);
            headers.put("Access-Control-Allow-Credentials", "true");
        } else {
            headers.put("Access-Control-Allow-Origin", "*");
        }
        headers.put("Cache-Control", "no-store");
        return new WebResourceResponse(type, "utf-8", 200, "OK", headers, new ByteArrayInputStream(body));
    }
}
