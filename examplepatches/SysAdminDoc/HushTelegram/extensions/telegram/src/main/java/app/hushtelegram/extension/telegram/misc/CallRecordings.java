/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.Manifest;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.pm.PackageManager;
import android.media.MediaScannerConnection;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.provider.MediaStore;

import androidx.annotation.RequiresApi;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 * Where a call recording is written while the call runs, what it's called, and how it's put in the
 * phone's shared storage once the call ends: Recordings/Telegram calls from Android 12, which is
 * the first with a Recordings folder, and Music/Telegram calls before that.
 */
final class CallRecordings {
    private CallRecordings() {}

    static final String FOLDER = "Telegram calls";
    static final String MIME = "audio/mp4";
    /** Telegram's cache folder for the recording in progress. Only one call records at a time. */
    static final String SCRATCH = "hush-call-recordings";

    /** The folder as a file manager shows it, from the top of the phone's storage. */
    static String folder() {
        return top() + "/" + FOLDER;
    }

    private static String top() {
        return Build.VERSION.SDK_INT >= Build.VERSION_CODES.S
                ? Environment.DIRECTORY_RECORDINGS : Environment.DIRECTORY_MUSIC;
    }

    /** "Telegram call 2026-10-30 21-15.m4a", from when the call's audio began, in the phone's time zone. */
    static String name(long began) {
        return "Telegram call " + new SimpleDateFormat("yyyy-MM-dd HH-mm", Locale.US).format(new Date(began)) + ".m4a";
    }

    /**
     * The file for a recording that's starting. What an earlier start left there (Telegram closed
     * mid-call, so it was never finished) is deleted first, since it can't be played.
     */
    static File scratch(Context context, long began) throws IOException {
        File folder = new File(context.getCacheDir(), SCRATCH);
        if (!folder.mkdirs() && !folder.isDirectory()) throw new IOException("No folder for the call recording");
        File[] left = folder.listFiles();
        if (left != null) {
            for (File old : left) {
                if (!old.delete() && old.exists()) throw new IOException("An old call recording is in the way");
            }
        }
        return new File(folder, "call-" + began + ".m4a");
    }

    /** Puts the finished file in shared storage under [name] and answers the folder it went to. */
    static String save(Context context, File file, String name) throws IOException {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            insert(context, file, name);
        } else {
            legacy(context, file, name);
        }
        return folder();
    }

    /** Into MediaStore's audio, hidden until it's whole, the way Save to Downloads copies. */
    @RequiresApi(Build.VERSION_CODES.Q)
    private static void insert(Context context, File file, String name) throws IOException {
        ContentResolver resolver = context.getContentResolver();
        ContentValues values = new ContentValues();
        values.put(MediaStore.MediaColumns.DISPLAY_NAME, name);
        values.put(MediaStore.MediaColumns.RELATIVE_PATH, folder() + "/");
        values.put(MediaStore.MediaColumns.MIME_TYPE, MIME);
        values.put(MediaStore.MediaColumns.IS_PENDING, 1);
        Uri pending = resolver.insert(MediaStore.Audio.Media.EXTERNAL_CONTENT_URI, values);
        if (pending == null) throw new IOException("MediaStore didn't take the recording");
        try {
            try (InputStream in = new FileInputStream(file); OutputStream out = resolver.openOutputStream(pending, "w")) {
                if (out == null) throw new IOException("MediaStore gave no stream");
                copy(in, out);
            }
            values.clear();
            values.put(MediaStore.MediaColumns.IS_PENDING, 0);
            if (resolver.update(pending, values, null, null) != 1) throw new IOException("MediaStore didn't publish the recording");
        } catch (IOException | RuntimeException failure) {
            try {
                resolver.delete(pending, null, null);
            } catch (RuntimeException cleanup) {
                failure.addSuppressed(cleanup);
            }
            throw failure;
        }
    }

    /**
     * Android 9 has no MediaStore folders, so the file goes straight into Music/Telegram calls,
     * which needs the storage permission Telegram asks for when it first saves to the gallery,
     * and the media scanner is told about it.
     */
    @SuppressWarnings("deprecation")
    private static void legacy(Context context, File file, String name) throws IOException {
        if (context.checkSelfPermission(Manifest.permission.WRITE_EXTERNAL_STORAGE) != PackageManager.PERMISSION_GRANTED) {
            throw new IOException("Telegram can't write to the phone's storage");
        }
        File folder = new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_MUSIC), FOLDER);
        if (!folder.mkdirs() && !folder.isDirectory()) throw new IOException("No " + folder());
        File target = free(folder, name);
        try (InputStream in = new FileInputStream(file); OutputStream out = new FileOutputStream(target)) {
            copy(in, out);
        } catch (IOException | RuntimeException failure) {
            if (!target.delete() && target.exists()) failure.addSuppressed(new IOException("Left a partial " + target.getName()));
            throw failure;
        }
        MediaScannerConnection.scanFile(context, new String[]{target.getPath()}, new String[]{MIME}, null);
    }

    /** [name] in [folder], or "name (2).m4a" and up when that's taken, as MediaStore numbers them. */
    static File free(File folder, String name) {
        File target = new File(folder, name);
        int dot = name.lastIndexOf('.');
        String stem = dot > 0 ? name.substring(0, dot) : name;
        String extension = dot > 0 ? name.substring(dot) : "";
        for (int number = 2; target.exists(); number++) {
            target = new File(folder, stem + " (" + number + ")" + extension);
        }
        return target;
    }

    private static void copy(InputStream in, OutputStream out) throws IOException {
        byte[] buffer = new byte[64 * 1024];
        for (int read; (read = in.read(buffer)) != -1; ) out.write(buffer, 0, read);
    }
}
