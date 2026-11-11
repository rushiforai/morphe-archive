package e.e.a;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Only auto-repair generic labels on genuine public NicoNico mylist pages. */
public final class TabTitleRules126 {
    private static final Pattern MYLIST = Pattern.compile(
            "(?i)(?:^|/)mylists?/([0-9]+)(?:[/?#]|$)");
    private TabTitleRules126() {}

    public static String id(String url) {
        if (url == null) return "";
        try {
            java.net.URI uri = java.net.URI.create(url);
            String host = uri.getHost();
            if (host == null ||
                    !(host.equalsIgnoreCase("nicovideo.jp") ||
                      host.toLowerCase(java.util.Locale.ROOT).endsWith(".nicovideo.jp")))
                return "";
            Matcher m = MYLIST.matcher(uri.getPath());
            return m.find() ? m.group(1) : "";
        } catch (Exception ignored) {
            return "";
        }
    }

    public static boolean generic(String value) {
        if (value == null || value.trim().isEmpty()) return true;
        String s = value.trim();
        return "nicoid Re".equalsIgnoreCase(s)
                || "公開マイリスト".equals(s)
                || "Mylist".equalsIgnoreCase(s);
    }

    public static String chosen(String savedUrl, String loadedUrl,
                                String previousLabel, CharSequence fetchedTitle) {
        String savedId = id(savedUrl);
        if (savedId.isEmpty()) return previousLabel;
        String loadedId = id(loadedUrl);
        if (!loadedId.isEmpty() && !savedId.equals(loadedId)) return previousLabel;
        if (!generic(previousLabel) || fetchedTitle == null) return previousLabel;
        String candidate = fetchedTitle.toString().trim().replace('\n', ' ');
        if (candidate.isEmpty() || generic(candidate) ||
                "動画".equals(candidate) || "Video".equalsIgnoreCase(candidate))
            return previousLabel;
        return candidate;
    }
}
