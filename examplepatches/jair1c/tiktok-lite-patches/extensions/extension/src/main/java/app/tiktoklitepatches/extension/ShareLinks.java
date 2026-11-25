package app.tiktoklitepatches.extension;

import android.content.ClipData;

import java.net.URI;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public final class ShareLinks {
    private static final Set<String> TRACKING_KEYS = new HashSet<>(Arrays.asList(
            "_d", "_r", "_t", "is_from_webapp", "sec_user_id", "share_app_id",
            "share_iid", "share_link_id", "timestamp", "tt_from", "u_code"
    ));

    private static final Pattern TIKTOK_VIDEO_LINK = Pattern.compile(
            "^https://(?:(?:vm|vt)\\.tiktok\\.com/[A-Za-z0-9]+/?|(?:www\\.)?tiktok\\.com/@[^/\\s]+/(?:video|photo)/[0-9]+/?)(?:[?#]\\S*)?(?=\\s|$)"
    );
    private static final String LITE_PROMO_URL = "https://www.tiktok.com/tiktoklite";

    public static ClipData cleanCopiedLink(ClipData clip) {
        if (clip == null || clip.getItemCount() != 1) return clip;
        ClipData.Item item = clip.getItemAt(0);
        CharSequence text = item.getText();
        if (text == null || item.getHtmlText() != null || item.getIntent() != null || item.getUri() != null) {
            return clip;
        }
        String original = text.toString();
        String cleaned = cleanCopiedText(original);
        if (original.equals(cleaned)) return clip;
        return new ClipData(clip.getDescription(), new ClipData.Item(cleaned));
    }

    static String cleanCopiedText(String text) {
        Matcher match = TIKTOK_VIDEO_LINK.matcher(text);
        if (!match.find()) return text;

        String suffix = text.substring(match.end()).trim();
        if (!suffix.isEmpty() && !suffix.endsWith(LITE_PROMO_URL)) return text;
        return clean(match.group());
    }

    private ShareLinks() {
    }

    public static String clean(String url) {
        if (url == null) return null;
        try {
            URI uri = URI.create(url);
            String host = uri.getHost();
            String query = uri.getRawQuery();
            if (host == null || query == null
                    || !("https".equalsIgnoreCase(uri.getScheme()) || "http".equalsIgnoreCase(uri.getScheme()))) {
                return url;
            }
            host = host.toLowerCase(Locale.ROOT);
            if (!host.equals("tiktok.com") && !host.endsWith(".tiktok.com")) return url;

            List<String> retained = new ArrayList<>();
            boolean changed = false;
            for (String parameter : query.split("&", -1)) {
                int equals = parameter.indexOf('=');
                String key = equals < 0 ? parameter : parameter.substring(0, equals);
                key = URLDecoder.decode(key, "UTF-8").toLowerCase(Locale.ROOT);
                if (key.startsWith("utm_") || TRACKING_KEYS.contains(key)) {
                    changed = true;
                } else {
                    retained.add(parameter);
                }
            }
            if (!changed) return url;

            int queryStart = url.indexOf('?');
            int fragmentStart = url.indexOf('#', queryStart + 1);
            String cleanQuery = String.join("&", retained);
            return url.substring(0, queryStart)
                    + (cleanQuery.isEmpty() ? "" : "?" + cleanQuery)
                    + (fragmentStart < 0 ? "" : url.substring(fragmentStart));
        } catch (IllegalArgumentException | java.io.UnsupportedEncodingException e) {
            return url;
        }
    }
}
