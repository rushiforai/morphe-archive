package app.revanced.extension.rif;

import android.net.Uri;
import android.os.Looper;
import android.util.Log;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * "Fix random subreddit": Reddit removed /r/random and /r/randnsfw (404 "banned"), which rif's
 * Random button and random links open and expect to redirect to a real subreddit. When rif's
 * request base starts a request ({@link #resolve}, on its worker thread) for a listing of
 * r/random or r/randnsfw, we ask the redditrand API for a random subreddit and rewrite the
 * request's URI to r/&lt;name&gt;. rif's own random mode then retitles the feed from the first
 * post and loads that subreddit's about page, as it did with Reddit's redirect.
 *
 * redditrand gets a plain request: no Reddit token, cookies or account. On any failure the URI is
 * returned unchanged, so rif shows its existing "Banned subreddit" error.
 */
public final class RandomSubreddit {

    private static final String TAG = "RandomSubreddit";
    private static final String API = "https://api.redditrand.com/reddit-runner/rand?nsfw=";
    private static final int TIMEOUT_MS = 10000;
    private static final int MAX_BODY = 4096;

    /** The path of a random listing: /r/random or /r/randnsfw, then optionally a sort. */
    private static final Pattern RANDOM_PATH = Pattern.compile(
            "^/r/(random|randnsfw)(?:\\.json)?(?:/(?:(hot|new|top|rising|controversial|best|gilded)(?:\\.json)?)?(?:/.*)?)?$",
            Pattern.CASE_INSENSITIVE);

    /** `{"url":"/r/name/"}`, with the slashes possibly escaped. */
    private static final Pattern URL_FIELD = Pattern.compile(
            "\"url\"\\s*:\\s*\"\\\\?/r\\\\?/([A-Za-z0-9_]{2,30})\\\\?/?\"");

    private RandomSubreddit() {}

    /**
     * Called at the start of rif's request base `doInBackground`, with the request's URI. Returns
     * the URI to use: the same one unless it is a random listing and redditrand answered.
     * Never throws.
     */
    public static Uri resolve(Uri uri) {
        try {
            if (uri == null) return uri;
            String host = uri.getHost();
            if (host == null || !host.toLowerCase(java.util.Locale.ROOT).endsWith("reddit.com")) return uri;
            String path = uri.getPath();
            Boolean nsfw = randomKind(path);
            if (nsfw == null) return uri;
            if (Looper.myLooper() == Looper.getMainLooper()) {
                Log.w(TAG, "random listing on the main thread, left alone");
                return uri;
            }
            String name = fetchName(nsfw);
            if (name == null) return uri;
            String newPath = swapPath(path, name);
            if (newPath == null) return uri;
            return uri.buildUpon().path(newPath).build();
        } catch (Throwable t) {
            Log.w(TAG, "resolve failed", t);
            return uri;
        }
    }

    /** TRUE for /r/randnsfw, FALSE for /r/random, null if the path is not a random listing. */
    static Boolean randomKind(String path) {
        if (path == null) return null;
        Matcher m = RANDOM_PATH.matcher(path);
        if (!m.matches()) return null;
        return "randnsfw".equalsIgnoreCase(m.group(1));
    }

    /** The path with its random subreddit replaced by [name], or null if it isn't a random path. */
    static String swapPath(String path, String name) {
        if (randomKind(path) == null) return null;
        int start = "/r/".length();
        int end = start;
        while (end < path.length() && path.charAt(end) != '/' && path.charAt(end) != '.') end++;
        return path.substring(0, start) + name + path.substring(end);
    }

    /** The subreddit name from redditrand's reply, or null if it doesn't parse. */
    static String parseName(String body) {
        if (body == null) return null;
        Matcher m = URL_FIELD.matcher(body);
        return m.find() ? m.group(1) : null;
    }

    private static String fetchName(boolean nsfw) {
        HttpURLConnection conn = null;
        try {
            conn = (HttpURLConnection) new URL(API + (nsfw ? "1" : "0")).openConnection();
            conn.setConnectTimeout(TIMEOUT_MS);
            conn.setReadTimeout(TIMEOUT_MS);
            conn.setInstanceFollowRedirects(false);
            conn.setRequestProperty("User-Agent", "rif-patches");
            conn.setRequestProperty("Accept", "application/json");
            int code = conn.getResponseCode();
            if (code != HttpURLConnection.HTTP_OK) {
                Log.w(TAG, "redditrand HTTP " + code);
                return null;
            }
            InputStream in = conn.getInputStream();
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buf = new byte[1024];
            int n;
            while (out.size() < MAX_BODY && (n = in.read(buf)) != -1) out.write(buf, 0, n);
            in.close();
            String name = parseName(new String(out.toByteArray(), StandardCharsets.UTF_8));
            if (name == null) Log.w(TAG, "redditrand reply not understood");
            return name;
        } catch (Throwable t) {
            Log.w(TAG, "redditrand request failed", t);
            return null;
        } finally {
            if (conn != null) conn.disconnect();
        }
    }
}
