package app.morphe.extension.chmate;

import android.content.Context;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.LinkedHashSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Opt-in native image projection. Never returns the protected original on mapping failure. */
public final class ImageVpnController {
    private static volatile boolean installed;
    private static volatile boolean enabled;
    private static volatile String lastError = "IMAGE_VPN_DISABLED";
    private static Context context;
    private static ImageVpnRelay relay;
    private static final Pattern IMAGE = Pattern.compile(
            "https?://[^\\s<>\"']+", Pattern.CASE_INSENSITIVE);
    private static final ThreadLocal<Boolean> PARSING = new ThreadLocal<>();
    private ImageVpnController() {}

    public static synchronized void initialize(Context source) {
        Context app = source.getApplicationContext();
        context = app == null ? source : app;
        reloadDomains();
        try (InputStream marker = context.getAssets().open("haiagaru/image-vpn/installed")) {
            installed = marker.read() == '1';
        } catch (IOException missing) { installed = false; }
        setEnabled(installed && context.getSharedPreferences("io.github.areteruhiro.chmate.haiagaru.ui-config", Context.MODE_PRIVATE)
                .getBoolean("imageVpnEnabled", false));
    }

    public static boolean available() { return installed; }
    public static boolean enabled() { return enabled; }

    public static void reloadDomains() {
        if (context == null) return;
        String value = context.getSharedPreferences("io.github.areteruhiro.chmate.haiagaru.ui-config", Context.MODE_PRIVATE)
                .getString("imageVpnDomains", ImageVpnRequestPolicy.DEFAULT_DOMAINS);
        try { ImageVpnRequestPolicy.setDomains(value); }
        catch (IllegalArgumentException invalid) { ImageVpnRequestPolicy.setDomains(ImageVpnRequestPolicy.DEFAULT_DOMAINS); }
    }

    /** Registered preview targets never go direct, including without the optional VPN asset. */
    static boolean protectedPreview(String value) {
        try { return ImageVpnRequestPolicy.isTarget(new URL(value)); }
        catch (IOException invalid) { return false; }
    }

    static app.morphe.extension.chmate.vpn.nativecore.imagevpn.Image fetchPreview(String value) throws IOException {
        ImageVpnFetchManager manager;
        synchronized(ImageVpnController.class) {
            if (!enabled || context == null) throw new IOException("IMAGE_VPN_PREVIEW_DISABLED");
            manager=ImageVpnFetchManager.getInstance(context);
        }
        app.morphe.extension.chmate.vpn.nativecore.imagevpn.Image result=manager.fetchPreview(value);
        if (!enabled) throw new IOException("IMAGE_VPN_DISABLED");
        return result;
    }

    public static synchronized void setEnabled(boolean value) {
        enabled = installed && value;
        if (!enabled && relay != null) { relay.close(); relay = null; }
        if (!enabled && context != null) ImageVpnFetchManager.getInstance(context).close();
        lastError = enabled ? "IMAGE_VPN_IDLE" : "IMAGE_VPN_DISABLED";
    }

    public static synchronized String status() {
        return relay == null ? lastError : ImageVpnFetchManager.getInstance(context).status();
    }

    public static synchronized boolean isLocalEndpoint(String host, int port) {
        return relay != null && "127.0.0.1".equals(host) && port == relay.port();
    }

    /** Persistent export dedup must not depend on a per-process relay capability URL. */
    static synchronized String imageIdentity(String value) {
        return relay == null ? value : relay.imageIdentity(value);
    }

    public static synchronized String route(String value) {
        if (!enabled || value == null) return value;
        try {
            URL parsed = new URL(value);
            String host = parsed.getHost();
            if (!ImageVpnRequestPolicy.isTargetHost(host)) return value;
        } catch (IOException malformed) { return value; }
        if (!ImageVpnRequestPolicy.isProtectedUrl(value))
            return "http://127.0.0.1:9/haiagaru-image-vpn-invalid-url.jpg";
        try {
            if (relay == null) relay = new ImageVpnRelay(ImageVpnFetchManager.getInstance(context));
            return relay.register(value);
        } catch (Exception | LinkageError failure) {
            lastError = "IMAGE_VPN_RELAY_UNAVAILABLE";
            // Closed local port, not the original URL. No direct DNS/connect can escape.
            return "http://127.0.0.1:9/haiagaru-image-vpn-unavailable.jpg";
        }
    }

    public static URL route(URL url) throws IOException {
        return new URL(route(url.toExternalForm()));
    }

    /** Hooked at native HttpUrl build returns. Reflection supports obfuscated OkHttp classes. */
    public static Object routeHttpUrl(Object original) {
        if (original == null || Boolean.TRUE.equals(PARSING.get()) || !enabled) return original;
        String source = original.toString();
        String mapped = route(source);
        if (source.equals(mapped)) return original;
        PARSING.set(true);
        try {
            for (Method parser : original.getClass().getDeclaredMethods()) {
                if (!Modifier.isStatic(parser.getModifiers()) || parser.getReturnType() != original.getClass()
                        || parser.getParameterTypes().length != 1 || parser.getParameterTypes()[0] != String.class) continue;
                parser.setAccessible(true);
                try {
                    Object result = parser.invoke(null, mapped);
                    if (result != null && mapped.equals(result.toString())) return result;
                } catch (ReflectiveOperationException ignored) { }
            }
            // The patch validates this parser contract. Never return the original target.
            throw new IllegalStateException("IMAGE_VPN_HTTP_URL_MAPPING_FAILED");
        } finally { PARSING.remove(); }
    }

    /** Native image list projection: text stays unchanged, all target paths share this route. */
    public static String[] attachments(String body, String[] original) {
        if (!enabled || original == null) return original;
        LinkedHashSet<String> urls = new LinkedHashSet<>();
        for (String value : original) urls.add(route(value));
        if (body != null) {
            Matcher images = IMAGE.matcher(body.replace("&amp;", "&"));
            while (images.find() && urls.size() < 256) {
                String candidate = images.group();
                try {
                    String path = new URL(candidate).getPath().toLowerCase(java.util.Locale.ROOT);
                    if (GifAutoFetchPolicy.supported(candidate) && !GifAutoFetchPolicy.gif(Haiagaru.gifAutoFetchMode())) continue;
                    if (ImageVpnRequestPolicy.isProtectedUrl(candidate) && path.matches(".*\\.(?:jpe?g|png|gif|webp|bmp)$")) urls.add(route(candidate));
                } catch (IOException ignored) { }
            }
        }
        return urls.toArray(new String[0]);
    }
}
