package dev.rikunode.futatabi.bridge;

public final class AimogeLoginFlowTest {
    public static void main(String[] args) {
        String callback = "http://127.0.0.1:18765/ext/login/aimoge/callback";
        expect("https://nijiurachan.net/b/aimg/app-auth?requestId=fixture", AimogeLoginFlow.Page.OFFICIAL);
        expect(callback + "?state=s&code=c", AimogeLoginFlow.Page.CALLBACK);
        for (String bad : new String[] {null, "http://nijiurachan.net/", "https://nijiurachan.net.evil.invalid/",
                "https://nijiurachan.net@evil.invalid/", "https://nijiurachan.net:444/",
                "http://127.0.0.1:18766/ext/login/aimoge/callback?state=s",
                "http://127.0.0.1:18765/ext/callback?state=s",
                callback, callback + "?state=s#fragment", callback + "/?state=s",
                "file:///tmp/test", "https://api.nijiurachan.net/"} )
            expect(bad, AimogeLoginFlow.Page.BLOCKED);
        if (!AimogeLoginFlow.retryable(503, "Aimoge credential exchange: DNS failed for api.nijiurachan.net."))
            throw new AssertionError("DNS retry");
        if (AimogeLoginFlow.retryable(503, "Request failed") || AimogeLoginFlow.retryable(400, "Aimoge credential exchange: DNS failed for api.nijiurachan.net."))
            throw new AssertionError("unexpected retry");
        System.out.println("URL guard: 14 cases PASS; retry eligibility PASS");
    }
    private static void expect(String url, AimogeLoginFlow.Page page) {
        if (AimogeLoginFlow.page(url) != page) throw new AssertionError("unexpected page: " + page);
    }
}
