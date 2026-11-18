package io.github.jordanwoodson.extension.shared.kick;

import android.content.Intent;

import java.net.URI;
import java.net.URLDecoder;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import io.github.jordanwoodson.extension.shared.Logger;
import io.github.jordanwoodson.extension.shared.settings.Settings;

/** Small native boundaries; this class never handles playback responses or manifest URLs. */
@SuppressWarnings("unused")
public final class KickPrivacy {
    private static final String BLOCK_FINGERPRINTING = "block_fingerprinting";
    private static final Pattern WEB_URL = Pattern.compile("https?://[^\\s<>\"']+", Pattern.CASE_INSENSITIVE);
    private static final Set<String> TRACKING_KEYS = new HashSet<>(Arrays.asList(
            "utm_source", "utm_medium", "utm_campaign", "utm_term", "utm_content", "utm_id",
            "gclid", "dclid", "fbclid", "msclkid", "ttclid", "twclid"));

    private KickPrivacy() {
    }

    public static boolean allowAnalyticsCollection(boolean requested) {
        return requested && !Settings.isEnabled("disable_analytics");
    }

    /**
     * Injection point: the start of FingerprintJS Pro's React Native getVisitorDataWithTimeout and
     * getVisitorIdWithTimeout. True while Block device fingerprinting is on; the injected code then rejects the
     * request the way the SDK reports a network error, so nothing reaches FingerprintJS's endpoint. Opt-in, so an
     * unreadable settings registry never turns it on.
     */
    public static boolean blockFingerprint() {
        if (!Settings.isRegistered(BLOCK_FINGERPRINTING) || !Settings.isEnabled(BLOCK_FINGERPRINTING)) return false;
        Logger.blocked("FingerprintJS device fingerprint request");
        return true;
    }

    /** Same return contract as Intent.putExtra; subjects, attachments and destinations stay intact. */
    public static Intent putShareExtra(Intent intent, String key, String value) {
        if (Intent.EXTRA_TEXT.equals(key) && Settings.isEnabled("clean_share_links")) {
            value = cleanShareText(value);
        }
        return intent.putExtra(key, value);
    }

    public static String cleanShareText(String text) {
        if (text == null) return null;
        Matcher matcher = WEB_URL.matcher(text);
        StringBuffer result = new StringBuffer();
        while (matcher.find()) {
            String token = matcher.group();
            int end = token.length();
            // A URL pasted into a sentence can be followed by punctuation; retain that suffix verbatim.
            while (end > 0 && ".,!;)]}".indexOf(token.charAt(end - 1)) >= 0) end--;
            String replacement = cleanUrl(token.substring(0, end)) + token.substring(end);
            matcher.appendReplacement(result, Matcher.quoteReplacement(replacement));
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
            if (!host.equals("kick.com") && !host.endsWith(".kick.com")) return url;
            String query = uri.getRawQuery();
            if (query == null || query.isEmpty()) return url;
            StringBuilder kept = new StringBuilder();
            boolean removed = false;
            boolean first = true;
            for (String part : query.split("&", -1)) {
                int equals = part.indexOf('=');
                String key = equals < 0 ? part : part.substring(0, equals);
                key = URLDecoder.decode(key, "UTF-8").toLowerCase(Locale.ROOT);
                if (TRACKING_KEYS.contains(key)) {
                    removed = true;
                    continue;
                }
                if (!first) kept.append('&');
                kept.append(part);
                first = false;
            }
            if (!removed) return url;
            int question = url.indexOf('?');
            int fragment = url.indexOf('#', question);
            return url.substring(0, question) + (first ? "" : "?" + kept)
                    + (fragment < 0 ? "" : url.substring(fragment));
        } catch (Exception ignored) {
            // Malformed or unusual URLs pass through; never damage a share to remove a tracking tag.
            return url;
        }
    }
}
