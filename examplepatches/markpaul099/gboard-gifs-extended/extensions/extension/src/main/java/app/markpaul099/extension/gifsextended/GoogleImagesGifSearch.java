package app.markpaul099.extension.gifsextended;

import android.annotation.SuppressLint;
import android.content.Context;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;

import org.json.JSONTokener;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Runs an animated Google Images search in a hidden WebView (Google Search needs JavaScript)
 * and extracts the GIF results from the page.
 * <p>
 * Page parsing follows GifBoard (https://github.com/gifboard/gifboard, GPLv3).
 */
final class GoogleImagesGifSearch {
    private static final String TAG = "GifsExtended";
    private static final String LOG_PREFIX = "[gif-search] ";

    private static final String USER_AGENT = "Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 "
            + "(KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36";

    // [id, "...", ["thumbnail", h, w], ["full", h, w]]
    private static final Pattern GIF_DATA = Pattern.compile(
            "\\[\\d+,\\s*\"[^\"]*\",\\s*\\[\"([^\"]+)\",\\s*\\d+,\\s*\\d+[^\\]]*\\],\\s*\\[\"([^\"]+)\",\\s*(\\d+),\\s*(\\d+)[^\\]]*\\]");
    private static final Pattern NO_RESULTS = Pattern.compile(
            "(?i)(\"About 0 results\"|id=\"botstuff\".*?It looks like there aren['’‘]t any|did not match any image results)");
    private static final Pattern UNICODE_ESCAPE = Pattern.compile("\\\\u([0-9a-fA-F]{4})");

    private static final long SEARCH_TIMEOUT_MS = 12_000;
    private static final long POLL_INTERVAL_MS = 300;

    private static final Object searchLock = new Object();
    private static final Handler mainHandler = new Handler(Looper.getMainLooper());

    @SuppressLint("StaticFieldLeak")
    private static WebView webView;

    /** One GIF result: preview image, GIF url and size. */
    static final class Gif {
        final String previewUrl;
        final String url;
        final int width;
        final int height;

        Gif(String previewUrl, String url, int width, int height) {
            this.previewUrl = previewUrl;
            this.url = url;
            this.width = width;
            this.height = height;
        }
    }

    private GoogleImagesGifSearch() {
    }

    /**
     * Blocks until results are found, Google reports none, or the search times out.
     * Must not be called on the main thread.
     */
    static List<Gif> search(Context context, String query, int start, boolean safeSearch)
            throws InterruptedException {
        Uri.Builder builder = Uri.parse("https://www.google.com/search").buildUpon()
                .appendQueryParameter("q", query + " gif")
                .appendQueryParameter("udm", "2")
                .appendQueryParameter("tbs", "itp:animated")
                .appendQueryParameter("safe", safeSearch ? "active" : "off")
                .appendQueryParameter("hl", "en");
        if (start > 0) {
            builder.appendQueryParameter("start", String.valueOf(start));
        }
        String url = builder.build().toString();

        synchronized (searchLock) {
            final String[] html = {null};
            final CountDownLatch done = new CountDownLatch(1);
            final long deadline = System.currentTimeMillis() + SEARCH_TIMEOUT_MS;

            mainHandler.post(() -> {
                try {
                    WebView view = webView(context);
                    Runnable poll = new Runnable() {
                        @Override
                        public void run() {
                            if (done.getCount() == 0) {
                                return;
                            }
                            view.evaluateJavascript("document.documentElement.innerHTML", value -> {
                                String page = decodeJsString(value);
                                if (GIF_DATA.matcher(page).find() || NO_RESULTS.matcher(page).find()) {
                                    Log.d(TAG, LOG_PREFIX + "results page ready, " + page.length() + " chars");
                                    html[0] = page;
                                    done.countDown();
                                } else if (System.currentTimeMillis() < deadline) {
                                    mainHandler.postDelayed(this, POLL_INTERVAL_MS);
                                } else {
                                    Log.d(TAG, LOG_PREFIX + "no results found in page, title="
                                            + titleOf(page));
                                    done.countDown();
                                }
                            });
                        }
                    };
                    view.setWebViewClient(new WebViewClient() {
                        @Override
                        public void onPageFinished(WebView finishedView, String finishedUrl) {
                            Log.d(TAG, LOG_PREFIX + "page finished: " + hostAndPath(finishedUrl));
                            if (finishedUrl != null && finishedUrl.contains("google.com/search")) {
                                mainHandler.removeCallbacks(poll);
                                mainHandler.post(poll);
                            }
                        }
                    });
                    view.loadUrl(url);
                } catch (Throwable failure) {
                    Log.w(TAG, LOG_PREFIX + "could not start the WebView search", failure);
                    done.countDown();
                }
            });

            if (!done.await(SEARCH_TIMEOUT_MS + 1_000, TimeUnit.MILLISECONDS)) {
                Log.w(TAG, LOG_PREFIX + "Google Images search timed out");
            }
            mainHandler.post(() -> {
                if (webView != null) {
                    webView.stopLoading();
                }
            });

            return html[0] == null ? new ArrayList<>() : parse(html[0]);
        }
    }

    @SuppressLint("SetJavaScriptEnabled")
    private static WebView webView(Context context) {
        if (webView == null) {
            WebView view = new WebView(context.getApplicationContext());
            WebSettings settings = view.getSettings();
            settings.setJavaScriptEnabled(true);
            settings.setDomStorageEnabled(true);
            settings.setUserAgentString(USER_AGENT);
            settings.setBlockNetworkImage(true);
            webView = view;
        }
        return webView;
    }

    private static String hostAndPath(String url) {
        if (url == null) {
            return "null";
        }
        Uri uri = Uri.parse(url);
        return uri.getHost() + uri.getPath();
    }

    private static String titleOf(String page) {
        Matcher matcher = Pattern.compile("(?is)<title>(.*?)</title>").matcher(page);
        return matcher.find() ? matcher.group(1).trim() : "(none)";
    }

    private static String decodeJsString(String value) {
        try {
            Object decoded = new JSONTokener(value).nextValue();
            return decoded instanceof String ? (String) decoded : value;
        } catch (Exception ignored) {
            return value;
        }
    }

    static List<Gif> parse(String html) {
        List<Gif> gifs = new ArrayList<>();
        Set<String> seen = new HashSet<>();
        Matcher matcher = GIF_DATA.matcher(html);
        while (matcher.find()) {
            String previewUrl = unescapeUnicode(matcher.group(1));
            String url = unescapeUnicode(matcher.group(2));
            int height = parseInt(matcher.group(3));
            int width = parseInt(matcher.group(4));

            if (!url.toLowerCase(Locale.US).endsWith(".gif") || width <= 0 || height <= 0) {
                continue;
            }
            if (seen.add(url)) {
                gifs.add(new Gif(previewUrl, url, width, height));
            }
        }
        return gifs;
    }

    private static int parseInt(String value) {
        try {
            return Integer.parseInt(value);
        } catch (NumberFormatException ignored) {
            return 0;
        }
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
