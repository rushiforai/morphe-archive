/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 */
package app.morphe.extension.music.patches.downloads;

import static app.morphe.extension.music.patches.downloads.AlbumTrackNumbers.UNKNOWN;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import org.junit.Test;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class AlbumTrackNumbersTest {
    private static List<Integer> numbers(Integer... values) {
        return Arrays.asList(values);
    }

    @Test public void aNumberIsOneToThreeDigits() {
        assertEquals(1, AlbumTrackNumbers.parse("1"));
        assertEquals(10, AlbumTrackNumbers.parse(" 10 "));
        assertEquals(120, AlbumTrackNumbers.parse("120"));
        assertEquals(7, AlbumTrackNumbers.parse("07"));
    }

    @Test public void anythingElseIsNoNumber() {
        assertEquals(UNKNOWN, AlbumTrackNumbers.parse(null));
        assertEquals(UNKNOWN, AlbumTrackNumbers.parse(""));
        assertEquals(UNKNOWN, AlbumTrackNumbers.parse("0"));
        assertEquals(UNKNOWN, AlbumTrackNumbers.parse("1999"));
        assertEquals(UNKNOWN, AlbumTrackNumbers.parse("3:54"));
        assertEquals(UNKNOWN, AlbumTrackNumbers.parse("Never Gonna Give You Up"));
        assertEquals(UNKNOWN, AlbumTrackNumbers.parse("-4"));
    }

    @Test public void theNumberDrawnInsideTheCellIsTheOneOfTheRow() {
        assertEquals(3, AlbumTrackNumbers.pick(Collections.singletonList("3"), Arrays.asList("3", "Title", "12")));
    }

    @Test public void aCellWithMoreThanOneTextOrOneThatIsNoNumberHasNone() {
        assertEquals(UNKNOWN, AlbumTrackNumbers.pick(Arrays.asList("3", "4"), Arrays.asList("3", "4")));
        assertEquals(UNKNOWN, AlbumTrackNumbers.pick(Collections.singletonList("Now playing"), Arrays.asList("5")));
    }

    @Test public void aCellWithoutTextFallsBackToTheOnlyNumberOfTheRow() {
        List<String> none = Collections.emptyList();

        assertEquals(5, AlbumTrackNumbers.pick(none, Arrays.asList("5", "Title", "Artist", "3:54")));
        assertEquals(UNKNOWN, AlbumTrackNumbers.pick(none, Arrays.asList("5", "21", "Artist")));
        assertEquals(UNKNOWN, AlbumTrackNumbers.pick(none, Arrays.asList("Title", "Artist")));
    }

    @Test public void consecutiveNumbersWithinTheRecordedListAreUsable() {
        assertNull(AlbumTrackNumbers.problem(numbers(1, 2, 3, 4), 4, 10));
        // The page may be scrolled: the rows start anywhere.
        assertNull(AlbumTrackNumbers.problem(numbers(6, 7, 8), 8, 10));
    }

    @Test public void aRowWithoutANumberDoesNotSpoilTheOthers() {
        assertNull(AlbumTrackNumbers.problem(numbers(1, UNKNOWN, 3), 3, 10));
        assertNull(AlbumTrackNumbers.problem(numbers(UNKNOWN, 2, 3), 3, 10));
    }

    @Test public void numbersThatSkipOrRepeatAreRejected() {
        assertNotNull(AlbumTrackNumbers.problem(numbers(1, 2, 4), 4, 10));
        assertNotNull(AlbumTrackNumbers.problem(numbers(1, 1, 2), 2, 10));
        assertNotNull(AlbumTrackNumbers.problem(numbers(3, 2, 1), 3, 10));
    }

    @Test public void aNumberBeyondTheRecordedTracksRejectsTheWholePage() {
        assertNotNull(AlbumTrackNumbers.problem(numbers(9, 10, 11), 11, 10));
        // Seen earlier and scrolled away: the page is still not the recorded album.
        assertNotNull(AlbumTrackNumbers.problem(numbers(1, 2), 12, 10));
    }

    @Test public void noRecordedTracksAndNoNumbersAreRejected() {
        assertNotNull(AlbumTrackNumbers.problem(numbers(1, 2), 2, 0));
        assertNotNull(AlbumTrackNumbers.problem(numbers(UNKNOWN, UNKNOWN), 0, 10));
        assertNotNull(AlbumTrackNumbers.problem(Collections.emptyList(), 0, 10));
    }
}
