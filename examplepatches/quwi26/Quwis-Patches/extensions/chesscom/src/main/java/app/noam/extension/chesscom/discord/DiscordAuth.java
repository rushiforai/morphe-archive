package app.noam.extension.chesscom.discord;

import android.content.Context;
import android.net.Uri;
import android.util.Base64;

import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.security.SecureRandom;

/**
 * Discord's OAuth2 with PKCE, the same way the Social SDK connects a phone app: the browser owns
 * the password, and this keeps the two tokens the gateway accepts.
 */
public final class DiscordAuth {
    private static final SecureRandom RANDOM = new SecureRandom();

    private DiscordAuth() {}

    /** Whether the app was built with a Discord application at all. */
    public static boolean configured(Context context) {
        return DiscordApp.configured(context);
    }

    public static boolean linked() {
        return !DiscordSettings.get(DiscordSettings.KEY_REFRESH, "").isEmpty();
    }

    public static String userName() {
        return DiscordSettings.get(DiscordSettings.KEY_USER, "");
    }

    public static void signOut() {
        DiscordSettings.put(DiscordSettings.KEY_ACCESS, "");
        DiscordSettings.put(DiscordSettings.KEY_REFRESH, "");
        DiscordSettings.put(DiscordSettings.KEY_USER, "");
        DiscordSettings.put(DiscordSettings.KEY_VERIFIER, "");
        DiscordSettings.put(DiscordSettings.KEY_STATE, "");
        DiscordSettings.putLong(DiscordSettings.KEY_EXPIRES, 0);
    }

    /** The page to open: Discord's consent screen, with this app's own PKCE challenge. */
    public static String begin(Context context) {
        String verifier = random(64);
        String state = random(32);
        DiscordSettings.put(DiscordSettings.KEY_VERIFIER, verifier);
        DiscordSettings.put(DiscordSettings.KEY_STATE, state);
        return Uri.parse(DiscordApp.AUTHORIZE_ENDPOINT).buildUpon()
            .appendQueryParameter("client_id", DiscordApp.clientId(context))
            .appendQueryParameter("response_type", "code")
            .appendQueryParameter("redirect_uri", DiscordApp.redirectUri(context))
            .appendQueryParameter("scope", DiscordApp.SCOPES)
            .appendQueryParameter("state", state)
            .appendQueryParameter("code_challenge", challenge(verifier))
            .appendQueryParameter("code_challenge_method", "S256")
            .build()
            .toString();
    }

    /**
     * Takes Discord's redirect: checks that it belongs to this app and to a login started here,
     * then trades the code for the tokens.
     *
     * @return the Discord name to show in the settings
     */
    static String complete(Context context, Uri redirect) throws IOException {
        if (redirect == null) throw new IOException("Discord sent no answer. Try again.");
        String scheme = "discord-" + DiscordApp.clientId(context);
        if (!scheme.equals(redirect.getScheme())) {
            throw new IOException("That link is not a Discord login for this app.");
        }
        String error = redirect.getQueryParameter("error");
        if (error != null) throw new IOException(describe(error));
        String code = redirect.getQueryParameter("code");
        if (code == null) throw new IOException("Discord sent no code. Try again.");

        String state = DiscordSettings.get(DiscordSettings.KEY_STATE, "");
        String returned = redirect.getQueryParameter("state");
        if (state.isEmpty() || !state.equals(returned)) {
            throw new IOException("This login did not start here. Try again from the settings.");
        }
        String verifier = DiscordSettings.get(DiscordSettings.KEY_VERIFIER, "");
        if (verifier.isEmpty()) throw new IOException("This login expired. Try again from the settings.");

        String body = form(
            "client_id", DiscordApp.clientId(context),
            "grant_type", "authorization_code",
            "code", code,
            "redirect_uri", DiscordApp.redirectUri(context),
            "code_verifier", verifier
        );
        store(parse(request(DiscordApp.TOKEN_ENDPOINT, "POST", body, null)));
        DiscordSettings.put(DiscordSettings.KEY_VERIFIER, "");
        DiscordSettings.put(DiscordSettings.KEY_STATE, "");

        String name = fetchUserName(context);
        return name.isEmpty() ? "" : name;
    }

    /** A token the gateway accepts now, refreshed first when it is about to run out. */
    static String accessToken(Context context) throws IOException {
        String access = DiscordSettings.get(DiscordSettings.KEY_ACCESS, "");
        long expiresAt = DiscordSettings.getLong(DiscordSettings.KEY_EXPIRES);
        if (!access.isEmpty() && System.currentTimeMillis() < expiresAt - 60_000L) return access;
        return refresh(context);
    }

    private static String refresh(Context context) throws IOException {
        String refresh = DiscordSettings.get(DiscordSettings.KEY_REFRESH, "");
        if (refresh.isEmpty()) throw new IOException("Discord is not connected.");
        String body = form(
            "client_id", DiscordApp.clientId(context),
            "grant_type", "refresh_token",
            "refresh_token", refresh
        );
        try {
            store(parse(request(DiscordApp.TOKEN_ENDPOINT, "POST", body, null)));
        } catch (Refused refusal) {
            // A revoked or used-up refresh token means the user has to connect again. Anything else,
            // a flat network included, keeps the link for the next try.
            signOut();
            throw new IOException("Discord needs to be connected again.");
        }
        String access = DiscordSettings.get(DiscordSettings.KEY_ACCESS, "");
        if (access.isEmpty()) throw new IOException("Discord needs to be connected again.");
        return access;
    }

    private static void store(JSONObject tokens) throws IOException {
        String access = tokens.optString("access_token", "");
        if (access.isEmpty()) throw new IOException("Discord sent no token. Try again.");
        long expiresIn = tokens.optLong("expires_in", 0);
        String refresh = tokens.optString("refresh_token", "");
        DiscordSettings.put(DiscordSettings.KEY_ACCESS, access);
        if (!refresh.isEmpty()) DiscordSettings.put(DiscordSettings.KEY_REFRESH, refresh);
        DiscordSettings.putLong(DiscordSettings.KEY_EXPIRES,
            System.currentTimeMillis() + Math.max(0, expiresIn) * 1000L);
    }

    /** The name shown on the settings page; an empty string when Discord keeps quiet about it. */
    private static String fetchUserName(Context context) {
        try {
            JSONObject user = parse(request(DiscordApp.USER_ENDPOINT, "GET", null,
                DiscordSettings.get(DiscordSettings.KEY_ACCESS, "")));
            String global = user.optString("global_name", "");
            String name = global.isEmpty() ? user.optString("username", "") : global;
            DiscordSettings.put(DiscordSettings.KEY_USER, name);
            return name;
        } catch (Throwable ignored) {
            // Connected either way; the name is only a label.
            return "";
        }
    }

    /** A JSON answer from Discord, or the reason it refused, as text for the user. */
    private static String request(String endpoint, String method, String body, String bearer)
        throws IOException {
        HttpURLConnection connection = null;
        try {
            connection = (HttpURLConnection) new URL(endpoint).openConnection();
            connection.setConnectTimeout(15_000);
            connection.setReadTimeout(20_000);
            connection.setRequestMethod(method);
            connection.setRequestProperty("User-Agent", DiscordApp.USER_AGENT);
            connection.setRequestProperty("Accept", "application/json");
            if (bearer != null && !bearer.isEmpty()) {
                connection.setRequestProperty("Authorization", "Bearer " + bearer);
            }
            if (body != null) {
                connection.setDoOutput(true);
                connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
                byte[] payload = body.getBytes("UTF-8");
                OutputStream out = connection.getOutputStream();
                out.write(payload);
                out.close();
            }
            int status = connection.getResponseCode();
            InputStream stream = status >= 400 ? connection.getErrorStream() : connection.getInputStream();
            String text = read(stream);
            if (status >= 400) throw new Refused(refusal(text, status));
            return text;
        } finally {
            if (connection != null) connection.disconnect();
        }
    }

    private static String read(InputStream stream) throws IOException {
        if (stream == null) return "";
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        byte[] buffer = new byte[4096];
        int count;
        while ((count = stream.read(buffer)) != -1) bytes.write(buffer, 0, count);
        stream.close();
        return new String(bytes.toByteArray(), "UTF-8");
    }

    /** Discord's answer as JSON, or a plain reason when it is not JSON at all. */
    private static JSONObject parse(String text) throws IOException {
        try {
            return new JSONObject(text);
        } catch (Throwable failure) {
            throw new IOException("Discord sent an answer this app could not read.");
        }
    }

    /** Discord answered, and said no. The only case where a stored token is worth throwing away. */
    static final class Refused extends IOException {
        Refused(String message) {
            super(message);
        }
    }

    /** Discord's own error code, never the raw body, so nothing private reaches a toast. */
    private static String refusal(String text, int status) {
        try {
            JSONObject json = new JSONObject(text);
            String error = json.optString("error", "");
            String description = json.optString("error_description", "");
            if (error.equals("invalid_grant")) return "Discord did not accept the login. Try again.";
            if (!description.isEmpty()) return "Discord: " + description;
            if (!error.isEmpty()) return describe(error);
        } catch (Throwable ignored) {
            // Not JSON: report the status alone.
        }
        return "Discord answered " + status + ". Try again.";
    }

    private static String describe(String error) {
        if ("access_denied".equals(error)) return "Discord was not connected.";
        if ("invalid_scope".equals(error)) {
            return "Discord did not allow this app to show activity.";
        }
        return "Discord said: " + error;
    }

    static String form(String... pairs) {
        StringBuilder body = new StringBuilder();
        for (int i = 0; i + 1 < pairs.length; i += 2) {
            if (body.length() > 0) body.append('&');
            body.append(encode(pairs[i])).append('=').append(encode(pairs[i + 1]));
        }
        return body.toString();
    }

    private static String encode(String value) {
        try {
            return URLEncoder.encode(value, "UTF-8");
        } catch (IOException impossible) {
            return value;
        }
    }

    private static String random(int bytes) {
        byte[] value = new byte[bytes];
        RANDOM.nextBytes(value);
        return Base64.encodeToString(value, Base64.NO_WRAP | Base64.NO_PADDING | Base64.URL_SAFE);
    }

    private static String challenge(String verifier) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            return Base64.encodeToString(digest.digest(verifier.getBytes("US-ASCII")),
                Base64.NO_WRAP | Base64.NO_PADDING | Base64.URL_SAFE);
        } catch (Throwable impossible) {
            throw new IllegalStateException("SHA-256 is not on this phone", impossible);
        }
    }
}
