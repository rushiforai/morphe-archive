package app.jimaku.extension.youtube;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import java.util.List;

import app.jimaku.extension.subtitles.Line;

/** As the extension's "an uploaded track's lines" test. */
public class CaptionLinesTest {
    @Test
    public void areItsEventsAsTheyAreEachWithItsStartLengthAndLineBreaksAndNoneForAnEventWithoutWords() throws Exception {
        List<Line> lines = CaptionLines.of("{\"events\":["
                + "{\"tStartMs\":18640,\"dDurationMs\":3240,\"segs\":[{\"utf8\":\"Uns beiden ist \"},{\"utf8\":\"die Liebe nicht fremd\"}]},"
                + "{\"tStartMs\":21000,\"dDurationMs\":100,\"segs\":[{\"utf8\":\"\\n\"}]},"
                + "{\"tStartMs\":22640,\"dDurationMs\":4320,\"segs\":[{\"utf8\":\"Du kennst die Regeln\\ngenau wie ich\"}]},"
                + "{\"tStartMs\":27040,\"segs\":[{\"utf8\":\"Für mich zählst nur du\"}]},"
                + "{\"tStartMs\":31120,\"dDurationMs\":3960,\"segs\":[{\"utf8\":\"Das kriegst du sonst von keinem hier\"}]},"
                + "null]}");
        assertEquals(4, lines.size());
        line(lines.get(0), 18.64, 21.88, "Uns beiden ist die Liebe nicht fremd");
        line(lines.get(1), 22.64, 26.96, "Du kennst die Regeln\ngenau wie ich");
        // No length: until the next.
        line(lines.get(2), 27.04, 31.12, "Für mich zählst nur du");
        line(lines.get(3), 31.12, 35.08, "Das kriegst du sonst von keinem hier");
    }

    @Test
    public void theLastCaptionWithoutALengthLastsFourSeconds() throws Exception {
        List<Line> lines = CaptionLines.of("{\"title\":\"t\",\"events\":[{\"tStartMs\":1000,\"segs\":[{\"utf8\":\"Ende\"}]}]}");
        line(lines.get(0), 1, 5, "Ende");
    }

    private static void line(Line line, double start, double end, String text) {
        assertEquals(start, line.start, 1e-9);
        assertEquals(end, line.end, 1e-9);
        assertEquals(text, line.text);
    }
}
