package xyz.urro.gboard;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.webkit.CookieManager;
import android.webkit.JavascriptInterface;
import android.webkit.WebResourceRequest;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Toast;
import org.json.JSONObject;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.HttpCookie;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.Executors;
import java.util.concurrent.ExecutorService;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** A local WebView supplies the platform WebSocket/WebRTC transports; no server HTML is executed. */
final class ClipCascadeClient {
    static final int MAX_BYTES = 16 * 1024 * 1024;
    private final Context context;
    private final Handler main = new Handler(Looper.getMainLooper());
    private final ExecutorService io = Executors.newSingleThreadExecutor();
    private final java.net.CookieManager cookies = new java.net.CookieManager();
    private final java.util.LinkedHashMap<String, Long> outgoing = new java.util.LinkedHashMap<>();
    private ClipCrypto crypto;
    private WebView transport;
    private String base;
    private volatile boolean started;
    private volatile int generation;
    private int limit = MAX_BYTES;
    private long sendSequence;
    private volatile boolean localPermissionRequired;
    volatile String status = "Not connected";

    ClipCascadeClient(Context context) { this.context = context.getApplicationContext(); }

    void start() {
        if (started) return;
        if (localPermissionRequired && !ClipPermissionActivity.granted(context)) return;
        localPermissionRequired = false;
        started = true;
        final int token = ++generation;
        status = "Connecting";
        io.execute(() -> {
            try {
                JSONObject config = new JSONObject(asset("urro_clipcascade.json"));
                base = config.getString("server");
                limit = config.optInt("maxBytes", 8 * 1024 * 1024);
                if (limit < 1 || limit > MAX_BYTES) throw new IllegalArgumentException("Invalid clipboard size limit");
                String username = config.getString("username");
                String hash = ClipCrypto.loginPassword(config.getString("password"));
                crypto = new ClipCrypto(username, config.getString("password"), config.getString("salt"), config.getInt("iterations"), config.getBoolean("encryption"));
                java.net.InetAddress host = java.net.InetAddress.getByName(new URL(base).getHost());
                if (!allowLocalNetwork(host.isSiteLocalAddress() || host.isLinkLocalAddress())) return;
                String login = request("/login", null);
                String csrf = csrf(login);
                request("/login", "username=" + encode(username) + "&password=" + encode(hash) + "&_csrf=" + encode(csrf));
                if (!"OK".equals(request("/validate-session", null).trim())) throw new IllegalStateException("ClipCascade login was rejected");
                String mode = new JSONObject(request("/server-mode", null)).getString("mode");
                if (!allowLocalNetwork(mode.equals("P2P"))) return;
                if (!mode.equals("P2S") && !mode.equals("P2P")) throw new IllegalStateException("Unknown server mode");
                String stun = mode.equals("P2P") ? new JSONObject(request("/stun-url", null)).getString("url") : "";
                if (mode.equals("P2S")) {
                    long serverLimit = new JSONObject(request("/max-size", null)).getLong("maxsize");
                    if (serverLimit > 0) limit = (int) Math.min(limit, serverLimit);
                }
                String script = asset("urro_clipcascade.js");
                JSONObject wire = new JSONObject().put("mode", mode).put("stun", stun).put("limit", limit)
                        .put("url", base.replaceFirst("^http", "ws") + (mode.equals("P2P") ? "/p2psignaling" : "/clipsocket"));
                main.post(() -> {
                    if (!started || generation != token) return;
                    CookieManager manager = CookieManager.getInstance();
                    for (HttpCookie cookie : cookies.getCookieStore().getCookies()) {
                        manager.setCookie(base, cookie.getName() + "=" + cookie.getValue() + "; Path=/" + (base.startsWith("https:") ? "; Secure" : ""));
                    }
                    transport = new WebView(context);
                    transport.getSettings().setJavaScriptEnabled(true);
                    transport.getSettings().setAllowFileAccess(false);
                    transport.getSettings().setAllowContentAccess(false);
                    transport.getSettings().setMixedContentMode(android.webkit.WebSettings.MIXED_CONTENT_NEVER_ALLOW);
                    transport.addJavascriptInterface(new Bridge(token), "UrroClip");
                    transport.setWebViewClient(new WebViewClient() {
                        @Override public boolean shouldOverrideUrlLoading(WebView view, WebResourceRequest request) { return true; }
                        @Override public void onPageFinished(WebView view, String url) {
                            if (started && generation == token) view.evaluateJavascript(script + "\nurroStart(" + wire + ");", null);
                        }
                    });
                    // Only this literal local document runs with the configured origin. No remote DOM or script is loaded.
                    transport.loadDataWithBaseURL(base + "/", "<!doctype html><meta charset=utf-8><title>Clipboard transport</title>", "text/html", "UTF-8", null);
                });
            } catch (Exception exception) {
                main.post(() -> {
                    if (generation != token) return;
                    started = false;
                    status = "Connection failed (" + exception.getClass().getSimpleName() + ")";
                    android.util.Log.e("UrroGboard", "ClipCascade connection failed: " + exception.getClass().getSimpleName());
                    Toast.makeText(context, status + ". Check the server and patch options.", Toast.LENGTH_LONG).show();
                });
            }
        });
    }

    private boolean allowLocalNetwork(boolean needed) {
        if (!needed || ClipPermissionActivity.granted(context)) return true;
        status = "Allow local network access in Clipboard settings";
        localPermissionRequired = true;
        started = false;
        return false;
    }

    void stop() {
        started = false; generation++;
        if (transport != null) { transport.evaluateJavascript("urroStop()", null); transport.destroy(); transport = null; }
        status = "Disconnected";
    }

    void send(String text, String type) {
        final int token = generation;
        io.execute(() -> {
            try {
                if (!started || crypto == null) throw new IllegalStateException("Not connected");
                int bytes = "image".equals(type) ? android.util.Base64.decode(text, android.util.Base64.DEFAULT).length : text.getBytes(StandardCharsets.UTF_8).length;
                if (bytes > limit) throw new IllegalArgumentException("Clipboard exceeds the server limit");
                String payload = crypto.encrypt(text);
                if (payload.getBytes(StandardCharsets.UTF_8).length > MAX_BYTES * 2) throw new IllegalArgumentException("Encrypted clipboard is too large");
                main.post(() -> {
                    if (generation != token || transport == null) return;
                    synchronized (outgoing) {
                        long now = android.os.SystemClock.elapsedRealtime();
                        outgoing.entrySet().removeIf(entry -> now - entry.getValue() > 30000);
                        outgoing.put(text, now);
                        while (outgoing.size() > 64) outgoing.remove(outgoing.keySet().iterator().next());
                    }
                    transport.evaluateJavascript("urroSend(" + JSONObject.quote(payload) + "," + JSONObject.quote(type) + "," + bytes + "," + JSONObject.quote(Long.toString(++sendSequence)) + ")", null);
                });
            } catch (Exception exception) {
                main.post(() -> Toast.makeText(context, "Clipboard send failed. Check the connection and server size limit.", Toast.LENGTH_LONG).show());
            }
        });
    }

    private final class Bridge {
        private final int token;
        Bridge(int token) { this.token = token; }
        @JavascriptInterface public void status(String value) {
            main.post(() -> { if (generation == token) status = value.length() > 200 ? value.substring(0, 200) : value; });
        }
        @JavascriptInterface public void sent(String id, boolean sent) {
            main.post(() -> { if (generation == token) Toast.makeText(context, sent ? "Sent to connected devices" : "Couldn't send: no ready connection", Toast.LENGTH_SHORT).show(); });
        }
        @JavascriptInterface public void received(String payload, String type) {
            if ((!"text".equals(type) && !"image".equals(type)) || payload == null || payload.length() > MAX_BYTES * 2) return;
            io.execute(() -> {
                try {
                    String text = crypto.decrypt(payload);
                    int size = "image".equals(type) ? android.util.Base64.decode(text, android.util.Base64.DEFAULT).length : text.getBytes(StandardCharsets.UTF_8).length;
                    if (size > limit) return;
                    synchronized (outgoing) {
                        Long sent = outgoing.get(text);
                        if (sent != null && android.os.SystemClock.elapsedRealtime() - sent < 30000) return;
                    }
                    if (generation == token && !text.isEmpty()) ClipboardHooks.received(text, type);
                } catch (Exception exception) {
                    main.post(() -> { if (generation == token) status = "Receive failed: check encryption settings"; });
                }
            });
        }
    }

    private String asset(String name) throws Exception {
        try (InputStream input = context.getAssets().open(name)) { return new String(read(input, MAX_BYTES * 2), StandardCharsets.UTF_8); }
    }
    private static String encode(String value) throws Exception { return URLEncoder.encode(value, "UTF-8"); }
    private static String csrf(String html) {
        Matcher tags = Pattern.compile("<input\\b[^>]*>", Pattern.CASE_INSENSITIVE).matcher(html);
        while (tags.find()) {
            String tag = tags.group();
            if (!Pattern.compile("name\\s*=\\s*['\"]_csrf['\"]", Pattern.CASE_INSENSITIVE).matcher(tag).find()) continue;
            Matcher value = Pattern.compile("value\\s*=\\s*['\"]([^'\"]+)['\"]", Pattern.CASE_INSENSITIVE).matcher(tag);
            if (value.find()) return value.group(1);
        }
        throw new IllegalStateException("No CSRF login token");
    }
    private String request(String path, String body) throws Exception {
        URI uri = new URI(base + path);
        HttpURLConnection connection = (HttpURLConnection) uri.toURL().openConnection();
        connection.setConnectTimeout(15000); connection.setReadTimeout(15000);
        connection.setInstanceFollowRedirects(false);
        for (MapEntry entry : cookieHeaders(uri)) connection.setRequestProperty(entry.name, entry.value);
        if (body != null) {
            connection.setRequestMethod("POST"); connection.setDoOutput(true);
            connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            try (java.io.OutputStream output = connection.getOutputStream()) { output.write(body.getBytes(StandardCharsets.UTF_8)); }
        }
        try {
            int code = connection.getResponseCode();
            cookies.put(uri, connection.getHeaderFields());
            if (code >= 300 && code < 400 && body != null) return "";
            if (code != 200) throw new IllegalStateException("HTTP " + code);
            try (InputStream input = connection.getInputStream()) { return new String(read(input, MAX_BYTES), StandardCharsets.UTF_8); }
        } finally { connection.disconnect(); }
    }
    private static final class MapEntry {
        final String name, value;
        MapEntry(String name, String value) { this.name = name; this.value = value; }
    }
    private java.util.List<MapEntry> cookieHeaders(URI uri) throws Exception {
        java.util.List<MapEntry> result = new java.util.ArrayList<>();
        for (java.util.Map.Entry<String, java.util.List<String>> entry : cookies.get(uri, java.util.Collections.emptyMap()).entrySet()) {
            result.add(new MapEntry(entry.getKey(), String.join("; ", entry.getValue())));
        }
        return result;
    }
    private static byte[] read(InputStream input, int maximum) throws Exception {
        ByteArrayOutputStream output = new ByteArrayOutputStream(); byte[] buffer = new byte[8192]; int count;
        while ((count = input.read(buffer)) != -1) {
            if (output.size() + count > maximum) throw new IllegalArgumentException("Response exceeds size limit");
            output.write(buffer, 0, count);
        }
        return output.toByteArray();
    }
}
