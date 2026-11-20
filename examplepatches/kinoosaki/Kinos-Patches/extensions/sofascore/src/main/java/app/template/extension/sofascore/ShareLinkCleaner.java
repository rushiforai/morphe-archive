package app.template.extension.sofascore;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Pure text logic of "Clean shared links" (no Android classes, so JVM unit tests cover it). The app
 * appends a tracking short link ({@code https://app.sofascore.com/nixz/<id>}) to shared images; it
 * is replaced by the plain site address. Every other text and link, including the fantasy invite
 * link ({@code https://www.sofascore.com/fantasy/competition/...}), is returned untouched.
 */
public final class ShareLinkCleaner {

    /** The plain address that replaces a tracking short link. */
    static final String PLAIN_LINK = "https://www.sofascore.com";

    /**
     * A tracking short link: the host must be exactly app.sofascore.com and the id only letters,
     * digits, underscore and hyphen, so punctuation after the link survives. It must not be preceded by
     * a word character or one of {@code /.:?&=#%+-}, so a link inside another URL (a query value) or
     * glued to other text is left alone. Linear: one lookbehind character and a single character class.
     */
    private static final Pattern TRACKING_LINK =
            Pattern.compile("(?<![\\w/.:?&=#%+\\-])https://app\\.sofascore\\.com/nixz/[A-Za-z0-9_\\-]+");

    private ShareLinkCleaner() { }

    /** {@code text} with each tracking short link rewritten; same instance when there is none. */
    public static String clean(String text) {
        if (text == null || text.isEmpty()) return text;
        Matcher matcher = TRACKING_LINK.matcher(text);
        if (!matcher.find()) return text;
        return matcher.replaceAll(Matcher.quoteReplacement(PLAIN_LINK));
    }

    /** True for the tracking parameters the app appends to highlight links (utm_*). */
    public static boolean isTrackingParameter(String key) {
        return key != null && key.startsWith("utm_");
    }
}
