package io.github.bryceaspringfield.morphe.extension.youtube;


import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

/**
 * Filters scoped to channels, one rule a line in {@link XSettings#CHANNEL_RULES}:
 * <pre>
 *   @handle: all              every video of the channel
 *   @handle: live             its live streams (and premieres while live)
 *   @handle: shorts           its Shorts
 *   @handle: playlists        its playlists and mixes
 *   @handle: &lt;5:00          its videos shorter than 5 minutes (m:ss, h:mm:ss, or minutes)
 *   @handle: &gt;1:00:00       its videos longer than an hour
 *   @handle: comments: word   comments containing the word, under the channel's videos
 *   @handle: word             its videos whose title or text contains the word ("phrase" for whole words)
 * </pre>
 * The channel is an @handle, a channel ID (UC...), or the channel's name as shown. Several rules for a channel may
 * share a line, separated by commas: "@handle: live, shorts, &lt;3:00". Lines starting with # are notes.
 */
final class ChannelRules {

    enum Kind {ALL, LIVE, SHORTS, PLAYLISTS, SHORTER, LONGER, COMMENT_KEYWORD, KEYWORD}

    static final class Channel {
        final String id;
        final String handle;
        final String name;

        Channel(String raw) {
            String s = raw.trim();
            String lower = s.toLowerCase(Locale.ROOT);
            int at = lower.indexOf("youtube.com/");
            if (at >= 0) {
                s = s.substring(at + "youtube.com/".length());
                if (s.startsWith("channel/")) s = s.substring("channel/".length());
                int q = s.indexOf('/');
                if (q > 0) s = s.substring(0, q);
                int qq = s.indexOf('?');
                if (qq > 0) s = s.substring(0, qq);
            }
            if (s.startsWith("@")) {
                id = null;
                handle = s.substring(1).toLowerCase(Locale.ROOT);
                name = null;
            } else if (s.matches("UC[\\w-]{22}")) {
                id = s;
                handle = null;
                name = null;
            } else {
                id = null;
                handle = null;
                name = s;
            }
        }

        String label() {
            return handle != null ? "@" + handle : id != null ? id : name;
        }
    }

    static final class Rule {
        final Channel channel;
        final Kind kind;
        final int seconds;
        final String keyword;
        final boolean wholeWord;

        Rule(Channel channel, Kind kind, int seconds, String keyword, boolean wholeWord) {
            this.channel = channel;
            this.kind = kind;
            this.seconds = seconds;
            this.keyword = keyword;
            this.wholeWord = wholeWord;
        }
    }

    private static volatile String parsedText;
    private static volatile List<Rule> rules = Collections.emptyList();

    private ChannelRules() {
    }

    static List<Rule> get() {
        String text = XSettings.CHANNEL_RULES.get();
        //noinspection StringEquality
        if (text != parsedText) {
            rules = parse(text);
            parsedText = text;
        }
        return rules;
    }

    static List<Rule> parse(String text) {
        List<Rule> out = new ArrayList<>();
        for (String line : text.split("\n")) {
            line = line.trim();
            if (line.isEmpty() || line.startsWith("#")) continue;
            // The channel ends at the first colon, unless the colon belongs to a URL (https:).
            int colon = line.indexOf(':');
            while (colon > 0 && line.startsWith("//", colon + 1)) colon = line.indexOf(':', colon + 1);
            if (colon <= 0) continue;
            Channel channel = new Channel(line.substring(0, colon));
            String rest = line.substring(colon + 1).trim();
            if (rest.toLowerCase(Locale.ROOT).startsWith("comments:") || rest.toLowerCase(Locale.ROOT).startsWith("comentarios:")) {
                String kw = rest.substring(rest.indexOf(':') + 1).trim();
                for (String k : kw.split(",")) addKeyword(out, channel, Kind.COMMENT_KEYWORD, k.trim());
                continue;
            }
            for (String part : rest.split(",")) {
                String p = part.trim();
                String lower = p.toLowerCase(Locale.ROOT);
                if (p.isEmpty()) continue;
                switch (lower) {
                    case "all", "todo", "todos" -> out.add(new Rule(channel, Kind.ALL, 0, null, false));
                    case "live", "lives", "livestreams", "en vivo", "directos" -> out.add(new Rule(channel, Kind.LIVE, 0, null, false));
                    case "shorts" -> out.add(new Rule(channel, Kind.SHORTS, 0, null, false));
                    case "playlists", "listas" -> out.add(new Rule(channel, Kind.PLAYLISTS, 0, null, false));
                    default -> {
                        if ((p.startsWith("<") || p.startsWith(">")) && Lengths.parse(p.substring(1)) > 0) {
                            out.add(new Rule(channel, p.startsWith("<") ? Kind.SHORTER : Kind.LONGER,
                                    Lengths.parse(p.substring(1)), null, false));
                        } else {
                            addKeyword(out, channel, Kind.KEYWORD, p);
                        }
                    }
                }
            }
        }
        return out;
    }

    private static void addKeyword(List<Rule> out, Channel channel, Kind kind, String raw) {
        if (raw.isEmpty()) return;
        boolean whole = raw.length() > 2 && raw.startsWith("\"") && raw.endsWith("\"");
        String kw = (whole ? raw.substring(1, raw.length() - 1) : raw).toLowerCase(Locale.ROOT);
        if (!kw.isEmpty()) out.add(new Rule(channel, kind, 0, kw, whole));
    }

    /** Whether a lowercase text contains a keyword, as whole words when asked. */
    static boolean containsKeyword(String text, String keyword, boolean wholeWord) {
        if (!wholeWord) return text.contains(keyword);
        int from = 0;
        while (true) {
            int i = text.indexOf(keyword, from);
            if (i < 0) return false;
            int end = i + keyword.length();
            boolean before = i == 0 || !Character.isLetterOrDigit(text.charAt(i - 1));
            boolean after = end >= text.length() || !Character.isLetterOrDigit(text.charAt(end));
            if (before && after) return true;
            from = i + 1;
        }
    }

    /** The first rule hiding a feed item, or null. */
    
    static Rule match(VideoItem item) {
        for (Rule r : get()) {
            if (r.kind == Kind.COMMENT_KEYWORD || !item.isChannel(r.channel)) continue;
            boolean hit = switch (r.kind) {
                case ALL -> true;
                case LIVE -> item.live;
                case SHORTS -> item.shorts;
                case PLAYLISTS -> item.playlist || item.mix;
                case SHORTER -> item.seconds >= 0 && item.seconds < r.seconds;
                case LONGER -> item.seconds >= 0 && item.seconds > r.seconds;
                case KEYWORD -> r.keyword != null && containsKeyword(item.text, r.keyword, r.wholeWord);
                default -> false;
            };
            if (hit) return r;
        }
        return null;
    }

    /** The comment keywords of the channel whose video plays, given its channel ID and name. */
    static List<Rule> commentRules(String channelId, String channelName) {
        List<Rule> out = new ArrayList<>();
        for (Rule r : get()) {
            if (r.kind != Kind.COMMENT_KEYWORD) continue;
            Channel c = r.channel;
            boolean same = (c.id != null && c.id.equals(channelId))
                    || (c.name != null && c.name.equalsIgnoreCase(channelName))
                    || (c.handle != null && Channels.handleOf(channelId) != null && c.handle.equals(Channels.handleOf(channelId)));
            if (same) out.add(r);
        }
        return out;
    }
}
