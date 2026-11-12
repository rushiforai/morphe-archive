/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 * Modified by lavinhoque33, 2026-11-10.
 */
package app.morphe.extension.music.patches.downloads;

import java.util.function.BooleanSupplier;

/**
 * What any download request does, from the one global method. The mode is decided once
 * when a download is requested and is never a mix: a download writes a local file or keeps a stream copy, not both.
 * Contains no Android code.
 */
enum DownloadMode {
    /** Not ours: the external app, or the stock behaviour, handles the request. */
    OFF,
    /** A file in Music/RVX, a MediaStore row and a playlist in Device files; no stream copy. */
    LOCAL_FILES,
    /** The private stream copy only: no file, no MediaStore row, no playlist rows. */
    STREAM_COPY;

    /** What is left to do for one track. */
    enum Work {
        SKIP,
        /** Write the local file. */
        LOCAL_FILE,
        /** Keep the stream copy. */
        STREAM_COPY;

        boolean writesLocalFile() {
            return this == LOCAL_FILE;
        }

        boolean keepsStreamCopy() {
            return this == STREAM_COPY;
        }
    }

    /**
     * A stream copy needs the playback hooks of the stream swap: where they did not resolve, the download stays
     * with the app. This decision is identical for a song, an album and a playlist.
     */
    static DownloadMode of(DownloadMethod method, boolean streamSupported) {
        return switch (method) {
            case STREAM -> streamSupported ? STREAM_COPY : OFF;
            case DEVICE_FILES -> LOCAL_FILES;
            case DELEGATED -> OFF;
        };
    }

    /** True when the mode writes local files (Music/RVX, MediaStore, playlists in Device files). */
    boolean localFiles() {
        return this == LOCAL_FILES;
    }

    /** True when the mode keeps a private stream copy. */
    boolean streamCopy() {
        return this == STREAM_COPY;
    }

    /**
     * What a track still needs. The lookups are only asked for what the mode cares about, because both can be
     * slow (a MediaStore query, hashing a stream copy): a file download is skipped when the native track exists, a
     * stream download when a valid stream copy exists.
     */
    Work plan(BooleanSupplier nativeTrackExists, BooleanSupplier streamCopyExists) {
        return switch (this) {
            case LOCAL_FILES -> nativeTrackExists.getAsBoolean() ? Work.SKIP : Work.LOCAL_FILE;
            case STREAM_COPY -> streamCopyExists.getAsBoolean() ? Work.SKIP : Work.STREAM_COPY;
            case OFF -> Work.SKIP;
        };
    }
}
