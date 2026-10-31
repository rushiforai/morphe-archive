/*
 * Adapted from KingOfPoptart/patcheddit (https://github.com/KingOfPoptart/patcheddit, wchill/patcheddit#100),
 * with follow-ups from pdscomp, built on wchill/patcheddit's FixRedgifsApiPatch
 * (https://github.com/wchill/patcheddit), GPLv3.
 */
package app.syncfixes.extension.syncforreddit;

import android.util.Log;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import okhttp3.Interceptor;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Protocol;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;

/**
 * Sync loads a Redgifs video with three Volley requests: an OAuth token from /v2/oauth/client, the client IP
 * from /info, then /v2/gifs/{id}. Redgifs removed both of the first two endpoints, so the chain fails with
 * "Error connecting to Redgifs". This interceptor, installed on the OkHttp client behind Volley, answers both
 * locally, using Redgifs' current temporary token, and retries /v2/gifs with a fresh token when Redgifs
 * rejects the one it has (tokens are tied to the IP address that requested them).
 */
@SuppressWarnings("unused")
public final class FixRedgifsApiPatch implements Interceptor {
    private static final String HOST = "api.redgifs.com";
    private static final String TEMPORARY_TOKEN_URL = "https://" + HOST + "/v2/auth/temporary";
    /** Redgifs tokens last a day; refresh an hour early. */
    private static final long TOKEN_LIFETIME_MILLIS = 23 * 60 * 60 * 1000L;
    private static final MediaType JSON = MediaType.get("application/json");

    private static final FixRedgifsApiPatch INSTANCE = new FixRedgifsApiPatch();
    /** Tokens by user agent: Redgifs checks that requests use the user agent the token was issued to. */
    private static final Map<String, Token> TOKENS = new HashMap<>();

    private FixRedgifsApiPatch() {
    }

    /** Replaces OkHttpClient.Builder.build() for the client behind Sync's Volley requests. */
    public static OkHttpClient install(OkHttpClient.Builder builder) {
        return builder.addInterceptor(INSTANCE).build();
    }

    /** Sync's own user agent. Filled in by the patch. */
    private static String defaultUserAgent() {
        return "";
    }

    @Override
    public Response intercept(Chain chain) throws IOException {
        Request request = chain.request();
        if (!HOST.equals(request.url().host())) {
            return chain.proceed(request);
        }
        String path = request.url().encodedPath();

        // Only used to fill the legacy user-addr parameter, which Redgifs now ignores.
        if (path.equals("/info")) {
            return localJson(request, "{\"remote-addr\":\"0.0.0.0\"}");
        }

        String userAgent = defaultUserAgent();
        boolean forceRefresh = false;
        if (request.header("Authorization") != null && !path.equals("/v2/oauth/client")) {
            Response response = chain.proceed(request.newBuilder().header("User-Agent", userAgent).build());
            if (response.isSuccessful()) {
                return response;
            }
            Log.w(Responses.TAG, "Redgifs " + path + " returned " + response.code() + ", refreshing token");
            // A later interceptor may have replaced the user agent: the token must match the one sent.
            String sentUserAgent = response.request().header("User-Agent");
            if (sentUserAgent != null && !sentUserAgent.isEmpty()) {
                userAgent = sentUserAgent;
            }
            response.close();
            forceRefresh = true;
        }

        try {
            Token token = token(userAgent, forceRefresh);
            if (path.equals("/v2/oauth/client")) {
                return localJson(request, new JSONObject()
                        .put("access_token", token.value)
                        .put("expiry_time", (token.expiresAtMillis - System.currentTimeMillis()) / 1000)
                        .put("scope", "read")
                        .put("token_type", "Bearer")
                        .toString());
            }
            return chain.proceed(request.newBuilder()
                    .header("Authorization", "Bearer " + token.value)
                    .header("User-Agent", userAgent)
                    .build());
        } catch (JSONException e) {
            throw new IOException("Could not read Redgifs token", e);
        }
    }

    private static Token token(String userAgent, boolean forceRefresh) throws IOException, JSONException {
        synchronized (TOKENS) {
            Token token = TOKENS.get(userAgent);
            if (!forceRefresh && token != null && token.expiresAtMillis > System.currentTimeMillis()) {
                return token;
            }
            HttpURLConnection connection = (HttpURLConnection) new URL(TEMPORARY_TOKEN_URL).openConnection();
            try {
                connection.setRequestProperty("User-Agent", userAgent);
                connection.setRequestProperty("Accept", "application/json");
                connection.setUseCaches(false);
                int code = connection.getResponseCode();
                if (code != HttpURLConnection.HTTP_OK) {
                    throw new IOException("Redgifs temporary token request returned " + code);
                }
                String value = new JSONObject(read(connection.getInputStream())).getString("token");
                token = new Token(value, System.currentTimeMillis() + TOKEN_LIFETIME_MILLIS);
            } finally {
                connection.disconnect();
            }
            TOKENS.put(userAgent, token);
            return token;
        }
    }

    private static Response localJson(Request request, String body) {
        return new Response.Builder()
                .request(request)
                .protocol(Protocol.HTTP_1_1)
                .code(HttpURLConnection.HTTP_OK)
                .message("OK")
                .header("Content-Type", "application/json")
                .body(ResponseBody.create(body, JSON))
                .build();
    }

    private static String read(InputStream in) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        byte[] buffer = new byte[4096];
        try {
            for (int n; (n = in.read(buffer)) >= 0; ) {
                out.write(buffer, 0, n);
            }
        } finally {
            in.close();
        }
        return out.toString("UTF-8");
    }

    /**
     * Replaces Sync's LinkHandler.getGfycatId, which builds the /v2/gifs/{id} URL. The original strips a
     * trailing slash before the query, so "redgifs.com/watch/{id}/?92/" gives an empty id and a 404. Here the
     * query and fragment go first; the suffix cleanup is the original's.
     */
    public static String extractGifId(String url) {
        if (url == null) {
            return null;
        }
        int query = url.indexOf('?');
        if (query >= 0) {
            url = url.substring(0, query);
        }
        int fragment = url.indexOf('#');
        if (fragment >= 0) {
            url = url.substring(0, fragment);
        }
        if (url.endsWith("/")) {
            url = url.substring(0, url.length() - 1);
        }
        String id = url.substring(url.lastIndexOf('/') + 1)
                .replace(".gif", "").replace(".mp4", "").replace(".webm", "")
                .replace("-mobile", "").replace("-size_restricted", "").replace("-max-1mb-poster", "");
        return id.contains("-") ? id.split("-")[0] : id;
    }

    private static final class Token {
        final String value;
        final long expiresAtMillis;

        Token(String value, long expiresAtMillis) {
            this.value = value;
            this.expiresAtMillis = expiresAtMillis;
        }
    }
}
