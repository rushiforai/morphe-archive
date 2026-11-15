package app.hoitruyenchu.extension.itruyenchu.patches.login;

import android.os.SystemClock;
import android.util.Log;

import org.json.JSONObject;

import java.io.IOException;

import okhttp3.HttpUrl;
import okhttp3.Interceptor;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;
import okhttp3.ResponseBody;
import okio.Buffer;

/**
 * Fixes "Đăng nhập với Google".
 * <p>
 * App 2.1.0 signs in to Firebase with the Google account and then sends
 * {@code POST /auth/login-firebase {"email": ...}}. The server now only accepts the
 * Firebase ID token, like the website does ({@code {"idToken": await user.getIdToken()}}),
 * and answers 400 to the old request.
 * <p>
 * This OkHttp interceptor (added to React Native's networking client) remembers the Firebase
 * ID token from the Firebase sign-in response ({@code accounts:signInWithIdp}) and sends it
 * in place of the email. If the answer has no {@code user}, the profile is fetched and added,
 * like the website's fetchUser().
 * The tokens are never logged.
 */
@SuppressWarnings("unused")
public final class FixGoogleLoginPatch implements Interceptor {
    private static final String TAG = "HTC-Login";

    private static final String LOGIN_PATH = "/auth/login-firebase";
    private static final String PROFILE_PATH = "/auth/profile";
    /** Firebase ID tokens are valid for one hour. */
    private static final long TOKEN_MAX_AGE_MS = 50 * 60_000;
    private static final long MAX_PEEK_BYTES = 1 << 20;

    private static volatile String firebaseIdToken;
    private static volatile long firebaseIdTokenAt;

    private FixGoogleLoginPatch() {
    }

    /** Called from OkHttpClientProvider.createClientBuilder() before it returns the builder. */
    public static void onCreateClientBuilder(OkHttpClient.Builder builder) {
        try {
            if (builder != null) builder.addInterceptor(new FixGoogleLoginPatch());
        } catch (Throwable t) {
            Log.e(TAG, "could not add interceptor", t);
        }
    }

    @Override
    public Response intercept(Chain chain) throws IOException {
        Request request = chain.request();
        HttpUrl url = request.url();
        String host = url.host();
        String path = url.encodedPath();

        if ("identitytoolkit.googleapis.com".equals(host) && path.contains("signInWithIdp")) {
            Response response = chain.proceed(request);
            rememberToken(response, "idToken");
            return response;
        }
        if ("securetoken.googleapis.com".equals(host)) {
            Response response = chain.proceed(request);
            rememberToken(response, "id_token");
            return response;
        }
        if ("POST".equals(request.method()) && path.endsWith(LOGIN_PATH)) {
            return login(chain, request);
        }
        return chain.proceed(request);
    }

    private static void rememberToken(Response response, String field) {
        try {
            if (!response.isSuccessful()) return;
            JSONObject json = new JSONObject(response.peekBody(MAX_PEEK_BYTES).string());
            String token = json.optString(field, "");
            if (!token.isEmpty()) {
                firebaseIdToken = token;
                firebaseIdTokenAt = SystemClock.elapsedRealtime();
                Log.i(TAG, "Firebase sign-in seen");
            }
        } catch (Throwable t) {
            Log.w(TAG, "could not read Firebase response: " + t);
        }
    }

    private static Response login(Chain chain, Request request) throws IOException {
        JSONObject sent = readJson(request.body());
        if (sent != null && sent.has("idToken")) {
            return chain.proceed(request); // Already the new format.
        }
        String token = firebaseIdToken;
        if (token == null || SystemClock.elapsedRealtime() - firebaseIdTokenAt > TOKEN_MAX_AGE_MS) {
            Log.w(TAG, "no recent Firebase sign-in, sending the original login request");
            return chain.proceed(request);
        }

        String body;
        try {
            body = new JSONObject().put("idToken", token).toString();
        } catch (Throwable t) {
            return chain.proceed(request);
        }
        MediaType json = MediaType.parse("application/json; charset=utf-8");
        Request fixed = request.newBuilder().post(RequestBody.create(json, body)).build();
        Response response = chain.proceed(fixed);
        if (!response.isSuccessful()) {
            Log.w(TAG, "login with Firebase ID token -> HTTP " + response.code());
            return response;
        }
        firebaseIdToken = null;
        Log.i(TAG, "logged in with the Firebase ID token");

        ResponseBody responseBody = response.body();
        if (responseBody == null) return response;
        MediaType type = responseBody.contentType();
        String text = responseBody.string();
        try {
            JSONObject data = new JSONObject(text);
            String accessToken = data.optString("accessToken", "");
            if ((!data.has("user") || data.isNull("user")) && !accessToken.isEmpty()) {
                Object profile = fetchProfile(chain, request, accessToken);
                if (profile != null) data.put("user", profile);
            }
            text = data.toString();
        } catch (Throwable t) {
            Log.w(TAG, "could not complete the login answer: " + t);
        }
        return response.newBuilder().body(ResponseBody.create(type != null ? type : json, text)).build();
    }

    /** GET /auth/profile -> {profile, accessToken}; returns profile. */
    private static Object fetchProfile(Chain chain, Request login, String accessToken) {
        try {
            String loginUrl = login.url().toString();
            String profileUrl = loginUrl.substring(0, loginUrl.lastIndexOf(LOGIN_PATH)) + PROFILE_PATH;
            Request request = login.newBuilder()
                    .url(profileUrl)
                    .get()
                    .removeHeader("Content-Type")
                    .header("Authorization", "Bearer " + accessToken)
                    .build();
            try (Response response = chain.proceed(request)) {
                if (!response.isSuccessful() || response.body() == null) {
                    Log.w(TAG, "profile -> HTTP " + response.code());
                    return null;
                }
                JSONObject json = new JSONObject(response.body().string());
                Object profile = json.opt("profile");
                return profile == null || profile == JSONObject.NULL ? null : profile;
            }
        } catch (Throwable t) {
            Log.w(TAG, "fetching the profile failed: " + t);
            return null;
        }
    }

    private static JSONObject readJson(RequestBody body) {
        if (body == null) return null;
        try {
            Buffer buffer = new Buffer();
            body.writeTo(buffer);
            return new JSONObject(buffer.readUtf8());
        } catch (Throwable t) {
            return null;
        }
    }
}
