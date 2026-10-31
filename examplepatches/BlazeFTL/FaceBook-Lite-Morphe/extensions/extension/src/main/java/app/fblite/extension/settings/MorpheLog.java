package app.fblite.extension.settings;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.os.SystemClock;
import android.provider.MediaStore;
import android.util.Base64;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 * Debug log shared by the patches. Off by default; switched on in the Morphe settings screen.
 * Lines go to Android/data/com.facebook.lite/files/morphe-debug.log (the hide-ads extension writes
 * to the same file), and the settings screen can copy the file to Downloads.
 *
 * The log holds on-screen text of feed items and video file addresses without their signatures. Look
 * through it before sharing it.
 */
public final class MorpheLog {
    public static final String FILE_NAME = "morphe-debug.log";
    private static final String OLD_FILE_NAME = "morphe-debug.1.log";
    private static final String KEY = "debug_log";
    private static final long MAX_BYTES = 4L * 1024 * 1024;
    private static final long CHECK_MS = 1500;
    private static final SimpleDateFormat TIME = new SimpleDateFormat("HH:mm:ss.SSS", Locale.US);

    private static Context context;
    private static boolean enabled;
    private static long checked = -CHECK_MS;
    private static boolean headerWritten;
    private static File file;

    private MorpheLog() {
    }

    /** Remembers a context to read the setting and find the log folder with. Safe to call often. */
    public static synchronized void init(Context c) {
        if (context == null && c != null) context = c;
    }

    public static synchronized boolean enabled() {
        Context c = context;
        if (c == null) return false;
        long now = SystemClock.uptimeMillis();
        if (now - checked >= CHECK_MS) {
            checked = now;
            try {
                enabled = c.getSharedPreferences("morphe_fblite_settings", Context.MODE_PRIVATE).getBoolean(KEY, false);
            } catch (Throwable t) {
                enabled = false;
            }
        }
        return enabled;
    }

    public static void log(String tag, String message) {
        write(tag, message, null);
    }

    public static void log(String tag, String message, Throwable t) {
        write(tag, message, t);
    }

    private static synchronized void write(String tag, String message, Throwable t) {
        if (!enabled()) return;
        try {
            File target = file(context);
            if (target.length() > MAX_BYTES) {
                File old = new File(target.getParentFile(), OLD_FILE_NAME);
                old.delete();
                target.renameTo(old);
            }
            StringBuilder line = new StringBuilder();
            if (!headerWritten) {
                headerWritten = true;
                line.append(TIME.format(new Date())).append(" == ").append(header()).append('\n');
            }
            line.append(TIME.format(new Date())).append(' ').append(tag).append(' ').append(message);
            if (t != null) line.append(" :: ").append(android.util.Log.getStackTraceString(t));
            line.append('\n');
            try (FileOutputStream out = new FileOutputStream(target, true)) {
                out.write(line.toString().getBytes(StandardCharsets.UTF_8));
            }
        } catch (Throwable ignored) {
            // Logging never breaks the app.
        }
    }

    private static String header() {
        String version = "?";
        try {
            PackageInfo info = context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
            version = info.versionName;
        } catch (Throwable ignored) {
        }
        return "session " + new SimpleDateFormat("yyyy-MM-dd", Locale.US).format(new Date())
                + " | Facebook Lite " + version
                + " | " + Build.MANUFACTURER + " " + Build.MODEL
                + " | Android " + Build.VERSION.RELEASE + " (API " + Build.VERSION.SDK_INT + ")"
                + " | " + Locale.getDefault();
    }

    public static synchronized File file(Context c) {
        if (file != null) return file;
        File dir = null;
        try {
            dir = c.getExternalFilesDir(null);
        } catch (Throwable ignored) {
        }
        if (dir == null) dir = c.getFilesDir();
        file = new File(dir, FILE_NAME);
        return file;
    }

    public static synchronized void clear(Context c) {
        File current = file(c);
        current.delete();
        new File(current.getParentFile(), OLD_FILE_NAME).delete();
        headerWritten = false;
    }

    /** Copies the log into Download/. Returns the visible path, or null when there is no log. */
    public static String saveToDownloads(Context c) throws IOException {
        File current = file(c);
        File old = new File(current.getParentFile(), OLD_FILE_NAME);
        if (!current.isFile() || current.length() == 0) return null;
        String name = "fblite-morphe-log-" + new SimpleDateFormat("yyyyMMdd-HHmmss", Locale.US).format(new Date()) + ".txt";
        if (Build.VERSION.SDK_INT >= 29) {
            ContentResolver resolver = c.getContentResolver();
            ContentValues values = new ContentValues();
            values.put(MediaStore.MediaColumns.DISPLAY_NAME, name);
            values.put(MediaStore.MediaColumns.MIME_TYPE, "text/plain");
            values.put(MediaStore.MediaColumns.RELATIVE_PATH, Environment.DIRECTORY_DOWNLOADS);
            values.put(MediaStore.MediaColumns.IS_PENDING, 1);
            Uri uri = resolver.insert(MediaStore.Downloads.EXTERNAL_CONTENT_URI, values);
            if (uri == null) throw new IOException("MediaStore refused the file");
            try (OutputStream out = resolver.openOutputStream(uri)) {
                if (out == null) throw new IOException("No output stream");
                if (old.isFile()) copy(old, out);
                copy(current, out);
            } catch (IOException | RuntimeException e) {
                resolver.delete(uri, null, null);
                throw e;
            }
            values.clear();
            values.put(MediaStore.MediaColumns.IS_PENDING, 0);
            resolver.update(uri, values, null, null);
        } else {
            File dir = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS);
            if (!dir.isDirectory() && !dir.mkdirs()) throw new IOException("Cannot create " + dir);
            try (OutputStream out = new FileOutputStream(new File(dir, name))) {
                if (old.isFile()) copy(old, out);
                copy(current, out);
            }
        }
        return Environment.DIRECTORY_DOWNLOADS + "/" + name;
    }

    private static void copy(File from, OutputStream to) throws IOException {
        try (InputStream in = new FileInputStream(from)) {
            byte[] buffer = new byte[64 * 1024];
            int n;
            while ((n = in.read(buffer)) > 0) to.write(buffer, 0, n);
        }
    }

    /** A video address without its signature: host, file name, bitrate and the encode tag Facebook puts in efg. */
    public static String url(String url) {
        if (url == null) return "null";
        try {
            Uri uri = Uri.parse(url);
            StringBuilder sb = new StringBuilder();
            String path = uri.getPath() == null ? "" : uri.getPath();
            if (path.length() > 56) path = "…" + path.substring(path.length() - 56);
            sb.append(uri.getHost()).append(path);
            String bitrate = uri.getQueryParameter("bitrate");
            if (bitrate != null) sb.append(" bitrate=").append(bitrate);
            String tag = encodeTag(url);
            if (tag != null) sb.append(" tag=").append(tag);
            sb.append(" len=").append(url.length());
            return sb.toString();
        } catch (Throwable t) {
            return "len=" + url.length();
        }
    }

    /** The vencode_tag inside the efg parameter of a Facebook video address (progressive_h264-basic-gen2_720p...), or null. */
    public static String encodeTag(String url) {
        try {
            String efg = Uri.parse(url).getQueryParameter("efg");
            if (efg == null) return null;
            String json;
            try {
                json = new String(Base64.decode(efg, Base64.URL_SAFE | Base64.NO_WRAP), StandardCharsets.UTF_8);
            } catch (IllegalArgumentException e) {
                json = new String(Base64.decode(efg, Base64.DEFAULT), StandardCharsets.UTF_8);
            }
            String key = "\"vencode_tag\":\"";
            int start = json.indexOf(key);
            if (start < 0) return null;
            start += key.length();
            int end = json.indexOf('"', start);
            return end < 0 ? null : json.substring(start, end);
        } catch (Throwable t) {
            return null;
        }
    }
}
