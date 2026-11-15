package app.hoitruyenchu.extension.itruyenchu.patches.sync;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.net.Uri;
import android.os.Handler;
import android.os.HandlerThread;
import android.util.Log;

import com.facebook.react.bridge.ReadableArray;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.zip.GZIPInputStream;

import okhttp3.OkHttpClient;

/**
 * Automatic sync of the reading history ("Lịch sử đọc") with the iTruyenChu account.
 * <p>
 * How the stock app and the server work (from the Hermes bundle of app 2.1.0 and the website code):
 * <ul>
 *   <li>The reading history is a zustand store persisted in AsyncStorage under the key {@code read}:
 *       {@code {"state":{"recentReads":[{slug,title,categories,currentChapter,totalChapter,chapterTitle}]},"version":0}}.
 *       The reader only updates this local store.</li>
 *   <li>The login is persisted under {@code auth-storage}: {@code {"state":{"user":{..},"accessToken":".."}}}.</li>
 *   <li>The server records the progress itself whenever a chapter is downloaded with the token
 *       ({@code GET /chapters/{slug}/content/{n}}). The app (and the website) only do that for chapter 51
 *       and later; chapters 1-50 come from a public URL ({@code STATIC_URL/free/{slug}/chuong-{n}.txt}),
 *       so they are never recorded. That is why the sync sometimes works and sometimes does not.</li>
 *   <li>{@code POST /users/sync-books-new} returns the recorded progress as {@code {slug: chapter}};
 *       the app only calls it from the sync button. ({@code POST /users/sync-books}, used by the
 *       history screen button, now fails with HTTP 500 and is not used by the website.)</li>
 * </ul>
 * This class:
 * <ul>
 *   <li>When the app downloads a free chapter, downloads it once more with the token
 *       (in the background, the answer is ignored) so the server records it like any other chapter.</li>
 *   <li>On app start pulls the recorded progress and merges it into the stored history before the
 *       app loads it, so history read on other devices shows up without pressing anything.</li>
 *   <li>Entries that only have a slug and a chapter get their title, categories and number of
 *       chapters from the public book info file.</li>
 * </ul>
 * All public static methods are called from patched smali.
 */
@SuppressWarnings("unused")
public final class AutoSyncPatch {
    private static final String TAG = "HTC-Sync";

    private static final String API_URL = "https://api.tienphu.top";
    /** Returns the progress recorded by the server as {slug: chapter}. */
    private static final String PULL_PATH = "/users/sync-books-new";

    /** Public files (book info). The app's STATIC_URL first, the website's as fallback. */
    private static final String[] STATIC_URLS = {"https://assets.tienphu.top", "https://assets.hoitruyenchu.org"};
    private static final int BOOK_INFO_TIMEOUT_MS = 2_000;
    private static final long BOOK_INFO_BUDGET_MS = 2_500;

    private static final String KEY_READ = "read";
    private static final String KEY_AUTH = "auth-storage";
    private static final String DATABASE = "RKStorage";
    private static final String TABLE = "catalystLocalStorage";

    /** Same limit as the app (addRecentRead keeps 20 entries). */
    private static final int MAX_ITEMS = 20;
    /** How long loading the history may wait for the startup sync. */
    private static final long STARTUP_WAIT_MS = 4_500;
    private static final int STARTUP_TIMEOUT_MS = 3_000;
    private static final int TIMEOUT_MS = 15_000;
    /** How long the sync button may wait for the books recorded on the server. */
    private static final long PUSH_BUDGET_MS = 8_000;

    private static final Object lock = new Object();
    private static Context appContext;
    private static Handler worker;

    /** Login token persisted by the app. */
    private static volatile String token;
    /** Last free chapter recorded, "slug/chapter", to skip duplicates. */
    private static String lastRecorded;

    private static final CountDownLatch startupDone = new CountDownLatch(1);
    /** New value for {@code read} computed by the startup sync, written before the app loads it. */
    private static volatile String startupMerged;
    private static boolean historyLoadSeen;

    private AutoSyncPatch() {
    }

    // ---------------------------------------------------------------------------------------------
    // Hooks called from com.reactnativecommunity.asyncstorage.AsyncStorageModule

    /** End of the AsyncStorageModule constructor. */
    public static void onStorageCreated(Context context) {
        synchronized (lock) {
            if (appContext != null || context == null) return;
            Context app = context.getApplicationContext();
            appContext = app != null ? app : context;
            workerLocked().post(AutoSyncPatch::startupSync);
        }
    }

    /**
     * Start of AsyncStorageModule.multiGet(keys). The first time the app loads its reading history,
     * a task is queued on the module's serial executor in front of the read: it waits for the startup
     * sync and stores the merged history, so the app reads the merged value.
     */
    public static void beforeStorageGet(ReadableArray keys, Executor executor) {
        try {
            if (executor == null || !containsKey(keys, KEY_READ)) return;
            synchronized (lock) {
                if (historyLoadSeen) return;
                historyLoadSeen = true;
            }
            executor.execute(() -> {
                try {
                    if (!startupDone.await(STARTUP_WAIT_MS, TimeUnit.MILLISECONDS)) {
                        Log.w(TAG, "startup sync too slow, loading the local history");
                    }
                    String merged;
                    synchronized (lock) {
                        merged = startupMerged;
                        startupMerged = null;
                    }
                    if (merged != null && writeDb(KEY_READ, merged)) {
                        Log.i(TAG, "merged server history into the local history");
                    }
                } catch (Throwable t) {
                    Log.w(TAG, "applying startup sync failed", t);
                }
            });
        } catch (Throwable t) {
            Log.w(TAG, "beforeStorageGet failed", t);
        }
    }

    /** Start of AsyncStorageModule.multiSet([[key, value], ...]): keeps track of the login. */
    public static void onStorageSet(ReadableArray pairs) {
        try {
            if (pairs == null) return;
            for (int i = 0; i < pairs.size(); i++) {
                ReadableArray pair = pairs.getArray(i);
                if (pair == null || pair.size() < 2 || pair.isNull(0)) continue;
                if (KEY_AUTH.equals(pair.getString(0))) {
                    token = tokenFrom(pair.isNull(1) ? null : pair.getString(1));
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "onStorageSet failed", t);
        }
    }

    // ---------------------------------------------------------------------------------------------
    // Hook called from com.facebook.react.modules.network.OkHttpClientProvider.createClientBuilder()

    public static void onCreateClientBuilder(OkHttpClient.Builder builder) {
        try {
            if (builder != null) builder.addInterceptor(new FreeChapterInterceptor());
        } catch (Throwable t) {
            Log.e(TAG, "could not add interceptor", t);
        }
    }

    /** Called by FreeChapterInterceptor after the app downloaded STATIC_URL/free/{slug}/chuong-{n}.txt. */
    static void onFreeChapterLoaded(final String slug, final int chapter) {
        if (token == null) return;
        final String key = slug + "/" + chapter;
        synchronized (lock) {
            if (key.equals(lastRecorded)) return;
            lastRecorded = key;
            workerLocked().post(() -> recordChapter(slug, chapter));
        }
    }

    /**
     * The "Đồng bộ" button (POST /users/sync-books, now HTTP 500), answered from sync-books-new:
     * books this device has read further than the server knows are recorded on the server, then the
     * two histories are merged.
     *
     * @param local  the history posted by the button
     * @param pulled answer of POST /users/sync-books-new
     * @return {"recentReads": [...], "message": ".."} for the button: it clears the history and adds
     *         the entries one by one, each in front, so the list is sent oldest first.
     */
    static String onSyncButton(JSONArray local, String pulled, String authorization) throws Exception {
        if (token == null && authorization != null && authorization.startsWith("Bearer ")) {
            token = authorization.substring("Bearer ".length()).trim();
        }
        JSONObject response = pulled == null || pulled.trim().isEmpty() ? new JSONObject() : new JSONObject(pulled);
        JSONArray remote = itemsFrom(response.opt("recentReads"));
        if (remote == null) remote = new JSONArray();

        int pushed = pushNewer(local, remote);
        JSONArray merged = merge(new JSONArray(local.toString()), remote);
        fillBookInfo(merged);

        JSONArray oldestFirst = new JSONArray();
        for (int i = merged.length() - 1; i >= 0; i--) oldestFirst.put(merged.get(i));
        int added = merged.length() - local.length();
        String message = "Đồng bộ truyện thành công";
        if (added > 0) message += " (+" + added + " truyện)";
        Log.i(TAG, "sync button: local=" + local.length() + " server=" + remote.length()
                + " pushed=" + pushed + " merged=" + merged.length());
        return new JSONObject().put("recentReads", oldestFirst).put("message", message).toString();
    }

    /** Records on the server the books read further on this device. @return number recorded. */
    private static int pushNewer(JSONArray local, JSONArray remote) {
        java.util.Map<String, Double> server = new java.util.HashMap<>();
        for (int i = 0; i < remote.length(); i++) {
            JSONObject item = remote.optJSONObject(i);
            if (item != null) server.put(item.optString("slug"), chapterOf(item));
        }
        List<Callable<Boolean>> tasks = new ArrayList<>();
        for (int i = 0; i < local.length(); i++) {
            JSONObject item = local.optJSONObject(i);
            if (item == null) continue;
            final String slug = item.optString("slug", "");
            final double chapter = chapterOf(item);
            Double known = server.get(slug);
            if (slug.isEmpty() || chapter < 1 || chapter != Math.rint(chapter)) continue;
            if (known != null && known >= chapter) continue;
            tasks.add(() -> recordChapter(slug, (int) chapter));
        }
        if (tasks.isEmpty() || token == null) return 0;
        ExecutorService pool = Executors.newFixedThreadPool(Math.min(4, tasks.size()));
        int count = 0;
        try {
            for (Future<Boolean> result : pool.invokeAll(tasks, PUSH_BUDGET_MS, TimeUnit.MILLISECONDS)) {
                try {
                    if (Boolean.TRUE.equals(result.get())) count++;
                } catch (Throwable ignored) {
                }
            }
        } catch (InterruptedException ignored) {
        } finally {
            pool.shutdownNow();
        }
        return count;
    }

    // ---------------------------------------------------------------------------------------------
    // Sync

    private static Handler workerLocked() {
        if (worker == null) {
            HandlerThread thread = new HandlerThread("HTC-Sync");
            thread.start();
            worker = new Handler(thread.getLooper());
        }
        return worker;
    }

    /** Downloads the chapter with the token, the way the app does for chapter 51+, so the server records it. */
    private static boolean recordChapter(String slug, int chapter) {
        String currentToken = token;
        if (currentToken == null) return false;
        String url = API_URL + "/chapters/" + Uri.encode(slug) + "/content/" + chapter;
        int code = request("GET", url, null, currentToken, TIMEOUT_MS, null);
        if (code >= 200 && code < 300) {
            Log.i(TAG, "recorded chapter " + chapter + " of " + slug);
            return true;
        } else {
            Log.w(TAG, "recording chapter " + chapter + " of " + slug + " -> HTTP " + code);
            synchronized (lock) {
                if ((slug + "/" + chapter).equals(lastRecorded)) lastRecorded = null; // retry next time
            }
            return false;
        }
    }

    /** Runs on the worker thread, before the app loads its history. */
    private static void startupSync() {
        try {
            token = tokenFrom(readDb(KEY_AUTH));
            String stored = readDb(KEY_READ);
            JSONArray local = recentReadsFrom(stored);
            JSONArray remote = null;
            if (token == null) {
                Log.i(TAG, "not logged in, nothing to pull");
            } else {
                JSONObject response = post(PULL_PATH, null, STARTUP_TIMEOUT_MS);
                if (response != null) remote = itemsFrom(response.opt("recentReads"));
            }
            int remoteCount = remote == null ? 0 : remote.length();
            // merge() and fillBookInfo() work on the local entry objects: compare with a snapshot.
            String before = local.toString();
            JSONArray merged = merge(new JSONArray(before), remote == null ? new JSONArray() : remote);
            int filled = fillBookInfo(merged);
            if (merged.toString().equals(before)) {
                Log.i(TAG, "startup sync: local=" + local.length() + " server=" + remoteCount + ", nothing new");
                return;
            }
            synchronized (lock) {
                startupMerged = withRecentReads(stored, merged);
            }
            Log.i(TAG, "startup sync: local=" + local.length() + " server=" + remoteCount
                    + " merged=" + merged.length() + " filled=" + filled);
        } catch (Throwable t) {
            Log.w(TAG, "startup sync failed", t);
        } finally {
            startupDone.countDown();
        }
    }

    /**
     * Union by slug. The entry with the higher chapter wins (keeping the local title etc. if the
     * server entry has none). Order: by timestamp if the server provides one, otherwise local
     * entries first (most recent on this device), then entries only known to the server.
     */
    static JSONArray merge(JSONArray local, JSONArray remote) throws Exception {
        LinkedHashMap<String, JSONObject> bySlug = new LinkedHashMap<>();
        for (int i = 0; i < local.length(); i++) {
            JSONObject item = local.optJSONObject(i);
            String slug = item == null ? null : item.optString("slug", null);
            if (slug != null && !bySlug.containsKey(slug)) bySlug.put(slug, item);
        }
        for (int i = 0; i < remote.length(); i++) {
            JSONObject item = remote.optJSONObject(i);
            String slug = item == null ? null : item.optString("slug", null);
            if (slug == null) continue;
            JSONObject mine = bySlug.get(slug);
            if (mine == null) {
                bySlug.put(slug, item);
            } else if (chapterOf(item) > chapterOf(mine)) {
                JSONObject combined = new JSONObject(item.toString());
                for (String field : new String[]{"title", "categories", "totalChapter"}) {
                    if (isEmpty(combined.opt(field)) && !isEmpty(mine.opt(field))) {
                        combined.put(field, mine.get(field));
                    }
                }
                bySlug.put(slug, combined);
            }
        }
        List<JSONObject> items = new ArrayList<>(bySlug.values());
        final String stamp = timestampField(items);
        if (stamp != null) {
            items.sort((a, b) -> Long.compare(timeOf(b.opt(stamp)), timeOf(a.opt(stamp))));
        }
        JSONArray result = new JSONArray();
        for (int i = 0; i < items.size() && i < MAX_ITEMS; i++) result.put(items.get(i));
        return result;
    }

    /**
     * Entries pulled from the server only have a slug and a chapter (sync-books-new returns
     * {slug: chapter}), so the history shows "100 %" and no chapter title. Fill them from the public
     * files the app itself uses, like the reader does when a chapter is opened:
     * <ul>
     *   <li>title, categories, totalChapter (= released chapters) from {@code STATIC_URL/books/{slug}.json}
     *       (getBookBySlug), when the title is missing or totalChapter is not above the current chapter;</li>
     *   <li>chapterTitle from the chapter list {@code STATIC_URL/chapters/{slug}.json.gz}
     *       ({@code {"92": {"title": ..}}}, fetchChapters), when it is missing.</li>
     * </ul>
     *
     * @return number of entries changed.
     */
    static int fillBookInfo(JSONArray items) {
        List<JSONObject> missing = new ArrayList<>();
        for (int i = 0; i < items.length(); i++) {
            JSONObject item = items.optJSONObject(i);
            if (item == null || item.optString("slug", "").isEmpty()) continue;
            if (needsBookInfo(item) || isEmpty(item.opt("chapterTitle"))) missing.add(item);
        }
        if (missing.isEmpty()) return 0;
        try {
            return fillBookInfo(missing);
        } finally {
            // The history screen divides by totalChapter: never leave it empty.
            for (JSONObject item : missing) {
                try {
                    if (isEmpty(item.opt("totalChapter"))) item.put("totalChapter", item.opt("currentChapter"));
                } catch (Throwable ignored) {
                }
            }
        }
    }

    /** Title missing, or totalChapter missing / not above the current chapter (shows 100 %). */
    private static boolean needsBookInfo(JSONObject item) {
        if (isEmpty(item.opt("title")) || isEmpty(item.opt("totalChapter"))) return true;
        Object total = item.opt("totalChapter");
        double totalChapters = total instanceof Number ? ((Number) total).doubleValue() : parseDouble(total);
        return totalChapters <= chapterOf(item);
    }

    private static int fillBookInfo(List<JSONObject> missing) {
        ExecutorService pool = Executors.newFixedThreadPool(Math.min(4, missing.size()));
        try {
            List<Callable<JSONObject>> tasks = new ArrayList<>();
            for (JSONObject item : missing) {
                // Tasks only read copies, so an abandoned (timed out) task never touches the list.
                final JSONObject copy = new JSONObject(item.toString());
                tasks.add(() -> lookUp(copy));
            }
            List<Future<JSONObject>> results = pool.invokeAll(tasks, BOOK_INFO_BUDGET_MS, TimeUnit.MILLISECONDS);
            int filled = 0;
            for (int i = 0; i < missing.size(); i++) {
                JSONObject updates;
                try {
                    updates = results.get(i).get();
                } catch (Throwable t) {
                    Log.w(TAG, "book info " + missing.get(i).optString("slug") + " timed out");
                    continue;
                }
                if (updates.length() == 0) continue;
                JSONObject item = missing.get(i);
                Iterator<String> fields = updates.keys();
                while (fields.hasNext()) {
                    String field = fields.next();
                    item.put(field, updates.get(field));
                }
                filled++;
            }
            return filled;
        } catch (Throwable t) {
            Log.w(TAG, "filling book info failed: " + t);
            return 0;
        } finally {
            pool.shutdownNow();
        }
    }

    /** Fetches what one entry lacks. @return the fields to update (empty if nothing found). */
    private static JSONObject lookUp(JSONObject item) throws Exception {
        String slug = item.optString("slug");
        JSONObject updates = new JSONObject();
        if (needsBookInfo(item)) {
            JSONObject book = getPublicJson("/books/" + Uri.encode(slug) + ".json", "book info " + slug);
            if (book != null && !isEmpty(book.opt("title"))) {
                if (isEmpty(item.opt("title"))) updates.put("title", book.getString("title"));
                JSONArray categories = book.optJSONArray("categories");
                if (categories != null && isEmpty(item.opt("categories"))) updates.put("categories", categories);
                // Same mapping as the reader: totalChapter = book.currentChapter (released chapters).
                if (chapterOf(book) >= chapterOf(item)) updates.put("totalChapter", book.get("currentChapter"));
            }
        }
        if (isEmpty(item.opt("chapterTitle"))) {
            JSONObject chapters = getPublicJson("/chapters/" + Uri.encode(slug) + ".json.gz", "chapter list " + slug);
            JSONObject chapter = chapters == null ? null : chapters.optJSONObject(chapterKey(item));
            String title = chapter == null ? "" : chapter.optString("title", "");
            if (!title.isEmpty()) updates.put("chapterTitle", title);
        }
        return updates;
    }

    /** "92" for currentChapter 92 (or 92.0 / "92"). */
    private static String chapterKey(JSONObject item) {
        double chapter = chapterOf(item);
        return chapter == Math.rint(chapter) ? String.valueOf((long) chapter) : String.valueOf(chapter);
    }

    private static double parseDouble(Object value) {
        try {
            return value == null ? 0 : Double.parseDouble(value.toString());
        } catch (NumberFormatException e) {
            return 0;
        }
    }

    // ---------------------------------------------------------------------------------------------
    // JSON helpers

    private static String tokenFrom(String authValue) {
        try {
            if (authValue == null) return null;
            JSONObject state = new JSONObject(authValue).optJSONObject("state");
            if (state == null || state.isNull("accessToken")) return null;
            String value = state.optString("accessToken", "");
            return value.isEmpty() ? null : value;
        } catch (Throwable t) {
            return null;
        }
    }

    private static JSONArray recentReadsFrom(String readValue) {
        try {
            if (readValue == null) return new JSONArray();
            JSONObject state = new JSONObject(readValue).optJSONObject("state");
            JSONArray items = state == null ? null : state.optJSONArray("recentReads");
            return items != null ? items : new JSONArray();
        } catch (Throwable t) {
            return new JSONArray();
        }
    }

    private static String withRecentReads(String readValue, JSONArray items) throws Exception {
        JSONObject root;
        try {
            root = readValue != null ? new JSONObject(readValue) : new JSONObject();
        } catch (Throwable t) {
            root = new JSONObject();
        }
        JSONObject state = root.optJSONObject("state");
        if (state == null) {
            state = new JSONObject();
            root.put("state", state);
        }
        state.put("recentReads", items);
        if (!root.has("version")) root.put("version", 0);
        return root.toString();
    }

    /**
     * The server answers either a list of history entries (sync-books) or an object
     * {slug: chapter} (sync-books-new). The latter is converted like the profile screen does.
     */
    private static JSONArray itemsFrom(Object value) throws Exception {
        if (value instanceof JSONArray) return (JSONArray) value;
        if (!(value instanceof JSONObject)) return null;
        JSONObject map = (JSONObject) value;
        // The map is oldest first: the app's own handler (F29056) adds the entries one by one with
        // addRecentRead, which puts each on top, so the last key ends up as the most recent book.
        List<String> slugs = new ArrayList<>();
        Iterator<String> keys = map.keys();
        while (keys.hasNext()) slugs.add(0, keys.next());
        JSONArray items = new JSONArray();
        for (String slug : slugs) {
            Object chapter = map.get(slug);
            items.put(new JSONObject()
                    .put("slug", slug)
                    .put("title", "")
                    .put("categories", new JSONArray())
                    .put("currentChapter", chapter)
                    .put("chapterTitle", ""));
        }
        return items;
    }

    private static double chapterOf(JSONObject item) {
        Object value = item.opt("currentChapter");
        if (value instanceof Number) return ((Number) value).doubleValue();
        try {
            return value == null ? 0 : Double.parseDouble(value.toString());
        } catch (NumberFormatException e) {
            return 0;
        }
    }

    private static boolean isEmpty(Object value) {
        if (value == null || value == JSONObject.NULL) return true;
        if (value instanceof String) return ((String) value).isEmpty();
        if (value instanceof JSONArray) return ((JSONArray) value).length() == 0;
        return false;
    }

    private static String timestampField(List<JSONObject> items) {
        for (String field : new String[]{"updatedAt", "lastReadAt", "readAt", "lastRead", "timestamp"}) {
            boolean all = !items.isEmpty();
            for (JSONObject item : items) {
                if (timeOf(item.opt(field)) <= 0) {
                    all = false;
                    break;
                }
            }
            if (all) return field;
        }
        return null;
    }

    private static long timeOf(Object value) {
        if (value instanceof Number) return ((Number) value).longValue();
        if (value instanceof String) {
            String text = (String) value;
            try {
                return Long.parseLong(text);
            } catch (NumberFormatException ignored) {
            }
            try {
                return java.time.Instant.parse(text).toEpochMilli();
            } catch (Throwable ignored) {
            }
        }
        return 0;
    }

    private static boolean containsKey(ReadableArray keys, String key) {
        if (keys == null) return false;
        for (int i = 0; i < keys.size(); i++) {
            if (!keys.isNull(i) && key.equals(keys.getString(i))) return true;
        }
        return false;
    }

    // ---------------------------------------------------------------------------------------------
    // Network

    /** Authenticated POST to the API. @return the JSON response, or null if the request failed. */
    private static JSONObject post(String path, JSONObject body, int timeoutMs) {
        String currentToken = token;
        if (currentToken == null) return null;
        ByteArrayOutputStream response = new ByteArrayOutputStream();
        int code = request("POST", API_URL + path, body == null ? "" : body.toString(), currentToken, timeoutMs, response);
        if (code < 200 || code >= 300) {
            Log.w(TAG, "POST " + path + " -> HTTP " + code);
            return null;
        }
        try {
            String text = new String(response.toByteArray(), StandardCharsets.UTF_8);
            return text.isEmpty() ? new JSONObject() : new JSONObject(text);
        } catch (Throwable t) {
            Log.w(TAG, "POST " + path + ": unexpected answer");
            return null;
        }
    }

    /**
     * @param body     request body (sent as JSON), or null for none.
     * @param token    login token, or null for a public request.
     * @param response receives the response body when not null.
     * @return the HTTP status, or -1 if the request failed.
     */
    private static int request(String method, String url, String body, String token, int timeoutMs,
                               ByteArrayOutputStream response) {
        HttpURLConnection connection = null;
        try {
            connection = (HttpURLConnection) new URL(url).openConnection();
            connection.setRequestMethod(method);
            connection.setConnectTimeout(timeoutMs);
            connection.setReadTimeout(timeoutMs);
            connection.setRequestProperty("Accept", "application/json");
            if (token != null) connection.setRequestProperty("Authorization", "Bearer " + token);
            if (body != null) {
                byte[] payload = body.getBytes(StandardCharsets.UTF_8);
                connection.setRequestProperty("Content-Type", "application/json");
                connection.setDoOutput(true);
                connection.setFixedLengthStreamingMode(payload.length);
                try (OutputStream out = connection.getOutputStream()) {
                    out.write(payload);
                }
            }
            int code = connection.getResponseCode();
            if (code >= 200 && code < 300) {
                try (InputStream input = connection.getInputStream()) {
                    byte[] buffer = new byte[8192];
                    int n;
                    while ((n = input.read(buffer)) > 0) {
                        if (response != null) response.write(buffer, 0, n);
                    }
                }
            }
            return code;
        } catch (Throwable t) {
            Log.w(TAG, method + " " + Uri.parse(url).getPath() + " failed: " + t);
            return -1;
        } finally {
            if (connection != null) connection.disconnect();
        }
    }

    /** GET of a public JSON file (optionally gzipped). @return the JSON, or null. */
    private static JSONObject getPublicJson(String path, String what) {
        for (String host : STATIC_URLS) {
            ByteArrayOutputStream response = new ByteArrayOutputStream();
            int code = request("GET", host + path, null, null, BOOK_INFO_TIMEOUT_MS, response);
            if (code < 200 || code >= 300) {
                Log.w(TAG, what + " -> HTTP " + code);
                continue;
            }
            try {
                byte[] bytes = response.toByteArray();
                if (bytes.length > 2 && (bytes[0] & 0xff) == 0x1f && (bytes[1] & 0xff) == 0x8b) {
                    ByteArrayOutputStream unzipped = new ByteArrayOutputStream();
                    try (InputStream in = new GZIPInputStream(new ByteArrayInputStream(bytes))) {
                        byte[] buffer = new byte[8192];
                        int n;
                        while ((n = in.read(buffer)) > 0) unzipped.write(buffer, 0, n);
                    }
                    bytes = unzipped.toByteArray();
                }
                return new JSONObject(new String(bytes, StandardCharsets.UTF_8));
            } catch (Throwable t) {
                Log.w(TAG, what + ": unexpected answer");
            }
        }
        return null;
    }

    // ---------------------------------------------------------------------------------------------
    // AsyncStorage database (RKStorage / catalystLocalStorage)

    private static SQLiteDatabase openDb() {
        Context context = appContext;
        if (context == null) return null;
        File file = context.getDatabasePath(DATABASE);
        if (!file.exists()) return null;
        return SQLiteDatabase.openDatabase(file.getPath(), null, SQLiteDatabase.OPEN_READWRITE);
    }

    private static String readDb(String key) {
        try {
            SQLiteDatabase db = openDb();
            if (db == null) return null;
            try (Cursor cursor = db.rawQuery("SELECT value FROM " + TABLE + " WHERE key = ?", new String[]{key})) {
                return cursor.moveToFirst() ? cursor.getString(0) : null;
            } finally {
                db.close();
            }
        } catch (Throwable t) {
            Log.w(TAG, "reading " + key + " failed: " + t);
            return null;
        }
    }

    private static boolean writeDb(String key, String value) {
        try {
            SQLiteDatabase db = openDb();
            if (db == null) return false;
            try {
                db.execSQL("INSERT OR REPLACE INTO " + TABLE + " (key, value) VALUES (?, ?)", new Object[]{key, value});
                return true;
            } finally {
                db.close();
            }
        } catch (Throwable t) {
            Log.w(TAG, "writing " + key + " failed: " + t);
            return false;
        }
    }
}
