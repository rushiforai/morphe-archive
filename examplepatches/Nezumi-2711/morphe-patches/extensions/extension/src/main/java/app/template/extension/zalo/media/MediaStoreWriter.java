package app.template.extension.zalo.media;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.media.MediaScannerConnection;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.provider.MediaStore;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import app.template.extension.zalo.buglog.NezumiLog;
import app.template.extension.zalo.buglog.Patch;

/** Writes a video (Movies/Zalo) or a photo (Pictures/Zalo) straight into the shared gallery. */
final class MediaStoreWriter {
    private MediaStoreWriter() { }

    static final String FOLDER = "Zalo";

    interface Source {
        void writeTo(OutputStream out) throws IOException;
    }

    static void saveVideo(Context context, String displayName, Source source) throws IOException {
        if (Build.VERSION.SDK_INT >= 29) {
            ContentResolver resolver = context.getContentResolver();
            ContentValues values = new ContentValues();
            values.put(MediaStore.Video.Media.DISPLAY_NAME, displayName);
            values.put(MediaStore.Video.Media.MIME_TYPE, "video/mp4");
            values.put(MediaStore.Video.Media.RELATIVE_PATH, Environment.DIRECTORY_MOVIES + "/" + FOLDER);
            values.put(MediaStore.Video.Media.IS_PENDING, 1);
            Uri uri = resolver.insert(MediaStore.Video.Media.EXTERNAL_CONTENT_URI, values);
            if (uri == null) throw new IOException("insert failed");
            try {
                try (OutputStream out = resolver.openOutputStream(uri)) {
                    if (out == null) throw new IOException("no output stream");
                    source.writeTo(out);
                }
                ContentValues done = new ContentValues();
                done.put(MediaStore.Video.Media.IS_PENDING, 0);
                resolver.update(uri, done, null, null);
            } catch (IOException | RuntimeException failure) {
                try {
                    resolver.delete(uri, null, null);
                } catch (RuntimeException cleanup) {
                    // Best effort: the original failure is what the caller reports.
                    NezumiLog.swallowed(Patch.SAVE_MEDIA, "MediaStoreWriter", "removing the pending MediaStore entry failed", cleanup);
                }
                throw failure;
            }
        } else {
            File dir = new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_MOVIES), FOLDER);
            if (!dir.isDirectory() && !dir.mkdirs()) throw new IOException("mkdirs " + dir);
            File file = new File(dir, displayName);
            try (OutputStream out = new FileOutputStream(file)) {
                source.writeTo(out);
            } catch (IOException | RuntimeException failure) {
                //noinspection ResultOfMethodCallIgnored
                file.delete();
                throw failure;
            }
            MediaScannerConnection.scanFile(context, new String[] { file.getAbsolutePath() },
                new String[] { "video/mp4" }, null);
        }
    }
    /**
     * Photo into Pictures/Zalo. {@code displayName} already carries the sniffed extension and {@code mime} the
     * matching type. The pending MediaStore entry (or the legacy file) is removed again when writing fails.
     */
    static void saveImage(Context context, String displayName, String mime, Source source) throws IOException {
        if (Build.VERSION.SDK_INT >= 29) {
            ContentResolver resolver = context.getContentResolver();
            ContentValues values = new ContentValues();
            values.put(MediaStore.Images.Media.DISPLAY_NAME, displayName);
            values.put(MediaStore.Images.Media.MIME_TYPE, mime);
            values.put(MediaStore.Images.Media.RELATIVE_PATH, Environment.DIRECTORY_PICTURES + "/" + FOLDER);
            values.put(MediaStore.Images.Media.IS_PENDING, 1);
            Uri uri = resolver.insert(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, values);
            if (uri == null) throw new IOException("insert failed");
            try {
                try (OutputStream out = resolver.openOutputStream(uri)) {
                    if (out == null) throw new IOException("no output stream");
                    source.writeTo(out);
                }
                ContentValues done = new ContentValues();
                done.put(MediaStore.Images.Media.IS_PENDING, 0);
                resolver.update(uri, done, null, null);
            } catch (IOException | RuntimeException failure) {
                try {
                    resolver.delete(uri, null, null);
                } catch (RuntimeException cleanup) {
                    // Best effort: the original failure is what the caller reports.
                    NezumiLog.swallowed(Patch.SAVE_MEDIA, "MediaStoreWriter", "removing the pending MediaStore entry failed", cleanup);
                }
                throw failure;
            }
        } else {
            File dir = new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES), FOLDER);
            if (!dir.isDirectory() && !dir.mkdirs()) throw new IOException("mkdirs " + dir);
            File file = new File(dir, displayName);
            int dot = displayName.lastIndexOf('.');
            for (int n = 1; file.exists() && n < 100; n++) {
                file = new File(dir, dot < 0 ? displayName + "(" + n + ")"
                    : displayName.substring(0, dot) + "(" + n + ")" + displayName.substring(dot));
            }
            try (OutputStream out = new FileOutputStream(file)) {
                source.writeTo(out);
            } catch (IOException | RuntimeException failure) {
                //noinspection ResultOfMethodCallIgnored
                file.delete();
                throw failure;
            }
            MediaScannerConnection.scanFile(context, new String[] { file.getAbsolutePath() }, new String[] { mime }, null);
        }
    }
}
