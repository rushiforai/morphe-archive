package app.voidhack.extension.applemusic.sing;

import org.junit.Test;

import java.util.Arrays;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

public final class MultichannelMixerTest {
    @Test
    public void mapsRolesCorrectlyFor5Point1And7Point1Atmos() {
        assertEquals(MultichannelMixer.ROLE_LEFT, MultichannelMixer.channelRole(6, 0));
        assertEquals(MultichannelMixer.ROLE_RIGHT, MultichannelMixer.channelRole(6, 1));
        assertEquals(MultichannelMixer.ROLE_CENTER, MultichannelMixer.channelRole(6, 2));
        assertEquals(MultichannelMixer.ROLE_LFE, MultichannelMixer.channelRole(6, 3));
        assertEquals(MultichannelMixer.ROLE_LEFT, MultichannelMixer.channelRole(6, 4));
        assertEquals(MultichannelMixer.ROLE_RIGHT, MultichannelMixer.channelRole(6, 5));
        assertArrayEquals(new int[]{0, 1, 2, 4, 5}, MultichannelMixer.activeChannels(6));

        assertEquals(MultichannelMixer.ROLE_LFE, MultichannelMixer.channelRole(8, 3));
        assertEquals(MultichannelMixer.ROLE_LEFT, MultichannelMixer.channelRole(8, 6));
        assertEquals(MultichannelMixer.ROLE_RIGHT, MultichannelMixer.channelRole(8, 7));
        assertArrayEquals(new int[]{0, 1, 2, 4, 5, 6, 7}, MultichannelMixer.activeChannels(8));

        // 5.1.4 (10ch) and 7.1.4 (12ch) Dolby Atmos PCM layouts on Android 12+
        assertEquals(MultichannelMixer.ROLE_LFE, MultichannelMixer.channelRole(10, 3));
        assertEquals(MultichannelMixer.ROLE_LEFT, MultichannelMixer.channelRole(10, 8));
        assertEquals(MultichannelMixer.ROLE_RIGHT, MultichannelMixer.channelRole(10, 9));
        assertArrayEquals(new int[]{0, 1, 2, 4, 5, 6, 7, 8, 9}, MultichannelMixer.activeChannels(10));

        assertEquals(MultichannelMixer.ROLE_LFE, MultichannelMixer.channelRole(12, 3));
        assertEquals(MultichannelMixer.ROLE_LEFT, MultichannelMixer.channelRole(12, 10));
        assertEquals(MultichannelMixer.ROLE_RIGHT, MultichannelMixer.channelRole(12, 11));
        assertArrayEquals(new int[]{0, 1, 2, 4, 5, 6, 7, 8, 9, 10, 11}, MultichannelMixer.activeChannels(12));

        // 22.2 (24ch): both LFE (3) and LFE2 (23) excluded.
        assertEquals(MultichannelMixer.ROLE_LFE, MultichannelMixer.channelRole(24, 3));
        assertEquals(MultichannelMixer.ROLE_LFE, MultichannelMixer.channelRole(24, 23));
        assertEquals(22, MultichannelMixer.activeChannels(24).length);
    }

    @Test
    public void downmixExcludesLfeAndPreventsClipping() {
        int frames = 64;
        int channels = 6;
        float[] pcm = new float[frames * channels];
        for (int f = 0; f < frames; f++) {
            int base = f * channels;
            pcm[base] = 0.9f;     // FL
            pcm[base + 1] = 0.9f; // FR
            pcm[base + 2] = 0.9f; // FC
            pcm[base + 3] = 1.0f; // LFE (must be excluded)
            pcm[base + 4] = 0.5f; // SL
            pcm[base + 5] = 0.5f; // SR
        }
        float[] stereo = new float[frames * 2];
        MultichannelMixer.downmixToStereo(pcm, channels, frames, stereo);
        for (float v : stereo) {
            assertTrue("Downmix exceeded unity: " + v, Math.abs(v) <= 1.0001f);
        }

        // LFE-only signal should downmix to silence.
        Arrays.fill(pcm, 0f);
        for (int f = 0; f < frames; f++) {
            pcm[f * channels + 3] = 0.8f;
        }
        MultichannelMixer.downmixToStereo(pcm, channels, frames, stereo);
        for (float v : stereo) {
            assertEquals(0f, v, 1e-6f);
        }
    }

    @Test
    public void wienerMaskSeparatesCenterVocalFromSurroundInstrumentAtUnityGain() {
        int frames = MdxSpectrum.FRAMES;
        int channels = 6;
        float[] multiPcm = new float[frames * channels];
        float[] vocalRef = new float[frames * channels];
        float[] instRef = new float[frames * channels];

        // Put a 1 kHz "vocal" in Center + Front L/R, a 3 kHz "instrument" in Surround L/R,
        // and a 60 Hz sub-bass in LFE.
        for (int f = 0; f < frames; f++) {
            double t = f / 44100.0;
            float vocal = 0.35f * (float) Math.sin(2.0 * Math.PI * 1000.0 * t);
            float inst = 0.35f * (float) Math.sin(2.0 * Math.PI * 3000.0 * t);
            float lfe = 0.40f * (float) Math.sin(2.0 * Math.PI * 60.0 * t);
            int base = f * channels;
            vocalRef[base] = 0.5f * vocal;
            vocalRef[base + 1] = 0.5f * vocal;
            vocalRef[base + 2] = vocal;
            instRef[base + 3] = lfe;
            instRef[base + 4] = inst;
            instRef[base + 5] = -inst;
            for (int c = 0; c < channels; c++) {
                multiPcm[base + c] = vocalRef[base + c] + instRef[base + c];
            }
        }

        MdxSpectrum spectrum = new MdxSpectrum();
        float[] downmix = new float[frames * 2];
        float[] downmixVocal = new float[frames * 2];
        MultichannelMixer.downmixToStereo(multiPcm, channels, frames, downmix);
        MultichannelMixer.downmixToStereo(vocalRef, channels, frames, downmixVocal);

        float[] mixSpec = new float[MdxSpectrum.TENSOR_SIZE];
        float[] vocalSpec = new float[MdxSpectrum.TENSOR_SIZE];
        spectrum.forward(downmix, mixSpec);
        spectrum.forward(downmixVocal, vocalSpec);

        int planeSize = MdxSpectrum.BINS * MdxSpectrum.TIME_STEPS;
        float[] maskL = new float[planeSize];
        float[] maskR = new float[planeSize];
        float[] maskC = new float[planeSize];
        MultichannelMixer.computeWienerMasks(mixSpec, vocalSpec, maskL, maskR, maskC);

        float[] estimatedVocals = new float[frames * channels];
        float[] pairIn = new float[frames * 2];
        float[] pairOut = new float[frames * 2];
        int[] active = MultichannelMixer.activeChannels(channels);
        for (int i = 0; i < active.length; i += 2) {
            int chA = active[i];
            int chB = (i + 1 < active.length) ? active[i + 1] : -1;
            MultichannelMixer.extractPair(multiPcm, channels, frames, chA, chB, pairIn);
            spectrum.forward(pairIn, mixSpec);
            float[] mA = maskFor(MultichannelMixer.channelRole(channels, chA), maskL, maskR, maskC);
            float[] mB = chB >= 0 ? maskFor(MultichannelMixer.channelRole(channels, chB), maskL, maskR, maskC) : null;
            MultichannelMixer.applyPairMasks(mixSpec, mA, mB);
            spectrum.inverseUnity(mixSpec, pairOut);
            MultichannelMixer.scatterPair(pairOut, estimatedVocals, channels, frames, chA, chB);
        }

        // Verify interior (avoiding STFT edge reflection) reconstruction:
        // Center vocal should match vocalRef, surround instrument & LFE should remain ~0 in vocals.
        double centerErrSq = 0.0;
        double centerRefSq = 0.0;
        double surroundLeakSq = 0.0;
        double lfeLeakSq = 0.0;
        for (int f = 8192; f < frames - 8192; f++) {
            int base = f * channels;
            double dc = estimatedVocals[base + 2] - vocalRef[base + 2];
            centerErrSq += dc * dc;
            centerRefSq += (double) vocalRef[base + 2] * vocalRef[base + 2];
            surroundLeakSq += (double) estimatedVocals[base + 4] * estimatedVocals[base + 4]
                    + (double) estimatedVocals[base + 5] * estimatedVocals[base + 5];
            lfeLeakSq += (double) estimatedVocals[base + 3] * estimatedVocals[base + 3];
        }
        double centerRelRms = Math.sqrt(centerErrSq / centerRefSq);
        double surroundLeakRms = Math.sqrt(surroundLeakSq / (2.0 * (frames - 16384)));
        assertTrue("Center vocal unity reconstruction drifted: " + centerRelRms, centerRelRms < 0.01);
        assertTrue("Surround instrument leaked into vocals: " + surroundLeakRms, surroundLeakRms < 0.01);
        assertEquals(0.0, lfeLeakSq, 1e-12);
    }

    @Test
    public void collectsOnlyAudibleSurroundChannels() {
        int channels = 12;
        int frames = 128;
        float[] pcm = new float[frames * channels];
        // Put audible signal on FL (0), FR (1), FC (2), and TFR (9), sub-threshold noise on BL (4),
        // and leave all remaining channels exact zero.
        pcm[10 * channels] = 0.05f;
        pcm[20 * channels + 1] = -0.02f;
        pcm[127 * channels + 2] = 0.001f;
        pcm[50 * channels + 4] = 5e-6f;
        pcm[80 * channels + 9] = -2e-4f;

        int[] active = MultichannelMixer.activeChannels(channels);
        int[] audible = new int[active.length];
        int count = MultichannelMixer.collectNonSilentChannels(pcm, channels, frames, active, audible);

        assertEquals(4, count);
        assertArrayEquals(new int[]{0, 1, 2, 9}, Arrays.copyOf(audible, count));
    }

    private static float[] maskFor(int role, float[] maskL, float[] maskR, float[] maskC) {
        if (role == MultichannelMixer.ROLE_LEFT) return maskL;
        if (role == MultichannelMixer.ROLE_RIGHT) return maskR;
        return maskC;
    }
}
