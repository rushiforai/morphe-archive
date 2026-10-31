/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.util.Arrays;

import org.junit.Test;

/** The mix of a call's two sides, with no Android in it: blocks in, mono samples at 48 kHz out. */
public class CallMixerTest {
    /** Everything the mixer wrote, in order. */
    private static final class Collected implements CallMixer.Sink {
        short[] samples = new short[0];

        @Override public void write(short[] block, int count) {
            int start = samples.length;
            samples = Arrays.copyOf(samples, start + count);
            System.arraycopy(block, 0, samples, start, count);
        }
    }

    private final Collected out = new Collected();
    private final CallMixer mixer = new CallMixer(out);

    /** [count] mono samples of [value] as 16-bit little-endian bytes. */
    private static byte[] flat(int count, int value) {
        short[] samples = new short[count];
        Arrays.fill(samples, (short) value);
        return pcm(samples);
    }

    private static byte[] pcm(short... samples) {
        byte[] bytes = new byte[samples.length * 2];
        for (int i = 0; i < samples.length; i++) {
            bytes[2 * i] = (byte) samples[i];
            bytes[2 * i + 1] = (byte) (samples[i] >> 8);
        }
        return bytes;
    }

    private void mic(byte[] block) throws Exception {
        mixer.mic(block, block.length, CallMixer.RATE, 1);
    }

    private void speaker(byte[] block) throws Exception {
        mixer.speaker(block, block.length, CallMixer.RATE, 1);
    }

    @Test public void stereoFramesBecomeTheAverageOfTheirChannelsAndAPartialFrameIsLeftOut() {
        byte[] stereo = pcm((short) 1, (short) 3, (short) -1, (short) -3, (short) 32767, (short) 32767, (short) 9);
        assertArrayEquals(new short[]{2, -2, 32767}, CallMixer.mono(stereo, stereo.length, 2));
        // Only [length] bytes count, whatever the array holds past them.
        assertArrayEquals(new short[]{1}, CallMixer.mono(stereo, 3, 1));
        assertArrayEquals(new short[0], CallMixer.mono(stereo, -1, 1));
    }

    @Test public void theOtherSideAloneComesOutAsItWasPlayed() throws Exception {
        speaker(pcm((short) 5, (short) -7, (short) 300));
        assertArrayEquals(new short[]{5, -7, 300}, out.samples);
        assertEquals(3, mixer.written());
    }

    @Test public void theMicrophoneJoinsOnlyOnceFortyMillisecondsOfItAreWaiting() throws Exception {
        mic(flat(CallMixer.PRIME - 1, 100));
        speaker(flat(480, 1000));
        short[] early = Arrays.copyOf(out.samples, 480);
        short[] alone = new short[480];
        Arrays.fill(alone, (short) 1000);
        assertArrayEquals("not primed: the other side plays alone", alone, early);

        mic(flat(1, 100));
        speaker(flat(480, 1000));
        short[] mixed = new short[480];
        Arrays.fill(mixed, (short) 1100);
        assertArrayEquals(mixed, Arrays.copyOfRange(out.samples, 480, 960));
    }

    @Test public void aMixLouderThanSixteenBitsIsClippedNotWrapped() throws Exception {
        mic(flat(CallMixer.PRIME, 30000));
        speaker(flat(2, 30000));
        assertArrayEquals(new short[]{32767, 32767}, out.samples);
        mixer.flush();
        assertEquals(-32768, CallMixer.clip(-40000));
        assertEquals(12, CallMixer.clip(12));
    }

    @Test public void aMicrophoneThatRunsDryWaitsForAFreshPrimeInsteadOfStuttering() throws Exception {
        mic(flat(CallMixer.PRIME, 10));
        speaker(flat(CallMixer.PRIME + 480, 1000));
        assertEquals(1010, out.samples[0]);
        assertEquals(1010, out.samples[CallMixer.PRIME - 1]);
        assertEquals("the rest of the block plays alone", 1000, out.samples[CallMixer.PRIME]);
        mic(flat(480, 10));
        speaker(flat(480, 1000));
        assertEquals("480 samples is no prime yet", 1000, out.samples[out.samples.length - 1]);
    }

    @Test public void halfASecondOfMicrophoneWithNothingPlayingGoesOutOnItsOwn() throws Exception {
        mic(flat(CallMixer.ALONE, 7));
        assertEquals("up to half a second waits for the other side", 0, mixer.written());
        mic(flat(480, 7));
        assertEquals(CallMixer.ALONE + 480 - CallMixer.PRIME, mixer.written());
        mixer.flush();
        assertEquals(CallMixer.ALONE + 480, mixer.written());
        for (short sample : out.samples) assertEquals(7, sample);
    }

    @Test public void theEndOfACallWritesWhatsLeftOfTheMicrophone() throws Exception {
        mic(flat(1000, -4));
        mixer.flush();
        assertEquals(1000, out.samples.length);
        mixer.flush();
        assertEquals("nothing left the second time", 1000, out.samples.length);
    }

    @Test public void aFullRingLetsTheOldestMicrophoneSamplesGo() throws Exception {
        mic(flat(CallMixer.RING + 10, 1));
        assertEquals(10, mixer.droppedMic());
        assertEquals(CallMixer.RING - CallMixer.PRIME, mixer.written());
    }

    @Test public void slowerAudioIsStretchedToFortyEightKilohertzWithoutClicksAtBlockEdges() throws Exception {
        // A ramp at 16 kHz rising 3 a sample comes out rising 1 a sample, across ten blocks.
        int blocks = 10;
        int block = 160;
        for (int b = 0; b < blocks; b++) {
            short[] ramp = new short[block];
            for (int i = 0; i < block; i++) ramp[i] = (short) (3 * (b * block + i));
            byte[] bytes = pcm(ramp);
            mixer.speaker(bytes, bytes.length, 16000, 1);
        }
        int expected = 3 * (blocks * block - 1);
        assertTrue("got " + out.samples.length, Math.abs(out.samples.length - expected) <= 1);
        for (int k = 0; k < out.samples.length; k++) assertEquals("sample " + k, k, out.samples[k]);
    }

    @Test public void aChangeOfRateStartsTheStretchOver() {
        CallMixer.Resampler resampler = new CallMixer.Resampler();
        short[] first = resampler.run(new short[]{0, 300, 600}, 16000);
        assertArrayEquals(new short[]{0, 100, 200, 300, 400, 500}, Arrays.copyOf(first, 6));
        short[] same = new short[]{9, 9, 9};
        assertArrayEquals("48 kHz passes as it is", same, resampler.run(same, CallMixer.RATE));
        short[] again = resampler.run(new short[]{0, 300}, 16000);
        assertEquals("a new start doesn't reach back to the old block", 0, again[0]);
        assertArrayEquals(new short[0], resampler.run(new short[0], 16000));
        assertArrayEquals(new short[0], resampler.run(new short[]{1}, 0));
    }
}
