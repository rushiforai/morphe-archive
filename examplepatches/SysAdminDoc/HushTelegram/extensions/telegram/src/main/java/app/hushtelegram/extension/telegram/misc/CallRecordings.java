/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.Manifest;
import android.content.ContentResolver;
import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Context;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.media.MediaFormat;
import android.media.MediaScannerConnection;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.provider.DocumentsContract;
import android.provider.MediaStore;

import androidx.annotation.Nullable;
import androidx.annotation.RequiresApi;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Where a call recording is written while the call runs, what it's called, and how it's put in the
 * phone's shared storage once the call ends: Recordings/Telegram calls from Android 12, which is
 * the first with a Recordings folder, and Music/Telegram calls before that.
 */
final class CallRecordings {
    private CallRecordings() {}

    static final String FOLDER = "Telegram calls";
    static final String MIME = "audio/mp4";

    /** How a recording is encoded (#72): AAC in an .m4a anywhere, or Opus in an .ogg from Android 10. */
    enum Format {
        AAC(MediaFormat.MIMETYPE_AUDIO_AAC, MIME, ".m4a"),
        OPUS(MediaFormat.MIMETYPE_AUDIO_OPUS, "audio/ogg", ".ogg");

        final String codec;
        final String mime;
        final String extension;

        Format(String codec, String mime, String extension) {
            this.codec = codec;
            this.mime = mime;
            this.extension = extension;
        }

        /** The format a recording's file name says it's in. */
        static Format of(String name) {
            return name.endsWith(OPUS.extension) ? OPUS : AAC;
        }
    }
    /** Telegram's cache folder for the recording in progress. Only one call records at a time. */
    static final String SCRATCH = "hush-call-recordings";

    /** The folder as a file manager shows it, from the top of the phone's storage. */
    static String folder() {
        return top() + "/" + FOLDER;
    }

    /** The folder picked under Recordings folder (#72), or null for the usual one. */
    @Nullable
    static Uri chosen() {
        String saved = Settings.RECORD_CALLS_FOLDER.get();
        if (saved.isEmpty()) return null;
        Uri tree = Uri.parse(saved);
        return DocumentsContract.isTreeUri(tree) ? tree : null;
    }

    /** Where recordings go now: the picked folder, or the usual one. */
    static String shown() {
        Uri tree = chosen();
        return tree == null ? folder() : label(tree);
    }

    /**
     * A picked folder as the picker showed it: its path on the storage it's on, "Internal storage"
     * for the top of the phone's own, and the storage's name for the top of another.
     */
    static String label(Uri tree) {
        String id = DocumentsContract.getTreeDocumentId(tree);
        int colon = id.indexOf(':');
        if (colon < 0) return id;
        String path = id.substring(colon + 1);
        if (!path.isEmpty()) return path;
        String volume = id.substring(0, colon);
        return "primary".equals(volume) ? L10n.t("Internal storage") : volume;
    }

    private static String top() {
        return Build.VERSION.SDK_INT >= Build.VERSION_CODES.S
                ? Environment.DIRECTORY_RECORDINGS : Environment.DIRECTORY_MUSIC;
    }

    /** "Telegram call 2026-10-30 21-15.m4a", from when the call's audio began, in the phone's time zone. */
    static String name(long began) {
        return name(began, null);
    }

    /**
     * "Telegram call with Alex Kim 2026-10-30 21-15.m4a" (#72), or the plain name when there's no
     * one to name. Characters a file name can't carry go, and a long name is cut.
     */
    static String name(long began, @Nullable String with) {
        return name(began, with, Format.AAC);
    }

    /** The same name, ending the way [format]'s files do. */
    static String name(long began, @Nullable String with, Format format) {
        String who = fileSafe(with);
        return PREFIX + (who.isEmpty() ? "" : "with " + who + " ")
                + new SimpleDateFormat("yyyy-MM-dd HH-mm", Locale.US).format(new Date(began)) + format.extension;
    }

    /** Every recording's name starts with this, which is how cleanup knows its own files. */
    static final String PREFIX = "Telegram call ";
    private static final int LONGEST_NAME = 60;

    /** [text] with what Android's and Windows' file names refuse turned to spaces, trimmed and cut short. */
    static String fileSafe(@Nullable String text) {
        if (text == null) return "";
        StringBuilder safe = new StringBuilder();
        for (int i = 0; i < text.length(); ) {
            int point = text.codePointAt(i);
            i += Character.charCount(point);
            // Direction marks too, so a name can't turn the rest of the file name around.
            boolean refused = Character.isISOControl(point) || Character.getType(point) == Character.FORMAT
                    || "/\\:*?\"<>|".indexOf(point) >= 0;
            safe.appendCodePoint(refused || Character.isWhitespace(point) ? ' ' : point);
        }
        String collapsed = safe.toString().replaceAll(" {2,}", " ").trim();
        while (collapsed.startsWith(".")) collapsed = collapsed.substring(1).trim();
        if (collapsed.codePointCount(0, collapsed.length()) > LONGEST_NAME) {
            collapsed = collapsed.substring(0, collapsed.offsetByCodePoints(0, LONGEST_NAME)).trim();
        }
        return collapsed;
    }

    /**
     * The file for a recording that's starting. What an earlier start left there (Telegram closed
     * mid-call, so it was never finished) is deleted first, since it can't be played.
     */
    static File scratch(Context context, long began) throws IOException {
        File folder = new File(context.getCacheDir(), SCRATCH);
        if (!folder.mkdirs() && !folder.isDirectory()) throw new IOException("No folder for the call recording");
        File[] left = folder.listFiles();
        if (left != null) {
            for (File old : left) {
                if (!old.delete() && old.exists()) throw new IOException("An old call recording is in the way");
            }
        }
        return new File(folder, "call-" + began + ".m4a");
    }

    /** Where a saved recording went: the folder for the toast, and its address for the notification. */
    static final class Saved {
        final String folder;
        /** The recording in MediaStore, or null on Android 9, where it's a plain file. */
        @Nullable final Uri uri;
        final String mime;

        Saved(String folder, @Nullable Uri uri, String mime) {
            this.folder = folder;
            this.uri = uri;
            this.mime = mime;
        }
    }

    /**
     * Puts the finished file under [name] in the picked folder, or in shared storage when none is
     * picked or the picked one won't take it, and answers where it went.
     */
    static Saved save(Context context, File file, String name) throws IOException {
        String mime = Format.of(name).mime;
        Uri tree = chosen();
        if (tree != null) {
            try {
                return new Saved(label(tree), into(context, tree, file, name, mime), mime);
            } catch (IOException | RuntimeException failure) {
                // The permission goes with the folder, or when Telegram's data is cleared, and the call still has to land.
                HookStatus.threw(FamilyNames.DISABLE_CALL_DEBUG, "chosen folder save", failure);
            }
        }
        Uri uri = null;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            uri = insert(context, file, name, mime);
        } else {
            legacy(context, file, name, mime);
        }
        return new Saved(folder(), uri, mime);
    }

    /** Into the picked folder through the app that holds it, taken back if the copy doesn't finish. */
    private static Uri into(Context context, Uri tree, File file, String name, String mime) throws IOException {
        ContentResolver resolver = context.getContentResolver();
        Uri parent = DocumentsContract.buildDocumentUriUsingTree(tree, DocumentsContract.getTreeDocumentId(tree));
        Uri made = DocumentsContract.createDocument(resolver, parent, mime, name);
        if (made == null) throw new IOException("The folder didn't take the recording");
        try (InputStream in = new FileInputStream(file); OutputStream out = resolver.openOutputStream(made, "w")) {
            if (out == null) throw new IOException("The folder gave no stream");
            copy(in, out);
        } catch (IOException | RuntimeException failure) {
            try {
                DocumentsContract.deleteDocument(resolver, made);
            } catch (IOException | RuntimeException cleanup) {
                failure.addSuppressed(cleanup);
            }
            throw failure;
        }
        return made;
    }

    /** Into MediaStore's audio, hidden until it's whole, the way Save to Downloads copies. */
    @RequiresApi(Build.VERSION_CODES.Q)
    private static Uri insert(Context context, File file, String name, String mime) throws IOException {
        ContentResolver resolver = context.getContentResolver();
        ContentValues values = new ContentValues();
        values.put(MediaStore.MediaColumns.DISPLAY_NAME, name);
        values.put(MediaStore.MediaColumns.RELATIVE_PATH, folder() + "/");
        values.put(MediaStore.MediaColumns.MIME_TYPE, mime);
        values.put(MediaStore.MediaColumns.IS_PENDING, 1);
        Uri pending = resolver.insert(MediaStore.Audio.Media.EXTERNAL_CONTENT_URI, values);
        if (pending == null) throw new IOException("MediaStore didn't take the recording");
        try {
            try (InputStream in = new FileInputStream(file); OutputStream out = resolver.openOutputStream(pending, "w")) {
                if (out == null) throw new IOException("MediaStore gave no stream");
                copy(in, out);
            }
            values.clear();
            values.put(MediaStore.MediaColumns.IS_PENDING, 0);
            if (resolver.update(pending, values, null, null) != 1) throw new IOException("MediaStore didn't publish the recording");
        } catch (IOException | RuntimeException failure) {
            try {
                resolver.delete(pending, null, null);
            } catch (RuntimeException cleanup) {
                failure.addSuppressed(cleanup);
            }
            throw failure;
        }
        return pending;
    }

    /**
     * Android 9 has no MediaStore folders, so the file goes straight into Music/Telegram calls,
     * which needs the storage permission Telegram asks for when it first saves to the gallery,
     * and the media scanner is told about it.
     */
    @SuppressWarnings("deprecation")
    private static void legacy(Context context, File file, String name, String mime) throws IOException {
        if (context.checkSelfPermission(Manifest.permission.WRITE_EXTERNAL_STORAGE) != PackageManager.PERMISSION_GRANTED) {
            throw new IOException("Telegram can't write to the phone's storage");
        }
        File folder = new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_MUSIC), FOLDER);
        if (!folder.mkdirs() && !folder.isDirectory()) throw new IOException("No " + folder());
        File target = free(folder, name);
        try (InputStream in = new FileInputStream(file); OutputStream out = new FileOutputStream(target)) {
            copy(in, out);
        } catch (IOException | RuntimeException failure) {
            if (!target.delete() && target.exists()) failure.addSuppressed(new IOException("Left a partial " + target.getName()));
            throw failure;
        }
        MediaScannerConnection.scanFile(context, new String[]{target.getPath()}, new String[]{mime}, null);
    }

    /**
     * Deletes the recordings in the usual folder, and in a picked one, saved before [before], wall
     * clock, and answers how many went (#72). Only names this gives are touched. One saved before
     * Telegram was reinstalled isn't Telegram's anymore, so MediaStore won't let go of it, and it stays.
     */
    static int clean(Context context, long before) {
        int deleted = Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q ? cleanStore(context, before) : cleanFolder(before);
        Uri tree = chosen();
        return tree == null ? deleted : deleted + cleanTree(context, tree, before);
    }

    /** The picked folder's recordings, by their files' dates. A folder Telegram can't reach anymore is left as it is. */
    private static int cleanTree(Context context, Uri tree, long before) {
        ContentResolver resolver = context.getContentResolver();
        String[] columns = {DocumentsContract.Document.COLUMN_DOCUMENT_ID, DocumentsContract.Document.COLUMN_DISPLAY_NAME,
                DocumentsContract.Document.COLUMN_MIME_TYPE, DocumentsContract.Document.COLUMN_LAST_MODIFIED};
        Uri children = DocumentsContract.buildChildDocumentsUriUsingTree(tree, DocumentsContract.getTreeDocumentId(tree));
        List<Uri> old = new ArrayList<>();
        try (Cursor rows = resolver.query(children, columns, null, null, null)) {
            if (rows == null) return 0;
            while (rows.moveToNext()) {
                String name = rows.getString(1);
                if (name == null || !name.startsWith(PREFIX) || DocumentsContract.Document.MIME_TYPE_DIR.equals(rows.getString(2))
                        || rows.isNull(3) || rows.getLong(3) >= before) continue;
                old.add(DocumentsContract.buildDocumentUriUsingTree(tree, rows.getString(0)));
            }
        } catch (SecurityException lost) {
            // The save says so the next time a call ends.
            return 0;
        }
        int deleted = 0;
        for (Uri uri : old) {
            try {
                if (DocumentsContract.deleteDocument(resolver, uri)) deleted++;
            } catch (FileNotFoundException | SecurityException gone) {
                // Deleted in the meantime, or the permission went with the folder.
            }
        }
        return deleted;
    }

    @RequiresApi(Build.VERSION_CODES.Q)
    private static int cleanStore(Context context, long before) {
        ContentResolver resolver = context.getContentResolver();
        String path = folder() + "/";
        String[] columns = {MediaStore.MediaColumns._ID, MediaStore.MediaColumns.DISPLAY_NAME,
                MediaStore.MediaColumns.RELATIVE_PATH, MediaStore.MediaColumns.DATE_ADDED};
        String where = MediaStore.MediaColumns.RELATIVE_PATH + "=? AND " + MediaStore.MediaColumns.DISPLAY_NAME
                + " LIKE ? AND " + MediaStore.MediaColumns.DATE_ADDED + "<?";
        String[] values = {path, PREFIX + "%", String.valueOf(before / 1000)};
        List<Uri> old = new ArrayList<>();
        try (Cursor rows = resolver.query(MediaStore.Audio.Media.EXTERNAL_CONTENT_URI, columns, where, values, null)) {
            if (rows == null) return 0;
            while (rows.moveToNext()) {
                // Checked again here, so nothing but an old recording of ours goes whatever the query matched.
                String name = rows.getString(1);
                if (name == null || !name.startsWith(PREFIX) || !path.equals(rows.getString(2))
                        || rows.isNull(3) || rows.getLong(3) * 1000 >= before) continue;
                old.add(ContentUris.withAppendedId(MediaStore.Audio.Media.EXTERNAL_CONTENT_URI, rows.getLong(0)));
            }
        }
        int deleted = 0;
        for (Uri uri : old) {
            try {
                deleted += resolver.delete(uri, null, null);
            } catch (SecurityException notOurs) {
                // Saved by an earlier install of Telegram.
            }
        }
        return deleted;
    }

    @SuppressWarnings("deprecation")
    private static int cleanFolder(long before) {
        File[] files = new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_MUSIC), FOLDER).listFiles();
        int deleted = 0;
        for (File file : files == null ? new File[0] : files) {
            if (file.isFile() && file.getName().startsWith(PREFIX) && file.lastModified() < before && file.delete()) deleted++;
        }
        return deleted;
    }

    /** [name] in [folder], or "name (2).m4a" and up when that's taken, as MediaStore numbers them. */
    static File free(File folder, String name) {
        File target = new File(folder, name);
        int dot = name.lastIndexOf('.');
        String stem = dot > 0 ? name.substring(0, dot) : name;
        String extension = dot > 0 ? name.substring(dot) : "";
        for (int number = 2; target.exists(); number++) {
            target = new File(folder, stem + " (" + number + ")" + extension);
        }
        return target;
    }

    private static void copy(InputStream in, OutputStream out) throws IOException {
        byte[] buffer = new byte[64 * 1024];
        for (int read; (read = in.read(buffer)) != -1; ) out.write(buffer, 0, read);
    }
}
