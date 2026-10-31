package io.github.emotionbug.patcher;

import io.github.emotionbug.patches.runtime.RecorderMath;
import org.junit.Test;

import static org.junit.Assert.*;

/** Host-side engine accounting tests; these never open an Android audio device. */
public class RecorderMathTest {
    @Test public void durationUsesActualPcmFramesRatherThanWallClock() {
        assertEquals(0, RecorderMath.durationMs(0, 16000));
        assertEquals(1000, RecorderMath.durationMs(16000, 16000));
        assertEquals(2062, RecorderMath.durationMs(33000, 16000));
        assertEquals(2062500, RecorderMath.timestampUs(33000, 16000));
    }

    @Test public void twoSecondBoundaryIsExact() {
        assertTrue(RecorderMath.isTooShort(31999, 16000));
        assertFalse(RecorderMath.isTooShort(32000, 16000));
        assertFalse(RecorderMath.isTooShort(32001, 16000));
        assertTrue(RecorderMath.isTooShort(88199, 44100));
        assertFalse(RecorderMath.isTooShort(88200, 44100));
    }

    @Test public void timestampsAvoidPrematureMultiplicationOverflow() {
        long frames = Long.MAX_VALUE / 1000000L + 1;
        long expected = (frames / 16000) * 1000000L + (frames % 16000) * 1000000L / 16000;
        assertEquals(expected, RecorderMath.timestampUs(frames, 16000));
        assertThrows(ArithmeticException.class, () -> RecorderMath.timestampUs(Long.MAX_VALUE, 1));
    }

    @Test public void rejectsInvalidPcmClocks() {
        assertThrows(IllegalArgumentException.class, () -> RecorderMath.durationMs(-1, 16000));
        assertThrows(IllegalArgumentException.class, () -> RecorderMath.durationMs(1, 0));
        assertThrows(IllegalArgumentException.class, () -> RecorderMath.timestampUs(1, -1));
    }

    @Test public void timestampsRemainMonotonicAtCodecChunkBoundaries() {
        long previous = -1;
        for (long frames = 0; frames < 160000; frames += 1024) {
            long timestamp = RecorderMath.timestampUs(frames, 16000);
            assertTrue(timestamp > previous);
            previous = timestamp;
        }
    }

    @Test public void emptyAndZeroPcmAreSilent() {
        RecorderMath.Signal signal = new RecorderMath.Signal();
        assertTrue(signal.isSilent());
        signal.add(new short[2048], 2048);
        assertTrue(signal.isSilent());
        assertEquals(2048, signal.samples());
    }

    @Test public void silenceUsesEnergyNotSignedAverage() {
        RecorderMath.Signal signal = new RecorderMath.Signal();
        signal.add(new short[] {1000, -1000, 1000, -1000}, 4);
        assertFalse(signal.isSilent());
    }

    @Test public void nearSilenceThresholdIsExplicit() {
        RecorderMath.Signal quiet = new RecorderMath.Signal();
        quiet.add(new short[] {31, -31}, 2);
        assertTrue(quiet.isSilent());
        RecorderMath.Signal boundary = new RecorderMath.Signal();
        boundary.add(new short[] {32, -32}, 2);
        assertFalse(boundary.isSilent());
    }

    @Test public void fullScaleNegativeSamplesDoNotOverflow() {
        RecorderMath.Signal signal = new RecorderMath.Signal();
        signal.add(new short[] {Short.MIN_VALUE, Short.MAX_VALUE}, 2);
        assertFalse(signal.isSilent());
    }

    @Test public void onlyReadSamplesContributeToEnergy() {
        RecorderMath.Signal signal = new RecorderMath.Signal();
        signal.add(new short[] {0, 0, Short.MAX_VALUE}, 2);
        assertTrue(signal.isSilent());
        assertEquals(2, signal.samples());
        signal.add(new short[] {Short.MAX_VALUE}, 0);
        assertEquals(2, signal.samples());
        assertThrows(IllegalArgumentException.class, () -> signal.add(new short[1], 2));
        assertThrows(IllegalArgumentException.class, () -> signal.add(new short[1], -1));
    }

    @Test public void energyIsWeightedBySampleCountNotReadCount() {
        RecorderMath.Signal chunked = new RecorderMath.Signal();
        chunked.add(new short[] {64}, 1);
        chunked.add(new short[] {0, 0, 0, 0}, 4);
        assertTrue(chunked.isSilent());
        RecorderMath.Signal together = new RecorderMath.Signal();
        together.add(new short[] {64, 0, 0, 0, 0}, 5);
        assertEquals(together.isSilent(), chunked.isSilent());
        assertEquals(together.samples(), chunked.samples());
    }
}
