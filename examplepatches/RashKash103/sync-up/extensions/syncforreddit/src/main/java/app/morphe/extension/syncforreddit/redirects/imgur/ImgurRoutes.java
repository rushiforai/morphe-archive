package app.morphe.extension.syncforreddit.redirects.imgur;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Which Imgur addresses can be reached another way, and what that way looks like.
 *
 * <p>Nothing here touches the network, the app or Android: it is the rules themselves, so that
 * they can be read and tested on their own. {@code test/test_request_parsing.py} runs them.
 *
 * <p>The three routes do not cover the same ground, and pretending otherwise is how a picture
 * comes out broken:
 *
 * <ul>
 *   <li><b>DuckDuckGo's image proxy</b> fetches one picture, and only a picture. Asked for an
 *       album page, a video, or an address with no scheme, it answers 400 with a little SVG
 *       apology — which, handed to an image decoder, draws as a broken image rather than as
 *       nothing. So it is offered only where the address is a still picture.
 *   <li><b>Rimgo</b> is a whole front end for Imgur, so it serves pictures, videos and album
 *       pages alike, each on a path of its own.
 *   <li><b>A proxy</b> carries whatever is asked of it, Imgur's own API included, since it is
 *       the request itself that travels rather than the address.
 * </ul>
 */
public final class ImgurRoutes {
    /** What kind of thing an Imgur address asks for, which is what settles the route. */
    public enum Kind {
        /** A still picture: every route can serve one. */
        PICTURE,
        /** A video: Rimgo or a proxy, never DuckDuckGo. */
        VIDEO,
        /** A page — an album, a gallery, a post: Rimgo or a proxy. */
        PAGE,
        /** Imgur's own API: a proxy only. */
        API,
        /** Nothing we have a route for. */
        NONE,
    }

    private static final String IMGUR = "imgur.com";

    /** Imgur's own shortener, which serves the same content under another name. */
    private static final String IMGUR_SHORT = "imgur.io";

    /**
     * Stack Overflow's images, which merely happen to live on a name ending in Imgur's. They are
     * not what is being refused and Rimgo serves them on a path of its own, so they are left
     * alone rather than quietly sent somewhere else.
     */
    private static final String STACK = "i.stack.imgur.com";

    private static final String API = "api.imgur.com";

    /** DuckDuckGo's image proxy, which is what the browser extensions for this all use. */
    private static final String DUCKDUCKGO =
            "https://external-content.duckduckgo.com/iu/?u=";

    private static final String[] PICTURE_ENDINGS = {
            ".jpg", ".jpeg", ".png", ".gif", ".webp", ".bmp", ".apng", ".tiff", ".heic", ".avif",
    };

    private static final String[] VIDEO_ENDINGS = {".mp4", ".webm", ".mkv", ".mov"};

    /**
     * Paths that name a page rather than one piece of media, each of which Rimgo serves under
     * the same shape.
     */
    private static final String[] PAGE_FIRST_SEGMENTS = {"a", "gallery", "t", "r", "user"};

    /**
     * What Imgur calls the page wrapping a video, and what Sync asks for when it wants the
     * video itself.
     *
     * <p>Imgur answers {@code .gifv} with markup holding a player, and so does Rimgo — 1,587
     * bytes of HTML, measured — so sending one as it stands gets a page where a video was
     * wanted. The video beside it is the same id as {@code .mp4}, which is what Sync's own
     * undelete already asks the archive for, so that is what a route is asked for too.
     */
    private static final String GIFV = ".gifv";

    private static final String MP4 = ".mp4";

    /**
     * What an album page links its media as. Rimgo writes each one as {@code src="/<id>.<ext>"},
     * which is its own media path, so the ids can be read straight out of the page.
     *
     * <p>Anchored on the quote and the leading slash so that nothing else on the page is taken
     * for media, and the static files it serves for itself are dropped by name below.
     */
    /**
     * Each tag on an album page that names something to draw, read whole so that what the tag
     * says about itself can be taken into account.
     */
    private static final Pattern RIMGO_TAG = Pattern.compile(
            "<(?:img|source)\\s[^>]*>", Pattern.CASE_INSENSITIVE);

    private static final Pattern RIMGO_MEDIA = Pattern.compile(
            "src=\"/([A-Za-z0-9]{3,12}\\.(?:jpg|jpeg|png|gif|webp|mp4|webm))\"");

    /**
     * What an instance marks a picture posted in the <i>comments</i> with.
     *
     * <p>Those are on the page and are not part of the album. An album of twenty came back as
     * twenty-two before this, and the two extra were pictures two commenters had posted
     * underneath it — which is not obvious in the viewer, since they look like album items and
     * simply make the count wrong. Avatars are already left out by the query they carry.
     */
    private static final String A_COMMENT = "comment__media";

    private ImgurRoutes() {}

    /**
     * @return Whether this is a host whose content Imgur refuses by region, and so one there is
     *         any point sending elsewhere.
     */
    public static boolean isImgur(String host) {
        if (host == null) {
            return false;
        }
        String named = host.toLowerCase(Locale.ROOT);
        if (named.equals(STACK)) {
            return false;
        }
        return named.equals(IMGUR) || named.endsWith("." + IMGUR)
                || named.equals(IMGUR_SHORT) || named.endsWith("." + IMGUR_SHORT);
    }

    /** @return What the address asks for, which decides which routes can answer it. */
    public static Kind kindOf(String host, String path) {
        if (!isImgur(host)) {
            return Kind.NONE;
        }
        if (host.toLowerCase(Locale.ROOT).equals(API)) {
            return Kind.API;
        }

        String lower = path == null ? "" : path.toLowerCase(Locale.ROOT);
        if (lower.endsWith(GIFV)) {
            return Kind.VIDEO;
        }
        for (String ending : VIDEO_ENDINGS) {
            if (lower.endsWith(ending)) {
                return Kind.VIDEO;
            }
        }
        for (String ending : PICTURE_ENDINGS) {
            if (lower.endsWith(ending)) {
                return Kind.PICTURE;
            }
        }

        String first = firstSegment(lower);
        for (String segment : PAGE_FIRST_SEGMENTS) {
            if (segment.equals(first)) {
                return Kind.PAGE;
            }
        }
        // What is left is a bare id. On the picture host that is a picture whose address simply
        // carries no extension; anywhere else it is the page for a post.
        if (!first.isEmpty()) {
            return host.toLowerCase(Locale.ROOT).startsWith("i.") ? Kind.PICTURE : Kind.PAGE;
        }
        return Kind.NONE;
    }

    /**
     * @return The address to ask DuckDuckGo's proxy for instead, or null where it would not be
     *         able to answer. The proxy reads what it is to fetch from the {@code u} parameter
     *         and insists on a whole address with a scheme; it also wants something that looks
     *         like a picture, which is why a bare id is given an ending here. Imgur serves a
     *         picture whatever ending is asked for, so saying {@code .png} of a JPEG is not a
     *         problem — the browser extensions this follows do exactly that.
     */
    public static String duckDuckGo(String url, Kind kind) {
        if (kind != Kind.PICTURE || url == null || url.isEmpty()) {
            return null;
        }
        if (!url.startsWith("http://") && !url.startsWith("https://")) {
            return null;
        }

        // The ending is looked for on the path alone. An address carrying a query ends in
        // whatever the last parameter is, so asking whether the whole thing ends in .png says
        // nothing about it — and the ending, where one is added, belongs on the path rather
        // than on the end of the query.
        int query = indexOfTheQuery(url);
        String path = query < 0 ? url : url.substring(0, query);
        String rest = query < 0 ? "" : url.substring(query);

        String asked = hasAPictureEnding(path) ? url : path + ".png" + rest;
        return DUCKDUCKGO + encode(asked);
    }

    /**
     * @param instance The instance's address, with no trailing slash.
     * @return The same thing on that instance, or null where there is no path for it. Rimgo
     *         serves media at {@code /<name>.<extension>} and keeps Imgur's own shape for the
     *         pages, so most of this is the path as it stands.
     */
    public static String rimgo(String instance, String host, String path, Kind kind) {
        if (instance == null || instance.isEmpty() || kind == Kind.NONE || kind == Kind.API) {
            return null;
        }
        String base = instance.endsWith("/")
                ? instance.substring(0, instance.length() - 1) : instance;
        String onIt = path == null || path.isEmpty() ? "/" : path;
        if (!onIt.startsWith("/")) {
            onIt = "/" + onIt;
        }

        if (kind == Kind.PICTURE || kind == Kind.VIDEO) {
            // Media is named by the last segment alone, whatever it was reached through.
            String name = onIt.substring(onIt.lastIndexOf('/') + 1);
            if (name.isEmpty()) {
                return null;
            }
            if (name.toLowerCase(Locale.ROOT).endsWith(GIFV)) {
                name = name.substring(0, name.length() - GIFV.length()) + MP4;
            } else if (!hasAPictureEnding(name) && !hasAVideoEnding(name)) {
                name = name + ".png";
            }
            return base + "/" + name;
        }

        return base + onIt;
    }

    /**
     * The addresses an album's page is at on an instance, in the order they are worth asking
     * for.
     *
     * <p>Rimgo keeps Imgur's own two shapes, and which of them answers depends on what the id
     * turns out to be: {@code /a/<id>} serves an album, and an id that is a gallery post is
     * served at {@code /gallery/<id>}. Measured against a working instance, an album id
     * answered at both and a gallery id at both as well — but not every instance is built from
     * the same commit, so both are tried rather than one being assumed.
     */
    public static List<String> rimgoAlbumPages(String instance, String albumId) {
        List<String> pages = new ArrayList<>();
        if (instance == null || instance.isEmpty() || albumId == null || albumId.isEmpty()) {
            return pages;
        }
        String base = instance.endsWith("/")
                ? instance.substring(0, instance.length() - 1) : instance;
        pages.add(base + "/a/" + albumId);
        pages.add(base + "/gallery/" + albumId);
        return pages;
    }

    /**
     * @return The id of the album or gallery this address is for, or null where it is not one.
     *         What holds an album's contents is the page, and that is what gets read.
     */
    public static String albumIdIn(String host, String path) {
        if (!isImgur(host) || path == null) {
            return null;
        }
        String[] segments = path.split("/");
        for (int at = 0; at < segments.length - 1; at++) {
            if ("a".equals(segments[at]) || "gallery".equals(segments[at])) {
                String id = segments[at + 1];
                return id.isEmpty() ? null : stripEnding(id);
            }
        }
        return null;
    }

    /**
     * Reads the media out of an album page Rimgo served.
     *
     * @return Each item's name with its extension, in the order the page lists them, with
     *         nothing repeated. Empty where the page holds none, which is what a page that is
     *         an error rather than an album looks like.
     */
    public static List<String> mediaInRimgoAlbum(String html) {
        List<String> found = new ArrayList<>();
        if (html == null || html.isEmpty()) {
            return found;
        }
        Matcher tags = RIMGO_TAG.matcher(html);
        while (tags.find()) {
            String tag = tags.group();
            if (tag.contains(A_COMMENT)) {
                continue;
            }
            Matcher matching = RIMGO_MEDIA.matcher(tag);
            if (matching.find()) {
                String name = matching.group(1);
                if (!found.contains(name)) {
                    found.add(name);
                }
            }
        }
        return found;
    }

    /**
     * What to hand out in place of an address when something is shared or copied.
     *
     * <p>Kept here with the rest of the rules, and taking what the settings say rather than
     * reading them, so that it can be read and tested on its own.
     *
     * <p><b>Only what the route asked for can really answer.</b> DuckDuckGo's proxy serves one
     * picture, so with it alone an album is handed out as the Imgur address it has always
     * been: giving somebody a proxy address for an album would be giving them a broken
     * picture. The proxy route has no say here at all — it carries the request rather than
     * changing the address, so there is no other address it could offer.
     *
     * @param said      The whole of what is being handed out. Anything that is not exactly one
     *                  address — a comment, a title, a sentence mentioning a link — is left
     *                  alone, which is what the strictness of the parsing below is for.
     * @param instance  The Rimgo instance to name, or null where none is to be.
     * @return What to hand out instead, or null to hand out what was there.
     */
    public static String handedOut(String said, boolean throughDuckDuckGo, boolean throughRimgo,
                                   String instance) {
        if (said == null) {
            return null;
        }
        String address = said.trim();
        String host = hostIn(address);
        if (host == null || !isImgur(host)) {
            return null;
        }

        Kind kind = kindOf(host, pathIn(address));
        if (kind == Kind.NONE || kind == Kind.API) {
            return null;
        }

        // DuckDuckGo first, which is the order the app itself fetches in, so that what is
        // handed out is where the picture actually came from. It answers null for everything
        // it could not serve, which is how an album falls through to Rimgo or to nothing.
        if (throughDuckDuckGo) {
            String instead = duckDuckGo(address, kind);
            if (instead != null) {
                return instead;
            }
        }
        if (throughRimgo && instance != null && !instance.isEmpty()) {
            return rimgo(instance, host, pathIn(address), kind);
        }
        return null;
    }

    /**
     * @return The host of an address that is nothing but an address, or null for anything
     *         else. Strict on purpose: this decides whether a piece of text is handled at all,
     *         and a comment that happens to open with a link is text rather than a link.
     */
    public static String hostIn(String address) {
        if (address == null) {
            return null;
        }
        String after;
        if (address.startsWith("https://")) {
            after = address.substring(8);
        } else if (address.startsWith("http://")) {
            after = address.substring(7);
        } else {
            return null;
        }
        for (int at = 0; at < address.length(); at++) {
            if (Character.isWhitespace(address.charAt(at))) {
                return null;
            }
        }
        int ends = after.length();
        for (int at = 0; at < after.length(); at++) {
            char each = after.charAt(at);
            if (each == '/' || each == '?' || each == '#') {
                ends = at;
                break;
            }
        }
        String host = after.substring(0, ends);
        // A name and password in front of the host is not something Imgur uses and is the
        // shape a link is disguised with, so it is not taken for one of these at all.
        if (host.isEmpty() || host.indexOf('@') >= 0) {
            return null;
        }
        int colon = host.indexOf(':');
        return colon < 0 ? host : host.substring(0, colon);
    }

    /** @return The path of such an address, or an empty string where it carries none. */
    public static String pathIn(String address) {
        String after = address.startsWith("https://") ? address.substring(8)
                : address.startsWith("http://") ? address.substring(7) : address;
        int slash = after.indexOf('/');
        if (slash < 0) {
            return "";
        }
        String rest = after.substring(slash);
        int query = indexOfTheQuery(rest);
        return query < 0 ? rest : rest.substring(0, query);
    }

    /** @return The ordinary Imgur address for a piece of media named in an album. */
    public static String imgurLinkFor(String name) {
        return "https://i.imgur.com/" + name;
    }

    // region Small things, kept here so the rules above read as rules.

    /** @return Where the path stops and a query or a fragment begins, or -1 where neither does. */
    private static int indexOfTheQuery(String url) {
        int question = url.indexOf('?');
        int hash = url.indexOf('#');
        if (question < 0) {
            return hash;
        }
        if (hash < 0) {
            return question;
        }
        return Math.min(question, hash);
    }

    private static String firstSegment(String path) {
        if (path == null || path.isEmpty()) {
            return "";
        }
        String without = path.startsWith("/") ? path.substring(1) : path;
        int slash = without.indexOf('/');
        return slash < 0 ? without : without.substring(0, slash);
    }

    private static boolean hasAPictureEnding(String what) {
        String lower = what.toLowerCase(Locale.ROOT);
        for (String ending : PICTURE_ENDINGS) {
            if (lower.endsWith(ending)) {
                return true;
            }
        }
        return false;
    }

    private static boolean hasAVideoEnding(String what) {
        String lower = what.toLowerCase(Locale.ROOT);
        for (String ending : VIDEO_ENDINGS) {
            if (lower.endsWith(ending)) {
                return true;
            }
        }
        return false;
    }

    private static String stripEnding(String id) {
        int dot = id.indexOf('.');
        return dot < 0 ? id : id.substring(0, dot);
    }

    /**
     * Written out by hand rather than with {@code URLEncoder}, which turns a space into a plus
     * and is built for form fields rather than for a parameter holding an address. Everything
     * that is safe in a query is left as it is, which keeps the address readable in a log.
     */
    private static String encode(String what) {
        StringBuilder written = new StringBuilder(what.length() + 16);
        byte[] bytes = what.getBytes(java.nio.charset.StandardCharsets.UTF_8);
        for (byte each : bytes) {
            int value = each & 0xFF;
            boolean plain = (value >= 'a' && value <= 'z')
                    || (value >= 'A' && value <= 'Z')
                    || (value >= '0' && value <= '9')
                    || value == '-' || value == '_' || value == '.' || value == '~'
                    || value == ':' || value == '/';
            if (plain) {
                written.append((char) value);
            } else {
                written.append('%');
                written.append(Character.toUpperCase(Character.forDigit(value >> 4, 16)));
                written.append(Character.toUpperCase(Character.forDigit(value & 0xF, 16)));
            }
        }
        return written.toString();
    }

    // endregion
}
