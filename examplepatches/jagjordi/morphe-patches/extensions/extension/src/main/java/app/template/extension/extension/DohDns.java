package app.template.extension.extension;

import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Proxy;
import java.net.HttpURLConnection;
import java.net.InetAddress;
import java.net.URL;
import java.net.URLEncoder;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * DNS-over-HTTPS resolver installed into every OkHttpClient.Builder the app creates.
 *
 * The phone's private DNS (DNS over TLS) is bypassed because queries go straight to the
 * resolver's IP address over HTTPS, so no system name lookup happens for them. The resolver
 * is handed to OkHttp as a dynamic proxy of its {@code okhttp3.Dns} interface, which keeps
 * working when R8 has renamed the interface's single lookup method.
 */
@SuppressWarnings("unused")
public final class DohDns {
    private static final String TAG = "DohDns";
    private static final int TIMEOUT_MS = 5000;
    private static final long MIN_TTL_MS = 30_000L;
    private static final long MAX_TTL_MS = 10 * 60_000L;

    private static final Map<Class<?>, Object> PROXIES = new ConcurrentHashMap<>();
    private static final Map<String, CacheEntry> CACHE = new ConcurrentHashMap<>();

    private DohDns() {
    }

    /** Body is replaced by the patch when the dohServer option is set. */
    private static String getServer() {
        return "8.8.8.8";
    }

    /**
     * Called at the end of {@code OkHttpClient.Builder.<init>()}. Finds the builder's
     * {@code okhttp3.Dns} field by type and replaces the system resolver with this one.
     */
    public static void install(Object builder) {
        if (builder == null) {
            return;
        }
        try {
            Class<?> current = builder.getClass();
            while (current != null && current != Object.class) {
                for (Field field : current.getDeclaredFields()) {
                    if (Modifier.isStatic(field.getModifiers())) {
                        continue;
                    }
                    Class<?> type = field.getType();
                    if (type.isInterface() && "okhttp3.Dns".equals(type.getName())) {
                        field.setAccessible(true);
                        field.set(builder, proxyFor(type));
                        return;
                    }
                }
                current = current.getSuperclass();
            }
            Log.w(TAG, "No okhttp3.Dns field found on " + builder.getClass().getName());
        } catch (Throwable t) {
            Log.e(TAG, "Failed to install resolver", t);
        }
    }

    private static Object proxyFor(final Class<?> dnsInterface) {
        Object proxy = PROXIES.get(dnsInterface);
        if (proxy != null) {
            return proxy;
        }
        proxy = Proxy.newProxyInstance(
                dnsInterface.getClassLoader(),
                new Class<?>[]{dnsInterface},
                new InvocationHandler() {
                    @Override
                    public Object invoke(Object self, Method method, Object[] args) throws Throwable {
                        Class<?>[] params = method.getParameterTypes();
                        if (params.length == 1 && params[0] == String.class
                                && List.class.isAssignableFrom(method.getReturnType())) {
                            return resolve((String) args[0]);
                        }
                        String name = method.getName();
                        if ("toString".equals(name)) {
                            return "DohDns(" + getServer() + ")";
                        }
                        if ("hashCode".equals(name)) {
                            return System.identityHashCode(self);
                        }
                        if ("equals".equals(name)) {
                            return self == args[0];
                        }
                        throw new UnsupportedOperationException(method.toString());
                    }
                });
        PROXIES.put(dnsInterface, proxy);
        Log.i(TAG, "Installed DNS-over-HTTPS resolver via " + getServer());
        return proxy;
    }

    public static List<InetAddress> resolve(String hostname) throws UnknownHostException {
        if (hostname == null || hostname.isEmpty()) {
            throw new UnknownHostException("empty hostname");
        }
        if (isIpLiteral(hostname)) {
            return java.util.Arrays.asList(InetAddress.getAllByName(hostname));
        }
        String key = hostname.toLowerCase();
        CacheEntry cached = CACHE.get(key);
        long now = System.currentTimeMillis();
        if (cached != null && cached.expiresAt > now) {
            return cached.addresses;
        }

        List<InetAddress> result = new ArrayList<>();
        long ttlMs = MAX_TTL_MS;
        try {
            ttlMs = Math.min(ttlMs, query(hostname, "A", result));
            ttlMs = Math.min(ttlMs, query(hostname, "AAAA", result));
        } catch (Throwable t) {
            Log.w(TAG, "DoH lookup failed for " + hostname + ": " + t);
        }

        if (result.isEmpty()) {
            // The resolver answered with nothing usable. Fall back to the system resolver so
            // hosts that are only reachable through it (for example split DNS) still work.
            try {
                result.addAll(java.util.Arrays.asList(InetAddress.getAllByName(hostname)));
                Log.i(TAG, "System fallback resolved " + hostname);
            } catch (UnknownHostException e) {
                throw new UnknownHostException("DoH and system DNS both failed for " + hostname);
            }
            ttlMs = MIN_TTL_MS;
        }

        List<InetAddress> addresses = Collections.unmodifiableList(result);
        CACHE.put(key, new CacheEntry(addresses, now + Math.max(MIN_TTL_MS, ttlMs)));
        return addresses;
    }

    /** Appends answers for one record type and returns the smallest TTL seen, in ms. */
    private static long query(String hostname, String type, List<InetAddress> out) throws Exception {
        String server = getServer();
        boolean google = server.startsWith("8.8.") || "dns.google".equalsIgnoreCase(server);
        String path = google ? "/resolve" : "/dns-query";
        URL url = new URL("https://" + server + path
                + "?name=" + URLEncoder.encode(hostname, "UTF-8") + "&type=" + type);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setConnectTimeout(TIMEOUT_MS);
        connection.setReadTimeout(TIMEOUT_MS);
        connection.setRequestProperty("Accept", "application/dns-json");
        connection.setUseCaches(false);
        long ttlMs = MAX_TTL_MS;
        try {
            int status = connection.getResponseCode();
            if (status != 200) {
                throw new java.io.IOException("DoH status " + status);
            }
            JSONObject body = new JSONObject(readAll(connection.getInputStream()));
            JSONArray answers = body.optJSONArray("Answer");
            if (answers == null) {
                return ttlMs;
            }
            int wanted = "A".equals(type) ? 1 : 28;
            for (int i = 0; i < answers.length(); i++) {
                JSONObject answer = answers.getJSONObject(i);
                if (answer.optInt("type") != wanted) {
                    continue;
                }
                String data = answer.optString("data", "");
                if (data.isEmpty()) {
                    continue;
                }
                try {
                    out.add(InetAddress.getByAddress(hostname, InetAddress.getByName(data).getAddress()));
                    ttlMs = Math.min(ttlMs, answer.optLong("TTL", MAX_TTL_MS / 1000) * 1000L);
                } catch (UnknownHostException ignored) {
                    // Not an IP literal, skip.
                }
            }
        } finally {
            connection.disconnect();
        }
        return ttlMs;
    }

    private static String readAll(InputStream in) throws Exception {
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        byte[] chunk = new byte[4096];
        int read;
        while ((read = in.read(chunk)) != -1) {
            buffer.write(chunk, 0, read);
        }
        in.close();
        return buffer.toString("UTF-8");
    }

    private static boolean isIpLiteral(String host) {
        if (host.indexOf(':') >= 0) {
            return true;
        }
        boolean digitsAndDots = true;
        for (int i = 0; i < host.length(); i++) {
            char c = host.charAt(i);
            if (!(c >= '0' && c <= '9') && c != '.') {
                digitsAndDots = false;
                break;
            }
        }
        return digitsAndDots;
    }

    private static final class CacheEntry {
        final List<InetAddress> addresses;
        final long expiresAt;

        CacheEntry(List<InetAddress> addresses, long expiresAt) {
            this.addresses = addresses;
            this.expiresAt = expiresAt;
        }
    }
}
