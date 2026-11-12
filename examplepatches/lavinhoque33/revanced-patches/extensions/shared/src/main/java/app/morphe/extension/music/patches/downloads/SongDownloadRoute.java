/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-10.
 * Written by lavinhoque33, 2026-11-10.
 */
package app.morphe.extension.music.patches.downloads;

/** Who handles a song's Download tap, from the global method and the tapped place's external override. */
public enum SongDownloadRoute {
    /** This patch downloads the song (a stream copy or a device file), or removes the stream copy it has. */
    OURS,
    /** The external downloader app gets the song. */
    EXTERNAL_APP,
    /** The app's own Download (Premium) or upsell stays untouched. */
    STOCK;

    /**
     * @param streamSupported  Whether the stream copy hooks resolved in this app version. Where they did not, the
     *                         stream method leaves the Download to the app.
     * @param externalOverride Whether the external downloader is switched on for the place that was tapped (the
     *                         player button or the song menu), which only applies to the delegated method.
     */
    public static SongDownloadRoute of(DownloadMethod method, boolean streamSupported, boolean externalOverride) {
        return switch (method) {
            case STREAM -> streamSupported ? OURS : STOCK;
            case DEVICE_FILES -> OURS;
            case DELEGATED -> externalOverride ? EXTERNAL_APP : STOCK;
        };
    }
}
