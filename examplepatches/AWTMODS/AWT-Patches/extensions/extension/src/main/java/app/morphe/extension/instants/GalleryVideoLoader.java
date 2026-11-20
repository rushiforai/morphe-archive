package app.morphe.extension.instants;

import android.content.Context;
import android.graphics.Bitmap;
import android.media.MediaMetadataRetriever;
import android.net.Uri;
import android.util.Log;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

/**
 * Prepares a video picked from the gallery: checks its length, copies it to the app's cache (the
 * app reads the file by path and may delete it) and extracts a thumbnail.
 */
final class GalleryVideoLoader {
    private static final String TAG = "InstantsGallery";
    // Instants records at most 6 s; a small margin covers recordings that run a few frames over.
    static final long MAX_DURATION_MS = 6500L;
    private static final String CACHE_DIR = "instants_gallery";
    private static final int THUMBNAIL_SIDE = 512;

    static final int OK = 0;
    static final int TOO_LONG = 1;
    static final int FAILED = 2;

    static final class Result {
        int status = FAILED;
        File file;
        Bitmap thumbnail;
        int width;   // as stored in the file (before rotation)
        int height;
    }

    static Result load(Context context, Uri uri) {
        Result result = new Result();
        MediaMetadataRetriever retriever = new MediaMetadataRetriever();
        try {
            retriever.setDataSource(context, uri);
            long duration = parseLong(retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DURATION));
            result.width = (int) parseLong(retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_VIDEO_WIDTH));
            result.height = (int) parseLong(retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_VIDEO_HEIGHT));
            if (duration <= 0 || result.width <= 0 || result.height <= 0) return result;
            if (duration > MAX_DURATION_MS) {
                result.status = TOO_LONG;
                return result;
            }

            Bitmap frame = retriever.getFrameAtTime(0, MediaMetadataRetriever.OPTION_CLOSEST_SYNC);
            if (frame == null) return result;
            result.thumbnail = centerCropSquare(frame);

            result.file = copyToCache(context, uri);
            if (result.file == null) return result;
            result.status = OK;
        } catch (Throwable t) {
            Log.e(TAG, "Unable to load the selected video", t);
            result.status = FAILED;
        } finally {
            try {
                retriever.release();
            } catch (Throwable ignored) {
                // Nothing to release.
            }
        }
        return result;
    }

    private static File copyToCache(Context context, Uri uri) throws Exception {
        File dir = new File(context.getCacheDir(), CACHE_DIR);
        if (!dir.exists() && !dir.mkdirs()) return null;
        // Only the latest pick is kept.
        File[] old = dir.listFiles();
        if (old != null) {
            for (File f : old) f.delete();
        }
        File target = new File(dir, "video_" + System.currentTimeMillis() + ".mp4");
        try (InputStream in = context.getContentResolver().openInputStream(uri);
             OutputStream out = new FileOutputStream(target)) {
            if (in == null) return null;
            byte[] buffer = new byte[64 * 1024];
            int read;
            while ((read = in.read(buffer)) != -1) out.write(buffer, 0, read);
        } catch (Throwable t) {
            target.delete();
            throw t;
        }
        return target;
    }

    private static Bitmap centerCropSquare(Bitmap source) {
        int side = Math.min(source.getWidth(), source.getHeight());
        Bitmap square = Bitmap.createBitmap(
                source, (source.getWidth() - side) / 2, (source.getHeight() - side) / 2, side, side);
        if (square != source) source.recycle();
        if (side <= THUMBNAIL_SIDE) return square;
        Bitmap scaled = Bitmap.createScaledBitmap(square, THUMBNAIL_SIDE, THUMBNAIL_SIDE, true);
        if (scaled != square) square.recycle();
        return scaled;
    }

    private static long parseLong(String value) {
        try {
            return value == null ? 0 : Long.parseLong(value);
        } catch (NumberFormatException e) {
            return 0;
        }
    }

    private GalleryVideoLoader() {
    }
}
