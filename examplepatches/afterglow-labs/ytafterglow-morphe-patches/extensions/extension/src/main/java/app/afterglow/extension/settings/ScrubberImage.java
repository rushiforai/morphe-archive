package app.afterglow.extension.settings;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;

/** Bounded PNG storage shared by the image picker, native player and preferences transfer. */
public final class ScrubberImage {
    public static final String KEY = "seekBarScrubberImage";
    private static String encoded;
    private static Bitmap bitmap;
    private ScrubberImage() {}

    public static String read(InputStream input) throws IOException {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        byte[] buffer = new byte[8192]; int count;
        while ((count = input.read(buffer)) != -1) {
            if (output.size() + count > 8 * 1024 * 1024) throw new IOException("Choose an image smaller than 8 MB.");
            output.write(buffer, 0, count);
        }
        return normalize(output.toByteArray());
    }

    public static String normalize(byte[] bytes) throws IOException {
        BitmapFactory.Options options = new BitmapFactory.Options(); options.inJustDecodeBounds = true;
        BitmapFactory.decodeByteArray(bytes, 0, bytes.length, options);
        if (options.outWidth <= 0 || options.outHeight <= 0 || (long) options.outWidth * options.outHeight > 64000000)
            throw new IOException("Choose a valid image up to 64 megapixels.");
        options.inJustDecodeBounds = false; options.inSampleSize = 1;
        while (Math.max(options.outWidth, options.outHeight) / options.inSampleSize > 512) options.inSampleSize *= 2;
        Bitmap source = BitmapFactory.decodeByteArray(bytes, 0, bytes.length, options);
        if (source == null) throw new IOException("This image could not be decoded.");
        Bitmap result = source;
        float scale = Math.min(1, 256f / Math.max(source.getWidth(), source.getHeight()));
        if (scale < 1) result = Bitmap.createScaledBitmap(source, Math.max(1, Math.round(source.getWidth()*scale)),
                Math.max(1, Math.round(source.getHeight()*scale)), true);
        try {
            ByteArrayOutputStream output = new ByteArrayOutputStream();
            if (!result.compress(Bitmap.CompressFormat.PNG, 100, output)) throw new IOException("Could not save this image.");
            return Base64.getEncoder().encodeToString(output.toByteArray());
        } finally { if (result != source) result.recycle(); source.recycle(); }
    }

    public static synchronized Bitmap current() {
        String value = AfterglowPrefs.getString(KEY);
        if (java.util.Objects.equals(encoded, value)) return bitmap;
        encoded = value; bitmap = null;
        if (value == null || value.length() > 2 * 1024 * 1024) return null;
        try {
            byte[] bytes = Base64.getDecoder().decode(value);
            BitmapFactory.Options bounds = new BitmapFactory.Options(); bounds.inJustDecodeBounds = true;
            BitmapFactory.decodeByteArray(bytes, 0, bytes.length, bounds);
            if (bounds.outWidth <= 0 || bounds.outHeight <= 0 || bounds.outWidth > 512 || bounds.outHeight > 512) return null;
            bitmap = BitmapFactory.decodeByteArray(bytes, 0, bytes.length);
        } catch (IllegalArgumentException ignored) { }
        return bitmap;
    }
}
