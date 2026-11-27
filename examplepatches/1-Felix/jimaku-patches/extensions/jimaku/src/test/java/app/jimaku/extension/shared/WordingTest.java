package app.jimaku.extension.shared;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import java.util.Locale;

public class WordingTest {
    @Test
    public void fillsPlaceholdersAsChromeDoes() {
        assertEquals("Jimaku subtitles: English available", Wording.t(Locale.ENGLISH, Wording.PLAYER_AVAILABLE, "English"));
    }
}
