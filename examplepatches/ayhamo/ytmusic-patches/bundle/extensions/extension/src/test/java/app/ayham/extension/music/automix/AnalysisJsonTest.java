package app.ayham.extension.music.automix;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.Map;

import org.junit.Test;

public class AnalysisJsonTest {

    @SuppressWarnings("unchecked")
    private static Analysis roundTrip(Analysis a) {
        return Analysis.fromJson((Map<String, Object>) Json.parse(Json.write(a.toJson())));
    }

    private static Analysis full() {
        Analysis a = new Analysis();
        a.fileKey = "abcdefghijk";
        a.durationSec = 201.5;
        a.contentEndSec = 199.25;
        a.bpm = 123.4;
        a.beatIntervalSec = 60 / 123.4;
        a.firstDownbeatSec = 0.37;
        a.gridConfidence = 0.8;
        a.tailGrid = new Analysis.LocalGrid();
        a.tailGrid.bpm = 124;
        a.tailGrid.beatIntervalSec = 60 / 124.0;
        a.tailGrid.firstDownbeatSec = 142.1;
        a.tailGrid.gridConfidence = 0.7;
        a.headBeats = new Analysis.BeatSide();
        a.headBeats.beats = new double[]{0.37, 0.86, 1.35};
        a.headBeats.downbeats = new double[]{0.37};
        a.headBeats.bpm = 123.4;
        a.headBeats.confidence = 0.9;
        a.introEndSec = 15;
        a.outroStartSec = 180;
        a.energy = 0.6;
        a.energyCurve = new double[]{0.1, 1, 0.5};
        a.camelotNum = 8;
        a.camelotLetter = 'B';
        a.keyName = "C major";
        a.keyConfidence = 0.71;
        Analysis.VocalWindow w = new Analysis.VocalWindow();
        w.startSec = 0;
        w.fps = 43.0;
        w.curve = new float[]{0, 0.25f, 1};
        a.vocals.add(w);
        a.musicVideo = true;
        return a;
    }

    @Test
    public void everyFieldSurvivesTheRoundTrip() {
        Analysis a = full();
        Analysis b = roundTrip(a);
        assertEquals(a.fileKey, b.fileKey);
        assertEquals(a.durationSec, b.durationSec, 1e-12);
        assertEquals(a.contentEndSec, b.contentEndSec, 1e-12);
        assertEquals(a.bpm, b.bpm, 1e-12);
        assertEquals(a.beatIntervalSec, b.beatIntervalSec, 1e-12);
        assertEquals(a.firstDownbeatSec, b.firstDownbeatSec, 1e-12);
        assertEquals(a.gridConfidence, b.gridConfidence, 1e-12);
        assertTrue(b.tailGridKnown);
        assertNotNull(b.tailGrid);
        assertEquals(a.tailGrid.bpm, b.tailGrid.bpm, 1e-12);
        assertEquals(a.tailGrid.firstDownbeatSec, b.tailGrid.firstDownbeatSec, 1e-12);
        assertArrayEquals(a.headBeats.beats, b.headBeats.beats, 1e-12);
        assertArrayEquals(a.headBeats.downbeats, b.headBeats.downbeats, 1e-12);
        assertNull(b.tailBeats);
        assertEquals(a.introEndSec, b.introEndSec, 1e-12);
        assertEquals(a.outroStartSec, b.outroStartSec, 1e-12);
        assertEquals(a.energy, b.energy, 1e-12);
        assertArrayEquals(a.energyCurve, b.energyCurve, 1e-12);
        assertEquals(8, b.camelotNum);
        assertEquals('B', b.camelotLetter);
        assertEquals("C major", b.keyName);
        assertEquals(0.71, b.keyConfidence, 1e-12);
        assertEquals(1, b.vocals.size());
        assertEquals(43.0, b.vocals.get(0).fps, 1e-12);
        assertArrayEquals(new float[]{0, 0.25f, 1}, b.vocals.get(0).curve, 1e-4f);
        assertTrue(b.musicVideo);
        assertEquals(Analysis.VERSION, b.analysisVersion);
    }

    @Test
    public void missingValuesStayNaNAndAbsentTailGridStaysUnknown() {
        Analysis a = new Analysis();
        a.fileKey = "x";
        a.tailGridKnown = false;
        Analysis b = roundTrip(a);
        assertTrue(Double.isNaN(b.durationSec));
        assertTrue(Double.isNaN(b.bpm));
        assertTrue(Double.isNaN(b.firstDownbeatSec));
        assertEquals(0, b.gridConfidence, 0);
        assertFalse(b.tailGridKnown);
        assertNull(b.tailGrid);
        assertEquals(0, b.camelotNum);
        assertNull(b.keyName);
        assertFalse(b.musicVideo);
        assertEquals(0, b.energyCurve.length);
    }

    @Test
    public void knownButEmptyTailGridReadsAsKnownNull() {
        Analysis a = new Analysis();
        a.fileKey = "x";
        a.tailGridKnown = true;
        a.tailGrid = null;
        Analysis b = roundTrip(a);
        assertTrue(b.tailGridKnown);
        assertNull(b.tailGrid);
    }

    @Test
    public void nanInVocalCurveKeepsTheAnalysisReadable() {
        Analysis a = full();
        a.vocals.get(0).curve = new float[]{Float.NaN, 0.5f};
        Analysis b = roundTrip(a);
        assertArrayEquals(new float[]{0, 0.5f}, b.vocals.get(0).curve, 1e-6f);
    }

    @Test
    public void copyKeepsMusicVideo() {
        Analysis a = full();
        Analysis c = a.copy();
        assertTrue(c.musicVideo);
        assertEquals(a.durationSec, c.durationSec, 0);
    }
}
