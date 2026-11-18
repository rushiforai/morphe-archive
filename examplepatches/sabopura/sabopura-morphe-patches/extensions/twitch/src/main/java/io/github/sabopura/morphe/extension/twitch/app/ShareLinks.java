package io.github.sabopura.morphe.extension.twitch.app;

import java.net.URI;
import java.net.URISyntaxException;
import java.net.URLDecoder;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Removes known tracking parameters from twitch.tv links in text the user shares or copies. */
final class ShareLinks {
    private static final Pattern WEB_URL = Pattern.compile("https?://[^\\s<>\"']+", Pattern.CASE_INSENSITIVE);
    private static final Set<String> TRACKING = new HashSet<>(Arrays.asList(
            "tt_medium", "tt_content", "tt_campaign", "tt_click_id", "utm_source", "utm_medium", "utm_campaign",
            "utm_term", "utm_content", "utm_id", "gclid", "dclid", "fbclid", "msclkid", "ttclid", "twclid"));

    private ShareLinks() {
    }

    static String clean(String text) {
        if (text == null) return null;
        Matcher matcher = WEB_URL.matcher(text);
        StringBuffer result = new StringBuffer();
        while (matcher.find()) {
            String token = matcher.group();
            int end = token.length();
            while (end > 0 && ".,!;)]}".indexOf(token.charAt(end - 1)) >= 0) end--;
            matcher.appendReplacement(result, Matcher.quoteReplacement(cleanUrl(token.substring(0, end)) + token.substring(end)));
        }
        matcher.appendTail(result);
        return result.toString();
    }

    private static String cleanUrl(String url) {
        try {
            URI uri = new URI(url);
            String host = uri.getHost();
            if (host == null || uri.getRawUserInfo() != null) return url;
            host = host.toLowerCase(Locale.ROOT);
            if (!host.equals("twitch.tv") && !host.endsWith(".twitch.tv")) return url;
            String query = uri.getRawQuery();
            if (query == null || query.isEmpty()) return url;
            StringBuilder kept = new StringBuilder();
            boolean removed = false;
            for (String part : query.split("&", -1)) {
                int equals = part.indexOf('=');
                String key = URLDecoder.decode(equals < 0 ? part : part.substring(0, equals), "UTF-8").toLowerCase(Locale.ROOT);
                if (TRACKING.contains(key)) {
                    removed = true;
                    continue;
                }
                kept.append(kept.length() == 0 ? "" : "&").append(part);
            }
            if (!removed) return url;
            int question = url.indexOf('?');
            int fragment = url.indexOf('#', question);
            return url.substring(0, question) + (kept.length() == 0 ? "" : "?" + kept)
                    + (fragment < 0 ? "" : url.substring(fragment));
        } catch (URISyntaxException | UnsupportedEncodingException | IllegalArgumentException e) {
            return url;
        }
    }
}
