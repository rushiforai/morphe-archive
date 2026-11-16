package app.morphed.extension.twitch.ui;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Debug mode's lines as a person reads them, for the live window (the log file keeps every line in full, for bug
 * reports). Routine requests that went fine (several a second) are left out; addresses become short names and
 * long codes are cut.
 */
public final class Readable {
    private static final Pattern REQUEST = Pattern.compile("^(Player|VPN) (\\S+) -> (\\d+|failed: .*) in (\\d+)ms.*$");
    private static final Pattern PLAYLIST = Pattern.compile("^Playlist (\\S+) -> 200, download (\\d+)ms.*?(\\(rewritten\\))?$");
    private static final Pattern URL = Pattern.compile("https?://([^/\\s?]+)(/[^\\s?]*)?(\\?\\S*)?");
    private static final Pattern LONG = Pattern.compile("[A-Za-z0-9_\\-=+/.%]{40,}");
    /** The ad blocker's check of each new piece of the playlist, every two seconds: routine while no ad is in it. */
    private static final Pattern POLL = Pattern.compile("^Playlist .*: sequence \\d+, \\d+ segments, 0 ads.*$");
    private static final Pattern STATUS = Pattern.compile("^Status: threads=(\\d+), memory=(\\d+)/(\\d+)MB, (.*)$");

    private Readable() {
    }

    /** The line to show, or null when it's routine and went fine. */
    public static String of(String line) {
        int space = line.indexOf(' ');
        String time = space > 0 && line.charAt(2) == ':' ? line.substring(0, space) : "";
        String text = time.isEmpty() ? line : line.substring(space + 1);
        String shown = message(text);
        if (shown == null) return null;
        return time.isEmpty() ? shown : time.substring(0, Math.min(8, time.length())) + "  " + shown;
    }

    static String message(String text) {
        Matcher request = REQUEST.matcher(text);
        if (request.matches()) {
            String result = request.group(3);
            boolean failed = !Character.isDigit(result.charAt(0)) || Integer.parseInt(result) >= 400;
            if (!failed || result.contains("Blocked by Twitch Morphed")) return null; // (the ad blocker's own blocks)
            String what = what(request.group(2));
            String via = request.group(1).equals("VPN") ? " through the VPN" : "";
            return what + via + " failed: " + (result.startsWith("failed: ") ? shorten(result.substring(8)) : "error " + result);
        }
        // Each playlist poll and its (routine) rewrite: in the file only.
        if (PLAYLIST.matcher(text).matches() || POLL.matcher(text).matches()) return null;
        Matcher status = STATUS.matcher(text);
        if (status.matches()) {
            return "Running, " + status.group(2) + " of " + status.group(3) + " MB memory used, " + shorten(status.group(4));
        }
        String plain = reword(text);
        return plain == null ? null : shorten(plain);
    }

    private static final Pattern[] ROUTINE = {
            Pattern.compile("^Player HTTP client created.*"),
            Pattern.compile("^Player \\d+ created, \\d+ alive$")};
    private static final Pattern STREAM = Pattern.compile("(channel|vod):(\\S+)");
    private static final Pattern COPY = Pattern.compile(
            "^Song removal: Copy \\S+ ready: got it in (\\d+) ms, prepared in (\\d+) ms$");
    private static final Pattern DIRECT = Pattern.compile("^Quality unlock: \\S+ goes direct \\((.*)\\)$");
    private static final Pattern WATCHING = Pattern.compile("^Watching (\\S+) as [^:]+:.*$");

    /** The patches' own technical lines in plain words; null for the ones only the file needs. */
    static String reword(String text) {
        for (Pattern routine : ROUTINE) if (routine.matcher(text).matches()) return null;
        Matcher copy = COPY.matcher(text);
        if (copy.matches()) {
            return String.format(java.util.Locale.US, "Song removal: the song's copy is ready (%.1f s to get it, %.1f s to prepare it)",
                    Integer.parseInt(copy.group(1)) / 1000.0, Integer.parseInt(copy.group(2)) / 1000.0);
        }
        Matcher direct = DIRECT.matcher(text);
        if (direct.matches()) return "Quality unlock: a request went without the VPN (" + direct.group(1) + ")";
        Matcher watching = WATCHING.matcher(text);
        if (watching.matches()) return "Watching " + watching.group(1);
        String out = text.replace("Quality unlock: tunnel up through ", "Quality unlock: connected to ")
                .replace("Song removal: stream is ", "Song removal: watching ")
                .replace("following a new player for ", "following the player of ");
        Matcher stream = STREAM.matcher(out);
        StringBuffer named = new StringBuffer();
        while (stream.find()) {
            stream.appendReplacement(named, Matcher.quoteReplacement(
                    stream.group(1).equals("vod") ? "a past broadcast" : stream.group(2)));
        }
        stream.appendTail(named);
        return named.toString();
    }

    /** A request's address as a few words: what it is and where. */
    static String what(String url) {
        Matcher m = URL.matcher(url);
        if (!m.find()) return url; // not an address: as it is
        String host = m.group(1);
        String path = m.group(2) == null ? "" : m.group(2);
        String server = host.split("\\.")[0];
        if (host.contains("usher.")) return "the stream's playlist list";
        if (path.endsWith(".m3u8")) return "a playlist (" + server + ")";
        if (path.endsWith(".ts") || path.endsWith(".mp4") || path.contains("/segment")) return "a video piece (" + server + ")";
        return host;
    }

    /** Addresses to their host name, long codes cut. */
    static String shorten(String text) {
        StringBuffer out = new StringBuffer();
        Matcher url = URL.matcher(text);
        while (url.find()) url.appendReplacement(out, Matcher.quoteReplacement(url.group(1)));
        url.appendTail(out);
        Matcher code = LONG.matcher(out.toString());
        StringBuffer cut = new StringBuffer();
        while (code.find()) code.appendReplacement(cut, Matcher.quoteReplacement(code.group().substring(0, 12) + "…"));
        code.appendTail(cut);
        return cut.toString();
    }
}
