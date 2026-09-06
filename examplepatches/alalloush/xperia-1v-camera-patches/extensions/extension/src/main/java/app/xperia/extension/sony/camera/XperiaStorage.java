package app.xperia.extension.sony.camera;

import android.content.Context;
import android.os.Environment;
import android.os.storage.StorageManager;
import android.os.storage.StorageVolume;

import java.io.File;

/**
 * LineageOS pdx234 cannot provision Android/data/<pkg>/files (StorageManagerService.mkdirs "Failed to
 * prepare"), so Context.getExternalFilesDirs() yields a null primary entry and the Sony camera apps decide
 * "no memory". These wrappers replace the StorageUtil call sites: when the platform gives nothing, fall back
 * to a directory under the app's internal storage and report it as the primary (internal) volume. Photos are
 * saved through MediaStore and are unaffected; the directory only hosts the writability probe and temp files.
 */
@SuppressWarnings("unused")
public final class XperiaStorage {
    private static final String INTERNAL_PREFIX = "/data/";

    private XperiaStorage() {
    }

    /** Injection point: replaces Context.getExternalFilesDirs(type). */
    public static File[] externalFilesDirs(Context context, String type) {
        File[] dirs = context.getExternalFilesDirs(type);
        // ContextImpl.ensureExternalDirsExistOrFilter() nulls entries it could not create; index 0 is the
        // primary (internal) volume.
        if (dirs != null && dirs.length > 0 && dirs[0] != null) {
            return dirs;
        }
        File fallback = new File(context.getFilesDir(), "external/" + (type == null ? "" : type));
        //noinspection ResultOfMethodCallIgnored
        fallback.mkdirs();
        return new File[]{fallback};
    }

    /** Injection point: replaces StorageManager.getStorageVolume(file). */
    public static StorageVolume storageVolume(StorageManager manager, File file) {
        StorageVolume volume = manager.getStorageVolume(file);
        if (volume == null && isFallback(file)) {
            return manager.getPrimaryStorageVolume();
        }
        return volume;
    }

    /** Injection point: replaces Environment.isExternalStorageRemovable(file), which throws for the fallback. */
    public static boolean isExternalStorageRemovable(File file) {
        if (isFallback(file)) {
            return false;
        }
        return Environment.isExternalStorageRemovable(file);
    }

    private static boolean isFallback(File file) {
        return file != null && file.getPath().startsWith(INTERNAL_PREFIX);
    }
}
