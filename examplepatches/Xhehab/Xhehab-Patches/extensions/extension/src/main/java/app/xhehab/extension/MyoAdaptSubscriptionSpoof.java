package app.xhehab.extension;

import android.content.Context;
import android.util.Log;
import java.io.File;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.regex.Pattern;
import okhttp3.Interceptor;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Response;
import okhttp3.ResponseBody;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 * MyoAdapt unlock helpers.
 *
 * Real RC account state: core-access on main_sub (trial expired 2025-08-04).
 * Home paywall is driven by backend session (MMKV + coach.myoadapt), not only RC.
 */
public final class MyoAdaptSubscriptionSpoof {
    private static final String TAG = "MyoAdaptSpoof";
    private static final String PURCHASE = "2026-07-09T00:00:00Z";
    private static final String EXPIRE = "2035-07-09T00:00:00Z";
    private static final String PRODUCT = "main_sub";
    private static final String PLAN = "monthly-introductory-affiliate";

    private static final Pattern EXPIRES_FIELD = Pattern.compile(
            "\"(expires_date|expiresDate|ExpiresOn|expiresOn|expirationDate|ExpirationDate|"
                    + "expiredOn|ExpiredOn|validUntil|ValidUntil|periodEnd|PeriodEnd|"
                    + "endDate|EndDate|renewalDate|RenewalDate|ExpiresAt|expiresAt)\"\\s*:\\s*\"20[0-2][0-9]-[^\"]*\"");

    private static final Pattern UNSUBSCRIBE_FIELD = Pattern.compile(
            "\"(unsubscribe_detected_at|unsubscribeDetectedAt|UnsubscribeDetectedAt)\"\\s*:\\s*\"[^\"]*\"");

    private static volatile boolean installed = false;

    private MyoAdaptSubscriptionSpoof() {}

    /**
     * Call from MainApplication.onCreate.
     * Installs OkHttp factory (interceptor) and clears cached session blobs that
     * keep showing Expired after unlock patches.
     */
    public static void install(Context context) {
        Log.i(TAG, "install() begin");
        try {
            installOkHttpFactory();
        } catch (Throwable t) {
            Log.e(TAG, "installOkHttpFactory failed", t);
        }
        try {
            clearSubscriptionCaches(context);
        } catch (Throwable t) {
            Log.e(TAG, "clearSubscriptionCaches failed", t);
        }
        Log.i(TAG, "install() done");
    }

    private static void installOkHttpFactory() throws Exception {
        if (installed) return;
        final Class<?> provider =
                Class.forName("com.facebook.react.modules.network.OkHttpClientProvider");
        final Class<?> factoryIface =
                Class.forName("com.facebook.react.modules.network.OkHttpClientFactory");

        Object factory =
                Proxy.newProxyInstance(
                        factoryIface.getClassLoader(),
                        new Class<?>[] {factoryIface},
                        new InvocationHandler() {
                            @Override
                            public Object invoke(Object proxy, Method method, Object[] args)
                                    throws Throwable {
                                if ("createNewNetworkModuleClient".equals(method.getName())) {
                                    Method createBuilder =
                                            provider.getMethod("createClientBuilder");
                                    Object builder = createBuilder.invoke(null);
                                    // Application interceptor (NOT network): body is already
                                    // gunzipped. Network interceptors see raw gzip → binary garbage
                                    // and JSON rewrite never matches.
                                    Method addInterceptor =
                                            builder.getClass()
                                                    .getMethod(
                                                            "addInterceptor",
                                                            Interceptor.class);
                                    addInterceptor.invoke(builder, interceptor());
                                    Method build = builder.getClass().getMethod("build");
                                    Object client = build.invoke(builder);
                                    Log.i(TAG, "OkHttp client built with app interceptor");
                                    return client;
                                }
                                return null;
                            }
                        });

        Method setFactory =
                provider.getMethod("setOkHttpClientFactory", factoryIface);
        setFactory.invoke(null, factory);

        // Drop any client created before our factory
        for (String fieldName : new String[] {"sClient", "client"}) {
            try {
                Field f = provider.getDeclaredField(fieldName);
                f.setAccessible(true);
                f.set(null, null);
            } catch (NoSuchFieldException ignored) {
            }
        }
        installed = true;
        Log.i(TAG, "OkHttpClientFactory installed");
    }

    /**
     * Wipe MMKV/session files that cache expired subscription from previous runs.
     * User stays logged in via other stores when possible; worst case re-login.
     */
    private static void clearSubscriptionCaches(Context context) {
        if (context == null) return;
        File files = context.getFilesDir();
        if (files == null) return;
        File mmkv = new File(files, "mmkv");
        if (!mmkv.isDirectory()) {
            Log.i(TAG, "no mmkv dir yet");
            return;
        }
        File[] children = mmkv.listFiles();
        if (children == null) return;
        int removed = 0;
        for (File f : children) {
            String n = f.getName().toLowerCase();
            // Prefer surgical deletes; fall back to all non-crypto mmkv files
            if (n.contains("sub")
                    || n.contains("session")
                    || n.contains("user")
                    || n.contains("auth")
                    || n.contains("login")
                    || n.contains("purchas")
                    || n.contains("entitlement")
                    || n.endsWith(".crc")
                    || !n.contains("idkey")) {
                if (f.delete()) removed++;
            }
        }
        Log.i(TAG, "cleared mmkv files count=" + removed);
    }

    /**
     * Only inspect responses that can gate premium access.
     * Skip catalogs/training bulk JSON (was rewritten by accident and is expensive).
     */
    private static boolean isGateUrl(String url) {
        if (url == null) return false;
        if (url.contains("revenuecat") || url.contains("subscribers")) {
            return true;
        }
        if (!url.contains("myoadapt")) {
            return false;
        }
        // Backend session gate (confirmed: sub.status / isExpired on GetUserInfo)
        return url.contains("GetUserInfo")
                || url.contains("LoginPassword")
                || url.contains("LoginSocial")
                || url.contains("SocialLogin")
                || url.contains("GetSubscription")
                || url.contains("SubActions/");
    }

    /** Endpoints where we inject/force an Active subscription object. */
    private static boolean isForceActiveUrl(String url) {
        if (url == null) return false;
        return url.contains("GetUserInfo")
                || url.contains("LoginPassword")
                || url.contains("LoginSocial")
                || url.contains("SocialLogin")
                || url.contains("GetSubscription")
                || url.contains("SubActions/");
    }

    public static Interceptor interceptor() {
        return new Interceptor() {
            @Override
            public Response intercept(Chain chain) throws java.io.IOException {
                Response response = chain.proceed(chain.request());
                ResponseBody body = response.body();
                if (body == null) {
                    return response;
                }

                final String url = String.valueOf(chain.request().url());
                // Pass through images, catalogs, training payloads, etc.
                if (!isGateUrl(url)) {
                    return response;
                }

                // Application interceptor: body is decompressed. peekBody copies
                // without consuming. Do not rebuild unless we actually rewrite
                // (avoids Content-Length / encoding mismatches).
                String text;
                try {
                    long limit = 512L * 1024L; // gate payloads are small
                    text = response.peekBody(limit).string();
                } catch (Throwable t) {
                    Log.w(TAG, "peekBody failed url=" + url + " err=" + t.getMessage());
                    return response;
                }

                if (text == null || text.isEmpty()) {
                    return response;
                }

                // Skip if still looks binary/gzip (wrong interceptor layer)
                char c0 = text.charAt(0);
                if (c0 != '{' && c0 != '[' && c0 != '"' && c0 != 't' && c0 != 'f' && c0 != 'n'
                        && c0 != '-' && (c0 < '0' || c0 > '9')) {
                    Log.w(TAG, "non-json body url=" + url + " first=0x"
                            + Integer.toHexString(text.charAt(0) & 0xff)
                            + " len=" + text.length());
                    return response;
                }

                if (text.length() <= 4000) {
                    Log.i(TAG, "RAW url=" + url + " ct=" + body.contentType()
                            + " body=" + text);
                }

                String rewritten = rewriteForUrl(url, text);
                if (rewritten == null || rewritten.equals(text)) {
                    Log.i(TAG, "interceptor leave-alone url=" + url + " len=" + text.length());
                    return response;
                }

                MediaType type = body.contentType();
                Log.i(TAG, "interceptor rewrote body url=" + url
                        + " in=" + text.length() + " out=" + rewritten.length());
                return response.newBuilder()
                        .removeHeader("Content-Encoding")
                        .removeHeader("Content-Length")
                        .body(ResponseBody.create(rewritten, type))
                        .build();
            }
        };
    }

    /** URL-aware rewrite: force subscription unlock only on gate payloads. */
    public static String rewriteForUrl(String url, String body) {
        if (body == null) return null;
        String out = rewrite(body);

        if (!isForceActiveUrl(url)) {
            return out;
        }

        try {
            String forced = forceActiveUserPayload(out != null ? out : body);
            if (forced != null && !forced.equals(body)) {
                Log.i(TAG, "forceActiveUserPayload applied url=" + url);
                return forced;
            }
        } catch (Throwable t) {
            Log.w(TAG, "forceActiveUserPayload failed: " + t.getMessage());
        }
        return out;
    }

    /**
     * Aggressively mark any user/session JSON as having an active subscription.
     * Handles plain objects, Fable Case/Fields, and array-wrapped remoting payloads.
     */
    private static String forceActiveUserPayload(String body) throws Exception {
        String trimmed = body.trim();
        if (trimmed.startsWith("{")) {
            JSONObject obj = new JSONObject(body);
            injectActiveEverywhere(obj);
            walkAndFix(obj);
            forceSubscriptionActive(obj);
            return stringFixes(obj.toString());
        }
        if (trimmed.startsWith("[")) {
            JSONArray arr = new JSONArray(body);
            injectActiveInArray(arr);
            walkAndFixArray(arr);
            return stringFixes(arr.toString());
        }
        return stringFixes(body);
    }

    private static void injectActiveEverywhere(JSONObject obj) throws Exception {
        if (obj == null) return;

        // Fable Result: { "Case": "Ok", "Fields": [ user ] }
        if ("Ok".equals(obj.optString("Case", null)) || "ok".equals(obj.optString("Case", null))) {
            JSONArray fields = obj.optJSONArray("Fields");
            if (fields != null) {
                injectActiveInArray(fields);
            }
        }
        if (obj.has("Fields")) {
            Object f = obj.opt("Fields");
            if (f instanceof JSONArray) injectActiveInArray((JSONArray) f);
            if (f instanceof JSONObject) injectActiveEverywhere((JSONObject) f);
        }
        if (obj.has("fields")) {
            Object f = obj.opt("fields");
            if (f instanceof JSONArray) injectActiveInArray((JSONArray) f);
            if (f instanceof JSONObject) injectActiveEverywhere((JSONObject) f);
        }

        // Direct / nested user-like objects
        putActiveStatus(obj);
        ensureSubscriptionObject(obj);

        for (String k : new String[] {
            "user", "User", "data", "Data", "result", "Result", "value", "Value",
            "profile", "Profile", "session", "Session", "info", "Info"
        }) {
            JSONObject child = obj.optJSONObject(k);
            if (child != null) {
                injectActiveEverywhere(child);
            }
        }

        // Walk all nested objects
        Iterator<String> keys = obj.keys();
        ArrayList<String> copy = new ArrayList<>();
        while (keys.hasNext()) copy.add(keys.next());
        for (String k : copy) {
            Object v = obj.opt(k);
            if (v instanceof JSONObject) {
                injectActiveEverywhere((JSONObject) v);
            } else if (v instanceof JSONArray) {
                injectActiveInArray((JSONArray) v);
            } else if (v instanceof String) {
                String s = (String) v;
                String kl = k.toLowerCase();
                if (kl.contains("status") && ("Expired".equals(s) || "Trial".equals(s) || "trial".equals(s))) {
                    obj.put(k, "Active");
                }
            }
        }
    }

    private static void injectActiveInArray(JSONArray arr) throws Exception {
        if (arr == null) return;
        for (int i = 0; i < arr.length(); i++) {
            Object v = arr.opt(i);
            if (v instanceof JSONObject) {
                injectActiveEverywhere((JSONObject) v);
            } else if (v instanceof JSONArray) {
                JSONArray inner = (JSONArray) v;
                // Fable DU as ["Expired"] or ["Active"]
                if (inner.length() >= 1 && "Expired".equals(inner.optString(0, null))) {
                    inner.put(0, "Active");
                }
                injectActiveInArray(inner);
            } else if ("Expired".equals(v)) {
                arr.put(i, "Active");
            }
        }
    }

    private static void ensureSubscriptionObject(JSONObject obj) throws Exception {
        // If this looks like a user record, ensure a subscription sub-object is Active
        boolean userLike =
                obj.has("email")
                        || obj.has("Email")
                        || obj.has("displayName")
                        || obj.has("DisplayName")
                        || obj.has("userId")
                        || obj.has("UserId")
                        || obj.has("revenueCatId")
                        || obj.has("RevenueCatId")
                        || obj.has("subscription")
                        || obj.has("Subscription");
        if (!userLike) return;

        JSONObject sub = obj.optJSONObject("subscription");
        if (sub == null) sub = obj.optJSONObject("Subscription");
        if (sub == null) {
            sub = new JSONObject();
            obj.put("subscription", sub);
            obj.put("Subscription", sub);
        }
        putActiveStatus(sub);
        sub.put("Status", "Active");
        sub.put("status", "Active");
        sub.put("Case", "Active");
        sub.put("IsActive", true);
        sub.put("isActive", true);
        sub.put("IsExpired", false);
        sub.put("isExpired", false);
        sub.put("HasAccess", true);
        sub.put("hasAccess", true);
        sub.put("ExpiresOn", EXPIRE);
        sub.put("expiresOn", EXPIRE);
        sub.put("expires_date", EXPIRE);
        sub.put("PlanKind", "Solo");
        sub.put("planKind", "Solo");
    }

    public static String rewrite(String body) {
        if (body == null || body.length() < 2) return body;
        try {
            String trimmed = body.trim();
            if (trimmed.startsWith("{")
                    && (body.contains("\"subscriber\"") || body.contains("\"entitlements\""))) {
                try {
                    JSONObject root = new JSONObject(body);
                    spoofCustomerInfoJson(root);
                    walkAndFix(root);
                    Log.i(TAG, "rewrite: full RC subscriber spoof");
                    return root.toString();
                } catch (Throwable ignored) {
                }
            }

            if (trimmed.startsWith("{") || trimmed.startsWith("[")) {
                try {
                    if (trimmed.startsWith("[")) {
                        JSONArray arr = new JSONArray(body);
                        walkAndFixArray(arr);
                        return stringFixes(arr.toString());
                    } else {
                        JSONObject obj = new JSONObject(body);
                        boolean touched = walkAndFix(obj);
                        // If object looks like auth/session, force subscription-ish keys
                        forceSubscriptionActive(obj);
                        String out = stringFixes(obj.toString());
                        if (touched || !out.equals(body)) {
                            Log.i(TAG, "rewrite: JSON walk mutated keys");
                        }
                        return out;
                    }
                } catch (Throwable ignored) {
                }
            }

            String lower = body.toLowerCase();
            boolean relevant =
                    lower.contains("subscription")
                            || lower.contains("entitlement")
                            || lower.contains("subscriber")
                            || lower.contains("plankind")
                            || body.contains("core-access")
                            || body.contains("main_sub")
                            || lower.contains("expired")
                            || lower.contains("session")
                            || lower.contains("isactive")
                            || lower.contains("hasaccess");
            if (!relevant) return body;
            Log.i(TAG, "rewrite: stringFixes relevant body");
            return stringFixes(body);
        } catch (Throwable t) {
            Log.w(TAG, "rewrite failed: " + t.getMessage());
            return body;
        }
    }

    private static void forceSubscriptionActive(JSONObject obj) {
        if (obj == null) return;
        try {
            // Common shapes: { subscription: {...} }, { Subscription: {...} }, nested user
            for (String key : new String[] {
                "subscription", "Subscription", "subscriptionInfo", "SubscriptionInfo",
                "subscriptionData", "SubscriptionData"
            }) {
                JSONObject sub = obj.optJSONObject(key);
                if (sub != null) {
                    putActiveStatus(sub);
                }
            }
            if (obj.has("Status") || obj.has("status") || obj.has("SubscriptionStatus")) {
                putActiveStatus(obj);
            }
            JSONObject user = obj.optJSONObject("user");
            if (user == null) user = obj.optJSONObject("User");
            if (user != null) forceSubscriptionActive(user);
            JSONObject data = obj.optJSONObject("data");
            if (data != null) forceSubscriptionActive(data);
            JSONObject result = obj.optJSONObject("result");
            if (result != null) forceSubscriptionActive(result);
        } catch (Throwable ignored) {
        }
    }

    private static void putActiveStatus(JSONObject sub) throws Exception {
        if (sub.has("Status")) sub.put("Status", "Active");
        if (sub.has("status")) sub.put("status", "Active");
        if (sub.has("SubscriptionStatus")) sub.put("SubscriptionStatus", "Active");
        if (sub.has("subscriptionStatus")) sub.put("subscriptionStatus", "Active");
        if (sub.has("IsExpired")) sub.put("IsExpired", false);
        if (sub.has("isExpired")) sub.put("isExpired", false);
        if (sub.has("IsActive")) sub.put("IsActive", true);
        if (sub.has("isActive")) sub.put("isActive", true);
        if (sub.has("HasAccess")) sub.put("HasAccess", true);
        if (sub.has("hasAccess")) sub.put("hasAccess", true);
        for (String k : new String[] {
            "ExpiresOn", "expiresOn", "expires_date", "expirationDate", "ExpirationDate",
            "ValidUntil", "validUntil", "EndDate", "endDate"
        }) {
            if (sub.has(k)) sub.put(k, EXPIRE);
        }
        // Fable Case/Fields union
        if ("Expired".equals(sub.optString("Case", null))) {
            sub.put("Case", "Active");
        }
        if ("Expired".equals(sub.optString("case", null))) {
            sub.put("case", "Active");
        }
    }

    private static String stringFixes(String body) {
        String out = body;
        out = out.replace("\"Expired\"", "\"Active\"");
        out = out.replace("\"expired\"", "\"active\"");
        out = out.replace("[\"Expired\"]", "[\"Active\"]");
        out = out.replace("\"Case\":\"Expired\"", "\"Case\":\"Active\"");
        out = out.replace("\"case\":\"Expired\"", "\"case\":\"Active\"");
        out = out.replace("\"Status\":1", "\"Status\":0");
        out = out.replace("\"status\":1", "\"status\":0");
        out = out.replace("\"SubscriptionStatus\":1", "\"SubscriptionStatus\":0");
        out = out.replace("\"subscriptionStatus\":1", "\"subscriptionStatus\":0");
        out = out.replace("\"isExpired\":true", "\"isExpired\":false");
        out = out.replace("\"IsExpired\":true", "\"IsExpired\":false");
        out = out.replace("\"isActive\":false", "\"isActive\":true");
        out = out.replace("\"IsActive\":false", "\"IsActive\":true");
        out = out.replace("\"hasAccess\":false", "\"hasAccess\":true");
        out = out.replace("\"HasAccess\":false", "\"HasAccess\":true");
        out = out.replace("\"isSubscribed\":false", "\"isSubscribed\":true");
        out = out.replace("\"period_type\":\"trial\"", "\"period_type\":\"normal\"");
        out = EXPIRES_FIELD.matcher(out).replaceAll("\"$1\":\"" + EXPIRE + "\"");
        out = UNSUBSCRIBE_FIELD.matcher(out).replaceAll("\"$1\":null");
        out = out.replace("2025-08-04T23:46:49Z", EXPIRE);
        out = out.replace("2025-08-04T18:31:50Z", "null");
        out = out.replace("2026-07-09", "2035-07-09");
        if (out.contains("\"subscriber\"") && out.contains("\"entitlements\":{}")) {
            out = out.replace("\"entitlements\":{}", entitlementObjectJson());
        }
        return out;
    }

    public static void spoofCustomerInfoJson(JSONObject body) {
        if (body == null) return;
        try {
            JSONObject subscriber = body.optJSONObject("subscriber");
            if (subscriber == null) {
                if (body.has("entitlements") || body.has("subscriptions")) {
                    subscriber = body;
                } else {
                    return;
                }
            }

            JSONObject entEntry = new JSONObject();
            entEntry.put("expires_date", EXPIRE);
            entEntry.put("purchase_date", PURCHASE);
            entEntry.put("product_identifier", PRODUCT);
            entEntry.put("product_plan_identifier", PLAN);
            entEntry.put("grace_period_expires_date", JSONObject.NULL);

            JSONObject entitlements = new JSONObject();
            entitlements.put("core-access", entEntry);
            entitlements.put("duo-access", entEntry);
            subscriber.put("entitlements", entitlements);

            JSONObject subEntry = new JSONObject();
            subEntry.put("expires_date", EXPIRE);
            subEntry.put("purchase_date", PURCHASE);
            subEntry.put("original_purchase_date", PURCHASE);
            subEntry.put("period_type", "normal");
            subEntry.put("store", "play_store");
            subEntry.put("is_sandbox", false);
            subEntry.put("unsubscribe_detected_at", JSONObject.NULL);
            subEntry.put("billing_issues_detected_at", JSONObject.NULL);
            subEntry.put("grace_period_expires_date", JSONObject.NULL);
            subEntry.put("ownership_type", "PURCHASED");
            subEntry.put("product_plan_identifier", PLAN);
            subEntry.put("auto_resume_date", JSONObject.NULL);
            subEntry.put("refunded_at", JSONObject.NULL);

            JSONObject subscriptions = new JSONObject();
            subscriptions.put(PRODUCT, subEntry);
            subscriptions.put("main_sub", subEntry);
            subscriptions.put("solo_sub_annual", subEntry);
            subscriptions.put("solo_sub_monthly", subEntry);
            subscriber.put("subscriptions", subscriptions);

            if (!subscriber.has("non_subscriptions")) {
                subscriber.put("non_subscriptions", new JSONObject());
            }
            Log.i(TAG, "spoofCustomerInfoJson applied core-access/main_sub");
        } catch (Throwable t) {
            Log.w(TAG, "spoofCustomerInfoJson failed: " + t.getMessage());
        }
    }

    private static boolean walkAndFix(JSONObject obj) {
        if (obj == null) return false;
        boolean touched = false;
        try {
            ArrayList<String> keys = new ArrayList<>();
            Iterator<String> it = obj.keys();
            while (it.hasNext()) keys.add(it.next());
            for (String key : keys) {
                Object val = obj.opt(key);
                String k = key.toLowerCase();
                if (val instanceof JSONObject) {
                    touched |= walkAndFix((JSONObject) val);
                } else if (val instanceof JSONArray) {
                    touched |= walkAndFixArray((JSONArray) val);
                } else if (val instanceof String) {
                    String s = (String) val;
                    if (k.contains("status") && ("Expired".equals(s) || "expired".equals(s))) {
                        obj.put(key, "Active");
                        touched = true;
                    }
                    if ((k.contains("expir") || k.contains("validuntil") || k.contains("periodend")
                                    || k.contains("renewal") || k.contains("ends"))
                            && s.length() >= 10
                            && s.startsWith("20")
                            && s.compareTo("2030") < 0) {
                        obj.put(key, EXPIRE);
                        touched = true;
                    }
                } else if (val instanceof Boolean) {
                    if (k.contains("expired") && Boolean.TRUE.equals(val)) {
                        obj.put(key, false);
                        touched = true;
                    }
                    if ((k.contains("isactive") || k.contains("hasaccess") || k.contains("issubscribed"))
                            && Boolean.FALSE.equals(val)) {
                        obj.put(key, true);
                        touched = true;
                    }
                } else if (val instanceof Number) {
                    if ((k.equals("status") || k.equals("subscriptionstatus"))
                            && ((Number) val).intValue() != 0) {
                        obj.put(key, 0);
                        touched = true;
                    }
                }
            }
        } catch (Throwable ignored) {
        }
        return touched;
    }

    private static boolean walkAndFixArray(JSONArray arr) {
        if (arr == null) return false;
        boolean touched = false;
        try {
            for (int i = 0; i < arr.length(); i++) {
                Object val = arr.opt(i);
                if (val instanceof JSONObject) {
                    touched |= walkAndFix((JSONObject) val);
                } else if (val instanceof JSONArray) {
                    touched |= walkAndFixArray((JSONArray) val);
                } else if ("Expired".equals(val)) {
                    arr.put(i, "Active");
                    touched = true;
                }
            }
        } catch (Throwable ignored) {
        }
        return touched;
    }

    private static String entitlementObjectJson() {
        return "\"entitlements\":{"
                + "\"core-access\":{"
                + "\"expires_date\":\"" + EXPIRE + "\","
                + "\"purchase_date\":\"" + PURCHASE + "\","
                + "\"product_identifier\":\"" + PRODUCT + "\","
                + "\"product_plan_identifier\":\"" + PLAN + "\","
                + "\"grace_period_expires_date\":null"
                + "},"
                + "\"duo-access\":{"
                + "\"expires_date\":\"" + EXPIRE + "\","
                + "\"purchase_date\":\"" + PURCHASE + "\","
                + "\"product_identifier\":\"" + PRODUCT + "\","
                + "\"product_plan_identifier\":\"" + PLAN + "\","
                + "\"grace_period_expires_date\":null"
                + "}"
                + "}";
    }
}
