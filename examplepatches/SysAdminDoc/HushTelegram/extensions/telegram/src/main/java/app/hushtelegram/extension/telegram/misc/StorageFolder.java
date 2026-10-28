/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.Manifest;
import android.app.AppOpsManager;
import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Environment;
import android.os.Process;

import java.io.File;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Where Telegram keeps its own Telegram Images, Video, Audio, Documents, Files and Stories (#7).
 * From Android 11 Telegram puts them under Android/data, which file managers and other apps can't
 * reach. With {@link Settings#STORAGE_FOLDER} on and All files access granted, {@link #telegramFolder}
 * hands Telegram Internal storage/Telegram instead, the way it worked before Android 11 and the way
 * Plus Messenger does it. Telegram reads the folder once when it sets up its paths, so a change
 * takes a restart. Files already downloaded stay where they were.
 */
public final class StorageFolder {
    /** How long a hook that runs before the app's settings load waits for them. */
    static long startupWaitMillis = 10_000L;
    /** AppOpsManager.OPSTR_MANAGE_EXTERNAL_STORAGE, which the SDK keeps hidden. */
    private static final String MANAGE_EXTERNAL_STORAGE_OP = "android:manage_external_storage";

    private StorageFolder() {}

    /**
     * Called on the folder ImageLoader.createMediaPaths makes for Telegram's files on Android 11 and
     * up, right before Telegram keeps it. Gives Internal storage/Telegram when it's chosen and
     * reachable, and anything else back as it came.
     */
    public static File telegramFolder(File folder) {
        HookStatus.invoked(FamilyNames.SAVE_DOWNLOADS);
        try {
            // Telegram sets up its folders on its own queue, sometimes before the settings have loaded.
            boolean chosen = Utils.awaitSettingsReady(startupWaitMillis) && Settings.STORAGE_FOLDER.get();
            File moved = folderFor(folder, Build.VERSION.SDK_INT, chosen, chosen && allFilesAccess(),
                    chosen ? Environment.getExternalStorageDirectory() : null);
            if (moved == folder) return folder;
            HookStatus.counted(FamilyNames.SAVE_DOWNLOADS, "storage folder");
            return moved;
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.SAVE_DOWNLOADS, "storage folder", t);
            return folder;
        }
    }

    /**
     * The folder Telegram's files go in: [storage]/Telegram when it's chosen, Android 11 or up with
     * All files access and the folder can be made, else [folder] itself.
     */
    static File folderFor(File folder, int sdk, boolean chosen, boolean access, File storage) {
        if (folder == null || sdk < Build.VERSION_CODES.R || !chosen || !access || storage == null) return folder;
        File moved = new File(storage, "Telegram");
        if (!moved.mkdirs() && !moved.isDirectory()) return folder;
        return moved;
    }

    /**
     * Whether Android lets Telegram reach every folder in its shared storage. It's the app op check
     * Environment.isExternalStorageManager() makes, read from AppOpsManager itself, since that one
     * first takes the phone's storage volume list and throws when the list comes back empty.
     */
    public static boolean allFilesAccess() {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.R) return false;
        Context context = Utils.getContext();
        AppOpsManager appOps = context == null ? null : context.getSystemService(AppOpsManager.class);
        if (appOps == null) return false;
        int uid = context.getApplicationInfo().uid;
        switch (appOps.unsafeCheckOpNoThrow(MANAGE_EXTERNAL_STORAGE_OP, uid, context.getPackageName())) {
            case AppOpsManager.MODE_ALLOWED:
                return true;
            case AppOpsManager.MODE_DEFAULT:
                return context.checkPermission(Manifest.permission.MANAGE_EXTERNAL_STORAGE, Process.myPid(), uid)
                        == PackageManager.PERMISSION_GRANTED;
            default:
                return false;
        }
    }
}
