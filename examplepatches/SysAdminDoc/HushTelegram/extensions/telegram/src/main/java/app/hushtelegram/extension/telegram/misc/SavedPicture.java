/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.ContentResolver;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Rect;
import android.media.ExifInterface;
import android.net.Uri;

import androidx.annotation.Nullable;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import app.hushtelegram.extension.shared.Logger;
import app.hushtelegram.extension.shared.Utils;

/**
 * The pictures picked from the gallery for the list background (#88) and the chat list banner (#86).
 * Each one is copied into Telegram's own files, so it stays when the gallery item is moved or deleted,
 * and is decoded off the main thread at the size it's drawn, then drawn centered and cropped to fill.
 */
public final class SavedPicture {
    private SavedPicture() {}

    /** The picture behind the lists. */
    public static final String LIST_BACKGROUND = "list_background";
    /** The picture on the chat list's top bar. */
    public static final String CHAT_LIST_BANNER = "chat_list_banner";

    /** The largest file copied. A phone's own photos are well under it; anything bigger isn't a photo. */
    static final long MAX_BYTES = 40L * 1024 * 1024;

    private static final String FOLDER = "hushtelegram_pictures";

    /** How a save went, so the editor's toast can say which. */
    public enum Saved { SAVED, NOT_A_PICTURE, TOO_LARGE, FAILED }

    /**
     * Bumped on every save and removal of a name, so a decoded copy of an older file is never drawn
     * again. In memory only: a new process decodes afresh anyway.
     */
    private static final Map<String, Integer> GENERATIONS = new HashMap<>();

    /** Where [name] is kept: Telegram's own files, outside the backup Android makes of the app. */
    public static File file(Context context, String name) {
        return new File(new File(context.getNoBackupFilesDir(), FOLDER), name + ".img");
    }

    /** Whether [name] has a file to draw. Bounds only, so a damaged file still answers yes until it's decoded. */
    public static boolean present(@Nullable Context context, String name) {
        if (context == null) return false;
        File file = file(context, name);
        return file.isFile() && file.length() > 0;
    }

    static synchronized int generation(String name) {
        Integer known = GENERATIONS.get(name);
        return known == null ? 0 : known;
    }

    private static synchronized void bump(String name) {
        GENERATIONS.put(name, generation(name) + 1);
    }

    /**
     * Copies [source] in as [name], replacing what was there only once the new copy reads as a
     * picture. Run it off the main thread: the copy reads the whole file.
     */
    public static Saved save(Context context, Uri source, String name) {
        File target = file(context, name);
        File part = new File(target.getParentFile(), name + ".part");
        try {
            File folder = target.getParentFile();
            if (folder == null || !folder.mkdirs() && !folder.isDirectory()) return Saved.FAILED;
            ContentResolver resolver = context.getContentResolver();
            try (InputStream in = resolver.openInputStream(source)) {
                if (in == null) return Saved.FAILED;
                try (FileOutputStream out = new FileOutputStream(part)) {
                    byte[] buffer = new byte[64 * 1024];
                    long total = 0;
                    for (int read; (read = in.read(buffer)) != -1; ) {
                        total += read;
                        if (total > MAX_BYTES) {
                            out.close();
                            part.delete();
                            return Saved.TOO_LARGE;
                        }
                        out.write(buffer, 0, read);
                    }
                    out.getFD().sync();
                }
            }
            if (!readable(part)) {
                part.delete();
                return Saved.NOT_A_PICTURE;
            }
            // Android's rename replaces the old picture in one step; a file system that won't
            // replace a file on rename gets the old one deleted first.
            if (!part.renameTo(target) && !(target.delete() && part.renameTo(target))) {
                part.delete();
                return Saved.FAILED;
            }
            bump(name);
            return Saved.SAVED;
        } catch (IOException | RuntimeException failure) {
            Logger.printException(() -> "Could not copy the picture for " + name, failure);
            part.delete();
            return Saved.FAILED;
        }
    }

    /** Deletes [name]'s file. True when nothing is left of it. */
    public static boolean remove(@Nullable Context context, String name) {
        if (context == null) return false;
        File file = file(context, name);
        boolean gone = !file.exists() || file.delete();
        bump(name);
        return gone;
    }

    /** Whether [file] has a size a picture decoder reads, without decoding it. */
    static boolean readable(File file) {
        BitmapFactory.Options bounds = new BitmapFactory.Options();
        bounds.inJustDecodeBounds = true;
        BitmapFactory.decodeFile(file.getPath(), bounds);
        return bounds.outWidth > 0 && bounds.outHeight > 0;
    }

    /**
     * [file] decoded to exactly [width] by [height], scaled to fill and cropped in the middle, turned
     * the way the camera's tag says, or null when it doesn't decode.
     */
    @Nullable
    static Bitmap decode(File file, int width, int height) {
        if (width <= 0 || height <= 0) return null;
        BitmapFactory.Options bounds = new BitmapFactory.Options();
        bounds.inJustDecodeBounds = true;
        BitmapFactory.decodeFile(file.getPath(), bounds);
        if (bounds.outWidth <= 0 || bounds.outHeight <= 0) return null;
        int degrees = rotation(file);
        boolean sideways = degrees == 90 || degrees == 270;
        int fullWidth = sideways ? bounds.outHeight : bounds.outWidth;
        int fullHeight = sideways ? bounds.outWidth : bounds.outHeight;
        float scale = Math.max(width / (float) fullWidth, height / (float) fullHeight);
        // The largest power of two that still leaves enough pixels to fill the size asked for.
        int sample = 1;
        while (fullWidth / (sample * 2) >= fullWidth * scale && fullHeight / (sample * 2) >= fullHeight * scale) sample *= 2;
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inSampleSize = sample;
        Bitmap decoded = BitmapFactory.decodeFile(file.getPath(), options);
        if (decoded == null) return null;
        Bitmap out = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(out);
        Matrix matrix = new Matrix();
        // Turn about the decoded picture's middle, scale it to cover, then center it on the canvas.
        matrix.postTranslate(-decoded.getWidth() / 2f, -decoded.getHeight() / 2f);
        matrix.postRotate(degrees);
        int turnedWidth = sideways ? decoded.getHeight() : decoded.getWidth();
        int turnedHeight = sideways ? decoded.getWidth() : decoded.getHeight();
        float fill = Math.max(width / (float) turnedWidth, height / (float) turnedHeight);
        matrix.postScale(fill, fill);
        matrix.postTranslate(width / 2f, height / 2f);
        canvas.drawBitmap(decoded, matrix, new Paint(Paint.FILTER_BITMAP_FLAG));
        decoded.recycle();
        return out;
    }

    /** The camera's turn for [file] in degrees, or 0 when it has none or can't be read. */
    private static int rotation(File file) {
        try {
            switch (new ExifInterface(file.getPath()).getAttributeInt(ExifInterface.TAG_ORIENTATION, ExifInterface.ORIENTATION_NORMAL)) {
                case ExifInterface.ORIENTATION_ROTATE_90:
                    return 90;
                case ExifInterface.ORIENTATION_ROTATE_180:
                    return 180;
                case ExifInterface.ORIENTATION_ROTATE_270:
                    return 270;
                default:
                    return 0;
            }
        } catch (IOException | RuntimeException unreadable) {
            return 0;
        }
    }

    /** Draws [bitmap] over [bounds], scaled to fill them and cropped in the middle. */
    static void drawFilling(Canvas canvas, Bitmap bitmap, Rect bounds, Paint paint) {
        int width = bounds.width(), height = bounds.height();
        if (width <= 0 || height <= 0) return;
        float scale = Math.max(width / (float) bitmap.getWidth(), height / (float) bitmap.getHeight());
        int shownWidth = Math.min(bitmap.getWidth(), Math.round(width / scale));
        int shownHeight = Math.min(bitmap.getHeight(), Math.round(height / scale));
        int left = (bitmap.getWidth() - shownWidth) / 2, top = (bitmap.getHeight() - shownHeight) / 2;
        canvas.drawBitmap(bitmap, new Rect(left, top, left + shownWidth, top + shownHeight), bounds, paint);
    }

    /**
     * One saved picture as a screen draws it: decoded once on a worker at the size it's drawn, kept
     * for the main thread, and decoded again only when the file or the size changes. Main thread only.
     */
    static final class Shown {
        final String name;
        /** Told on the main thread once a decode lands, so the views drawing it ask again. */
        private final Runnable landed;
        /** Told on the main thread when the file is there but isn't a picture, after it's deleted. */
        private final Runnable broken;
        @Nullable private Bitmap bitmap;
        private int bitmapGeneration = -1, bitmapWidth, bitmapHeight;
        private boolean loading;
        /** Whether the file was there when last looked, and for which generation, so a draw doesn't touch the disk. */
        private int checkedGeneration = -1;
        private boolean present;

        Shown(String name, Runnable landed, Runnable broken) {
            this.name = name;
            this.landed = landed;
            this.broken = broken;
        }

        /** Whether there's a picture to draw, from the disk once per save or removal. */
        boolean present(@Nullable Context context) {
            int generation = generation(name);
            if (checkedGeneration != generation) {
                present = SavedPicture.present(context, name);
                checkedGeneration = generation;
            }
            return present;
        }

        /**
         * The picture at [width] by [height], or the last one decoded until that's ready, or null
         * when there's none yet. A decode is asked for whenever the size or the file changed.
         */
        @Nullable
        Bitmap bitmap(@Nullable Context context, int width, int height) {
            if (context == null || width <= 0 || height <= 0 || !present(context)) return null;
            int generation = generation(name);
            boolean current = bitmap != null && bitmapGeneration == generation && bitmapWidth == width && bitmapHeight == height;
            if (!current && !loading) {
                loading = true;
                File file = file(context, name);
                boolean started = Utils.runOnBackgroundThread(() -> {
                    Bitmap decoded = null;
                    try {
                        decoded = decode(file, width, height);
                    } catch (Throwable failure) {
                        Logger.printException(() -> "Could not decode the picture for " + name, failure);
                    }
                    Bitmap result = decoded;
                    Utils.runOnMainThread(() -> landed(context, result, generation, width, height));
                });
                if (!started) loading = false;
            }
            return bitmap != null && bitmapGeneration == generation ? bitmap : null;
        }

        private void landed(Context context, @Nullable Bitmap decoded, int generation, int width, int height) {
            loading = false;
            if (generation != generation(name)) {
                // Saved or removed while it decoded: the next draw asks for the new file.
                if (decoded != null) decoded.recycle();
                landed.run();
                return;
            }
            if (decoded == null) {
                // A file that's there and isn't a picture goes, so the screen goes back to Telegram's look.
                remove(context, name);
                bitmap = null;
                broken.run();
                return;
            }
            bitmap = decoded;
            bitmapGeneration = generation;
            bitmapWidth = width;
            bitmapHeight = height;
            landed.run();
        }

        /** Lets go of the decoded copy, for when the picture is removed. */
        void forget() {
            bitmap = null;
            bitmapGeneration = -1;
            checkedGeneration = -1;
        }
    }
}
