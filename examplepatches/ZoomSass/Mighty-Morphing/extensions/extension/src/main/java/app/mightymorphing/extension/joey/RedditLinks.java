package app.mightymorphing.extension.joey;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import org.json.JSONObject;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Resolves modern Reddit share links (/s/, s.reddit.com, applink.reddit.com,
 * reddit.onelink.me, redditmail) and normalizes post and comment URLs so Joey
 * opens directly to the target post or highlighted comment.
 */
public final class RedditLinks {
    private static final String TAG = "MightyLinks";
    private static final String BYPASS_SUFFIX = "#morphe_bypass";
    private static final String USER_AGENT = "Joey:o.o.joey:2.1.6.5";
    private static final String BROWSER_UA =
            "Mozilla/5.0 (Linux; Android 14) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36";

    private static final Pattern SHARE_PATH = Pattern.compile(
            "^/(?:(?:r|u|user)/[^/]+/)?s/[^/?#]+/?$",
            Pattern.CASE_INSENSITIVE
    );

    private static final Pattern REDDITMAIL_CL0 = Pattern.compile(
            "^/CL0/([^/]+)(?:/.*)?$",
            Pattern.CASE_INSENSITIVE
    );

    private static final String[] REDIRECT_QUERY_KEYS = new String[] {
            "deep_link_value",
            "$canonical_url",
            "$deeplink_path",
            "af_dp",
            "url",
            "rdt_cid"
    };

    private RedditLinks() {}

    /**
     * Hooked at the start of OpenContent.F(Context, String, ...).
     * Intercepts share/redirect links before Joey's classifier can send them to the internal browser.
     */
    public static boolean interceptOpenContent(Context context, String url) {
        if (context == null || url == null || url.isEmpty()) return false;
        if (url.endsWith(BYPASS_SUFFIX)) return false;
        String unwrapped = unwrapLocalRedirect(url);
        if (!unwrapped.equals(url) || needsNetworkResolution(unwrapped)) {
            String remaining = open(false, context, unwrapped);
            if (remaining != null) {
                dispatchToJoey(false, context, remaining);
            }
            return true;
        }
        return false;
    }

    /**
     * Hooked in OpenRedditContent.j(boolean, Context, String).
     * Returns null when the link was handled asynchronously or opened directly,
     * or returns the normalized URL string for Joey's standard router to handle.
     */
    public static String open(boolean qa, Context context, String url) {
        if (context == null || url == null || url.isEmpty()) return url;
        if (url.endsWith(BYPASS_SUFFIX)) {
            return url.substring(0, url.length() - BYPASS_SUFFIX.length());
        }

        String current = unwrapLocalRedirect(url.trim());
        if (needsNetworkResolution(current)) {
            resolveAsync(qa, context, current);
            return null;
        }

        String normalized = normalizeUrl(current);
        if (!qa && tryOpenCommentPermalink(context, normalized, current)) {
            return null;
        }
        return normalized;
    }

    /**
     * Hooked at the start of OpenRedditContent.c(String).
     */
    public static String normalizeUrl(String url) {
        if (url == null || url.isEmpty()) return url;
        try {
            String current = unwrapLocalRedirect(url.trim());
            Uri uri = Uri.parse(current);
            String scheme = uri.getScheme();
            String host = uri.getHost();
            if (scheme == null || host == null) return current;
            String lowerHost = host.toLowerCase(Locale.US);

            if (!isRedditDomain(lowerHost)) return current;

            String path = uri.getPath();
            if (path == null) path = "";
            path = path.replaceAll("/+$", "").replace("\\", "");

            // Convert /gallery/<id> to /comments/<id> for OpenRedditContent compatibility.
            if (path.matches("(?i)^/gallery/[A-Za-z0-9_]+$")) {
                String galleryId = path.substring("/gallery/".length());
                if (galleryId.startsWith("t3_")) galleryId = galleryId.substring(3);
                path = "/comments/" + galleryId;
            }

            // Normalize comment links of form /r/<sub>/comments/<post_id>/comment/<comment_id>
            // or /comments/<post_id>/comment/<comment_id> or ?comment=<comment_id>.
            path = normalizeCommentsPath(path, uri);

            String query = uri.getEncodedQuery();
            String queryPart = (query == null || query.isEmpty()) ? "" : ("?" + query);

            if ("redd.it".equals(lowerHost) || lowerHost.endsWith(".redd.it")) {
                return current;
            }

            if (isStandardRedditWebHost(lowerHost)) {
                String targetHost = "np.reddit.com".equals(lowerHost) ? "np.reddit.com" : "www.reddit.com";
                return "https://" + targetHost + path + queryPart;
            }

            return current;
        } catch (Throwable ignored) {
            return url;
        }
    }

    private static String normalizeCommentsPath(String path, Uri uri) {
        if (path == null || path.isEmpty()) return "";
        String[] parts = path.split("/");
        // /r/<sub>/comments/<post_id>... or /u/<user>/comments/<post_id>...
        if (parts.length >= 5
                && ("r".equalsIgnoreCase(parts[1]) || "u".equalsIgnoreCase(parts[1]) || "user".equalsIgnoreCase(parts[1]))
                && "comments".equalsIgnoreCase(parts[3])) {
            String prefix = "r".equalsIgnoreCase(parts[1]) ? "/r/" + parts[2] : "/u/" + parts[2];
            String postId = stripPrefix(parts[4], "t3_");
            String commentId = null;
            String slug = "_";
            if (parts.length >= 7 && !parts[6].isEmpty()) {
                slug = parts[5].isEmpty() ? "_" : parts[5];
                commentId = stripPrefix(parts[6], "t1_");
            } else {
                String queryComment = getQueryParam(uri, "comment");
                if (queryComment != null && !queryComment.isEmpty()) {
                    if (parts.length >= 6 && !parts[5].isEmpty()) slug = parts[5];
                    commentId = stripPrefix(queryComment, "t1_");
                }
            }
            if (commentId != null && !commentId.isEmpty()) {
                return prefix + "/comments/" + postId + "/" + slug + "/" + commentId;
            }
            if (parts.length >= 6 && !parts[5].isEmpty()) {
                return prefix + "/comments/" + postId + "/" + parts[5];
            }
            return prefix + "/comments/" + postId;
        }

        // /comments/<post_id>...
        if (parts.length >= 3 && "comments".equalsIgnoreCase(parts[1])) {
            String postId = stripPrefix(parts[2], "t3_");
            if (parts.length >= 5 && !parts[4].isEmpty()) {
                String slug = parts[3].isEmpty() ? "_" : parts[3];
                String commentId = stripPrefix(parts[4], "t1_");
                return "/comments/" + postId + "/" + slug + "/" + commentId;
            }
            return "/comments/" + postId;
        }

        return path;
    }

    private static boolean tryOpenCommentPermalink(Context context, String normalizedUrl, String originalUrl) {
        try {
            Uri uri = Uri.parse(normalizedUrl);
            String host = uri.getHost();
            if (host == null || !isRedditDomain(host.toLowerCase(Locale.US))) return false;
            String path = uri.getPath();
            if (path == null || path.isEmpty()) return false;
            String[] parts = path.replaceAll("/+$", "").split("/");

            String subreddit = null;
            String submissionId = null;
            String commentId = null;

            if (parts.length >= 5
                    && ("r".equalsIgnoreCase(parts[1]) || "u".equalsIgnoreCase(parts[1]) || "user".equalsIgnoreCase(parts[1]))
                    && "comments".equalsIgnoreCase(parts[3])) {
                subreddit = "r".equalsIgnoreCase(parts[1]) ? parts[2] : ("u_" + parts[2]);
                submissionId = stripPrefix(parts[4], "t3_");
                if (parts.length >= 7 && !parts[6].isEmpty()) {
                    commentId = stripPrefix(parts[6], "t1_");
                }
            } else if (parts.length >= 3 && "comments".equalsIgnoreCase(parts[1])) {
                submissionId = stripPrefix(parts[2], "t3_");
                if (parts.length >= 5 && !parts[4].isEmpty()) {
                    commentId = stripPrefix(parts[4], "t1_");
                }
            }

            if (submissionId != null && (commentId == null || commentId.isEmpty())) {
                String queryComment = getQueryParam(uri, "comment");
                if (queryComment != null && !queryComment.isEmpty()) {
                    commentId = stripPrefix(queryComment, "t1_");
                }
            }

            if (submissionId == null || submissionId.isEmpty() || commentId == null || commentId.isEmpty()) {
                return false;
            }

            Context target = safeContext(context);
            Class<?> commentActivity = Class.forName("o.o.joey.Activities.CommentActivity");
            Intent intent = new Intent(target, commentActivity);
            if (subreddit != null && !subreddit.isEmpty()) {
                intent.putExtra("subreddit", subreddit);
            }
            intent.putExtra("submission", submissionId);
            intent.putExtra("highlight_context", commentId);
            boolean isNp = originalUrl != null && originalUrl.toLowerCase(Locale.US).contains("np.reddit.com");
            intent.putExtra("np", isNp);

            String contextParam = getQueryParam(uri, "context");
            if (contextParam != null && !contextParam.isEmpty()) {
                try {
                    int contextCount = Integer.parseInt(contextParam.trim());
                    if (contextCount >= 0) {
                        intent.putExtra("EXTRA_HIGHLIGHT_CONTEXT_COUNT", contextCount);
                    }
                } catch (NumberFormatException ignored) {
                }
            }

            target.startActivity(intent);
            return true;
        } catch (Throwable failure) {
            Log.i(TAG, "comment permalink open failed", failure);
            return false;
        }
    }

    private static String unwrapLocalRedirect(String url) {
        if (url == null || url.isEmpty()) return url;
        String current = url;
        for (int depth = 0; depth < 3; depth++) {
            try {
                Uri uri = Uri.parse(current);
                String host = uri.getHost();
                if (host == null) break;
                String lowerHost = host.toLowerCase(Locale.US);
                String path = uri.getPath();

                if ((lowerHost.equals("click.redditmail.com") || lowerHost.endsWith(".redditmail.com"))
                        && path != null) {
                    Matcher matcher = REDDITMAIL_CL0.matcher(path);
                    if (matcher.matches()) {
                        String decoded = URLDecoder.decode(matcher.group(1), "UTF-8");
                        if (decoded.startsWith("http://") || decoded.startsWith("https://")) {
                            current = decoded;
                            continue;
                        }
                    }
                }

                String extracted = null;
                for (String key : REDIRECT_QUERY_KEYS) {
                    String value = getQueryParam(uri, key);
                    if (value == null || value.isEmpty()) continue;
                    String candidate = value.trim();
                    if (candidate.startsWith("reddit://reddit/")) {
                        candidate = "https://www.reddit.com/" + candidate.substring("reddit://reddit/".length());
                    } else if (candidate.startsWith("reddit://")) {
                        candidate = "https://www.reddit.com/" + candidate.substring("reddit://".length());
                    } else if (candidate.startsWith("/r/") || candidate.startsWith("/u/")
                            || candidate.startsWith("/user/") || candidate.startsWith("/comments/")) {
                        candidate = "https://www.reddit.com" + candidate;
                    }
                    if (candidate.startsWith("http://") || candidate.startsWith("https://")) {
                        extracted = candidate;
                        break;
                    }
                }
                if (extracted != null && !extracted.equals(current)) {
                    current = extracted;
                    continue;
                }
            } catch (Throwable ignored) {
            }
            break;
        }
        return current;
    }

    private static boolean needsNetworkResolution(String url) {
        if (url == null || url.isEmpty() || url.endsWith(BYPASS_SUFFIX)) return false;
        try {
            Uri uri = Uri.parse(url);
            String scheme = uri.getScheme();
            String host = uri.getHost();
            if (scheme == null || host == null) return false;
            if (!"http".equalsIgnoreCase(scheme) && !"https".equalsIgnoreCase(scheme)) return false;
            String lowerHost = host.toLowerCase(Locale.US);
            String path = uri.getPath();
            if (path == null) path = "";

            if ("s.reddit.com".equals(lowerHost)
                    || "applink.reddit.com".equals(lowerHost)
                    || "reddit.onelink.me".equals(lowerHost)
                    || lowerHost.endsWith(".onelink.me")
                    || "c.redditmail.com".equals(lowerHost)
                    || "click.redditmail.com".equals(lowerHost)
                    || lowerHost.endsWith(".redditmail.com")) {
                return true;
            }

            if (isRedditDomain(lowerHost) && SHARE_PATH.matcher(path).matches()) {
                return true;
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    private static void resolveAsync(boolean qa, Context context, String url) {
        final Context appContext = context.getApplicationContext() != null ? context.getApplicationContext() : context;
        final String token = readAccessToken(appContext);
        new Thread(() -> {
            String resolved = resolveRedirects(url, token);
            new Handler(Looper.getMainLooper()).post(() -> {
                Context target = safeContext(context);
                if (resolved != null && !resolved.isEmpty() && !resolved.equals(url)) {
                    String unwrapped = unwrapLocalRedirect(resolved);
                    if (!qa && tryOpenCommentPermalink(target, normalizeUrl(unwrapped), unwrapped)) {
                        return;
                    }
                    dispatchToJoey(qa, target, normalizeUrl(unwrapped));
                } else {
                    dispatchToJoey(qa, target, url + BYPASS_SUFFIX);
                }
            });
        }, "reddit-link-resolve").start();
    }

    private static String resolveRedirects(String startUrl, String token) {
        String current = unwrapLocalRedirect(startUrl);
        for (int hop = 0; hop < 6; hop++) {
            if (!needsNetworkResolution(current)) {
                return current;
            }
            String next = requestRedirectLocation(current, token, true);
            if (next == null && token != null && !token.isEmpty()) {
                next = requestRedirectLocation(current, null, true);
            }
            if (next == null) {
                next = requestRedirectLocation(current, token, false);
            }
            if (next == null && token != null && !token.isEmpty()) {
                next = requestRedirectLocation(current, null, false);
            }
            if (next == null || next.isEmpty() || next.equals(current)) {
                break;
            }
            current = unwrapLocalRedirect(next);
        }
        return current;
    }

    private static String requestRedirectLocation(String urlString, String token, boolean head) {
        HttpURLConnection conn = null;
        try {
            URL url = new URL(urlString);
            conn = (HttpURLConnection) url.openConnection();
            conn.setInstanceFollowRedirects(false);
            conn.setRequestMethod(head ? "HEAD" : "GET");
            conn.setConnectTimeout(4000);
            conn.setReadTimeout(4000);
            if (token != null && !token.isEmpty()) {
                conn.setRequestProperty("Authorization", "Bearer " + token);
                conn.setRequestProperty("User-Agent", USER_AGENT);
            } else {
                conn.setRequestProperty("User-Agent", BROWSER_UA);
            }
            conn.connect();
            int code = conn.getResponseCode();
            String location = conn.getHeaderField("Location");
            if (location == null) {
                location = conn.getHeaderField("location");
            }
            if (location != null && !location.isEmpty()) {
                URL resolvedUrl = new URL(url, location);
                return resolvedUrl.toString();
            }
            if (code >= 200 && code < 300) {
                URL finalUrl = conn.getURL();
                if (finalUrl != null && !finalUrl.toString().equals(urlString)) {
                    return finalUrl.toString();
                }
            }
        } catch (Throwable failure) {
            Log.i(TAG, "redirect check failed for " + urlString, failure);
        } finally {
            if (conn != null) {
                try {
                    conn.disconnect();
                } catch (Throwable ignored) {
                }
            }
        }
        return null;
    }

    private static void dispatchToJoey(boolean qa, Context context, String url) {
        try {
            Class<?> openRedditContent = Class.forName("fb.b");
            openRedditContent
                    .getMethod("j", boolean.class, Context.class, String.class)
                    .invoke(null, qa, context, url);
        } catch (Throwable failure) {
            Log.i(TAG, "dispatch to fb.b.j failed", failure);
        }
    }

    private static Context safeContext(Context context) {
        if (context instanceof Activity) {
            Activity activity = (Activity) context;
            if (!activity.isFinishing() && !activity.isDestroyed()) {
                return activity;
            }
        }
        try {
            Activity current = (Activity) Class.forName("o.o.joey.MyApplication")
                    .getMethod("n")
                    .invoke(null);
            if (current != null && !current.isFinishing() && !current.isDestroyed()) {
                return current;
            }
        } catch (Throwable ignored) {
        }
        Context base = context.getApplicationContext() != null ? context.getApplicationContext() : context;
        return new ContextWrapper(base) {
            @Override
            public void startActivity(Intent intent) {
                if (intent != null) {
                    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                }
                super.startActivity(intent);
            }
        };
    }

    private static String readAccessToken(Context context) {
        try {
            SharedPreferences prefs = context.getSharedPreferences("Authentication", 0);
            String raw = prefs.getString("access_token", "");
            if (raw == null || raw.isEmpty()) return null;
            String access = raw.startsWith("{") ? new JSONObject(raw).optString("access_token", "") : raw;
            long expiry = prefs.getLong("access_token_expiry", 0L);
            if (access.isEmpty() || (expiry > 0L && expiry < System.currentTimeMillis())) {
                return null;
            }
            return access;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static String getQueryParam(Uri uri, String key) {
        if (uri == null || key == null) return null;
        try {
            for (String name : uri.getQueryParameterNames()) {
                if (key.equalsIgnoreCase(name)) {
                    return uri.getQueryParameter(name);
                }
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static String stripPrefix(String value, String prefix) {
        if (value == null) return "";
        if (value.regionMatches(true, 0, prefix, 0, prefix.length())) {
            return value.substring(prefix.length());
        }
        return value;
    }

    private static boolean isRedditDomain(String lowerHost) {
        return "reddit.com".equals(lowerHost)
                || lowerHost.endsWith(".reddit.com")
                || "redd.it".equals(lowerHost)
                || lowerHost.endsWith(".redd.it");
    }

    private static boolean isStandardRedditWebHost(String lowerHost) {
        return "reddit.com".equals(lowerHost)
                || "www.reddit.com".equals(lowerHost)
                || "old.reddit.com".equals(lowerHost)
                || "new.reddit.com".equals(lowerHost)
                || "sh.reddit.com".equals(lowerHost)
                || "m.reddit.com".equals(lowerHost)
                || "i.reddit.com".equals(lowerHost)
                || "np.reddit.com".equals(lowerHost)
                || "amp.reddit.com".equals(lowerHost)
                || "pay.reddit.com".equals(lowerHost)
                || "ssl.reddit.com".equals(lowerHost)
                || "s.reddit.com".equals(lowerHost)
                || "applink.reddit.com".equals(lowerHost);
    }
}
