package nl.johninnl.medium.reader;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import java.io.File;

/** Check Android can decode the image before publishing bytes as a reusable cache hit. */
final class ReaderImageDecoder {
    private ReaderImageDecoder() {}
    static boolean readable(File file) {
        BitmapFactory.Options bounds = new BitmapFactory.Options();
        bounds.inJustDecodeBounds = true;
        BitmapFactory.decodeFile(file.getAbsolutePath(), bounds);
        if (bounds.outWidth <= 0 || bounds.outHeight <= 0 || bounds.outWidth > 100000 || bounds.outHeight > 100000) return false;
        BitmapFactory.Options sampled = new BitmapFactory.Options();
        sampled.inSampleSize = 1;
        while (Math.max(bounds.outWidth, bounds.outHeight) / sampled.inSampleSize > 128) sampled.inSampleSize *= 2;
        Bitmap bitmap = BitmapFactory.decodeFile(file.getAbsolutePath(), sampled);
        if (bitmap == null) return false;
        bitmap.recycle();
        return true;
    }
}
