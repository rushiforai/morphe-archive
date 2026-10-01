package app.ckzombies.extension;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class CenteredTextTest {

    private static final float LINE = 36f;

    @Test
    public void oneLineStaysWhereGluPutsIt() {
        assertEquals(296f, CenteredText.firstLine(296f, LINE, 1), 0f);
        assertEquals(296f, CenteredText.firstLine(296f, LINE, 0), 0f);
    }

    @Test
    public void moreLinesAreCentredOnTheMiddleLine() {
        // Three lines: the middle one sits where a single line would.
        float first = CenteredText.firstLine(296f, LINE, 3);
        assertEquals(296f - LINE, first, 0f);
        assertEquals(296f, first + LINE, 0f);
        // Nine lines: the fifth sits there.
        assertEquals(296f, CenteredText.firstLine(296f, LINE, 9) + 4 * LINE, 0f);
    }

    @Test
    public void aBlockThatFitsIsNotScaled() {
        assertEquals(1f, CenteredText.scale(9, LINE, 423), 0f);
        assertEquals(1f, CenteredText.scale(0, LINE, 423), 0f);
        assertEquals(1f, CenteredText.scale(9, LINE, 0), 0f);
    }

    @Test
    public void aTallerBlockShrinksToFitWithHalfALineToSpare() {
        float scale = CenteredText.scale(14, LINE, 423);
        assertTrue(scale < 1f);
        assertEquals(423f, (14 + 0.5f) * LINE * scale, 0.01f);
    }
}
