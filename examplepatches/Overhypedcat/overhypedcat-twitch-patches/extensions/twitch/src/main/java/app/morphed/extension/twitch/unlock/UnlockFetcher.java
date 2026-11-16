package app.morphed.extension.twitch.unlock;

import java.io.IOException;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.morphed.extension.twitch.net.JsonParser;
import app.morphed.extension.twitch.net.Web;

/**
 * Asks Twitch for a channel's playlist the way Mor Assistant does (as streamlink asks): a logged-in access token, then the
 * usher playlist with HEVC allowed, both through the VPN tunnel so Twitch sees the server's country.
 */
public final class UnlockFetcher {
    static final String ANDROID_CLIENT_ID = "kd1unb4b3q4t58fwlpcbzcbnm76a8fp";
    static final String WEB_CLIENT_ID = "kimne78kx3ncx6brgo4mv6wki5h1ko";
    private static final String GQL = "https://gql.twitch.tv/gql";
    private static final String QUERY_HASH = "ed230aa1e33e07eebb8928504583da78a5173989fadfb1ac94be06a04f3cdbe9";
    static final String CODECS = "h264,h265"; // the 1440p copies are HEVC
    private static final Pattern IVS_NAME = Pattern.compile("IVS-NAME=\"([^\"]+)\"");
    private static final Pattern STABLE_ID = Pattern.compile("STABLE-VARIANT-ID=\"([^\"]+)\"");
    private static final Pattern MEDIA_NAME = Pattern.compile("^#EXT-X-MEDIA:.*TYPE=VIDEO.*NAME=\"([^\"]+)\"", Pattern.MULTILINE);

    /** Something the user is told about: what went wrong and why. */
    public static final class Failed extends Exception {
        public final boolean login;

        Failed(String message, boolean login) {
            super(message);
            this.login = login;
        }
    }

    /** The playlist and its qualities. */
    public static final class Result {
        public final String master;
        public final List<String> qualities;

        Result(String master, List<String> qualities) {
            this.master = master;
            this.qualities = qualities;
        }
    }

    private final SecureRandom random = new SecureRandom();

    /** A channel's playlist through web; Failed saying why when Twitch didn't hand one out. */
    public Result fetch(Web web, String channel, String token, int timeoutMs) throws Failed {
        long deadline = System.currentTimeMillis() + timeoutMs; // one limit for every request together
        String[] access = accessToken(web, channel, token, deadline);
        String url = "https://usher.ttvnw.net/api/v2/channel/hls/" + channel.toLowerCase(Locale.ROOT) + ".m3u8"
                + "?platform=web&p=" + random.nextInt(999999) + "&allow_source=true&allow_audio_only=true"
                + "&playlist_include_framerate=true&multigroup_video=true&supported_codecs=" + CODECS
                + "&fast_bread=true&sig=" + encode(access[1]) + "&token=" + encode(access[0]);
        Web.Response response;
        try {
            response = web.send(Web.Request.get(url).header("Accept", "application/x-mpegURL").timeout(left(deadline)));
        } catch (IOException e) {
            throw new Failed("Twitch couldn't be reached through the VPN: " + e.getMessage(), false);
        }
        if (response.status == 404) throw new Failed(channel + " isn't live (Twitch said so through the VPN)", false);
        if (response.status == 403) throw new Failed("Twitch refused " + channel + "'s stream through the VPN", false);
        if (!response.ok()) throw new Failed("Twitch answered " + response.status + " through the VPN", false);
        String master = response.text();
        List<String> qualities = qualities(master);
        if (qualities.isEmpty()) throw new Failed(channel + " isn't live (Twitch said so through the VPN)", false);
        return new Result(master, qualities);
    }

    private static String encode(String value) {
        try {
            return URLEncoder.encode(value, "UTF-8");
        } catch (java.io.UnsupportedEncodingException e) {
            throw new IllegalStateException(e);
        }
    }

    /** Milliseconds left before the deadline; Failed when there's no time for another request. */
    private static int left(long deadline) throws Failed {
        long left = deadline - System.currentTimeMillis();
        if (left < 500) throw new Failed("Twitch didn't answer through the VPN in time", false);
        return (int) left;
    }

    /** [token value, signature]. The app's login works with the app's client id; the web one is the fallback. */
    String[] accessToken(Web web, String channel, String token, long deadline) throws Failed {
        Failed first = null;
        StringBuilder both = new StringBuilder();
        for (String clientId : new String[]{ANDROID_CLIENT_ID, WEB_CLIENT_ID}) {
            try {
                return accessToken(web, channel, token, clientId, left(deadline));
            } catch (Failed failed) {
                if (first == null) first = failed;
                if (both.length() > 0) both.append("; ");
                both.append(failed.getMessage());
            }
        }
        // Both tries told, so the reason can be reported as it was.
        throw first.login ? new Failed(both.toString(), true) : first;
    }

    private static String clientName(String clientId) {
        return ANDROID_CLIENT_ID.equals(clientId) ? "app client" : "web client";
    }

    /** The start of an answer, on one line. */
    static String said(String text) {
        String line = text.replaceAll("\\s+", " ").trim();
        return line.length() > 140 ? line.substring(0, 140) + "…" : line;
    }

    private String[] accessToken(Web web, String channel, String token, String clientId, int timeoutMs) throws Failed {
        String body = "{\"operationName\":\"PlaybackAccessToken\",\"extensions\":{\"persistedQuery\":{\"version\":1,"
                + "\"sha256Hash\":\"" + QUERY_HASH + "\"}},\"variables\":{\"isLive\":true,\"login\":"
                + JsonParser.quote(channel.toLowerCase(Locale.ROOT)) + ",\"isVod\":false,\"vodID\":\"\","
                + "\"playerType\":\"embed\",\"platform\":\"site\"}}";
        Web.Request request = Web.Request.post(GQL, body, "text/plain;charset=UTF-8")
                .header("Client-ID", clientId)
                .timeout(timeoutMs);
        if (token != null && !token.isEmpty()) request.header("Authorization", "OAuth " + token);
        Web.Response response;
        try {
            response = web.send(request);
        } catch (IOException e) {
            throw new Failed("Twitch couldn't be reached through the VPN: " + e.getMessage(), false);
        }
        String text = response.text();
        if (response.status == 401 || response.status == 403) {
            // What Twitch said, so the reason can be reported (its answer never holds the login itself).
            throw new Failed("Twitch rejected the login (" + clientName(clientId) + ", " + response.status + ": "
                    + said(text) + ")", true);
        }
        Object answer;
        try {
            answer = JsonParser.parse(text);
        } catch (IllegalArgumentException e) {
            throw new Failed("Twitch's answer couldn't be read (" + response.status + ")", false);
        }
        String error = JsonParser.string(answer, "errors", 0, "message");
        if (error != null) throw new Failed("Twitch refused the playlist: " + error, false);
        String value = JsonParser.string(answer, "data", "streamPlaybackAccessToken", "value");
        String signature = JsonParser.string(answer, "data", "streamPlaybackAccessToken", "signature");
        if (value == null || signature == null) throw new Failed(channel + " isn't live (Twitch said so through the VPN)", false);
        return new String[]{value, signature};
    }

    /** The qualities a master playlist offers: Twitch names them on #EXT-X-STREAM-INF (IVS-NAME). */
    public static List<String> qualities(String master) {
        Set<String> names = new LinkedHashSet<>();
        for (String line : master.split("\n")) {
            if (!line.startsWith("#EXT-X-STREAM-INF")) continue;
            Matcher name = IVS_NAME.matcher(line);
            Matcher stable = STABLE_ID.matcher(line);
            String found = name.find() ? name.group(1) : stable.find() ? stable.group(1) : null;
            if (found != null) names.add(found);
        }
        if (names.isEmpty()) {
            Matcher media = MEDIA_NAME.matcher(master);
            while (media.find()) names.add(media.group(1));
        }
        List<String> out = new ArrayList<>();
        for (String name : names) {
            String lower = name.toLowerCase(Locale.ROOT);
            if (lower.equals("audio_only") || lower.equals("audio only") || lower.endsWith("_portrait")) continue;
            out.add(name);
        }
        return out;
    }

    /** Qualities the tunnel offers that the normal connection doesn't. */
    public static List<String> unlockedOnly(List<String> direct, List<String> unlocked) {
        List<String> extra = new ArrayList<>();
        for (String quality : unlocked) {
            boolean seen = false;
            for (String d : direct) if (d.equalsIgnoreCase(quality)) seen = true;
            if (!seen) extra.add(quality);
        }
        return extra;
    }
}
