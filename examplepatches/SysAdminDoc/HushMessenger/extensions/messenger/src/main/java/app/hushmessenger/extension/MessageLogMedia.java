package app.hushmessenger.extension;

import android.content.Context;
import android.net.Uri;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Pattern;

/**
 * The pictures the message log keeps with photo messages: the preview Messenger put on the message's notification line,
 * copied while the notification is still up, sealed with the log's own key, one file per message. A picture goes when
 * its message leaves the log, and the oldest go first once they pass MAX_TOTAL_BYTES. The callers hold the log's lock.
 */
final class MessageLogMedia {
    private MessageLogMedia() {}

    static final String DIR = "hush_message_log_media";
    /** A preview bigger than this isn't kept. Messenger's previews are made for a notification, so they're far smaller. */
    static final int MAX_BYTES = 1024 * 1024;
    /** All the pictures together. Undo after Clear holds them in memory, so this stays small. */
    static final long MAX_TOTAL_BYTES = 16L * 1024 * 1024;
    /** A name is the digest of the message's chat and id, so nothing in it can point outside the folder. */
    private static final Pattern NAME = Pattern.compile("[0-9a-f]{64}");
    /** The sealed copy is the picture plus the nonce and the tag. */
    private static final int SEAL_BYTES = 12 + 16;

    static File file(Context context, String name) {
        if (name == null || !NAME.matcher(name).matches()) return null;
        return new File(new File(context.getFilesDir(), DIR), name);
    }

    /**
     * Copies the picture at [data] for message [id] in [thread]. Returns the name it's kept under, or "" when the line
     * carries no picture or it can't be copied, in which case the message is still logged, without it.
     */
    static String keep(Context context, String thread, String id, Uri data, String type) {
        if (context == null || data == null || type == null || !type.startsWith("image/") || id == null || id.isEmpty()) return "";
        String name = MessageLog.digest(thread + '\u0000' + id);
        try {
            byte[] picture;
            try (InputStream in = context.getContentResolver().openInputStream(data)) {
                if (in == null) return "";
                picture = readUpTo(in, MAX_BYTES);
            }
            if (picture == null || picture.length == 0) return "";
            File dir = new File(context.getFilesDir(), DIR);
            if (!dir.isDirectory() && !dir.mkdirs()) throw new IOException("can't make " + DIR);
            MessageLog.sealInto(dir, name, picture);
            return name;
        } catch (Exception failure) {
            // The words still make it into the log; only the picture is missing.
            Settings.hookFailedPrivately(MessageLog.KEY, "Can't keep a photo in the message log", failure);
            return "";
        }
    }

    /** The picture kept under [name], or null when it's gone. */
    static byte[] open(Context context, String name) throws Exception {
        File file = file(context, name);
        return file == null ? null : MessageLog.open(file, MAX_BYTES + SEAL_BYTES);
    }

    /** The picture kept under [name], decoded no wider than about twice [width] pixels. Null when it's gone or isn't one. */
    static android.graphics.Bitmap picture(Context context, String name, int width) throws Exception {
        byte[] picture = open(context, name);
        if (picture == null) return null;
        android.graphics.BitmapFactory.Options bounds = new android.graphics.BitmapFactory.Options();
        bounds.inJustDecodeBounds = true;
        android.graphics.BitmapFactory.decodeByteArray(picture, 0, picture.length, bounds);
        if (bounds.outWidth <= 0 || bounds.outHeight <= 0) return null;
        android.graphics.BitmapFactory.Options options = new android.graphics.BitmapFactory.Options();
        options.inSampleSize = 1;
        while (width > 0 && bounds.outWidth / (options.inSampleSize * 2) >= width) options.inSampleSize *= 2;
        return android.graphics.BitmapFactory.decodeByteArray(picture, 0, picture.length, options);
    }

    private static byte[] readUpTo(InputStream in, int max) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        byte[] buffer = new byte[8192];
        int read;
        while ((read = in.read(buffer)) != -1) {
            out.write(buffer, 0, read);
            if (out.size() > max) return null;
        }
        return out.toByteArray();
    }

    /**
     * Deletes the pictures no entry in [oldestFirst] points at, then the oldest pictures past MAX_TOTAL_BYTES. Their
     * messages stay and read as an attachment without its picture.
     */
    static void tidy(Context context, List<MessageLog.Entry> oldestFirst) {
        File dir = new File(context.getFilesDir(), DIR);
        String[] names = dir.list();
        if (names == null) return;
        Set<String> kept = new HashSet<>();
        long total = 0;
        for (int i = oldestFirst.size() - 1; i >= 0; i--) {
            String name = oldestFirst.get(i).media;
            if (name.isEmpty() || kept.contains(name)) continue;
            File file = file(context, name);
            if (file == null || !file.isFile()) continue;
            total += file.length();
            if (total > MAX_TOTAL_BYTES) break;
            kept.add(name);
        }
        for (String name : names) {
            if (kept.contains(name)) continue;
            File file = new File(dir, name);
            if (!file.delete() && file.exists()) {
                Settings.hookFailedPrivately(MessageLog.KEY, "Can't delete a photo from the message log", new IOException("delete failed: " + name));
            }
        }
        if (kept.isEmpty() && !dir.delete() && dir.exists()) {
            Settings.hookFailedPrivately(MessageLog.KEY, "Can't delete the message log's photos", new IOException("delete failed: " + DIR));
        }
    }

    /** Deletes every picture and the folder. Returns whether none is left. */
    static boolean deleteAll(Context context) {
        File dir = new File(context.getFilesDir(), DIR);
        String[] names = dir.list();
        boolean deleted = true;
        if (names != null) for (String name : names) deleted &= new File(dir, name).delete();
        if (dir.exists()) deleted &= dir.delete();
        if (!deleted) Settings.hookFailedPrivately(MessageLog.KEY, "Can't delete the message log's photos", new IOException("delete failed: " + DIR));
        return deleted;
    }

    /** The pictures [entries] point at, opened, for Undo after Clear. One that can't be opened is left out. */
    static Map<String, byte[]> openAll(Context context, List<MessageLog.Entry> entries) {
        Map<String, byte[]> pictures = new LinkedHashMap<>();
        for (MessageLog.Entry entry : new ArrayList<>(entries)) {
            if (entry.media.isEmpty() || pictures.containsKey(entry.media)) continue;
            try {
                byte[] picture = open(context, entry.media);
                if (picture != null) pictures.put(entry.media, picture);
            } catch (Exception unreadable) {
                // Its message comes back without it.
            }
        }
        return pictures;
    }

    /** Seals the pictures Undo held under the log's new key. */
    static void restore(Context context, Map<String, byte[]> pictures) throws Exception {
        if (pictures.isEmpty()) return;
        File dir = new File(context.getFilesDir(), DIR);
        if (!dir.isDirectory() && !dir.mkdirs()) throw new IOException("can't make " + DIR);
        for (Map.Entry<String, byte[]> picture : pictures.entrySet()) {
            if (file(context, picture.getKey()) != null) MessageLog.sealInto(dir, picture.getKey(), picture.getValue());
        }
    }
}
