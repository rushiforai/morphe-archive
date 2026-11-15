package e.e.a;

import java.io.IOException;
import java.util.List;
import org.json.JSONObject;

/** Host-JVM regression cases for CodeQL findings #1-#5. No Android runtime required. */
public final class CodeqlSecurityTest {
    private static void check(boolean ok, String message) {
        if (!ok) throw new AssertionError(message);
    }

    public static void main(String[] args) throws Exception {
        String feed = "<?xml version='1.0'?><rss><channel><item>"
                + "<title>Video &amp; channel</title>"
                + "<link>https://www.nicovideo.jp/watch/sm12345</link>"
                + "</item></channel></rss>";
        List<ChannelFeed.Video> videos = ChannelFeed.parse(feed);
        check(videos.size() == 1 && "sm12345".equals(videos.get(0).id)
                && "Video & channel".equals(videos.get(0).title),
                "Normal channel RSS and built-in XML entities still parse");

        for (String xml : new String[] {
                "<!DOCTYPE rss [<!ENTITY local SYSTEM 'file:///etc/passwd'>]>"
                        + "<rss><channel><item><title>&local;</title></item></channel></rss>",
                "<!DOCTYPE rss SYSTEM 'http://127.0.0.1:45678/malicious.dtd'><rss/>",
                "<!DOCTYPE rss [<!ENTITY % external SYSTEM 'file:///etc/passwd'> %external;]>"
                        + "<rss/>"
        }) {
            try {
                ChannelFeed.parse(xml);
                throw new AssertionError("DTD or external XML entity accepted");
            } catch (IOException expected) {
                // DTDs are rejected before any external data is resolved.
            }
        }

        check("so12345".equals(HistoryRules.id("https://www.nicovideo.jp/watch/so12345?ref=feed")),
                "Canonical numeric and prefixed IDs are extracted");
        check("ss99".equals(HistoryRules.id("https://www.nicovideo.jp/shorts/ss99#top")),
                "Short-video IDs are extracted");
        check("not a URL".equals(HistoryRules.id("not a URL")),
                "Unknown inputs are returned unchanged");

        check(HistoryRules.watchUrl("https://nicovideo.jp/watch/sm12345?ref=feed", false),
                "HTTPS watch route can be opened internally");
        check(HistoryRules.watchUrl("http://www.nicovideo.jp/watch/nm67", true),
                "HTTP video links remain supported in feed metadata");
        check(!HistoryRules.watchUrl("http://www.nicovideo.jp/watch/nm67", false),
                "Internal player only handles HTTPS");
        check(!HistoryRules.watchUrl("https://nicovideo.jp.attacker.test/watch/sm1", true),
                "Host spoofing is rejected");

        check("https://www.nicovideo.jp/watch/so67".equals(
                DetailData.target(new JSONObject().put("watchURL",
                        "http://www.nicovideo.jp/watch/so67"))),
                "Video metadata URLs are safely normalized");
        check("https://nicovideo.jp.attacker.test/watch/sm1".equals(
                DetailData.target(new JSONObject().put("watchURL",
                        "https://nicovideo.jp.attacker.test/watch/sm1"))),
                "Non-nicoid metadata URLs are not classified as internal videos");

        StringBuilder longInvalid = new StringBuilder("https://www.nicovideo.jp/watch/sm");
        for (int i = 0; i < 100000; ++i) longInvalid.append('0');
        longInvalid.append('x');
        check(longInvalid.toString().equals(HistoryRules.id(longInvalid.toString())),
                "Very long invalid IDs are rejected without regex backtracking");
        check(HistoryRules.watchUrl(longInvalid.toString(), false),
                "Watch URL routing retains permissive trailing suffixes");

        System.out.println("PASS: XXE and 4 URL/ID ReDoS code scanning regressions");
    }
}
