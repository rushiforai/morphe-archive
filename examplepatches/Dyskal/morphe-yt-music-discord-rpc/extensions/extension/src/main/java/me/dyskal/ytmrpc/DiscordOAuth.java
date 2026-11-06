package me.dyskal.ytmrpc;

import org.json.JSONObject;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;

import okhttp3.Call;
import okhttp3.FormBody;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

/** Public-client OAuth with a whole-call timeout and explicit cancellation. */
public final class DiscordOAuth {
    public static final String REDIRECT_URI = "ytmdiscord://oauth2/callback";
    public static final String SCOPES = "openid sdk.social_layer_presence";
    private static final String AUTHORIZE_URL = "https://discord.com/oauth2/authorize";
    private static final Map<String, DiscordFailure.Kind> ERROR_KINDS = new HashMap<>();
    static {
        ERROR_KINDS.put("invalid_grant", DiscordFailure.Kind.AUTHORIZATION);
        ERROR_KINDS.put("invalid_token", DiscordFailure.Kind.AUTHORIZATION);
        ERROR_KINDS.put("invalid_client", DiscordFailure.Kind.CONFIGURATION);
        ERROR_KINDS.put("unauthorized_client", DiscordFailure.Kind.CONFIGURATION);
        ERROR_KINDS.put("invalid_scope", DiscordFailure.Kind.CONFIGURATION);
        ERROR_KINDS.put("access_denied", DiscordFailure.Kind.CONFIGURATION);
        ERROR_KINDS.put("unsupported_grant_type", DiscordFailure.Kind.CONFIGURATION);
    }
    private static final OkHttpClient HTTP = Http.CLIENT.newBuilder()
            .connectTimeout(10, TimeUnit.SECONDS).readTimeout(15, TimeUnit.SECONDS)
            .callTimeout(15, TimeUnit.SECONDS).build();
    private final String tokenEndpoint;
    private final OkHttpClient http;
    private final AtomicReference<Call> active = new AtomicReference<>();
    private final AtomicBoolean cancelled = new AtomicBoolean();

    public DiscordOAuth() { this("https://discord.com/api/v10/oauth2/token"); }
    DiscordOAuth(String tokenEndpoint) { this(tokenEndpoint, HTTP); }
    DiscordOAuth(String tokenEndpoint, OkHttpClient http) { this.tokenEndpoint = tokenEndpoint; this.http = http; }

    public void cancel() {
        cancelled.set(true);
        Call call = active.get();
        if (call != null) call.cancel();
    }

    public boolean isCancelled() { return cancelled.get(); }

    public static String randomSecret() {
        byte[] bytes = new byte[32];
        new SecureRandom().nextBytes(bytes);
        return Base64.getUrlEncoder().withoutPadding().encodeToString(bytes);
    }

    public static String challenge(String verifier) throws Exception {
        return Base64.getUrlEncoder().withoutPadding().encodeToString(
                MessageDigest.getInstance("SHA-256").digest(verifier.getBytes(StandardCharsets.US_ASCII)));
    }

    public static boolean isValidApplicationId(String appId) { return appId != null && appId.matches("[0-9]{17,20}"); }

    public static String authorizeUrl(String appId, String state, String verifier) throws Exception {
        if (!isValidApplicationId(appId)) throw new DiscordFailure(DiscordFailure.Kind.CONFIGURATION, "Enter a valid 17–20 digit application ID");
        return AUTHORIZE_URL + "?client_id=" + appId
                + "&response_type=code&redirect_uri=" + encode(REDIRECT_URI)
                + "&scope=" + encode(SCOPES) + "&state=" + encode(state)
                + "&code_challenge_method=S256&code_challenge=" + challenge(verifier);
    }

    static String appAuthorizeUrl(String browserUrl) {
        if (!browserUrl.startsWith(AUTHORIZE_URL + "?")) throw new IllegalArgumentException("Not a Discord authorization URL");
        return "discord://action/oauth2/authorize" + browserUrl.substring(AUTHORIZE_URL.length());
    }

    public JSONObject exchange(String appId, String code, String verifier) throws Exception {
        return request(new FormBody.Builder().add("client_id", appId).add("grant_type", "authorization_code")
                .add("code", code).add("redirect_uri", REDIRECT_URI).add("code_verifier", verifier).build());
    }

    public JSONObject refresh(String appId, String refreshToken) throws Exception {
        return request(new FormBody.Builder().add("client_id", appId).add("grant_type", "refresh_token")
                .add("refresh_token", refreshToken).build());
    }

    private JSONObject request(FormBody form) throws Exception {
        if (cancelled.get() || Thread.currentThread().isInterrupted()) throw cancelledFailure();
        Call call = http.newCall(new Request.Builder().url(tokenEndpoint).post(form).build());
        active.set(call);
        if (cancelled.get()) call.cancel();
        try (Response response = call.execute()) {
            if (cancelled.get()) throw cancelledFailure();
            String body = Http.readBody(response, "Discord OAuth");
            if (!response.isSuccessful()) throw httpFailure(response.code(), body, response.header("Retry-After"));
            JSONObject result;
            try { result = new JSONObject(body); }
            catch (Exception error) { throw new DiscordFailure(DiscordFailure.Kind.PROTOCOL, "Discord returned invalid OAuth JSON"); }
            if (!"Bearer".equalsIgnoreCase(result.optString("token_type"))
                    || result.optString("access_token").isEmpty() || result.optLong("expires_in") <= 0) {
                throw new DiscordFailure(DiscordFailure.Kind.PROTOCOL, "Discord returned an invalid OAuth token response");
            }
            // OAuth may omit an unchanged scope on refresh; an explicitly returned scope must include presence.
            if (result.has("scope") && !(" " + result.optString("scope") + " ").contains(" sdk.social_layer_presence ")) {
                throw new DiscordFailure(DiscordFailure.Kind.CONFIGURATION, "Discord presence scope not granted; check Social SDK configuration");
            }
            return result;
        } catch (DiscordFailure error) {
            throw error;
        } catch (IOException error) {
            throw cancelled.get() || Thread.currentThread().isInterrupted() ? cancelledFailure() : DiscordFailure.network(error);
        } finally { active.compareAndSet(call, null); }
    }

    private static DiscordFailure httpFailure(int status, String body, String retryAfter) {
        String code = "";
        try {
            String value = new JSONObject(body).optString("error");
            if (ERROR_KINDS.containsKey(value)) code = value;
        } catch (Exception ignored) { }
        DiscordFailure.Kind kind = ERROR_KINDS.get(code);
        if (kind == null) kind = status == 401 ? DiscordFailure.Kind.AUTHORIZATION
                : status == 429 || status >= 500 ? DiscordFailure.Kind.TRANSIENT : DiscordFailure.Kind.CONFIGURATION;
        return new DiscordFailure(kind, "Discord OAuth HTTP " + status + (code.isEmpty() ? "" : " (" + code + ")"),
                status, Http.retryAfterMillis(retryAfter, 0));
    }

    private static DiscordFailure cancelledFailure() { return new DiscordFailure(DiscordFailure.Kind.CANCELLED, "Authorization cancelled"); }
    private static String encode(String value) throws Exception { return URLEncoder.encode(value, "UTF-8"); }
}
