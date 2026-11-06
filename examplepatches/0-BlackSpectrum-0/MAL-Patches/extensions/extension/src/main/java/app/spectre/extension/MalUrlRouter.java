package app.spectre.extension;

import android.net.Uri;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@SuppressWarnings("unused")
public class MalUrlRouter {
    private static final Pattern ANIME_PATTERN = Pattern.compile("^/anime/(\\d+)(?:/.*)?$");
    private static final Pattern MANGA_PATTERN = Pattern.compile("^/manga/(\\d+)(?:/.*)?$");

    public static Uri route(Uri uri) {
        if (uri == null) {
            return null;
        }
        String scheme = uri.getScheme();
        if (scheme == null) {
            return uri;
        }
        String schemeLower = scheme.toLowerCase();
        if (!schemeLower.equals("http") && !schemeLower.equals("https")) {
            return uri;
        }
        String host = uri.getHost();
        if (host == null) {
            return uri;
        }
        String hostLower = host.toLowerCase();
        if (!hostLower.equals("myanimelist.net") && !hostLower.endsWith(".myanimelist.net")) {
            return uri;
        }
        String path = uri.getPath();
        if (path == null) {
            path = "";
        }

        // 1. /anime/{id}
        Matcher animeMatcher = ANIME_PATTERN.matcher(path);
        if (animeMatcher.find()) {
            String animeId = animeMatcher.group(1);
            return Uri.parse("net.myanimelist://push_screen?screen=S300&anime_id=" + animeId);
        }

        // 2. /manga/{id}
        Matcher mangaMatcher = MANGA_PATTERN.matcher(path);
        if (mangaMatcher.find()) {
            String mangaId = mangaMatcher.group(1);
            return Uri.parse("net.myanimelist://push_screen?screen=S301&manga_id=" + mangaId);
        }

        // 3. /anime.php?id={id}
        if (path.startsWith("/anime.php")) {
            String id = uri.getQueryParameter("id");
            if (id != null && !id.isEmpty()) {
                return Uri.parse("net.myanimelist://push_screen?screen=S300&anime_id=" + id);
            }
        }

        // 4. /manga.php?id={id}
        if (path.startsWith("/manga.php")) {
            String id = uri.getQueryParameter("id");
            if (id != null && !id.isEmpty()) {
                return Uri.parse("net.myanimelist://push_screen?screen=S301&manga_id=" + id);
            }
        }

        // 5. /forum/?topicid={id}
        if (path.startsWith("/forum")) {
            String topicId = uri.getQueryParameter("topicid");
            if (topicId != null && !topicId.isEmpty()) {
                return Uri.parse("net.myanimelist://push_screen?screen=S309&topic_id=" + topicId);
            }
        }

        // 6. Generic in-app browser fallback
        return new Uri.Builder()
                .scheme("net.myanimelist")
                .authority("push_screen")
                .appendQueryParameter("url", uri.toString())
                .build();
    }
}
