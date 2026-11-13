package app.flip.voicelog;

import android.content.ContentProvider;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.os.Process;
import android.provider.MediaStore;
import android.util.Log;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 * Records this app's own logcat (all of its processes) into Downloads/voice-logcat-<time>.txt,
 * so a log can be collected from the phone without a computer.
 * Started by a content provider, which Android creates before Application.onCreate.
 */
public class VoiceLog extends ContentProvider {
    private static final String TAG = "FlipVoiceLog";
    private static final long MAX_BYTES = 8L * 1024 * 1024;
    private static boolean started;

    @Override
    public boolean onCreate() {
        start(getContext());
        return true;
    }

    static synchronized void start(Context context) {
        if (started || context == null) return;
        started = true;
        final Context app = context.getApplicationContext() != null ? context.getApplicationContext() : context;
        Thread thread = new Thread(() -> run(app), "FlipVoiceLog");
        thread.setDaemon(true);
        thread.start();
    }

    private static void run(Context context) {
        String name = "voice-logcat-" + new SimpleDateFormat("yyyyMMdd-HHmmss", Locale.US).format(new Date()) + ".txt";
        OutputStream out = null;
        try {
            out = open(context, name);
            if (out == null) return;
            String header = "Voice logcat, pid " + Process.myPid() + ", " + Build.MANUFACTURER + " " + Build.MODEL
                    + ", Android " + Build.VERSION.RELEASE + " (SDK " + Build.VERSION.SDK_INT + ")\n";
            out.write(header.getBytes(StandardCharsets.UTF_8));
            out.flush();

            // Own-UID logs only (no READ_LOGS needed); includes the last part of the buffer.
            java.lang.Process logcat = Runtime.getRuntime().exec(new String[]{"logcat", "-v", "threadtime", "-T", "2000"});
            BufferedReader reader = new BufferedReader(new InputStreamReader(logcat.getInputStream(), StandardCharsets.UTF_8));
            long written = header.length();
            long lastFlush = System.currentTimeMillis();
            String line;
            while ((line = reader.readLine()) != null) {
                byte[] bytes = (line + "\n").getBytes(StandardCharsets.UTF_8);
                out.write(bytes);
                written += bytes.length;
                long now = System.currentTimeMillis();
                if (now - lastFlush > 1000) {
                    out.flush();
                    lastFlush = now;
                }
                if (written > MAX_BYTES) {
                    out.write("\n--- log size limit reached, stopped ---\n".getBytes(StandardCharsets.UTF_8));
                    break;
                }
            }
            logcat.destroy();
        } catch (Throwable t) {
            Log.e(TAG, "Log capture failed", t);
        } finally {
            try {
                if (out != null) out.close();
            } catch (Throwable ignored) {
            }
        }
    }

    private static OutputStream open(Context context, String name) throws Exception {
        if (Build.VERSION.SDK_INT < 29) {
            File dir = context.getExternalFilesDir(null);
            return dir == null ? null : new FileOutputStream(new File(dir, name));
        }
        ContentResolver resolver = context.getContentResolver();
        ContentValues values = new ContentValues();
        values.put(MediaStore.MediaColumns.DISPLAY_NAME, name);
        values.put(MediaStore.MediaColumns.MIME_TYPE, "text/plain");
        values.put(MediaStore.MediaColumns.RELATIVE_PATH, Environment.DIRECTORY_DOWNLOADS);
        Uri uri = resolver.insert(MediaStore.Downloads.EXTERNAL_CONTENT_URI, values);
        return uri == null ? null : resolver.openOutputStream(uri, "w");
    }

    /** Called at the start of FirebaseMessagingService's intent handler: logs every push that arrives. */
    public static void onPush(Intent intent) {
        try {
            StringBuilder sb = new StringBuilder("PUSH action=").append(intent == null ? null : intent.getAction());
            Bundle extras = intent == null ? null : intent.getExtras();
            if (extras != null) {
                for (String key : extras.keySet()) {
                    Object value = extras.get(key);
                    String text = String.valueOf(value);
                    if (text.length() > 400) text = text.substring(0, 400) + "...";
                    sb.append("\n  ").append(key).append(" = ").append(text);
                }
            }
            Log.w(TAG, sb.toString());
        } catch (Throwable t) {
            Log.e(TAG, "onPush logging failed", t);
        }
    }

    @Override
    public Cursor query(Uri uri, String[] p, String s, String[] a, String o) {
        return null;
    }

    @Override
    public String getType(Uri uri) {
        return null;
    }

    @Override
    public Uri insert(Uri uri, ContentValues values) {
        return null;
    }

    @Override
    public int delete(Uri uri, String s, String[] a) {
        return 0;
    }

    @Override
    public int update(Uri uri, ContentValues values, String s, String[] a) {
        return 0;
    }
}
