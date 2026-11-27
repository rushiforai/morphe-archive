package local.privacy;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Conservatively removes one identifiable auto-inserted image from post HTML. */
public final class AutoImageFilter {
    private static final Pattern BODY = Pattern.compile("<body\\b[^>]*>", Pattern.CASE_INSENSITIVE);
    private static final Pattern IMAGE = Pattern.compile("<img\\b[^>]{0,4096}>", Pattern.CASE_INSENSITIVE);
    private static final Pattern HASH_ALT = Pattern.compile("\\balt\\s*=\\s*['\"][0-9a-f]{32,}['\"]", Pattern.CASE_INSENSITIVE);

    private AutoImageFilter() { }

    public static String filter(String html) {
        if (!SettingsState.get("hide_author_auto_image") || html == null || html.isEmpty()) return html;
        Matcher body = BODY.matcher(html);
        int start = body.find() ? body.end() : 0;
        Matcher image = IMAGE.matcher(html);
        if (!image.find(start)) return html;
        String tag = image.group();
        String lower = tag.toLowerCase(java.util.Locale.ROOT);
        // Ordinary uploaded images carry data-fileno or data-tempno. Avoid touching
        // external images or images lacking the observed auto-image hash marker.
        if (lower.contains("data-fileno") || lower.contains("data-tempno")
                || !lower.contains("dcinside.com/viewimage.php")
                || !HASH_ALT.matcher(tag).find()) return html;
        return html.substring(0, image.start()) + html.substring(image.end());
    }
}
