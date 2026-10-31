package app.morphe.extension.shared.fixes.redgifs;

import static app.morphe.extension.shared.requests.Route.Method.GET;

import androidx.annotation.GuardedBy;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.requests.Requester;


/**
 * Manages Redgifs token lifecycle.
 */
public class RedgifsTokenManager {
    public static class RedgifsToken {
        // Expire after 23 hours to provide some breathing room
        private static final long EXPIRY_SECONDS = 23 * 60 * 60;

        private final String accessToken;
        private final long refreshTimeInSeconds;

        public RedgifsToken(String accessToken, long refreshTime) {
            this.accessToken = accessToken;
            this.refreshTimeInSeconds = refreshTime;
        }

        public String getAccessToken() {
            return accessToken;
        }

        public long getExpiryTimeInSeconds() {
            return refreshTimeInSeconds + EXPIRY_SECONDS;
        }

        public boolean isValid() {
            if (accessToken == null) return false;
            return getExpiryTimeInSeconds() >= System.currentTimeMillis() / 1000;
        }
    }
    public static final String REDGIFS_API_HOST = "https://api.redgifs.com";
    private static final String GET_TEMPORARY_TOKEN = REDGIFS_API_HOST + "/v2/auth/temporary";
    @GuardedBy("itself")
    private static final Map<String, RedgifsToken> tokenMap = new HashMap<>();

    private static String getToken(String userAgent) throws IOException, JSONException {
        HttpURLConnection connection = (HttpURLConnection) new URL(GET_TEMPORARY_TOKEN).openConnection();
        connection.setFixedLengthStreamingMode(0);
        connection.setRequestMethod(GET.name());
        connection.setRequestProperty("User-Agent", userAgent);
        connection.setRequestProperty("Content-Type", "application/json");
        connection.setRequestProperty("Accept", "application/json");
        connection.setUseCaches(false);

        // Says whether a token could be had at all, which is what separates a network Redgifs
        // will not issue one on from a token that was issued and then refused.
        int code = connection.getResponseCode();
        if (code != HttpURLConnection.HTTP_OK) {
            Logger.printInfo(() -> "Redgifs would not issue a token: " + code + " "
                    + connection.getHeaderField("Content-Type"));
            throw new IOException("Redgifs answered " + code + " asking for a token");
        }

        JSONObject responseObject = Requester.parseJSONObject(connection);
        return responseObject.getString("token");
    }

    /**
     * Drops the token held for a user agent so that the next request fetches a new one.
     *
     * <p>A temporary token is tied to the address it was issued for, so moving between networks
     * invalidates it long before it expires. Nothing in the token says so: it goes on looking
     * perfectly valid, and every request made with it is refused, which is why the only way out
     * of this used to be restarting the app.
     */
    public static void invalidateToken(String userAgent) {
        synchronized (tokenMap) {
            tokenMap.remove(userAgent);
        }
    }

    public static RedgifsToken refreshToken(String userAgent) throws IOException, JSONException {
        return refreshToken(userAgent, false);
    }

    /**
     * @param force Fetch a new token even if the one held has not expired, for when it has been
     *              refused and so is known to be no good whatever its expiry says.
     */
    public static RedgifsToken refreshToken(String userAgent, boolean force)
            throws IOException, JSONException {
        synchronized(tokenMap) {
            if (force) {
                tokenMap.remove(userAgent);
            }
            // Reference: https://github.com/JeffreyCA/Apollo-ImprovedCustomApi/pull/67
            RedgifsToken token = tokenMap.get(userAgent);
            if (token != null && token.isValid()) {
                return token;
            }

            // Copy user agent from original request if present because Redgifs verifies
            // that the user agent in subsequent requests matches the one in the OAuth token.
            String accessToken = getToken(userAgent);
            long refreshTime = System.currentTimeMillis() / 1000;
            token = new RedgifsToken(accessToken, refreshTime);
            tokenMap.put(userAgent, token);
            return token;
        }
    }

    public static String getEmulatedOAuthResponseBody(RedgifsToken token) throws JSONException {
        // Reference: https://github.com/JeffreyCA/Apollo-ImprovedCustomApi/pull/67
        JSONObject responseObject = new JSONObject();
        responseObject.put("access_token", token.accessToken);
        responseObject.put("expiry_time", token.getExpiryTimeInSeconds() - (System.currentTimeMillis() / 1000));
        responseObject.put("scope", "read");
        responseObject.put("token_type", "Bearer");
        return responseObject.toString();
    }
}
