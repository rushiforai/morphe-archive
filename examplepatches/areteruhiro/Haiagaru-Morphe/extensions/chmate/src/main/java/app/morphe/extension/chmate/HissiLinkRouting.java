package app.morphe.extension.chmate;

import java.net.URI;
import java.util.Locale;

/** Restricts links handed to ChMate to recognizable board-thread URLs. */
public final class HissiLinkRouting {
    private HissiLinkRouting() {}

    public static boolean isThreadUrl(String value) {
        if (value == null) return false;
        final URI uri;
        try {
            uri = URI.create(value);
        } catch (IllegalArgumentException ignored) {
            return false;
        }
        String scheme = uri.getScheme();
        String host = uri.getHost();
        if (scheme == null || host == null || uri.getRawUserInfo() != null
                || !("http".equalsIgnoreCase(scheme) || "https".equalsIgnoreCase(scheme))) {
            return false;
        }
        host = host.toLowerCase(Locale.ROOT);
        if (!isForumHost(host)) return false;

        String path = uri.getPath();
        if (path == null) return false;
        String[] parts = path.split("/");
        // Hissi's thread and individual-post links use /test/read.cgi/board/id/post.
        if (parts.length >= 5 && "test".equals(parts[1])
                && "read.cgi".equals(parts[2])) {
            return !parts[3].isEmpty() && isThreadId(parts[4]);
        }
        // Talk and itest links may also appear in user-provided Hissi pages.
        if (parts.length >= 4 && "boards".equals(parts[1])) {
            return !parts[2].isEmpty() && isThreadId(parts[3]);
        }
        if (parts.length >= 5 && "bbs".equals(parts[1])
                && "read.cgi".equals(parts[2])) {
            if ("jbbs.shitaraba.net".equals(host)) {
                return parts.length >= 6 && !parts[3].isEmpty()
                        && !parts[4].isEmpty() && isThreadId(parts[5]);
            }
            return !parts[3].isEmpty() && isThreadId(parts[4]);
        }
        if ("pinkdarker.com".equals(host) && parts.length >= 4
                && "t".equals(parts[1]) && "topic".equals(parts[2])) {
            return isThreadId(parts[3]);
        }
        return parts.length >= 6 && "itest.5ch.io".equals(host)
                && "test".equals(parts[2]) && "read.cgi".equals(parts[3])
                && !parts[4].isEmpty() && isThreadId(parts[5]);
    }

    private static boolean isForumHost(String host) {
        return isHostOrSubdomain(host, "5ch.io")
                || isHostOrSubdomain(host, "5ch.net")
                || isHostOrSubdomain(host, "2ch.net")
                || isHostOrSubdomain(host, "2ch.sc")
                || isHostOrSubdomain(host, "bbspink.com")
                || isHostOrSubdomain(host, "talk.jp")
                || KyodemoRouting.supportsHost(host);
    }

    private static boolean isHostOrSubdomain(String host, String domain) {
        return host.equals(domain) || host.endsWith('.' + domain);
    }

    private static boolean isThreadId(String value) {
        if (value.length() < 9) return false;
        for (int index = 0; index < value.length(); index++) {
            char character = value.charAt(index);
            if (character < '0' || character > '9') return false;
        }
        return true;
    }
}
