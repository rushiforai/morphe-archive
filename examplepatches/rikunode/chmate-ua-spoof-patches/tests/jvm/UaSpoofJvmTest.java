import app.morphe.extension.chmateuaspoof.UaSpoof;
import app.morphe.extension.chmateuaspoof.UaSpoofRules;
import com.sun.net.httpserver.HttpServer;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.net.HttpURLConnection;
import java.net.InetSocketAddress;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.List;

/**
 * JVM test of the extension hook logic (not the patched app). Uses a local UA echo server on
 * 127.0.0.1 only; no external network and no real board.
 *
 * The bytecode order in the patched APK is: Haiagaru hook, then UA Spoof hook, then the native
 * call/return. Each case below reproduces that order by applying the "Haiagaru" value first.
 */
public class UaSpoofJvmTest {
    static final String STOCK = "Monazilla/1.00 2chMate/0.8.10.226 Dalvik/2.1.0 (Linux; U; Android 14; Pixel Build/AP1A)";
    static final String HAIAGARU_VIEW = "Monazilla/1.00 2chMate/0.8.10.226 Dalvik/2.1.0 (Linux; U; Android 15; HT-01 Build/XYZ0.123456.789)";
    static final String PAIR = "Mozilla/5.0 (Linux; Android 14; wv) PairedBrowserUA";
    static final String SPOOF = UaSpoofRules.LEGACY;
    static int failures = 0, passes = 0;
    static String base;

    public static void main(String[] args) throws Exception {
        HttpServer server = HttpServer.create(new InetSocketAddress("127.0.0.1", 0), 0);
        server.createContext("/", exchange -> {
            byte[] body = exchange.getRequestBody().readAllBytes();
            String reply = exchange.getRequestMethod() + "|" + exchange.getRequestHeaders().getFirst("User-Agent")
                    + "|" + exchange.getRequestHeaders().getFirst("X-Test") + "|" + new String(body, StandardCharsets.UTF_8);
            byte[] out = reply.getBytes(StandardCharsets.UTF_8);
            exchange.sendResponseHeaders(200, out.length);
            try (OutputStream o = exchange.getResponseBody()) { o.write(out); }
        });
        server.start();
        base = "http://127.0.0.1:" + server.getAddress().getPort();
        try {
            run();
        } finally {
            server.stop(0);
        }
        System.out.println(passes + " passed, " + failures + " failed");
        System.exit(failures == 0 ? 0 : 1);
    }

    static void run() throws Exception {
        System.setProperty("http.agent", "Dalvik/2.1.0 (Linux; U; Android 14; Pixel Build/AP1A)");
        String originalHttpAgent = System.getProperty("http.agent");

        // --- OFF from startup: strictly no side effect ---
        UaSpoof.apply(null);
        eq(System.getProperty("http.agent"), originalHttpAgent, "OFF: http.agent untouched");
        o.zzdA req = new o.zzdA(base + "/test/read.cgi/board/1/", "GET", okhttp3.Headers.of("User-Agent", HAIAGARU_VIEW, "Cookie", "a=b"));
        okhttp3.Headers before = req.a;
        UaSpoof.prepareRequest(req);
        check(req.a == before, "OFF: okhttp request keeps the identical Headers instance (Haiagaru result untouched)");
        eq(echo("GET", HAIAGARU_VIEW, null), "GET|" + HAIAGARU_VIEW + "|x|", "OFF: java.net GET echo shows Haiagaru/stock UA");
        eq(echo("POST", STOCK, "message=hello"), "POST|" + STOCK + "|x|message=hello", "OFF: java.net POST echo shows stock UA");

        // --- ON ---
        UaSpoof.apply(SPOOF);
        eq(System.getProperty("http.agent"), SPOOF, "ON: startup/apply sets http.agent");
        req = new o.zzdA(base + "/test/read.cgi/board/1/", "GET", okhttp3.Headers.of("User-Agent", HAIAGARU_VIEW, "Cookie", "a=b"));
        UaSpoof.prepareRequest(req);
        eq(req.a.get("User-Agent"), SPOOF, "ON: okhttp GET UA is exactly the selected string (after Haiagaru)");
        eq(req.a.get("Cookie"), "a=b", "ON: other headers (cookies) unchanged");
        req = new o.zzdA(base + "/test/bbs.cgi", "POST", okhttp3.Headers.of("Content-Type", "x"));
        UaSpoof.prepareRequest(req);
        eq(req.a.get("User-Agent"), SPOOF, "ON: okhttp POST without UA header gets the selected UA");
        eq(List.of(req.a.pairs()), List.of("Content-Type", "x", "User-Agent", SPOOF), "ON: header order kept, UA appended once");
        req = new o.zzdA(base + "/img/a.png", "GET", okhttp3.Headers.of("User-Agent", "a", "user-agent", "b"));
        UaSpoof.prepareRequest(req);
        eq(List.of(req.a.pairs()), List.of("User-Agent", SPOOF), "ON: duplicate UA headers collapsed to one (images)");
        eq(echo("GET", HAIAGARU_VIEW, null), "GET|" + SPOOF + "|x|", "ON: java.net GET echo shows selected UA");
        eq(echo("POST", STOCK, "message=hello"), "POST|" + SPOOF + "|x|message=hello", "ON: java.net POST echo shows selected UA, body intact");
        eq(echo("HEAD", STOCK, null), "HEAD", "ON: java.net HEAD accepted");

        // --- Haiagaru ReadingAuth paired UA wins for eddibb authenticated reads only ---
        setPair(PAIR);
        String readUrl = "https://bbs.eddibb.cc/test/read.cgi/board/1/";
        req = new o.zzdA(readUrl, "GET", okhttp3.Headers.of("User-Agent", PAIR));
        before = req.a;
        UaSpoof.prepareRequest(req);
        check(req.a == before && PAIR.equals(req.a.get("User-Agent")), "Pair: eddibb authenticated GET keeps Haiagaru paired UA");
        req = new o.zzdA(readUrl, "HEAD", okhttp3.Headers.of("User-Agent", PAIR));
        UaSpoof.prepareRequest(req);
        eq(req.a.get("User-Agent"), PAIR, "Pair: eddibb authenticated HEAD keeps paired UA");
        req = new o.zzdA("https://bbs.eddibb.cc/test/bbs.cgi", "POST", okhttp3.Headers.of("User-Agent", STOCK));
        UaSpoof.prepareRequest(req);
        eq(req.a.get("User-Agent"), SPOOF, "Pair: eddibb POST (posting/auth) uses the spoof");
        setPair(null);

        // --- Scope ---
        req = new o.zzdA("ftp://example.invalid/x", "GET", okhttp3.Headers.of("User-Agent", STOCK));
        UaSpoof.prepareRequest(req);
        eq(req.a.get("User-Agent"), STOCK, "Scope: non-http(s) URL untouched");
        req = new o.zzdA("https://user@example.invalid/x", "GET", okhttp3.Headers.of("User-Agent", STOCK));
        UaSpoof.prepareRequest(req);
        eq(req.a.get("User-Agent"), STOCK, "Scope: URL with user info untouched");

        // --- Unlimited edits ---
        String custom = "MyCustomAgent/1.0 (test)";
        UaSpoof.apply(custom);
        eq(echo("GET", STOCK, null), "GET|" + custom + "|x|", "Edit: changed UA applies to the next request");
        UaSpoof.apply(SPOOF);

        // --- Runtime ON -> OFF restoration ---
        String staleNative = "Monazilla/1.00 2chMate/0.8.10.226 " + SPOOF; // built while http.agent was spoofed
        UaSpoof.apply(null);
        eq(System.getProperty("http.agent"), originalHttpAgent, "OFF at runtime: http.agent restored to original");
        req = new o.zzdA(base + "/x", "GET", okhttp3.Headers.of("User-Agent", "Monazilla/1.00 2chMate/0.8.10.226 " + custom));
        UaSpoof.prepareRequest(req);
        eq(req.a.get("User-Agent"), "Monazilla/1.00 2chMate/0.8.10.226 " + originalHttpAgent, "OFF at runtime: stale spoofed suffix from an earlier edit restored");
        req = new o.zzdA(base + "/x", "GET", okhttp3.Headers.of("User-Agent", staleNative));
        UaSpoof.prepareRequest(req);
        eq(req.a.get("User-Agent"), "Monazilla/1.00 2chMate/0.8.10.226 " + originalHttpAgent, "OFF at runtime: stale native UA suffix restored");
        req = new o.zzdA(base + "/x", "GET", okhttp3.Headers.of("User-Agent", HAIAGARU_VIEW));
        before = req.a;
        UaSpoof.prepareRequest(req);
        check(req.a == before, "OFF at runtime: Haiagaru viewing UA left as is");
        eq(echo("GET", staleNative, null), "GET|Monazilla/1.00 2chMate/0.8.10.226 " + originalHttpAgent + "|x|", "OFF at runtime: java.net echo shows restored UA");

        // --- Validation and presets ---
        check(!UaSpoofRules.valid("bad\r\nX-Injected: 1"), "Validation: CR/LF rejected");
        check(!UaSpoofRules.valid("日本語UA"), "Validation: non-ASCII rejected");
        check(!UaSpoofRules.valid("a".repeat(1025)) && UaSpoofRules.valid("a".repeat(1024)), "Validation: 1024 char limit");
        check(!UaSpoofRules.valid("") && !UaSpoofRules.valid(null), "Validation: empty rejected");
        UaSpoof.apply("bad\nvalue");
        check(UaSpoof.current() == null, "Validation: invalid UA behaves as OFF");
        eq(UaSpoofRules.DALVIK_14, "Dalvik/2.1.0 (Linux; U; Android 14; HT-01 Build/XYZ0.123456.789)", "Preset Android 14");
        eq(UaSpoofRules.DALVIK_15, "Dalvik/2.1.0 (Linux; U; Android 15; HT-01 Build/XYZ0.123456.789)", "Preset Android 15");
        eq(UaSpoofRules.DALVIK_16, "Dalvik/2.1.0 (Linux; U; Android 16; HT-01 Build/XYZ0.123456.789)", "Preset Android 16");
        eq(UaSpoofRules.LEGACY, "Dalvik/2.1.0 (Linux; U; Android 4.0.3; HT-01 Build/XYZ0.123456.789)", "Preset legacy 4.0.3");
    }

    /** Sends a request the way the patched app does: native setter, UA Spoof prepare, then the call. */
    static String echo(String method, String nativeUa, String body) throws Exception {
        HttpURLConnection c = (HttpURLConnection) new URL(base + "/test/read.cgi/board/1/").openConnection();
        c.setRequestMethod(method);
        c.setRequestProperty("User-Agent", nativeUa);
        c.setRequestProperty("X-Test", "x");
        if (body != null) {
            c.setDoOutput(true);
            UaSpoof.prepare(c); // boundary: getOutputStream
            try (OutputStream o = c.getOutputStream()) { o.write(body.getBytes(StandardCharsets.UTF_8)); }
        }
        UaSpoof.prepare(c); // boundary: getResponseCode / getInputStream (no-op once connected)
        int code = c.getResponseCode();
        if ("HEAD".equals(method)) return code == 200 ? "HEAD" : "HEAD " + code;
        try (InputStream in = c.getInputStream()) {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            in.transferTo(out);
            return out.toString(StandardCharsets.UTF_8);
        }
    }

    static void setPair(String value) throws Exception {
        Field f = Class.forName("app.morphe.extension.chmate.ReadingAuth").getDeclaredField("pairedAgent");
        f.setAccessible(true);
        f.set(null, value);
    }

    static void eq(Object actual, Object expected, String name) {
        check(expected.equals(actual), name + (expected.equals(actual) ? "" : " (expected <" + expected + "> got <" + actual + ">)"));
    }

    static void check(boolean ok, String name) {
        System.out.println((ok ? "PASS " : "FAIL ") + name);
        if (ok) passes++; else failures++;
    }
}
