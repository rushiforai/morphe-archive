/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.*;

import org.junit.Test;

public class AlbumPageGuardTest {
    @Test public void aListNobodyOwnsMayBeScanned() {
        assertTrue(AlbumPageGuard.mayScan(3, -1, false));
    }

    @Test public void theHeaderBoundLastOwnsTheList() {
        // An older header must not scan a list that a newer, live header claimed (the second album's rows).
        assertFalse(AlbumPageGuard.mayScan(3, 4, true));
        assertTrue(AlbumPageGuard.mayScan(4, 3, true));
        assertTrue(AlbumPageGuard.mayScan(4, 4, true));
    }

    @Test public void aGoneOwnerLosesTheList() {
        assertTrue(AlbumPageGuard.mayScan(3, 4, false));
    }

    @Test public void anAlbumWithoutKnownTitlesTakesAnyRow() {
        AlbumPageGuard.Titles titles = new AlbumPageGuard.Titles();

        assertTrue(titles.fits(1, "Never Gonna Give You Up"));
        assertTrue(titles.fits(1, null));
    }

    @Test public void rowsMustShowTheTitlesTheAlbumShowedBefore() {
        AlbumPageGuard.Titles titles = new AlbumPageGuard.Titles();
        titles.remember(1, "Never Gonna Give You Up");
        titles.remember(2, "Whenever You Need Somebody");

        assertTrue(titles.fits(1, "Never Gonna Give You Up"));
        assertTrue(titles.fits(2, new StringBuilder("Whenever You Need Somebody")));
        // The first track of another album, and a track number nobody saw yet.
        assertFalse(titles.fits(1, "Every One of Us"));
        assertTrue(titles.fits(7, "Anything"));
    }

    @Test public void aRowWithoutAReadableTitleFitsOnlyWhileNothingIsKnown() {
        AlbumPageGuard.Titles titles = new AlbumPageGuard.Titles();
        assertTrue(titles.fits(1, null));

        titles.remember(1, "Never Gonna Give You Up");
        assertFalse(titles.fits(1, null));
    }

    @Test public void theFirstTitleOfANumberIsKept() {
        AlbumPageGuard.Titles titles = new AlbumPageGuard.Titles();
        titles.remember(1, "First");
        titles.remember(1, "Second");
        titles.remember(2, null);

        assertTrue(titles.fits(1, "First"));
        assertFalse(titles.fits(1, "Second"));
    }

    @Test public void albumsKeepTheirOwnTitles() {
        AlbumPageGuard.titlesOf("OLAK5uy_a").remember(1, "A one");

        assertTrue(AlbumPageGuard.titlesOf("OLAK5uy_a").fits(1, "A one"));
        assertTrue(AlbumPageGuard.titlesOf("OLAK5uy_b").fits(1, "B one"));
        assertFalse(AlbumPageGuard.titlesOf("OLAK5uy_a").fits(1, "B one"));
    }
}
