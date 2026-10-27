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

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
 * second switch, off until turned on, lets that last kind through (#29), never the first two, and
 * with it photos and videos from such a chat too, since Save to gallery is gone there. On
 * Android 9 and 10 with storage access, Telegram's folder is already shared, so there's nothing to
 * copy.
 *
 * <p>Each document is copied once. A private list notes which Downloads entry holds it, under the
 * downloader's name for it (data center and document ID), so another file that only shares its
 * name and size still gets its own copy, and a copy deleted from Downloads is made again the next
 * time the document downloads. Copies made before the list began are taken once by name and size,
 * the way those versions matched them. A copy waiting its turn checks the switch when it starts
 * and again before it's shown, so turning it off or pausing publishes nothing more.
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
            if (name == null || file == null || !Utils.settingsReady() || !Settings.SAVE_DOWNLOADS.get()) return;
            if (parent instanceof String) {
                Queued queued = Queued.parse((String) parent);
                // Photos and videos auto-download the same way, and are only looked up for the second switch.
                if (queued == null || !queuedWanted(queued.type)) return;
                work.execute(() -> loadedInBackground(account, name, file, queued));
                return;
            }
            Runnable copy = check(name, file, parent);
            if (copy != null) work.execute(copy);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SAVE_DOWNLOADS, "download", failure);
        }
    }

    /** Telegram's MessageObject.TYPE_FILE, TYPE_MUSIC, TYPE_PHOTO and TYPE_VIDEO, which the patch checks are still these. */
    static final int FILE_TYPE = 9;
    static final int SONG_TYPE = 14;
    static final int PHOTO_TYPE = 1;
    static final int VIDEO_TYPE = 3;

    /** Whether a background download of this message type could be copied. */
    private static boolean queuedWanted(int type) {
        if (type == FILE_TYPE || type == SONG_TYPE) return true;
        return (type == PHOTO_TYPE || type == VIDEO_TYPE) && Settings.SAVE_RESTRICTED_DOWNLOADS.get();
    }

    static final String KEPT = "file kept in Telegram, saving not allowed";
    static final String NOT_STORED = "file's message not found, kept in Telegram";

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
     * since Telegram's Save to Gallery is gone there. Anywhere else Save to Gallery has it, so it stays put.
     */
    private static Runnable restrictedMedia(String name, File file, Object message, Object document) {
        if (!Settings.SAVE_RESTRICTED_DOWNLOADS.get() || !telegram.photoOrVideo(message)) return null;
        // A video's file is its document, a photo's the size the chat shows. Thumbnails load with the message too.
        Object media = document != null ? document : telegram.photo(message);
        if (media == null || !name.equals(telegram.attachName(media)) || !telegram.savingForbidden(message)) return null;
        if (telegram.secretChat(message)) {
            HookStatus.counted(FamilyNames.SAVE_DOWNLOADS, KEPT);
            return null;
        }
        HookStatus.counted(FamilyNames.SAVE_DOWNLOADS, RESTRICTED_MEDIA);
        String display = displayName(document == null ? null : telegram.documentName(document), file.getName());
        return () -> save(file, display, name, true);
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
        try {
            // Turned off or paused while it waited behind other copies.
            if (!wanted(restricted)) {
                HookStatus.counted(FamilyNames.SAVE_DOWNLOADS, DROPPED);
                return;
            }
            Context context = Utils.getContext();
            if (context == null || !file.isFile()) return;
            if (Build.VERSION.SDK_INT < Build.VERSION_CODES.Q) {
                HookStatus.counted(FamilyNames.SAVE_DOWNLOADS, "file left in Telegram's shared folder on Android 9");
                return;
            }
            if (!insideApp(context, file)) {
                HookStatus.counted(FamilyNames.SAVE_DOWNLOADS, "file already in shared storage");
                return;
            }
            HookStatus.counted(FamilyNames.SAVE_DOWNLOADS, copy(context, file, name, document, restricted));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SAVE_DOWNLOADS, "copy", failure);
        }
    }

    private static boolean wanted(boolean restricted) {
        return Utils.settingsReady() && Settings.SAVE_DOWNLOADS.get()
                && (!restricted || Settings.SAVE_RESTRICTED_DOWNLOADS.get());
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
    private static String copy(Context context, File file, String name, String document, boolean restricted)
            throws IOException {
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
            try (InputStream in = new FileInputStream(file); OutputStream out = resolver.openOutputStream(pending, "w")) {
                if (out == null) throw new IOException("MediaStore gave no stream");
                byte[] buffer = new byte[64 * 1024];
                for (int read; (read = in.read(buffer)) != -1; ) out.write(buffer, 0, read);
            }
            // Turned off or paused while it was written: the hidden entry goes and nothing shows up.
            if (!wanted(restricted)) {
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

    /** {@code FileLoader.getDocumentFileName(document)}. */
    public static String documentName(Object document) { return null; }

    /** {@code MessagesStorage.getInstance(account).getMessage(dialogId, messageId)}, wrapped in a MessageObject, or null. */
    public static Object storedMessage(int account, long dialogId, int messageId) { return null; }
}
