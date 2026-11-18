package samsungcompat;

import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.net.Uri;
import android.os.Environment;
import android.provider.DocumentsContract;
import android.provider.OpenableColumns;
import android.util.Log;
import android.widget.Toast;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * Notes picks files and folders through Samsung My Files ({@code com.sec.android.app.myfiles}). The patch makes the
 * app take its My Files branch everywhere and this class turns each My Files request into the system's own picker
 * right before it starts: files through {@link Intent#ACTION_GET_CONTENT} (the system Files app, which also lists
 * the other file managers), folders through {@link Intent#ACTION_OPEN_DOCUMENT_TREE}.
 */
public final class FilePicker {
    private static final String TAG = "NotesCompat";
    private static final String PICK_DATA = "com.sec.android.app.myfiles.PICK_DATA";
    private static final String PICK_DATA_MULTIPLE = "com.sec.android.app.myfiles.PICK_DATA_MULTIPLE";
    private static final String PICK_SELECT_PATH = "com.sec.android.app.myfiles.PICK_SELECT_PATH";
    private static final String EXTERNAL_STORAGE = "com.android.externalstorage.documents";
    private static final String DOWNLOADS = "com.android.providers.downloads.documents";

    private FilePicker() {}

    /** Called right before a My Files request starts: rewrites it into the system picker (anything else as is). */
    public static void toSystemPicker(Intent intent) {
        if (intent == null) return;
        String action = intent.getAction();
        if (PICK_DATA.equals(action) || PICK_DATA_MULTIPLE.equals(action)) {
            String[] types = mimeTypes(intent.getStringExtra("CONTENT_TYPE"));
            Intent picker = new Intent(Intent.ACTION_GET_CONTENT)
                .addCategory(Intent.CATEGORY_OPENABLE)
                .putExtra(Intent.EXTRA_LOCAL_ONLY, true)
                .putExtra(Intent.EXTRA_ALLOW_MULTIPLE, PICK_DATA_MULTIPLE.equals(action));
            if (types.length == 1) {
                picker.setType(types[0]);
            } else {
                picker.setType("*/*");
                if (types.length > 1) picker.putExtra(Intent.EXTRA_MIME_TYPES, types);
            }
            replace(intent, picker);
        } else if (PICK_SELECT_PATH.equals(action)) {
            Intent picker = new Intent(Intent.ACTION_OPEN_DOCUMENT_TREE)
                .putExtra(DocumentsContract.EXTRA_INITIAL_URI,
                    DocumentsContract.buildDocumentUri(EXTERNAL_STORAGE, "primary:" + Environment.DIRECTORY_DOCUMENTS));
            replace(intent, picker);
        }
    }

    /**
     * My Files' CONTENT_TYPE ("audio/*;application/ogg"). Samsung's own note types (application/spd, ...) are
     * unknown to other apps, so a list with one of them, or none at all, picks any file.
     */
    private static String[] mimeTypes(String contentType) {
        if (contentType == null || contentType.isEmpty()) return new String[0];
        List<String> types = new ArrayList<>();
        for (String type : contentType.split(";")) {
            type = type.trim();
            if (type.isEmpty()) continue;
            boolean known = type.startsWith("audio/") || type.startsWith("text/") || type.startsWith("image/")
                || type.startsWith("video/") || type.equals("application/pdf") || type.equals("application/ogg");
            if (!known) return new String[0];
            types.add(type);
        }
        return types.toArray(new String[0]);
    }

    /** Intents are mutable but have no "copy from": clear the old one and fill it with the new one. */
    private static void replace(Intent intent, Intent picker) {
        intent.replaceExtras((android.os.Bundle) null);
        if (intent.getCategories() != null) {
            for (String category : new ArrayList<>(intent.getCategories())) intent.removeCategory(category);
        }
        intent.setComponent(null);
        intent.setPackage(null);
        intent.setDataAndType(null, picker.getType());
        intent.setAction(picker.getAction());
        if (picker.getCategories() != null) {
            for (String category : picker.getCategories()) intent.addCategory(category);
        }
        if (picker.getExtras() != null) intent.putExtras(picker.getExtras());
    }

    /**
     * ContentPickerUtils.getPathFromResult: the folder picked for Save as file / export, as a path, since the app
     * writes into it with files. Returns null when the result isn't a picked folder (the app's own lookup runs).
     */
    public static String folderPath(Context context, Intent result) {
        if (result == null) return null;
        Uri tree = result.getData();
        if (tree == null || !DocumentsContract.isTreeUri(tree)) return null;
        String path = treePath(tree);
        if (path == null) {
            Log.w(TAG, "No path for the picked folder " + tree);
            toast(context, "Notes can't save to this folder. Pick a folder in Documents or Download.");
            return null;
        }
        if (context != null && !writable(new File(path))) {
            toast(context, "Notes can't save to this folder. Pick a folder in Documents or Download.");
        }
        return path;
    }

    /** "primary:Documents/x" → /storage/emulated/0/Documents/x, "1234-ABCD:x" → /storage/1234-ABCD/x. */
    private static String treePath(Uri tree) {
        String id = DocumentsContract.getTreeDocumentId(tree);
        if (id == null) return null;
        // Downloads ("raw:/storage/...") and file managers that offer their own storage root use the path as the ID.
        if (id.startsWith("raw:")) id = id.substring(4);
        if (id.startsWith("/")) return id;
        String authority = tree.getAuthority();
        if (DOWNLOADS.equals(authority)) {
            if (id.equals("downloads")) {
                return Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS).getPath();
            }
            return null;
        }
        if (!EXTERNAL_STORAGE.equals(authority)) return null;
        int colon = id.indexOf(':');
        if (colon < 0) return null;
        String volume = id.substring(0, colon);
        String relative = id.substring(colon + 1);
        String root = "primary".equalsIgnoreCase(volume)
            ? Environment.getExternalStorageDirectory().getPath()
            : "/storage/" + volume;
        return relative.isEmpty() ? root : root + "/" + relative;
    }

    /** Scoped storage lets the app create files in Documents and Download, not in most other folders. */
    private static boolean writable(File folder) {
        File probe = new File(folder, ".notes-write-test");
        try {
            if (!probe.createNewFile() && !probe.exists()) return false;
            return true;
        } catch (Exception e) {
            return false;
        } finally {
            //noinspection ResultOfMethodCallIgnored
            probe.delete();
        }
    }

    /**
     * ContentPickerUtils.getPathListFromResult, for each picked file (Import notes): the app opens it as a file,
     * so a picked document is copied into the cache under its own name first.
     */
    public static String importPath(Context context, Uri uri) {
        if (context == null || uri == null) return null;
        if ("file".equals(uri.getScheme())) return uri.getPath();
        File folder = new File(context.getCacheDir(), "picked");
        //noinspection ResultOfMethodCallIgnored
        folder.mkdirs();
        File file = new File(folder, safeName(displayName(context, uri)));
        try (InputStream in = context.getContentResolver().openInputStream(uri);
             OutputStream out = new FileOutputStream(file)) {
            if (in == null) return null;
            byte[] buffer = new byte[64 * 1024];
            for (int read; (read = in.read(buffer)) != -1; ) out.write(buffer, 0, read);
            return file.getPath();
        } catch (Exception e) {
            Log.w(TAG, "Couldn't read the picked file " + uri, e);
            return null;
        }
    }

    private static String displayName(Context context, Uri uri) {
        try (Cursor cursor = context.getContentResolver()
                .query(uri, new String[] {OpenableColumns.DISPLAY_NAME}, null, null, null)) {
            if (cursor != null && cursor.moveToFirst() && !cursor.isNull(0)) return cursor.getString(0);
        } catch (Exception ignored) {
            // Fall back to the last path segment.
        }
        String segment = uri.getLastPathSegment();
        return segment != null ? segment : "picked";
    }

    private static String safeName(String name) {
        String safe = name.substring(name.lastIndexOf('/') + 1).replaceAll("[\\\\:*?\"<>|]", "_");
        return safe.isEmpty() ? "picked" : safe;
    }

    private static void toast(Context context, String text) {
        if (context == null) return;
        try {
            Toast.makeText(context, text, Toast.LENGTH_LONG).show();
        } catch (RuntimeException e) {
            Log.w(TAG, text);
        }
    }
}
