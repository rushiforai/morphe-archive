package app.userinsights.extension;

import android.content.Context;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Client for the public Arctic Shift Reddit archive (https://arctic-shift.photon-reddit.com),
 * with an in-memory and on-disk cache for each user's top subreddits.
 */
final class ArcticShift {
    private static final String BASE = "https://arctic-shift.photon-reddit.com";
    private static final String USER_AGENT = "RedditUserInsights/1.0 (Morphe patch)";

    private static final String CACHE_NAME = "user_insights_cache";
    private static final long CACHE_TTL_MS = 3L * 24 * 60 * 60 * 1000;      // 3 days
    private static final long EMPTY_TTL_MS = 24L * 60 * 60 * 1000;          // 1 day for users with no data
    private static final long RETRY_AFTER_ERROR_MS = 60L * 1000;
    /** Requests for top subreddits that run at the same time. */
    private static final int MAX_CONCURRENT = 5;
    private static final int MAX_PENDING = 60;
    private static final long PAGE_CACHE_TTL_MS = 10L * 60 * 1000;
    private static final int MAX_DISK_ENTRIES = 1500;

    static final class SubCount {
        final String subreddit;
        final int count;

        SubCount(String subreddit, int count) {
            this.subreddit = subreddit;
            this.count = count;
        }
    }

    static final class Item {
        boolean isPost;
        String id = "";
        String subreddit = "";
        String title = "";
        String body = "";
        String permalink = "";
        String url = "";
        long createdUtc;
        int score;
        int numComments;
    }

    interface Callback<T> {
        /** Called on the main thread. Exactly one of result/error is non-null. */
        void onResult(T result, String error);
    }

    private static final ExecutorService POOL = Executors.newFixedThreadPool(6);
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private static final Map<String, List<SubCount>> memCache = new LinkedHashMap<String, List<SubCount>>(64, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, List<SubCount>> eldest) {
            return size() > 500;
        }
    };
    private static final Set<String> inFlight = new HashSet<>();
    /** Users waiting for a request slot, newest first (the ones just scrolled into view). */
    private static final java.util.ArrayDeque<String[]> pending = new java.util.ArrayDeque<>();
    /** Archive pages and top-subreddit lists, so reopening a profile is instant. */
    private static final Map<String, Object[]> pageCache = new LinkedHashMap<String, Object[]>(32, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, Object[]> eldest) {
            return size() > 60;
        }
    };
    private static final Map<String, Long> failedAt = new HashMap<>();

    private static volatile long pauseUntilMs;
    private static Runnable onDataChanged;

    private ArcticShift() {
    }

    static void setOnDataChanged(Runnable listener) {
        onDataChanged = listener;
    }

    private static String cacheKey(String user) {
        return user.toLowerCase() + "|" + Prefs.timeWindow();
    }

    private static SharedPreferences disk() {
        Context context = UserInsights.app();
        return context == null ? null : context.getSharedPreferences(CACHE_NAME, Context.MODE_PRIVATE);
    }

    /**
     * Returns the cached top subreddits (sorted, most active first),
     * an empty list if the user has no archived activity, or null if not loaded yet.
     * Main thread only.
     */
    static List<SubCount> cachedTopSubs(String user) {
        String key = cacheKey(user);
        List<SubCount> cached = memCache.get(key);
        if (cached != null) {
            return cached;
        }
        SharedPreferences disk = disk();
        if (disk == null) {
            return null;
        }
        String stored = disk.getString(key, null);
        if (stored == null) {
            return null;
        }
        int newline = stored.indexOf('\n');
        if (newline <= 0) {
            return null;
        }
        try {
            long savedAt = Long.parseLong(stored.substring(0, newline));
            List<SubCount> list = parseSubCounts(new JSONArray(stored.substring(newline + 1)));
            long ttl = list.isEmpty() ? EMPTY_TTL_MS : CACHE_TTL_MS;
            if (System.currentTimeMillis() - savedAt > ttl) {
                return null;
            }
            memCache.put(key, list);
            return list;
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * True while a user's top subreddits are being loaded or waiting to load
     * (false after a recent failure, so no placeholder stays forever).
     */
    static boolean isLoading(String user) {
        String key = cacheKey(user);
        if (memCache.containsKey(key)) {
            return false;
        }
        Long failed = failedAt.get(key);
        return failed == null || System.currentTimeMillis() - failed >= RETRY_AFTER_ERROR_MS;
    }

    /**
     * Starts loading a user's top subreddits in the background if needed.
     * When done, the data-changed listener is called so the screen is scanned again.
     * Main thread only.
     */
    static void requestTopSubs(final String user) {
        final String key = cacheKey(user);
        if (memCache.containsKey(key) || inFlight.contains(key)) {
            return;
        }
        Long failed = failedAt.get(key);
        if (failed != null && System.currentTimeMillis() - failed < RETRY_AFTER_ERROR_MS) {
            return;
        }
        // Move to the front: the newest names on screen load first.
        java.util.Iterator<String[]> iterator = pending.iterator();
        while (iterator.hasNext()) {
            if (iterator.next()[0].equals(key)) {
                iterator.remove();
            }
        }
        pending.addFirst(new String[]{key, user, Prefs.timeWindow()});
        while (pending.size() > MAX_PENDING) {
            pending.removeLast();
        }
        pump();
    }

    private static void pump() {
        while (inFlight.size() < MAX_CONCURRENT && !pending.isEmpty()
                && System.currentTimeMillis() >= pauseUntilMs) {
            final String[] request = pending.removeFirst();
            final String key = request[0];
            if (memCache.containsKey(key) || inFlight.contains(key)) {
                continue;
            }
            inFlight.add(key);
            POOL.execute(() -> {
                List<SubCount> result = null;
                try {
                    result = fetchTopSubs(request[1], 10, request[2]);
                } catch (Exception e) {
                    Log.w(UserInsights.TAG, "Top subreddits failed for " + request[1] + ": " + e.getMessage());
                }
                final List<SubCount> finalResult = result;
                MAIN.post(() -> {
                    inFlight.remove(key);
                    if (finalResult == null) {
                        failedAt.put(key, System.currentTimeMillis());
                    } else {
                        failedAt.remove(key);
                        memCache.put(key, finalResult);
                        saveToDisk(key, finalResult);
                    }
                    // Redraw comment headers that show this user (or its loading dots).
                    EmbeddedPills.onDataChanged();
                    Runnable listener = onDataChanged;
                    if (listener != null) {
                        listener.run();
                    }
                    pump();
                });
            });
        }
        if (!pending.isEmpty() && inFlight.isEmpty() && System.currentTimeMillis() < pauseUntilMs) {
            MAIN.postDelayed(ArcticShift::pump, pauseUntilMs - System.currentTimeMillis() + 50);
        }
    }

    private static void saveToDisk(String key, List<SubCount> list) {
        SharedPreferences disk = disk();
        if (disk == null) {
            return;
        }
        try {
            JSONArray array = new JSONArray();
            for (SubCount sub : list) {
                JSONObject object = new JSONObject();
                object.put("subreddit", sub.subreddit);
                object.put("count", sub.count);
                array.put(object);
            }
            SharedPreferences.Editor editor = disk.edit();
            if (disk.getAll().size() > MAX_DISK_ENTRIES) {
                editor.clear();
            }
            editor.putString(key, System.currentTimeMillis() + "\n" + array).apply();
        } catch (Exception e) {
            Log.w(UserInsights.TAG, "Cache write failed", e);
        }
    }

    static void clearCache() {
        memCache.clear();
        failedAt.clear();
        pageCache.clear();
        SharedPreferences disk = disk();
        if (disk != null) {
            disk.edit().clear().apply();
        }
    }

    /**
     * Loads a user's most active subreddits for the archive screen (cached for 10 minutes).
     */
    @SuppressWarnings("unchecked")
    static void topSubs(final String user, final int limit, final Callback<List<SubCount>> callback) {
        final String window = Prefs.timeWindow();
        String key = "subs|" + user.toLowerCase() + "|" + limit + "|" + window;
        loadPage(key, () -> fetchTopSubs(user, limit, window), (result, error) ->
                callback.onResult((List<SubCount>) result, error));
    }

    /**
     * Loads a page of a user's archived posts or comments, newest first.
     *
     * @param subreddit  Only this subreddit, or null for all.
     * @param beforeUtc  Only items older than this (seconds), or 0 for the newest.
     */
    @SuppressWarnings("unchecked")
    static void search(final boolean posts, final String user, final String subreddit,
                       final long beforeUtc, final Callback<List<Item>> callback) {
        String key = (posts ? "posts|" : "comments|") + user.toLowerCase() + "|"
                + (subreddit == null ? "" : subreddit.toLowerCase()) + "|" + beforeUtc;
        loadPage(key, () -> {
            Uri.Builder builder = Uri.parse(BASE).buildUpon()
                    .appendEncodedPath(posts ? "api/posts/search" : "api/comments/search")
                    .appendQueryParameter("author", user)
                    .appendQueryParameter("limit", "50")
                    .appendQueryParameter("sort", "desc");
            if (subreddit != null && !subreddit.isEmpty()) {
                builder.appendQueryParameter("subreddit", subreddit);
            }
            if (beforeUtc > 0) {
                builder.appendQueryParameter("before", String.valueOf(beforeUtc));
            }
            JSONArray data = getData(builder.build().toString());
            List<Item> items = new ArrayList<>();
            for (int i = 0; i < data.length(); i++) {
                JSONObject object = data.optJSONObject(i);
                if (object != null) {
                    items.add(parseItem(object, posts));
                }
            }
            return items;
        }, (result, error) -> callback.onResult((List<Item>) result, error));
    }

    private interface Fetch {
        Object run() throws Exception;
    }

    /** Requests waiting for a page that is already being loaded. */
    private static final Map<String, List<Callback<Object>>> pageWaiters = new HashMap<>();

    /**
     * Returns a cached page at once, joins a request that is already running for it,
     * or starts one. Callbacks run on the main thread. Main thread only.
     */
    private static void loadPage(final String key, final Fetch fetch, Callback<Object> callback) {
        Object cached = cachedPage(key);
        if (cached != null) {
            callback.onResult(cached, null);
            return;
        }
        List<Callback<Object>> waiters = pageWaiters.get(key);
        if (waiters != null) {
            waiters.add(callback);
            return;
        }
        waiters = new ArrayList<>();
        waiters.add(callback);
        pageWaiters.put(key, waiters);

        POOL.execute(() -> {
            Object result = null;
            String error = null;
            try {
                result = fetch.run();
            } catch (Exception e) {
                error = e.getMessage() == null ? "Network error" : e.getMessage();
            }
            final Object finalResult = result;
            final String finalError = error;
            MAIN.post(() -> {
                if (finalResult != null) {
                    pageCache.put(key, new Object[]{System.currentTimeMillis(), finalResult});
                }
                List<Callback<Object>> done = pageWaiters.remove(key);
                if (done != null) {
                    for (Callback<Object> waiter : done) {
                        waiter.onResult(finalResult, finalResult == null ? finalError : null);
                    }
                }
            });
        });
    }

    /** Main thread only. */
    private static Object cachedPage(String key) {
        Object[] entry = pageCache.get(key);
        if (entry == null) {
            return null;
        }
        if (System.currentTimeMillis() - (Long) entry[0] > PAGE_CACHE_TTL_MS) {
            pageCache.remove(key);
            return null;
        }
        return entry[1];
    }

    /**
     * Loads the first archive page and top subreddits of a user in the background,
     * so the hidden-activity view shows them as soon as it opens.
     */
    static void prefetchArchive(String user) {
        search(false, user, null, 0, (result, error) -> { });
        topSubs(user, 15, (result, error) -> { });
    }

    private static List<SubCount> fetchTopSubs(String user, int limit, String window) throws IOException {
        Uri.Builder builder = Uri.parse(BASE).buildUpon()
                .appendEncodedPath("api/users/interactions/subreddits")
                .appendQueryParameter("author", user)
                .appendQueryParameter("limit", String.valueOf(limit));
        if (window != null && !window.isEmpty()) {
            builder.appendQueryParameter("after", window);
        }
        List<SubCount> list = parseSubCounts(getData(builder.build().toString()));
        // The API returns them sorted already; sort again to be safe.
        Collections.sort(list, (a, b) -> Integer.compare(b.count, a.count));
        return list;
    }

    private static List<SubCount> parseSubCounts(JSONArray data) {
        List<SubCount> list = new ArrayList<>();
        for (int i = 0; i < data.length(); i++) {
            JSONObject object = data.optJSONObject(i);
            if (object == null) {
                continue;
            }
            String subreddit = object.optString("subreddit", "");
            int count = object.optInt("count", 0);
            if (!subreddit.isEmpty() && count > 0) {
                list.add(new SubCount(subreddit, count));
            }
        }
        return list;
    }

    private static Item parseItem(JSONObject object, boolean post) {
        Item item = new Item();
        item.isPost = post;
        item.id = object.optString("id", "");
        item.subreddit = object.optString("subreddit", "");
        item.createdUtc = (long) object.optDouble("created_utc", 0);
        item.score = object.optInt("score", 0);
        item.permalink = object.optString("permalink", "");
        if (post) {
            item.title = decode(object.optString("title", ""));
            item.body = decode(object.optString("selftext", ""));
            item.url = object.optString("url", "");
            item.numComments = object.optInt("num_comments", 0);
        } else {
            item.body = decode(object.optString("body", ""));
            if (item.permalink.isEmpty()) {
                String linkId = object.optString("link_id", "");
                if (linkId.startsWith("t3_")) {
                    linkId = linkId.substring(3);
                }
                if (!linkId.isEmpty() && !item.subreddit.isEmpty()) {
                    item.permalink = "/r/" + item.subreddit + "/comments/" + linkId + "/_/" + item.id + "/";
                }
            }
        }
        if (item.permalink.isEmpty() && post && !item.id.isEmpty()) {
            item.permalink = "/comments/" + item.id + "/";
        }
        return item;
    }

    private static String decode(String text) {
        if (text == null) {
            return "";
        }
        return text.replace("&amp;", "&")
                .replace("&lt;", "<")
                .replace("&gt;", ">")
                .replace("&quot;", "\"")
                .replace("&#39;", "'")
                .replace("&#x200B;", "")
                .trim();
    }

    private static JSONArray getData(String url) throws IOException {
        long now = System.currentTimeMillis();
        if (now < pauseUntilMs) {
            long seconds = (pauseUntilMs - now + 999) / 1000;
            throw new IOException("Arctic Shift rate limit, try again in " + seconds + "s");
        }

        HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
        connection.setConnectTimeout(15000);
        connection.setReadTimeout(30000);
        connection.setRequestProperty("User-Agent", USER_AGENT);
        connection.setRequestProperty("Accept", "application/json");
        try {
            int code = connection.getResponseCode();
            handleRateLimitHeaders(connection, code);
            if (code == 429) {
                throw new IOException("Arctic Shift rate limit, try again soon");
            }
            InputStream stream = code >= 400 ? connection.getErrorStream() : connection.getInputStream();
            String body = stream == null ? "" : readAll(stream);
            if (code >= 400) {
                String message = "Arctic Shift error " + code;
                try {
                    String error = new JSONObject(body).optString("error", "");
                    if (!error.isEmpty()) {
                        message += ": " + error;
                    }
                } catch (Exception ignored) {
                    // Not JSON.
                }
                throw new IOException(message);
            }
            JSONObject json = new JSONObject(body);
            JSONArray data = json.optJSONArray("data");
            if (data == null) {
                String error = json.optString("error", "");
                if (!error.isEmpty()) {
                    throw new IOException(error);
                }
                return new JSONArray();
            }
            return data;
        } catch (org.json.JSONException e) {
            throw new IOException("Unexpected response from Arctic Shift");
        } finally {
            connection.disconnect();
        }
    }

    private static void handleRateLimitHeaders(HttpURLConnection connection, int code) {
        try {
            String remaining = connection.getHeaderField("X-RateLimit-Remaining");
            String reset = connection.getHeaderField("X-RateLimit-Reset");
            int resetSeconds = reset == null ? 0 : (int) Double.parseDouble(reset);
            boolean low = remaining != null && Double.parseDouble(remaining) < 2;
            if (code == 429 || low) {
                pauseUntilMs = System.currentTimeMillis() + Math.max(5, resetSeconds) * 1000L;
            }
        } catch (Exception ignored) {
            if (code == 429) {
                pauseUntilMs = System.currentTimeMillis() + 30_000L;
            }
        }
    }

    private static String readAll(InputStream stream) throws IOException {
        try (InputStream in = stream) {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buffer = new byte[8192];
            int read;
            while ((read = in.read(buffer)) != -1) {
                out.write(buffer, 0, read);
            }
            return out.toString("UTF-8");
        }
    }
}
