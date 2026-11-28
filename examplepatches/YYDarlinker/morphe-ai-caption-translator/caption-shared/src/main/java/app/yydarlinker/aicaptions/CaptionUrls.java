package app.yydarlinker.aicaptions;

import android.net.Uri;


import java.net.URI;
import java.util.ArrayList;
import java.util.List;

/** Source url and video identity helpers shared by UI, host and core. */
public final class CaptionUrls {
    private CaptionUrls() {}

    /** Is [value] a plain https timed-text url on youtube.com, with no credentials in it? */
    public static boolean isTimedText(String value) {
        try {
            URI uri = URI.create(value);
            String host = uri.getHost();
            return "https".equals(uri.getScheme())
                    && ("www.youtube.com".equals(host) || "youtube.com".equals(host))
                    && uri.getRawUserInfo() == null
                    && (uri.getPort() == -1 || uri.getPort() == 443)
                    && "/api/timedtext".equals(uri.getPath());
        } catch (Exception malformed) {
            return false;
        }
    }

    /** The video of a timed-text url; empty if it names none or more than one. */
    public static String videoId(String value) {
        try {
            List<String> ids = Uri.parse(value).getQueryParameters("v");
            return ids.size() == 1 ? ids.get(0) : "";
        } catch (Exception malformed) {
            return "";
        }
    }

    /** [translatedUrl] without its tlang parameter, otherwise byte for byte as it was. */
    public static String sourceCaptionUrl(String translatedUrl) {
        if (translatedUrl == null) return null;
        int hash = translatedUrl.indexOf('#');
        String fragment = hash >= 0 ? translatedUrl.substring(hash) : "";
        String url = hash >= 0 ? translatedUrl.substring(0, hash) : translatedUrl;

        int queryStart = url.indexOf('?');
        if (queryStart < 0 || queryStart == url.length() - 1) return url + fragment;

        List<String> kept = new ArrayList<>();
        for (String part : url.substring(queryStart + 1).split("&", -1)) {
            if (part.isEmpty()) continue;
            int equals = part.indexOf('=');
            String key = equals < 0 ? part : part.substring(0, equals);
            if (!"tlang".equalsIgnoreCase(decode(key))) kept.add(part);
        }
        return url.substring(0, queryStart)
                + (kept.isEmpty() ? "" : "?" + String.join("&", kept))
                + fragment;
    }

    private static String decode(String key) {
        try {
            return Uri.decode(key);
        } catch (Throwable unavailable) {
            return key;
        }
    }
}
