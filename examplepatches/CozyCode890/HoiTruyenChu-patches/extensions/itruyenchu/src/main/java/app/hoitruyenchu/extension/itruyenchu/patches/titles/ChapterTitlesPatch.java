package app.hoitruyenchu.extension.itruyenchu.patches.titles;

import android.annotation.SuppressLint;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.net.Uri;
import android.util.Log;

import com.facebook.react.bridge.ReadableArray;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.EOFException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.zip.GZIPInputStream;
import java.util.zip.GZIPOutputStream;

import okhttp3.OkHttpClient;

/**
 * Shows the real chapter titles in the chapter list ("D.S Chương"), the reader header and the TTS.
 * <p>
 * The chapter list the app (and the website) uses, {@code STATIC_URL/chapters/{slug}.json.gz} =
 * {@code {"207": {"title": "Chương 207"}, ...}}, has no real title for many books: the app strips
 * "Chương 207" and shows "Vô Đề Mục". The real title is the first line of the chapter text
 * ("Chương 207: Ma Thần hư ảnh"), and the public preview of every chapter
 * ({@code STATIC_URL/preview/{slug}/chuong-{n}-preview.txt}, gzip, used by the app for VIP chapters;
 * {@code STATIC_URL/free/{slug}/chuong-{n}.txt} for chapters 1-50) starts with it.
 * <p>
 * This class reads the first kilobyte of those files (HTTP Range, no login, nothing recorded on the
 * server), keeps the titles in {@code files/htc-chapter-titles/{slug}.json} and puts them into the
 * chapter list when the app downloads it, and into the copy the app keeps in AsyncStorage
 * ({@code s3:{url}}, refreshed every hour).
 * <p>
 * Public static methods are called from patched smali.
 */
@SuppressWarnings("unused")
public final class ChapterTitlesPatch {
    static final String TAG = "HTC-Titles";

    private static final String[] STATIC_URLS = {"https://assets.tienphu.top", "https://assets.hoitruyenchu.org"};
    /** Chapters 1-50 are free (same limit as the app's getChapterContent). */
    private static final int FREE_CHAPTERS = 50;

    private static final String CACHE_DIR = "htc-chapter-titles";
    private static final String DATABASE = "RKStorage";
    private static final String TABLE = "catalystLocalStorage";
    private static final String KEY_READ = "read";

    /** How long the app's chapter list request may wait for missing titles. */
    private static final long LIST_WAIT_MS = 2_500;
    /** Chapters whose text has no "Chương N: title" line are tried again after this time. */
    private static final long NO_TITLE_RETRY_MS = 3L * 24 * 60 * 60 * 1000;
    private static final int RANGE_BYTES = 1024;
    private static final int TIMEOUT_MS = 8_000;
    private static final int THREADS = 6;
    private static final int SAVE_EVERY = 200;

    static final Pattern LIST_PATH = Pattern.compile("^/chapters/([^/]+)\\.json\\.gz$");
    private static final Pattern STORAGE_KEY = Pattern.compile("^s3:https?://[^/]+/chapters/([^/]+)\\.json\\.gz$");
    private static final Pattern CHAPTER_KEY = Pattern.compile("^\\d+(\\.\\d+)?$");
    /** A title that only repeats the chapter number ("Chương 207", "Chương 207:"), or nothing. */
    private static final Pattern GENERIC_TITLE = Pattern.compile(
            "^\\s*(?:ch(?:ươ|uo|ư)ng\\s*\\d+(?:[.,]\\d+)?\\s*[:：.\\-–—]?)?\\s*$",
            Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE);
    /** First line of a chapter text: "Chương 207: Ma Thần hư ảnh". */
    private static final Pattern HEADER = Pattern.compile(
            "^\\s*ch(?:ươ|uo|ư)ng\\s*(\\d+(?:[.,]\\d+)?)\\s*[:：.\\-–—]?\\s*(.*?)\\s*$",
            Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE);
    private static final int HEADER_LINES = 8;
    private static final int MAX_TITLE = 200;

    private static final Map<String, Book> books = new HashMap<>();
    private static ExecutorService pool;

    private ChapterTitlesPatch() {
    }

    // ---------------------------------------------------------------------------------------------
    // Hooks

    /** OkHttpClientProvider.createClientBuilder(): the app's network client. */
    public static void onCreateClientBuilder(OkHttpClient.Builder builder) {
        try {
            if (builder != null) builder.addInterceptor(new ChapterListInterceptor());
        } catch (Throwable t) {
            Log.e(TAG, "could not add interceptor", t);
        }
    }

    /**
     * Start of AsyncStorageModule.multiGet(keys): when the app reads its stored copy of a chapter list,
     * the titles found so far are written into it first (on the module's serial executor, so in
     * front of the read).
     */
    public static void beforeStorageGet(ReadableArray keys, Executor executor) {
        try {
            if (keys == null || executor == null) return;
            for (int i = 0; i < keys.size(); i++) {
                if (keys.isNull(i)) continue;
                final String key = keys.getString(i);
                if (key == null || !key.startsWith("s3:")) continue;
                final Matcher matcher = STORAGE_KEY.matcher(key);
                if (!matcher.matches()) continue;
                final String slug = Uri.decode(matcher.group(1));
                executor.execute(() -> updateStoredList(key, slug));
            }
        } catch (Throwable t) {
            Log.w(TAG, "beforeStorageGet failed", t);
        }
    }

    // ---------------------------------------------------------------------------------------------
    // Chapter list

    /**
     * Called by the interceptor with the downloaded chapter list.
     * @return the list with the real titles (same format), or null to keep the original.
     */
    static byte[] onChapterList(String slug, byte[] raw) throws Exception {
        boolean gzip = isGzip(raw);
        JSONObject list = new JSONObject(new String(gzip ? gunzip(raw, false) : raw, StandardCharsets.UTF_8));
        Book book = book(slug);
        List<String> missing = book.missing(list);
        if (!missing.isEmpty()) {
            CountDownLatch done = fetch(book, missing);
            if (!done.await(LIST_WAIT_MS, TimeUnit.MILLISECONDS)) {
                Log.i(TAG, slug + ": " + done.getCount() + " of " + missing.size()
                        + " titles still loading in the background");
            }
        }
        int replaced = book.apply(list);
        Log.i(TAG, slug + ": " + replaced + " real titles in the chapter list");
        if (replaced == 0) return null;
        byte[] json = list.toString().getBytes(StandardCharsets.UTF_8);
        return gzip ? gzip(json) : json;
    }

    /** Puts the known titles into the app's stored copy {"timestamp":..,"data":{chapter list}}. */
    private static void updateStoredList(String key, String slug) {
        try {
            String value = readDb(key);
            if (value == null) return;
            JSONObject stored = new JSONObject(value);
            JSONObject list = stored.optJSONObject("data");
            if (list == null) return;
            Book book = book(slug);
            List<String> missing = book.missing(list);
            if (!missing.isEmpty()) fetch(book, missing); // background, ready next time
            if (book.apply(list) > 0 && writeDb(key, stored.toString())) {
                Log.i(TAG, slug + ": real titles written into the stored chapter list");
            }
        } catch (Throwable t) {
            Log.w(TAG, "updating the stored chapter list failed: " + t);
        }
    }

    /** Title shown by the app for a chapter, or null if it is only the chapter number. */
    private static boolean isGeneric(Object title) {
        return !(title instanceof String) || GENERIC_TITLE.matcher((String) title).matches();
    }

    // ---------------------------------------------------------------------------------------------
    // Title cache of one book

    private static final class Book {
        final String slug;
        final File file;
        final Map<String, String> titles = new HashMap<>();
        /** Chapters without a title line, with the time they were checked. */
        final Map<String, Long> untitled = new HashMap<>();
        final Set<String> loading = new HashSet<>();
        int unsaved;

        Book(String slug, File file) {
            this.slug = slug;
            this.file = file;
        }

        /** Chapters of the list with a generic title and no known real title, most useful first. */
        synchronized List<String> missing(JSONObject list) {
            long now = System.currentTimeMillis();
            List<String> keys = new ArrayList<>();
            for (Iterator<String> it = list.keys(); it.hasNext(); ) {
                String key = it.next();
                if (!CHAPTER_KEY.matcher(key).matches() || titles.containsKey(key) || loading.contains(key)) continue;
                Long checked = untitled.get(key);
                if (checked != null && now - checked < NO_TITLE_RETRY_MS) continue;
                JSONObject chapter = list.optJSONObject(key);
                if (chapter != null && isGeneric(chapter.opt("title"))) keys.add(key);
            }
            return prioritize(keys, readingChapter(slug));
        }

        /** Replaces generic titles with the known ones. @return number of chapters with a real title. */
        synchronized int apply(JSONObject list) throws Exception {
            int count = 0;
            for (Iterator<String> it = list.keys(); it.hasNext(); ) {
                String key = it.next();
                String title = titles.get(key);
                JSONObject chapter = list.optJSONObject(key);
                if (title == null || chapter == null || !isGeneric(chapter.opt("title"))) continue;
                chapter.put("title", title);
                count++;
            }
            return count;
        }

        synchronized void result(String key, String title, boolean failed) {
            loading.remove(key);
            if (!failed) {
                if (title != null) {
                    titles.put(key, title);
                    untitled.remove(key);
                } else {
                    untitled.put(key, System.currentTimeMillis());
                }
                unsaved++;
            }
            if (unsaved > 0 && (unsaved >= SAVE_EVERY || loading.isEmpty())) save();
        }

        void load() {
            try {
                if (!file.exists()) return;
                JSONObject json = new JSONObject(new String(readAll(file), StandardCharsets.UTF_8));
                JSONObject t = json.optJSONObject("titles");
                if (t != null) for (Iterator<String> it = t.keys(); it.hasNext(); ) {
                    String key = it.next();
                    titles.put(key, t.getString(key));
                }
                JSONObject u = json.optJSONObject("untitled");
                if (u != null) for (Iterator<String> it = u.keys(); it.hasNext(); ) {
                    String key = it.next();
                    untitled.put(key, u.getLong(key));
                }
            } catch (Throwable t) {
                Log.w(TAG, "reading " + file + " failed: " + t);
            }
        }

        private void save() {
            try {
                JSONObject json = new JSONObject();
                json.put("titles", new JSONObject(titles));
                json.put("untitled", new JSONObject(untitled));
                File parent = file.getParentFile();
                if (parent != null && !parent.exists() && !parent.mkdirs()) return;
                File tmp = new File(file.getPath() + ".tmp");
                try (OutputStream out = new FileOutputStream(tmp)) {
                    out.write(json.toString().getBytes(StandardCharsets.UTF_8));
                }
                if (!tmp.renameTo(file)) Log.w(TAG, "saving " + file + " failed");
                unsaved = 0;
            } catch (Throwable t) {
                Log.w(TAG, "saving " + file + " failed: " + t);
            }
        }
    }

    private static Book book(String slug) {
        synchronized (books) {
            Book book = books.get(slug);
            if (book == null) {
                Context context = context();
                File dir = new File(context != null ? context.getFilesDir() : new File("/data/local/tmp"), CACHE_DIR);
                book = new Book(slug, new File(dir, slug.replaceAll("[^A-Za-z0-9._-]", "_") + ".json"));
                book.load();
                books.put(slug, book);
            }
            return book;
        }
    }

    /**
     * Newest chapters first (the "Chương Mới" box), then the chapters around the reading position,
     * then the rest from the start of the book (the list's default order).
     */
    private static List<String> prioritize(List<String> keys, double reading) {
        keys.sort((a, b) -> Double.compare(Double.parseDouble(a), Double.parseDouble(b)));
        List<String> result = new ArrayList<>(keys.size());
        Set<String> taken = new HashSet<>();
        for (int i = keys.size() - 1; i >= 0 && i >= keys.size() - 3; i--) {
            result.add(keys.get(i));
            taken.add(keys.get(i));
        }
        if (reading > 0) {
            for (String key : keys) {
                double chapter = Double.parseDouble(key);
                if (chapter >= reading - 20 && chapter <= reading + 200 && taken.add(key)) result.add(key);
            }
        }
        for (String key : keys) if (taken.add(key)) result.add(key);
        return result;
    }

    // ---------------------------------------------------------------------------------------------
    // Downloading titles

    /** Queues the chapters. @return a latch released when all of them are done. */
    private static CountDownLatch fetch(final Book book, List<String> keys) {
        final CountDownLatch done = new CountDownLatch(keys.size());
        ExecutorService executor = pool();
        synchronized (book) {
            book.loading.addAll(keys);
        }
        for (final String key : keys) {
            executor.execute(() -> {
                String title = null;
                boolean failed = true;
                try {
                    title = downloadTitle(book.slug, key);
                    failed = false;
                } catch (Throwable t) {
                    // Network error: try again next time.
                } finally {
                    book.result(key, title, failed);
                    done.countDown();
                }
            });
        }
        return done;
    }

    private static synchronized ExecutorService pool() {
        if (pool == null) {
            ThreadPoolExecutor executor = new ThreadPoolExecutor(THREADS, THREADS, 30, TimeUnit.SECONDS,
                    new LinkedBlockingQueue<>(), runnable -> {
                Thread thread = new Thread(runnable, "HTC-Titles");
                thread.setDaemon(true);
                thread.setPriority(Thread.MIN_PRIORITY);
                return thread;
            });
            executor.allowCoreThreadTimeOut(true);
            pool = executor;
        }
        return pool;
    }

    /**
     * @return the title, or null if the chapter text has no "Chương N: title" line.
     * @throws Exception on a network error (nothing is remembered then).
     */
    static String downloadTitle(String slug, String key) throws Exception {
        String path = Double.parseDouble(key) <= FREE_CHAPTERS
                ? "/free/" + Uri.encode(slug) + "/chuong-" + key + ".txt"
                : "/preview/" + Uri.encode(slug) + "/chuong-" + key + "-preview.txt";
        Exception error = null;
        for (String host : STATIC_URLS) {
            try {
                byte[] bytes = getStart(host + path);
                if (bytes == null) return null; // no such file
                if (!isGzip(bytes)) throw new Exception("not gzip");
                return titleFrom(new String(gunzip(bytes, true), StandardCharsets.UTF_8), key);
            } catch (Exception e) {
                error = e;
            }
        }
        throw error;
    }

    /** First RANGE_BYTES of a file. @return null on HTTP 404. */
    private static byte[] getStart(String url) throws Exception {
        HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
        try {
            connection.setConnectTimeout(TIMEOUT_MS);
            connection.setReadTimeout(TIMEOUT_MS);
            connection.setRequestProperty("Range", "bytes=0-" + (RANGE_BYTES - 1));
            connection.setRequestProperty("Accept-Encoding", "identity");
            int code = connection.getResponseCode();
            if (code == 404) return null;
            if (code != 200 && code != 206) throw new Exception("HTTP " + code);
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            try (InputStream in = connection.getInputStream()) {
                byte[] buffer = new byte[4096];
                int n;
                while (out.size() < RANGE_BYTES && (n = in.read(buffer)) > 0) out.write(buffer, 0, n);
            }
            return out.toByteArray();
        } finally {
            connection.disconnect();
        }
    }

    static String titleFrom(String text, String key) {
        String[] lines = Normalizer.normalize(text, Normalizer.Form.NFC).split("\n");
        int seen = 0;
        double chapter = Double.parseDouble(key);
        for (String line : lines) {
            if (line.trim().isEmpty()) continue;
            if (++seen > HEADER_LINES) break;
            Matcher matcher = HEADER.matcher(line);
            if (!matcher.matches()) continue;
            double number;
            try {
                number = Double.parseDouble(matcher.group(1).replace(',', '.'));
            } catch (NumberFormatException e) {
                continue;
            }
            if (number != chapter) continue;
            String title = matcher.group(2).trim();
            if (title.isEmpty()) return null;
            return title.length() > MAX_TITLE ? title.substring(0, MAX_TITLE) : title;
        }
        return null;
    }

    // ---------------------------------------------------------------------------------------------
    // Helpers

    private static byte[] readAll(File file) throws Exception {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        try (InputStream in = new FileInputStream(file)) {
            byte[] buffer = new byte[8192];
            int n;
            while ((n = in.read(buffer)) > 0) out.write(buffer, 0, n);
        }
        return out.toByteArray();
    }

    static boolean isGzip(byte[] bytes) {
        return bytes != null && bytes.length > 2 && (bytes[0] & 0xff) == 0x1f && (bytes[1] & 0xff) == 0x8b;
    }

    /** @param partial the data is cut off: return what could be decompressed. */
    private static byte[] gunzip(byte[] bytes, boolean partial) throws Exception {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        try (InputStream in = new GZIPInputStream(new ByteArrayInputStream(bytes))) {
            byte[] buffer = new byte[8192];
            int n;
            while ((n = in.read(buffer)) > 0) out.write(buffer, 0, n);
        } catch (EOFException e) {
            if (!partial) throw e;
        }
        return out.toByteArray();
    }

    private static byte[] gzip(byte[] bytes) throws Exception {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        try (GZIPOutputStream zip = new GZIPOutputStream(out)) {
            zip.write(bytes);
        }
        return out.toByteArray();
    }

    /** Chapter being read in this book, from the app's reading history (key "read"), or 0. */
    private static double readingChapter(String slug) {
        try {
            String value = readDb(KEY_READ);
            if (value == null) return 0;
            JSONObject state = new JSONObject(value).optJSONObject("state");
            JSONArray items = state == null ? null : state.optJSONArray("recentReads");
            if (items == null) return 0;
            for (int i = 0; i < items.length(); i++) {
                JSONObject item = items.optJSONObject(i);
                if (item != null && slug.equals(item.optString("slug"))) {
                    return Double.parseDouble(item.optString("currentChapter", "0"));
                }
            }
        } catch (Throwable ignored) {
        }
        return 0;
    }

    @SuppressLint("PrivateApi")
    private static Context context() {
        try {
            return (Context) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
        } catch (Throwable t) {
            return null;
        }
    }

    private static SQLiteDatabase openDb() {
        Context context = context();
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
