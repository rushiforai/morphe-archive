package app.morphe.extension.chmate;

import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.provider.DocumentsContract;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

/** A user-visible SAF directory, with a private-file fallback for registrations made before setup. */
final class RegisteredImageSafStore {
    static final String DIRECTORY_NAME = "Haiagaru-画像NG";
    private static final String TREE = "saf_tree", FOLDER_ID = "saf_folder_id";
    private static final String[] COLUMNS = {
            DocumentsContract.Document.COLUMN_DOCUMENT_ID,
            DocumentsContract.Document.COLUMN_DISPLAY_NAME,
            DocumentsContract.Document.COLUMN_MIME_TYPE,
            DocumentsContract.Document.COLUMN_SIZE,
            DocumentsContract.Document.COLUMN_LAST_MODIFIED
    };

    static final class Entry {
        final File file;
        final Uri uri;
        final String name;
        final long size, modified;

        Entry(File file) {
            this.file = file; uri = null; name = file.getName();
            size = file.length(); modified = file.lastModified();
        }

        Entry(Uri uri, String name, long size, long modified) {
            file = null; this.uri = uri; this.name = name; this.size = size; this.modified = modified;
        }

        InputStream open(Context context) throws IOException {
            InputStream stream = file != null ? new FileInputStream(file)
                    : context.getContentResolver().openInputStream(uri);
            if (stream == null) throw new IOException("画像を開けません: " + name);
            return stream;
        }

        boolean delete(Context context) throws Exception {
            return file != null ? file.delete() : DocumentsContract.deleteDocument(context.getContentResolver(), uri);
        }

        String identity() { return file != null ? file.getAbsolutePath() : uri.toString(); }
        String fingerprint() { return identity() + ":" + size + ":" + modified; }
    }

    private RegisteredImageSafStore() { }

    static boolean configured(Context context) {
        return RegisteredImageNg.prefs(context).contains(TREE)
                && RegisteredImageNg.prefs(context).contains(FOLDER_ID);
    }

    static String location(Context context) {
        return configured(context) ? "SAF / " + DIRECTORY_NAME : "アプリ内 / haiagaru-registered-image-ng（SAF未設定）";
    }

    static File legacyDirectory(Context context) {
        return new File(context.getFilesDir(), "haiagaru-registered-image-ng");
    }

    static List<Entry> list(Context context) throws IOException {
        if (!configured(context)) {
            File[] files = legacyDirectory(context).listFiles((dir, name) -> name.endsWith(".img"));
            List<Entry> entries = new ArrayList<>();
            if (files != null) for (File file : files) entries.add(new Entry(file));
            Collections.sort(entries, (a, b) -> a.name.compareToIgnoreCase(b.name));
            return entries;
        }
        Uri tree = Uri.parse(RegisteredImageNg.prefs(context).getString(TREE, ""));
        String folderId = RegisteredImageNg.prefs(context).getString(FOLDER_ID, "");
        return children(context, tree, folderId, false);
    }

    private static List<Entry> children(Context context, Uri tree, String parentId, boolean includeFolders)
            throws IOException {
        List<Entry> result = new ArrayList<>();
        Uri listing = DocumentsContract.buildChildDocumentsUriUsingTree(tree, parentId);
        try (Cursor cursor = context.getContentResolver().query(listing, COLUMNS, null, null, null)) {
            if (cursor == null) throw new IOException("SAFフォルダを読み取れません");
            while (cursor.moveToNext()) {
                String id = cursor.getString(0), name = cursor.getString(1), mime = cursor.getString(2);
                if (id == null || name == null) continue;
                boolean folder = DocumentsContract.Document.MIME_TYPE_DIR.equals(mime);
                if (includeFolders ? !folder : folder || !isImage(name, mime)) continue;
                result.add(new Entry(DocumentsContract.buildDocumentUriUsingTree(tree, id), name,
                        cursor.isNull(3) ? -1 : cursor.getLong(3),
                        cursor.isNull(4) ? -1 : cursor.getLong(4)));
            }
        } catch (SecurityException error) {
            throw new IOException("SAFフォルダへの権限がありません。フォルダを選び直してください", error);
        }
        Collections.sort(result, (a, b) -> a.name.compareToIgnoreCase(b.name));
        return result;
    }

    private static boolean isImage(String name, String mime) {
        if (mime != null && mime.startsWith("image/")) return true;
        String lower = name.toLowerCase(Locale.ROOT);
        return lower.endsWith(".img") || lower.endsWith(".jpg") || lower.endsWith(".jpeg")
                || lower.endsWith(".png") || lower.endsWith(".gif") || lower.endsWith(".webp")
                || lower.endsWith(".bmp") || lower.endsWith(".heic") || lower.endsWith(".heif")
                || lower.endsWith(".avif");
    }

    /** Persist access only after verifying that the dedicated child folder can be opened. */
    static int selectFolder(Context context, Uri tree, int flags, int maximum, BytesReader reader)
            throws Exception {
        int grants = flags & (Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_GRANT_WRITE_URI_PERMISSION);
        if (grants != (Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_GRANT_WRITE_URI_PERMISSION))
            throw new IOException("読み書き権限のあるSAFフォルダを選んでください");
        context.getContentResolver().takePersistableUriPermission(tree, grants);
        String root = DocumentsContract.getTreeDocumentId(tree);
        String folderId = null;
        for (Entry item : children(context, tree, root, true))
            if (DIRECTORY_NAME.equals(item.name)) { folderId = DocumentsContract.getDocumentId(item.uri); break; }
        if (folderId == null) {
            Uri parent = DocumentsContract.buildDocumentUriUsingTree(tree, root);
            Uri created = DocumentsContract.createDocument(context.getContentResolver(), parent,
                    DocumentsContract.Document.MIME_TYPE_DIR, DIRECTORY_NAME);
            if (created == null) throw new IOException("専用フォルダを作成できません");
            folderId = DocumentsContract.getDocumentId(created);
        }
        children(context, tree, folderId, false); // Confirm the provider allows traversal.

        // Copy previous references before activating the selected directory. Keep originals for safety.
        List<Entry> previous = list(context);
        int copied = 0;
        Uri destination = DocumentsContract.buildDocumentUriUsingTree(tree, folderId);
        List<Entry> present = children(context, tree, folderId, false);
        for (Entry item : previous) {
            try (InputStream stream = item.open(context)) {
                byte[] bytes = reader.read(stream);
                if (bytes == null) continue;
                String hash = reader.digest(bytes);
                if (hasDigest(present, hash)) continue;
                if (present.size() >= maximum)
                    throw new IOException("移行先が" + maximum + "枚の上限に達しました。以前の登録先は維持します");
                if (putSaf(context, destination, present, bytes, hash)) copied++;
            } catch (Exception error) {
                // Never switch storage while previously usable references are missing.
                throw new IOException("以前の画像「" + item.name + "」を移行できません。保存先は変更していません", error);
            }
        }
        if (!RegisteredImageNg.prefs(context).edit().putString(TREE, tree.toString())
                .putString(FOLDER_ID, folderId).commit())
            throw new IOException("SAFフォルダ設定を保存できません");
        return copied;
    }

    interface BytesReader {
        byte[] read(InputStream input) throws Exception;
        String digest(byte[] bytes) throws Exception;
    }

    static boolean put(Context context, byte[] bytes, String digest, int maximum) throws Exception {
        List<Entry> existing = list(context);
        if (existing.size() >= maximum || hasDigest(existing, digest)) return false;
        if (!configured(context)) {
            File root = legacyDirectory(context);
            if (!root.isDirectory() && !root.mkdirs()) throw new IOException("専用フォルダを作成できません");
            File target = new File(root, digest + ".img");
            try (OutputStream output = new FileOutputStream(target)) { output.write(bytes); }
            return true;
        }
        Uri tree = Uri.parse(RegisteredImageNg.prefs(context).getString(TREE, ""));
        String folderId = RegisteredImageNg.prefs(context).getString(FOLDER_ID, "");
        return putSaf(context, DocumentsContract.buildDocumentUriUsingTree(tree, folderId), existing, bytes, digest);
    }

    private static boolean hasDigest(List<Entry> existing, String digest) {
        for (Entry entry : existing) if (entry.name.startsWith(digest + ".")) return true;
        return false;
    }

    private static boolean putSaf(Context context, Uri folder, List<Entry> existing, byte[] bytes, String digest)
            throws Exception {
        if (hasDigest(existing, digest)) return false;
        BitmapFactory.Options options = new BitmapFactory.Options(); options.inJustDecodeBounds = true;
        BitmapFactory.decodeByteArray(bytes, 0, bytes.length, options);
        String mime = options.outMimeType == null ? "application/octet-stream" : options.outMimeType;
        String extension;
        switch (mime) {
            case "image/jpeg": extension = ".jpg"; break;
            case "image/png": extension = ".png"; break;
            case "image/gif": extension = ".gif"; break;
            case "image/webp": extension = ".webp"; break;
            case "image/bmp": extension = ".bmp"; break;
            case "image/heif": extension = ".heic"; break;
            case "image/avif": extension = ".avif"; break;
            default: extension = ".img"; break;
        }
        Uri created = DocumentsContract.createDocument(context.getContentResolver(), folder, mime, digest + extension);
        if (created == null) throw new IOException("SAFフォルダに画像を作成できません");
        try (OutputStream output = context.getContentResolver().openOutputStream(created, "w")) {
            if (output == null) throw new IOException("SAF画像に書き込めません");
            output.write(bytes);
        } catch (Exception error) {
            try { DocumentsContract.deleteDocument(context.getContentResolver(), created); }
            catch (Exception ignored) { }
            throw error;
        }
        existing.add(new Entry(created, digest + extension, bytes.length, 0));
        return true;
    }
}
