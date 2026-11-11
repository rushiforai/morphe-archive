package e.e.a;
import java.io.IOException;
public final class PostingPolicy122Test {
    private static void check(boolean expected, String label) {
        if (!expected) throw new AssertionError(label);
    }
    public static void main(String[] args) throws Exception {
        for (String server : new String[]{
            "https://nvcomment.nicovideo.jp",
            "https://nv-comment.nicovideo.jp",
            "https://public.nvcomment.nicovideo.jp",
            "https://public.nvcomment.nicovideo.jp/"}) {
            check(PostingPolicy122.POST_SERVER.equals(PostingPolicy122.postServer(server)), "normalizes "+server);
        }
        check(PostingPolicy122.POST_SERVER.equals(PostingPolicy122.postServer(null)), "missing server");
        for (String server : new String[]{
            "http://public.nvcomment.nicovideo.jp",
            "https://public.nvcomment.nicovideo.jp.evil.test",
            "https://nvcomment.nicovideo.jp/redirect",
            "https://evil.test"}) {
            try { PostingPolicy122.postServer(server); throw new AssertionError("accepted "+server); }
            catch (IOException expected) { }
        }
        check(PostingPolicy122.describe(new IOException("HTTP 429")).contains("rate-limited"), "429");
        check("HTTP 403".equals(PostingPolicy122.describe(new IOException("HTTP 403"))), "403");
        check("IOException".equals(PostingPolicy122.describe(new IOException("Bearer private-token-value"))), "no leak");
        check("DNS error".equals(PostingPolicy122.describe(new java.net.UnknownHostException())), "DNS");
        System.out.println("PASS: posting endpoint allowlist, privacy-safe diagnostics and rate limit classification");
    }
}
