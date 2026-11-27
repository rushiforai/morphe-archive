package app.ayham.extension.music.automix;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertSame;

import org.junit.Test;

/**
 * analysis-cases.md "Where the song ends [all]" (4bc59835): plan against contentEndSec when the music
 * ends 1 s or more before the file, never cutting more than 20 s; the PC's automix.js musicEnd.
 */
public class MusicEndTest {
    private static Analysis song(double dur, double contentEnd) {
        Analysis a = new Analysis();
        a.durationSec = dur;
        a.contentEndSec = contentEnd;
        return a;
    }

    @Test
    public void silenceOfASecondOrMoreIsCut() {
        assertEquals(195, Planner.musicEnd(song(200, 195)).durationSec, 0);
        assertEquals(198.9, Planner.musicEnd(song(200, 198.9)).durationSec, 0);
    }

    @Test
    public void underASecondTheFileIsTheEnd() {
        Analysis a = song(200, 199.5);
        assertSame(a, Planner.musicEnd(a));
        // exactly 1 s: left as it is, like the PC's (end >= durationSec - 1)
        Analysis b = song(200, 199);
        assertSame(b, Planner.musicEnd(b));
    }

    @Test
    public void neverMoreThan20SecondsCut() {
        assertEquals(180, Planner.musicEnd(song(200, 150)).durationSec, 0);
        assertEquals(180, Planner.musicEnd(song(200, 180)).durationSec, 0);
    }

    @Test
    public void noMeasuredEndChangesNothing() {
        Analysis a = song(200, Double.NaN);
        assertSame(a, Planner.musicEnd(a));
        Analysis b = song(200, 0);
        assertSame(b, Planner.musicEnd(b));
    }

    @Test
    public void theSongItselfIsLeftAlone() {
        Analysis a = song(200, 150);
        Planner.musicEnd(a);
        assertEquals(200, a.durationSec, 0);
    }
}
