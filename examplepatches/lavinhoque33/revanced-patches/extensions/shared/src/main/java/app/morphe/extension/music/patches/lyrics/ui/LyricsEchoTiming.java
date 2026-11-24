/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-23.
 */

package app.morphe.extension.music.patches.lyrics.ui;

import androidx.annotation.Nullable;

import java.util.List;

import app.morphe.extension.music.patches.lyrics.LyricsLine;
import app.morphe.extension.music.patches.lyrics.requests.LrcParser;

/** Keeps a sequential echo's highlight separate from the row it is grouped in. */
final class LyricsEchoTiming {
    private LyricsEchoTiming() {
    }

    static boolean hasSameLyrics(LyricsLine first, LyricsLine second) {
        String text = LrcParser.cleanTextForComparison(first.text());
        return !text.isEmpty() && text.equals(LrcParser.cleanTextForComparison(second.text()));
    }

    /** Only lines in a timed repeat get a window; other vocals keep their normal handoff. */
    @Nullable
    static Window[] buildWindows(List<LyricsLine> lines, boolean[] grouped) {
        Window[] windows = null;
        boolean repeatsPrevious = false;
        for (int index = 0; index < lines.size(); index++) {
            LyricsLine line = lines.get(index);
            int nextIndex = index + 1;
            LyricsLine next = nextIndex < lines.size() ? lines.get(nextIndex) : null;
            long start = line.startTimeMs();
            long nextStart = next == null ? LyricsLine.NO_TIME : next.startTimeMs();
            boolean nextRepeats = next != null && grouped[nextIndex]
                    && start != LyricsLine.NO_TIME && nextStart > start && hasSameLyrics(line, next);
            if (repeatsPrevious || nextRepeats) {
                if (windows == null) {
                    windows = new Window[lines.size()];
                }
                long end = line.endTimeMs();
                if (end <= start && line.hasWords()) {
                    end = line.words().get(line.words().size() - 1).endMs();
                }
                if (end <= start) {
                    end = LrcParser.estimateEndMs(start,
                            nextStart > start ? nextStart : LyricsLine.NO_TIME, line.text());
                }
                windows[index] = new Window(start, nextRepeats ? Math.min(end, nextStart) : end);
            }
            repeatsPrevious = nextRepeats;
        }
        return windows;
    }

    record Window(long startMs, long endMs) {
        boolean contains(long positionMs) {
            return positionMs >= startMs && positionMs < endMs;
        }
    }
}
