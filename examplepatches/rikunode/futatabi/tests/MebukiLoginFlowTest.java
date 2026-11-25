package dev.rikunode.futatabi.bridge;

/** Host-JVM tests: no Android device, OAuth traffic or credentials. */
public final class MebukiLoginFlowTest {
    private static int count;
    private static void expect(MebukiLoginFlow.Page expected, String scheme, String host, String path, boolean error) {
        MebukiLoginFlow.Page actual = MebukiLoginFlow.page(scheme, host, path, error);
        if (actual != expected) throw new AssertionError(expected + " != " + actual);
        count++;
    }
    public static void main(String[] args) {
        expect(MebukiLoginFlow.Page.SITE, "https", "mebuki.moe", "/", false);
        expect(MebukiLoginFlow.Page.CALLBACK, "https", "mebuki.moe", "/auth/callback", false);
        expect(MebukiLoginFlow.Page.ERROR_RETURN, "https", "mebuki.moe", "/", true);
        expect(MebukiLoginFlow.Page.ERROR_RETURN, "https", "mebuki.moe", "/auth/callback", true);
        expect(MebukiLoginFlow.Page.X, "https", "x.com", "/i/flow/login", false);
        expect(MebukiLoginFlow.Page.X, "https", "api.twitter.com", "/oauth/authenticate", false);
        expect(MebukiLoginFlow.Page.DISCORD, "https", "discord.com", "/login", false);
        expect(MebukiLoginFlow.Page.DISCORD, "https", "discord.com", "/oauth2/authorize", false);
        expect(MebukiLoginFlow.Page.GOOGLE_UNSUPPORTED, "https", "accounts.google.com", "/", false);
        expect(MebukiLoginFlow.Page.OTHER, "https", "x.com.example.invalid", "/", false);
        expect(MebukiLoginFlow.Page.OTHER, "https", "notdiscord.com", "/", false);
        expect(MebukiLoginFlow.Page.OTHER, "http", "mebuki.moe", "/", false);
        expect(MebukiLoginFlow.Page.OTHER, "file", null, "/", false);
        System.out.println("Navigation classification PASS: " + count + " cases");
    }
}
