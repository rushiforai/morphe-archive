/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import java.io.FileNotFoundException;

public class AudioLookupTest {
    @Test public void onlyAConfirmedMissingTrackMayDeleteSavedState() {
        assertEquals(AudioLookup.MISSING, AudioLookup.of(false, 0, new FileNotFoundException("no row")));
        assertEquals(AudioLookup.MISSING, AudioLookup.of(true, 0, null));
        assertEquals(AudioLookup.PRESENT, AudioLookup.of(true, 1, null));
    }

    @Test public void transientFailuresNeverLookLikeADeletion() {
        assertEquals(AudioLookup.UNKNOWN, AudioLookup.of(false, 0, new SecurityException("permission lost")));
        assertEquals(AudioLookup.UNKNOWN, AudioLookup.of(false, 0, new IllegalStateException("provider died")));
        assertEquals(AudioLookup.UNKNOWN, AudioLookup.of(false, 0, new java.io.IOException("io")));
        assertEquals(AudioLookup.UNKNOWN, AudioLookup.of(false, 0, null));
        assertEquals(AudioLookup.UNKNOWN, AudioLookup.of(true, -1, null));
    }
}
