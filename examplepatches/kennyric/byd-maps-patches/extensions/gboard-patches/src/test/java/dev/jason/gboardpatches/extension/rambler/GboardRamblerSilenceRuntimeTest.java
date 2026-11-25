package dev.jason.gboardpatches.extension.rambler;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.junit.Test;

public class GboardRamblerSilenceRuntimeTest {
    /** Shaped like Gboard's obfuscated transcript update: a result list of protos with String fields. */
    static final class Result {
        private String c;
        private String language = "";
        private long confidence;
        Result(String text) { c = text; }
    }

    static final class Update {
        private int b0;
        private final List<Result> b = new ArrayList<>();
        Update(String... texts) { for (String text : texts) b.add(new Result(text)); }
    }

    @Test
    public void readsTheChosenSeconds() {
        assertEquals(3L, GboardRamblerSilenceRuntime.silenceSeconds("3"));
        assertEquals(10L, GboardRamblerSilenceRuntime.silenceSeconds(" 10 "));
    }

    @Test
    public void staysOffForOffMissingOrUnexpectedValues() {
        for (String stored : new String[] {null, "", "0", "-5", "61", "five", "5.5"}) {
            assertEquals(String.valueOf(stored), 0L, GboardRamblerSilenceRuntime.silenceSeconds(stored));
        }
    }

    @Test
    public void speechLevelsRestartTheTimerAndBackgroundNoiseDoesNot() throws InterruptedException {
        assertEquals(5L, GboardRamblerSilenceRuntime.onSessionStart(true, "5"));
        // Steady background noise sits near Gboard's adaptive noise floor (about 17).
        for (int level : new int[] {0, 12, 17, 25, 49}) {
            assertFalse("level " + level, GboardRamblerSilenceRuntime.onSpeechLevel(true, level));
        }
        assertTrue(GboardRamblerSilenceRuntime.onSpeechLevel(true, 50));
        // Restarts are rate-limited while speech continues.
        assertFalse(GboardRamblerSilenceRuntime.onSpeechLevel(true, 90));
        Thread.sleep(GboardRamblerSilenceRuntime.SPEECH_LEVEL == 50 ? 260L : 0L);
        assertTrue(GboardRamblerSilenceRuntime.onSpeechLevel(true, 90));
        assertFalse(GboardRamblerSilenceRuntime.onSpeechLevel(false, 100));
        GboardRamblerSilenceRuntime.onStopListening("TIMEOUT");
        // After listening stopped, levels no longer restart anything.
        assertFalse(GboardRamblerSilenceRuntime.onSpeechLevel(true, 100));
    }

    @Test
    public void armsNothingWhenOffOrOutsideRambler() {
        assertEquals(0L, GboardRamblerSilenceRuntime.onSessionStart(true, "0"));
        assertFalse(GboardRamblerSilenceRuntime.onSpeechLevel(true, 100));
        assertEquals(0L, GboardRamblerSilenceRuntime.onSessionStart(false, "5"));
        assertFalse(GboardRamblerSilenceRuntime.onSpeechLevel(true, 100));
        assertEquals(0L, GboardRamblerSilenceRuntime.sessionSeconds());
    }

    @Test
    public void transcriptUpdatesAreOnlyCounted() {
        GboardRamblerSilenceRuntime.onSessionStart(true, "5");
        assertFalse(GboardRamblerSilenceRuntime.onTranscriptionUpdate(true, new Update("")));
        assertTrue(GboardRamblerSilenceRuntime.onTranscriptionUpdate(true, new Update("Dit is een")));
        assertFalse(GboardRamblerSilenceRuntime.onTranscriptionUpdate(true, new Update("Dit is een")));
        assertFalse(GboardRamblerSilenceRuntime.onTranscriptionUpdate(false, new Update("Standaard")));
    }

    @Test
    public void readsTextFromEveryResultAndToleratesOddShapes() {
        assertEquals("", GboardRamblerSilenceRuntime.transcriptText(null));
        assertEquals("", GboardRamblerSilenceRuntime.transcriptText(new Update("", "")));
        assertTrue(GboardRamblerSilenceRuntime.transcriptText(new Update("een", "twee")).contains("twee"));
        assertEquals("", GboardRamblerSilenceRuntime.transcriptText(Arrays.asList("not", "an", "update")));
    }
}
