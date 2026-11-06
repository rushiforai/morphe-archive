package app.pogo.extension;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Base64;
import android.util.Log;

import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Constructor;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

/**
 * Replaces Google Play Services sign-in in Pokemon GO with a browser (Custom Tab)
 * OAuth 2.0 authorization-code + PKCE flow, then hands the result back to the game
 * in exactly the shape its own SignInManager would have produced:
 * SignInResponse(result, email, idToken).
 *
 * All game types are reached by reflection so this module only needs the Android SDK.
 * Called from smali injected by PokemonGoWebSignInPatch.kt.
 */
public final class WebSignIn {
    private static final String TAG = "PogoWebSignIn";

    // Keep SCHEME in sync with the manifest intent-filter added by the patch.
    static final String CLIENT_NUMBER = "848232511240-dmrj3gba506c9svge2p9gq35p1fg654p";
    static final String CLIENT_ID = CLIENT_NUMBER + ".apps.googleusercontent.com";
    static final String SCHEME = "com.googleusercontent.apps." + CLIENT_NUMBER;
    static final String REDIRECT_URI = SCHEME + ":/oauth2redirect";
    static final String SCOPE = "openid email profile";

    static final String AUTH_ENDPOINT = "https://accounts.google.com/o/oauth2/v2/auth";
    // Not final: overridden by the JVM test harness.
    static String tokenEndpoint = "https://oauth2.googleapis.com/token";

    private static final String PREFS = "pogo_web_signin";
    private static final String KEY_REFRESH = "refresh_token";

    private static final String SIGN_IN_RESPONSE = "com.nianticlabs.platform.authgooglesignin.SignInResponse";
    private static final String KOTLIN_FUNCTION1 = "kotlin.jvm.functions.Function1";

    private static final int IDLE = 0;
    private static final int AWAITING_REDIRECT = 1;
    private static final int EXCHANGING = 2;

    private static final long STALE_AFTER_MS = 120_000L;
    private static final long CANCEL_DELAY_MS = 1_000L;

    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    // All state below is confined to the main thread.
    private static int state = IDLE;
    private static Object pendingConsumer;
    private static String pendingVerifier;
    private static String pendingState;
    private static long pendingSince;
    private static boolean sawPause;
    private static Activity launcher;
    private static boolean callbacksRegistered;

    private static final Runnable CANCEL = new Runnable() {
        @Override
        public void run() {
            if (state == AWAITING_REDIRECT) {
                Log.i(TAG, "Sign-in cancelled (returned from browser without a redirect)");
                finish("Cancelled", "", "");
            }
        }
    };

    private WebSignIn() {
    }

    // ------------------------------------------------------------------ hooks

    /** Replaces SignInManager.Companion.signIn(Activity, GoogleSignInClient, Function1). */
    public static void signIn(Activity activity, Object client, Object consumer) {
        try {
            if (state != IDLE && SystemClock.uptimeMillis() - pendingSince < STALE_AFTER_MS) {
                Log.w(TAG, "Sign-in already in progress");
                deliver(consumer, "Fail", "", "");
                return;
            }
            resetState();

            String verifier = randomUrlSafe(64);
            String oauthState = randomUrlSafe(16);
            String url = buildAuthUrl(challenge(verifier), oauthState);

            pendingConsumer = consumer;
            pendingVerifier = verifier;
            pendingState = oauthState;
            pendingSince = SystemClock.uptimeMillis();
            launcher = activity;
            sawPause = false;
            state = AWAITING_REDIRECT;

            registerLifecycleCallbacks(activity);
            activity.startActivity(buildBrowserIntent(url));
            Log.i(TAG, "Browser sign-in started");
        } catch (Throwable t) {
            Log.e(TAG, "signIn failed", t);
            finish("Fail", "", "");
        }
    }

    /** Replaces SignInManager.Companion.silentSignIn(Activity, GoogleSignInClient, Function1). */
    public static void silentSignIn(Activity activity, Object client, final Object consumer) {
        try {
            final String refreshToken = prefs(activity).getString(KEY_REFRESH, null);
            if (refreshToken == null || refreshToken.isEmpty()) {
                deliver(consumer, "SignInRequired", "", "");
                return;
            }
            final Context appContext = activity.getApplicationContext() != null
                    ? activity.getApplicationContext() : activity;
            new Thread(new Runnable() {
                @Override
                public void run() {
                    try {
                        String body = "client_id=" + enc(CLIENT_ID)
                                + "&grant_type=refresh_token"
                                + "&refresh_token=" + enc(refreshToken);
                        JSONObject json = new JSONObject(httpPost(tokenEndpoint, body));
                        String idToken = json.optString("id_token", "");
                        if (idToken.isEmpty()) {
                            deliver(consumer, "Fail", "", "");
                            return;
                        }
                        deliver(consumer, "Success", emailFromIdToken(idToken), idToken);
                    } catch (HttpFailure e) {
                        Log.w(TAG, "Silent sign-in refused (HTTP " + e.code + ")");
                        if (e.body != null && e.body.contains("invalid_grant")) {
                            prefs(appContext).edit().remove(KEY_REFRESH).apply();
                            deliver(consumer, "SignInRequired", "", "");
                        } else {
                            deliver(consumer, "Fail", "", "");
                        }
                    } catch (Throwable t) {
                        Log.w(TAG, "Silent sign-in failed: " + t);
                        deliver(consumer, "Fail", "", "");
                    }
                }
            }, "pogo-websignin-silent").start();
        } catch (Throwable t) {
            Log.e(TAG, "silentSignIn failed", t);
            deliver(consumer, "Fail", "", "");
        }
    }

    /** Called before SignInManager.Companion.signOut(Activity, GoogleSignInClient). */
    public static void signOut(Activity activity, Object client) {
        try {
            prefs(activity).edit().remove(KEY_REFRESH).apply();
            resetState();
        } catch (Throwable t) {
            Log.w(TAG, "signOut cleanup failed: " + t);
        }
    }

    /** Called at the start of UnityMainActivity.onNewIntent(Intent). */
    public static void onNewIntent(Intent intent) {
        try {
            if (intent == null) return;
            Uri data = intent.getData();
            if (data == null || !SCHEME.equals(data.getScheme())) return;

            // Keep the rest of the app from treating the redirect as a deep link.
            intent.setData(null);

            if (state != AWAITING_REDIRECT) {
                Log.w(TAG, "Redirect received with no sign-in pending");
                return;
            }
            MAIN.removeCallbacks(CANCEL);

            String error = data.getQueryParameter("error");
            if (error != null) {
                Log.i(TAG, "Authorization ended with error=" + error);
                finish("access_denied".equals(error) ? "Cancelled" : "Fail", "", "");
                return;
            }
            String code = data.getQueryParameter("code");
            String returnedState = data.getQueryParameter("state");
            if (code == null || returnedState == null || !returnedState.equals(pendingState)) {
                Log.w(TAG, "Redirect missing code or state mismatch");
                finish("Fail", "", "");
                return;
            }

            state = EXCHANGING;
            final String verifier = pendingVerifier;
            final String authCode = code;
            final Context appContext = launcher != null && launcher.getApplicationContext() != null
                    ? launcher.getApplicationContext() : launcher;
            new Thread(new Runnable() {
                @Override
                public void run() {
                    exchangeCode(authCode, verifier, appContext);
                }
            }, "pogo-websignin-exchange").start();
        } catch (Throwable t) {
            Log.e(TAG, "onNewIntent failed", t);
            finish("Fail", "", "");
        }
    }

    // --------------------------------------------------------------- internals

    private static void exchangeCode(String code, String verifier, Context appContext) {
        try {
            String body = "code=" + enc(code)
                    + "&client_id=" + enc(CLIENT_ID)
                    + "&code_verifier=" + enc(verifier)
                    + "&redirect_uri=" + enc(REDIRECT_URI)
                    + "&grant_type=authorization_code";
            JSONObject json = new JSONObject(httpPost(tokenEndpoint, body));
            String idToken = json.optString("id_token", "");
            if (idToken.isEmpty()) {
                Log.e(TAG, "Token response had no id_token");
                postFinish("Fail", "", "");
                return;
            }
            String refresh = json.optString("refresh_token", "");
            if (!refresh.isEmpty() && appContext != null) {
                prefs(appContext).edit().putString(KEY_REFRESH, refresh).apply();
            }
            postFinish("Success", emailFromIdToken(idToken), idToken);
        } catch (HttpFailure e) {
            Log.e(TAG, "Token exchange failed (HTTP " + e.code + ")");
            postFinish("Fail", "", "");
        } catch (Throwable t) {
            Log.e(TAG, "Token exchange failed: " + t);
            postFinish("Fail", "", "");
        }
    }

    private static void postFinish(final String result, final String email, final String idToken) {
        MAIN.post(new Runnable() {
            @Override
            public void run() {
                finish(result, email, idToken);
            }
        });
    }

    /** Main thread. Clears state and answers the pending consumer, if any. */
    private static void finish(String result, String email, String idToken) {
        Object consumer = pendingConsumer;
        resetState();
        if (consumer != null) deliver(consumer, result, email, idToken);
    }

    private static void resetState() {
        MAIN.removeCallbacks(CANCEL);
        state = IDLE;
        pendingConsumer = null;
        pendingVerifier = null;
        pendingState = null;
        launcher = null;
        sawPause = false;
    }

    /** Invokes the game's Kotlin Function1<SignInResponse, Unit> on the main thread. */
    private static void deliver(final Object consumer, final String result,
                                final String email, final String idToken) {
        Runnable r = new Runnable() {
            @Override
            public void run() {
                try {
                    Class<?> responseClass = Class.forName(SIGN_IN_RESPONSE);
                    Constructor<?> ctor = responseClass.getConstructor(
                            String.class, String.class, String.class);
                    Object response = ctor.newInstance(result, email, idToken);
                    Class.forName(KOTLIN_FUNCTION1)
                            .getMethod("invoke", Object.class)
                            .invoke(consumer, response);
                } catch (Throwable t) {
                    Log.e(TAG, "Could not deliver sign-in response", t);
                }
            }
        };
        if (Looper.myLooper() == Looper.getMainLooper()) r.run();
        else MAIN.post(r);
    }

    private static void registerLifecycleCallbacks(Activity activity) {
        if (callbacksRegistered) return;
        Application app = activity.getApplication();
        if (app == null) return;
        callbacksRegistered = true;
        app.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            @Override
            public void onActivityPaused(Activity a) {
                if (state == AWAITING_REDIRECT && a == launcher) sawPause = true;
            }

            @Override
            public void onActivityResumed(Activity a) {
                // Returning from the browser with no redirect = the user backed out.
                // A real redirect reaches onNewIntent before onResume and changes state.
                if (state == AWAITING_REDIRECT && a == launcher && sawPause) {
                    MAIN.removeCallbacks(CANCEL);
                    MAIN.postDelayed(CANCEL, CANCEL_DELAY_MS);
                }
            }

            @Override public void onActivityCreated(Activity a, Bundle b) { }
            @Override public void onActivityStarted(Activity a) { }
            @Override public void onActivityStopped(Activity a) { }
            @Override public void onActivitySaveInstanceState(Activity a, Bundle b) { }
            @Override public void onActivityDestroyed(Activity a) { }
        });
    }

    private static SharedPreferences prefs(Context context) {
        return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    // ------------------------------------------------- pure helpers (unit-testable)

    static Intent buildBrowserIntent(String url) {
        Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
        // Ask Chrome-family browsers for a Custom Tab (same extra the androidx helper sets).
        Bundle extras = new Bundle();
        extras.putBinder("android.support.customtabs.extra.SESSION", null);
        intent.putExtras(extras);
        return intent;
    }

    static String buildAuthUrl(String codeChallenge, String oauthState) {
        return AUTH_ENDPOINT
                + "?client_id=" + enc(CLIENT_ID)
                + "&redirect_uri=" + enc(REDIRECT_URI)
                + "&response_type=code"
                + "&scope=" + enc(SCOPE)
                + "&code_challenge=" + codeChallenge
                + "&code_challenge_method=S256"
                + "&state=" + oauthState
                + "&access_type=offline"
                + "&prompt=" + enc("select_account consent");
    }

    static String randomUrlSafe(int byteCount) {
        byte[] bytes = new byte[byteCount];
        new SecureRandom().nextBytes(bytes);
        return base64Url(bytes);
    }

    static String challenge(String verifier) throws NoSuchAlgorithmException {
        MessageDigest sha256 = MessageDigest.getInstance("SHA-256");
        return base64Url(sha256.digest(verifier.getBytes(StandardCharsets.US_ASCII)));
    }

    static String base64Url(byte[] bytes) {
        return Base64.encodeToString(bytes, Base64.URL_SAFE | Base64.NO_PADDING | Base64.NO_WRAP);
    }

    static String emailFromIdToken(String jwt) {
        try {
            String[] parts = jwt.split("\\.");
            if (parts.length < 2) return "";
            byte[] payload = Base64.decode(parts[1], Base64.URL_SAFE);
            return new JSONObject(new String(payload, StandardCharsets.UTF_8)).optString("email", "");
        } catch (Throwable t) {
            return "";
        }
    }

    private static String enc(String value) {
        try {
            return URLEncoder.encode(value, "UTF-8");
        } catch (java.io.UnsupportedEncodingException e) {
            throw new IllegalStateException(e);
        }
    }

    static final class HttpFailure extends IOException {
        final int code;
        final String body;

        HttpFailure(int code, String body) {
            super("HTTP " + code);
            this.code = code;
            this.body = body;
        }
    }

    static String httpPost(String endpoint, String formBody) throws IOException {
        HttpURLConnection conn = (HttpURLConnection) new URL(endpoint).openConnection();
        try {
            byte[] bytes = formBody.getBytes(StandardCharsets.UTF_8);
            conn.setRequestMethod("POST");
            conn.setConnectTimeout(15_000);
            conn.setReadTimeout(20_000);
            conn.setDoOutput(true);
            conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            conn.setFixedLengthStreamingMode(bytes.length);
            OutputStream out = conn.getOutputStream();
            try {
                out.write(bytes);
            } finally {
                out.close();
            }
            int code = conn.getResponseCode();
            InputStream in = code >= 400 ? conn.getErrorStream() : conn.getInputStream();
            String body = readAll(in);
            if (code >= 400) throw new HttpFailure(code, body);
            return body;
        } finally {
            conn.disconnect();
        }
    }

    private static String readAll(InputStream in) throws IOException {
        if (in == null) return "";
        try {
            ByteArrayOutputStream buffer = new ByteArrayOutputStream();
            byte[] chunk = new byte[4096];
            int n;
            while ((n = in.read(chunk)) != -1) buffer.write(chunk, 0, n);
            return new String(buffer.toByteArray(), StandardCharsets.UTF_8);
        } finally {
            in.close();
        }
    }
}
