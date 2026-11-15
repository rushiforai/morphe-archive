package app.drbushytop.extension.relay;

import android.os.SystemClock;
import android.util.Log;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Collections;
import java.util.Set;
import java.util.WeakHashMap;

/**
 * Lets Relay play Redgifs posts from Redgifs itself, with sound, and fall back to Reddit's silent
 * copy of the clip when Redgifs can't serve it (removed, or the API is down).
 *
 * <p>Relay only asks the Redgifs API when its remote config flag {@code redgifs_api_enabled} is on.
 * Patcheddit turns remote config off, so Relay always played Reddit's copy
 * ({@code preview.reddit_video_preview}), which has no sound. Relay's own Redgifs API client no
 * longer gets video files either, so requests use the website's temporary token instead.
 */
@SuppressWarnings("unused")
public final class GifSound {
    private static final String TAG = "RelayGifSound";

    /** Posts whose Redgifs clip Relay has been told to load from Redgifs. */
    private static final Set<Object> FROM_REDGIFS = Collections.newSetFromMap(new WeakHashMap<>());
    /** Posts Redgifs failed for, which now get Reddit's copy. */
    private static final Set<Object> FELL_BACK = Collections.newSetFromMap(new WeakHashMap<>());

    /**
     * Sent with Redgifs API requests and with the request for their token: Redgifs only accepts
     * a token from the User-Agent it was issued to.
     */
    private static final String REDGIFS_USER_AGENT = "Relay for Reddit";
    private static final String REDGIFS_TOKEN_URL = "https://api.redgifs.com/v2/auth/temporary";
    /** Temporary tokens last 24 hours. */
    private static final long REDGIFS_TOKEN_LIFETIME_MS = 23 * 60 * 60 * 1000L;

    private static String redgifsToken;
    private static long redgifsTokenExpiry;

    private GifSound() {
    }

    /**
     * Hook: the Authorization header Relay sends to the Redgifs API. Relay's own API client gets
     * a token that only lists an embed page for each clip, without its video files; the
     * temporary token the Redgifs website uses gets them. Called on a network thread.
     */
    public static String redgifsAuthorization() throws IOException {
        synchronized (GifSound.class) {
            if (redgifsToken == null || SystemClock.elapsedRealtime() >= redgifsTokenExpiry) {
                redgifsToken = fetchRedgifsToken();
                redgifsTokenExpiry = SystemClock.elapsedRealtime() + REDGIFS_TOKEN_LIFETIME_MS;
            }
            return "Bearer " + redgifsToken;
        }
    }

    /** Hook: the User-Agent Relay sends to the Redgifs API, the one its token was issued to. */
    public static String redgifsUserAgent() {
        return REDGIFS_USER_AGENT;
    }

    /**
     * Hook: the video URL Relay read from a Redgifs API response. A response without one is
     * treated as a failed load, so the post falls back to Reddit's copy instead of opening a
     * player with nothing to play.
     */
    public static void requireVideoUrl(String url) {
        if (url == null || url.isEmpty()) {
            throw new IllegalStateException("Redgifs sent no video URL");
        }
    }

    private static String fetchRedgifsToken() throws IOException {
        HttpURLConnection connection = (HttpURLConnection) new URL(REDGIFS_TOKEN_URL).openConnection();
        try {
            connection.setConnectTimeout(15_000);
            connection.setReadTimeout(15_000);
            connection.setUseCaches(false);
            connection.setRequestProperty("User-Agent", REDGIFS_USER_AGENT);
            connection.setRequestProperty("Accept", "application/json");
            int code = connection.getResponseCode();
            if (code != HttpURLConnection.HTTP_OK) throw new IOException("Redgifs token: HTTP " + code);
            StringBuilder body = new StringBuilder();
            try (BufferedReader reader = new BufferedReader(
                    new InputStreamReader(connection.getInputStream(), StandardCharsets.UTF_8))) {
                for (String line; (line = reader.readLine()) != null; ) body.append(line);
            }
            String token = new JSONObject(body.toString()).optString("token");
            if (token.isEmpty()) throw new IOException("Redgifs token: none in response");
            return token;
        } catch (JSONException e) {
            throw new IOException("Redgifs token: unreadable response", e);
        } finally {
            connection.disconnect();
        }
    }

    /**
     * Hook: stands in for Relay's {@code redgifs_api_enabled} flag while it builds a Redgifs post's
     * media. Relay reads the flag only for Redgifs links.
     *
     * @return whether to ask Redgifs for the clip; false plays Reddit's copy.
     */
    public static boolean loadFromRedgifs(Object link) {
        synchronized (GifSound.class) {
            if (FELL_BACK.contains(link)) return false;
            FROM_REDGIFS.add(link);
            return true;
        }
    }

    /**
     * Hook: the start of Relay's error handler for loading a post's media.
     *
     * @return null when the post was a Redgifs clip that failed to load for the first time: Relay
     * should then load the post's media again, which now uses Reddit's copy. Otherwise
     * {@code error}, for Relay to handle as before.
     */
    public static Throwable retryWithRedditCopy(Object link, Throwable error) {
        synchronized (GifSound.class) {
            if (!FROM_REDGIFS.remove(link) || !FELL_BACK.add(link)) return error;
        }
        if (Log.isLoggable(TAG, Log.DEBUG)) Log.d(TAG, "Redgifs failed, using Reddit's copy", error);
        return null;
    }
}
