package app.template.extension.extension;

import android.content.ContentValues;
import android.content.Context;
import android.os.Build;
import android.os.Environment;
import android.provider.MediaStore;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * Diagnostic crash logger for the Mereframe camera-preview crash.
 *
 * Installs a default uncaught-exception handler that:
 *  - on ANY uncaught Throwable (any thread), writes the full stack trace +
 *    device/app header to a text file in the user's public Downloads folder
 *    (via MediaStore - app-created entries need NO permission on API 29+),
 *  - then forwards to the previous/default handler so crash semantics stay.
 *
 * The resulting "mereframe-crash-*.txt" file is user-visible in Files ->
 * Downloads and can be attached for remote diagnosis without adb/logcat.
 */
public final class MereframeDiagHook {

    private static final AtomicBoolean INSTALLED = new AtomicBoolean(false);
    private static Thread.UncaughtExceptionHandler previous;

    private MereframeDiagHook() {}

    public static synchronized void install(Context context) {
        if (INSTALLED.getAndSet(true)) return;
        previous = Thread.getDefaultUncaughtExceptionHandler();
        Context app = context == null ? null : context.getApplicationContext();
        Thread.UncaughtExceptionHandler hook = (thread, throwable) -> {
            try {
                writeCrash(app, thread, throwable);
            } catch (Throwable ignored) {
                // Never let the diagnostic itself mask the crash.
            }
            Thread.UncaughtExceptionHandler chain = previous;
            if (chain != null) {
                chain.uncaughtException(thread, throwable);
            } else {
                // Reproduce platform default: print then hard-kill.
                throwable.printStackTrace();
                android.os.Process.killProcess(android.os.Process.myPid());
                System.exit(10);
            }
        };
        Thread.setDefaultUncaughtExceptionHandler(hook);
    }

    private static void writeCrash(Context app, Thread thread, Throwable throwable) {
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
        pw.println("=== Mereframe diagnostic crash report ===");
        pw.println("time: " + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS", Locale.US).format(new Date()));
        pw.println("device: " + Build.MANUFACTURER + " " + Build.MODEL + " (" + Build.DEVICE + ")");
        pw.println("android: " + Build.VERSION.RELEASE + " (API " + Build.VERSION.SDK_INT + ")");
        pw.println("thread: " + (thread == null ? "?" : thread.getName()));
        pw.println();
        throwable.printStackTrace(pw);
        // include a couple of suppressed/trace frames context lines already covered.
        pw.flush();

        String stamp = new SimpleDateFormat("yyyyMMdd-HHmmss", Locale.US).format(new Date());
        String name = "mereframe-crash-" + stamp + ".txt";
        byte[] payload = sw.toString().getBytes(java.nio.charset.StandardCharsets.UTF_8);

        // Preferred: MediaStore into public Downloads (no permission needed).
        if (app != null) {
            try {
                ContentValues values = new ContentValues();
                values.put(MediaStore.Downloads.DISPLAY_NAME, name);
                values.put(MediaStore.Downloads.MIME_TYPE, "text/plain");
                values.put(MediaStore.Downloads.RELATIVE_PATH, Environment.DIRECTORY_DOWNLOADS);
                android.net.Uri uri = app.getContentResolver()
                        .insert(MediaStore.Downloads.EXTERNAL_CONTENT_URI, values);
                if (uri != null) {
                    java.io.OutputStream os = app.getContentResolver().openOutputStream(uri);
                    if (os != null) {
                        os.write(payload);
                        os.flush();
                        os.close();
                        return;
                    }
                }
            } catch (Throwable ignored) {
            }
        }

        // Fallback: app-specific external files dir (works without MediaStore).
        try {
            Context ctx = app;
            if (ctx == null) return;
            java.io.File dir = ctx.getExternalFilesDir(null);
            if (dir == null) return;
            dir.mkdirs();
            java.io.File out = new java.io.File(dir, name);
            java.io.FileOutputStream fos = new java.io.FileOutputStream(out);
            fos.write(payload);
            fos.flush();
            fos.close();
        } catch (Throwable ignored) {
        }
    }
}
