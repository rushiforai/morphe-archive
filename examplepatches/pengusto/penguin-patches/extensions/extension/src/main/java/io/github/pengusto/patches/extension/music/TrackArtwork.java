/* SPDX-License-Identifier: GPL-3.0-only */
package io.github.pengusto.patches.extension.music;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.media.MediaMetadataRetriever;
import java.io.File;

public final class TrackArtwork {
    /** Runs within the original artwork worker. Null retains the original fallback. */
    public static Bitmap load(Context context, String path) {
        if (path == null || path.isEmpty() || !new File(path).isFile()) return null;
        MediaMetadataRetriever retriever = new MediaMetadataRetriever();
        try {
            retriever.setDataSource(path);
            byte[] picture = retriever.getEmbeddedPicture();
            if (picture == null && path.toLowerCase(java.util.Locale.ROOT).endsWith(".opus")) picture = OpusPicture.read(new File(path));
            if (picture == null) return null;
            int id = context.getResources().getIdentifier("top_art_height", "dimen", context.getPackageName());
            int size = id == 0 ? 512 : Math.max(1, Math.min(1024, context.getResources().getDimensionPixelSize(id)));
            BitmapFactory.Options bounds = new BitmapFactory.Options();
            bounds.inJustDecodeBounds = true;
            BitmapFactory.decodeByteArray(picture, 0, picture.length, bounds);
            BitmapFactory.Options options = new BitmapFactory.Options();
            options.inSampleSize = 1;
            while (bounds.outWidth / options.inSampleSize > size * 2 || bounds.outHeight / options.inSampleSize > size * 2) options.inSampleSize *= 2;
            return BitmapFactory.decodeByteArray(picture, 0, picture.length, options);
        } catch (Exception | OutOfMemoryError failure) { return null; }
        finally { try { retriever.release(); } catch (Exception ignored) { } }
    }
}
