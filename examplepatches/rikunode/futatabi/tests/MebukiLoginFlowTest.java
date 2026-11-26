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
        String[][] auth = {
            {"https", "discord.com", "/api/v9/auth/login", "POST", "true"},
            {"https", "discord.com", "/api/v10/auth/mfa/totp", "POST", "true"},
            {"https", "discord.com", "/api/v9/auth/login", "GET", "false"},
            {"https", "discord.com.evil.invalid", "/api/v9/auth/login", "POST", "false"},
            {"http", "discord.com", "/api/v9/auth/login", "POST", "false"},
            {"https", "discord.com", "/api/v9/science", "POST", "false"}
        };
        for (String[] row : auth) {
            if (MebukiLoginFlow.discordLoginPost(row[0],row[1],row[2],row[3]) != Boolean.parseBoolean(row[4]))
                throw new AssertionError("Unexpected auth route classification");
        }
        System.out.println("Navigation classification PASS: " + count + " cases; auth error route PASS: " + auth.length);
    }
}
