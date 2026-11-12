/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-10.
 * Written by lavinhoque33, 2026-11-10.
 */
package app.morphe.extension.music.patches.downloads;

/** One saved choice for every song, album and playlist Download. */
public enum DownloadMethod {
    /** Private stream copies; songs keep audio, playlists also keep their paired videos. */
    STREAM,
    /** Audio files in Music/RVX, with playlists in the Device files library. */
    DEVICE_FILES,
    /** Stock Download, or an enabled external override for single songs only. */
    DELEGATED
}
