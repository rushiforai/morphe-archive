package dev.rikunode.futatabi.bridge;

public final class MebukiLoginDiagnosticsTest {
    private static void equal(String actual, String expected) {
        if (!expected.equals(actual)) throw new AssertionError("Diagnostic classification mismatch");
    }
    public static void main(String[] args) {
        equal(MebukiLoginDiagnostics.route("https://x.com/i/oauth2/authorize?state=FAKE_SECRET#FAKE_FRAGMENT"),
                "provider=X host=x.com route=authorize");
        equal(MebukiLoginDiagnostics.route("https://twitter.com/i/flow/login?redirect=FAKE_SECRET"),
                "provider=X host=twitter.com route=login");
        equal(MebukiLoginDiagnostics.route("https://mebuki.moe/api/auth/callback/twitter?code=FAKE_CODE"),
                "provider=SITE host=mebuki.moe route=provider_callback");
        equal(MebukiLoginDiagnostics.route("https://mebuki.moe/private/FAKE_SECRET"), "provider=SITE host=mebuki.moe route=other");
        equal(MebukiLoginDiagnostics.route("https://x.com.example.invalid/FAKE_SECRET"), "route=other");
        equal(MebukiLoginDiagnostics.route("https://fake-secret.x.com/unknown"), "provider=X host=other route=other");
        equal(MebukiLoginDiagnostics.route("not a URL"), "route=invalid");
        equal(MebukiLoginDiagnostics.consoleCategory("window.open blocked FAKE_SECRET"), "window");
        equal(MebukiLoginDiagnostics.consoleCategory("captcha FAKE_SECRET"), "challenge");
        equal(MebukiLoginDiagnostics.consoleCategory("Content Security Policy FAKE_SECRET"), "csp");
        equal(MebukiLoginDiagnostics.consoleCategory("TypeError: FAKE_SECRET"), "js_error");
        equal(MebukiLoginDiagnostics.consoleCategory("FAKE_SECRET"), "other");
        if (MebukiLoginDiagnostics.ENABLED) throw new AssertionError("Production diagnostics must be off");
        System.out.println("Diagnostic redaction and default-off PASS (13 checks)");
    }
}
