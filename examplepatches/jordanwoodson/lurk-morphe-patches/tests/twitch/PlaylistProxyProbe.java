import android.net.Uri;
import java.util.Locale;
import java.util.Objects;
import io.github.jordanwoodson.extension.shared.settings.Settings;
import io.github.jordanwoodson.extension.shared.twitch.TwitchAds;

public class PlaylistProxyProbe {
    private static final String LIVE = "https://usher.ttvnw.net/api/channel/hls/MIXED_CASE123.m3u8?sig=secret&token=%7B%22user_id%22%3A123%7D";

    private static void template(String value) {
        System.setProperty("lurk.test.proxy", value);
    }

    private static void equal(String expected, String actual, String description) {
        if (!Objects.equals(expected, actual)) {
            throw new AssertionError(description + ": expected " + expected + ", got " + actual);
        }
    }

    private static void unchanged(String url) {
        equal(url, TwitchAds.proxyPlaylistUrl(url), "unsupported URL must stay unchanged");
    }

    public static void main(String[] args) {
        Settings.values.put("playlist_proxy", "true");
        template("https://example.org/live/{channel}");
        switch (args[0]) {
            case "channel":
                Locale.setDefault(Locale.forLanguageTag("tr-TR"));
                equal("https://example.org/live/mixed_case123", TwitchAds.proxyPlaylistUrl(LIVE),
                    "channel mode must lowercase the login and omit the signed query");
                equal("https://example.org/live/mixed_case123",
                    TwitchAds.proxyPlaylist(Uri.parse(LIVE.replace("/api/", "/api/v2/"))).toString(),
                    "native v2 URL must use the same channel-only rewrite");
                template("https://example.org/live/{channel}?channel={channel}&quality=source");
                equal("https://example.org/live/mixed_case123?channel=mixed_case123&quality=source",
                    TwitchAds.proxyPlaylistUrl(LIVE + "#private"), "only the template's query must survive");
                break;
            case "invalid":
                for (String path : new String[]{"/vod/123.m3u8", "/api/channel/hls/", "/api/channel/hls/.m3u8",
                        "/api/channel/hls/name", "/api/channel/hls/name.m3u8/extra", "/api/channel/hls/a/b.m3u8",
                        "/api/channel/hls/../name.m3u8", "/api/channel/hls/a-b.m3u8", "/api/channel/hls/%61.m3u8",
                        "/api/channel/hls/a%2Fb.m3u8", "/api/channel/hls/name.m3u8.exe", "/api/v3/channel/hls/name.m3u8"}) {
                    unchanged("https://usher.ttvnw.net" + path + "?token=private");
                }
                unchanged("https://usher.ttvnw.net.example.org/api/channel/hls/name.m3u8");
                unchanged("https://usher.ttvnw.net@example.org/api/channel/hls/name.m3u8");
                unchanged("file://usher.ttvnw.net/api/channel/hls/name.m3u8");
                unchanged("https://usher.ttvnw.net/api/channel/hls/invalid name.m3u8");
                unchanged(null);
                template("https://example.org/live/{channel}?url={url}");
                unchanged(LIVE);
                break;
            case "bare":
                for (String base : new String[]{"https://example.org", "https://example.org/"}) {
                    template(base);
                    equal("https://example.org/api/channel/hls/MIXED_CASE123.m3u8?sig=secret&token=%7B%22user_id%22%3A123%7D",
                        TwitchAds.proxyPlaylistUrl(LIVE), "bare proxy must retain the original path and signed query");
                    equal("https://example.org/api/v2/channel/hls/name.m3u8",
                        TwitchAds.proxyPlaylistUrl("https://usher.ttvnw.net/api/v2/channel/hls/name.m3u8"),
                        "bare proxy must support query-free v2 URLs");
                }
                unchanged("https://usher.ttvnw.net/vod/123.m3u8");
                break;
            case "url":
                template("https://example.org/playlist?url={url}");
                equal("https://example.org/playlist?url=https%3A%2F%2Fusher.ttvnw.net%2Fapi%2Fchannel%2Fhls%2FMIXED_CASE123.m3u8%3Fsig%3Dsecret%26token%3D%257B%2522user_id%2522%253A123%257D",
                    TwitchAds.proxyPlaylistUrl(LIVE), "URL template must retain and encode the complete signed URL");
                unchanged("https://usher.ttvnw.net/vod/123.m3u8");
                break;
            case "disabled":
                Settings.values.put("playlist_proxy", "false");
                unchanged(LIVE);
                Uri uri = Uri.parse(LIVE);
                if (TwitchAds.proxyPlaylist(uri) != uri) throw new AssertionError("disabled native hook replaced its Uri");
                Settings.values.put("playlist_proxy", "true");
                template("");
                unchanged(LIVE);
                System.clearProperty("lurk.test.proxy");
                unchanged(LIVE);
                if (TwitchAds.proxyPlaylist(null) != null) throw new AssertionError("null native URI was changed");
                break;
            default:
                throw new AssertionError("unknown scenario " + args[0]);
        }
        System.out.println("PASS: playlist proxy " + args[0]);
    }
}
