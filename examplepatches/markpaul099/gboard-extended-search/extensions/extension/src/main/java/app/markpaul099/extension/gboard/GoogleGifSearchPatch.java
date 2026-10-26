package app.markpaul099.extension.gboard;

import android.annotation.SuppressLint;
import android.app.Application;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONTokener;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Replaces Gboard's Tenor GIF search results with Google Images results
 * (animated only, SafeSearch off).
 * <p>
 * Gboard still sends its Tenor request. When the reply is parsed, the request that
 * produced it is looked up, and for GIF searches the reply is swapped for Google results
 * converted to the Tenor v2 format. Sticker search, categories and trending stay on Tenor,
 * and Tenor's own results are kept if Google returns nothing.
 * <p>
 * Google Images needs JavaScript, so the search runs in a hidden WebView. The page parsing
 * follows GifBoard (https://github.com/gifboard/gifboard, GPLv3).
 */
@SuppressWarnings("unused")
public final class GoogleGifSearchPatch {

    private static final String TAG = "GboardExtendedSearch";

    private static final String USER_AGENT = "Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 "
            + "(KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36";

    // [id, "...", ["thumbnail", h, w], ["full", h, w]]
    private static final Pattern GIF_DATA = Pattern.compile(
            "\\[\\d+,\\s*\"[^\"]*\",\\s*\\[\"([^\"]+)\",\\s*\\d+,\\s*\\d+[^\\]]*\\],\\s*\\[\"([^\"]+)\",\\s*(\\d+),\\s*(\\d+)[^\\]]*\\]");
    private static final Pattern NO_RESULTS = Pattern.compile(
            "(?i)(\"About 0 results\"|id=\"botstuff\".*?It looks like there aren['’‘]t any|did not match any image results)");
    private static final Pattern UNICODE_ESCAPE = Pattern.compile("\\\\u([0-9a-fA-F]{4})");

    // Our own paging token, so it never collides with Tenor's.
    private static final String POS_PREFIX = "google:";
    private static final int PAGE_SIZE = 20;
    private static final long SEARCH_TIMEOUT_MS = 12_000;
    private static final long POLL_INTERVAL_MS = 300;

    private static final ThreadLocal<Object> pendingRequestHolder = new ThreadLocal<>();
    private static final ThreadLocal<Boolean> bypassRewrite = new ThreadLocal<>();
    private static final Object searchLock = new Object();
    private static final Handler mainHandler = new Handler(Looper.getMainLooper());

    @SuppressLint("StaticFieldLeak")
    private static WebView webView;

    /**
     * Called with every Tenor request Uri before it is sent.
     * Drops our own paging token so Tenor still answers (its reply is replaced anyway).
     */
    public static Uri rewriteRequest(Uri uri) {
        try {
            if (Boolean.TRUE.equals(bypassRewrite.get()) || !isGifSearch(uri)) return uri;

            String pos = uri.getQueryParameter("pos");
            if (pos == null || !pos.startsWith(POS_PREFIX)) return uri;

            Uri.Builder builder = uri.buildUpon().clearQuery();
            for (String name : uri.getQueryParameterNames()) {
                if (name.equals("pos")) continue;
                for (String value : uri.getQueryParameters(name)) {
                    builder.appendQueryParameter(name, value);
                }
            }
            return builder.build();
        } catch (Exception ex) {
            return uri;
        }
    }

    /**
     * Called on the response thread right before a Tenor reply is parsed.
     * The holder is the callback object that keeps a reference to the request.
     */
    public static void setPendingRequest(Object holder) {
        pendingRequestHolder.set(holder);
    }

    /**
     * Called with every Tenor reply body before Gboard parses it.
     */
    public static String convertResponse(String body) {
        Object holder = pendingRequestHolder.get();
        pendingRequestHolder.remove();
        if (holder == null || Looper.myLooper() == Looper.getMainLooper()) return body;

        try {
            Uri uri = findRequestUri(holder);
            if (uri == null || !isGifSearch(uri)) return body;

            String query = uri.getQueryParameter("q");
            if (query == null || query.trim().isEmpty()) return body;

            String pos = uri.getQueryParameter("pos");
            int start = 0;
            if (pos != null && pos.startsWith(POS_PREFIX)) {
                start = Integer.parseInt(pos.substring(POS_PREFIX.length()));
            }

            List<String[]> gifs = search(query.trim(), start);
            // Nothing from Google on the first page: keep Tenor's results.
            if (gifs.isEmpty() && start == 0) return body;

            return toTenorJson(gifs, start);
        } catch (Exception ex) {
            Log.e(TAG, "Google GIF search failed", ex);
            return body;
        }
    }

    private static boolean isGifSearch(Uri uri) {
        String path = uri.getPath();
        return "tenor.googleapis.com".equals(uri.getHost())
                && path != null && path.endsWith("/v2/search")
                // Sticker search uses the same endpoint.
                && uri.getQueryParameter("searchfilter") == null;
    }

    /**
     * Finds the request object referenced by the holder and asks it for its Uri.
     * The request is the field whose type has a public no-argument method returning Uri.
     */
    private static Uri findRequestUri(Object holder) throws Exception {
        for (Field field : holder.getClass().getDeclaredFields()) {
            if (Modifier.isStatic(field.getModifiers()) || field.getType().isPrimitive()) continue;
            field.setAccessible(true);
            Object request = field.get(holder);
            if (request == null) continue;

            for (Method method : request.getClass().getMethods()) {
                if (method.getParameterTypes().length == 0 && method.getReturnType() == Uri.class) {
                    bypassRewrite.set(true);
                    try {
                        return (Uri) method.invoke(request);
                    } finally {
                        bypassRewrite.remove();
                    }
                }
            }
        }
        return null;
    }

    private static String toTenorJson(List<String[]> gifs, int start) throws Exception {
        JSONArray results = new JSONArray();
        for (String[] gif : gifs) {
            String thumbnail = gif[0];
            String url = gif[1];

            JSONArray dims = new JSONArray();
            dims.put(Integer.parseInt(gif[3]));
            dims.put(Integer.parseInt(gif[2]));

            JSONObject media = new JSONObject();
            media.put("url", url);
            media.put("dims", dims);
            media.put("preview", thumbnail);

            JSONObject formats = new JSONObject();
            formats.put("tinygif", media);
            formats.put("gif", media);

            JSONObject result = new JSONObject();
            result.put("id", "google_" + Integer.toHexString(url.hashCode()));
            result.put("title", "");
            result.put("url", url);
            result.put("media_formats", formats);
            results.put(result);
        }

        JSONObject tenor = new JSONObject();
        tenor.put("results", results);
        tenor.put("next", gifs.isEmpty() ? "" : POS_PREFIX + (start + PAGE_SIZE));
        return tenor.toString();
    }

    /**
     * Runs a Google Images search in the hidden WebView and blocks until results
     * are found, Google reports none, or the search times out.
     *
     * @return [thumbnail, fullUrl, height, width] for each GIF.
     */
    private static List<String[]> search(String query, int start) throws Exception {
        Uri.Builder builder = Uri.parse("https://www.google.com/search").buildUpon()
                .appendQueryParameter("q", query + " gif")
                .appendQueryParameter("udm", "2")
                .appendQueryParameter("tbs", "itp:animated")
                .appendQueryParameter("safe", "off")
                .appendQueryParameter("hl", "en");
        if (start > 0) builder.appendQueryParameter("start", String.valueOf(start));
        String url = builder.build().toString();

        synchronized (searchLock) {
            final String[] html = {null};
            final CountDownLatch done = new CountDownLatch(1);
            final long deadline = System.currentTimeMillis() + SEARCH_TIMEOUT_MS;

            mainHandler.post(() -> {
                try {
                    WebView view = getWebView();
                    Runnable poll = new Runnable() {
                        @Override
                        public void run() {
                            if (done.getCount() == 0) return;
                            view.evaluateJavascript("document.documentElement.innerHTML", value -> {
                                String page = decodeJsString(value);
                                if (GIF_DATA.matcher(page).find() || NO_RESULTS.matcher(page).find()) {
                                    html[0] = page;
                                    done.countDown();
                                } else if (System.currentTimeMillis() < deadline) {
                                    mainHandler.postDelayed(this, POLL_INTERVAL_MS);
                                } else {
                                    done.countDown();
                                }
                            });
                        }
                    };
                    view.setWebViewClient(new WebViewClient() {
                        @Override
                        public void onPageFinished(WebView v, String finishedUrl) {
                            if (finishedUrl != null && finishedUrl.contains("google.com/search")) {
                                mainHandler.removeCallbacks(poll);
                                mainHandler.post(poll);
                            }
                        }
                    });
                    view.loadUrl(url);
                } catch (Throwable ex) {
                    Log.e(TAG, "Could not start WebView search", ex);
                    done.countDown();
                }
            });

            if (!done.await(SEARCH_TIMEOUT_MS + 1_000, TimeUnit.MILLISECONDS)) {
                Log.w(TAG, "Google GIF search timed out");
            }
            mainHandler.post(() -> {
                if (webView != null) webView.stopLoading();
            });

            return html[0] == null ? new ArrayList<>() : parseGifs(html[0]);
        }
    }

    @SuppressLint("SetJavaScriptEnabled")
    private static WebView getWebView() throws Exception {
        if (webView == null) {
            Application app = (Application) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
            WebView view = new WebView(app);
            WebSettings settings = view.getSettings();
            settings.setJavaScriptEnabled(true);
            settings.setDomStorageEnabled(true);
            settings.setUserAgentString(USER_AGENT);
            settings.setBlockNetworkImage(true);
            webView = view;
        }
        return webView;
    }

    private static String decodeJsString(String value) {
        try {
            Object decoded = new JSONTokener(value).nextValue();
            return decoded instanceof String ? (String) decoded : value;
        } catch (Exception ex) {
            return value;
        }
    }

    private static List<String[]> parseGifs(String html) {
        List<String[]> gifs = new ArrayList<>();
        Set<String> seen = new HashSet<>();
        Matcher matcher = GIF_DATA.matcher(html);
        while (matcher.find()) {
            String thumbnail = unescapeUnicode(matcher.group(1));
            String url = unescapeUnicode(matcher.group(2));
            String height = matcher.group(3);
            String width = matcher.group(4);

            if (!url.toLowerCase().endsWith(".gif") || !seen.add(url)) continue;
            if (height.equals("0") || width.equals("0")) continue;

            gifs.add(new String[]{thumbnail, url, height, width});
        }
        return gifs;
    }

    private static String unescapeUnicode(String value) {
        Matcher matcher = UNICODE_ESCAPE.matcher(value);
        StringBuffer out = new StringBuffer();
        while (matcher.find()) {
            char c = (char) Integer.parseInt(matcher.group(1), 16);
            matcher.appendReplacement(out, Matcher.quoteReplacement(String.valueOf(c)));
        }
        matcher.appendTail(out);
        return out.toString();
    }
}
