/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-23.
 */

package app.morphe.extension.music.patches.lyrics.ui;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import org.junit.Test;

import java.util.List;

import app.morphe.extension.music.patches.lyrics.LyricsLine;

public final class LyricsEchoTimingTest {
    @Test
    public void repeatedChorusHighlightsOnlyTheLineWhoseTimestampHasArrived() {
        final String chorus = "TOMA TOMA NO BAILÃO";
        List<LyricsLine> lines = List.of(
                new LyricsLine(1_000, 4_650, chorus, List.of()),
                new LyricsLine(2_200, 4_650, chorus, List.of()),
                new LyricsLine(3_400, 4_650, chorus, List.of()),
                new LyricsLine(4_700, "Next verse"));

        LyricsEchoTiming.Window[] windows = LyricsEchoTiming.buildWindows(lines,
                new boolean[]{false, true, true, false});
        assertNotNull(windows);
        assertNull(windows[3]);
        assertActiveAt(windows, 999, -1);
        assertActiveAt(windows, 1_000, 0);
        assertActiveAt(windows, 2_199, 0);
        assertActiveAt(windows, 2_200, 1);
        assertActiveAt(windows, 3_399, 1);
        assertActiveAt(windows, 3_400, 2);
        assertActiveAt(windows, 4_649, 2);
        assertActiveAt(windows, 4_650, -1);
        assertActiveAt(windows, 2_200, 1); // Seeking back must not keep the later echo lit.
    }

    @Test
    public void differentOrSimultaneousBackingVocalsKeepTheirExistingHandoff() {
        List<LyricsLine> lines = List.of(
                new LyricsLine(1_000, "Lead"),
                new LyricsLine(1_000, "Lead"),
                new LyricsLine(1_600, "Harmony"));

        assertNull(LyricsEchoTiming.buildWindows(lines, new boolean[]{false, true, true}));
    }

    private static void assertActiveAt(LyricsEchoTiming.Window[] windows, long positionMs, int activeIndex) {
        for (int index = 0; index < windows.length; index++) {
            LyricsEchoTiming.Window window = windows[index];
            assertEquals("Line " + index + " at " + positionMs + " ms", index == activeIndex,
                    window != null && window.contains(positionMs));
        }
    }
}
