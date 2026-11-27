package app.template.extension.zalo.buglog;

import android.Manifest;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.provider.MediaStore;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Locale;

/**
 * Exports the bug log: every process's files are joined into one {@code nezumi-log-<time>.txt}
 * saved to {@code Download/Nezumi/}, where the user can pick it up and send it themselves.
 * Nothing leaves the device. The file opens with a {@link ExportSummary} (per-patch errors and
 * hooks, crashes, the latest session header) so the developer sees the patch at fault first.
 */
public final class BugLogExport {
    private BugLogExport() { }

    private static final String TAG = "BugLogExport";
    private static final String FOLDER = "Nezumi";

    public interface Callback {
        /** Runs on the main thread with the saved file's path for the user, or null when export failed. */
        void done(String savedPath);
    }

    /** Total size of the bug-log files on disk, in bytes. */
    public static long totalBytes(Context context) {
        long total = 0;
        for (File file : logFiles(context)) total += file.length();
        return total;
    }

    public static void clear(Context context) {
        NezumiLog.clearBuffered();
        LogStore store = NezumiLog.store();
        if (store != null) {
            store.clearAll();
        } else {
            for (File file : logFiles(context)) {
                //noinspection ResultOfMethodCallIgnored
                file.delete();
            }
        }
        NezumiLog.i(Patch.CORE, TAG, "log cleared");
    }

    public static void export(Context context, Callback callback) {
        Handler main = new Handler(Looper.getMainLooper());
        Thread thread = new Thread(() -> {
            String path = null;
            try {
                // The in-memory lines (detailed logging off) belong in the export too.
                NezumiLog.flushBuffered();
                String stamp = new SimpleDateFormat("yyyyMMdd-HHmmss", Locale.US).format(new Date());
                path = save(context, "nezumi-log-" + stamp + ".txt");
            } catch (IOException | RuntimeException failure) {
                NezumiLog.e(Patch.CORE, TAG, "export failed", failure);
            }
            String saved = path;
            main.post(() -> callback.done(saved));
        }, "NezumiBugLogExport");
        thread.setDaemon(true);
        thread.start();
    }

    /** Writes the combined log and returns where it landed, as the user would find it in a file manager. */
    private static String save(Context context, String name) throws IOException {
        if (Build.VERSION.SDK_INT >= 29) {
            ContentResolver resolver = context.getContentResolver();
            ContentValues values = new ContentValues();
            values.put(MediaStore.Downloads.DISPLAY_NAME, name);
            values.put(MediaStore.Downloads.MIME_TYPE, "text/plain");
            values.put(MediaStore.Downloads.RELATIVE_PATH, Environment.DIRECTORY_DOWNLOADS + "/" + FOLDER);
            values.put(MediaStore.Downloads.IS_PENDING, 1);
            Uri uri = resolver.insert(MediaStore.Downloads.EXTERNAL_CONTENT_URI, values);
            if (uri == null) throw new IOException("MediaStore insert failed");
            try (OutputStream out = resolver.openOutputStream(uri)) {
                if (out == null) throw new IOException("no output stream");
                writeCombined(context, out);
            } catch (IOException | RuntimeException failure) {
                resolver.delete(uri, null, null);
                throw failure;
            }
            ContentValues done = new ContentValues();
            done.put(MediaStore.Downloads.IS_PENDING, 0);
            resolver.update(uri, done, null, null);
            return Environment.DIRECTORY_DOWNLOADS + "/" + FOLDER + "/" + name;
        }
        // Android 9 and older: public Downloads needs the storage permission; otherwise fall back to
        // the app's external files folder, which needs none and is still visible in a file manager.
        File dir;
        if (context.checkSelfPermission(Manifest.permission.WRITE_EXTERNAL_STORAGE) == PackageManager.PERMISSION_GRANTED) {
            dir = new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS), FOLDER);
        } else {
            File external = context.getExternalFilesDir(null);
            if (external == null) throw new IOException("external storage unavailable");
            dir = new File(external, FOLDER);
        }
        if (!dir.isDirectory() && !dir.mkdirs()) throw new IOException("mkdirs " + dir);
        File target = new File(dir, name);
        try (OutputStream out = new FileOutputStream(target)) {
            writeCombined(context, out);
        } catch (IOException | RuntimeException failure) {
            //noinspection ResultOfMethodCallIgnored
            target.delete();
            throw failure;
        }
        return target.getAbsolutePath();
    }

    private static void writeCombined(Context context, OutputStream stream) throws IOException {
        String intro = "Nezumi bug log export " + new Date() + "\n\n";
        stream.write(intro.getBytes(StandardCharsets.UTF_8));
        List<File> files = logFiles(context);
        List<ExportSummary.LogFile> contents = new ArrayList<>(files.size());
        for (File file : files) contents.add(new ExportSummary.LogFile(file.getName(), read(file)));
        String summary;
        try {
            summary = ExportSummary.build(contents);
        } catch (RuntimeException failure) {
            // A summary bug must not cost the user the export itself.
            summary = "(summary unavailable: " + failure + ")\n";
        }
        stream.write((summary + "\n").getBytes(StandardCharsets.UTF_8));
        if (files.isEmpty()) stream.write("(no log entries yet)\n".getBytes(StandardCharsets.UTF_8));
        for (ExportSummary.LogFile file : contents) {
            stream.write(("----- " + file.name + " -----\n").getBytes(StandardCharsets.UTF_8));
            stream.write(file.text.getBytes(StandardCharsets.UTF_8));
            stream.write('\n');
        }
    }

    private static String read(File file) throws IOException {
        java.io.ByteArrayOutputStream bytes = new java.io.ByteArrayOutputStream((int) Math.min(file.length(), LogStore.MAX_FILE_BYTES * 2));
        copy(file, bytes);
        return new String(bytes.toByteArray(), StandardCharsets.UTF_8);
    }

    /** Main process first; for each process the rotated (older) file before the current one. */
    private static List<File> logFiles(Context context) {
        File dir = new File(context.getFilesDir(), LogStore.DIR);
        File[] files = dir.listFiles((parent, child) -> child.endsWith(".log"));
        List<File> result = new ArrayList<>();
        if (files == null) return result;
        Arrays.sort(files, (left, right) -> sortKey(left.getName()).compareTo(sortKey(right.getName())));
        result.addAll(Arrays.asList(files));
        return result;
    }

    private static String sortKey(String name) {
        boolean rotated = name.endsWith(".1.log");
        String base = name.substring(0, name.length() - (rotated ? ".1.log".length() : ".log".length()));
        return (base.equals("nezumi") ? "0" : "1" + base) + (rotated ? "0" : "1");
    }

    private static void copy(File file, OutputStream out) throws IOException {
        try (InputStream in = new FileInputStream(file)) {
            byte[] buffer = new byte[16 * 1024];
            int read;
            while ((read = in.read(buffer)) != -1) out.write(buffer, 0, read);
        }
    }
}
