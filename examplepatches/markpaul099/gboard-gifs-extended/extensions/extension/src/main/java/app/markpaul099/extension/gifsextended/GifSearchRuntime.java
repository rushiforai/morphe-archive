package app.markpaul099.extension.gifsextended;

import android.app.Application;
import android.content.Context;
import android.net.Uri;
import android.os.Looper;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.List;

/**
 * Entry points called from patched Gboard code for GIF search.
 * <p>
 * Gboard still sends its Tenor request. When the reply is parsed, the request that produced
 * it is looked up; for GIF searches the reply is swapped for Google Images results converted
 * to the Tenor v2 format. Sticker search, categories and trending stay on Tenor, and Tenor's
 * own results are kept if Google returns nothing.
 */
@SuppressWarnings("unused")
public final class GifSearchRuntime {
    private static final String TAG = "GifsExtended";
    private static final String LOG_PREFIX = "[gif-search] ";

    private static final String TENOR_HOST = "tenor.googleapis.com";
    private static final String CONTENT_FILTER_OFF = "off";
    // Our own paging token, so it never collides with Tenor's.
    private static final String POS_PREFIX = "google:";
    private static final int PAGE_SIZE = 20;

    private static final ThreadLocal<Object> pendingRequestHolder = new ThreadLocal<>();
    private static final ThreadLocal<Boolean> bypassRewrite = new ThreadLocal<>();

    private GifSearchRuntime() {
    }

    /**
     * Called with the Tenor content filter level of every Tenor request.
     */
    public static String applyContentFilter(String level) {
        try {
            return GifsExtendedSettings.safeSearch(context()) ? level : CONTENT_FILTER_OFF;
        } catch (Throwable failure) {
            return level;
        }
    }

    /**
     * Called with every Tenor request Uri before it is sent.
     * Drops our own paging token so Tenor still answers (its reply is replaced anyway).
     */
    public static Uri rewriteRequest(Uri uri) {
        try {
            if (Boolean.TRUE.equals(bypassRewrite.get()) || !isGifSearch(uri)) {
                return uri;
            }
            Log.d(TAG, LOG_PREFIX + "sending GIF search request: " + describe(uri));
            String pos = uri.getQueryParameter("pos");
            if (pos == null || !pos.startsWith(POS_PREFIX)) {
                return uri;
            }
            Uri.Builder builder = uri.buildUpon().clearQuery();
            for (String name : uri.getQueryParameterNames()) {
                if (name.equals("pos")) {
                    continue;
                }
                for (String value : uri.getQueryParameters(name)) {
                    builder.appendQueryParameter(name, value);
                }
            }
            return builder.build();
        } catch (Throwable failure) {
            return uri;
        }
    }

    /**
     * Called on the response thread each time Gboard's Tenor reply callback runs, before the
     * reply is parsed. The holder is the callback object that keeps a reference to the request.
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
        if (holder == null) {
            Log.d(TAG, LOG_PREFIX + "reply without a pending request, keeping Tenor");
            return body;
        }
        if (Looper.myLooper() == Looper.getMainLooper()) {
            Log.d(TAG, LOG_PREFIX + "reply parsed on the main thread, keeping Tenor");
            return body;
        }
        try {
            Context context = context();
            if (context == null) {
                Log.d(TAG, LOG_PREFIX + "no application context, keeping Tenor");
                return body;
            }
            if (!GifsExtendedSettings.googleImages(context)) {
                return body;
            }
            Uri uri = findRequestUri(holder);
            if (uri == null) {
                Log.d(TAG, LOG_PREFIX + "request not found on " + holder.getClass().getName());
                return body;
            }
            if (!isGifSearch(uri)) {
                Log.d(TAG, LOG_PREFIX + "not a GIF search: " + describe(uri));
                return body;
            }
            String query = uri.getQueryParameter("q");
            if (query == null || query.trim().isEmpty()) {
                Log.d(TAG, LOG_PREFIX + "empty query, keeping Tenor");
                return body;
            }
            String pos = uri.getQueryParameter("pos");
            int start = 0;
            if (pos != null && pos.startsWith(POS_PREFIX)) {
                start = Integer.parseInt(pos.substring(POS_PREFIX.length()));
            }

            boolean safeSearch = GifsExtendedSettings.safeSearch(context);
            Log.d(TAG, LOG_PREFIX + "searching Google Images, start=" + start
                    + ", safeSearch=" + safeSearch);
            List<GoogleImagesGifSearch.Gif> gifs =
                    GoogleImagesGifSearch.search(context, query.trim(), start, safeSearch);
            Log.d(TAG, LOG_PREFIX + "Google Images returned " + gifs.size() + " GIFs");
            // Nothing from Google on the first page: keep Tenor's results.
            if (gifs.isEmpty() && start == 0) {
                return body;
            }
            return toTenorJson(gifs, start);
        } catch (Throwable failure) {
            Log.w(TAG, LOG_PREFIX + "Google Images GIF search failed", failure);
            return body;
        }
    }

    // Path and parameter names only: the query string holds API keys.
    private static String describe(Uri uri) {
        return uri.getHost() + uri.getPath() + " " + uri.getQueryParameterNames();
    }

    private static boolean isGifSearch(Uri uri) {
        String path = uri.getPath();
        return TENOR_HOST.equals(uri.getHost())
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
            if (Modifier.isStatic(field.getModifiers()) || field.getType().isPrimitive()) {
                continue;
            }
            field.setAccessible(true);
            Object request = field.get(holder);
            if (request == null) {
                continue;
            }
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

    private static String toTenorJson(List<GoogleImagesGifSearch.Gif> gifs, int start)
            throws Exception {
        JSONArray results = new JSONArray();
        for (GoogleImagesGifSearch.Gif gif : gifs) {
            JSONArray dims = new JSONArray();
            dims.put(gif.width);
            dims.put(gif.height);

            JSONObject media = new JSONObject();
            media.put("url", gif.url);
            media.put("dims", dims);
            media.put("preview", gif.previewUrl);

            JSONObject formats = new JSONObject();
            formats.put("tinygif", media);
            formats.put("gif", media);

            JSONObject result = new JSONObject();
            result.put("id", "google_" + Integer.toHexString(gif.url.hashCode()));
            result.put("title", "");
            result.put("url", gif.url);
            result.put("media_formats", formats);
            results.put(result);
        }

        JSONObject tenor = new JSONObject();
        tenor.put("results", results);
        tenor.put("next", gifs.isEmpty() ? "" : POS_PREFIX + (start + PAGE_SIZE));
        return tenor.toString();
    }

    private static Context context() {
        try {
            return (Application) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication")
                    .invoke(null);
        } catch (Throwable failure) {
            return null;
        }
    }
}
