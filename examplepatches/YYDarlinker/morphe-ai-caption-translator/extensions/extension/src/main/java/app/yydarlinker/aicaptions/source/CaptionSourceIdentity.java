package app.yydarlinker.aicaptions.source;

import java.net.URI;
import java.net.URLDecoder;
import java.util.Locale;

/** Which caption urls and languages the translator accepts as the source of a video. */
public final class CaptionSourceIdentity {
    private CaptionSourceIdentity() {}

    /**
     * Is [url] the plain (not YouTube-translated) timed-text url of exactly [video], on youtube.com
     * over https, without credentials in it?
     */
    public static boolean safe(String url, String video) {
        if (video == null || !video.matches("[A-Za-z0-9_-]{11}")) return false;
        try {
            URI uri = URI.create(url);
            String host = uri.getHost();
            if (!"https".equals(uri.getScheme())
                    || uri.getUserInfo() != null
                    || (uri.getPort() != -1 && uri.getPort() != 443)
                    || !("www.youtube.com".equals(host) || "youtube.com".equals(host))
                    || !"/api/timedtext".equals(uri.getPath())
                    || uri.getRawQuery() == null) return false;
            int videos = 0;
            boolean same = false;
            for (String part : uri.getRawQuery().split("&")) {
                String[] pair = part.split("=", 2);
                String key = URLDecoder.decode(pair[0], "UTF-8");
                String value = pair.length == 2 ? URLDecoder.decode(pair[1], "UTF-8") : "";
                if (key.equals("v")) {
                    videos++;
                    same = video.equals(value);
                }
                if (key.equals("tlang") && !value.isEmpty()) return false;
            }
            return videos == 1 && same;
        } catch (Exception malformed) {
            return false;
        }
    }

    /** Do the two language tags name the same language, whatever the region or script? */
    public static boolean sameLanguage(String a, String b) {
        return a != null
                && b != null
                && Locale.forLanguageTag(a)
                        .getLanguage()
                        .equals(Locale.forLanguageTag(b).getLanguage());
    }
}
