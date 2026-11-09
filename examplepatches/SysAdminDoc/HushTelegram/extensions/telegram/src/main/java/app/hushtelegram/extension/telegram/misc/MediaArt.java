/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.media.MediaMetadataRetriever;
import android.media.MediaScannerConnection;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.provider.MediaStore;
import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

/**
 * Save video thumbnail and Save music album art (#53): the biggest picture Telegram has for a video
 * or a song goes to Pictures. A picture that isn't on the phone yet is fetched first, and the toast
 * says so when there's nothing to save.
 */
final class MediaArt {
    private MediaArt() {}

    static final String FOLDER = Environment.DIRECTORY_PICTURES + "/Telegram";

    /** How long a picture Telegram is still fetching is waited for, and how often it's looked for. */
    static long waitMillis = 8000;
    static long stepMillis = 250;

    /** Saves run here one at a time, off the main thread. Tests swap in a direct one. */
    static Executor work = Executors.newSingleThreadExecutor(task -> {
        Thread thread = new Thread(task, "HushTelegram MediaArt");
        thread.setDaemon(true);
        return thread;
    });

    /** Where a picture goes. Tests swap in one that records. */
    interface Sink {
        boolean write(Context context, byte[] data, String name, String mime) throws IOException;
    }

    static Sink sink = MediaArt::store;

    /** A picture Telegram knows of, and whether it came from the video's own cover. */
    static final class Pick {
        final Object size;
        final boolean cover;

        Pick(Object size, boolean cover) {
            this.size = size;
            this.cover = cover;
        }
    }

    /** The biggest size that has a file behind it. Stripped previews carry no size, so they never win. */
    static Object largest(ArrayList<?> sizes) {
        Object best = null;
        int bestBytes = 0;
        if (sizes == null) return null;
        for (Object size : sizes) {
            int bytes = size == null ? 0 : MessageMenu.photoSize(size);
            if (bytes > bestBytes) {
                best = size;
                bestBytes = bytes;
            }
        }
        return best;
    }

    /** A video's own cover when it has one, else the biggest thumbnail on the video. */
    static Pick videoPick(Object message) {
        Object cover = largest(MessageMenuTools.thumbs(message, 1));
        if (cover != null) return new Pick(cover, true);
        Object thumb = largest(MessageMenuTools.thumbs(message, 0));
        return thumb == null ? null : new Pick(thumb, false);
    }

    /** Whether the video has a cover or thumbnail to save. */
    static boolean hasVideoArt(Object message) {
        return videoPick(message) != null;
    }

    /** Whether the song has art: a picture in the file, or one on the server. */
    static boolean hasMusicArt(Object message) {
        if (largest(MessageMenuTools.thumbs(message, 0)) != null) return true;
        File file = MessageMenu.downloaded(message);
        return file != null && embedded(file) != null;
    }

    /** The picture inside a song file, or null. */
    static byte[] embedded(File file) {
        MediaMetadataRetriever retriever = new MediaMetadataRetriever();
        try {
            retriever.setDataSource(file.getPath());
            return retriever.getEmbeddedPicture();
        } catch (RuntimeException failure) {
            HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "read album art", failure);
            return null;
        } finally {
            try {
                retriever.release();
            } catch (IOException ignored) {
                // Nothing left to free.
            }
        }
    }

    /** Telegram's copy of the picture, looked for in both folders it keeps pictures in. */
    static File onDisk(Object message, Object size) {
        for (int force = 0; force <= 1; force++) {
            File file = MessageMenuTools.thumbFile(message, size, force);
            if (file != null && file.isFile() && file.length() > 0) return file;
        }
        return null;
    }

    /** The picture's file, asking Telegram to fetch it and waiting a moment when it isn't there yet. */
    static File fetch(Object message, Pick pick) throws InterruptedException {
        File file = onDisk(message, pick.size);
        if (file != null) return file;
        MessageMenuTools.thumbLoad(message, pick.size, pick.cover ? 1 : 0);
        for (long waited = 0; waited < waitMillis; waited += stepMillis) {
            Thread.sleep(stepMillis);
            file = onDisk(message, pick.size);
            if (file != null) return file;
        }
        return onDisk(message, pick.size);
    }

    static void saveVideo(Context context, Object message) {
        int id = MessageMenu.id(message);
        work.execute(() -> {
            try {
                Pick pick = videoPick(message);
                if (pick == null) {
                    MessageMenu.feedback(context, L10n.t(context, "No cover to save"));
                    return;
                }
                File file = fetch(message, pick);
                if (file == null) {
                    MessageMenu.feedback(context, L10n.t(context, "Cover isn't available yet"));
                    return;
                }
                finish(context, read(file), "video_" + id + (pick.cover ? "_cover" : "_thumb"), true);
            } catch (InterruptedException cancelled) {
                Thread.currentThread().interrupt();
            } catch (Throwable failure) {
                failed(context, "save video cover", failure);
            }
        });
    }

    static void saveMusic(Context context, Object message) {
        int id = MessageMenu.id(message);
        work.execute(() -> {
            try {
                byte[] data = null;
                File file = MessageMenu.downloaded(message);
                if (file != null) data = embedded(file);
                if (data == null) {
                    Object size = largest(MessageMenuTools.thumbs(message, 0));
                    if (size != null) {
                        File art = fetch(message, new Pick(size, false));
                        if (art == null) {
                            MessageMenu.feedback(context, L10n.t(context, "Album art isn't available yet"));
                            return;
                        }
                        data = read(art);
                    }
                }
                if (data == null) {
                    MessageMenu.feedback(context, L10n.t(context, "No album art to save"));
                    return;
                }
                finish(context, data, "album_art_" + id, false);
            } catch (InterruptedException cancelled) {
                Thread.currentThread().interrupt();
            } catch (Throwable failure) {
                failed(context, "save album art", failure);
            }
        });
    }

    private static void finish(Context context, byte[] data, String base, boolean cover) throws IOException {
        String mime = mime(data);
        boolean saved = sink.write(context, data, base + extension(mime), mime);
        MessageMenu.feedback(context, !saved ? L10n.t(context, "Couldn't save the picture")
                : cover ? L10n.t(context, "Cover saved to Pictures") : L10n.t(context, "Album art saved to Pictures"));
        if (saved) HookStatus.counted(FamilyNames.MESSAGE_MENU_REPEAT, "picture saved to Pictures");
    }

    private static void failed(Context context, String what, Throwable failure) {
        HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, what, failure);
        MessageMenu.feedback(context, L10n.t(context, "Couldn't save the picture"));
    }

    static byte[] read(File file) throws IOException {
        try (InputStream in = new FileInputStream(file)) {
            ByteArrayOutputStream out = new ByteArrayOutputStream((int) Math.max(file.length(), 32));
            byte[] buffer = new byte[16384];
            for (int count; (count = in.read(buffer)) > 0; ) out.write(buffer, 0, count);
            return out.toByteArray();
        }
    }

    /** What the bytes are by their first few: PNG and WebP are told apart, anything else is saved as JPEG. */
    static String mime(byte[] data) {
        if (data.length > 8 && (data[0] & 0xff) == 0x89 && data[1] == 'P' && data[2] == 'N' && data[3] == 'G') return "image/png";
        if (data.length > 12 && data[0] == 'R' && data[1] == 'I' && data[2] == 'F' && data[3] == 'F'
                && data[8] == 'W' && data[9] == 'E' && data[10] == 'B' && data[11] == 'P') return "image/webp";
        return "image/jpeg";
    }

    static String extension(String mime) {
        return "image/png".equals(mime) ? ".png" : "image/webp".equals(mime) ? ".webp" : ".jpg";
    }

    /** Pictures/Telegram through MediaStore, hidden until it's whole. Below Android 10 it's a plain file there. */
    private static boolean store(Context context, byte[] data, String name, String mime) throws IOException {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.Q) {
            File folder = new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES), "Telegram");
            if (!folder.mkdirs() && !folder.isDirectory()) throw new IOException("No Pictures/Telegram folder");
            File file = new File(folder, name);
            try (OutputStream out = new FileOutputStream(file)) {
                out.write(data);
            }
            MediaScannerConnection.scanFile(context, new String[]{file.getPath()}, new String[]{mime}, null);
            return true;
        }
        ContentResolver resolver = context.getContentResolver();
        ContentValues values = new ContentValues();
        values.put(MediaStore.MediaColumns.DISPLAY_NAME, name);
        values.put(MediaStore.MediaColumns.MIME_TYPE, mime);
        values.put(MediaStore.MediaColumns.RELATIVE_PATH, FOLDER);
        values.put(MediaStore.MediaColumns.IS_PENDING, 1);
        Uri pending = resolver.insert(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, values);
        if (pending == null) throw new IOException("MediaStore didn't take the picture");
        boolean done = false;
        try {
            try (OutputStream out = resolver.openOutputStream(pending)) {
                if (out == null) throw new IOException("MediaStore gave no stream");
                out.write(data);
            }
            ContentValues visible = new ContentValues();
            visible.put(MediaStore.MediaColumns.IS_PENDING, 0);
            resolver.update(pending, visible, null, null);
            done = true;
            return true;
        } finally {
            if (!done) resolver.delete(pending, null, null);
        }
    }
}
