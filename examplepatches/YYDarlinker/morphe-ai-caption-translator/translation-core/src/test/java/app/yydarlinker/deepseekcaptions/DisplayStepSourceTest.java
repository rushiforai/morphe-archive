package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import java.nio.charset.StandardCharsets;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;

/**
 * A karaoke track advances its highlight by re-showing the same line in a new, very short
 * cue/event. Those display steps are not new speech: they are merged at the cue/event layer before
 * the word stream is built. Genuine repeated speech and ordinary tracks keep every token and time.
 */
public class DisplayStepSourceTest {
    static final String LINE = "Dream I was just in my settings the entire time";
    static final String[] WORDS = LINE.split(" ");

    static byte[] bytes(String value) {
        return value.getBytes(StandardCharsets.UTF_8);
    }

    static RebuildSource json(JSONArray events) throws Exception {
        byte[] body = bytes(new JSONObject().put("events", events).toString());
        return RebuildSource.read(body, CaptionDocument.parse(body, "application/json"));
    }

    static RebuildSource vtt(String body) throws Exception {
        byte[] value = bytes(body);
        return RebuildSource.read(value, CaptionDocument.parse(value, "text/vtt"));
    }

    /** One event whose segs carry an explicit word onset. */
    static JSONObject wordEvent(long start, long duration, int step) throws Exception {
        JSONArray segs = new JSONArray();
        for (int i = 0; i < WORDS.length; i++)
            segs.put(
                    new JSONObject()
                            .put("utf8", i + 1 == WORDS.length ? WORDS[i] : WORDS[i] + " ")
                            .put("tOffsetMs", i * step));
        return new JSONObject()
                .put("tStartMs", start)
                .put("dDurationMs", duration)
                .put("segs", segs);
    }

    /** One event/one seg: the whole line, no word offsets, like a manual pop-on cue. */
    static JSONObject lineEvent(long start, long duration) throws Exception {
        return cue(start, duration, LINE);
    }

    static JSONObject cue(long start, long duration, String text) throws Exception {
        return new JSONObject()
                .put("tStartMs", start)
                .put("dDurationMs", duration)
                .put("segs", new JSONArray().put(new JSONObject().put("utf8", text)));
    }

    static long[] KARAOKE_START = {29212, 29312, 29352, 29412, 29492, 29592};
    static long[] KARAOKE_DURATION = {100, 40, 60, 80, 100, 380};
    static int[] KARAOKE_STEP = {8, 3, 5, 7, 9, 30};

    @Test
    public void sixWordHighlightStepsOfOneSentenceAreReadOnce() throws Exception {
        JSONArray events = new JSONArray();
        for (int i = 0; i < KARAOKE_START.length; i++)
            events.put(wordEvent(KARAOKE_START[i], KARAOKE_DURATION[i], KARAOKE_STEP[i]));

        RebuildSource s = json(events);

        assertEquals("the sentence enters the token stream once", WORDS.length, s.words.size());
        assertEquals("Dream", s.words.get(0).text);
        assertEquals(29212, s.words.get(0).start);
        assertEquals(
                "the first step keeps its word onset",
                29212 + 8,
                s.words.get(1).start);
        assertEquals(
                "the merged window ends with the last display step",
                29972,
                s.words.get(s.words.size() - 1).end);
        List<RebuildSource.TimedWindow> windows = s.windows();
        assertEquals(1, windows.size());
        assertEquals(29212, windows.get(0).start);
        assertEquals(29972, windows.get(0).end);
        assertEquals(1, occurrences(s.text(0, s.words.size() - 1), LINE));
    }

    @Test
    public void karaokeDisplayStepsInWebVttAreMergedToo() throws Exception {
        StringBuilder body = new StringBuilder("WEBVTT\n\n");
        for (int i = 0; i < KARAOKE_START.length; i++)
            body.append(stamp(KARAOKE_START[i]))
                    .append(" --> ")
                    .append(stamp(KARAOKE_START[i] + KARAOKE_DURATION[i]))
                    .append("\n")
                    .append(LINE)
                    .append("\n\n");

        RebuildSource s = vtt(body.toString());

        assertEquals(WORDS.length, s.words.size());
        assertEquals(29212, s.words.get(0).start);
        assertEquals(29972, s.words.get(s.words.size() - 1).end);
        assertEquals(1, s.windows().size());
    }

    static String stamp(long ms) {
        return String.format(
                java.util.Locale.ROOT,
                "00:%02d:%02d.%03d",
                ms / 60000,
                ms % 60000 / 1000,
                ms % 1000);
    }

    @Test
    public void threeShortCuesBelowTheSpeechRateAreNotDisplaySteps() throws Exception {
        JSONArray events = new JSONArray();
        events.put(cue(0, 200, "no"));
        events.put(cue(200, 200, "no"));
        events.put(cue(400, 200, "no"));

        RebuildSource s = json(events);

        // One word in 200 ms is 5 tokens/second: three real repetitions, not a highlight step.
        assertEquals("all three spoken cues survive", 3, s.words.size());
        assertEquals(3, s.windows().size());
        assertEquals(3, occurrences(s.text(0, s.words.size() - 1), "no"));
    }

    @Test
    public void threeRealRepeatsOfTwoSecondsStayThreeCues() throws Exception {
        JSONArray events = new JSONArray();
        events.put(lineEvent(0, 2000));
        events.put(lineEvent(2000, 2000));
        events.put(lineEvent(4000, 2000));

        RebuildSource s = json(events);

        assertEquals(3 * WORDS.length, s.words.size());
        assertEquals(3, s.windows().size());
        assertEquals(
                "genuine repeated speech is not a display step",
                3,
                occurrences(s.text(0, s.words.size() - 1), LINE));
        assertEquals(2000, s.words.get(WORDS.length).start);
        assertEquals(6000, s.words.get(s.words.size() - 1).end);
    }

    @Test
    public void anOrdinaryTrackKeepsEveryTokenAndTime() throws Exception {
        String[] lines = {
            "Today we test the caption source.",
            "The next line is different.",
            "A third line closes the track."
        };
        long[] starts = {0, 2500, 5000};
        JSONArray events = new JSONArray();
        for (int i = 0; i < lines.length; i++)
            events.put(
                    new JSONObject()
                            .put("tStartMs", starts[i])
                            .put("dDurationMs", 2000)
                            .put(
                                    "segs",
                                    new JSONArray()
                                            .put(new JSONObject().put("utf8", lines[i]))));

        RebuildSource s = json(events);

        int expected = 0;
        for (String line : lines) expected += RebuildSource.tokens(line).size();
        assertEquals(expected, s.words.size());
        assertEquals(3, s.windows().size());
        int at = 0;
        for (int i = 0; i < lines.length; i++) {
            int count = RebuildSource.tokens(lines[i]).size();
            assertEquals("the cue keeps its first onset", starts[i], s.words.get(at).start);
            assertEquals(
                    "the cue keeps its last onset", starts[i] + 2000, s.words.get(at + count - 1).end);
            at += count;
        }
    }

    static int occurrences(String text, String part) {
        int count = 0;
        for (int i = text.indexOf(part); i >= 0; i = text.indexOf(part, i + part.length())) count++;
        return count;
    }
}
