package io.github.liongalahad.nuviotv.extension.settings;

import android.content.Context;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.os.storage.StorageManager;
import android.os.storage.StorageVolume;
import android.provider.DocumentsContract;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

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
            Context context = MorpheSettingsRuntime.applicationContext();
            File root = selectedStorageRoot(context, location);
            return displayLabelForDocumentId(documentId, storageDescription(context, root));
        } catch (RuntimeException ignored) {
            return DEFAULT_FOLDER_LABEL;
        }
    }

    public static String displayLabelForPath(String folderPath) {
        if (folderPath == null || folderPath.isEmpty()) return DEFAULT_FOLDER_LABEL;
        File folder = canonical(new File(folderPath));
        if (folder == null) return folderPath.replace(File.separatorChar, '/');

        Context context = MorpheSettingsRuntime.applicationContext();
        File primary = canonical(Environment.getExternalStorageDirectory());
        if (same(folder, primary)) return "Internal storage";
        if (contains(primary, folder)) return relativePath(primary, folder);

        File best = containingRoot(context, folder);
        if (best != null) {
            String description = storageDescription(context, best);
            String relative = relativePath(best, folder);
            return relative.isEmpty() ? description : description + "/" + relative;
        }

        String normalized = folder.getAbsolutePath().replace(File.separatorChar, '/');
        if (normalized.startsWith("/storage/")) {
            String remainder = normalized.substring("/storage/".length());
            int separator = remainder.indexOf('/');
            if (separator >= 0 && separator + 1 < remainder.length()) {
                return "External storage/" + remainder.substring(separator + 1);
            }
            return "External storage";
        }
        return normalized;
    }

    /** Returns the mounted volume that owns the selected folder, or null while it is unavailable. */
    public static File selectedStorageRoot(Context context, Uri location) {
        if (context == null || location == null) return null;
        if ("file".equalsIgnoreCase(location.getScheme()) && location.getPath() != null) {
            File selected = canonical(new File(location.getPath()));
            StorageVolume volume = storageVolumeForFile(context, selected);
            File volumeRoot = mountedDirectory(volume);
            if (contains(volumeRoot, selected)) return volumeRoot;
            return containingRoot(context, selected);
        }
        if (!"content".equalsIgnoreCase(location.getScheme())) return null;

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            try {
                StorageManager manager = context.getSystemService(StorageManager.class);
                StorageVolume volume = manager == null ? null : manager.getStorageVolume(location);
                File root = mountedDirectory(volume);
                if (root != null) return root;
            } catch (RuntimeException ignored) { }
        }

        try {
            if (!"com.android.externalstorage.documents".equals(location.getAuthority())) return null;
            String documentId = DocumentsContract.getTreeDocumentId(location);
            int separator = documentId.indexOf(':');
            String volumeId = separator < 0 ? documentId : documentId.substring(0, separator);
            if ("primary".equalsIgnoreCase(volumeId)) {
                File primary = canonical(Environment.getExternalStorageDirectory());
                return primary != null && primary.isDirectory() ? primary : null;
            }
            for (File root : mountedStorageRoots(context)) {
                if (volumeId.equalsIgnoreCase(root.getName())) return root;
            }
        } catch (RuntimeException ignored) { }
        return null;
    }

    /** Mounted user-storage roots in Android's own volume order, with primary storage first. */
    public static List<File> mountedStorageRoots(Context context) {
        List<File> roots = new ArrayList<>();
        Set<String> paths = new HashSet<>();
        addRoot(roots, paths, Environment.getExternalStorageDirectory());

        if (context != null) {
            try {
                StorageManager manager = context.getSystemService(StorageManager.class);
                if (manager != null) {
                    for (StorageVolume volume : manager.getStorageVolumes()) {
                        addRoot(roots, paths, mountedDirectory(volume));
                    }
                }
            } catch (RuntimeException ignored) { }
            try {
                File[] appFolders = context.getExternalFilesDirs(null);
                if (appFolders != null) for (File folder : appFolders) {
                    addRoot(roots, paths, storageRootForAppFolder(folder));
                }
            } catch (RuntimeException ignored) { }
        }

        try {
            File[] mounted = new File("/storage").listFiles(File::isDirectory);
            if (mounted != null) for (File root : mounted) {
                String name = root.getName().toLowerCase(Locale.ROOT);
                if (!"emulated".equals(name) && !"self".equals(name)) addRoot(roots, paths, root);
            }
        } catch (SecurityException ignored) { }
        return roots;
    }

    static String displayLabelForDocumentId(String documentId, String volumeDescription) {
        if (documentId == null || documentId.isEmpty()) return DEFAULT_FOLDER_LABEL;
        int separator = documentId.indexOf(':');
        String volumeId = separator < 0 ? documentId : documentId.substring(0, separator);
        String path = separator < 0 ? "" : documentId.substring(separator + 1);
        if ("primary".equalsIgnoreCase(volumeId)) {
            return path.isEmpty() ? "Internal storage" : path;
        }
        String description = volumeDescription == null || volumeDescription.trim().isEmpty()
                ? "External storage" : volumeDescription.trim();
        return path.isEmpty() ? description : description + "/" + path;
    }

    private static StorageVolume storageVolumeForFile(Context context, File file) {
        if (file == null) return null;
        try {
            StorageManager manager = context.getSystemService(StorageManager.class);
            return manager == null ? null : manager.getStorageVolume(file);
        } catch (RuntimeException ignored) {
            return null;
        }
    }

    private static File mountedDirectory(StorageVolume volume) {
        if (volume == null || !isMounted(volume)) return null;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            File directory = canonical(volume.getDirectory());
            if (directory != null && directory.isDirectory()) return directory;
        }
        if (volume.isPrimary()) {
            File primary = canonical(Environment.getExternalStorageDirectory());
            return primary != null && primary.isDirectory() ? primary : null;
        }
        String uuid = volume.getUuid();
        if (uuid == null || uuid.isEmpty()) return null;
        File directory = canonical(new File("/storage", uuid));
        return directory != null && directory.isDirectory() ? directory : null;
    }

    private static boolean isMounted(StorageVolume volume) {
        String state = volume.getState();
        return Environment.MEDIA_MOUNTED.equals(state) || Environment.MEDIA_MOUNTED_READ_ONLY.equals(state);
    }

    private static File containingRoot(Context context, File folder) {
        File best = null;
        for (File root : mountedStorageRoots(context)) {
            if (contains(root, folder) && (best == null ||
                    root.getAbsolutePath().length() > best.getAbsolutePath().length())) best = root;
        }
        return best;
    }

    private static String storageDescription(Context context, File root) {
        File primary = canonical(Environment.getExternalStorageDirectory());
        if (same(root, primary)) return "Internal storage";
        if (context != null && root != null) {
            try {
                StorageManager manager = context.getSystemService(StorageManager.class);
                if (manager != null) for (StorageVolume volume : manager.getStorageVolumes()) {
                    if (same(root, mountedDirectory(volume))) {
                        String description = volume.getDescription(context);
                        if (description != null && !description.trim().isEmpty()) return description.trim();
                    }
                }
            } catch (RuntimeException ignored) { }
        }
        return "External storage";
    }

    private static File storageRootForAppFolder(File appFolder) {
        File current = canonical(appFolder);
        while (current != null) {
            if ("Android".equalsIgnoreCase(current.getName())) return canonical(current.getParentFile());
            current = current.getParentFile();
        }
        return null;
    }

    private static void addRoot(List<File> roots, Set<String> paths, File candidate) {
        File root = canonical(candidate);
        if (root != null && root.isDirectory() && paths.add(root.getAbsolutePath())) roots.add(root);
    }

    private static String relativePath(File root, File folder) {
        if (same(root, folder)) return "";
        String rootPath = root.getAbsolutePath();
        String folderPath = folder.getAbsolutePath();
        if (!folderPath.startsWith(rootPath + File.separator)) return folderPath;
        return folderPath.substring(rootPath.length() + 1).replace(File.separatorChar, '/');
    }

    private static boolean contains(File root, File folder) {
        File a = canonical(root), b = canonical(folder);
        if (a == null || b == null) return false;
        return b.getAbsolutePath().equals(a.getAbsolutePath()) ||
                b.getAbsolutePath().startsWith(a.getAbsolutePath() + File.separator);
    }

    private static boolean same(File first, File second) {
        File a = canonical(first), b = canonical(second);
        return a != null && a.equals(b);
    }

    private static File canonical(File file) {
        if (file == null) return null;
        try { return file.getCanonicalFile(); }
        catch (IOException ignored) { return file.getAbsoluteFile(); }
    }

    private static SharedPreferences preferences() {
        Context context = MorpheSettingsRuntime.applicationContext();
        if (context == null) throw new IllegalStateException("Morphe settings were not initialized");
        return context.getSharedPreferences(MorpheSettingsRuntime.PREFERENCES_NAME, Context.MODE_PRIVATE);
    }
}
