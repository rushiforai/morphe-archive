package app.hushmessenger.extension;

import android.content.Context;
import android.net.Uri;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.regex.Pattern;

/**
 * Reads a tapped link and says whether it is a video page one of the four platforms will play on its own, and if it is,
 * which page to load (#188). Nothing here fetches a stream or reads a page: each platform publishes an embed of its
 * own, meant to be put in a frame by anyone, and that embed is all Hush loads. A link that doesn't match one of the
 * shapes below is never touched, so Messenger opens it the way it always did.
 *
 * <p>Short links (youtu.be aside, where the code is the whole path) are left alone on purpose. vm.tiktok.com and
 * fb.watch only say which video they mean after the server answers, and a round trip before the tap does anything
 * would leave the user staring at a chat wondering whether their tap registered.
 */
final class LinkPlayer {
    static final String KEY = "link_player";

    private LinkPlayer() {}

    /** YouTube's ids are eleven characters of its own alphabet, which is what keeps a channel or playlist link out. */
    private static final Pattern YOUTUBE_ID = Pattern.compile("[A-Za-z0-9_-]{11}");
    /** TikTok numbers its videos. */
    private static final Pattern TIKTOK_ID = Pattern.compile("[0-9]{6,25}");
    /** Instagram's shortcode, the part of the address after /p/, /reel/ or /tv/. */
    private static final Pattern INSTAGRAM_CODE = Pattern.compile("[A-Za-z0-9_-]{5,30}");
    /** Facebook numbers its videos too, and its newer share links use a short code instead. */
    private static final Pattern FACEBOOK_ID = Pattern.compile("[0-9]{6,25}");
    private static final Pattern FACEBOOK_SHARE = Pattern.compile("[A-Za-z0-9_-]{5,40}");

    static final String YOUTUBE = "YouTube";
    static final String TIKTOK = "TikTok";
    static final String INSTAGRAM = "Instagram";
    static final String FACEBOOK = "Facebook";

    /**
     * YouTube's privacy host, which it publishes for exactly this and which doesn't set its cookies until you play.
     * Some phones and routers block it by name, so a load that fails there is tried once on the ordinary host rather
     * than leaving a blank frame.
     */
    static final String YOUTUBE_HOST = "https://www.youtube-nocookie.com";
    static final String YOUTUBE_FALLBACK_HOST = "https://www.youtube.com";

    /** What a link turns into. [page] is loaded in the frame, and [link] is still what the platform button opens. */
    static final class Embed {
        final String platform;
        final String page;
        final String host;
        final String fallbackPage;
        /** Hush draws the play, replay and full-screen controls itself. Only YouTube's embed answers to them. */
        final boolean ownControls;

        Embed(String platform, String page, String host, String fallbackPage, boolean ownControls) {
            this.platform = platform;
            this.page = page;
            this.host = host;
            this.fallbackPage = fallbackPage;
            this.ownControls = ownControls;
        }
    }

    /** The link's host without the prefix that only says which size of the site it is. */
    static String host(Uri link) {
        String host = link == null ? null : link.getHost();
        if (host == null) return "";
        host = host.toLowerCase(Locale.ROOT);
        for (String prefix : new String[] {"www.", "m.", "web.", "mobile."}) {
            if (host.startsWith(prefix)) {
                host = host.substring(prefix.length());
                break;
            }
        }
        return host;
    }

    /** The path split on slashes, with the empty pieces the leading and trailing slashes leave dropped. */
    private static List<String> segments(Uri link) {
        String path = link == null ? null : link.getPath();
        if (path == null || path.isEmpty()) return java.util.Collections.emptyList();
        String[] parts = path.split("/");
        java.util.ArrayList<String> kept = new java.util.ArrayList<>(parts.length);
        for (String part : parts) if (!part.isEmpty()) kept.add(part);
        return kept;
    }

    private static String query(Uri link, String name) {
        try {
            return link.getQueryParameter(name);
        } catch (RuntimeException notAHierarchicalUri) {
            // An opaque link like a mailto: has no query to read, which is an answer of no rather than a failure.
            return null;
        }
    }

    private static boolean matches(Pattern pattern, String value) {
        return value != null && pattern.matcher(value).matches();
    }

    /** The page that plays [link], or null when it isn't one of the four platforms' video pages. */
    static Embed embedFor(Uri link) {
        if (link == null) return null;
        String scheme = link.getScheme();
        if (scheme == null || !(scheme.equalsIgnoreCase("http") || scheme.equalsIgnoreCase("https"))) return null;
        String host = host(link);
        List<String> path = segments(link);
        if (host.equals("youtube.com") || host.equals("music.youtube.com")) return youtube(path, query(link, "v"));
        if (host.equals("youtu.be")) return youtube(java.util.Collections.<String>emptyList(), path.isEmpty() ? null : path.get(0));
        if (host.equals("tiktok.com")) return tiktok(path);
        if (host.equals("instagram.com") || host.equals("instagr.am")) return instagram(path);
        if (host.equals("facebook.com") || host.equals("fb.com")) return facebook(link, path);
        return null;
    }

    /** /watch?v=, /shorts/, /live/, /embed/ and a youtu.be code all name one video. A channel or playlist doesn't. */
    private static Embed youtube(List<String> path, String watching) {
        String id = watching;
        if (id == null && path.size() >= 2 && Arrays.asList("shorts", "live", "embed", "v").contains(path.get(0))) id = path.get(1);
        if (!matches(YOUTUBE_ID, id)) return null;
        // No related videos at the end, no keyboard controls, and the frame's own buttons off since Hush draws them.
        String tail = "/embed/" + id + "?enablejsapi=1&playsinline=1&controls=0&rel=0&modestbranding=1&fs=0&disablekb=1";
        return new Embed(YOUTUBE, YOUTUBE_HOST + tail, YOUTUBE_HOST, YOUTUBE_FALLBACK_HOST + tail, true);
    }

    /** /@someone/video/<number>, and /v/<number>.html as the older shape. */
    private static Embed tiktok(List<String> path) {
        String id = null;
        if (path.size() >= 3 && path.get(0).startsWith("@") && path.get(1).equals("video")) id = path.get(2);
        else if (path.size() >= 2 && path.get(0).equals("v")) id = path.get(1).replace(".html", "");
        if (!matches(TIKTOK_ID, id)) return null;
        String host = "https://www.tiktok.com";
        return new Embed(TIKTOK, host + "/embed/v2/" + id, host, null, false);
    }

    /** /p/, /reel/, /reels/ and /tv/ each take the embed suffix. A profile or a story doesn't have one. */
    private static Embed instagram(List<String> path) {
        if (path.size() < 2 || !Arrays.asList("p", "reel", "reels", "tv").contains(path.get(0))) return null;
        if (!matches(INSTAGRAM_CODE, path.get(1))) return null;
        String kind = path.get(0).equals("reels") ? "reel" : path.get(0);
        String host = "https://www.instagram.com";
        return new Embed(INSTAGRAM, host + "/" + kind + "/" + path.get(1) + "/embed/", host, null, false);
    }

    /**
     * Facebook's video frame takes the whole address rather than an id, so the shape check is what keeps an ordinary
     * Facebook link out of it: /watch with a v, /reel/<number>, /<page>/videos/<number> and the newer /share/v/ and
     * /share/r/ codes. Stories have no frame of their own and are left to Messenger.
     */
    private static Embed facebook(Uri link, List<String> path) {
        boolean video = false;
        if (!path.isEmpty() && path.get(0).equals("watch")) video = matches(FACEBOOK_ID, query(link, "v"));
        else if (path.size() >= 2 && path.get(0).equals("reel")) video = matches(FACEBOOK_ID, path.get(1));
        else if (path.size() >= 2 && path.get(0).equals("videos")) video = matches(FACEBOOK_ID, path.get(1));
        else if (path.size() >= 3 && path.get(1).equals("videos")) video = matches(FACEBOOK_ID, path.get(2));
        else if (path.size() >= 3 && path.get(0).equals("share") && Arrays.asList("v", "r").contains(path.get(1)))
            video = matches(FACEBOOK_SHARE, path.get(2));
        if (!video) return null;
        String host = "https://www.facebook.com";
        String page = host + "/plugins/video.php?href=" + Uri.encode(link.toString()) + "&show_text=false&autoplay=true";
        return new Embed(FACEBOOK, page, host, null, false);
    }

    /**
     * Puts [link] up in the player over [context]. Answers no, and leaves the tap to Messenger, when the link isn't a
     * video page or the player couldn't reach the screen, so a link is never swallowed by a window that didn't open.
     */
    static boolean play(Context context, Uri link) {
        Embed embed = embedFor(link);
        if (embed == null) return false;
        return LinkPlayerSheet.show(context, link, embed);
    }
}
