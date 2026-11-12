/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-08.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.*;

import org.junit.Test;

import java.io.IOException;

public class PlaylistTextTest {
    @Test public void theReasonIsTheMessage() {
        assertEquals("Playlist title is unavailable",
                PlaylistText.failureReason(new IOException("Playlist title is unavailable")));
    }

    @Test public void aMessageWithoutTextNamesTheClass() {
        assertEquals("IOException", PlaylistText.failureReason(new IOException()));
        assertEquals("IOException", PlaylistText.failureReason(new IOException("  \n ")));
    }

    @Test public void onlyTheFirstLineIsKept() {
        assertEquals("first", PlaylistText.failureReason(new IOException("first\nsecond")));
    }

    @Test public void aLongReasonIsCutToOneShortLine() {
        String reason = PlaylistText.failureReason(new IOException("x".repeat(300)));
        assertEquals(PlaylistText.MAX_REASON, reason.length());
        assertTrue(reason.endsWith("…"));
    }
}
