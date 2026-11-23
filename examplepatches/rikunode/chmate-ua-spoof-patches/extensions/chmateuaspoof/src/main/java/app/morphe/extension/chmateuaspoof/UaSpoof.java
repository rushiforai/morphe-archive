package app.morphe.extension.chmateuaspoof;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URLConnection;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

/**
 * Request-side hooks. Only java.* is used here so the same code is exercised by JVM tests.
 *
 * Precedence for every native request (see README "Hook order"):
 * 1. Haiagaru ReadingAuth paired UA (bbs.eddibb.cc authenticated reads) is never replaced.
 * 2. ON: the User-Agent header becomes exactly the selected string, overriding the stock UA and
 *    Haiagaru's ViewingUserAgent result (our hook is placed after Haiagaru's).
 * 3. OFF: no change, except removing a spoofed http.agent suffix after a runtime ON-to-OFF switch.
 */
public final class UaSpoof {
    /** Selected UA while ON, otherwise null. */
    private static volatile String agent;
    /** http.agent before this patch changed it; captured once, before any change. */
    private static volatile String originalHttpAgent;
    private static volatile boolean originalCaptured;
    /** Every value this process wrote to http.agent. Empty means no http.agent side effect. */
    private static final Set<String> applied = new CopyOnWriteArraySet<>();

    private static final String READING_AUTH = "app.morphe.extension.chmate.ReadingAuth";
    private static volatile Method readingAuthAgent;
    private static volatile boolean readingAuthResolved;
    private static volatile boolean warned;

    /** Applies the state. {@code selected == null} means OFF. Safe to call repeatedly. */
    public static synchronized void apply(String selected) {
        if (!originalCaptured) {
            originalHttpAgent = System.getProperty("http.agent");
            originalCaptured = true;
        }
        if (selected != null && UaSpoofRules.valid(selected)) {
            agent = selected;
            System.setProperty("http.agent", selected);
            applied.add(selected);
        } else {
            agent = null;
            // Restore only if this process changed it; never touch http.agent otherwise.
            if (!applied.isEmpty()) {
                if (originalHttpAgent == null) System.clearProperty("http.agent");
                else System.setProperty("http.agent", originalHttpAgent);
            }
        }
    }

    public static String current() { return agent; }

    public static String originalHttpAgent() { return originalHttpAgent; }

    static Set<String> appliedAgents() { return applied; }

    /** Haiagaru's saved paired UA for this request, or null (also when Haiagaru is absent). */
    static String readingAuthAgent(String url, String method) {
        if (!readingAuthResolved) {
            synchronized (UaSpoof.class) {
                if (!readingAuthResolved) {
                    try {
                        Method m = Class.forName(READING_AUTH, false, UaSpoof.class.getClassLoader())
                                .getDeclaredMethod("agent", String.class, String.class);
                        m.setAccessible(true);
                        readingAuthAgent = m;
                    } catch (ReflectiveOperationException | LinkageError absent) {
                        readingAuthAgent = null;
                    }
                    readingAuthResolved = true;
                }
            }
        }
        Method m = readingAuthAgent;
        if (m == null || url == null || method == null) return null;
        try {
            Object value = m.invoke(null, url, method);
            return value instanceof String ? (String) value : null;
        } catch (ReflectiveOperationException | RuntimeException error) {
            return null;
        }
    }

    /** User-Agent value to send, or {@code original} to keep it. */
    static String replacement(String url, String method, String original) {
        String selected = agent;
        if (selected == null) {
            return applied.isEmpty() ? original : UaSpoofRules.restore(original, applied, originalHttpAgent);
        }
        if (!UaSpoofRules.eligible(url, method)) return original;
        if (readingAuthAgent(url, method) != null) return original;
        return selected;
    }

    /** Hook: end of every native okhttp3 Request (o.zzdA) constructor, after Haiagaru's hook. */
    public static void prepareRequest(Object request) {
        String selected = agent;
        if (selected == null && applied.isEmpty()) return;
        try {
            Class<?> type = request.getClass();
            Object url = field(type, "h").get(request);
            String method = (String) field(type, "c").get(request);
            String urlText = url == null ? null : url.toString();
            Field headersField = field(type, "a");
            Object headers = headersField.get(request);
            if (headers == null) return;
            Class<?> headersType = headers.getClass();
            String[] pairs = (String[]) field(headersType, "namesAndValues").get(headers);
            String[] changed;
            if (selected == null) {
                changed = UaSpoofRules.restoreHeaders(pairs, applied, originalHttpAgent);
            } else {
                if (!UaSpoofRules.eligible(urlText, method)) return;
                if (readingAuthAgent(urlText, method) != null) return;
                changed = UaSpoofRules.withAgent(pairs, selected);
            }
            if (changed == pairs) return;
            Constructor<?> constructor = headersType.getDeclaredConstructor(String[].class);
            constructor.setAccessible(true);
            // A fresh Headers instance: never mutate one that other requests may share.
            headersField.set(request, constructor.newInstance((Object) changed));
        } catch (Exception | LinkageError error) {
            warn(error);
        }
    }

    /** Hook: immediately before native connect/getInputStream/getOutputStream/getResponseCode. */
    public static void prepare(URLConnection connection) {
        if (!(connection instanceof HttpURLConnection)) return;
        if (agent == null && applied.isEmpty()) return;
        HttpURLConnection http = (HttpURLConnection) connection;
        try {
            String original = http.getRequestProperty("User-Agent");
            String value = replacement(http.getURL().toExternalForm(), http.getRequestMethod(), original);
            if (value != null && !value.equals(original)) http.setRequestProperty("User-Agent", value);
        } catch (IllegalStateException alreadyConnected) {
            // An earlier boundary on this connection already applied the value.
        } catch (RuntimeException error) {
            warn(error);
        }
    }

    private static Field field(Class<?> type, String name) throws NoSuchFieldException {
        Field field = type.getDeclaredField(name);
        field.setAccessible(true);
        return field;
    }

    private static void warn(Throwable error) {
        if (warned) return;
        warned = true;
        System.err.println("ChMateUaSpoof: request user agent not applied: " + error);
    }

    private UaSpoof() { }
}
