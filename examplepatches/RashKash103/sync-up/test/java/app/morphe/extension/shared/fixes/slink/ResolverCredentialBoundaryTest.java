package app.morphe.extension.shared.fixes.slink;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLStreamHandler;

/** Exercises the actual production credential method with a fake HTTPS transport. */
public final class ResolverCredentialBoundaryTest {
    private static int opened;
    private static int checks;

    private static final class Resolver extends BaseFixSLinksPatch {}
    private static final class FakeConnection extends HttpURLConnection {
        FakeConnection(URL url) { super(url); }
        @Override public void connect() { throw new AssertionError("Must not connect during this test"); }
        @Override public void disconnect() {}
        @Override public boolean usingProxy() { return false; }
    }

    public static void main(String[] args) throws Exception {
        URL.setURLStreamHandlerFactory(protocol -> {
            if (!protocol.equals("https")) { return null; }
            return new URLStreamHandler() {
                @Override protected URLConnection openConnection(URL url) {
                    opened++;
                    return new FakeConnection(url);
                }
            };
        });
        Method method = BaseFixSLinksPatch.class.getDeclaredMethod(
                "getHttpURLConnection", String.class, String.class);
        method.setAccessible(true);
        Resolver resolver = new Resolver();
        String[] untrusted = {
                "https://example.invalid/reddit.com/r/test/s/abc123",
                "https://notreddit.com/r/test/s/abc123",
                "https://reddit.com.example.invalid/r/test/s/abc123",
                "https://reddit.com@example.invalid/r/test/s/abc123",
                "http://reddit.com/r/test/s/abc123",
                "https://reddit.com:444/r/test/s/abc123",
                "https://reddit.com/comments/abc123", null
        };
        for (String link : untrusted) {
            try {
                method.invoke(resolver, link, "DUMMY_TEST_TOKEN");
                throw new AssertionError("Untrusted destination accepted: " + link);
            } catch (InvocationTargetException ex) {
                check(ex.getCause() instanceof IOException, "Expected a controlled refusal");
            }
            check(opened == 0, "Transport opened before rejecting a malicious destination");
            check(!resolver.resolveSLink(link), "Untrusted link intercepted by resolver");
        }
        FakeConnection connection = (FakeConnection) method.invoke(resolver,
                "https://www.reddit.com/r/test/s/abc123", "DUMMY_TEST_TOKEN");
        check(opened == 1, "Expected one validated Reddit connection");
        check("Bearer DUMMY_TEST_TOKEN".equals(connection.getRequestProperty("Authorization")),
                "Missing token on validated Reddit request");
        check(!connection.getInstanceFollowRedirects(), "Automatic redirect following must remain off");
        check(connection.getRequestMethod().equals("HEAD"), "Changed request method");
        check(connection.getConnectTimeout() == 2000, "Missing connect timeout");
        check(connection.getReadTimeout() == 2000, "Missing read timeout");
        FakeConnection anonymous = (FakeConnection) method.invoke(resolver,
                "https://www.reddit.com/r/test/s/abc123", null);
        check(anonymous.getRequestProperty("Authorization") == null, "Invented anonymous credentials");
        System.out.println("Passed " + checks + " credential-boundary checks; no network requests made.");
    }

    private static void check(boolean condition, String message) {
        checks++;
        if (!condition) { throw new AssertionError(message); }
    }
}
