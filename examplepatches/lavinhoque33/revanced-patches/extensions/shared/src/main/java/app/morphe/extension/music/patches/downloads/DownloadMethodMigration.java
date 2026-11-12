/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-10.
 * Written by lavinhoque33, 2026-11-10.
 */
package app.morphe.extension.music.patches.downloads;

import androidx.annotation.Nullable;

/** Resolves older download preferences once, without touching any saved media. Contains no Android code. */
public final class DownloadMethodMigration {
    private DownloadMethodMigration() {}

    /**
     * An existing global choice wins, including STREAM when its default value was removed from preferences.
     * Missing old list values mean their STREAM default. Mixed lists prefer STREAM, then DEVICE_FILES, then
     * delegation. Only installations without the lists use the older file/copy switches and external overrides.
     */
    public static DownloadMethod resolve(@Nullable DownloadMethod global, boolean migrated,
                                         @Nullable String songs, @Nullable String playlists, boolean hadLists,
                                         boolean files, boolean copies, boolean externalButton, boolean externalMenu) {
        if (global != null) return global;
        if (migrated) return DownloadMethod.STREAM;

        if (hadLists || songs != null || playlists != null) {
            if (songs == null || playlists == null || "STREAM".equals(songs) || "STREAM".equals(playlists)) {
                return DownloadMethod.STREAM;
            }
            if ("DEVICE_FILE".equals(songs) || "DEVICE_FILES".equals(playlists)) {
                return DownloadMethod.DEVICE_FILES;
            }
            return DownloadMethod.DELEGATED;
        }

        if (copies) return DownloadMethod.STREAM;
        if (files) return DownloadMethod.DEVICE_FILES;
        return externalButton || externalMenu ? DownloadMethod.DELEGATED : DownloadMethod.STREAM;
    }
}
