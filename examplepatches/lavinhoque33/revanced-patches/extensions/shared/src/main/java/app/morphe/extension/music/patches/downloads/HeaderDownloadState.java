/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-10.
 */
package app.morphe.extension.music.patches.downloads;

/**
 * What the Download button of a playlist or album header shows and does. A list is saved for the header once every
 * track has its stream copy and its download has finished: its videos are saved after its audio, so while the
 * download runs the header keeps the plain Download button and a tap says it is in progress, never Remove.
 */
final class HeaderDownloadState {
    enum Tap {
        /** Start the download. */
        DOWNLOAD,
        /** Ask whether to remove the downloaded list. */
        REMOVE,
        /** A download of the list is running; say so. */
        IN_PROGRESS
    }

    private HeaderDownloadState() {}

    /**
     * @param registered Every available track of the list has a stream copy.
     * @param running    A download of the list is running.
     */
    static boolean isSaved(boolean registered, boolean running) {
        return registered && !running;
    }

    /**
     * @param streamCopy Playlist downloads save stream copies.
     * @param saved      {@link #isSaved}.
     * @param running    A download of the list is running.
     */
    static Tap tapOf(boolean streamCopy, boolean saved, boolean running) {
        if (running) return Tap.IN_PROGRESS;

        return streamCopy && saved ? Tap.REMOVE : Tap.DOWNLOAD;
    }
}
