package io.github.liongalahad.nuviotv.extension.settings;

import android.content.ContentResolver;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.os.storage.StorageManager;
import android.os.storage.StorageVolume;
import android.provider.DocumentsContract;
import android.util.Log;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

/** Shared storage-location preference used by patches that read or write local media. */
public final class MorpheStoragePath {
    private static final String LOG_TAG = "MorpheStorage";
    private static final byte[] PROBE_BYTES = new byte[]{
            0x4d, 0x6f, 0x72, 0x70, 0x68, 0x65, 0x2d, 0x53, 0x74, 0x6f, 0x72, 0x61, 0x67, 0x65
    };
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
        boolean saved = preferences().edit().putString(STORAGE_PATH_KEY, treeUri.toString()).commit();
        if (saved) MorpheStorageConsumers.notifyStorageChanged();
        return saved;
    }

    public static boolean setFolderPath(Context context, String folderPath) {
        if (folderPath == null || folderPath.trim().isEmpty()) return false;
        MorpheSettingsRuntime.initialize(context);
        boolean saved = preferences().edit().putString(
                STORAGE_PATH_KEY,
                Uri.fromFile(new File(folderPath)).toString()
        ).commit();
        if (saved) MorpheStorageConsumers.notifyStorageChanged();
        return saved;
    }

    public static Uri uri() {
        String stored = value();
        return stored == null || stored.isEmpty() ? Uri.fromFile(defaultFolder()) : Uri.parse(stored);
    }

    /** Whether the selected location currently permits creating and removing download files. */
    public static boolean isWritableSelection(Context context) {
        return context != null && isWritableSelection(context, uri());
    }

    public static boolean isWritableSelection(Context context, Uri location) {
        return isWritableSelection(context, location, false);
    }

    /** Whether the selected location currently has the read capability used by Local Media. */
    public static boolean isReadableSelection(Context context) {
        return context != null && isReadableSelection(context, uri());
    }

    public static boolean isReadableSelection(Context context, Uri location) {
        if (context == null || location == null) return false;
        if ("file".equalsIgnoreCase(location.getScheme())) {
            if (location.getPath() == null) return false;
            File folder = new File(location.getPath());
            return (hasRawReadAccess(context) || isOwnedAppSpecificFolder(context, folder)) &&
                    folder.isDirectory();
        }
        if (!"content".equalsIgnoreCase(location.getScheme())) return false;
        try {
            for (android.content.UriPermission permission :
                    context.getContentResolver().getPersistedUriPermissions()) {
                if (location.equals(permission.getUri()) && permission.isReadPermission()) return true;
            }
        } catch (RuntimeException ignored) { }
        return false;
    }

    /** The default download directory may be created on first use; saved selections may not. */
    public static boolean isWritableSelection(
            Context context,
            Uri location,
            boolean allowCreateDirectory
    ) {
        if (context == null || location == null) return false;
        if ("file".equalsIgnoreCase(location.getScheme())) {
            if (location.getPath() == null) return false;
            File folder = new File(location.getPath());
            return (hasRawWriteAccess(context) || isOwnedAppSpecificFolder(context, folder)) &&
                    prepareWritableDirectory(new File(location.getPath()), allowCreateDirectory);
        }
        if (!"content".equalsIgnoreCase(location.getScheme())) return false;
        try {
            for (android.content.UriPermission permission :
                    context.getContentResolver().getPersistedUriPermissions()) {
                if (location.equals(permission.getUri()) && permission.isWritePermission()) return true;
            }
        } catch (RuntimeException ignored) { }
        return false;
    }

    static boolean hasRawWriteAccess(Context context) {
        boolean allFilesAccess = Build.VERSION.SDK_INT >= Build.VERSION_CODES.R &&
                Environment.isExternalStorageManager();
        boolean legacyWriteAccess = context.checkSelfPermission(
                android.Manifest.permission.WRITE_EXTERNAL_STORAGE) == PackageManager.PERMISSION_GRANTED;
        return hasRawWriteAccess(Build.VERSION.SDK_INT, allFilesAccess, legacyWriteAccess);
    }

    static boolean hasRawWriteAccess(int sdk, boolean allFilesAccess, boolean legacyWriteAccess) {
        return sdk >= Build.VERSION_CODES.R ? allFilesAccess : legacyWriteAccess;
    }

    static boolean hasRawReadAccess(Context context) {
        boolean allFilesAccess = Build.VERSION.SDK_INT >= Build.VERSION_CODES.R &&
                Environment.isExternalStorageManager();
        boolean legacyReadAccess = context.checkSelfPermission(
                android.Manifest.permission.READ_EXTERNAL_STORAGE) == PackageManager.PERMISSION_GRANTED;
        return hasRawReadAccess(Build.VERSION.SDK_INT, allFilesAccess, legacyReadAccess);
    }

    static boolean hasRawReadAccess(int sdk, boolean allFilesAccess, boolean legacyReadAccess) {
        return sdk >= Build.VERSION_CODES.R ? allFilesAccess : legacyReadAccess;
    }

    /** Uses a real write/read/delete probe because readable and mounted do not imply writable. */
    static boolean isWritableDirectory(File folder) {
        return probeReadWriteDirectory(folder).success;
    }

    /** Result intended for a precise on-screen storage diagnostic. */
    static final class DirectoryProbeResult {
        final boolean success;
        final String code;
        final String message;

        private DirectoryProbeResult(boolean success, String code, String message) {
            this.success = success;
            this.code = code;
            this.message = message;
        }

        static DirectoryProbeResult passed() {
            return new DirectoryProbeResult(true, "PASS",
                    "Created, wrote, read and removed a temporary file.");
        }

        static DirectoryProbeResult failed(String code, String message) {
            return new DirectoryProbeResult(false, code, message);
        }

        String visibleMessage() {
            return "Storage test " + code + ": " + message;
        }
    }

    static DirectoryProbeResult probeReadWriteDirectory(File folder) {
        if (folder == null) return probeFailure("NO_FOLDER", "The folder is unavailable.", null);
        Log.i(LOG_TAG, "Read/write probe start: path=" + folder.getAbsolutePath() +
                " exists=" + folder.exists() + " directory=" + folder.isDirectory() +
                " readable=" + folder.canRead() + " writable=" + folder.canWrite());
        if (!folder.exists()) return probeFailure("NOT_FOUND", "The folder does not exist.", null);
        if (!folder.isDirectory()) {
            return probeFailure("NOT_DIRECTORY", "The selected path is not a folder.", null);
        }

        File probe = null;
        try {
            probe = File.createTempFile(".morphe-write-", ".tmp", folder);
        } catch (IOException | SecurityException error) {
            return probeFailure("CREATE_FAILED",
                    "Android did not allow a temporary file to be created here.", error);
        }

        try {
            try (FileOutputStream output = new FileOutputStream(probe)) {
                output.write(PROBE_BYTES);
                output.flush();
            }
        } catch (IOException | SecurityException error) {
            deleteProbe(probe);
            return probeFailure("WRITE_FAILED",
                    "A temporary file was created, but data could not be written.", error);
        }

        byte[] read = new byte[PROBE_BYTES.length];
        int count = 0;
        try (FileInputStream input = new FileInputStream(probe)) {
            while (count < read.length) {
                int next = input.read(read, count, read.length - count);
                if (next < 0) break;
                count += next;
            }
            if (input.read() != -1 || count != read.length || !Arrays.equals(PROBE_BYTES, read)) {
                deleteProbe(probe);
                return probeFailure("VERIFY_FAILED",
                        "The temporary file could not be read back correctly.", null);
            }
        } catch (IOException | SecurityException error) {
            deleteProbe(probe);
            return probeFailure("READ_FAILED",
                    "Data was written, but Android did not allow it to be read back.", error);
        }

        if (!deleteProbe(probe)) {
            return probeFailure("DELETE_FAILED",
                    "The test file worked but could not be removed.", null);
        }
        DirectoryProbeResult result = DirectoryProbeResult.passed();
        Log.i(LOG_TAG, result.visibleMessage() + " path=" + folder.getAbsolutePath());
        return result;
    }

    /** Verifies the exact persisted-tree API used by downloads, including cleanup. */
    static DirectoryProbeResult probeTreeReadWrite(Context context, Uri tree) {
        if (context == null || tree == null) {
            return probeFailure("NO_FOLDER", "The selected folder is unavailable.", null);
        }
        ContentResolver resolver = context.getContentResolver();
        Uri probe = null;
        try {
            Uri root = DocumentsContract.buildDocumentUriUsingTree(
                    tree, DocumentsContract.getTreeDocumentId(tree));
            probe = DocumentsContract.createDocument(
                    resolver,
                    root,
                    "application/octet-stream",
                    "Morphe-storage-test-" + System.currentTimeMillis() + ".tmp"
            );
            if (probe == null) {
                return probeFailure("CREATE_FAILED",
                        "The folder permission did not allow a test file to be created.", null);
            }
        } catch (IOException | RuntimeException error) {
            return probeFailure("CREATE_FAILED",
                    "The folder permission did not allow a test file to be created.", error);
        }

        try (OutputStream output = resolver.openOutputStream(probe, "w")) {
            if (output == null) {
                deleteTreeProbe(resolver, probe);
                return probeFailure("WRITE_FAILED", "The test file could not be opened.", null);
            }
            output.write(PROBE_BYTES);
            output.flush();
        } catch (IOException | RuntimeException error) {
            deleteTreeProbe(resolver, probe);
            return probeFailure("WRITE_FAILED", "The test file could not be written.", error);
        }

        byte[] read = new byte[PROBE_BYTES.length];
        int count = 0;
        try (InputStream input = resolver.openInputStream(probe)) {
            if (input == null) {
                deleteTreeProbe(resolver, probe);
                return probeFailure("READ_FAILED", "The test file could not be opened for reading.", null);
            }
            while (count < read.length) {
                int next = input.read(read, count, read.length - count);
                if (next < 0) break;
                count += next;
            }
            if (input.read() != -1 || count != read.length || !Arrays.equals(PROBE_BYTES, read)) {
                deleteTreeProbe(resolver, probe);
                return probeFailure("VERIFY_FAILED", "The test file could not be read back correctly.", null);
            }
        } catch (IOException | RuntimeException error) {
            deleteTreeProbe(resolver, probe);
            return probeFailure("READ_FAILED", "The test file could not be read back.", error);
        }

        if (!deleteTreeProbe(resolver, probe)) {
            return probeFailure("DELETE_FAILED", "The test file worked but could not be removed.", null);
        }
        return DirectoryProbeResult.passed();
    }

    private static boolean deleteProbe(File probe) {
        if (probe == null || !probe.exists()) return true;
        try {
            return probe.delete() || !probe.exists();
        } catch (SecurityException error) {
            Log.e(LOG_TAG, "Temporary probe cleanup threw " +
                    error.getClass().getSimpleName(), error);
            return false;
        }
    }

    private static boolean deleteTreeProbe(ContentResolver resolver, Uri probe) {
        try {
            return probe == null || DocumentsContract.deleteDocument(resolver, probe);
        } catch (IOException | RuntimeException error) {
            Log.e(LOG_TAG, "Document-tree probe cleanup failed", error);
            return false;
        }
    }

    private static DirectoryProbeResult probeFailure(String code, String message, Throwable error) {
        String detail = error == null ? "" : " (" + error.getClass().getSimpleName() +
                (error.getMessage() == null ? "" : ": " + error.getMessage()) + ")";
        DirectoryProbeResult result = DirectoryProbeResult.failed(code, message + detail);
        if (error == null) Log.w(LOG_TAG, result.visibleMessage());
        else Log.e(LOG_TAG, result.visibleMessage(), error);
        return result;
    }

    /** Writable app-owned directory on a specific storage root, or null when unavailable. */
    static File appSpecificDownloadsFolder(Context context, File storageRoot) {
        if (context == null || storageRoot == null) return null;
        File canonicalRoot = canonical(storageRoot);
        try {
            File[] appFolders = context.getExternalFilesDirs(null);
            if (appFolders != null) for (File appFolder : appFolders) {
                if (!same(canonicalRoot, storageRootForAppFolder(appFolder))) continue;
                File downloads = canonical(new File(appFolder, "Downloads"));
                if (downloads != null && (downloads.isDirectory() || downloads.mkdirs())) {
                    return downloads;
                }
            }
        } catch (RuntimeException ignored) { }

        File candidate = appSpecificDownloadsCandidate(
                canonicalRoot, context.getPackageName());
        try {
            return candidate != null && (candidate.isDirectory() || candidate.mkdirs())
                    ? canonical(candidate) : null;
        } catch (SecurityException ignored) {
            return null;
        }
    }

    static File appSpecificDownloadsCandidate(File storageRoot, String packageName) {
        if (storageRoot == null || packageName == null || packageName.trim().isEmpty()) return null;
        File appData = new File(new File(new File(storageRoot, "Android"), "data"), packageName);
        return new File(new File(appData, "files"), "Downloads");
    }

    static boolean isOwnedAppSpecificFolder(Context context, File folder) {
        if (context == null || folder == null) return false;
        return isOwnedAppSpecificFolder(
                folder, mountedStorageRoots(context), context.getPackageName());
    }

    static boolean isOwnedAppSpecificFolder(
            File folder,
            Iterable<File> storageRoots,
            String packageName
    ) {
        if (folder == null || storageRoots == null) return false;
        for (File root : storageRoots) {
            File candidate = appSpecificDownloadsCandidate(root, packageName);
            File appFiles = candidate == null ? null : candidate.getParentFile();
            if (contains(appFiles, folder)) return true;
        }
        return false;
    }

    private static String ownedAppFolderLabel(Context context, File folder) {
        if (context == null || folder == null) return null;
        for (File root : mountedStorageRoots(context)) {
            File downloads = appSpecificDownloadsCandidate(root, context.getPackageName());
            File appFiles = downloads == null ? null : downloads.getParentFile();
            if (!contains(appFiles, folder)) continue;
            String appLabel = "App";
            try {
                CharSequence label = context.getApplicationInfo().loadLabel(context.getPackageManager());
                if (label != null && !label.toString().trim().isEmpty()) {
                    appLabel = label.toString().trim();
                }
            } catch (RuntimeException ignored) { }
            String relative = relativePath(appFiles, folder);
            String suffix = relative.isEmpty() ? "" : "/" + relative;
            return storageDescription(context, root) + "/" + appLabel + suffix;
        }
        return null;
    }

    static Uri initialDocumentUriForPath(Context context, File folder) {
        File root = containingRoot(context, canonical(folder));
        if (root == null) return null;
        File primary = canonical(Environment.getExternalStorageDirectory());
        String documentId = documentIdForPath(root, primary, folder);
        if (documentId == null) return null;
        try {
            return DocumentsContract.buildDocumentUri(
                    "com.android.externalstorage.documents", documentId);
        } catch (RuntimeException ignored) {
            return null;
        }
    }

    static String documentIdForPath(File root, File primary, File folder) {
        File canonicalRoot = canonical(root);
        File canonicalFolder = canonical(folder);
        if (!contains(canonicalRoot, canonicalFolder)) return null;
        String volumeId = same(canonicalRoot, primary) ? "primary" : canonicalRoot.getName();
        return volumeId + ":" + relativePath(canonicalRoot, canonicalFolder);
    }

    static boolean prepareWritableDirectory(File folder, boolean allowCreateDirectory) {
        if (folder == null) return false;
        if (!folder.isDirectory() && (!allowCreateDirectory ||
                (!folder.mkdirs() && !folder.isDirectory()))) return false;
        return isWritableDirectory(folder);
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
        String ownedLabel = ownedAppFolderLabel(context, folder);
        if (ownedLabel != null) return ownedLabel;
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
