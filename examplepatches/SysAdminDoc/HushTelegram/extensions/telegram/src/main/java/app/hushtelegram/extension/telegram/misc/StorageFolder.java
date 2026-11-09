/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.Manifest;
import android.app.AppOpsManager;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.media.MediaScannerConnection;
import android.os.Build;
import android.os.Environment;
import android.os.Process;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.function.Function;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Where Telegram keeps its own Telegram Images, Video, Audio, Documents, Files and Stories (#7).
 * From Android 11 Telegram puts them under Android/data, which file managers and other apps can't
 * reach. With {@link Settings#STORAGE_FOLDER} on and All files access granted, {@link #telegramFolder}
 * hands Telegram a folder in Internal storage instead, the way it worked before Android 11 and the
 * way Plus Messenger does it. {@link Settings#STORAGE_FOLDER_NAME} names it, Telegram by default.
 * Telegram reads the folder once when it sets up its paths, so a change takes a restart. Files
 * already downloaded stay where they were, and {@link #olderFile} still finds them there.
 */
public final class StorageFolder {
    /** How long a hook that runs before the app's settings load waits for them. */
    static long startupWaitMillis = 10_000L;
    /** AppOpsManager.OPSTR_MANAGE_EXTERNAL_STORAGE, which the SDK keeps hidden. */
    private static final String MANAGE_EXTERNAL_STORAGE_OP = "android:manage_external_storage";
    /** The folder when {@link Settings#STORAGE_FOLDER_NAME} names none. */
    public static final String DEFAULT_NAME = "Telegram";
    /** The longest name the row takes, well inside what a phone's storage allows. */
    static final int MAX_NAME_CHARS = 64;
    /** Enough folders to look through for an older file without slowing every missing one down. */
    static final int MAX_EARLIER = 8;
    /** The characters Android's shared storage refuses in a folder's name. */
    private static final String REFUSED = "\\:*?\"<>|";
    private static final String EARLIER_KEY = "earlier";
    static final String NO_MEDIA = ".nomedia";
    /** Android's own folders at the top of Internal storage, which hold the user's other files too. */
    private static final Set<String> SHARED_FOLDERS = new HashSet<>(Arrays.asList("alarms", "audiobooks", "dcim",
            "documents", "download", "movies", "music", "notifications", "pictures", "podcasts", "recordings",
            "ringtones", "screenshots"));
    /** The folders Telegram makes inside its own for photos, videos, sound and files. */
    static final String[] TELEGRAM_FOLDERS = {"Telegram Images", "Telegram Video", "Telegram Audio",
            "Telegram Documents", "Telegram Files", "Telegram Stories"};
    /** Telegram's own folder, the one it moved to, then the ones it was moved to before, or null while it hasn't moved. */
    static volatile File[] moved;
    /** Remembers the folders Telegram has used. It isn't a setting, so a settings file doesn't carry it. */
    static Function<Context, SharedPreferences> store =
            context -> context.getSharedPreferences("hushtelegram_storage_folders", Context.MODE_PRIVATE);

    private StorageFolder() {}

    /**
     * Called on the folder ImageLoader.createMediaPaths makes for Telegram's files on Android 11 and
     * up, right before Telegram keeps it. Gives the named folder in Internal storage when it's
     * chosen and reachable, and anything else back as it came.
     */
    public static File telegramFolder(File folder) {
        HookStatus.invoked(FamilyNames.SAVE_DOWNLOADS);
        try {
            // Telegram sets up its folders on its own queue, sometimes before the settings have loaded.
            boolean chosen = Utils.awaitSettingsReady(startupWaitMillis) && Settings.STORAGE_FOLDER.get();
            String name = chosen ? name() : DEFAULT_NAME;
            File chosenFolder = folderFor(folder, Build.VERSION.SDK_INT, chosen, chosen && allFilesAccess(),
                    chosen ? Environment.getExternalStorageDirectory() : null, name);
            moved = chosenFolder == folder ? null : places(folder, chosenFolder);
            if (chosenFolder == folder) return folder;
            HookStatus.counted(FamilyNames.SAVE_DOWNLOADS, "storage folder");
            keepOutOfGallery(chosenFolder, name);
            return chosenFolder;
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.SAVE_DOWNLOADS, "storage folder", t);
            moved = null;
            return folder;
        }
    }

    /**
     * Called on the path FileLoader.getPathToAttach makes for a downloaded file, right before it
     * hands it back, and on the one FileLoadOperation.start makes for a photo or video it's about
     * to load, right before it checks it. Once Telegram's folder has moved, a file it downloaded
     * earlier is still in the old one under Android/data, so a path that isn't there in the moved
     * folder but is in the old one gives the old one, and Telegram opens it instead of downloading
     * it again. An older file at the wrong size is downloaded again where it is. Anything else
     * comes back as it came, so new downloads still go in the moved folder. A folder it was moved
     * to before, under another name, counts the same way.
     */
    public static File olderFile(File file) {
        File[] places = moved;
        if (places == null || file == null) return file;
        try {
            for (int i = 0; i < places.length; i++) {
                if (i == 1) continue;
                File older = olderFor(file, places[i], places[1]);
                if (older == file) continue;
                HookStatus.counted(FamilyNames.SAVE_DOWNLOADS, "older file");
                return older;
            }
            return file;
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.SAVE_DOWNLOADS, "older file", t);
            return file;
        }
    }

    /** [file] under [from] instead of [to] when it's under [to], missing there and present in [from], else [file]. */
    static File olderFor(File file, File from, File to) {
        String root = to.getPath() + File.separator;
        String path = file.getPath();
        if (!path.startsWith(root) || file.exists()) return file;
        File older = new File(from, path.substring(root.length()));
        return older.isFile() ? older : file;
    }

    /**
     * The folder Telegram's files go in: [storage]/[name] when it's chosen, Android 11 or up with
     * All files access and the folder can be made, else [folder] itself.
     */
    static File folderFor(File folder, int sdk, boolean chosen, boolean access, File storage, String name) {
        if (folder == null || sdk < Build.VERSION_CODES.R || !chosen || !access || storage == null) return folder;
        File moved = new File(storage, name);
        if (!moved.mkdirs() && !moved.isDirectory()) return folder;
        return moved;
    }

    /**
     * Keeps the moved folder out of the gallery and music apps (#60). Nothing indexes Android/data,
     * so there a photo only reached the gallery when Save to Gallery copied it out. Internal storage
     * is indexed, so the moved folder needs a .nomedia to stay out the same way. Files the gallery
     * already found are scanned again once, when the .nomedia is new, so it drops them too.
     */
    private static void keepOutOfGallery(File folder, String name) {
        try {
            if (!hideFromGallery(folder, name)) return;
            Context context = Utils.getContext();
            if (context != null) MediaScannerConnection.scanFile(context, new String[] {folder.getPath()}, null, null);
            HookStatus.counted(FamilyNames.SAVE_DOWNLOADS, "kept out of the gallery");
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.SAVE_DOWNLOADS, "kept out of the gallery", t);
        }
    }

    /**
     * Puts a .nomedia in the moved folder, true when one is new. A folder of its own gets it at its
     * top. A folder inside one of Android's shared folders gets it in each of Telegram's folders
     * instead, so the user's other files there still show, along with the copies Save to Gallery
     * and Save to Downloads make. Telegram Images and Telegram Video under Internal storage/Telegram
     * aren't enough: Telegram deletes the .nomedia in those two at every start.
     */
    static boolean hideFromGallery(File folder, String name) throws IOException {
        List<File> hidden = new ArrayList<>();
        if (SHARED_FOLDERS.contains(name.split("/", 2)[0].toLowerCase(Locale.ROOT))) {
            for (String inside : TELEGRAM_FOLDERS) hidden.add(new File(folder, inside));
        } else {
            hidden.add(folder);
        }
        boolean made = false;
        for (File each : hidden) {
            if (!each.mkdirs() && !each.isDirectory()) continue;
            made |= new File(each, NO_MEDIA).createNewFile();
        }
        return made;
    }

    /** The saved name, or Telegram's when there's none or it isn't one the row would save. */
    static String name() {
        String saved = Settings.STORAGE_FOLDER_NAME.get();
        return saved.isEmpty() || !allowedName(saved) ? DEFAULT_NAME : saved;
    }

    /**
     * Telegram's folder and the one it moved to, then the other folders it was moved to before.
     * The one it moved to goes on record for the next time the name changes.
     */
    private static File[] places(File folder, File chosen) {
        List<File> places = new ArrayList<>();
        places.add(folder);
        places.add(chosen);
        try {
            Context context = Utils.getContext();
            if (context == null) return places.toArray(new File[0]);
            SharedPreferences saved = store.apply(context);
            Set<String> earlier = new HashSet<>(saved.getStringSet(EARLIER_KEY, Collections.emptySet()));
            for (String path : earlier) {
                if (!path.equals(chosen.getPath())) places.add(new File(path));
            }
            if (earlier.size() < MAX_EARLIER && earlier.add(chosen.getPath())) {
                saved.edit().putStringSet(EARLIER_KEY, earlier).apply();
            }
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.SAVE_DOWNLOADS, "earlier folders", t);
        }
        return places.toArray(new File[0]);
    }

    /**
     * What was typed as a saved name: no spaces or slashes at either end, and a whole path to
     * Internal storage cut down to the part under it, since that's how a file manager shows it.
     */
    public static String cleanName(String text) {
        if (text == null) return "";
        String name = text.trim();
        String lower = name.toLowerCase(Locale.ROOT);
        for (String root : new String[] {"/storage/emulated/0/", "storage/emulated/0/", "/sdcard/", "sdcard/"}) {
            if (lower.startsWith(root)) {
                name = name.substring(root.length());
                break;
            }
        }
        int start = 0;
        int end = name.length();
        while (start < end && name.charAt(start) == '/') start++;
        while (end > start && name.charAt(end - 1) == '/') end--;
        return name.substring(start, end).trim();
    }

    /**
     * Whether a name is one the row would save: empty for Telegram's, or a folder under Internal
     * storage. Never one that climbs out with "..", and never Android, which no app can make folders in.
     */
    public static boolean allowedName(String name) {
        if (name == null) return false;
        if (name.isEmpty()) return true;
        if (name.length() > MAX_NAME_CHARS) return false;
        String[] parts = name.split("/", -1);
        if (parts[0].equalsIgnoreCase("Android")) return false;
        for (String part : parts) {
            if (part.isEmpty() || part.endsWith(".") || !part.equals(part.trim())) return false;
        }
        for (int i = 0; i < name.length(); i++) {
            char c = name.charAt(i);
            int type = Character.getType(c);
            if (REFUSED.indexOf(c) >= 0 || type == Character.CONTROL || type == Character.FORMAT) return false;
        }
        return true;
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
