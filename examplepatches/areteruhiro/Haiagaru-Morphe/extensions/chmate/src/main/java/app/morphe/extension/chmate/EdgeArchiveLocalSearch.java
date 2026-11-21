package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.text.Html;
import android.text.TextUtils;
import android.widget.EditText;
import android.widget.Toast;

import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.atomic.AtomicLong;

/** Adds imported Edge archive DATs to ChMate 191's acquired-thread search results. */
public final class EdgeArchiveLocalSearch {
    private static final String LOG = "HaiagaruEdgeSearch";
    private static final java.util.regex.Pattern NATIVE_EDGE_DAT = java.util.regex.Pattern.compile(
            "^bbs\\.eddibb\\.cc%2Fliveedge_([0-9]{9,11})\\.dat$",
            java.util.regex.Pattern.CASE_INSENSITIVE);
    private static final ExecutorService IO = Executors.newSingleThreadExecutor(r -> {
        Thread thread = new Thread(r, "Haiagaru-edge-local-search");
        thread.setDaemon(true);
        return thread;
    });
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Map<Object, Search> SEARCHES = new WeakHashMap<>();
    private static final Map<String, Marked> MARKED = new java.util.HashMap<>();
    private static final Map<String, Marked> TITLES = new java.util.HashMap<>();
    private static final AtomicLong GENERATION = new AtomicLong();
    private static final long MARK_TTL = 5 * 60_000L;
    private static final int MAX_INDEX_ENTRIES = 5000;
    private static final int MAX_MATCHES = 100;
    private static final long MAX_SCAN_BYTES = 96L * 1024 * 1024;

    private static final class Search {
        final String query;
        final long generation;
        Future<?> future;
        Search(String query, long generation) { this.query = query; this.generation = generation; }
    }
    private static final class Marked {
        final String title;
        final long at;
        Marked(String title) { this.title = title; at = System.currentTimeMillis(); }
    }
    private static final class Result {
        final String url, title, snippet;
        Result(String url, String title, String snippet) { this.url = url; this.title = title; this.snippet = snippet; }
    }

    private EdgeArchiveLocalSearch() { }

    /** Called only from the Edge archive result click before ChMate opens its URL. */
    public static void markArchiveResult(String url, String title) {
        if (ArchiveOriginPaths.threadKey(url) == null) return;
        synchronized (MARKED) {
            MARKED.entrySet().removeIf(entry -> System.currentTimeMillis() - entry.getValue().at > MARK_TTL);
            MARKED.put(url, new Marked(title));
            TITLES.entrySet().removeIf(entry -> System.currentTimeMillis() - entry.getValue().at > MARK_TTL);
            TITLES.put(url, new Marked(title));
        }
    }

    /** One-shot marker distinguishes Edge archive navigation from ordinary live threads. */
    public static boolean consumeArchiveResult(String url) {
        synchronized (MARKED) {
            Marked marked = MARKED.remove(url);
            return marked != null && System.currentTimeMillis() - marked.at <= MARK_TTL;
        }
    }

    /** Index an existing or newly imported thread without storing its post contents. */
    static void remember(Context context, File dat, String url, String title) {
        if (context == null || dat == null || !dat.isFile() || ArchiveOriginPaths.threadKey(url) == null) return;
        Context app = context.getApplicationContext();
        if (app == null) app = context;
        Context target = app;
        IO.execute(() -> {
            try {
                File directory = datDirectory(target);
                File canonical = dat.getCanonicalFile();
                if (!canonical.getParentFile().equals(directory.getCanonicalFile())
                        || !canonical.getName().endsWith(".dat")) return;
                File index = indexFile(target, url);
                File parent = index.getParentFile();
                if (!parent.isDirectory() && !parent.mkdirs()) return;
                String resolvedTitle = title == null ? "" : title;
                if (resolvedTitle.isEmpty()) synchronized (MARKED) {
                    Marked marked = TITLES.get(url);
                    if (marked != null && System.currentTimeMillis() - marked.at <= MARK_TTL)
                        resolvedTitle = marked.title;
                }
                org.json.JSONObject value = new JSONObject().put("url", url)
                        .put("dat", canonical.getName()).put("title", resolvedTitle)
                        .put("updated", System.currentTimeMillis());
                android.util.AtomicFile atomic = new android.util.AtomicFile(index);
                FileOutputStream output = null;
                try {
                    output = atomic.startWrite();
                    output.write(value.toString().getBytes(StandardCharsets.UTF_8));
                    atomic.finishWrite(output);
                } catch (Exception error) {
                    if (output != null) atomic.failWrite(output);
                    throw error;
                }
                trimIndex(target);
            } catch (Exception error) {
                android.util.Log.w(LOG, "Unable to index imported archive", error);
            }
        });
    }

    /** Injected before the native search observer updates its adapter. */
    public static void appendFromSearchObserver(Object observer, ArrayList<?> nativeRows) {
        if (observer == null || nativeRows == null) return;
        try {
            Object fragment = ResponseArchiveEntry.field(observer, "b");
            if (fragment == null) return;
            Object binding = ResponseArchiveEntry.field(fragment, "c");
            Object input = ResponseArchiveEntry.field(binding, "g");
            if (!(input instanceof EditText)) return;
            String query = ((EditText) input).getText().toString().trim();
            if (query.length() < 2 || query.length() > 128) return;
            Activity activity = Haiagaru.toolbarActivity(fragment);
            if (activity == null || activity.isFinishing() || activity.isDestroyed()) return;
            Search next = new Search(query, GENERATION.incrementAndGet());
            synchronized (SEARCHES) {
                Search previous = SEARCHES.put(fragment, next);
                if (previous != null && previous.future != null) previous.future.cancel(true);
            }
            Context app = activity.getApplicationContext();
            next.future = IO.submit(() -> {
                try {
                    List<Result> matches = search(app, query, nativeRows);
                    MAIN.post(() -> apply(fragment, activity, next, matches));
                } catch (Exception error) {
                    android.util.Log.w(LOG, "Local archive search failed", error);
                }
            });
        } catch (ReflectiveOperationException | RuntimeException error) {
            android.util.Log.w(LOG, "Local archive search unavailable", error);
        }
    }

    private static List<Result> search(Context context, String query, ArrayList<?> nativeRows) throws Exception {
        File[] files = indexDirectory(context).listFiles(file -> file.isFile() && file.getName().endsWith(".json"));
        if (files != null) java.util.Arrays.sort(files, Comparator.comparingLong(File::lastModified).reversed());
        Set<String> seen = new HashSet<>();
        for (Object row : nativeRows) {
            try {
                Object value = ResponseArchiveEntry.field(row, "b");
                if (value instanceof String) seen.add((String) value);
            } catch (ReflectiveOperationException ignored) { }
        }
        String needle = query.toLowerCase(Locale.ROOT);
        ArrayList<Result> out = new ArrayList<>();
        File datDirectory = datDirectory(context).getCanonicalFile();
        long scanned = 0;
        int inspected = 0;
        for (File index : files == null ? new File[0] : files) {
            if (Thread.currentThread().isInterrupted() || out.size() >= MAX_MATCHES
                    || scanned >= MAX_SCAN_BYTES || inspected++ >= MAX_INDEX_ENTRIES) break;
            JSONObject item;
            try (FileInputStream input = new FileInputStream(index)) {
                if (index.length() > 32768) continue;
                byte[] bytes = new byte[(int) index.length()];
                int offset = 0, read;
                while (offset < bytes.length && (read = input.read(bytes, offset, bytes.length - offset)) > 0) offset += read;
                item = new JSONObject(new String(bytes, 0, offset, StandardCharsets.UTF_8));
            } catch (Exception corrupt) { continue; }
            String url = item.optString("url", "");
            String name = item.optString("dat", "");
            String title = item.optString("title", "");
            if (ArchiveOriginPaths.threadKey(url) == null || !name.matches("[A-Za-z0-9%._-]+\\.dat")
                    || seen.contains(url)) continue;
            File dat = new File(datDirectory, name).getCanonicalFile();
            if (!dat.getParentFile().equals(datDirectory) || !dat.isFile()) continue;
            String snippet = title.toLowerCase(Locale.ROOT).contains(needle) ? title : null;
            if (snippet == null && dat.length() <= MAX_SCAN_BYTES - scanned) {
                snippet = findBody(dat, needle, Math.min(dat.length(), 8L * 1024 * 1024));
                scanned += dat.length();
            }
            if (snippet != null) {
                if (TextUtils.isEmpty(title)) title = "エッヂ過去ログ " + ArchiveOriginPaths.threadKey(url);
                out.add(new Result(url, title, snippet));
                seen.add(url);
            }
        }
        // ChMate stores acquired Edge threads directly under this directory. They
        // do not pass through ArchivedThreadImporter, so no JSON index is created.
        // Search those native DAT files too, without copying or rewriting them.
        File nativeDirectory = datDirectory(context);
        File[] cached = nativeDirectory.listFiles(file -> file.isFile() && edgeUrlForCachedDat(file.getName()) != null);
        if (cached != null) {
            java.util.Arrays.sort(cached, Comparator.comparingLong(File::lastModified).reversed());
            for (File datFile : cached) {
                if (Thread.currentThread().isInterrupted() || out.size() >= MAX_MATCHES
                        || scanned >= MAX_SCAN_BYTES || inspected++ >= MAX_INDEX_ENTRIES) break;
                String url = edgeUrlForCachedDat(datFile.getName());
                if (url == null || seen.contains(url)) continue;
                File canonical = datFile.getCanonicalFile();
                if (!canonical.getParentFile().equals(nativeDirectory.getCanonicalFile()) || !canonical.isFile()) continue;
                String title = firstDatTitle(canonical);
                String snippet = !TextUtils.isEmpty(title) && title.toLowerCase(Locale.ROOT).contains(needle)
                        ? title : null;
                if (snippet == null && canonical.length() <= MAX_SCAN_BYTES - scanned) {
                    snippet = findBody(canonical, needle, Math.min(canonical.length(), 8L * 1024 * 1024));
                    scanned += canonical.length();
                }
                if (snippet != null) {
                    if (TextUtils.isEmpty(title)) title = "エッヂ過去ログ " + ArchiveOriginPaths.threadKey(url);
                    out.add(new Result(url, title, snippet));
                    seen.add(url);
                }
            }
        }
        return out;
    }

    static String edgeUrlForCachedDat(String fileName) {
        if (fileName == null) return null;
        java.util.regex.Matcher match = NATIVE_EDGE_DAT.matcher(fileName);
        return match.matches() ? "https://bbs.eddibb.cc/test/read.cgi/liveedge/" + match.group(1) + "/" : null;
    }

    private static String firstDatTitle(File dat) {
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(
                new FileInputStream(dat), StandardCharsets.UTF_8))) {
            String first = reader.readLine();
            if (first == null) return "";
            String[] fields = first.split("<>", -1);
            if (fields.length < 5 || fields[4].isEmpty()) return "";
            @SuppressWarnings("deprecation")
            String title = Html.fromHtml(fields[4]).toString().replace('\u0000', ' ').trim();
            return title;
        } catch (Exception ignored) { return ""; }
    }

    private static String findBody(File dat, String needle, long perFileLimit) {
        if (perFileLimit <= 0) return null;
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream(dat), StandardCharsets.UTF_8))) {
            String line;
            long read = 0;
            while ((line = reader.readLine()) != null && read < perFileLimit) {
                if (Thread.currentThread().isInterrupted()) return null;
                read += line.length() * 2L;
                @SuppressWarnings("deprecation")
                String plain = Html.fromHtml(datBody(line)).toString();
                if (plain.toLowerCase(Locale.ROOT).contains(needle)) {
                    plain = plain.replace('\u0000', ' ').replaceAll("\\s+", " ").trim();
                    return plain.length() <= 180 ? plain : plain.substring(0, 180) + "…";
                }
            }
        } catch (Exception ignored) { }
        return null;
    }

    /** Search only the message column; parsing the full <> delimited line as HTML
     * can make Android's HTML parser treat DAT separators as markup. */
    private static String datBody(String line) {
        int start = 0;
        for (int column = 0; column < 3; column++) {
            int separator = line.indexOf("<>", start);
            if (separator < 0) return line;
            start = separator + 2;
        }
        int end = line.indexOf("<>", start);
        return end < 0 ? line.substring(start) : line.substring(start, end);
    }

    @SuppressWarnings({"rawtypes", "unchecked"})
    private static void apply(Object fragment, Activity activity, Search search, List<Result> matches) {
        synchronized (SEARCHES) {
            if (SEARCHES.get(fragment) != search) return;
        }
        if (activity.isFinishing() || activity.isDestroyed() || matches.isEmpty()) return;
        try {
            Object binding = ResponseArchiveEntry.field(fragment, "c");
            EditText input = (EditText) ResponseArchiveEntry.field(binding, "g");
            if (!search.query.equals(input.getText().toString().trim())) return;
            Object adapter = ResponseArchiveEntry.field(fragment, "b");
            ArrayList rows = (ArrayList) ResponseArchiveEntry.field(adapter, "c");
            Set<String> existing = new HashSet<>();
            for (Object row : rows) {
                Object url = ResponseArchiveEntry.field(row, "b");
                if (url instanceof String) existing.add((String) url);
            }
            Class<?> rowType = Class.forName("o.mg", false, activity.getClassLoader());
            java.lang.reflect.Constructor<?> constructor = rowType.getConstructor(
                    String.class, String.class, CharSequence.class, int.class);
            int added = 0;
            for (Result result : matches) if (existing.add(result.url)) {
                rows.add(constructor.newInstance(result.title, result.url, result.snippet, 0));
                added++;
            }
            if (added > 0) {
                java.lang.reflect.Method notify = adapter.getClass().getMethod("notifyDataSetChanged");
                notify.invoke(adapter);
            }
        } catch (Exception error) {
            android.util.Log.w(LOG, "Unable to append local archive results", error);
        }
    }

    private static File indexDirectory(Context context) { return new File(context.getFilesDir(), "haiagaru-edge-search"); }
    private static File datDirectory(Context context) {
        File external = context.getExternalFilesDir("2chMate/dat");
        return external == null ? new File(context.getFilesDir(), "2chMate/dat") : external;
    }
    private static File indexFile(Context context, String url) throws Exception {
        return new File(indexDirectory(context), ArchiveOriginPaths.hash(url));
    }
    private static void trimIndex(Context context) {
        File[] files = indexDirectory(context).listFiles(file -> file.isFile() && file.getName().endsWith(".json"));
        if (files == null || files.length <= MAX_INDEX_ENTRIES) return;
        java.util.Arrays.sort(files, Comparator.comparingLong(File::lastModified));
        for (int i = 0; i < files.length - MAX_INDEX_ENTRIES; i++) files[i].delete();
    }
}
