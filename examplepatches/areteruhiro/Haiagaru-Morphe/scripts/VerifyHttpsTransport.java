import app.morphe.extension.chmate.HttpsTransport;
import java.net.Proxy;
import java.net.URL;
import javax.net.ssl.HttpsURLConnection;

/** No external traffic: openConnection creates a connection without connecting it. */
public class VerifyHttpsTransport {
    private static int checks;
    private static void check(boolean value, String message) {
        checks++;
        if (!value) throw new AssertionError(message);
    }
    private static void rewrite(String input, String expected) {
        check(expected.equals(HttpsTransport.upgradeUrl(input)), "Unexpected rewrite: " + input);
    }
    public static void main(String[] args) throws Exception {
        URL original = new URL("http://example.com:80/a%2Fb?x=http://other/#fragment");
        HttpsTransport.setEnabled(false);
        check(HttpsTransport.upgrade(original) == original, "OFF must preserve URL object");
        rewrite(original.toString(), original.toString());
        check(!HttpsTransport.shouldUpgrade("http"), "OFF scheme");
        HttpsTransport.setEnabled(true);
        check(HttpsTransport.shouldUpgrade("HTTP"), "Case-insensitive HTTP");
        check(!HttpsTransport.shouldUpgrade("https"), "Already HTTPS");
        check(!HttpsTransport.shouldUpgrade(null), "Null scheme");
        check(HttpsTransport.upgradeUrl(null) == null, "Null URL");
        check(HttpsTransport.upgrade(new URL("http:relative")).toString().equals("https:relative"),
                "A URL without authority must not cause NullPointerException");
        rewrite(original.toString(), "https://example.com/a%2Fb?x=http://other/#fragment");
        rewrite("http://example.com", "https://example.com");
        rewrite("HTTP://example.com:8080/a", "https://example.com:8080/a");
        rewrite("http://example.com:080/a", "https://example.com/a");
        rewrite("http://u:p%40ss@example.com:80/a", "https://u:p%40ss@example.com/a");
        rewrite("http://[::1]:80/a", "https://[::1]/a");
        rewrite("http://[::1]:8080/a", "https://[::1]:8080/a");
        rewrite("http://example.com/あ?x=%2F&y=1#f", "https://example.com/あ?x=%2F&y=1#f");
        rewrite(" \tHTTP://example.com/a", " \thttps://example.com/a");
        rewrite("https://example.com:80/a", "https://example.com:80/a");
        rewrite("file:///tmp/test", "file:///tmp/test");
        rewrite("content://media/1", "content://media/1");
        rewrite("/relative/path", "/relative/path");
        rewrite("//example.com/path", "//example.com/path");
        rewrite("http://example.com:invalid/a", "http://example.com:invalid/a");
        check(HttpsTransport.upgradePort(80) == -1, "Default HTTP port must reset");
        check(HttpsTransport.upgradePort(-1) == -1, "Unspecified port");
        check(HttpsTransport.upgradePort(8080) == 8080, "Custom port retained");
        check(HttpsTransport.openConnection(original) instanceof HttpsURLConnection,
                "Java connection must use TLS");
        check(HttpsTransport.openConnection(original, Proxy.NO_PROXY) instanceof HttpsURLConnection,
                "Proxy overload must use TLS");
        HttpsTransport.setEnabled(false);
        check(!(HttpsTransport.openConnection(original) instanceof HttpsURLConnection),
                "OFF must restore HTTP");
        System.out.println("PASS: " + checks + " HTTPS transport checks (no network requests)");
    }
}
