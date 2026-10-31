package app.hushmessenger.extension;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.provider.BaseColumns;
import android.provider.MediaStore;
import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.Locale;
import java.util.Set;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * Saves a copy of each voice message you play (#90). Messenger hands its voice message player a file it cached or just
 * downloaded, and the patch passes that file's Uri here on its way to the player. With the switch on, the sound is
 * copied into the phone's shared audio under Recordings/Messenger, or Music/Messenger on Android 10 and 11, where the
 * audio collection has no Recordings folder. Each copy is named for when it was saved and a short hash of its sound, so
 * playing it again finds the first copy and makes no other. The copy runs on a worker of its own and catches every
 * failure, so the player never waits on it or fails with it. Android 9 lets no app write to shared folders without the
 * storage permission, so nothing is saved there.
 */
public final class VoiceMessages {
    private VoiceMessages() {}

    static final String KEY = "save_voice";
    static final String FOLDER = "Messenger";
    /** A voice message runs a few hundred KB. Anything past this isn't one, so it isn't read in. */
    static final int MAX_BYTES = 25 << 20;
    static final int HASH_CHARS = 12;
    static final int PENDING = 8;

    /** Where copies go, and how a copy saved before is found. Tests swap it. */
    interface Library {
        boolean has(Context context, String hash) throws IOException;
        void add(Context context, String name, String mime, byte[] sound) throws IOException;
    }

    static volatile Library library = new SharedAudio();
    static Executor copies = worker();
    /** Hashes saved or found saved since Messenger started, so a replay asks the library nothing. */
    static final Set<String> saved = Collections.newSetFromMap(new ConcurrentHashMap<>());

    /** Called with the Uri the player is about to play. It's null when the download failed. */
    public static void played(Uri audio) {
        try {
            if (audio == null || Build.VERSION.SDK_INT < 29 || !Settings.enabled(KEY)) return;
            String scheme = audio.getScheme();
            // Only a file already on the phone: a copy must never fetch anything itself.
            if (!ContentResolver.SCHEME_FILE.equals(scheme) && !ContentResolver.SCHEME_CONTENT.equals(scheme)) return;
            Context context = Settings.appContext;
            if (context == null) return;
            copies.execute(() -> save(context, audio));
        } catch (RejectedExecutionException busy) {
            // More plays waiting than the worker keeps. This one is saved the next time it plays.
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Can't queue a voice message copy", error);
        }
    }

    static void save(Context context, Uri audio) {
        try {
            byte[] sound = read(context.getContentResolver(), audio);
            if (sound == null) return;
            Format format = Format.of(sound);
            if (format == null) {
                android.util.Log.w("HushMessenger", "save_voice: the voice message isn't in a sound format Hush knows");
                return;
            }
            String hash = hash(sound);
            if (saved.contains(hash)) return;
            if (!library.has(context, hash)) library.add(context, name(hash, format, new Date()), format.mime, sound);
            saved.add(hash);
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Can't save a voice message", error);
        }
    }

    /** The whole file, or null when it's gone, empty or past MAX_BYTES. */
    static byte[] read(ContentResolver resolver, Uri audio) throws IOException {
        InputStream opened;
        try {
            opened = resolver.openInputStream(audio);
        } catch (FileNotFoundException gone) {
            // Messenger can clear its cache between handing the file over and the copy.
            return null;
        }
        try (InputStream in = opened) {
            if (in == null) return null;
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buffer = new byte[64 << 10];
            for (int count; (count = in.read(buffer)) != -1; ) {
                out.write(buffer, 0, count);
                if (out.size() > MAX_BYTES) return null;
            }
            return out.size() == 0 ? null : out.toByteArray();
        }
    }

    static String hash(byte[] sound) throws Exception {
        byte[] digest = MessageDigest.getInstance("SHA-256").digest(sound);
        StringBuilder hex = new StringBuilder();
        for (byte b : digest) hex.append(String.format(Locale.ROOT, "%02x", b & 0xFF));
        return hex.substring(0, HASH_CHARS);
    }

    /** Like "Voice message 2026-10-30 14.05.33 3f9a0c1d2b4e.m4a". The hash goes last so a later play can find it. */
    static String name(String hash, Format format, Date when) {
        return "Voice message " + new SimpleDateFormat("yyyy-MM-dd HH.mm.ss", Locale.ROOT).format(when) + " " + hash + "." + format.extension;
    }

    /** The sound's format, read from its first bytes, since the cached file's name says nothing about it. */
    enum Format {
        M4A("audio/mp4", "m4a"), OGG("audio/ogg", "ogg"), AMR("audio/amr", "amr"), WAV("audio/wav", "wav"),
        WEBM("audio/webm", "webm"), AAC("audio/aac", "aac"), MP3("audio/mpeg", "mp3");

        final String mime, extension;

        Format(String mime, String extension) {
            this.mime = mime;
            this.extension = extension;
        }

        static Format of(byte[] sound) {
            if (starts(sound, 4, "ftyp")) return M4A;
            if (starts(sound, 0, "OggS")) return OGG;
            if (starts(sound, 0, "#!AMR")) return AMR;
            if (starts(sound, 0, "RIFF") && starts(sound, 8, "WAVE")) return WAV;
            if (sound.length >= 4 && (sound[0] & 0xFF) == 0x1A && (sound[1] & 0xFF) == 0x45 && (sound[2] & 0xFF) == 0xDF
                    && (sound[3] & 0xFF) == 0xA3) return WEBM;
            if (starts(sound, 0, "ID3")) return MP3;
            if (sound.length >= 2 && (sound[0] & 0xFF) == 0xFF) {
                // ADTS AAC and MPEG audio share the sync bits. AAC's layer bits are always 00, MP3's never are.
                if ((sound[1] & 0xF6) == 0xF0) return AAC;
                if ((sound[1] & 0xE0) == 0xE0 && (sound[1] & 0x06) != 0) return MP3;
            }
            return null;
        }

        private static boolean starts(byte[] sound, int at, String ascii) {
            if (sound.length < at + ascii.length()) return false;
            for (int i = 0; i < ascii.length(); i++) if (sound[at + i] != (byte) ascii.charAt(i)) return false;
            return true;
        }
    }

    /** The phone's shared audio through MediaStore, which needs no storage permission from Android 10 on. */
    @android.annotation.TargetApi(29)
    static final class SharedAudio implements Library {
        static Uri collection() {
            return MediaStore.Audio.Media.getContentUri(MediaStore.VOLUME_EXTERNAL_PRIMARY);
        }

        static String folder() {
            return (Build.VERSION.SDK_INT >= 31 ? "Recordings/" : "Music/") + FOLDER;
        }

        @Override public boolean has(Context context, String hash) {
            // An app sees its own items without a permission, which covers every copy this one saved.
            try (Cursor rows = context.getContentResolver().query(collection(), new String[] {BaseColumns._ID},
                    MediaStore.MediaColumns.DISPLAY_NAME + " LIKE ?", new String[] {"% " + hash + ".%"}, null)) {
                return rows != null && rows.getCount() > 0;
            }
        }

        @Override public void add(Context context, String name, String mime, byte[] sound) throws IOException {
            ContentResolver resolver = context.getContentResolver();
            ContentValues values = new ContentValues();
            values.put(MediaStore.MediaColumns.DISPLAY_NAME, name);
            values.put(MediaStore.MediaColumns.MIME_TYPE, mime);
            values.put(MediaStore.MediaColumns.RELATIVE_PATH, folder());
            // Other apps don't see it until the whole sound is in.
            values.put(MediaStore.MediaColumns.IS_PENDING, 1);
            Uri item = resolver.insert(collection(), values);
            if (item == null) throw new IOException("MediaStore made no item");
            boolean done = false;
            try {
                try (OutputStream out = resolver.openOutputStream(item)) {
                    if (out == null) throw new IOException("MediaStore gave no stream");
                    out.write(sound);
                }
                ContentValues finished = new ContentValues();
                finished.put(MediaStore.MediaColumns.IS_PENDING, 0);
                resolver.update(item, finished, null, null);
                done = true;
            } finally {
                if (!done) resolver.delete(item, null, null);
            }
        }
    }

    private static Executor worker() {
        ThreadPoolExecutor pool = new ThreadPoolExecutor(1, 1, 10, TimeUnit.SECONDS, new ArrayBlockingQueue<>(PENDING), work -> {
            Thread thread = new Thread(work, "HushVoiceCopy");
            thread.setDaemon(true);
            return thread;
        });
        pool.allowCoreThreadTimeOut(true);
        return pool;
    }
}
