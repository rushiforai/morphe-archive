import app.morphe.extension.chmate.ImageVpnRequestPolicy;
import java.io.IOException;
import java.net.URL;
import java.net.HttpURLConnection;

/** Offline tests only. Never connects to reported IP-collection URLs. */
public final class VerifyImageVpnRequestPolicy {
    private static void expectFailure(String code, Checked action) throws Exception {
        try { action.run(); throw new AssertionError("Expected " + code); }
        catch (IOException error) {
            if (!code.equals(error.getMessage())) throw error;
        }
    }
    private interface Checked { void run() throws Exception; }
    private static class Connection extends HttpURLConnection {
        Connection(URL url) { super(url); }
        public void disconnect() {}
        public boolean usingProxy() { return false; }
        public void connect() { throw new AssertionError("No real traffic allowed"); }
    }
    public static void main(String[] args) throws Exception {
        for(String host:new String[]{"www.activetk.jp","loggerip.web.app"})
            if(!ImageVpnRequestPolicy.isProtectedUrl("https://"+host+"/test"))throw new AssertionError("Missing default "+host);
        for(String host:new String[]{"www.activetk.jp.evil.test","evilactivetk.jp","other.web.app"})
            if(ImageVpnRequestPolicy.isProtectedUrl("https://"+host+"/test"))throw new AssertionError("Suffix match "+host);
        ImageVpnRequestPolicy.setDomains(ImageVpnRequestPolicy.normalizeDomains("EXAMPLE.com\nexample.com\n画像.example"));
        if(!ImageVpnRequestPolicy.isProtectedUrl("https://example.com/a.png"))throw new AssertionError("Custom domain missing");
        if(ImageVpnRequestPolicy.isProtectedUrl("https://sub.example.com/a.png"))throw new AssertionError("Wildcard escaped");
        for(String invalid:new String[]{"https://example.com/path","*.example.com","127.0.0.1","user@example.com","example.com:443","bad..example"}){
            try{ImageVpnRequestPolicy.parseDomains(invalid);throw new AssertionError("Invalid domain "+invalid);}
            catch(IllegalArgumentException expected){}
        }
        ImageVpnRequestPolicy.setDomains(ImageVpnRequestPolicy.DEFAULT_DOMAINS);
        URL target = new URL("https://tools.yajuvideo.st/om/test.jpg");
        URL normal = new URL("https://i.imgur.com/image.png");
        if (!ImageVpnRequestPolicy.isProtectedUrl(target.toString())) throw new AssertionError("Target validation");
        for (String path : new String[]{"/om/todoroki-hajime.jpg", "/om/abeshinzo.jpg", "/other/image.png?x=1"}) {
            if (!ImageVpnRequestPolicy.isProtectedUrl("https://tools.yajuvideo.st" + path))
                throw new AssertionError("Filename-specific protection");
        }
        for (String invalid : new String[]{null, "", "file:///etc/passwd", "https://tools.yajuvideo.st:8080/a.jpg",
                "https://user@tools.yajuvideo.st/a.jpg", "https://tools.yajuvideo.st.evil.test/a.jpg"}) {
            if (ImageVpnRequestPolicy.isProtectedUrl(invalid)) throw new AssertionError("Invalid protected URL");
        }
        if (!ImageVpnRequestPolicy.begin(target, true).requiresTunnel()) throw new AssertionError("Missing target");
        if (ImageVpnRequestPolicy.begin(target, false).requiresTunnel()) throw new AssertionError("Default-off changed");
        for (String host : new String[]{"i.imgur.com", "tools.yajuvideo.st.example.com", "eviltools.yajuvideo.st"}) {
            if (ImageVpnRequestPolicy.begin(new URL("https://" + host + "/a.jpg"), true).requiresTunnel()) throw new AssertionError("Wrong host " + host);
        }
        var ticket = ImageVpnRequestPolicy.begin(target, true);
        expectFailure("IMAGE_VPN_TUNNEL_UNAVAILABLE", () -> ticket.openProtected(target, null));
        final int[] calls = {0};
        var connection = ticket.openProtected(target, url -> { calls[0]++; return new Connection(url); });
        if (calls[0] != 1 || ((HttpURLConnection) connection).getInstanceFollowRedirects()) throw new AssertionError("Native redirect left enabled");
        URL redirected = ticket.redirect(target, normal.toString(), false);
        if (!ticket.requiresTunnel()) throw new AssertionError("Redirect/disable lost protected route");
        expectFailure("TUNNEL_DISCONNECTED", () -> ticket.openProtected(redirected, url -> { throw new IOException("TUNNEL_DISCONNECTED"); }));
        expectFailure("IMAGE_VPN_TUNNEL_UNAVAILABLE", () -> ticket.openProtected(redirected, url -> null));
        var direct = ImageVpnRequestPolicy.begin(normal, true);
        expectFailure("IMAGE_VPN_NOT_A_PROTECTED_REQUEST", () -> direct.openProtected(normal, url -> { throw new AssertionError("Unexpected tunnel"); }));
        URL destination = direct.redirect(normal, target.toString(), true);
        if (!direct.requiresTunnel() || !target.equals(destination)) throw new AssertionError("Redirect into target bypassed tunnel");
        var relative = ImageVpnRequestPolicy.begin(target, true);
        if (!"https://tools.yajuvideo.st/new.jpg".equals(relative.redirect(target, "/new.jpg", true).toString())) throw new AssertionError("Relative redirect");
        for (int i = 0; i < 4; i++) relative.redirect(target, "/new.jpg", true);
        expectFailure("IMAGE_VPN_REDIRECT_LIMIT", () -> relative.redirect(target, "/new.jpg", true));
        expectFailure("IMAGE_VPN_INVALID_URL", () -> ticket.redirect(target, "file:///etc/passwd", true));
        expectFailure("IMAGE_VPN_INVALID_URL", () -> ImageVpnRequestPolicy.begin(new URL("https://user@tools.yajuvideo.st/a.jpg"), true));
        expectFailure("IMAGE_VPN_INVALID_URL", () -> ImageVpnRequestPolicy.begin(new URL("https://tools.yajuvideo.st:8080/a.jpg"), true));
        System.out.println("PASS image VPN routing tickets: exact host, default-off, redirect inheritance, tunnel failure and no direct fallback");
    }
}
