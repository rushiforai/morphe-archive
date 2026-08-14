package io.github.liongalahad.nuviotv.extension.settings;

import android.content.Context;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Environment;
import android.provider.DocumentsContract;

import java.io.File;

/** Shared storage-location preference used by patches that read or write local media. */
public final class MorpheStoragePath {
    public static final String DEFAULT_FOLDER_LABEL = "Movies/Nuvio";
    public static final String DEFAULT_DOCUMENT_ID = "primary:Movies/Nuvio";
    public static final String STORAGE_PATH_KEY = "playback.local_storage.path";

    private MorpheStoragePath() {}

    public static String value() {
        try {
            return preferences().getString(STORAGE_PATH_KEY, null);
        } catch (ClassCastException ignored) {
            return null;
        }
    }

    public static boolean setTreeUri(Context context, Uri treeUri) {
        if (treeUri == null) return false;
        MorpheSettingsRuntime.initialize(context);
        return preferences().edit().putString(STORAGE_PATH_KEY, treeUri.toString()).commit();
    }

    public static boolean setFolderPath(Context context, String folderPath) {
        if (folderPath == null || folderPath.trim().isEmpty()) return false;
        MorpheSettingsRuntime.initialize(context);
        return preferences().edit().putString(
                STORAGE_PATH_KEY,
                Uri.fromFile(new File(folderPath)).toString()
        ).commit();
    }

    public static Uri uri() {
        String stored = value();
        return stored == null || stored.isEmpty() ? Uri.fromFile(defaultFolder()) : Uri.parse(stored);
    }

    public static File defaultFolder() {
        return new File(
                Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_MOVIES),
                "Nuvio"
        );
    }

    public static String displayLabel() {
        String stored = value();
        if (stored == null || stored.isEmpty()) return DEFAULT_FOLDER_LABEL;
        try {
            Uri location = Uri.parse(stored);
            if ("file".equalsIgnoreCase(location.getScheme())) {
                return displayLabelForPath(location.getPath());
            }
            String documentId = DocumentsContract.getTreeDocumentId(location);
            int separator = documentId.indexOf(':');
            String path = separator >= 0 ? documentId.substring(separator + 1) : documentId;
            return path.isEmpty() ? DEFAULT_FOLDER_LABEL : path;
        } catch (RuntimeException ignored) {
            return DEFAULT_FOLDER_LABEL;
        }
    }

    public static String displayLabelForPath(String folderPath) {
        if (folderPath == null || folderPath.isEmpty()) return DEFAULT_FOLDER_LABEL;
        try {
            String path = new File(folderPath).getCanonicalPath();
            String primary = Environment.getExternalStorageDirectory().getCanonicalPath();
            if (path.equals(primary)) return "Internal storage";
            if (path.startsWith(primary + File.separator)) {
                return path.substring(primary.length() + 1).replace(File.separatorChar, '/');
            }
            return path.replace(File.separatorChar, '/');
        } catch (Exception ignored) {
            return folderPath.replace(File.separatorChar, '/');
        }
    }

    private static SharedPreferences preferences() {
        Context context = MorpheSettingsRuntime.applicationContext();
        if (context == null) throw new IllegalStateException("Morphe settings were not initialized");
        return context.getSharedPreferences(MorpheSettingsRuntime.PREFERENCES_NAME, Context.MODE_PRIVATE);
    }
}
