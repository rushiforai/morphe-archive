/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/2528
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.extension.music.patches.downloads;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.util.AtomicFile;

import androidx.annotation.Nullable;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

import app.morphe.extension.shared.Logger;

/**
 * File access shared by the offline catalogue.
 * <p>
 * Plain streams are used rather than {@code Files.readString} and {@code Files.writeString},
 * which Android only provides from API 33 while this extension supports API 26.
 */
final class OfflineStorage {

    private OfflineStorage() {
    }

    static String readText(File file) throws IOException {
        try (FileInputStream input = new AtomicFile(file).openRead()) {
            ByteArrayOutputStream buffer = new ByteArrayOutputStream();
            byte[] chunk = new byte[4096];
            int read;
            while ((read = input.read(chunk)) != -1) {
                if(buffer.size()+read>1024*1024)throw new IOException("Offline metadata size limit");
                buffer.write(chunk, 0, read);
            }
            //noinspection CharsetObjectCanBeUsed
            return buffer.toString(StandardCharsets.UTF_8.name());
        }
    }

    static void writeText(File file, String value) throws IOException {
        AtomicFile atomic=new AtomicFile(file);FileOutputStream output=null;
        try{output=atomic.startWrite();output.write(value.getBytes(StandardCharsets.UTF_8));atomic.finishWrite(output);}
        catch(IOException|RuntimeException failure){if(output!=null)atomic.failWrite(output);throw failure;}
    }

    static void writeJpeg(File file, Bitmap bitmap) throws IOException {
        AtomicFile atomic=new AtomicFile(file);FileOutputStream output=null;
        try{output=atomic.startWrite();if(!bitmap.compress(Bitmap.CompressFormat.JPEG,90,output))throw new IOException("Cover encoding failed");atomic.finishWrite(output);}
        catch(IOException|RuntimeException failure){if(output!=null)atomic.failWrite(output);throw failure;}
    }

    /**
     * Covers are stored at 1200px, so list rows decode a sample rather than the full bitmap.
     *
     * @param maxSize Longest edge to decode.
     */
    @Nullable
    static Bitmap decodeArtwork(File file, int maxSize) {
        if (!file.isFile()&&!new File(file+".bak").isFile()) return null;
        try(FileInputStream restored=new AtomicFile(file).openRead()){}catch(IOException failure){Logger.printDebug(()->"Saved cover unavailable",failure);return null;}
        String path = file.getAbsolutePath();

        BitmapFactory.Options bounds = new BitmapFactory.Options();
        bounds.inJustDecodeBounds = true;
        BitmapFactory.decodeFile(path, bounds);

        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inSampleSize = Math.max(1, Math.max(bounds.outWidth, bounds.outHeight) / maxSize);
        return BitmapFactory.decodeFile(path, options);
    }

    /** Best effort removal, so a stale file cannot silently keep a download alive. */
    static void delete(File file) {
        if (file.exists() && !file.delete()) {
            Logger.printException(() -> "Could not delete: " + file);
        }
    }
}
