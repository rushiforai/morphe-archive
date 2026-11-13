package app.bugsmith.extension.pingo.login;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.util.Base64;
import android.util.Log;

import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.SecureRandom;

/**
 * Replaces the signature-bound GMS Google Sign-In used by RNGoogleSigninModule with a
 * browser OAuth 2.0 authorization-code flow (PKCE) against the installed-app OAuth client
 * of the app's own Google Cloud project (pico-ai-442722).
 *
 * A re-signed APK fails the GMS path with DEVELOPER_ERROR(10) because the GMS SDK validates
 * the calling app's package name + signing certificate against the registered Android OAuth
 * client. The plain browser code flow with the project's installed-app client
 * (com.googleusercontent.apps.456815495379-cbq2...:/oauth2redirect) is not cert-bound, and
 * the resulting id_token is issued for a client of the same Firebase project, so the app's
 * GoogleAuthProvider.credential(idToken) -> signInWithCredential path keeps working.
 *
 * This class only uses android and java platform APIs. React Native bridge types (Promise,
 * WritableMap, Arguments) are reached through reflection because this extension dex is
 * compiled without the app's classes on the classpath; they resolve fine at runtime
 * because the dex is merged into the patched app.
 */
public final class LoginFlow {
    private static final String TAG = "PingoLoginPatch";

    static final String CLIENT_ID =
            "456815495379-cbq2qaaqpjcam1o0v5p1b8jqfu4q2jhg.apps.googleusercontent.com";
    static final String REDIRECT_URI =
            "com.googleusercontent.apps.456815495379-cbq2qaaqpjcam1o0v5p1b8jqfu4q2jhg:/oauth2redirect";

    private static final String AUTH_ENDPOINT = "https://accounts.google.com/o/oauth2/v2/auth";
    private static final String TOKEN_ENDPOINT = "https://oauth2.googleapis.com/token";
    private static final String SCOPES = "openid email profile";
    private static final String PREFS = "pingo_login_patch";
    private static final String PK_REFRESH = "refresh_token";
    private static final String PK_ID_TOKEN = "id_token";
    private static final String PK_PROFILE = "profile";

    private static final Object LOCK = new Object();
    private static Object pendingPromise;
    private static String pendingState;
    private static String pendingVerifier;
    private static String pendingNonce;
    private static Context appContext;

    private LoginFlow() {
    }

    // ------------------------------------------------------------------
    // Entry points called from the patched RNGoogleSigninModule methods.
    // ------------------------------------------------------------------

    /** RNGoogleSigninModule.signIn(ReadableMap, Promise) -> browser OAuth code flow. */
    public static void signIn(final Object module, final Object promise) {
        final Activity activity = currentActivity(module);
        if (activity == null) {
            reject(promise, "SIGN_IN", "activity is null");
            return;
        }
        rememberContext(activity);
        final String verifier;
        final String state;
        final String nonce;
        final String url;
        try {
            SecureRandom random = new SecureRandom();
            verifier = base64Url(random(random, 32));
            state = base64Url(random(random, 16));
            nonce = base64Url(random(random, 16));
            url = AUTH_ENDPOINT
                    + "?client_id=" + enc(CLIENT_ID)
                    + "&redirect_uri=" + enc(REDIRECT_URI)
                    + "&response_type=code"
                    + "&scope=" + enc(SCOPES)
                    + "&access_type=offline"
                    + "&prompt=consent"
                    + "&state=" + enc(state)
                    + "&nonce=" + enc(nonce)
                    + "&code_challenge=" + enc(base64Url(sha256(verifier)))
                    + "&code_challenge_method=S256";
        } catch (Exception e) {
            reject(promise, "SIGN_IN", String.valueOf(e));
            return;
        }
        // A previous sign-in that never received its redirect is abandoned; replace it
        // instead of rejecting forever (the browser may have been closed mid-flow).
        synchronized (LOCK) {
            Object abandoned = pendingPromise;
            resetPending();
            if (abandoned != null) {
                reject(abandoned, "ABANDONED", "sign-in superseded by a new attempt");
            }
            pendingPromise = promise;
            pendingState = state;
            pendingVerifier = verifier;
            pendingNonce = nonce;
        }
        try {
            activity.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(url)));
        } catch (Exception e) {
            Object orphan;
            synchronized (LOCK) {
                orphan = pendingPromise;
                resetPending();
            }
            reject(orphan != null ? orphan : promise, "SIGN_IN", String.valueOf(e));
        }
    }

    /** RNGoogleSigninModule.signInSilently(Promise) -> refresh-token grant against the stored login. */
    public static void signInSilently(final Object module, final Object promise) {
        final SharedPreferences prefs;
        try {
            prefs = prefs(module);
        } catch (Exception e) {
            reject(promise, "SILENT_FAILED", String.valueOf(e));
            return;
        }
        final String refresh = prefs.getString(PK_REFRESH, null);
        if (refresh == null) {
            reject(promise, "NO_SAVED_LOGIN", "no saved Google login");
            return;
        }
        new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    JSONObject tokens = exchange("refresh_token", refresh, null);
                    final String idToken = tokens.optString("id_token", "");
                    if (idToken.isEmpty()) {
                        throw new IllegalStateException("token response had no id_token");
                    }
                    // Google returns a refresh token only when it rotates; keep the old one otherwise.
                    final String nextRefresh = tokens.optString("refresh_token", refresh);
                    prefs.edit()
                            .putString(PK_REFRESH, nextRefresh)
                            .putString(PK_ID_TOKEN, idToken)
                            .apply();
                    JSONObject stored = new JSONObject(prefs.getString(PK_PROFILE, "{}"));
                    resolve(promise, buildResult(
                            idToken,
                            stored.optString("id"),
                            stored.optString("name"),
                            stored.optString("givenName"),
                            stored.optString("familyName"),
                            stored.optString("email"),
                            stored.optString("photo")));
                } catch (Exception e) {
                    Log.w(TAG, "silent sign-in failed", e);
                    reject(promise, "SILENT_FAILED", String.valueOf(e));
                }
            }
        }).start();
    }

    /** RNGoogleSigninModule.hasPreviousSignIn() -> true when a browser-flow login is stored. */
    public static boolean hasPreviousSignIn(Object module) {
        try {
            return prefs(module).getString(PK_REFRESH, null) != null;
        } catch (Throwable t) {
            return false;
        }
    }

    /** RNGoogleSigninModule.getCurrentUser() -> stored profile (same map shape as Utils.getUserProperties). */
    public static Object getCurrentUser(Object module) {
        try {
            SharedPreferences prefs = prefs(module);
            String profile = prefs.getString(PK_PROFILE, null);
            if (profile == null) {
                return null;
            }
            JSONObject stored = new JSONObject(profile);
            return buildResult(
                    prefs.getString(PK_ID_TOKEN, null),
                    stored.optString("id"),
                    stored.optString("name"),
                    stored.optString("givenName"),
                    stored.optString("familyName"),
                    stored.optString("email"),
                    stored.optString("photo"));
        } catch (Throwable t) {
            Log.w(TAG, "getCurrentUser failed", t);
            return null;
        }
    }

    /** RNGoogleSigninModule.signOut(Promise) -> drop the stored login and resolve null. */
    public static void signOut(Object module, Object promise) {
        try {
            prefs(module).edit().clear().apply();
        } catch (Throwable t) {
            Log.w(TAG, "signOut clear failed", t);
        }
        resolve(promise, null);
    }

    // ------------------------------------------------------------------
    // Redirect capture (called from LoginRedirectActivity).
    // ------------------------------------------------------------------

    static void handleRedirect(Uri uri) {
        Object promise;
        String state;
        String verifier;
        String nonce;
        synchronized (LOCK) {
            promise = pendingPromise;
            state = pendingState;
            verifier = pendingVerifier;
            nonce = pendingNonce;
            resetPending();
        }
        if (promise == null) {
            Log.i(TAG, "oauth redirect received with no pending sign-in; ignoring");
            return;
        }
        if (uri == null) {
            reject(promise, "REDIRECT", "redirect intent had no data");
            return;
        }
        String error = uri.getQueryParameter("error");
        if (error != null) {
            reject(promise, error, "google oauth error: " + error);
            return;
        }
        String returnedState = uri.getQueryParameter("state");
        if (returnedState == null || !returnedState.equals(state)) {
            reject(promise, "STATE_MISMATCH", "oauth state mismatch");
            return;
        }
        final String code = uri.getQueryParameter("code");
        if (code == null || code.isEmpty()) {
            reject(promise, "NO_CODE", "redirect carried no authorization code");
            return;
        }
        final Object p = promise;
        final String codeVerifier = verifier;
        final String expectedNonce = nonce;
        new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    JSONObject tokens = exchange("authorization_code", code, codeVerifier);
                    applyTokens(p, tokens, expectedNonce);
                } catch (Exception e) {
                    Log.w(TAG, "token exchange failed", e);
                    reject(p, "EXCHANGE_FAILED", String.valueOf(e));
                }
            }
        }).start();
    }

    private static void applyTokens(Object promise, JSONObject tokens, String expectedNonce) throws Exception {
        String idToken = tokens.optString("id_token", "");
        if (idToken.isEmpty()) {
            throw new IllegalStateException("token response had no id_token");
        }
        JSONObject claims = jwtPayload(idToken);
        if (expectedNonce != null && !expectedNonce.equals(claims.optString("nonce"))) {
            throw new IllegalStateException("id_token nonce mismatch");
        }
        String sub = claims.optString("sub", "");
        String email = claims.optString("email", "");
        String name = claims.optString("name", "");
        String givenName = claims.optString("given_name", "");
        String familyName = claims.optString("family_name", "");
        String picture = claims.optString("picture", "");
        String refresh = tokens.optString("refresh_token", "");
        JSONObject profile = new JSONObject();
        profile.put("id", sub);
        profile.put("email", email);
        profile.put("name", name);
        profile.put("givenName", givenName);
        profile.put("familyName", familyName);
        profile.put("photo", picture);
        if (appContext == null) {
            throw new IllegalStateException("application context is gone");
        }
        SharedPreferences.Editor editor = appContext.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit();
        if (!refresh.isEmpty()) {
            editor.putString(PK_REFRESH, refresh);
        }
        editor.putString(PK_ID_TOKEN, idToken);
        editor.putString(PK_PROFILE, profile.toString());
        editor.apply();
        resolve(promise, buildResult(idToken, sub, name, givenName, familyName, email, picture));
    }

    // ------------------------------------------------------------------
    // OAuth plumbing.
    // ------------------------------------------------------------------

    private static JSONObject exchange(String grantType, String credential, String verifier) throws Exception {
        StringBuilder form = new StringBuilder();
        form.append("grant_type=").append(enc(grantType));
        form.append("&client_id=").append(enc(CLIENT_ID));
        if ("authorization_code".equals(grantType)) {
            form.append("&code=").append(enc(credential));
            form.append("&code_verifier=").append(enc(verifier));
            form.append("&redirect_uri=").append(enc(REDIRECT_URI));
        } else {
            form.append("&refresh_token=").append(enc(credential));
        }
        HttpURLConnection connection = (HttpURLConnection) new URL(TOKEN_ENDPOINT).openConnection();
        try {
            connection.setRequestMethod("POST");
            connection.setDoOutput(true);
            connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            OutputStream out = connection.getOutputStream();
            try {
                out.write(form.toString().getBytes(StandardCharsets.UTF_8));
            } finally {
                out.close();
            }
            int status = connection.getResponseCode();
            InputStream in = status >= 400 ? connection.getErrorStream() : connection.getInputStream();
            String body = readAll(in);
            if (status < 200 || status >= 300) {
                throw new IllegalStateException("token endpoint HTTP " + status + ": " + body);
            }
            return new JSONObject(body);
        } finally {
            connection.disconnect();
        }
    }

    private static JSONObject jwtPayload(String jwt) throws Exception {
        String[] parts = jwt.split("\\.");
        if (parts.length < 2) {
            throw new IllegalArgumentException("malformed id_token");
        }
        byte[] decoded = Base64.decode(parts[1], Base64.URL_SAFE | Base64.NO_PADDING | Base64.NO_WRAP);
        return new JSONObject(new String(decoded, StandardCharsets.UTF_8));
    }

    // ------------------------------------------------------------------
    // React Native bridge via reflection.
    // ------------------------------------------------------------------

    /**
     * Builds the exact map shape that com.reactnativegooglesignin.Utils.getUserProperties
     * returns: { idToken, serverAuthCode, scopes[], user{ id, name, givenName, familyName,
     * email, photo } }.
     */
    private static Object buildResult(String idToken, String id, String name, String givenName,
                                      String familyName, String email, String photo) throws Exception {
        Object user = rnCreateMap();
        rnPutString(user, "id", id);
        rnPutString(user, "name", name);
        rnPutString(user, "givenName", givenName);
        rnPutString(user, "familyName", familyName);
        rnPutString(user, "email", email);
        rnPutString(user, "photo", photo);
        Object root = rnCreateMap();
        rnPutString(root, "idToken", idToken);
        rnPutString(root, "serverAuthCode", null);
        rnPutMap(root, "user", user);
        Object scopes = rnCreateArray();
        rnPushString(scopes, "openid");
        rnPushString(scopes, "email");
        rnPushString(scopes, "profile");
        rnPutArray(root, "scopes", scopes);
        return root;
    }

    private static Object rnCreateMap() throws Exception {
        // Arguments is a Kotlin object in this RN version; instantiate the map class directly.
        return Class.forName("com.facebook.react.bridge.WritableNativeMap").getDeclaredConstructor().newInstance();
    }

    private static Object rnCreateArray() throws Exception {
        return Class.forName("com.facebook.react.bridge.WritableNativeArray").getDeclaredConstructor().newInstance();
    }

    private static void rnPutString(Object map, String key, String value) throws Exception {
        map.getClass().getMethod("putString", String.class, String.class).invoke(map, key, value);
    }

    private static void rnPutMap(Object map, String key, Object nested) throws Exception {
        // WritableNativeMap.putMap takes ReadableMap (WritableNativeMap implements it).
        map.getClass()
                .getMethod("putMap", String.class, Class.forName("com.facebook.react.bridge.ReadableMap"))
                .invoke(map, key, nested);
    }

    private static void rnPutArray(Object map, String key, Object array) throws Exception {
        map.getClass()
                .getMethod("putArray", String.class, Class.forName("com.facebook.react.bridge.ReadableArray"))
                .invoke(map, key, array);
    }

    private static void rnPushString(Object array, String value) throws Exception {
        array.getClass().getMethod("pushString", String.class).invoke(array, value);
    }

    private static void resolve(Object promise, Object value) {
        try {
            promise.getClass().getMethod("resolve", Object.class).invoke(promise, value);
        } catch (Throwable t) {
            Log.w(TAG, "promise resolve failed", t);
        }
    }

    private static void reject(Object promise, String code, String message) {
        try {
            promise.getClass().getMethod("reject", String.class, String.class).invoke(promise, code, message);
        } catch (Throwable t) {
            Log.w(TAG, "promise reject failed", t);
        }
    }

    // ------------------------------------------------------------------
    // Misc helpers.
    // ------------------------------------------------------------------

    private static Activity currentActivity(Object module) {
        if (module == null) {
            return null;
        }
        try {
            // protected final in RN 0.80+ (deprecated form), so getMethod() can't find it;
            // walk the hierarchy and use getDeclaredMethod + setAccessible.
            Object activity = findMethod(module.getClass(), "getCurrentActivity").invoke(module);
            return activity instanceof Activity ? (Activity) activity : null;
        } catch (Throwable t) {
            Log.w(TAG, "getCurrentActivity failed", t);
            return null;
        }
    }

    /** Finds a method on the class or any superclass, bypassing protected/package access. */
    private static java.lang.reflect.Method findMethod(Class<?> type, String name) {
        for (Class<?> current = type; current != null; current = current.getSuperclass()) {
            try {
                java.lang.reflect.Method method = current.getDeclaredMethod(name);
                method.setAccessible(true);
                return method;
            } catch (NoSuchMethodException ignored) {
            } catch (Throwable t) {
                Log.w(TAG, "findMethod(" + name + ") failed on " + current.getName(), t);
                return null;
            }
        }
        return null;
    }

    private static void rememberContext(Context context) {
        if (context != null) {
            appContext = context.getApplicationContext();
        }
    }

    private static SharedPreferences prefs(Object module) {
        if (appContext == null && module != null) {
            try {
                // RNGoogleSigninModule extends ReactContextBaseJavaModule -> BaseJavaModule,
                // where getReactApplicationContext() is protected final; use the hierarchy walk.
                java.lang.reflect.Method accessor = findMethod(module.getClass(), "getReactApplicationContext");
                if (accessor != null) {
                    rememberContext((Context) accessor.invoke(module));
                }
            } catch (Throwable ignored) {
            }
            try {
                Activity activity = currentActivity(module);
                if (activity != null) {
                    rememberContext(activity);
                }
            } catch (Throwable ignored) {
            }
        }
        if (appContext == null) {
            throw new IllegalStateException("no application context available");
        }
        return appContext.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    private static void resetPending() {
        pendingPromise = null;
        pendingState = null;
        pendingVerifier = null;
        pendingNonce = null;
    }

    private static byte[] random(SecureRandom random, int count) {
        byte[] bytes = new byte[count];
        random.nextBytes(bytes);
        return bytes;
    }

    private static byte[] sha256(String value) throws Exception {
        return MessageDigest.getInstance("SHA-256").digest(value.getBytes(StandardCharsets.UTF_8));
    }

    private static String base64Url(byte[] bytes) {
        return Base64.encodeToString(bytes, Base64.URL_SAFE | Base64.NO_PADDING | Base64.NO_WRAP);
    }

    private static String enc(String value) throws Exception {
        return URLEncoder.encode(value, "UTF-8");
    }

    private static String readAll(InputStream in) throws Exception {
        if (in == null) {
            throw new IllegalStateException("empty response body");
        }
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        byte[] buffer = new byte[4096];
        for (int n = in.read(buffer); n >= 0; n = in.read(buffer)) {
            out.write(buffer, 0, n);
        }
        return new String(out.toByteArray(), StandardCharsets.UTF_8);
    }
}
