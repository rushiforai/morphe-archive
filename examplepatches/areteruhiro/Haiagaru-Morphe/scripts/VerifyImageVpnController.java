import app.morphe.extension.chmate.ImageVpnController;
import android.content.Context;
import java.net.URL;

/** Offline native URL projection regression. Fake backend and fake Android Context only. */
public final class VerifyImageVpnController {
    public static final class FakeHttpUrl {
        private final String value;
        private FakeHttpUrl(String value) { this.value = value; }
        public static FakeHttpUrl parse(String value) {
            return (FakeHttpUrl)ImageVpnController.routeHttpUrl(new FakeHttpUrl(value));
        }
        public String toString() { return value; }
    }
    public static void main(String[] args) throws Exception {
        String target = "https://tools.yajuvideo.st/om/todoroki-hajime.jpg";
        String ordinary = "https://i.imgur.com/test.png";
        Context context = new Context();
        context.installed = false;
        ImageVpnController.initialize(context);
        ImageVpnController.setEnabled(true);
        if (ImageVpnController.enabled() || !ImageVpnController.route(target).equals(target)) throw new AssertionError("Missing marker enabled VPN");
        context.installed = true;
        ImageVpnController.initialize(context);
        if (ImageVpnController.enabled()) throw new AssertionError("Runtime must be opt-in");
        ImageVpnController.setEnabled(true);
        for(String host:new String[]{"www.activetk.jp","loggerip.web.app"}) {
            String protectedUrl="https://"+host+"/offline-test.png";
            if(!ImageVpnController.route(protectedUrl).startsWith("http://127.0.0.1:"))throw new AssertionError("Default host unprotected: "+host);
        }
        String mapped = ImageVpnController.route(target);
        if (!mapped.startsWith("http://127.0.0.1:") || mapped.contains("yajuvideo")) throw new AssertionError("Unsafe capability URL");
        URL local = new URL(mapped);
        if (!ImageVpnController.isLocalEndpoint(local.getHost(), local.getPort())) throw new AssertionError("HTTPS exemption");
        if (!ImageVpnController.route(ordinary).equals(ordinary)) throw new AssertionError("Ordinary request changed");
        for (String invalid : new String[]{"https://user@tools.yajuvideo.st/image.jpg",
                "https://tools.yajuvideo.st:8080/image.jpg", "https://tools.yajuvideo.st./image.jpg"}) {
            if (!ImageVpnController.route(invalid).startsWith("http://127.0.0.1:9/")) throw new AssertionError("Invalid target fell back directly");
        }
        if (!FakeHttpUrl.parse(target).toString().equals(mapped)) throw new AssertionError("HttpUrl projection or recursion");
        String[] projected = ImageVpnController.attachments(target + " " + target,
                new String[]{ordinary, target});
        if (projected.length != 2 || !ordinary.equals(projected[0]) || !mapped.equals(projected[1])) throw new AssertionError("Duplicate attachments");
        for (String path : new String[]{"/om/abeshinzo.jpg", "/test.png?x=1", "/folder/image.webp"}) {
            String[] additional = ImageVpnController.attachments("https://tools.yajuvideo.st" + path, new String[0]);
            if (additional.length != 1 || !additional[0].startsWith("http://127.0.0.1:")) throw new AssertionError("Path-specific extraction");
        }
        ImageVpnController.setEnabled(false);
        if (ImageVpnController.isLocalEndpoint(local.getHost(), local.getPort())
                || !ImageVpnController.route(target).equals(target)) throw new AssertionError("Disable cleanup");
        System.out.println("PASS offline controller: install marker, opt-in, unchanged normal URLs, native parser recursion, attachment projection and cleanup");
    }
}
