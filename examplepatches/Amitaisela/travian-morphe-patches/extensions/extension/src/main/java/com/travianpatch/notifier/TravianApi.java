package com.travianpatch.notifier;

import android.util.Base64;

import org.json.JSONObject;

import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.concurrent.TimeUnit;

import okhttp3.CookieJar;
import okhttp3.HttpUrl;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;
import okio.BufferedSink;

/**
 * Shared constants + HTTP/PKCE helpers for talking to Travian's own
 * identity+lobby API (discovered via traffic capture). Used by both the
 * one-time login screen and the background poller so the two don't drift.
 */
final class TravianApi {

    static final String CLIENT_ID = "HIaSfC2LNQ1yXOMuY7Pc2uIH3EqkAi26";
    static final String IDENTITY_HOST = "https://identity.service.legends.travian.info";
    static final String LOBBY_HOST = "https://lobby.legends.travian.com";
    static final String LOBBY_SESSION_COOKIE = "_tl_lobby_session";

    private static final MediaType JSON = MediaType.parse("application/json; charset=utf-8");

    private TravianApi() {
    }

    static OkHttpClient newClient(CookieJar cookieJar) {
        return new OkHttpClient.Builder()
                .cookieJar(cookieJar)
                .connectTimeout(15, TimeUnit.SECONDS)
                .readTimeout(15, TimeUnit.SECONDS)
                .build();
    }

    static String hostOf(String url) {
        HttpUrl parsed = HttpUrl.parse(url);
        return parsed != null ? parsed.host() : null;
    }

    static JSONObject postJson(OkHttpClient http, String url, JSONObject body) throws Exception {
        Request req = new Request.Builder()
                .url(url)
                .post(jsonBody(body.toString()))
                .build();
        return executeJson(http, req);
    }

    static JSONObject executeJson(OkHttpClient http, Request req) throws Exception {
        Response resp = http.newCall(req).execute();
        try {
            String bodyStr = resp.body() != null ? resp.body().string() : "";
            if (bodyStr.length() == 0) {
                return new JSONObject();
            }
            return new JSONObject(bodyStr);
        } finally {
            resp.close();
        }
    }

    // ------------------------------------------------------------------
    // request body helpers (avoids OkHttp version-specific RequestBody.create
    // overload ordering, which differs between OkHttp 3.x and 4.x)
    // ------------------------------------------------------------------

    static RequestBody jsonBody(final String content) {
        return new RequestBody() {
            @Override
            public MediaType contentType() {
                return JSON;
            }

            @Override
            public void writeTo(BufferedSink sink) throws java.io.IOException {
                sink.writeUtf8(content);
            }
        };
    }

    static RequestBody emptyBody() {
        return new RequestBody() {
            @Override
            public MediaType contentType() {
                return null;
            }

            @Override
            public void writeTo(BufferedSink sink) throws java.io.IOException {
                // no body
            }
        };
    }

    // ------------------------------------------------------------------
    // PKCE helpers
    // ------------------------------------------------------------------

    static String randomUrlSafe(int numBytes) {
        byte[] b = new byte[numBytes];
        new SecureRandom().nextBytes(b);
        return Base64.encodeToString(b, Base64.URL_SAFE | Base64.NO_PADDING | Base64.NO_WRAP);
    }

    static String sha256UrlSafe(String input) throws Exception {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        byte[] hash = digest.digest(input.getBytes("UTF-8"));
        return Base64.encodeToString(hash, Base64.URL_SAFE | Base64.NO_PADDING | Base64.NO_WRAP);
    }
}
