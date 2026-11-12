/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-10.
 */
package app.morphe.extension.music.patches.downloads;

import static app.morphe.extension.music.patches.downloads.HeaderDownloadState.Tap;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class HeaderDownloadStateTest {
    @Test public void aListIsSavedOnceItsCopiesExistAndItsDownloadEnded() {
        assertTrue(HeaderDownloadState.isSaved(true, false));
    }

    @Test public void aRunningDownloadIsNotSavedYet() {
        assertFalse(HeaderDownloadState.isSaved(true, true));
    }

    @Test public void aListWithMissingCopiesIsNotSaved() {
        assertFalse(HeaderDownloadState.isSaved(false, false));
        assertFalse(HeaderDownloadState.isSaved(false, true));
    }

    @Test public void tapOnASavedListOffersRemove() {
        assertEquals(Tap.REMOVE, HeaderDownloadState.tapOf(true, true, false));
    }

    @Test public void tapDuringTheDownloadSaysInProgressEvenWhenTheCopiesExist() {
        assertEquals(Tap.IN_PROGRESS, HeaderDownloadState.tapOf(true, true, true));
        assertEquals(Tap.IN_PROGRESS, HeaderDownloadState.tapOf(true, false, true));
    }

    @Test public void tapOnAListThatIsNotSavedDownloadsIt() {
        assertEquals(Tap.DOWNLOAD, HeaderDownloadState.tapOf(true, false, false));
    }

    @Test public void deviceFilesOnlyNeverOffersRemove() {
        assertEquals(Tap.DOWNLOAD, HeaderDownloadState.tapOf(false, true, false));
    }
}
