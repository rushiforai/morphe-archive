/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 */
package app.morphe.extension.music.patches.downloads;

import androidx.annotation.Nullable;

import java.util.List;

import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.utils.Logger;

/**
 * Debug log (only with debug logging on) of an album page: one line each time the result of the page scan changes,
 * at most {@link #MAX_LINES} per process, never one per scroll pass. Main thread only.
 */
final class DownloadedAlbumLog {
    private static final int MAX_LINES = 40;

    private static int linesLeft = MAX_LINES;

    private DownloadedAlbumLog() {}

    static boolean enabled() {
        return BaseSettings.DEBUG.get();
    }

    /** What one page remembers of what it logged, so that a line is only repeated when it changed. */
    static final class PageLog {
        private String last = "";

        void reset() {
            last = "";
        }

        /** The scan marked the rows with these track numbers. Call only when {@link #enabled()}. */
        void marked(@Nullable String source, int recorded, List<Integer> numbers) {
            log("Album page rows: source=" + source + " recorded=" + recorded + " marked=" + numbers);
        }

        /** The scan marked nothing, for this reason. Call only when {@link #enabled()}. */
        void declined(@Nullable String source, int recorded, String reason) {
            log("Album page rows: source=" + source + " recorded=" + recorded + " | declined:" + reason);
        }

        private void log(String line) {
            if (line.equals(last) || linesLeft <= 0) return;

            last = line;
            linesLeft--;
            Logger.printDebug(() -> line);
        }
    }
}
