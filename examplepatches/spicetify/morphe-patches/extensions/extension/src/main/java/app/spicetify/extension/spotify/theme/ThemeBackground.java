package app.spicetify.extension.spotify.theme;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.util.DisplayMetrics;
import android.view.View;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 * Draws a theme's image behind Spotify's main screen. A theme that brings an image saves a copy at
 * about screen size in app-private storage when it's chosen, and choosing a theme without one deletes
 * it. While it's saved, {@link ThemeRuntime} makes the page background see-through so the image shows.
 */
public final class ThemeBackground {
    private static final String FILE = "spicetify_background";
    private static final String PREFERENCES = "spicetify_theme";
    private static final String BLUR = "background_blur";
    /** Half black over the image, so text on it stays readable, as Galaxy darkens its backgrounds. */
    private static final int SCRIM = 0x80000000;
    /** The blur works on a copy no larger than this on either side, which drawing scales up; blurred, it loses nothing. */
    private static final int BLUR_SIZE = 540;
    /** The most memory one decode may take: a 4096x2048 image. Larger ones decode at a fraction of their size. */
    private static final long MAX_DECODED_BYTES = 32L * 1024 * 1024;
    /** The image Spotify's screen draws, decoded once per process. Tests reset it. */
    static Bitmap cached;

    private ThemeBackground() {}

    /**
     * Puts the saved image behind Spotify's main activity; does nothing when none is saved or the
     * activity isn't the one with {@code main_content}.
     */
    @SuppressLint("DiscouragedApi") // Spotify's view ID isn't known when the extension is compiled.
    static void applyTo(Activity activity) {
        File file = new File(activity.getFilesDir(), FILE);
        if (!file.exists()) return;
        int mainContentId = activity.getResources().getIdentifier("main_content", "id", activity.getPackageName());
        View mainContent = mainContentId == 0 ? null : activity.findViewById(mainContentId);
        if (mainContent == null) return;
        if (cached == null) {
            cached = decode(file, activity);
            if (cached == null) return;
        }
        activity.getWindow().setBackgroundDrawable(new CenterCrop(cached));
        // SpotifyMainActivity.onCreate paints android:id/content opaque black, above the window.
        View content = activity.findViewById(android.R.id.content);
        if (content != null) content.setBackground(null);
        mainContent.setBackground(new CenterCrop(cached));
    }

    /** Whether an image is saved to draw behind Spotify. */
    public static boolean hasImage(Context context) {
        return new File(context.getFilesDir(), FILE).exists();
    }

    public static boolean blurEnabled(Context context) {
        return preferences(context).getBoolean(BLUR, false);
    }

    /** Saves the choice; Spotify's screen takes it when it's created again. */
    public static void setBlur(Context context, boolean enabled) {
        preferences(context).edit().putBoolean(BLUR, enabled).apply();
        cached = null;
    }

    /** Decodes just the image's size, refusing bytes Android can't read as an image. */
    public static BitmapFactory.Options bounds(byte[] image) throws IOException {
        BitmapFactory.Options bounds = new BitmapFactory.Options();
        bounds.inJustDecodeBounds = true;
        BitmapFactory.decodeByteArray(image, 0, image.length, bounds);
        if (bounds.outWidth <= 0 || bounds.outHeight <= 0) throw new IOException("Not an image Android can read");
        return bounds;
    }

    /**
     * The image at about screen size, for {@link ThemeRuntime#select}: no side longer than the display's
     * longer side, its shape kept and nothing cropped, so a window of any shape can center-crop it. An
     * image that already fits comes back as it is. It decodes the image, so call it off the main thread;
     * bytes Android can't read throw, and so does an image too large to decode, with OutOfMemoryError.
     */
    public static byte[] fit(Context context, byte[] image) throws IOException {
        DisplayMetrics display = context.getResources().getDisplayMetrics();
        int bound = Math.max(display.widthPixels, display.heightPixels);
        BitmapFactory.Options size = bounds(image);
        if (Math.max(size.outWidth, size.outHeight) <= bound) return image;
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inSampleSize = sampleSize(size.outWidth, size.outHeight, bound);
        Bitmap decoded = BitmapFactory.decodeByteArray(image, 0, image.length, options);
        if (decoded == null) throw new IOException("Not an image Android can read");
        float scale = Math.min(1f, (float) bound / Math.max(decoded.getWidth(), decoded.getHeight()));
        Bitmap fitted = scale == 1f ? decoded : Bitmap.createScaledBitmap(decoded,
                Math.max(1, Math.round(decoded.getWidth() * scale)), Math.max(1, Math.round(decoded.getHeight() * scale)), true);
        ByteArrayOutputStream encoded = new ByteArrayOutputStream();
        fitted.compress(Bitmap.CompressFormat.JPEG, 90, encoded);
        if (fitted != decoded) fitted.recycle();
        decoded.recycle();
        return encoded.toByteArray();
    }

    /**
     * Writes an image beside the saved one, refusing bytes Android can't read as one, for
     * {@link #replace} to put in place once the theme it comes with has loaded.
     */
    static File stage(Context context, byte[] image) throws IOException {
        bounds(image);
        File staged = new File(context.getFilesDir(), FILE + ".tmp");
        try (FileOutputStream output = new FileOutputStream(staged)) {
            output.write(image);
        }
        return staged;
    }

    /** Puts a staged image in place of the saved one, or deletes the saved one when there's none. */
    static void replace(Context context, File staged) throws IOException {
        File file = new File(context.getFilesDir(), FILE);
        if (staged == null) {
            file.delete();
        } else if (!staged.renameTo(file)) {
            throw new IOException("Could not replace " + file);
        }
        cached = null;
    }

    private static SharedPreferences preferences(Context context) {
        return context.getApplicationContext().getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE);
    }

    /**
     * Reads the saved image once per process: {@link #fit} saved it at about screen size, and the decode
     * is bounded anyway. Uncropped, so the drawing fits any window. When blur is on, it's blurred on a
     * small copy, which costs little time or memory.
     */
    private static Bitmap decode(File file, Activity activity) {
        BitmapFactory.Options size = new BitmapFactory.Options();
        size.inJustDecodeBounds = true;
        BitmapFactory.decodeFile(file.getPath(), size);

        DisplayMetrics display = activity.getResources().getDisplayMetrics();
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inSampleSize = sampleSize(size.outWidth, size.outHeight, Math.max(display.widthPixels, display.heightPixels));
        Bitmap image = BitmapFactory.decodeFile(file.getPath(), options);
        if (image == null || !blurEnabled(activity)) return image;
        float scale = Math.min(1f, (float) BLUR_SIZE / Math.max(image.getWidth(), image.getHeight()));
        Bitmap small = scale == 1f ? image : Bitmap.createScaledBitmap(image,
                Math.max(1, Math.round(image.getWidth() * scale)), Math.max(1, Math.round(image.getHeight() * scale)), true);
        if (small != image) image.recycle();
        Bitmap blurred = blur(small, Math.max(2, small.getHeight() / 80));
        small.recycle();
        return blurred;
    }

    /** Three box blurs in a row approximate a Gaussian blur. */
    static Bitmap blur(Bitmap source, int radius) {
        int width = source.getWidth();
        int height = source.getHeight();
        int[] pixels = new int[width * height];
        source.getPixels(pixels, 0, width, 0, 0, width, height);
        int[] scratch = new int[pixels.length];
        for (int pass = 0; pass < 3; pass++) {
            boxBlur(pixels, scratch, width, height, radius, true);
            boxBlur(scratch, pixels, width, height, radius, false);
        }
        return Bitmap.createBitmap(pixels, width, height, Bitmap.Config.ARGB_8888);
    }

    /** One opaque box blur along every row (horizontal) or column, clamping at the edges. */
    private static void boxBlur(int[] in, int[] out, int width, int height, int radius, boolean horizontal) {
        int lines = horizontal ? height : width;
        int length = horizontal ? width : height;
        int step = horizontal ? 1 : width;
        int window = radius * 2 + 1;
        for (int line = 0; line < lines; line++) {
            int start = horizontal ? line * width : line;
            int red = 0;
            int green = 0;
            int blue = 0;
            for (int i = -radius; i <= radius; i++) {
                int pixel = in[start + clamp(i, length) * step];
                red += (pixel >> 16) & 0xFF;
                green += (pixel >> 8) & 0xFF;
                blue += pixel & 0xFF;
            }
            for (int i = 0; i < length; i++) {
                out[start + i * step] = 0xFF000000 | ((red / window) << 16) | ((green / window) << 8) | (blue / window);
                int add = in[start + clamp(i + radius + 1, length) * step];
                int remove = in[start + clamp(i - radius, length) * step];
                red += ((add >> 16) & 0xFF) - ((remove >> 16) & 0xFF);
                green += ((add >> 8) & 0xFF) - ((remove >> 8) & 0xFF);
                blue += (add & 0xFF) - (remove & 0xFF);
            }
        }
    }

    private static int clamp(int index, int length) {
        return index < 0 ? 0 : index >= length ? length - 1 : index;
    }

    /**
     * The largest power of two that keeps the decoded image's longer side at or above {@code bound},
     * raised until the decode takes at most {@link #MAX_DECODED_BYTES}.
     */
    static int sampleSize(int width, int height, int bound) {
        int sampleSize = 1;
        while (Math.max(width, height) / (sampleSize * 2) >= Math.max(1, bound)) sampleSize *= 2;
        while ((long) (width / sampleSize) * (height / sampleSize) * 4 > MAX_DECODED_BYTES) sampleSize *= 2;
        return sampleSize;
    }

    /** Draws the bitmap scaled to fill the bounds, center-cropping instead of stretching it, then dims it. */
    private static final class CenterCrop extends Drawable {
        private final Bitmap bitmap;
        private final Paint paint = new Paint(Paint.FILTER_BITMAP_FLAG);
        private final Matrix matrix = new Matrix();

        CenterCrop(Bitmap bitmap) {
            this.bitmap = bitmap;
        }

        @Override
        protected void onBoundsChange(Rect bounds) {
            float scale = Math.max((float) bounds.width() / bitmap.getWidth(), (float) bounds.height() / bitmap.getHeight());
            matrix.setScale(scale, scale);
            matrix.postTranslate((bounds.width() - bitmap.getWidth() * scale) / 2f,
                    (bounds.height() - bitmap.getHeight() * scale) / 2f);
        }

        @Override
        public void draw(Canvas canvas) {
            canvas.save();
            canvas.clipRect(getBounds());
            canvas.drawBitmap(bitmap, matrix, paint);
            canvas.drawColor(SCRIM);
            canvas.restore();
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            paint.setColorFilter(colorFilter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.OPAQUE;
        }
    }
}
