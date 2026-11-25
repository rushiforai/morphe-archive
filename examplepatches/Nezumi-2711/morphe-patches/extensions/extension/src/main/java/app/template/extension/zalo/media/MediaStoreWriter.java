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

/** Writes a video straight into the shared gallery under Movies/Zalo. */
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
                } catch (RuntimeException ignored) {
                    // best effort cleanup
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
}
