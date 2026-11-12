/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-10.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class LibraryRestoreLogicTest {
    private static final String DOWNLOADS = "FEmusic_offline";
    private static final String LANDING = "FEmusic_library_landing";

    @Test
    public void firstRestoreOfDownloadsOpensLibrary() {
        assertTrue(LibraryRestoreLogic.opensLibrary(true, DOWNLOADS, LANDING));
    }

    @Test
    public void laterRestoreKeepsDownloads() {
        assertFalse(LibraryRestoreLogic.opensLibrary(false, DOWNLOADS, LANDING));
    }

    @Test
    public void otherSavedPagesAreKept() {
        assertFalse(LibraryRestoreLogic.opensLibrary(true, LANDING, LANDING));
        assertFalse(LibraryRestoreLogic.opensLibrary(true, "FEmusic_liked_playlists", LANDING));
        assertFalse(LibraryRestoreLogic.opensLibrary(true, null, LANDING));
    }

    @Test
    public void tabWithAnotherStartIsKept() {
        assertFalse(LibraryRestoreLogic.opensLibrary(true, DOWNLOADS, "FEmusic_home"));
        assertFalse(LibraryRestoreLogic.opensLibrary(true, DOWNLOADS, null));
    }
}
