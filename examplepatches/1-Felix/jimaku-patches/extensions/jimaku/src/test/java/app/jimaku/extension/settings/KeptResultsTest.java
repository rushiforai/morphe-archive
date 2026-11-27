package app.jimaku.extension.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;

import java.io.File;
import java.util.List;

import app.jimaku.extension.subtitles.Line;

/** As the extension's tests of {@code keep} in {@code lib/store.ts}: 50 results within 8 MiB, the oldest out first. */
public class KeptResultsTest {
    @Rule
    public final TemporaryFolder files = new TemporaryFolder();

    private File folder() {
        return new File(files.getRoot(), "jimaku-results");
    }

    private KeptResults kept() {
        return new KeptResults(this::folder);
    }

    private static String video(int number) {
        return String.format("video%06d", number);
    }

    private static List<Line> lines(String text) {
        return List.of(new Line(1.5, 3, text));
    }

    @Test
    public void keepsFiftyResultsAndLetsTheOldestGoFirst() {
        KeptResults kept = kept();
        for (int i = 0; i <= KeptResults.RESULTS; i++) assertTrue(kept.keep(video(i), "de", lines("line " + i), false));
        assertEquals(List.of(), kept.languages(video(0)));
        assertNull(kept.get(video(0), "de"));
        assertEquals(List.of("de"), kept.languages(video(1)));
        assertEquals("line 50", kept.get(video(50), "de").get(0).text);
        // The documents and the index.
        assertEquals(KeptResults.RESULTS + 1, folder().list().length);
    }

    @Test
    public void keepsThemWithinEightMebibytes() {
        KeptResults kept = kept();
        String big = "x".repeat(3 * 1024 * 1024);
        for (int i = 0; i < 3; i++) assertTrue(kept.keep(video(i), "de", lines(big), false));
        assertNull("the oldest went to make room", kept.get(video(0), "de"));
        assertEquals(big, kept.get(video(1), "de").get(0).text);
        assertEquals(big, kept.get(video(2), "de").get(0).text);
    }

    @Test
    public void oneTooBigToKeepIsNotKeptAndTakesNothingWithIt() {
        KeptResults kept = kept();
        assertTrue(kept.keep(video(0), "de", lines("small"), false));
        assertFalse(kept.keep(video(1), "de", lines("x".repeat((int) KeptResults.BYTES)), false));
        assertEquals(List.of(), kept.languages(video(1)));
        assertEquals("small", kept.get(video(0), "de").get(0).text);
    }

    @Test
    public void areReadAgainAfterARestartWithTheOriginalsLanguage() {
        kept().keep(video(0), "en", lines("Hello"), true);
        kept().keep(video(0), "de", lines("Hallo"), false);
        KeptResults again = kept();
        assertEquals(List.of("de", "en"), again.languages(video(0)));
        assertEquals("en", again.originalLanguage(video(0)));
        Line line = again.get(video(0), "de").get(0);
        assertEquals(1.5, line.start, 0);
        assertEquals(3, line.end, 0);
        assertEquals("Hallo", line.text);
    }
}
