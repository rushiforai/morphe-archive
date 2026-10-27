/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.ContentValues;

import java.io.File;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Where photos and videos go when they're saved to the gallery (#30). On Android 10 and up,
 * Telegram's Save to gallery and its live photo save fill a ContentValues for MediaStore, and every
 * string they put in it comes through {@link #put}. Only Telegram's two gallery folders are swapped,
 * for the ones picked in {@link Settings#GALLERY_FOLDER}. The file name, its type and the Images or
 * Video collection stay Telegram's, so MediaStore still numbers a file whose name is taken and
 * Telegram still removes a write that failed. Both collections take DCIM on every Android that
 * gets here. On Android 9 and older the same saves copy the file into a folder {@link #older} moves
 * the same way. Camera shots and automatic saving keep Telegram's folders: those files are
 * Telegram's own download cache, which its Clear cache empties.
 */
public final class GalleryFolder {
    /** Telegram's own Pictures/Telegram and Movies/Telegram. */
    public static final String TELEGRAM = "";
    /** Photos and videos together in DCIM/Telegram. */
    public static final String DCIM = "dcim";
    /** Photos in DCIM/Telegram/Photos and videos in DCIM/Telegram/Videos. */
    public static final String DCIM_APART = "dcim-apart";
    /** Every choice, in the order the settings list shows them. */
    public static final List<String> CHOICES = Collections.unmodifiableList(Arrays.asList(TELEGRAM, DCIM, DCIM_APART));

    /** MediaStore.MediaColumns.RELATIVE_PATH, and the two values Telegram gives it for the gallery. */
    static final String RELATIVE_PATH = "relative_path";
    static final String PICTURES = "Pictures/Telegram/";
    static final String MOVIES = "Movies/Telegram/";

    private GalleryFolder() {}

    /** Called in place of ContentValues.put(String, String) in Telegram's gallery saves. */
    public static void put(ContentValues values, String key, String value) {
        values.put(key, folder(key, value));
    }

    /**
     * Called on the File Telegram copies a gallery save into before Android 10, right after it's made:
     * Pictures/Telegram or Movies/Telegram under the shared storage. Gives the folder the choice puts it
     * in, under the same storage, and any other folder back as it came.
     */
    public static File older(File folder) {
        File parent = folder.getParentFile();
        File storage = parent == null ? null : parent.getParentFile();
        if (storage == null || !"Telegram".equals(folder.getName())) return folder;
        String value = "Pictures".equals(parent.getName()) ? PICTURES : "Movies".equals(parent.getName()) ? MOVIES : null;
        if (value == null) return folder;
        String moved = folder(RELATIVE_PATH, value);
        return moved.equals(value) ? folder : new File(storage, moved);
    }

    /** The value to save under [key]: a gallery folder the choice moves, else what Telegram gave. */
    static String folder(String key, String value) {
        if (!RELATIVE_PATH.equals(key) || !(PICTURES.equals(value) || MOVIES.equals(value))) return value;
        HookStatus.invoked(FamilyNames.SAVE_DOWNLOADS);
        try {
            String moved = folderFor(choice(), PICTURES.equals(value));
            if (moved == null) return value;
            HookStatus.counted(FamilyNames.SAVE_DOWNLOADS, "gallery folder");
            return moved;
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.SAVE_DOWNLOADS, "gallery folder", t);
            return value;
        }
    }

    /** The folder a choice puts a photo or a video in, or null for Telegram's own. */
    static String folderFor(String choice, boolean photo) {
        if (DCIM.equals(choice)) return "DCIM/Telegram/";
        if (DCIM_APART.equals(choice)) return photo ? "DCIM/Telegram/Photos/" : "DCIM/Telegram/Videos/";
        return null;
    }

    /** The saved choice, or Telegram's folders while paused, before the settings load or when unreadable. */
    static String choice() {
        if (!Utils.settingsReady()) return TELEGRAM;
        String saved = Settings.GALLERY_FOLDER.get();
        return allowed(saved) ? saved : TELEGRAM;
    }

    /** Whether a value is one of the choices. Anything else, a path typed into a file included, isn't. */
    public static boolean allowed(String value) {
        return value != null && CHOICES.contains(value);
    }
}
