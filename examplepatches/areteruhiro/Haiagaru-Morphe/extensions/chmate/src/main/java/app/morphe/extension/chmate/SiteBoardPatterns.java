package app.morphe.extension.chmate;

import java.util.regex.Pattern;

/** Native BoardID uses http:// even for a board fetched through HTTPS. */
final class SiteBoardPatterns {
    static Pattern direct(String kind) {
        if (kind.equals("edge"))
            return Pattern.compile("^https?://bbs\\.eddibb\\.(?:cc|org)/liveedge/$", Pattern.CASE_INSENSITIVE);
        if (kind.equals("kenmo"))
            return Pattern.compile("^https?://(?:kenmo\\.org|00c\\.org)/[A-Za-z0-9_-]+/$", Pattern.CASE_INSENSITIVE);
        return null;
    }

    private SiteBoardPatterns() {}
}
