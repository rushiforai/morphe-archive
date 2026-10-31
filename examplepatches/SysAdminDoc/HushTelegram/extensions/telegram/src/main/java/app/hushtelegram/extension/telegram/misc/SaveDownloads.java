/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.ContentResolver;
import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Context;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.provider.MediaStore;
import android.webkit.MimeTypeMap;

import androidx.annotation.RequiresApi;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.crypto.Cipher;
import javax.crypto.CipherInputStream;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Copies a file or song to Download/Telegram when it finishes downloading, where file managers
 * and other apps can open it.
 *
 * <p>Since Android 11 Telegram keeps what it downloads in its own app folder, and its message menu
 * saves one file at a time with Save to Downloads. The patch has Telegram's finished-download
 * callback, ImageLoader's {@code FileLoaderDelegate.fileDidLoaded}, call {@link #fileLoaded} first.
 * With the switch on, the file goes to the folder Save to Downloads uses. A file loaded from an open
 * chat comes with its message. One Telegram auto-downloads while its chat is closed comes with only
 * a key naming the message, so the copy reads that message from Telegram's database first.
 *
 * <p>Only what Telegram would let you save by hand: a document or a song from a message. Photos and
 * videos have Telegram's own Save to gallery, and GIFs, voice and round videos stay put. Nothing
 * from a secret chat, self-destructing media, or a chat or message that doesn't allow saving. A
 * second switch, off until turned on, lets that last kind through (#29), and with it photos and
 * videos from such a chat too, since Save to gallery is gone there. A third, also off until turned
 * on, lets view-once and self-destructing photos, videos, voice and round videos through (#9).
 * Telegram keeps those encrypted, so their copy is decrypted on the way, see {@link #open}. No
 * switch lets anything out of a secret chat. On Android 9 and 10 with storage access, Telegram's
 * folder is already shared, so there's nothing to copy.
 *
 * <p>Each document is copied once. A private list notes which Downloads entry holds it, under the
 * downloader's name for it (data center and document ID), so another file that only shares its
 * name and size still gets its own copy, and a copy deleted from Downloads is made again the next
 * time the document downloads. Copies made before the list began are taken once by name and size,
 * the way those versions matched them. A copy waiting its turn checks the switch when it starts
 * and again before it's shown, so turning it off or pausing publishes nothing more.
 *
 * <p>Telegram keeps a document under its own name in Telegram Files, and a document it has no
 * saved path for counts as downloaded when a file of that name and size is already there. Another
 * document of the same name and size then opens the earlier one's file without downloading. The
 * patch reports that at FileLoadOperation.onFinishLoadingFile, see {@link #finishing}, and such a
 * file isn't copied, since it may not be this document's.
 */
public final class SaveDownloads {
    /** Where the copies go, as MediaStore writes it: the shared Download folder's Telegram folder. */
    static final String FOLDER = Environment.DIRECTORY_DOWNLOADS + "/Telegram/";

    private SaveDownloads() {}

    /** Telegram's side, swapped out by tests. The real one calls the stubs the patch writes. */
    interface Telegram {
        /** The message's document, or null when what finished downloading isn't for a message. */
        Object document(Object parent);

        /** Whether the message is a file or a song, not a GIF, voice, round video or self-destructing media. */
        boolean fileOrSong(Object message);

        /** Whether the message, a secret chat or the chat's own setting keeps it from being saved. */
        boolean savingForbidden(Object message);

        /** Whether the message is in a secret chat, or can't tell which chat it's in. */
        boolean secretChat(Object message);

        /** The name Telegram's downloader knows the document by. */
        String attachName(Object document);

        /** The document's own file name, empty when it has none. */
        String documentName(Object document);

        /** The account's stored message, as a MessageObject, or null when it isn't stored. Waits for Telegram's storage queue. */
        Object storedMessage(int account, long dialogId, int messageId);

        /** Whether the message is a photo or a video, not a GIF, round video or self-destructing media. */
        boolean photoOrVideo(Object message);

        /** The photo size a chat shows and Save to Gallery saves, or null. */
        Object photo(Object message);

        /** Whether the message is view-once or self-destructing media, in any chat. */
        boolean timedMedia(Object message);
    }

    static Telegram telegram = new Telegram() {
        @Override
        public Object document(Object parent) {
            return messageDocument(parent);
        }

        @Override
        public boolean fileOrSong(Object message) {
            return SaveDownloads.fileOrSong(message);
        }

        @Override
        public boolean savingForbidden(Object message) {
            return SaveDownloads.savingForbidden(message);
        }

        @Override
        public boolean secretChat(Object message) {
            return SaveDownloads.secretChat(message);
        }

        @Override
        public String attachName(Object document) {
            return SaveDownloads.attachName(document);
        }

        @Override
        public String documentName(Object document) {
            return SaveDownloads.documentName(document);
        }

        @Override
        public Object storedMessage(int account, long dialogId, int messageId) {
            return SaveDownloads.storedMessage(account, dialogId, messageId);
        }

        @Override
        public boolean photoOrVideo(Object message) {
            return SaveDownloads.photoOrVideo(message);
        }

        @Override
        public Object photo(Object message) {
            return SaveDownloads.photo(message);
        }

        @Override
        public boolean timedMedia(Object message) {
            return SaveDownloads.timedMedia(message);
        }
    };

    /** Copies run here one at a time, off Telegram's download queue. Tests swap in a direct one. */
    static Executor work = Executors.newSingleThreadExecutor(task -> {
        Thread thread = new Thread(task, "HushTelegram SaveDownloads");
        thread.setDaemon(true);
        return thread;
    });

    /**
     * Injected at the start of the finished-download callback, on FileLoader's queue.
     *
     * @param account the account whose downloader finished it
     * @param name    the downloader's name for the file
     * @param file    the finished file
     * @param parent  what it was downloaded for: a MessageObject for a file loaded from an open chat,
     *                or for one auto-downloaded in the background, the {@code sent_} key naming its message
     */
    public static void fileLoaded(int account, String name, File file, Object parent) {
        HookStatus.invoked(FamilyNames.SAVE_DOWNLOADS);
        try {
            boolean found = file != null && FOUND.remove(file.getPath());
            if (name == null || file == null || !Utils.settingsReady() || !Settings.SAVE_DOWNLOADS.get()) return;
            // Under the downloader's own name it can only be this document's file.
            if (found && !file.getName().equals(name)) {
                HookStatus.counted(FamilyNames.SAVE_DOWNLOADS, NOT_ITS_OWN);
                return;
            }
            if (parent instanceof String) {
                Queued queued = Queued.parse((String) parent);
                if (queued == null) return;
                // Photos and videos auto-download the same way, and are only looked up for the second switch.
                if (!queuedWanted(queued.type)) {
                    HookStatus.counted(FamilyNames.SAVE_DOWNLOADS, OTHER_MEDIA);
                    return;
                }
                work.execute(() -> loadedInBackground(account, name, file, queued));
                return;
            }
            Runnable copy = check(name, file, parent);
            if (copy != null) work.execute(copy);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SAVE_DOWNLOADS, "download", failure);
        }
    }

    static final String NOT_ITS_OWN = "file Telegram took by name and size without downloading, not copied";

    /** More files than this waiting for their finished download means some never came, so the list starts over. */
    static final int MAX_FOUND = 64;

    /** Files Telegram took by name and size instead of downloading, until their finished download comes. */
    private static final Set<String> FOUND = ConcurrentHashMap.newKeySet();

    /**
     * Injected at the start of FileLoadOperation.onFinishLoadingFile, on Telegram's queues, ahead of
     * {@link #fileLoaded} for the same file.
     *
     * @param pathSaveData set when Telegram stores the document under its own name and has no path saved for it
     * @param temp         the file it downloaded into, null when it found the finished file already there
     * @param file         the finished file
     */
    public static void finishing(Object pathSaveData, File temp, File file) {
        if (pathSaveData == null || temp != null || file == null) return;
        try {
            if (FOUND.size() >= MAX_FOUND) FOUND.clear();
            FOUND.add(file.getPath());
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SAVE_DOWNLOADS, "found file", failure);
        }
    }

    static void forgetFound() {
        FOUND.clear();
    }

    /** Telegram's MessageObject.TYPE_FILE, TYPE_MUSIC, TYPE_PHOTO, TYPE_VIDEO, TYPE_VOICE and TYPE_ROUND_VIDEO, which the patch checks are still these. */
    static final int FILE_TYPE = 9;
    static final int SONG_TYPE = 14;
    static final int PHOTO_TYPE = 1;
    static final int VIDEO_TYPE = 3;
    static final int VOICE_TYPE = 2;
    static final int ROUND_TYPE = 5;

    /** Whether a background download of this message type could be copied. */
    private static boolean queuedWanted(int type) {
        if (type == FILE_TYPE || type == SONG_TYPE) return true;
        boolean photoOrVideo = type == PHOTO_TYPE || type == VIDEO_TYPE;
        if (photoOrVideo && Settings.SAVE_RESTRICTED_DOWNLOADS.get()) return true;
        // Telegram auto-downloads view-once and timed media too.
        return (photoOrVideo || type == VOICE_TYPE || type == ROUND_TYPE) && Settings.SAVE_TIMED_MEDIA.get();
    }

    static final String KEPT = "file kept in Telegram, saving not allowed";
    static final String NOT_STORED = "file's message not found, kept in Telegram";
    static final String OTHER_MEDIA = "media that isn't a file or song, left in Telegram";

    /** Telegram's {@code sent_<channel>_<message>_<chat>_<type>_<size>} key. A group or channel's chat ID is negative. */
    private static final Pattern SENT = Pattern.compile("sent_.*_(\\d+)_(-?\\d+)_(\\d+)_(\\d+)");

    /**
     * What Telegram's background download queue says about a file: the message and chat it's from,
     * and what kind of message it is. The queue hands the downloader this key instead of the message.
     */
    static final class Queued {
        final int messageId;
        final long dialogId;
        final int type;

        private Queued(int messageId, long dialogId, int type) {
            this.messageId = messageId;
            this.dialogId = dialogId;
            this.type = type;
        }

        /** The key's parts, or null when it isn't a {@code sent_} key. */
        static Queued parse(String key) {
            Matcher parts = SENT.matcher(key);
            if (!parts.matches()) return null;
            try {
                return new Queued(Integer.parseInt(parts.group(1)), Long.parseLong(parts.group(2)), Integer.parseInt(parts.group(3)));
            } catch (NumberFormatException tooLong) {
                return null;
            }
        }
    }

    /**
     * Telegram stores a file it auto-downloads in the background under the downloader's name, since
     * the queue only has the key, so the copy finds the message in Telegram's own database first. On
     * the copy worker, since that waits for Telegram's storage queue.
     */
    private static void loadedInBackground(int account, String name, File file, Queued queued) {
        try {
            Object message = telegram.storedMessage(account, queued.dialogId, queued.messageId);
            if (message == null) {
                HookStatus.counted(FamilyNames.SAVE_DOWNLOADS, NOT_STORED);
                return;
            }
            Runnable copy = check(name, file, message);
            if (copy != null) copy.run();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SAVE_DOWNLOADS, "background download", failure);
        }
    }

    /** The copy a message's finished file gets, or null when it stays in Telegram. */
    private static Runnable check(String name, File file, Object message) {
        if (telegram.timedMedia(message)) return timed(name, file, message);
        Object document = telegram.document(message);
        // A message's thumbnail or cover loads with the message as its parent too; only the document itself counts.
        if (document == null || !name.equals(telegram.attachName(document)) || !telegram.fileOrSong(message)) {
            return restrictedMedia(name, file, message, document);
        }
        boolean restricted = telegram.savingForbidden(message);
        if (restricted && (!Settings.SAVE_RESTRICTED_DOWNLOADS.get() || telegram.secretChat(message))) {
            HookStatus.counted(FamilyNames.SAVE_DOWNLOADS, KEPT);
            return null;
        }
        if (restricted) HookStatus.counted(FamilyNames.SAVE_DOWNLOADS, RESTRICTED);
        String display = displayName(telegram.documentName(document), file.getName());
        return () -> save(file, display, name, restricted);
    }

    /**
     * A photo or video from a chat that doesn't allow saving, copied with the second switch on (#29),
     * since Telegram's Save to Gallery is gone there. Anywhere else Save to Gallery has it, so it stays put,
     * like a GIF or a voice message.
     */
    private static Runnable restrictedMedia(String name, File file, Object message, Object document) {
        // A video's file is its document, a photo's the size the chat shows. Thumbnails load with the message too.
        Object media = document != null ? document : telegram.photo(message);
        if (media == null || !name.equals(telegram.attachName(media))) return null;
        if (!Settings.SAVE_RESTRICTED_DOWNLOADS.get() || !telegram.photoOrVideo(message) || !telegram.savingForbidden(message)) {
            HookStatus.counted(FamilyNames.SAVE_DOWNLOADS, OTHER_MEDIA);
            return null;
        }
        if (telegram.secretChat(message)) {
            HookStatus.counted(FamilyNames.SAVE_DOWNLOADS, KEPT);
            return null;
        }
        HookStatus.counted(FamilyNames.SAVE_DOWNLOADS, RESTRICTED_MEDIA);
        String display = displayName(document == null ? null : telegram.documentName(document), file.getName());
        return () -> save(file, display, name, true);
    }

    /**
     * A view-once or self-destructing photo, video, voice or round video, copied with the third
     * switch on (#9). Never from a secret chat, and from a chat that doesn't allow saving only with
     * the second switch on too.
     */
    private static Runnable timed(String name, File file, Object message) {
        Object document = telegram.document(message);
        // A video's or voice message's file is its document, a photo's the size the chat shows.
        Object media = document != null ? document : telegram.photo(message);
        if (media == null || !name.equals(telegram.attachName(media))) return null;
        if (!Settings.SAVE_TIMED_MEDIA.get()) {
            HookStatus.counted(FamilyNames.SAVE_DOWNLOADS, OTHER_MEDIA);
            return null;
        }
        boolean restricted = telegram.savingForbidden(message);
        if (telegram.secretChat(message) || restricted && !Settings.SAVE_RESTRICTED_DOWNLOADS.get()) {
            HookStatus.counted(FamilyNames.SAVE_DOWNLOADS, KEPT);
            return null;
        }
        HookStatus.counted(FamilyNames.SAVE_DOWNLOADS, TIMED);
        String display = displayName(document == null ? null : telegram.documentName(document), plain(file.getName()));
        return () -> save(file, display, name, restricted, true, false);
    }

    /** What Telegram adds to the name of a file it keeps encrypted. */
    static final String ENCRYPTED = ".enc";

    /** [fileName] without {@link #ENCRYPTED}, so the copy keeps the media's own extension. */
    private static String plain(String fileName) {
        return fileName.endsWith(ENCRYPTED) ? fileName.substring(0, fileName.length() - ENCRYPTED.length()) : fileName;
    }

    /** What ext4 and FAT give a file name: 255 bytes of UTF-8. Over that, MediaStore refuses the file. */
    static final int MAX_NAME_BYTES = 255;

    /**
     * The document's own name, with the downloaded file's extension when it has none of its own.
     * Path separators, control characters and the bidi controls that would show "exe.gpj" as "jpg.exe"
     * become underscores, and a name too long for the file system loses the end of its stem.
     */
    static String displayName(String documentName, String fileName) {
        String name = documentName == null ? ""
                : documentName.replaceAll("[/\\\\\\p{Cntrl}\\u202A-\\u202E\\u2066-\\u2069]", "_").trim();
        if (name.isEmpty() || name.equals(".") || name.equals("..")) return fileName;
        if (extension(name).isEmpty() && !extension(fileName).isEmpty()) name += "." + extension(fileName);
        name = fit(name);
        return name.isEmpty() || name.startsWith(".") ? fileName : name;
    }

    /** [name] within {@link #MAX_NAME_BYTES}, its stem cut a code point at a time so a surrogate pair stays whole. */
    private static String fit(String name) {
        if (name.getBytes(StandardCharsets.UTF_8).length <= MAX_NAME_BYTES) return name;
        String ext = extension(name);
        String tail = ext.isEmpty() ? "" : "." + ext;
        String stem = name.substring(0, name.length() - tail.length());
        while (!stem.isEmpty() && (stem + tail).getBytes(StandardCharsets.UTF_8).length > MAX_NAME_BYTES) {
            stem = stem.substring(0, stem.offsetByCodePoints(stem.length(), -1));
        }
        return stem.trim() + tail;
    }

    private static String extension(String name) {
        int dot = name.lastIndexOf('.');
        return dot <= 0 || dot == name.length() - 1 ? "" : name.substring(dot + 1);
    }

    static final String SAVED = "file saved to Download/Telegram";
    static final String ALREADY_SAVED = "file already in Download/Telegram";
    static final String DROPPED = "copy dropped, switched off or paused";
    static final String RESTRICTED = "file from a chat that doesn't allow saving, copied as switched on";
    static final String RESTRICTED_MEDIA = "photo or video from a chat that doesn't allow saving, copied as switched on";
    static final String TIMED = "view-once or timed media copied as switched on";

    /** The private list of copies: the downloader's name for a document, to the Downloads entry holding it. */
    static final String RECEIPTS = "hushtelegram_saved_downloads";
    /** Years of saved files. Past it the oldest notes go, and those documents could be copied again. */
    static final int MAX_RECEIPTS = 2000;
    /** The list's start, kept beside the notes. No downloader name starts with '#'. */
    static final String BEGAN = "#began";
    /**
     * Versions before the list skipped a copy when an entry of the same name and size was there.
     * Their copies are matched that way once, only if added before the list began, so updating
     * doesn't copy every saved file again. Entries added since are found by their notes alone.
     */
    static final String OLDER_COPY = MediaStore.MediaColumns.DISPLAY_NAME + "=? AND "
            + MediaStore.MediaColumns.RELATIVE_PATH + "=? AND " + MediaStore.MediaColumns.SIZE + "=? AND "
            + MediaStore.MediaColumns.DATE_ADDED + "<?";

    /**
     * @param name     the name the copy shows in Downloads
     * @param document   the downloader's name for the document, which no other document has
     * @param restricted whether its chat doesn't allow saving, so the second switch has to stay on too
     */
    static void save(File file, String name, String document, boolean restricted) {
        save(file, name, document, restricted, false, false);
    }

    /**
     * The "Save to Downloads" menu item: copies the one file the user picked, whatever the two
     * automatic switches say. Only the item's own switch is asked, before and after the write.
     * Returns what happened ({@link #SAVED}, {@link #ALREADY_SAVED}) or null when nothing was copied.
     */
    static String saveByHand(File file, String name, String document) {
        return save(file, name, document, true, false, true);
    }

    /** @param timed whether it's view-once or timed media, so the third switch has to stay on too */
    private static String save(File file, String name, String document, boolean restricted, boolean timed, boolean manual) {
        try {
            // Turned off or paused while it waited behind other copies.
            if (!wanted(restricted, timed, manual)) {
                HookStatus.counted(FamilyNames.SAVE_DOWNLOADS, DROPPED);
                return null;
            }
            Context context = Utils.getContext();
            if (context == null || !file.isFile()) return null;
            if (Build.VERSION.SDK_INT < Build.VERSION_CODES.Q) {
                HookStatus.counted(FamilyNames.SAVE_DOWNLOADS, "file left in Telegram's shared folder on Android 9");
                return null;
            }
            if (!insideApp(context, file)) {
                HookStatus.counted(FamilyNames.SAVE_DOWNLOADS, "file already in shared storage");
                return manual ? ALREADY_SAVED : null;
            }
            String result = copy(context, file, name, document, restricted, timed, manual);
            HookStatus.counted(FamilyNames.SAVE_DOWNLOADS, result);
            return result;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SAVE_DOWNLOADS, "copy", failure);
            return null;
        }
    }

    private static boolean wanted(boolean restricted, boolean timed, boolean manual) {
        if (manual) return Utils.settingsReady() && Settings.MESSAGE_MENU_SAVE_PROTECTED.get();
        return Utils.settingsReady() && Settings.SAVE_DOWNLOADS.get()
                && (!restricted || Settings.SAVE_RESTRICTED_DOWNLOADS.get())
                && (!timed || Settings.SAVE_TIMED_MEDIA.get());
    }

    /**
     * Whether the file is in one of Telegram's own folders, which other apps can't open: its data
     * folder, or Android/data/&lt;package&gt; on the phone or a memory card Telegram stores to.
     */
    static boolean insideApp(Context context, File file) throws IOException {
        String path = file.getCanonicalPath();
        File data = context.getDataDir();
        if (data != null && path.startsWith(data.getCanonicalPath() + File.separator)) return true;
        List<File> own = new ArrayList<>(Arrays.asList(context.getExternalFilesDirs(null)));
        own.addAll(Arrays.asList(context.getExternalCacheDirs()));
        for (File folder : own) {
            File root = folder == null ? null : folder.getParentFile();
            if (root != null && path.startsWith(root.getCanonicalPath() + File.separator)) return true;
        }
        return false;
    }

    /**
     * Copies into MediaStore's Downloads, hidden until it's whole, and says what happened. An entry
     * added after the list began is only ever matched by its note, since another file can share its
     * name and size. One added before it is taken once by name and size, see {@link #OLDER_COPY}.
     */
    @RequiresApi(Build.VERSION_CODES.Q)
    private static String copy(Context context, File file, String name, String document, boolean restricted, boolean timed,
            boolean manual) throws IOException {
        ContentResolver resolver = context.getContentResolver();
        Uri downloads = MediaStore.Downloads.EXTERNAL_CONTENT_URI;
        SharedPreferences receipts = context.getSharedPreferences(RECEIPTS, Context.MODE_PRIVATE);
        long earlier = receipts.getLong(document, -1);
        if (earlier >= 0 && exists(resolver, ContentUris.withAppendedId(downloads, earlier))) return ALREADY_SAVED;
        long began = began(receipts);
        // A noted copy that's gone was deleted on purpose, so it's made again rather than matched.
        if (earlier < 0) {
            long older = olderCopy(resolver, receipts, name, file.length(), began);
            if (older >= 0) {
                remember(receipts, document, older);
                return ALREADY_SAVED;
            }
        }
        ContentValues values = new ContentValues();
        values.put(MediaStore.MediaColumns.DISPLAY_NAME, name);
        values.put(MediaStore.MediaColumns.RELATIVE_PATH, FOLDER);
        // From the name, the way Save to Downloads does, so MediaStore doesn't add a second extension.
        String mime = MimeTypeMap.getSingleton().getMimeTypeFromExtension(extension(name).toLowerCase(Locale.ROOT));
        if (mime != null) values.put(MediaStore.MediaColumns.MIME_TYPE, mime);
        values.put(MediaStore.MediaColumns.IS_PENDING, 1);
        Uri pending = resolver.insert(downloads, values);
        if (pending == null) throw new IOException("MediaStore didn't take the file");
        try {
            try (InputStream in = open(context, file); OutputStream out = resolver.openOutputStream(pending, "w")) {
                if (out == null) throw new IOException("MediaStore gave no stream");
                byte[] buffer = new byte[64 * 1024];
                for (int read; (read = in.read(buffer)) != -1; ) out.write(buffer, 0, read);
            }
            // Turned off or paused while it was written: the hidden entry goes and nothing shows up.
            if (!wanted(restricted, timed, manual)) {
                resolver.delete(pending, null, null);
                return DROPPED;
            }
            values.clear();
            values.put(MediaStore.MediaColumns.IS_PENDING, 0);
            if (resolver.update(pending, values, null, null) != 1) throw new IOException("MediaStore didn't publish the file");
        } catch (IOException | RuntimeException failure) {
            try {
                resolver.delete(pending, null, null);
            } catch (RuntimeException cleanup) {
                failure.addSuppressed(cleanup);
            }
            throw failure;
        }
        remember(receipts, document, ContentUris.parseId(pending));
        return SAVED;
    }

    /**
     * The file's bytes, decrypted when Telegram keeps it encrypted ({@link #ENCRYPTED}, as it does
     * view-once and timed media). FileLoadOperation encrypts those with AES-256 in CTR mode. The key
     * and IV sit in Telegram's internal cache as {@code <file>.key}, 32 bytes of key then 16 of IV,
     * and it writes the block number from the start of the file into the IV's last four bytes, which
     * is CTR counting from that IV with those four bytes zeroed.
     */
    static InputStream open(Context context, File file) throws IOException {
        InputStream in = new FileInputStream(file);
        if (!file.getName().endsWith(ENCRYPTED)) return in;
        try {
            byte[] key = new byte[48];
            try (DataInputStream keyFile = new DataInputStream(
                    new FileInputStream(new File(context.getCacheDir(), file.getName() + ".key")))) {
                keyFile.readFully(key);
            }
            byte[] iv = Arrays.copyOfRange(key, 32, 48);
            Arrays.fill(iv, 12, 16, (byte) 0);
            Cipher cipher = Cipher.getInstance("AES/CTR/NoPadding");
            cipher.init(Cipher.DECRYPT_MODE, new SecretKeySpec(key, 0, 32, "AES"), new IvParameterSpec(iv));
            return new CipherInputStream(in, cipher);
        } catch (GeneralSecurityException failure) {
            in.close();
            throw new IOException("Telegram's key for the file didn't work", failure);
        } catch (IOException | RuntimeException failure) {
            in.close();
            throw failure;
        }
    }

    /** Whether the entry is still in MediaStore. Deleted from a file manager, it isn't. */
    private static boolean exists(ContentResolver resolver, Uri entry) {
        try (Cursor row = resolver.query(entry, new String[]{MediaStore.MediaColumns._ID}, null, null, null)) {
            return row != null && row.moveToFirst();
        }
    }

    /** When the list began, in MediaStore's seconds, written by the first copy that finds none. -1 if it can't be saved. */
    private static long began(SharedPreferences receipts) {
        long began = receipts.getLong(BEGAN, -1);
        if (began >= 0) return began;
        began = System.currentTimeMillis() / 1000;
        return receipts.edit().putLong(BEGAN, began).commit() ? began : -1;
    }

    /**
     * A copy of this name and size that a version without the list made, and no other document has
     * taken yet. -1 if there's none, or if the list's start isn't saved and old and new can't be told apart.
     */
    @RequiresApi(Build.VERSION_CODES.Q)
    private static long olderCopy(ContentResolver resolver, SharedPreferences receipts, String name, long size, long began) {
        if (began < 0) return -1;
        Map<String, ?> taken = notes(receipts);
        try (Cursor rows = resolver.query(MediaStore.Downloads.EXTERNAL_CONTENT_URI,
                new String[]{MediaStore.MediaColumns._ID}, OLDER_COPY,
                new String[]{name, FOLDER, Long.toString(size), Long.toString(began)}, null)) {
            while (rows != null && rows.moveToNext()) {
                long entry = rows.getLong(0);
                if (!taken.containsValue(entry)) return entry;
            }
        }
        return -1;
    }

    /** The notes alone, without the list's start. */
    private static Map<String, ?> notes(SharedPreferences receipts) {
        Map<String, ?> all = new HashMap<>(receipts.getAll());
        all.remove(BEGAN);
        return all;
    }

    /** Notes the entry holding [document], and drops the oldest notes past {@link #MAX_RECEIPTS}. */
    private static void remember(SharedPreferences receipts, String document, long entry) {
        Map<String, ?> all = notes(receipts);
        SharedPreferences.Editor edit = receipts.edit().putLong(document, entry);
        int over = all.size() + (all.containsKey(document) ? 0 : 1) - MAX_RECEIPTS;
        if (over > 0) {
            // MediaStore numbers entries in the order they're made, so the lowest are the oldest.
            List<String> oldest = new ArrayList<>();
            for (Map.Entry<String, ?> note : all.entrySet()) {
                if (!note.getKey().equals(document) && note.getValue() instanceof Long) oldest.add(note.getKey());
            }
            oldest.sort(Comparator.comparingLong(key -> (Long) all.get(key)));
            for (int i = 0; i < over && i < oldest.size(); i++) edit.remove(oldest.get(i));
        }
        // On the copy worker, so waiting for the disk costs Telegram nothing.
        if (!edit.commit()) HookStatus.counted(FamilyNames.SAVE_DOWNLOADS, "copy not noted, it may be copied again");
    }

    // Stubs. The patch gives each one Telegram's code; until then they do nothing.

    /** {@code parent instanceof MessageObject ? getDocument() : null}. */
    public static Object messageDocument(Object parent) { return null; }

    /** Not {@code isSecretMedia()}, and {@code isMusic()} or {@code isDocument()} without {@code isGif()}, {@code isRoundVideo()} or {@code isVoice()}. */
    public static boolean fileOrSong(Object message) { return false; }

    /** {@code messageOwner.noforwards}, a secret chat, or {@code MessagesController.isPeerNoForwards} for the chat. */
    public static boolean savingForbidden(Object message) { return true; }

    /** {@code messageOwner} missing, or {@code DialogObject.isEncryptedDialog(getDialogId())}. */
    public static boolean secretChat(Object message) { return true; }

    /** {@code FileLoader.getAttachFileName(document)}, for a document or a photo size. */
    public static String attachName(Object document) { return null; }

    /** Not {@code isSecretMedia()}, {@code isGif()} or {@code isRoundVideo()}, and {@code isPhoto()} or {@code isVideo()}. */
    public static boolean photoOrVideo(Object message) { return false; }

    /** {@code FileLoader.getClosestPhotoSizeWithSize(photoThumbs, AndroidUtilities.getPhotoSize())}. */
    public static Object photo(Object message) { return null; }

    /** {@code isSecretMedia()}: view-once or self-destructing media, in a secret chat or not. */
    public static boolean timedMedia(Object message) { return false; }

    /** {@code FileLoader.getDocumentFileName(document)}. */
    public static String documentName(Object document) { return null; }

    /** {@code MessagesStorage.getInstance(account).getMessage(dialogId, messageId)}, wrapped in a MessageObject, or null. */
    public static Object storedMessage(int account, long dialogId, int messageId) { return null; }
}
