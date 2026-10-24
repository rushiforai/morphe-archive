package app.proxma.mytelenor;

import android.content.Context;
import android.util.Log;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

public final class StreakClaim {

    private static final String TAG = "PROXMA_MT";
    private static final int TIMEOUT_MS = 15000;

    static String sResult = "n/a";

    private StreakClaim() {}

    public static String getResult() { return sResult; }

    public static boolean tryClaimStreak(Context context) {
        sResult = "n/a";
        try {
            return claimInner(context);
        } catch (Throwable t) {
            Log.i(TAG, "STREAK_ERR " + t);
            sResult = "error: " + t.getMessage();
            return false;
        }
    }

    private static boolean claimInner(Context context) throws Exception {
        String skip = AutoClaim.check(context, "streak");
        if (skip != null) {
            Log.i(TAG, "STREAK_SKIP " + skip);
            sResult = skip;
            return true;
        }

        String msisdn = AccountScope.msisdn(context);
        if (msisdn == null || msisdn.isEmpty()) {
            Log.i(TAG, "STREAK_SKIP no-msisdn");
            sResult = "no msisdn";
            return true;
        }
        AccountScope.saveMsisdn(context, msisdn);

        // Step 1: Get streak info via native URL getter
        String streakInfoUrl = resolveUrl("getDailyRewardList",
            "api/streak/info/" + msisdn + "/v2", msisdn);
        Log.i(TAG, "STREAK_INFO_START url=" + truncate(streakInfoUrl));
        HttpResult infoResult = httpGet(context, streakInfoUrl, msisdn);
        if (infoResult.code < 200 || infoResult.code >= 300) {
            Log.i(TAG, "STREAK_INFO_FAIL " + infoResult.code + " " + truncate(infoResult.body));
            sResult = "info fail " + infoResult.code;
            return false;
        }

        Log.i(TAG, "STREAK_INFO " + truncate(infoResult.body));

        // Step 2: Claim streak via native URL getter
        String claimUrl = resolveUrl("getActivateStreakOffer", "api/streak/claim");
        String body = "{\"msisdn\":\"" + msisdn + "\"}";
        Log.i(TAG, "STREAK_CLAIM_START");
        HttpResult claimResult = httpPost(context, claimUrl, body, msisdn);

        if (claimResult.code >= 200 && claimResult.code < 300) {
            AutoClaim.latch(context, "streak");
            Log.i(TAG, "STREAK_CLAIMED " + claimResult.code + " " + truncate(claimResult.body));
            sResult = "claimed";
            return true;
        }

        // Already claimed or other terminal states
        if (claimResult.code == 409 || claimResult.code == 400) {
            String bodyLower = claimResult.body != null ? claimResult.body.toLowerCase() : "";
            if (bodyLower.contains("already") || bodyLower.contains("claimed")
                || bodyLower.contains("not eligible") || bodyLower.contains("not available")) {
                AutoClaim.latch(context, "streak");
                Log.i(TAG, "STREAK_ALREADY " + claimResult.code + " " + truncate(claimResult.body));
                sResult = "already claimed";
                return true;
            }
        }

        Log.i(TAG, "STREAK_FAIL " + claimResult.code + " " + truncate(claimResult.body));
        sResult = "fail " + claimResult.code;
        return false;
    }

    // --- HTTP with full header pipeline ---

    static final class HttpResult {
        final int code;
        final String body;
        HttpResult(int code, String body) { this.code = code; this.body = body; }
    }

    static HttpResult httpGet(Context context, String urlStr, String msisdn) throws Exception {
        HttpURLConnection conn = (HttpURLConnection) new URL(urlStr).openConnection();
        try {
            conn.setRequestMethod("GET");
            addHeaders(conn, context, null, msisdn);
            conn.setConnectTimeout(TIMEOUT_MS);
            conn.setReadTimeout(TIMEOUT_MS);
            return readResponse(conn);
        } finally {
            conn.disconnect();
        }
    }

    static HttpResult httpPost(Context context, String urlStr, String body, String msisdn) throws Exception {
        HttpURLConnection conn = (HttpURLConnection) new URL(urlStr).openConnection();
        try {
            conn.setRequestMethod("POST");
            addHeaders(conn, context, body, msisdn);
            conn.setConnectTimeout(TIMEOUT_MS);
            conn.setReadTimeout(TIMEOUT_MS);
            conn.setDoOutput(true);
            OutputStream out = conn.getOutputStream();
            out.write(body.getBytes("UTF-8"));
            out.flush();
            out.close();
            return readResponse(conn);
        } finally {
            conn.disconnect();
        }
    }

    private static HttpResult readResponse(HttpURLConnection conn) throws Exception {
        int code = conn.getResponseCode();
        java.io.InputStream stream = (code >= 200 && code < 300)
            ? conn.getInputStream() : conn.getErrorStream();
        StringBuilder text = new StringBuilder();
        if (stream != null) {
            BufferedReader reader = new BufferedReader(new InputStreamReader(stream));
            String line;
            while ((line = reader.readLine()) != null) text.append(line);
            reader.close();
        }
        return new HttpResult(code, text.toString());
    }

    private static void addHeaders(HttpURLConnection conn, Context context, String body, String msisdn) {
        // Static headers
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setRequestProperty("Accept", "application/json");
        conn.setRequestProperty("X-request-os", "Android");
        conn.setRequestProperty("X-app-version", "4.2.63");
        conn.setRequestProperty("X-app-build-version", "4.2.63");
        conn.setRequestProperty("X-os-version", android.os.Build.VERSION.RELEASE);
        conn.setRequestProperty("X-request-channel", "DCE-APP-ANDROID");
        conn.setRequestProperty("X-app-language", "EN");

        // Dynamic headers from app singletons
        try {
            // NetworkHeader singleton
            Class<?> nhClass = Class.forName("com.telenor.pakistan.mytelenor.BaseApp.NetworkHeader");
            Object nh = nhClass.getMethod("c").invoke(null);
            if (nh != null) {
                setIfNonEmpty(conn, "X-user-price-plan", invoke(nh, "g"));
                setIfNonEmpty(conn, "X-user-segment", invoke(nh, "h"));
                setIfNonEmpty(conn, "x-user-segment-type", invoke(nh, "i"));
                setIfNonEmpty(conn, "x-user-package-plan", invoke(nh, "f"));
                setIfNonEmpty(conn, "x-user-plan-type", invoke(nh, "e"));
            }
        } catch (Throwable t) {
            Log.i(TAG, "HDR_NH_ERR " + t.getClass().getSimpleName());
        }

        // Device info
        conn.setRequestProperty("X-device-make", android.os.Build.MANUFACTURER);
        conn.setRequestProperty("X-device-model", android.os.Build.MODEL);

        // Screen resolution — best-effort from the app's own utility
        try {
            Class<?> p0Class = Class.forName("com.telenor.pakistan.mytelenor.Utils.p0");
            String resolution = (String) p0Class.getMethod("P", Context.class).invoke(null, context);
            if (resolution != null && !resolution.isEmpty()) {
                conn.setRequestProperty("X-screen-resolution", resolution);
            }
        } catch (Throwable ignored) {}

        // Device ID
        try {
            Class<?> vClass = Class.forName("com.telenor.pakistan.mytelenor.Utils.v");
            String deviceId = (String) vClass.getMethod("f").invoke(null);
            if (deviceId != null && !deviceId.isEmpty()) {
                conn.setRequestProperty("X-device-id", deviceId);
            }
        } catch (Throwable t) {
            Log.i(TAG, "HDR_DEVID_ERR " + t.getClass().getSimpleName());
        }

        // Xenon tokens — mirror the app's dedupe: when v1 == v2, only send V2
        try {
            Class<?> vClass = Class.forName("com.telenor.pakistan.mytelenor.Utils.v");
            String xenon = (String) vClass.getMethod("h").invoke(null);
            String xenonV2 = (String) vClass.getMethod("i").invoke(null);
            boolean same = (xenon != null && xenon.equals(xenonV2));
            if (!same && xenon != null && !xenon.isEmpty()) {
                conn.setRequestProperty("X-XENON-TOKEN", xenon);
            }
            if (xenonV2 != null && !xenonV2.isEmpty()) {
                conn.setRequestProperty("X-XENON-TOKEN-V2", xenonV2);
            }
        } catch (Throwable t) {
            Log.i(TAG, "HDR_XENON_ERR " + t.getClass().getSimpleName());
        }

        // Signature (NdkHeader.d(payload, customerCode, packagePlan))
        try {
            String customerCode = "";
            String packagePlan = "";
            try {
                Class<?> nhClass = Class.forName("com.telenor.pakistan.mytelenor.BaseApp.NetworkHeader");
                Object nh = nhClass.getMethod("c").invoke(null);
                if (nh != null) {
                    String cc = invoke(nh, "b");
                    if (cc != null && !cc.isEmpty()) customerCode = cc;
                    String pp = invoke(nh, "f");
                    if (pp != null && !pp.isEmpty()) packagePlan = pp;
                }
            } catch (Throwable ignored) {}
            // Persist for cold-start (WorkManager without live singletons)
            android.content.SharedPreferences sp = context.getSharedPreferences("proxma_mytelenor", 0);
            if (!customerCode.isEmpty()) {
                sp.edit().putString("proxma_cc", customerCode).putString("proxma_pp", packagePlan).apply();
            } else {
                customerCode = sp.getString("proxma_cc", "");
                packagePlan = sp.getString("proxma_pp", "");
            }

            Class<?> ndkClass = Class.forName("com.telenor.pakistan.mytelenor.newstructure.utils.NdkHeader");
            // The actual class is obfuscated to 'l' but JADX maps NdkHeader
            // Try the singleton approach: NdkHeader (aka l) has f28661a static instance
            Object ndkInstance = null;
            try {
                ndkInstance = ndkClass.getField("f28661a").get(null);
            } catch (Throwable t2) {
                // Try alternate: class 'l' in newstructure.utils
                try {
                    Class<?> lClass = Class.forName("com.telenor.pakistan.mytelenor.newstructure.utils.l");
                    ndkInstance = lClass.getField("f28661a").get(null);
                    ndkClass = lClass;
                } catch (Throwable t3) {
                    Log.i(TAG, "NDK_SINGLETON_ERR " + t3.getClass().getSimpleName());
                }
            }

            if (ndkInstance != null) {
                String sig = (String) ndkClass.getMethod("d", String.class, String.class, String.class)
                    .invoke(ndkInstance, body != null ? body : "", customerCode, packagePlan);
                if (sig != null && !sig.isEmpty()) {
                    conn.setRequestProperty("signature", sig);
                }
            }
        } catch (Throwable t) {
            Log.i(TAG, "HDR_SIG_ERR " + t.getClass().getSimpleName());
        }
    }

    private static void setIfNonEmpty(HttpURLConnection conn, String header, String value) {
        if (value != null && !value.isEmpty()) {
            conn.setRequestProperty(header, value);
        }
    }

    @SuppressWarnings("unchecked")
    private static <T> T invoke(Object target, String method) {
        try {
            return (T) target.getClass().getMethod(method).invoke(target);
        } catch (Throwable t) {
            return null;
        }
    }

    static String getBaseUrl() {
        Object endpoints = getEndpointsSingleton();
        if (endpoints != null) {
            try {
                return (String) endpoints.getClass().getMethod("getBaseUrl").invoke(endpoints);
            } catch (Throwable t) {
                Log.i(TAG, "BASE_URL_INVOKE_ERR " + t.getClass().getSimpleName());
            }
        }
        return null;
    }

    static String resolveUrl(String nativeMethodName, String fallbackPath) {
        Object endpoints = getEndpointsSingleton();
        if (endpoints != null) {
            try {
                String url = (String) endpoints.getClass()
                    .getMethod(nativeMethodName).invoke(endpoints);
                if (url != null && !url.isEmpty()) return url;
            } catch (Throwable t) {
                Log.i(TAG, "URL_" + nativeMethodName + "_ERR " + t.getClass().getSimpleName());
            }
        }
        String base = getBaseUrl();
        if (base == null) base = "https://galvorn.telenor.com.pk/";
        return base + fallbackPath;
    }

    static String resolveUrl(String nativeMethodName, String fallbackPath, String arg) {
        Object endpoints = getEndpointsSingleton();
        if (endpoints != null) {
            try {
                String url = (String) endpoints.getClass()
                    .getMethod(nativeMethodName, String.class).invoke(endpoints, arg);
                if (url != null && !url.isEmpty()) return url;
            } catch (Throwable t) {
                Log.i(TAG, "URL_" + nativeMethodName + "_ERR " + t.getClass().getSimpleName());
            }
        }
        String base = getBaseUrl();
        if (base == null) base = "https://galvorn.telenor.com.pk/";
        return base + fallbackPath;
    }

    private static Object sEndpoints;
    private static boolean sEndpointsResolved;

    private static Object getEndpointsSingleton() {
        if (sEndpointsResolved) return sEndpoints;
        sEndpointsResolved = true;
        try {
            Class<?> cls = Class.forName(
                "com.telenor.pakistan.mytelenor.newstructure.utils.Constants$APIEndPoints");
            try {
                sEndpoints = cls.getField("f28660a").get(null);
            } catch (Throwable t) {
                java.lang.reflect.Field[] fields = cls.getDeclaredFields();
                for (java.lang.reflect.Field f : fields) {
                    if (java.lang.reflect.Modifier.isStatic(f.getModifiers())) {
                        f.setAccessible(true);
                        Object obj = f.get(null);
                        if (obj != null && cls.isInstance(obj)) {
                            sEndpoints = obj;
                            break;
                        }
                    }
                }
            }
        } catch (Throwable t) {
            Log.i(TAG, "ENDPOINTS_ERR " + t.getClass().getSimpleName());
        }
        return sEndpoints;
    }

    private static String truncate(String value) {
        if (value == null) return "";
        return value.length() > 200 ? value.substring(0, 200) : value;
    }
}
