package io.github.sazap10.extension.sync;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.provider.MediaStore;
import android.util.Log;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 * Writes uncaught exceptions to a text file the user can open without adb.
 * <p>
 * API 29+: Download/SyncCrashes through MediaStore, which needs no permission for files the app creates.
 * Older: the app's external files directory.
 */
@SuppressWarnings("unused")
public final class CrashLogger {
    private static final String TAG = "SyncCrashLogger";
    private static final String FOLDER = "SyncCrashes";

    private static volatile boolean installed;

    private CrashLogger() {
    }

    public static void install(Context context) {
        if (installed) return;
        installed = true;

        final Context appContext = context.getApplicationContext() != null ? context.getApplicationContext() : context;
        final Thread.UncaughtExceptionHandler previous = Thread.getDefaultUncaughtExceptionHandler();

        Thread.setDefaultUncaughtExceptionHandler((thread, throwable) -> {
            try {
                write(appContext, thread, throwable);
            } catch (Throwable error) {
                try {
                    Log.e(TAG, "Could not write crash log", error);
                } catch (Throwable ignored) {
                    // Nothing else to try. The previous handler still runs below.
                }
            }

            if (previous != null) {
                previous.uncaughtException(thread, throwable);
            } else {
                android.os.Process.killProcess(android.os.Process.myPid());
                System.exit(10);
            }
        });
    }

    private static void write(Context context, Thread thread, Throwable throwable) throws Exception {
        Date now = new Date();
        String fileName = "sync-crash-" + new SimpleDateFormat("yyyyMMdd-HHmmss", Locale.US).format(now) + ".txt";
        byte[] report = report(context, thread, throwable, now).getBytes(StandardCharsets.UTF_8);

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            ContentResolver resolver = context.getContentResolver();
            ContentValues values = new ContentValues();
            values.put(MediaStore.MediaColumns.DISPLAY_NAME, fileName);
            values.put(MediaStore.MediaColumns.MIME_TYPE, "text/plain");
            values.put(MediaStore.MediaColumns.RELATIVE_PATH, Environment.DIRECTORY_DOWNLOADS + "/" + FOLDER);
            Uri uri = resolver.insert(MediaStore.Downloads.EXTERNAL_CONTENT_URI, values);
            if (uri == null) throw new IllegalStateException("MediaStore insert returned null");
            try (OutputStream out = resolver.openOutputStream(uri)) {
                if (out == null) throw new IllegalStateException("No output stream for " + uri);
                out.write(report);
            }
            Log.e(TAG, "Crash log written to Download/" + FOLDER + "/" + fileName);
        } else {
            File base = context.getExternalFilesDir(null);
            if (base == null) base = context.getFilesDir();
            File dir = new File(base, FOLDER);
            //noinspection ResultOfMethodCallIgnored
            dir.mkdirs();
            File file = new File(dir, fileName);
            try (OutputStream out = new FileOutputStream(file)) {
                out.write(report);
            }
            Log.e(TAG, "Crash log written to " + file);
        }
    }

    private static String report(Context context, Thread thread, Throwable throwable, Date now) {
        StringBuilder text = new StringBuilder();
        text.append("Time: ").append(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss Z", Locale.US).format(now)).append('\n');
        text.append("Thread: ").append(thread != null ? thread.getName() : "unknown").append('\n');
        text.append("Package: ").append(context.getPackageName()).append('\n');
        try {
            PackageInfo info = context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
            long versionCode = Build.VERSION.SDK_INT >= Build.VERSION_CODES.P
                    ? info.getLongVersionCode()
                    : info.versionCode;
            text.append("Version: ").append(info.versionName).append(" (").append(versionCode).append(")\n");
        } catch (Throwable error) {
            text.append("Version: unknown (").append(error).append(")\n");
        }
        text.append("Device: ").append(Build.MANUFACTURER).append(' ').append(Build.MODEL).append('\n');
        text.append("Android SDK: ").append(Build.VERSION.SDK_INT).append('\n');
        text.append("Target SDK: ").append(context.getApplicationInfo().targetSdkVersion).append("\n\n");
        // Log.getStackTraceString() returns "" when any cause is an UnknownHostException, so print it directly.
        StringWriter trace = new StringWriter();
        PrintWriter writer = new PrintWriter(trace);
        throwable.printStackTrace(writer);
        writer.flush();
        text.append(trace).append('\n');
        return text.toString();
    }
}
