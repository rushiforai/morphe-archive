package app.morphe.extension.shared.fixes.slink;

/** Offline regression checks; no Android runtime or network access is needed. */
public final class RedditSLinkTest {
    private static int checks;

    public static void main(String[] args) {
        String[] allowed = {
                "https://reddit.com/r/test/s/abc123",
                "https://www.reddit.com/r/test_sub/s/aB12",
                "https://old.reddit.com/r/test/s/abc123/",
                "https://www.reddit.com:443/r/test/s/abc123",
                "HTTPS://WWW.REDDIT.COM/r/test/s/abc123",
                "https://www.reddit.com/r/test/s/abc123?utm_source=share&utm_medium=web",
                "https://www.reddit.com/r/test/s/abc123#bypass",
                "https://www.reddit.com/r/test/s/abc123#other"
        };
        for (String link : allowed) {
            check(RedditSLink.parse(link) != null, "Rejected legitimate share link: " + link);
        }

        String[] rejected = {
                null, "", "not a URL", "/r/test/s/abc123",
                "http://www.reddit.com/r/test/s/abc123",
                "ftp://www.reddit.com/r/test/s/abc123",
                "https://notreddit.com/r/test/s/abc123",
                "https://reddit.com.example.invalid/r/test/s/abc123",
                "https://example.invalid/reddit.com/r/test/s/abc123",
                "https://example.invalid/?next=https://reddit.com/r/test/s/abc123",
                "https://example.invalid/#https://reddit.com/r/test/s/abc123",
                "https://reddit.com@example.invalid/r/test/s/abc123",
                "https://example.invalid@reddit.com/r/test/s/abc123",
                "https://www.reddit.com:444/r/test/s/abc123",
                "https://www.reddit.com:80/r/test/s/abc123",
                "https://www.reddit.com./r/test/s/abc123",
                "https://www.reddit.com\\@example.invalid/r/test/s/abc123",
                "https://www.reddit.com/r/test/s/abc123\n",
                "https://www.reddit.com/r/test/s/abc%2f123",
                "https://www.reddit.com/r/test/s/abc123/extra",
                "https://www.reddit.com/r/test/s/",
                "https://www.reddit.com/r//s/abc123",
                "https://www.reddit.com/comments/abc123",
                "https://www.reddit.com/r/test/s/../abc123",
                "https://www.reddit.com/r/test/s/%ZZ"
        };
        for (String link : rejected) {
            check(RedditSLink.parse(link) == null, "Accepted untrusted share link: " + link);
        }

        check(RedditSLink.parseRedditUrl("https://www.reddit.com/r/test/comments/abc123/title/")
                != null, "Rejected Reddit redirect");
        check(RedditSLink.parseRedditUrl("https://example.invalid/redirect") == null,
                "Accepted external redirect");
        check(RedditSLink.parseRedditUrl("http://reddit.com/comments/abc123") == null,
                "Accepted insecure redirect");
        String original = "https://www.reddit.com/r/test/s/abc123?utm_source=share#other";
        String bypass = RedditSLink.bypass(original);
        check(bypass.equals("https://www.reddit.com/r/test/s/abc123?utm_source=share#bypass"),
                "Fallback must replace an existing fragment and preserve the query");
        check("bypass".equals(RedditSLink.parse(bypass).getRef()), "Fallback would loop");
        check(RedditSLink.bypass(bypass).equals(bypass), "Fallback must be idempotent");
        System.out.println("Passed " + checks + " offline security regression checks.");
    }

    private static void check(boolean condition, String message) {
        checks++;
        if (!condition) {
            throw new AssertionError(message);
        }
    }
}
