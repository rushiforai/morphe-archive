/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.download;

import android.net.Uri;
import android.os.Environment;
import android.provider.MediaStore;

import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Utils;

/**
 * The top folder saves go to, with the {@link SaveFolder} under it: Movies for a video and
 * Pictures for a photo, as Facebook's own save does, or DCIM or Download for both (#42), for a
 * gallery that shows only the camera's folder or a file manager's Downloads.
 *
 * <p>Each goes through the MediaStore collection Android lets that folder into. The Video and
 * Images collections take Movies, Pictures and DCIM, and refuse Download; only the Downloads
 * collection takes it. A save's pending row is kept by its whole address, collection and all, so
 * the sweep after a stopped save removes it from whichever one it's in ({@link SaveLeftovers}).
 */
public enum SaveTo {
    MOVIES_AND_PICTURES("movies_pictures"),
    DCIM("dcim"),
    DOWNLOAD("download");

    /** What a settings file holds for this value. It never changes once written. */
    public final String fileValue;

    SaveTo(String fileValue) {
        this.fileValue = fileValue;
    }

    /** The top folder a video ([video] true) or a photo goes to. */
    public String directory(boolean video) {
        switch (this) {
            case DCIM:
                return Environment.DIRECTORY_DCIM;
            case DOWNLOAD:
                return Environment.DIRECTORY_DOWNLOADS;
            default:
                return video ? Environment.DIRECTORY_MOVIES : Environment.DIRECTORY_PICTURES;
        }
    }

    /** The MediaStore collection that takes a video ([video] true) or a photo under {@link #directory}. */
    Uri collection(boolean video) {
        if (this == DOWNLOAD) return MediaStore.Downloads.EXTERNAL_CONTENT_URI;
        return video ? MediaStore.Video.Media.EXTERNAL_CONTENT_URI : MediaStore.Images.Media.EXTERNAL_CONTENT_URI;
    }

    /** Where the next save goes. Never throws, and answers the default when settings can't be read. */
    public static SaveTo current() {
        try {
            if (!Utils.settingsReady()) return MOVIES_AND_PICTURES;
            SaveTo chosen = Settings.SAVE_TO.get();
            return chosen == null ? MOVIES_AND_PICTURES : chosen;
        } catch (Throwable t) {
            return MOVIES_AND_PICTURES;
        }
    }

    /** The value a settings file names, or null when it names none this build knows. */
    public static SaveTo fromFile(Object value) {
        if (!(value instanceof String)) return null;
        for (SaveTo to : values()) {
            if (to.fileValue.equals(value)) return to;
        }
        return null;
    }
}
