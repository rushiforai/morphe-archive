package app.xfeedcleanup.extension.x;

import com.x.navigation.ni;
import java.util.List;

public final class ExternalPostLinkTest {
    private static int checks = 0;
    public static void main(String[] args) {
        valid("https://x.com/RayNoWar2026/status/2108945576377364621", 2108945576377364621L);
        valid("https://twitter.com/openai/status/20", 20L);
        valid("https://www.x.com/OpenAI/status/123?ref=home", 123L);
        valid("http://mobile.twitter.com/a_b/status/101#post", 101L);
        valid("https://x.com/i/status/20", 20L);
        valid("https://x.com/i/web/status/20", 20L);

        invalid("https://x.com/OpenAI");
        invalid("https://x.com/OpenAI/likes");
        invalid("https://x.com/OpenAI/status/20/photo/1");
        invalid("https://x.com/OpenAI/status/20/");
        invalid("https://example.com/OpenAI/status/20");
        invalid("https://evil-x.com/OpenAI/status/20");
        invalid("https://x.com.evil.example/OpenAI/status/20");
        invalid("https://x.com:8443/OpenAI/status/20");
        invalid("https://username@x.com/OpenAI/status/20");
        invalid("https://x.com/@OpenAI/status/20");
        invalid("https://x.com/waytoolonghandle16/status/20");
        invalid("https://x.com/OpenAI/status/notanumber");
        invalid("https://x.com/OpenAI/status/0");
        invalid("https://x.com/OpenAI/status/9223372036854775808");
        invalid("https://x.com/OpenAI/status/20%2fextra");
        invalid("ftp://x.com/OpenAI/status/20");
        invalid("twitter://status?status_id=20");
        invalid(null);
        if (ExternalPostLink.parsePostId("android.intent.action.MAIN",
                "https://x.com/OpenAI/status/20") != null) {
            throw new AssertionError("MAIN intent must not be intercepted");
        }
        checks++;

        List<?> nav = ExternalPostLink.buildDestination(20L, "com.x.navigation.ni");
        if (nav == null || nav.size() != 1 || !(nav.get(0) instanceof ni)
                || ((ni) nav.get(0)).postId != 20L
                || ((ni) nav.get(0)).action != ni.IntentAction.None) {
            throw new AssertionError("FromId direct-post args were not constructed correctly");
        }
        checks++;
        nav.clear(); // X may build a mutable navigation stack from this list.
        if (!nav.isEmpty()) throw new AssertionError("Returned routes list must be mutable");
        checks++;
        if (ExternalPostLink.buildDestination(20L, "missing.ObfuscatedClass") != null
                || ExternalPostLink.buildDestination(20L, "") != null) {
            throw new AssertionError("Unknown route must fall back to the original router");
        }
        checks++;
        System.out.println("ExternalPostLink: " + checks + " cases PASS");
    }

    private static void valid(String url, long id) {
        Long actual = ExternalPostLink.parsePostId("android.intent.action.VIEW", url);
        if (actual == null || actual.longValue() != id)
            throw new AssertionError("Failed recognized post link: " + url + " => " + actual);
        checks++;
    }

    private static void invalid(String url) {
        Long actual = ExternalPostLink.parsePostId("android.intent.action.VIEW", url);
        if (actual != null) throw new AssertionError("Intercepted unrelated link: " + url);
        checks++;
    }
}
