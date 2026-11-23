package app.jofslash.extension.quora;

import android.net.Uri;
import android.util.Log;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@SuppressWarnings("unused")
public final class CleanLinksPatch {

    private static final String TAG = "JoFSlashPatches";

    // Query parameters Quora adds to shared links to track who shared what and where.
    private static final Set<String> TRACKING_PARAMS = new HashSet<>(Arrays.asList(
            "share", "ch", "oid", "srid", "target_type", "invite_code", "sharer"
    ));

    private static final Pattern URL = Pattern.compile("https?://[^\\s\"'<>]+");

    /**
     * Injection points: the text of the "Copy link" clipboard entry, and the text
     * of the share intent.
     *
     * @return The text with tracking parameters removed from every Quora link in it.
     */
    public static String cleanText(CharSequence value) {
        // The copy-link handler keeps the URL in a CharSequence register, so take the wider type.
        if (value == null) return null;
        String text = value.toString();
        if (text.isEmpty()) return text;
        try {
            Matcher matcher = URL.matcher(text);
            StringBuffer result = new StringBuffer();
            while (matcher.find()) {
                matcher.appendReplacement(result, Matcher.quoteReplacement(cleanUrl(matcher.group())));
            }
            matcher.appendTail(result);
            return result.toString();
        } catch (Exception ex) {
            Log.e(TAG, "Failed to clean link", ex);
            return text;
        }
    }

    private static String cleanUrl(String url) {
        Uri uri = Uri.parse(url);
        String host = uri.getHost();
        if (host == null) return url;
        host = host.toLowerCase();
        if (!host.equals("quora.com") && !host.endsWith(".quora.com")) return url;
        if (uri.getQuery() == null) return url;

        Uri.Builder builder = uri.buildUpon().clearQuery();
        for (String name : uri.getQueryParameterNames()) {
            String lower = name.toLowerCase();
            if (TRACKING_PARAMS.contains(lower) || lower.startsWith("utm_")) continue;
            for (String value : uri.getQueryParameters(name)) {
                builder.appendQueryParameter(name, value);
            }
        }
        return builder.build().toString();
    }
}
