package dev.rikunode.adblock;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.AtomicFile;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;
import org.json.JSONArray;
import org.json.JSONObject;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;
import java.util.TreeSet;
import java.util.WeakHashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.zip.GZIPInputStream;

/**
 * In-app browser filtering only. No app startup hook, no external SDK and no request-blocking IO.
 *
 * Snapshot sha256: lowercase hex SHA-256 of UTF-8 encoded canonical stream:
 *   version + "\n" + generated_at + "\n" + each sorted host + "\n"
 *   + "--EXCEPTIONS--\n" + each sorted exception + "\n" + "--CSS--\n" + css
 * (sha256 is excluded from the digest).
 */
public final class AdBlockHelper {
    private static final String URL_STRING =
        "https://raw.githubusercontent.com/rikunode/hatena-bookmark-hide-pr-patches/filter-data/filters.json.gz";
    private static final String STYLE_ID = "morphe-adblock-style";
    private static final String PRIMARY = "adblock-filters.json.gz";
    private static final String PREVIOUS = "adblock-filters.previous.json.gz";
    private static final long INTERVAL = 24L * 60L * 60L * 1000L;
    private static final int MAX_COMPRESSED = 2 * 1024 * 1024;
    private static final int MAX_DECOMPRESSED = 8 * 1024 * 1024;
    private static final int MAX_HOSTS = 100000;
    private static final String SEED_CSS =
        "[id^=\"google_ads_\"],[id^=\"div-gpt-ad\"],.adsbygoogle,.ad-container," +
        ".ad-banner,.advertisement,[data-ad-slot]{display:none!important}";
    private static final String[] SEED_HOSTS = {
        "doubleclick.net", "googlesyndication.com", "googletagservices.com",
        "amazon-adsystem.com", "criteo.com", "criteo.net", "taboola.com", "outbrain.com"
    };
    private static final AtomicBoolean STARTED = new AtomicBoolean(false);
    // Null means background loading is in progress: all subrequests are allowed.
    private static volatile Rules active;
    // Freeze rules per WebView: already-displayed pages never change during an update.
    // A null entry deliberately stays fail-open if the first request preceded disk load.
    private static final Map<WebView, Rules> perView = new WeakHashMap<>();
    private static Rules rulesFor(WebView view) {
        synchronized (perView) {
            if (!perView.containsKey(view)) perView.put(view, active);
            return perView.get(view);
        }
    }
    private static final class Rules {
        final Set<String> hosts;
        final Set<String> exceptions;
        final String css;
        Rules(Set<String> hosts, Set<String> exceptions, String css) {
            this.hosts = Collections.unmodifiableSet(hosts);
            this.exceptions = Collections.unmodifiableSet(exceptions);
            this.css = css;
        }
    }
    private AdBlockHelper() {}

    public static WebResourceResponse intercept(WebView view, WebResourceRequest request,
                                                boolean update) {
        try {
            if (view == null || request == null || request.isForMainFrame()) return null;
            start(view.getContext().getApplicationContext(), update);
            Rules rules = rulesFor(view);
            if (rules == null || request.getUrl() == null) return null;
            String host = normalizeHost(request.getUrl().getHost());
            if (host == null || matches(rules.exceptions, host) || !matches(rules.hosts, host))
                return null;
            return new WebResourceResponse("text/plain", "UTF-8",
                    new ByteArrayInputStream(new byte[0]));
        } catch (Throwable ignored) {
            return null; // Fail open, including malformed URLs, Android API errors and IO.
        }
    }

    public static void injectCss(WebView view, boolean update) {
        try {
            if (view == null) return;
            start(view.getContext().getApplicationContext(), update);
            Rules rules = rulesFor(view);
            // No CSS until the asynchronous initial read is complete.
            if (rules == null) return;
            String script = "(function(){if(!document.getElementById('" + STYLE_ID +
                    "')){var s=document.createElement('style');s.id='" + STYLE_ID +
                    "';s.textContent=" + JSONObject.quote(rules.css) +
                    ";(document.head||document.documentElement).appendChild(s);}})();";
            view.evaluateJavascript(script, null);
        } catch (Throwable ignored) {
            // Content injection is optional and must never crash an article.
        }
    }

    private static void start(Context app, boolean update) {
        if (!STARTED.compareAndSet(false, true)) return;
        new Thread(() -> {
            try {
                Rules loaded = update ? readSnapshot(new File(app.getFilesDir(), PRIMARY)) : null;
                if (loaded == null && update)
                    loaded = readSnapshot(new File(app.getFilesDir(), PREVIOUS));
                if (loaded == null)
                    loaded = new Rules(new HashSet<>(Arrays.asList(SEED_HOSTS)),
                            new HashSet<>(), SEED_CSS);
                else
                    loaded = withSeed(loaded);
                active = loaded; // A single volatile swap.
                if (update) updateIfDue(app);
            } catch (Throwable ignored) {
                active = new Rules(new HashSet<>(Arrays.asList(SEED_HOSTS)),
                        new HashSet<>(), SEED_CSS);
            }
        }, "HatenaAdBlock").start();
    }

    // Merge only after the snapshot has passed all original integrity checks.
    private static Rules withSeed(Rules snapshot) {
        Set<String> hosts = new HashSet<>(snapshot.hosts);
        hosts.addAll(Arrays.asList(SEED_HOSTS));
        hosts.removeAll(snapshot.exceptions);
        return new Rules(hosts, new HashSet<>(snapshot.exceptions),
                SEED_CSS + "\n" + snapshot.css);
    }

    private static boolean matches(Set<String> domains, String host) {
        if (domains.contains(host)) return true;
        for (int dot = host.indexOf('.'); dot >= 0; dot = host.indexOf('.', dot + 1)) {
            if (domains.contains(host.substring(dot + 1))) return true;
        }
        return false;
    }

    private static String normalizeHost(String value) {
        if (value == null) return null;
        String host = value.toLowerCase(Locale.ROOT);
        if (host.endsWith(".")) host = host.substring(0, host.length() - 1);
        if (host.length() < 3 || host.length() > 253 || host.indexOf('.') < 1
                || host.contains("..") || host.startsWith("-") || host.endsWith("-"))
            return null;
        for (int i = 0; i < host.length(); i++) {
            char c = host.charAt(i);
            if (!((c >= 'a' && c <= 'z') || (c >= '0' && c <= '9')
                    || c == '-' || c == '.')) return null;
        }
        return host;
    }

    private static byte[] boundedRead(InputStream in, int max) throws Exception {
        try (InputStream source = in; ByteArrayOutputStream out = new ByteArrayOutputStream()) {
            byte[] buffer = new byte[8192];
            int n;
            while ((n = source.read(buffer)) != -1) {
                if (out.size() + n > max) throw new IllegalArgumentException("oversized snapshot");
                out.write(buffer, 0, n);
            }
            return out.toByteArray();
        }
    }

    private static String canonical(int version, String generated,
                                    Set<String> hosts, Set<String> exceptions, String css) {
        StringBuilder sb = new StringBuilder();
        sb.append(version).append('\n').append(generated).append('\n');
        for (String h : new TreeSet<>(hosts)) sb.append(h).append('\n');
        sb.append("--EXCEPTIONS--\n");
        for (String h : new TreeSet<>(exceptions)) sb.append(h).append('\n');
        sb.append("--CSS--\n").append(css);
        return sb.toString();
    }

    private static String hexSha256(String s) throws Exception {
        byte[] digest = MessageDigest.getInstance("SHA-256")
                .digest(s.getBytes(StandardCharsets.UTF_8));
        StringBuilder hex = new StringBuilder();
        for (byte b : digest) hex.append(String.format(Locale.ROOT, "%02x", b & 255));
        return hex.toString();
    }

    private static Set<String> readHosts(JSONArray array) throws Exception {
        if (array.length() > MAX_HOSTS) throw new IllegalArgumentException("too many hosts");
        Set<String> result = new HashSet<>();
        for (int i = 0; i < array.length(); i++) {
            String raw = array.getString(i);
            String value = normalizeHost(raw);
            if (value == null || !value.equals(raw) || !result.add(value))
                throw new IllegalArgumentException("invalid/duplicate host");
        }
        return result;
    }

    private static Rules validate(byte[] gzip) throws Exception {
        if (gzip.length == 0 || gzip.length > MAX_COMPRESSED)
            throw new IllegalArgumentException("compressed size");
        byte[] plain = boundedRead(new GZIPInputStream(new ByteArrayInputStream(gzip)),
                MAX_DECOMPRESSED);
        JSONObject obj = new JSONObject(new String(plain, StandardCharsets.UTF_8));
        int version = obj.getInt("version");
        if (version != 1) throw new IllegalArgumentException("version");
        String generated = obj.getString("generated_at");
        if (!generated.matches("\\d{4}-\\d{2}-\\d{2}T\\d{2}:\\d{2}:\\d{2}Z"))
            throw new IllegalArgumentException("generated_at");
        Set<String> hosts = readHosts(obj.getJSONArray("hosts"));
        Set<String> exceptions = readHosts(obj.getJSONArray("exceptions"));
        if (hosts.size() < 10000 || hosts.size() > MAX_HOSTS)
            throw new IllegalArgumentException("host count");
        String css = obj.getString("css");
        if (css.getBytes(StandardCharsets.UTF_8).length > 30 * 1024)
            throw new IllegalArgumentException("css size");
        String claimed = obj.getString("sha256");
        if (!claimed.matches("[a-f0-9]{64}") ||
                !claimed.equals(hexSha256(canonical(version, generated, hosts, exceptions, css))))
            throw new IllegalArgumentException("sha256");
        hosts.removeAll(exceptions); // Explicit allowlist always wins.
        return new Rules(hosts, exceptions, css);
    }

    private static Rules readSnapshot(File file) {
        if (!file.isFile()) return null;
        try {
            return validate(boundedRead(new java.io.FileInputStream(file), MAX_COMPRESSED));
        } catch (Throwable ignored) { return null; }
    }

    private static void atomicWrite(File file, byte[] data) throws Exception {
        AtomicFile atom = new AtomicFile(file);
        java.io.FileOutputStream out = atom.startWrite();
        try {
            out.write(data);
            atom.finishWrite(out);
        } catch (Throwable e) {
            atom.failWrite(out);
            throw e;
        }
    }

    private static void updateIfDue(Context app) {
        SharedPreferences prefs = app.getSharedPreferences("morphe_adblock", Context.MODE_PRIVATE);
        long now = System.currentTimeMillis();
        long previous = prefs.getLong("checked_at", 0L);
        if (now >= previous && now - previous < INTERVAL) return;
        HttpURLConnection connection = null;
        try {
            connection = (HttpURLConnection) new URL(URL_STRING).openConnection();
            connection.setConnectTimeout(10000);
            connection.setReadTimeout(15000);
            connection.setUseCaches(false);
            String etag = prefs.getString("etag", "");
            if (etag != null && !etag.isEmpty())
                connection.setRequestProperty("If-None-Match", etag);
            int status = connection.getResponseCode();
            if (status == 304) {
                prefs.edit().putLong("checked_at", now).apply();
                return;
            }
            if (status != 200) return;
            if (connection.getContentLength() > MAX_COMPRESSED) return;
            byte[] body = boundedRead(connection.getInputStream(), MAX_COMPRESSED);
            Rules candidate = validate(body);
            File primary = new File(app.getFilesDir(), PRIMARY);
            File backup = new File(app.getFilesDir(), PREVIOUS);
            if (readSnapshot(primary) != null) {
                byte[] old = boundedRead(new java.io.FileInputStream(primary), MAX_COMPRESSED);
                atomicWrite(backup, old);
            }
            atomicWrite(primary, body);
            String newEtag = connection.getHeaderField("ETag");
            SharedPreferences.Editor edit = prefs.edit().putLong("checked_at", now);
            if (newEtag != null && newEtag.length() < 256) edit.putString("etag", newEtag);
            edit.apply();
            // Already displayed WebViews keep their style; only future requests see new rules.
            active = withSeed(candidate);
        } catch (Throwable ignored) {
            // Preserve the last valid snapshot and silently retry on another eligible visit.
        } finally {
            if (connection != null) connection.disconnect();
        }
    }
}
