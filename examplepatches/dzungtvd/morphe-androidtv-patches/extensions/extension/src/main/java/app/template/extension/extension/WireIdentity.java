package app.template.extension.extension;

import java.io.IOException;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.regex.Pattern;

/** Re-tags requests with the TV or Lite identity required by each endpoint. */
@SuppressWarnings("unused")
public final class WireIdentity {

    private static final String TV_AID = "4082";
    private static final String TV_APP_NAME = "tiktok_tv";

    private static final Pattern AID = Pattern.compile("([?&])aid=[^&]*");
    private static final Pattern APP_NAME = Pattern.compile("([?&])app_name=[^&]*");
    private static final Pattern TS = Pattern.compile("([?&])ts=\\d+");
    private static final Pattern RTICKET = Pattern.compile("([?&])_rticket=\\d+");
    private static final Pattern CDID = Pattern.compile("([?&])cdid=[^&]*");
    private static final Pattern IID = Pattern.compile("([?&])iid=[^&]*");

    /** Endpoints that reject the Lite app id and require the TV identity. */
    private static final String[] TV_IDENTITY_PATHS = {
        "/search/tv/general/single/",
        "/tv/search/general/single/v1",
        "/lite/v2/user/profile/self/",
        // Built from a URL constant rather than a Retrofit annotation, so relocate it here.
        "/aweme/v1/tv/user/profile/self/",
    };

    /** Identity tuples the passport debug switch can present. */
    private static final String[][] PASSPORT_IDENTITIES = {
        {"lite", "1340", "musically_go", "430265", "43.2.65", "6041690"},
        {"main", "1233", "musically", "2024705030", "47.5.3", "6032090"},
        {"tv", "4082", "tiktok_tv", "", "", "6032090"},
    };

    public static Object rewrite(Object request) {
        if (request == null) return null;

        try {
            Object url = request.getClass().getMethod("b").invoke(request);
            if (!(url instanceof String)) return request;

            logPassportShape((String) url);
            captureWireIds((String) url);
            reportTransport((String) url);
            String rewritten = rewritePassport((String) url);
            if (rewritten == null) rewritten = rewriteUrl((String) url);
            if (rewritten == null) rewritten = rewriteLikedList((String) url);
            if (rewritten == null) rewritten = ensureProfileListQuery((String) url);
            String candidate = rewritten != null ? rewritten : (String) url;
            String scene = ensureRepostScene(candidate);
            if (scene != null) rewritten = scene;
            if (rewritten == null) return guardPassport(request, (String) url);

            Object builder = request.getClass().getMethod("m").invoke(request);
            builder.getClass().getMethod("a", String.class).invoke(builder, rewritten);
            return guardPassport(invokeNoArg(builder, "a"), rewritten);
        } catch (Throwable ignored) {
            return request;
        }
    }

    /** Normalizes the passport query and applies the selected identity. */
    private static String rewritePassport(String url) {
        if (!isLiteSubjectPath(url)) return null;

        String rewritten = swapHost(swapDevice(dedupeQuery(url)));
        rewritten = applyPassportIdentity(rewritten);
        rewritten = applyPassportModel(rewritten);
        if ("1".equals(property("debug.tt.pasreg", null))) {
            rewritten = freshenTimestamps(keptSubject(rewritten));
            android.util.Log.i(PASSPORT_TAG, "passport subject -> the pair this process registers as, on the wire="
                    + carriesSubject(rewritten));
            return rewritten.equals(url) ? null : rewritten;
        }
        if ("1".equals(property("debug.tt.pasrot", null))) {
            rewritten = freshenTimestamps(newPassportSubject(rewritten));
            android.util.Log.i(PASSPORT_TAG, "passport subject -> fresh per request");
        }
        return rewritten.equals(url) ? null : rewritten;
    }

    /** Returns true for passport and device-registration requests. */
    private static boolean isLiteSubjectPath(String url) {
        if (url.contains("/passport/")) return true;
        return "1".equals(property("debug.tt.pasreg", null))
                && url.contains("/service/2/device_register/");
    }

    /** One subject per process: minted for the registration, then whatever that answer issues. */
    private static volatile String[] sSubject;

    /** Whether the ids this process holds are the ones on that query, without naming them. */
    private static boolean carriesSubject(String url) {
        String[] subject = sSubject;
        return subject != null && url.contains("iid=" + subject[0]);
    }

    private static String keptSubject(String url) {
        String[] subject = sSubject;
        if (subject == null) {
            subject = mintSubject();
            sSubject = subject;
        }
        String swapped = replace(replace(url, "iid", subject[0]), "device_id", subject[1]);
        swapped = replace(replace(swapped, "cdid", subject[2]), "openudid", subject[3]);
        return replace(swapped, "hashed_id", subject[1]);
    }

    private static String[] mintSubject() {
        java.util.Random random = new java.util.Random();
        return new String[] { randomId(random), randomId(random),
                java.util.UUID.randomUUID().toString(), randomUdid(random) };
    }

    /** The ids the registration endpoint chose for this device, in place of the minted pair. */
    static void issuedSubject(String installId, String deviceId) {
        if (installId == null || installId.isEmpty()
                || deviceId == null || deviceId.isEmpty()) {
            android.util.Log.i(PASSPORT_TAG, "passport subject -> the server issued nothing");
            return;
        }
        String[] minted = sSubject == null ? mintSubject() : sSubject;
        sSubject = new String[] { installId, deviceId, minted[2], minted[3] };
        android.util.Log.i(PASSPORT_TAG, "passport subject -> issued by the server");
    }

    /** Mints a fresh device identity for each passport request. */
    private static String newPassportSubject(String url) {
        java.util.Random random = new java.util.Random();
        String deviceId = randomId(random);
        String swapped = replace(replace(url, "iid", randomId(random)), "device_id", deviceId);
        swapped = replace(replace(swapped, "cdid", java.util.UUID.randomUUID().toString()),
                "openudid", randomUdid(random));
        return replace(swapped, "hashed_id", deviceId);
    }

    /** An install or device id in the shape this client's own are: nineteen digits, starting at 7. */
    private static String randomId(java.util.Random random) {
        return String.valueOf(7_000_000_000_000_000_000L
                + (random.nextLong() & Long.MAX_VALUE) % 1_000_000_000_000_000_000L);
    }

    private static String randomUdid(java.util.Random random) {
        return String.format(java.util.Locale.US, "%016x", random.nextLong() & Long.MAX_VALUE);
    }

    /** A common arm64 phone profile, in the TV client's field names. */
    private static final String[][] PASSPORT_PHONE_MODEL = {
        {"device_brand", "samsung"},
        {"device_type", "SM-A515F"},
        {"resolution", "1080*2220"},
        {"dpi", "420"},
        {"host_abi", "arm64-v8a"},
        {"cpu_support64", "true"},
        {"chip_hardware", "samsungexynos9611"},
        {"chip_board", "exynos9611"},
    };

    /** Rewrites the passport hardware fields to a phone profile when debugging. */
    private static String applyPassportModel(String url) {
        if (!"1".equals(property("debug.tt.pasmodel", null))) return url;

        String rewritten = url;
        for (String[] field : PASSPORT_PHONE_MODEL) {
            rewritten = replace(rewritten, field[0], field[1]);
        }
        android.util.Log.i(PASSPORT_TAG, "passport model -> a phone profile");
        return rewritten;
    }

    /** Switches the passport host when the debug property is set. */
    private static String swapHost(String url) {
        String wanted = property("debug.tt.pashost", null);
        String scheme = property("debug.tt.passcheme", null);
        if ((wanted == null || wanted.isEmpty())
                && (scheme == null || scheme.isEmpty())) return url;

        int schemeEnd = url.indexOf("://");
        if (schemeEnd < 0) return url;
        int pathStart = url.indexOf('/', schemeEnd + 3);
        String authority = url.substring(schemeEnd + 3,
                pathStart < 0 ? url.length() : pathStart);
        String replacementScheme = scheme == null || scheme.isEmpty()
                ? url.substring(0, schemeEnd) : scheme;
        String replacementAuthority = wanted == null || wanted.isEmpty() ? authority : wanted;
        if (replacementScheme.equals(url.substring(0, schemeEnd)) && authority.equals(replacementAuthority)) {
            return url;
        }
        android.util.Log.i(PASSPORT_TAG, "passport host -> " + replacementScheme + "://"
                + replacementAuthority + " was " + authority);
        return replacementScheme + "://" + replacementAuthority
                + (pathStart < 0 ? "" : url.substring(pathStart));
    }

    /**
     * The finished query carries ts and app_type twice, from two layers that each contribute the
     * common parameters.
     */
    private static String dedupeQuery(String url) {
        int queryStart = url.indexOf('?');
        if (queryStart < 0) return url;

        java.util.Set<String> seen = new java.util.LinkedHashSet<>();
        StringBuilder kept = new StringBuilder();
        StringBuilder dropped = new StringBuilder();
        for (String pair : url.substring(queryStart + 1).split("&")) {
            if (pair.isEmpty()) continue;
            int equals = pair.indexOf('=');
            String name = equals < 0 ? pair : pair.substring(0, equals);
            if (!seen.add(name)) {
                if (dropped.length() > 0) dropped.append(',');
                dropped.append(name);
                continue;
            }
            if (kept.length() > 0) kept.append('&');
            kept.append(pair);
        }
        if (dropped.length() == 0) return url;

        android.util.Log.i(PASSPORT_TAG, "passport query -> dropped repeated " + dropped);
        return url.substring(0, queryStart + 1) + kept;
    }

    /** Re-tags the identity fields of a passport URL to the selected app, if a selection is set. */
    private static String applyPassportIdentity(String url) {
        String wanted = property("debug.tt.pasid", null);
        if (wanted == null || wanted.isEmpty()) return url;

        for (String[] identity : PASSPORT_IDENTITIES) {
            if (!identity[0].equals(wanted)) continue;
            String rewritten = replace(replace(url, "aid", identity[1]), "app_name", identity[2]);
            rewritten = replace(rewritten, "passport-sdk-version", identity[5]);
            if (!identity[3].isEmpty()) {
                rewritten = replace(replace(rewritten, "version_code", identity[3]),
                        "manifest_version_code", identity[3]);
                rewritten = replace(rewritten, "update_version_code", identity[3]);
            }
            if (!identity[4].isEmpty()) {
                rewritten = replace(replace(rewritten, "version_name", identity[4]),
                        "ab_version", identity[4]);
                rewritten = replace(rewritten, "build_number", identity[4]);
            }
            android.util.Log.i(PASSPORT_TAG, "passport id -> " + wanted + " aid=" + identity[1]);
            return rewritten;
        }
        return url;
    }

    /** Mints a fresh device for the passport debug switch. */
    private static String swapDevice(String url) {
        if (!"rand".equals(property("debug.tt.pasdev", null))) return url;

        String[] fresh = freshDevice();
        String swapped = replace(replace(url, "iid", fresh[0]), "device_id", fresh[1]);
        swapped = replace(replace(swapped, "cdid", fresh[2]), "openudid", fresh[3]);
        android.util.Log.i(PASSPORT_TAG, "passport device -> a fresh device for this process");
        return swapped;
    }

    private static String[] sFreshDevice;

    /** One device per process: the throttle is keyed to it, so it must not move mid-request. */
    private static synchronized String[] freshDevice() {
        if (sFreshDevice == null) {
            java.util.Random random = new java.util.Random();
            sFreshDevice = new String[] {
                String.valueOf(7_000_000_000_000_000_000L
                        + (random.nextLong() & Long.MAX_VALUE) % 1_000_000_000_000_000_000L),
                String.valueOf(7_000_000_000_000_000_000L
                        + (random.nextLong() & Long.MAX_VALUE) % 1_000_000_000_000_000_000L),
                java.util.UUID.randomUUID().toString(),
                String.format(java.util.Locale.US, "%016x",
                        random.nextLong() & Long.MAX_VALUE),
            };
        }
        return sFreshDevice;
    }

    private static String replace(String url, String name, String value) {
        return Pattern.compile("([?&])" + name + "=[^&]*").matcher(url)
                .replaceAll("$1" + java.util.regex.Matcher.quoteReplacement(name + "=" + value));
    }

    /** A system property, read the way the platform reads one — no public Java API for it. */
    static String property(String name, String fallback) {
        try {
            Object value = Class.forName("android.os.SystemProperties")
                    .getMethod("get", String.class, String.class)
                    .invoke(null, name, fallback);
            return value instanceof String ? (String) value : fallback;
        } catch (Throwable failure) {
            return fallback;
        }
    }

    /** Applies the passport header diagnostics and cleanup before the request is signed. */
    private static Object guardPassport(Object request, String url) {
        if (!url.contains("/passport/")) return request;
        return passportHeaders(retagSdkVersion(passportUserAgent(request)));
    }

    private static final String PASSPORT_TAG = "TikTokTVLogin";

    /** The signing layers below this hook are the identity this patch cannot rewrite. */
    private static Object passportHeaders(Object request) {
        boolean report = "1".equals(property("debug.tt.pashdr", null));
        String drop = property("debug.tt.pasdrop", null);
        String dup = property("debug.tt.pashdup", null);
        if (!report && (drop == null || drop.isEmpty()) && !isCopy(dup)) return request;

        try {
            Object headers = invokeNoArg(request, "c");
            if (!(headers instanceof java.util.List)) return request;
            java.util.List<?> current = (java.util.List<?>) headers;

            java.util.Set<String> unwanted = new java.util.HashSet<>();
            if (drop != null) {
                for (String name : drop.split(",")) {
                    String trimmed = name.trim().toLowerCase(java.util.Locale.US);
                    if (!trimmed.isEmpty()) unwanted.add(trimmed);
                }
            }

            java.util.Set<String> keepIndex = new java.util.HashSet<>();
            if ("last".equals(dup)) {
                // Walking backwards keeps only the final copy of each name.
                java.util.Set<String> taken = new java.util.HashSet<>();
                for (int i = current.size() - 1; i >= 0; i--) {
                    Object name = current.get(i) == null ? null : invokeNoArg(current.get(i), "a");
                    if (!(name instanceof String)) {
                        keepIndex.add(String.valueOf(i));
                        continue;
                    }
                    if (taken.add(((String) name).toLowerCase(java.util.Locale.US))) {
                        keepIndex.add(String.valueOf(i));
                    }
                }
            }

            java.util.List<Object> kept = new java.util.ArrayList<>();
            StringBuilder names = new StringBuilder();
            java.util.Set<String> seen = new java.util.HashSet<>();
            int dropped = 0;
            for (int i = 0; i < current.size(); i++) {
                Object header = current.get(i);
                Object name = header == null ? null : invokeNoArg(header, "a");
                if (!(name instanceof String)) {
                    kept.add(header);
                    continue;
                }
                String lower = ((String) name).toLowerCase(java.util.Locale.US);
                if (report) {
                    if (names.length() > 0) names.append(' ');
                    Object value = invokeNoArg(header, "b");
                    names.append((String) name).append('(').append(value instanceof String
                            ? ((String) value).length() : 0).append(')');
                }
                if (unwanted.contains(lower)) {
                    dropped++;
                    continue;
                }
                if ("first".equals(dup) && !seen.add(lower)) {
                    dropped++;
                    continue;
                }
                if ("last".equals(dup) && !keepIndex.contains(String.valueOf(i))) {
                    dropped++;
                    continue;
                }
                seen.add(lower);
                kept.add(header);
            }

            String path = pathOf(String.valueOf(invokeNoArg(request, "b")));
            if (report) {
                android.util.Log.i(PASSPORT_TAG, "passport headers " + path + " -> " + names);
                android.util.Log.i(PASSPORT_TAG, "passport transport " + path + " -> "
                        + transportReport());
            }
            if (dropped == 0) return request;

            Object builder = invokeNoArg(request, "m");
            builder.getClass().getMethod("a", java.util.List.class).invoke(builder, kept);
            android.util.Log.i(PASSPORT_TAG, "passport headers " + path + " -> dropped " + dropped
                    + " of " + current.size());
            return invokeNoArg(builder, "a");
        } catch (Throwable failure) {
            return request;
        }
    }

    /** Reports which HTTP stack carries the request. */
    private static String transportReport() {
        try {
            Class<?> selector = Class.forName("com.bytedance.ttnet.c");
            StringBuilder out = new StringBuilder("cronet=")
                    .append(selector.getMethod("a").invoke(null));
            for (java.lang.reflect.Field field : selector.getDeclaredFields()) {
                if (!java.lang.reflect.Modifier.isStatic(field.getModifiers())) continue;
                field.setAccessible(true);
                Class<?> type = field.getType();
                if (type == boolean.class) {
                    out.append(' ').append(field.getName()).append('=')
                            .append(field.getBoolean(null));
                } else if (type == String.class) {
                    String value = (String) field.get(null);
                    out.append(' ').append(field.getName()).append('=')
                            .append(value == null ? "null"
                                    : value.substring(0, Math.min(value.length(), 70)));
                }
            }
            return out.toString();
        } catch (Throwable failure) {
            return "unreadable " + failure.getClass().getSimpleName();
        }
    }

    private static boolean isCopy(String mode) {
        return "first".equals(mode) || "last".equals(mode);
    }

    /** Transport report budget for non-passport requests. */
    private static int sTransportSamples;

    /** Reports the gate beside a request the gateway answers. */
    private static void reportTransport(String url) {
        if (!"1".equals(property("debug.tt.pashdr", null))) return;
        if (url.contains("/passport/") || sTransportSamples >= 3) return;
        sTransportSamples++;
        android.util.Log.i(PASSPORT_TAG, "transport sample " + sTransportSamples + " of "
                + pathOf(url) + " -> " + transportReport());
    }

    /** Keeps the passport SDK version the headers report the same one the query reports. */
    private static Object retagSdkVersion(Object request) {
        String wanted = property("debug.tt.pasid", null);
        if (wanted == null || wanted.isEmpty()) return request;

        for (String[] identity : PASSPORT_IDENTITIES) {
            if (identity[0].equals(wanted)) return setHeader(request, "passport-sdk-version",
                    identity[5]);
        }
        return request;
    }

    /** A Lite-shaped User-Agent used by the passport diagnostics. */
    private static final String LITE_USER_AGENT =
            "com.zhiliaoapp.musically.go/430265 (Linux; U; Android 12; vi_VN; SM-A515F;"
                    + " Build/SP1A.210812.016;tt-ok/3.10.0.2)";

    private static Object passportUserAgent(Object request) {
        if (!"1".equals(property("debug.tt.pasua", null))) return request;
        try {
            Object headers = invokeNoArg(request, "c");
            if (!(headers instanceof java.util.List)) return request;

            java.util.List<Object> kept = new java.util.ArrayList<>((java.util.List<?>) headers);
            Object header = header("User-Agent", LITE_USER_AGENT);
            if (header != null) kept.add(header);
            Object builder = invokeNoArg(request, "m");
            builder.getClass().getMethod("a", java.util.List.class).invoke(builder, kept);
            android.util.Log.i(PASSPORT_TAG, "passport ua -> a Lite app agent on "
                    + pathOf(String.valueOf(invokeNoArg(request, "b"))));
            return invokeNoArg(builder, "a");
        } catch (Throwable failure) {
            return request;
        }
    }

    /** Replaces one header, and drops its second copy: two values for one name is one too many. */
    private static Object setHeader(Object request, String name, String value) {
        try {
            Object headers = invokeNoArg(request, "c");
            if (!(headers instanceof java.util.List)) return request;

            java.util.List<Object> kept = new java.util.ArrayList<>();
            boolean replaced = false;
            for (Object header : (java.util.List<?>) headers) {
                Object current = header == null ? null : invokeNoArg(header, "a");
                if (current instanceof String && ((String) current).equalsIgnoreCase(name)) {
                    if (replaced) continue;
                    Object replacement = header(name, value);
                    if (replacement == null) return request;
                    kept.add(replacement);
                    replaced = true;
                    continue;
                }
                kept.add(header);
            }
            if (!replaced) return request;

            Object builder = invokeNoArg(request, "m");
            builder.getClass().getMethod("a", java.util.List.class).invoke(builder, kept);
            return invokeNoArg(builder, "a");
        } catch (Throwable failure) {
            return request;
        }
    }

    /** The id triplet this client registers under, read off the first query the transport signed. */
    private static volatile String[] sWireIds;

    static String wireId(String name) {
        String[] ids = sWireIds;
        if (ids == null) return null;
        switch (name) {
            case "device_id": return ids[0];
            case "iid": return ids[1];
            case "aid": return ids[2];
            default: return null;
        }
    }

    private static void captureWireIds(String url) {
        if (sWireIds != null) return;
        int queryStart = url.indexOf('?');
        if (queryStart < 0) return;

        String deviceId = null;
        String installId = null;
        String appId = null;
        for (String pair : url.substring(queryStart + 1).split("&")) {
            int equals = pair.indexOf('=');
            if (equals < 0) continue;
            String name = pair.substring(0, equals);
            String value = pair.substring(equals + 1);
            if (name.isEmpty() || value.isEmpty()) continue;
            if (deviceId == null && name.equals("device_id")) deviceId = value;
            else if (installId == null && name.equals("iid")) installId = value;
            else if (appId == null && name.equals("aid")) appId = value;
        }
        if (deviceId == null) return;
        sWireIds = new String[] {deviceId, installId, appId};
        android.util.Log.i(PASSPORT_TAG, "wire ids -> captured device/iid/aid"
                + (installId == null ? " (no iid)" : "") + (appId == null ? " (no aid)" : ""));
    }

    /** Logs the passport request shape without secrets. */
    private static void logPassportShape(String url) {
        int pathStart = url.indexOf("/passport/");
        if (pathStart < 0) return;

        int queryStart = url.indexOf('?', pathStart);
        String path = queryStart < 0 ? url.substring(pathStart) : url.substring(pathStart, queryStart);
        StringBuilder params = new StringBuilder();
        int count = 0;
        if (queryStart >= 0) {
            for (String pair : url.substring(queryStart + 1).split("&")) {
                count++;
                if (params.length() > 0) params.append(' ');
                params.append(redact(pair));
            }
        }
        android.util.Log.i(PASSPORT_TAG, "passport wire -> path=" + path
                + " params=" + count + " " + params);
    }

    /** Formats one query parameter for the diagnostic log, hiding secret values. */
    private static String redact(String pair) {
        int equals = pair.indexOf('=');
        String name = equals < 0 ? pair : pair.substring(0, equals);
        String lower = name.toLowerCase(java.util.Locale.US);
        if (lower.contains("sign") || lower.contains("ticket") || lower.contains("token")
                || lower.contains("password") || lower.contains("email") || lower.contains("mobile")
                || lower.contains("user") || lower.contains("secret")) return name + "=[hidden]";
        return pair;
    }

    /** Logs passport form field names, never their values. */
    private static String bodyFields(Object body) {
        if (body == null) return "none";
        try {
            final java.io.ByteArrayOutputStream out = new java.io.ByteArrayOutputStream();
            java.io.OutputStream sink = new java.io.OutputStream() {
                @Override public void write(int b) { out.write(b); }
                @Override public void write(byte[] b, int off, int len) { out.write(b, off, len); }
            };
            body.getClass().getMethod("writeTo", java.io.OutputStream.class)
                    .invoke(body, sink);
            StringBuilder names = new StringBuilder();
            for (String pair : out.toString("UTF-8").split("&")) {
                int equals = pair.indexOf('=');
                if (equals < 0) continue;
                if (names.length() > 0) names.append(' ');
                names.append(pair.substring(0, equals));
            }
            return "{" + names + "}";
        } catch (Throwable failure) {
            return "unreadable:" + failure.getClass().getSimpleName();
        }
    }

    private static void logAnswerShape(String url, Object response) {
        if (!sample(url)) return;
        android.util.Log.i(PASSPORT_TAG, "answer -> path=" + pathOf(url)
                + " " + (isEmpty(response) ? "empty" : "body"));
        logAnswerDetail(url, response);
    }

    /** Logs transport and request shape for sampled endpoints. */
    private static void logRequestShape(Object request) {
        if (request == null) return;
        try {
            Object url = invokeNoArg(request, "b");
            if (!(url instanceof String) || !sample((String) url)) return;

            StringBuilder names = new StringBuilder();
            Object headers = invokeNoArg(request, "c");
            if (headers instanceof java.util.List) {
                for (Object header : (java.util.List<?>) headers) {
                    if (header == null) continue;
                    Object name = invokeNoArg(header, "a");
                    if (!(name instanceof String)) continue;
                    if (names.length() > 0) names.append(' ');
                    names.append(name);
                }
            }
            String body = "none";
            Object output = invokeNoArg(request, "d");
            if (output != null) {
                Object length = output.getClass().getMethod("length").invoke(output);
                Object mime = output.getClass().getMethod("mimeType").invoke(output);
                body = length + "B " + mime + (String.valueOf(url).contains("/passport/")
                        ? " " + bodyFields(output) : "");
            }
            android.util.Log.i(PASSPORT_TAG, "send -> " + invokeNoArg(request, "a")
                    + " " + pathOf((String) url) + " body{" + body + "} headers{" + names + "}");
        } catch (Throwable ignored) {
            // Diagnostics never get to break a request.
        }
    }

    /** Endpoints worth a line: passport always, the rest until the budget is spent. */
    private static boolean sample(String url) {
        if (url == null) return false;
        if (url.contains("/passport/")) return true;
        String key = pathOf(url);
        if (SAMPLED.contains(key)) return true;
        if (SAMPLE_BUDGET.get() <= 0) return false;
        SAMPLE_BUDGET.decrementAndGet();
        SAMPLED.add(key);
        return true;
    }

    private static final java.util.Set<String> SAMPLED =
            java.util.Collections.synchronizedSet(new java.util.HashSet<String>());
    private static final java.util.concurrent.atomic.AtomicInteger SAMPLE_BUDGET =
            new java.util.concurrent.atomic.AtomicInteger(40);

    static Object invokeNoArg(Object target, String name) throws Throwable {
        return target.getClass().getMethod(name).invoke(target);
    }

    /** One header in the class a retrofit request carries. */
    private static Constructor<?> sHeaderConstructor;

    static Object header(String name, String value) {
        try {
            Constructor<?> constructor = sHeaderConstructor;
            if (constructor == null) {
                constructor = Class.forName("com.bytedance.retrofit2.b.b")
                        .getConstructor(String.class, String.class);
                sHeaderConstructor = constructor;
            }
            return constructor.newInstance(name, value);
        } catch (Throwable failure) {
            return null;
        }
    }

    /** Names whose value could be a session secret rather than a diagnostic, so they are logged by name only. */
    private static boolean isSecretHeader(String name) {
        String lower = name.toLowerCase(java.util.Locale.US);
        // The guard verdict is a status code the server assigns to our attestation, and the only
        // readout of whether it accepted it. A key check reports its length, never its bytes.
        if (lower.equals("tt-ticket-guard-result") || lower.equals("tt-ticket-guard-version")
                || lower.equals("tt-ticket-guard-iteration-version")) return false;
        return lower.contains("cookie") || lower.contains("token") || lower.contains("sign")
                || lower.contains("authorization") || lower.contains("ticket")
                || lower.contains("session");
    }

    /** Status and headers of a sampled answer, read off the raw response by reflection. */
    private static void logAnswerDetail(String url, Object response) {
        if (url == null || response == null) return;
        try {
            Object raw = invokeNoArg(response, "b");
            if (raw == null) return;
            Object status = invokeNoArg(raw, "b");
            StringBuilder headers = new StringBuilder();
            for (Object header : headerList(raw)) {
                Object name = invokeNoArg(header, "a");
                if (!(name instanceof String)) continue;
                if (headers.length() > 0) headers.append(' ');
                headers.append(name);
                if ("set-cookie".equalsIgnoreCase((String) name)) {
                    // The cookie's name is the diagnostic; its value is the session secret.
                    headers.append('[').append(cookieName(invokeNoArg(header, "b"))).append(']');
                    continue;
                }
                if (isSecretHeader((String) name)) {
                    headers.append("=[hidden]");
                    continue;
                }
                headers.append('=').append(invokeNoArg(header, "b"));
            }
            android.util.Log.i(PASSPORT_TAG, "detail -> path=" + pathOf(url)
                    + " http=" + status + " headers{" + headers + "}");
        } catch (Throwable ignored) {
            // Diagnostics never get to break a request.
        }
    }

    private static java.util.List<?> headerList(Object raw) throws Throwable {
        Object list = invokeNoArg(raw, "d");
        return list instanceof java.util.List ? (java.util.List<?>) list
                : java.util.Collections.emptyList();
    }

    private static String cookieName(Object setCookieValue) {
        if (!(setCookieValue instanceof String)) return "?";
        int equals = ((String) setCookieValue).indexOf('=');
        return equals < 0 ? (String) setCookieValue : ((String) setCookieValue).substring(0, equals);
    }

    /** Copies passport answer cookies into the WebView jar. */
    private static void seedPassportCookies(String url, Object response) {
        if (url == null || !url.contains("/passport/") || response == null) return;
        try {
            Object raw = invokeNoArg(response, "b");
            if (raw == null) return;
            android.webkit.CookieManager jar = android.webkit.CookieManager.getInstance();
            jar.setAcceptCookie(true);
            for (Object header : headerList(raw)) {
                if (!"set-cookie".equalsIgnoreCase(String.valueOf(invokeNoArg(header, "a")))) continue;
                String value = String.valueOf(invokeNoArg(header, "b"));
                if (value.isEmpty() || "null".equals(value)) continue;
                jar.setCookie(url, value);
            }
        } catch (Throwable ignored) {
            // Diagnostics never get to break a request.
        }
    }

    private static String rewriteUrl(String url) {
        if (!requiresTvIdentity(url)) return null;

        String base = relocateRetiredPath(url);
        String rewritten = APP_NAME.matcher(AID.matcher(base).replaceAll("$1aid=" + TV_AID))
                .replaceAll("$1app_name=" + TV_APP_NAME);
        if (ATTEMPT.get() != null && ATTEMPT.get() > 0) {
            rewritten = freshenTimestamps(rotateIdentity(rewritten));
        }
        if (rewritten.equals(url)) return null;

        SearchDebug.logRetagged(rewritten);
        return rewritten;
    }

    /** Relocates retired URL constants to their Lite paths. */
    private static String relocateRetiredPath(String url) {
        return url.replace("/aweme/v1/tv/user/profile/self/", "/lite/v2/user/profile/self/");
    }

    /** Rewrites liked and repost list requests to the matching Lite route. */
    private static String rewriteLikedList(String url) {
        if (!url.contains("/aweme/v1/aweme/tv/favorite/")
                && !url.contains("/tiktok/v1/upvote/item/list")
                && !url.contains("/lite/v1/relation/like-items")) {
            return null;
        }
        String uid = queryValue(url, "user_id");
        String self = currentUid();
        boolean currentUser = uid != null && self != null && uid.equals(self);
        // The Repost tab reuses LIKED_VIDEOS and the same Retrofit method as Liked videos, so
        // the grid view model's request-time marker is the only thing that distinguishes them.
        boolean repostGrid = ProfileLists.isRepostGrid();

        String out;
        if (currentUser && !repostGrid) {
            out = url.replace("/aweme/v1/aweme/tv/favorite/", "/lite/v1/relation/like-items")
                    .replace("/tiktok/v1/upvote/item/list", "/lite/v1/relation/like-items");
            out = appendIfMissing(out, "min_cursor", "0");
            out = appendIfMissing(out, "invalid_item_count", "0");
            out = appendIfMissing(out, "is_hiding_invalid_item", "0");
            out = appendIfMissing(out, "hotsoon_filtered_count", "0");
            out = appendIfMissing(out, "hotsoon_has_more", "0");
        } else {
            out = url.replace("/aweme/v1/aweme/tv/favorite/", "/tiktok/v1/upvote/item/list")
                    .replace("/lite/v1/relation/like-items", "/tiktok/v1/upvote/item/list");
            out = out.replace("max_cursor=", "offset=");
        }
        return out.equals(url) ? null : out;
    }

    /**
     * Lite's relation lists expect the parameters its own caller sends: `offset`, `count`,
     * `source_type` and `request_tag_from`.
     */
    private static String ensureProfileListQuery(String url) {
        if (!url.contains("/lite/v2/relation/follower/list/")
                && !url.contains("/lite/v2/relation/following/list/")) {
            return null;
        }
        String out = appendIfMissing(url, "count", "20");
        out = appendIfMissing(out, "source_type", "1");
        out = appendIfMissing(out, "request_tag_from", "h5");
        if (queryValue(out, "offset") == null) {
            String maxTime = queryValue(out, "max_time");
            out = append(out, "offset=" + (maxTime == null ? "0" : maxTime));
        }
        return out.equals(url) ? null : out;
    }

    /** The foreground uid the TV user store reads, or null when the app is a guest. */
    private static String currentUid() {
        try {
            Object uid = Class.forName("com.ss.android.ugc.aweme.an.e")
                    .getMethod("d").invoke(null);
            return uid == null ? null : String.valueOf(uid);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static String appendIfMissing(String url, String key, String value) {
        return queryValue(url, key) == null ? append(url, key + "=" + value) : url;
    }

    private static String append(String url, String parameter) {
        return url + (url.indexOf('?') < 0 ? "?" : "&") + parameter;
    }

    private static String queryValue(String url, String name) {
        String marker = "?" + name + "=";
        int start = url.indexOf(marker);
        if (start < 0) {
            marker = "&" + name + "=";
            start = url.indexOf(marker);
        }
        if (start < 0) return null;
        int valueStart = start + marker.length();
        int end = url.indexOf('&', valueStart);
        return end < 0 ? url.substring(valueStart) : url.substring(valueStart, end);
    }

    /** Adds the repost scene parameter before the request is signed. */
    private static String ensureRepostScene(String url) {
        if (!url.contains("/tiktok/v1/upvote/item/list")) return null;
        if (url.contains("scene=")) return null;
        return append(url, "scene=0");
    }

    /** Replaces device ids on retries. */
    private static String rotateIdentity(String url) {
        return CDID.matcher(IID.matcher(url).replaceAll("$1iid=" + nextNumericId()))
                .replaceAll("$1cdid=" + java.util.UUID.randomUUID());
    }

    /** A 19-digit decimal id in the shape the registration service hands out for `iid`. */
    private static String nextNumericId() {
        long value = java.util.concurrent.ThreadLocalRandom.current().nextLong(1_000_000_000_000_000_000L,
                Long.MAX_VALUE);
        return Long.toString(value);
    }

    /** Refreshes request timestamps on retries. */
    private static String freshenTimestamps(String url) {
        long seconds = System.currentTimeMillis() / 1000L;
        return RTICKET.matcher(TS.matcher(url).replaceAll("$1ts=" + seconds))
                .replaceAll("$1_rticket=" + (seconds * 1000L));
    }

    private static boolean requiresTvIdentity(String url) {
        for (String path : TV_IDENTITY_PATHS) {
            if (url.contains(path)) return true;
        }
        return false;
    }

    /** Retries empty risk-engine answers with a fresh identity. */
    public static Object intercept(Object interceptor, Object chain) throws Throwable {
        Method proceed = interceptMethodOf(interceptor.getClass());
        boolean retryable = requiresTvIdentity(urlOf(requestOf(chain)));

        // The delegated call re-enters the patched `intercept`, so the guard has to cover every
        // delegation and not only the retrying branch, or the pass-through requests recurse.
        RETRYING.set(Boolean.TRUE);
        try {
            if (!retryable) {
                Object request = requestOf(chain);
                String url = urlOf(request);
                logRequestShape(request);
                try {
                    Object answer = invoke(proceed, interceptor, chain);
                    seedPassportCookies(url, answer);
                    logAnswerShape(url, answer);
                    return answer;
                } catch (Throwable failure) {
                    if (sample(url)) {
                        android.util.Log.i(PASSPORT_TAG, "answer -> path=" + pathOf(url)
                                + " thrown:" + failure.getClass().getSimpleName());
                    }
                    throw failure;
                }
            }

            Object target = interceptor;
            Object last = null;
            Throwable lastFailure = null;
            for (int attempt = 0; attempt <= EMPTY_RESPONSE_RETRIES; attempt++) {
                if (attempt > 0) {
                    target = freshInterceptor(interceptor);
                    if (target == null) break;
                    sleepBeforeRetry();
                }
                ATTEMPT.set(attempt);
                try {
                    last = invoke(proceed, target, chain);
                    lastFailure = null;
                    if (!isEmpty(last)) return last;
                } catch (Throwable throwable) {
                    if (!isSuppressed(throwable)) throw throwable;
                    lastFailure = throwable;
                } finally {
                    ATTEMPT.remove();
                }
                SearchDebug.logRetry(pathOf(urlOf(requestOf(chain)))
                        + " attempt " + (attempt + 1) + " suppressed");
            }
            if (lastFailure != null) throw lastFailure;
            return last;
        } finally {
            RETRYING.remove();
        }
    }

    /**
     * False while this thread is already inside #intercept, which lets the re-entered `intercept`
     * run its own body instead of wrapping itself again.
     */
    public static boolean shouldWrap() {
        return !Boolean.TRUE.equals(RETRYING.get());
    }

    /** Retry policy for suppressed requests. */
    private static final int EMPTY_RESPONSE_RETRIES = 4;

    /** Spacing between attempts; back-to-back copies of one request are what the engine punishes. */
    private static final long RETRY_DELAY_MS = 6000L;

    /** Set while this thread is inside its own retry loop, so the re-entry runs the real call. */
    private static final ThreadLocal<Boolean> RETRYING = new ThreadLocal<>();

    /** Which attempt {@link #rewrite} is serving, so a retry can carry a fresh request identity. */
    private static final ThreadLocal<Integer> ATTEMPT = new ThreadLocal<>();

    private static void sleepBeforeRetry() {
        try {
            Thread.sleep(RETRY_DELAY_MS);
        } catch (InterruptedException interrupted) {
            Thread.currentThread().interrupt();
        }
    }

    private static volatile Method interceptMethod;

    private static Method interceptMethodOf(Class<?> type) throws IOException {
        Method method = interceptMethod;
        if (method != null) return method;

        for (Method candidate : type.getDeclaredMethods()) {
            if (!candidate.getName().equals("intercept")
                    || candidate.getParameterTypes().length != 1
                    || !candidate.getParameterTypes()[0].getName().endsWith("$a")) continue;
            candidate.setAccessible(true);
            interceptMethod = candidate;
            return candidate;
        }
        throw new IOException("identity retry: no intercept(chain) on " + type.getName());
    }

    /** The interceptor refuses to run a second time ("Already executed."), so a retry needs an instance of its own. */
    private static Object freshInterceptor(Object interceptor) {
        try {
            Field factoryField = interceptor.getClass().getDeclaredField("a");
            factoryField.setAccessible(true);
            Object factory = factoryField.get(interceptor);

            for (Constructor<?> candidate : interceptor.getClass().getDeclaredConstructors()) {
                if (candidate.getParameterTypes().length != 1) continue;
                candidate.setAccessible(true);
                return candidate.newInstance(factory);
            }
        } catch (Throwable ignored) {
            // No fresh instance: the caller keeps the response or failure it already has.
        }
        return null;
    }

    private static Object invoke(Method method, Object target, Object argument) throws Throwable {
        try {
            return method.invoke(target, argument);
        } catch (InvocationTargetException exception) {
            throw exception.getCause();
        }
    }

    private static Object requestOf(Object chain) {
        try {
            Method getter = chain.getClass().getMethod("a");
            getter.setAccessible(true);
            return getter.invoke(chain);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static String urlOf(Object request) {
        try {
            Object url = request.getClass().getMethod("b").invoke(request);
            return url instanceof String ? (String) url : "";
        } catch (Throwable ignored) {
            return "";
        }
    }

    private static String pathOf(String url) {
        int scheme = url.indexOf("//");
        int query = url.indexOf('?');
        if (scheme < 0 || query < 0) return url;
        return url.substring(scheme + 2, query);
    }

    /** Gson's signal for a body that held nothing, as opposed to a transport or protocol error. */
    private static boolean isSuppressed(Throwable throwable) {
        for (int depth = 0; throwable != null && depth < 8; depth++, throwable = throwable.getCause()) {
            if (throwable.getClass().getName().endsWith("EOFException")) return true;
        }
        return false;
    }

    /** True when the transport answered with a zero-length body, which is the risk engine's block. */
    private static boolean isEmpty(Object response) {
        if (response == null) return true;
        try {
            Object raw = response.getClass().getMethod("b").invoke(response);
            if (raw == null) return false;
            Object body = raw.getClass().getMethod("e").invoke(raw);
            if (body == null) return false;
            Object length = body.getClass().getMethod("length").invoke(body);
            return length instanceof Number && ((Number) length).longValue() == 0L;
        } catch (Throwable ignored) {
            return false;
        }
    }
}
