package nl.johninnl.gboard;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.junit.Test;

public class EndpointerTest {
    /** Returns "event@window" for every non-NONE event while feeding speech probabilities. */
    private static List<String> run(Endpointer e, float[]... runs) {
        List<String> events = new ArrayList<>();
        int window = 0;
        for (float[] run : runs) {
            for (float p : run) {
                int event = e.push(p, p > 0.5f ? -25f : -60f);
                if (event != Endpointer.NONE) events.add(event + "@" + window);
                window++;
                if (event == Endpointer.SESSION_END || event == Endpointer.NO_SPEECH) return events;
            }
        }
        return events;
    }

    private static float[] windows(int count, float probability) {
        float[] out = new float[count];
        Arrays.fill(out, probability);
        return out;
    }

    @Test
    public void sentenceThenPauseEndsUtteranceAndSession() {
        Endpointer e = new Endpointer();
        List<String> events = run(e, windows(10, 0f), windows(60, 1f), windows(300, 0f));
        assertEquals(Endpointer.UTTERANCE_START + "@12", events.get(0));
        // 0.7 s (22 windows) without speech after the last speech window (69) ends it.
        assertEquals(Endpointer.UTTERANCE_END + "@91", events.get(1));
        // 5 s after that ends the session.
        assertEquals(Endpointer.SESSION_END + "@247", events.get(2));
        assertTrue(e.heardSpeech());
    }

    @Test
    public void dutchThenEnglishAreTwoUtterances() {
        List<String> events = run(new Endpointer(),
                windows(5, 0f), windows(80, 1f), windows(40, 0f), windows(80, 0.9f), windows(40, 0f));
        assertEquals(4, events.size());
        assertTrue(events.get(1).startsWith(Endpointer.UTTERANCE_END + "@"));
        assertTrue(events.get(2).startsWith(Endpointer.UTTERANCE_START + "@"));
        assertTrue(events.get(3).startsWith(Endpointer.UTTERANCE_END + "@"));
    }

    @Test
    public void silenceOrSteadyNoiseGivesNoSpeech() {
        Endpointer e = new Endpointer();
        List<String> events = run(e, windows(400, 0.03f));
        assertEquals(Arrays.asList(Endpointer.NO_SPEECH + "@187"), events);
        assertFalse(e.heardSpeech());
    }

    @Test
    public void shortBlipIsDroppedNotTranscribed() {
        List<String> events = run(new Endpointer(), windows(5, 0f), windows(5, 1f), windows(40, 0f));
        assertEquals(Endpointer.UTTERANCE_START + "@7", events.get(0));
        assertEquals(Endpointer.UTTERANCE_DROPPED + "@31", events.get(1));
    }

    @Test
    public void hesitationInsideSentenceKeepsOneUtterance() {
        List<String> events = run(new Endpointer(),
                windows(5, 0f), windows(40, 1f), windows(10, 0.4f), windows(10, 0f), windows(40, 1f), windows(30, 0f));
        assertEquals(2, events.size());
        assertTrue(events.get(1).startsWith(Endpointer.UTTERANCE_END + "@"));
    }

    @Test
    public void longSpeechIsCutAtTwentySeconds() {
        List<String> events = run(new Endpointer(), windows(5, 0f), windows(700, 1f));
        assertEquals(Endpointer.UTTERANCE_START + "@7", events.get(0));
        assertEquals(Endpointer.UTTERANCE_END + "@629", events.get(1));
    }

    @Test
    public void levelAndMeter() {
        short[] loud = new short[512];
        Arrays.fill(loud, (short) 16384);
        assertEquals(-6.02f, Endpointer.levelDb(loud, 512), 0.01f);
        assertEquals(-100f, Endpointer.levelDb(new short[512], 512), 0f);
        Endpointer e = new Endpointer();
        e.push(0f, -15f);
        assertEquals(100, e.meter());
        e.push(0f, -60f);
        assertEquals(0, e.meter());
    }
}
