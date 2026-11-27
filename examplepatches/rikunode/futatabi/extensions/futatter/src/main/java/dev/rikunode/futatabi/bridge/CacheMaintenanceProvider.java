package dev.rikunode.futatabi.bridge;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.net.Uri;
import android.os.Build;
import android.util.Log;
import android.util.Xml;

import org.xmlpull.v1.XmlPullParser;

import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.Path;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Installed only by the independently selectable, hash-guarded cache patch.
 * Runs synchronously before other providers and before Flutter's first activity.
 * There is deliberately no in-session deletion worker. */
public final class CacheMaintenanceProvider extends ContentProvider {
    private static final String TAG = "FutatabiCache";
    private static volatile String lastReport;
    private static final String CUSTOM = "MyJsonCacheManager", DEFAULT = "libCachedImageData";
    private static final long JSON_LIMIT = 8L * 1024 * 1024;
    private static final long PREF_LIMIT = 32L * 1024 * 1024;

    static String lastReport() { return lastReport; }

    @Override public boolean onCreate() {
        Context context = getContext();
        if (context == null) return true;
        try {
            if (Build.VERSION.SDK_INT < 26) publish("Android 8.0+ required; no files deleted.");
            else Api26.run(context);
        } catch (Exception ex) {
            publish("Cache maintenance skipped: " + ex.getClass().getSimpleName());
        }
        return true;
    }

    private static void publish(String report) {
        lastReport = report;
        Log.i(TAG, report);
    }

    // Isolate java.nio.file references from the Android 23–25 provider loader.
    @android.annotation.TargetApi(26)
    private static final class Api26 {
    private static void run(Context context) throws Exception {
        final long started = System.nanoTime(), now = System.currentTimeMillis();
        // Cooperative deadlines: do not hold app startup indefinitely on a large
        // cache. Slow individual filesystem calls cannot be preempted here.
        final long scanDeadline = started + 1_200_000_000L;
        final long endDeadline = started + 2_000_000_000L;
        Path root = context.getCacheDir().toPath().toRealPath();
        Path files = context.getFilesDir().toPath().toRealPath();
        Path prefs = root.getParent().resolve("shared_prefs");
        // Flutter saves KakikomiData.upFile in these preferences. Never log its
        // values: retain only recognized cache basenames in transient memory.
        Set<String> pins = null;
        try { pins = protectedNames(prefs, scanDeadline); }
        catch (Exception ignored) { /* fail closed, still diagnose */ }
        Map<String, CacheSweep.Row> json = null, sqlite = null;
        try {
            if (System.nanoTime() < scanDeadline)
                json = readJson(files.resolve(CUSTOM + ".json"));
        } catch (Exception ignored) { /* unknown ledger */ }
        try {
            if (System.nanoTime() < scanDeadline)
                sqlite = readSqlite(files.resolve(DEFAULT + ".db"),
                        context.getDatabasePath(DEFAULT + ".db").toPath(), scanDeadline);
        } catch (Exception ignored) { /* unknown ledger */ }
        CacheSweep.Snapshot custom = CacheSweep.inspect(root, CUSTOM, json, pins, now, scanDeadline);
        CacheSweep.Snapshot standard = CacheSweep.inspect(root, DEFAULT, sqlite, pins, now, scanDeadline);
        List<CacheSweep.Snapshot> snapshots = Arrays.asList(custom, standard);
        // Snapshot first, then act only on known, safe candidates. Missing/corrupt
        // metadata and interrupted diagnostics do not authorize registered eviction.
        if (pins != null) CacheSweep.apply(snapshots, CacheSweep.BUDGET, endDeadline);
        long before = custom.bytes + standard.bytes, removed = custom.removed + standard.removed;
        publish("Cold-start cache snapshot (bytes; no URL/file names)\n" +
                custom.report() + "\n" + standard.report() + "\n" +
                "observedBefore=" + before + " observedAfter=" + (before - removed) +
                " budget=" + CacheSweep.BUDGET + " draftCheck=" + (pins != null) +
                " elapsedMs=" + ((System.nanoTime() - started) / 1_000_000L) +
                "\nUnmanaged: file_picker, WebView, other cache dirs, settings and saved files are not deleted.");
    }

    @android.annotation.TargetApi(26)
    private static Map<String, CacheSweep.Row> readJson(Path path) throws Exception {
        BasicFileAttributes a = regular(path, JSON_LIMIT);
        byte[] bytes = Files.readAllBytes(path);
        BasicFileAttributes b = regular(path, JSON_LIMIT);
        if (bytes.length != a.size() || !same(a, b)) throw new java.io.IOException("Changed ledger");
        return CacheSweep.jsonRows(new String(bytes, StandardCharsets.UTF_8));
    }

    @android.annotation.TargetApi(26)
    private static BasicFileAttributes regular(Path path, long limit) throws Exception {
        BasicFileAttributes a = Files.readAttributes(path, BasicFileAttributes.class, LinkOption.NOFOLLOW_LINKS);
        if (!a.isRegularFile() || a.size() > limit) throw new java.io.IOException("Unsafe metadata");
        return a;
    }

    @android.annotation.TargetApi(26)
    private static boolean same(BasicFileAttributes a, BasicFileAttributes b) {
        return a.size() == b.size() && a.lastModifiedTime().equals(b.lastModifiedTime()) &&
                java.util.Objects.equals(a.fileKey(), b.fileKey());
    }

    @android.annotation.TargetApi(26)
    private static boolean absent(Path path) {
        return Files.notExists(path, LinkOption.NOFOLLOW_LINKS);
    }

    @android.annotation.TargetApi(26)
    private static Map<String, CacheSweep.Row> readSqlite(Path current, Path legacy, long deadline) throws Exception {
        // Never create, migrate, repair or write the database. An old and a new
        // copy, or a journal/WAL, makes its ownership/state uncertain.
        if (!absent(current) && !current.equals(legacy) && !absent(legacy))
            throw new java.io.IOException("Ambiguous database");
        Path path = absent(current) ? legacy : current;
        BasicFileAttributes a = regular(path, JSON_LIMIT);
        for (String suffix : new String[]{"-wal", "-shm", "-journal"})
            if (!absent(path.resolveSibling(path.getFileName().toString() + suffix)))
                throw new java.io.IOException("Database sidecar");
        // A WAL-mode database may require creating sidecars even for a reader.
        // Do not attempt recovery; leave it alone rather than mutate metadata.
        byte[] header = new byte[20];
        try (InputStream in = Files.newInputStream(path)) {
            int off = 0;
            while (off < header.length) {
                int n = in.read(header, off, header.length - off);
                if (n < 0) throw new java.io.IOException("Short database header");
                off += n;
            }
        }
        if (!"SQLite format 3".equals(new String(header, 0, 15, StandardCharsets.US_ASCII)) ||
                header[15] != 0 || header[18] != 1 || header[19] != 1)
            throw new java.io.IOException("Unsupported database journal mode");
        Map<String, CacheSweep.Row> rows = new HashMap<>();
        try (SQLiteDatabase db = SQLiteDatabase.openDatabase(path.toString(), null,
                SQLiteDatabase.OPEN_READONLY | SQLiteDatabase.NO_LOCALIZED_COLLATORS);
             Cursor c = db.rawQuery("SELECT relativePath, touched, url FROM cacheObject LIMIT " +
                     (CacheSweep.MAX_ENTRIES + 1), null)) {
            while (c.moveToNext()) {
                if (System.nanoTime() >= deadline || rows.size() >= CacheSweep.MAX_ENTRIES ||
                        c.getType(0) != Cursor.FIELD_TYPE_STRING ||
                        c.getType(1) != Cursor.FIELD_TYPE_INTEGER ||
                        c.getType(2) != Cursor.FIELD_TYPE_STRING)
                    throw new java.io.IOException("Unexpected database row");
                CacheSweep.addRow(rows, c.getString(0), c.getLong(1), c.getString(2));
            }
        }
        if (!same(a, regular(path, JSON_LIMIT))) throw new java.io.IOException("Changed database");
        return rows;
    }

    @android.annotation.TargetApi(26)
    private static Set<String> protectedNames(Path directory, long deadline) throws Exception {
        if (!Files.isDirectory(directory, LinkOption.NOFOLLOW_LINKS))
            throw new java.io.IOException("Unknown preference directory");
        Set<String> result = new HashSet<>();
        Pattern name = Pattern.compile(CacheSweep.NAME_REGEX);
        boolean seen = false;
        for (String suffix : new String[]{"", ".bak"}) {
            Path path = directory.resolve("FlutterSharedPreferences.xml" + suffix);
            if (absent(path)) continue;
            seen = true;
            BasicFileAttributes a = regular(path, PREF_LIMIT);
            try (InputStream in = Files.newInputStream(path)) {
                XmlPullParser parser = Xml.newPullParser();
                parser.setFeature(XmlPullParser.FEATURE_PROCESS_DOCDECL, false);
                parser.setInput(in, "UTF-8");
                boolean rootSeen = false, savePath = false;
                for (int event = parser.getEventType(); event != XmlPullParser.END_DOCUMENT; event = parser.next()) {
                    if (System.nanoTime() >= deadline) throw new java.io.IOException("Preference scan deadline");
                    if (event == XmlPullParser.START_TAG) {
                        if (parser.getDepth() == 1) {
                            if (rootSeen || !"map".equals(parser.getName())) throw new java.io.IOException("Unexpected preferences");
                            rootSeen = true;
                        }
                        if (parser.getDepth() == 2) {
                            String key = parser.getAttributeValue(null, "name");
                            savePath = "flutter.savePath".equals(key) || "flutter.savePathList".equals(key);
                        }
                        for (int i = 0; i < parser.getAttributeCount(); i++)
                            collectNames(name, parser.getAttributeValue(i), result);
                    } else if (event == XmlPullParser.TEXT) {
                        String value = parser.getText();
                        if (savePath && value != null && (value.contains(CUSTOM) || value.contains(DEFAULT)))
                            throw new java.io.IOException("Ambiguous user save destination");
                        collectNames(name, value, result);
                    } else if (event == XmlPullParser.END_TAG && parser.getDepth() == 2) {
                        savePath = false;
                    }
                    if (result.size() > CacheSweep.MAX_ENTRIES) throw new java.io.IOException("Too many references");
                }
                if (!rootSeen) throw new java.io.IOException("Missing preference map");
            }
            if (!same(a, regular(path, PREF_LIMIT))) throw new java.io.IOException("Changed preferences");
        }
        if (!seen) throw new java.io.IOException("No preference snapshot");
        return result;
    }

    private static void collectNames(Pattern pattern, String text, Set<String> result) {
        if (text == null) return;
        Matcher matcher = pattern.matcher(text);
        while (matcher.find()) result.add(matcher.group().toLowerCase(java.util.Locale.ROOT));
    }
    }

    @Override public String getType(Uri uri) { return null; }
    @Override public Cursor query(Uri uri, String[] projection, String selection, String[] args, String order) { return null; }
    @Override public Uri insert(Uri uri, ContentValues values) { return null; }
    @Override public int update(Uri uri, ContentValues values, String selection, String[] args) { return 0; }
    @Override public int delete(Uri uri, String selection, String[] args) { return 0; }
}
