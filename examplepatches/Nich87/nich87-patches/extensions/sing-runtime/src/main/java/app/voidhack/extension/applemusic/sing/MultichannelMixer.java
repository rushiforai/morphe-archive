package app.voidhack.extension.applemusic.sing;

import java.util.Arrays;

/**
 * Pure-Java multichannel PCM downmix and 1-pass Wiener spectral masking helpers
 * for surround / Dolby Atmos (e.g. 5.1 / 7.1 / 5.1.2) vocal separation.
 */
final class MultichannelMixer {
    static final int ROLE_LEFT = 0;
    static final int ROLE_RIGHT = 1;
    static final int ROLE_CENTER = 2;
    static final int ROLE_LFE = 3;
    static final float SILENCE_PEAK_THRESHOLD = 1e-5f;

    private static final float INV_SQRT2 = 0.70710678f;
    private static final float EXTRA_SURROUND_WEIGHT = 0.5f;
    private static final int PLANE_SIZE = MdxSpectrum.BINS * MdxSpectrum.TIME_STEPS;
    private static final int LOW_SKIP = 3 * MdxSpectrum.TIME_STEPS;
    private static final double WIENER_EPS = 1e-10;

    private MultichannelMixer() {}

    private static final int[] ROLES_24 = {
        ROLE_LEFT, ROLE_RIGHT, ROLE_CENTER, ROLE_LFE,
        ROLE_LEFT, ROLE_RIGHT, ROLE_LEFT, ROLE_RIGHT, ROLE_CENTER,
        ROLE_LEFT, ROLE_RIGHT, ROLE_CENTER,
        ROLE_LEFT, ROLE_CENTER, ROLE_RIGHT,
        ROLE_LEFT, ROLE_CENTER, ROLE_RIGHT,
        ROLE_LEFT, ROLE_RIGHT, ROLE_CENTER,
        ROLE_LEFT, ROLE_RIGHT, ROLE_LFE
    };

    static int channelRole(int channels, int channelIndex) {
        if (channels <= 1) return ROLE_CENTER;
        if (channels == 2) return channelIndex == 0 ? ROLE_LEFT : ROLE_RIGHT;
        if (channels == 24 && channelIndex >= 0 && channelIndex < ROLES_24.length) {
            return ROLES_24[channelIndex];
        }
        if (channelIndex == 0) return ROLE_LEFT;
        if (channelIndex == 1) return ROLE_RIGHT;
        if (channels == 4) {
            return channelIndex == 2 ? ROLE_LEFT : ROLE_RIGHT;
        }
        if (channelIndex == 2) return ROLE_CENTER;
        if (channels >= 6 && channelIndex == 3) return ROLE_LFE;
        if (channels == 7 && channelIndex == 4) return ROLE_CENTER;
        // 5.1 (6ch), 7.1 (8ch), 5.1.4 (10ch), 7.1.4 (12ch): remaining channels pair cleanly as L/R.
        int offset = channels >= 6 ? channelIndex - 4 : channelIndex - 3;
        if (channels == 7) offset = channelIndex - 5;
        return (offset & 1) == 0 ? ROLE_LEFT : ROLE_RIGHT;
    }

    static int[] activeChannels(int channels) {
        int count = 0;
        for (int ch = 0; ch < channels; ch++) {
            if (channelRole(channels, ch) != ROLE_LFE) count++;
        }
        int[] active = new int[count];
        int index = 0;
        for (int ch = 0; ch < channels; ch++) {
            if (channelRole(channels, ch) != ROLE_LFE) {
                active[index++] = ch;
            }
        }
        return active;
    }

    /**
     * Copies non-silent channels from {@code activeChannels} into {@code outChannels} and returns
     * how many channels contain audible signal in this window. Stops scanning each channel as soon
     * as a single sample crosses {@link #SILENCE_PEAK_THRESHOLD}.
     */
    static int collectNonSilentChannels(
            float[] multiPcm, int channels, int frames, int[] activeChannels, int[] outChannels) {
        int count = 0;
        for (int ch : activeChannels) {
            boolean audible = false;
            for (int frame = 0, index = ch; frame < frames; frame++, index += channels) {
                float sample = multiPcm[index];
                if (sample > SILENCE_PEAK_THRESHOLD || sample < -SILENCE_PEAK_THRESHOLD) {
                    audible = true;
                    break;
                }
            }
            if (audible) {
                outChannels[count++] = ch;
            }
        }
        return count;
    }

    /**
     * Folds non-LFE multichannel PCM into a peak-safe stereo mix suitable for MDX-Net.
     */
    static void downmixToStereo(float[] multiPcm, int channels, int frames, float[] stereoOut) {
        float[] leftWeights = new float[channels];
        float[] rightWeights = new float[channels];
        for (int ch = 0; ch < channels; ch++) {
            int role = channelRole(channels, ch);
            if (role == ROLE_LFE) continue;
            if (role == ROLE_CENTER) {
                leftWeights[ch] = ch == 2 ? INV_SQRT2 : EXTRA_SURROUND_WEIGHT;
                rightWeights[ch] = leftWeights[ch];
            } else if (role == ROLE_LEFT) {
                leftWeights[ch] = ch == 0 ? 1.0f : (ch <= 4 ? INV_SQRT2 : EXTRA_SURROUND_WEIGHT);
            } else if (role == ROLE_RIGHT) {
                rightWeights[ch] = ch == 1 ? 1.0f : (ch <= 5 ? INV_SQRT2 : EXTRA_SURROUND_WEIGHT);
            }
        }

        float peak = 0f;
        for (int frame = 0; frame < frames; frame++) {
            int base = frame * channels;
            float left = 0f;
            float right = 0f;
            for (int ch = 0; ch < channels; ch++) {
                float sample = multiPcm[base + ch];
                left += sample * leftWeights[ch];
                right += sample * rightWeights[ch];
            }
            int outIndex = frame * 2;
            stereoOut[outIndex] = left;
            stereoOut[outIndex + 1] = right;
            float absL = Math.abs(left);
            float absR = Math.abs(right);
            if (absL > peak) peak = absL;
            if (absR > peak) peak = absR;
        }

        if (peak > 1.0f) {
            float scale = 1.0f / peak;
            int limit = frames * 2;
            for (int i = 0; i < limit; i++) {
                stereoOut[i] *= scale;
            }
        }
    }

    static void computeWienerMasks(
            float[] mixSpec,
            float[] vocalSpec,
            float[] maskL,
            float[] maskR,
            float[] maskC) {
        Arrays.fill(maskL, 0, LOW_SKIP, 0f);
        Arrays.fill(maskR, 0, LOW_SKIP, 0f);
        Arrays.fill(maskC, 0, LOW_SKIP, 0f);

        int p1 = PLANE_SIZE;
        int p2 = 2 * PLANE_SIZE;
        int p3 = 3 * PLANE_SIZE;
        for (int i = LOW_SKIP; i < PLANE_SIZE; i++) {
            double xLr = mixSpec[i];
            double xLi = mixSpec[p1 + i];
            double xRr = mixSpec[p2 + i];
            double xRi = mixSpec[p3 + i];

            double vLr = vocalSpec[i];
            double vLi = vocalSpec[p1 + i];
            double vRr = vocalSpec[p2 + i];
            double vRi = vocalSpec[p3 + i];

            double dLr = xLr - vLr;
            double dLi = xLi - vLi;
            double dRr = xRr - vRr;
            double dRi = xRi - vRi;

            double vL2 = vLr * vLr + vLi * vLi;
            double iL2 = dLr * dLr + dLi * dLi;
            double vR2 = vRr * vRr + vRi * vRi;
            double iR2 = dRr * dRr + dRi * dRi;

            maskL[i] = (float) (vL2 / (vL2 + iL2 + WIENER_EPS));
            maskR[i] = (float) (vR2 / (vR2 + iR2 + WIENER_EPS));
            double vC2 = vL2 + vR2;
            maskC[i] = (float) (vC2 / (vC2 + iL2 + iR2 + WIENER_EPS));
        }
    }

    static void applyPairMasks(float[] pairSpec, float[] maskA, float[] maskB) {
        int p1 = PLANE_SIZE;
        int p2 = 2 * PLANE_SIZE;
        int p3 = 3 * PLANE_SIZE;
        for (int i = 0; i < PLANE_SIZE; i++) {
            float gainA = maskA[i];
            pairSpec[i] *= gainA;
            pairSpec[p1 + i] *= gainA;
            if (maskB != null) {
                float gainB = maskB[i];
                pairSpec[p2 + i] *= gainB;
                pairSpec[p3 + i] *= gainB;
            } else {
                pairSpec[p2 + i] = 0f;
                pairSpec[p3 + i] = 0f;
            }
        }
    }

    static void extractPair(float[] multiPcm, int channels, int frames, int chA, int chB, float[] stereoOut) {
        if (chB >= 0) {
            for (int frame = 0; frame < frames; frame++) {
                int base = frame * channels;
                int out = frame * 2;
                stereoOut[out] = multiPcm[base + chA];
                stereoOut[out + 1] = multiPcm[base + chB];
            }
        } else {
            for (int frame = 0; frame < frames; frame++) {
                int out = frame * 2;
                stereoOut[out] = multiPcm[frame * channels + chA];
                stereoOut[out + 1] = 0f;
            }
        }
    }

    static void scatterPair(float[] stereoIn, float[] multiOut, int channels, int frames, int chA, int chB) {
        if (chB >= 0) {
            for (int frame = 0; frame < frames; frame++) {
                int base = frame * channels;
                int in = frame * 2;
                multiOut[base + chA] = stereoIn[in];
                multiOut[base + chB] = stereoIn[in + 1];
            }
        } else {
            for (int frame = 0; frame < frames; frame++) {
                multiOut[frame * channels + chA] = stereoIn[frame * 2];
            }
        }
    }

    static void expandMonoToStereo(float[] mono, int frames, float[] stereoOut) {
        for (int frame = 0; frame < frames; frame++) {
            float sample = mono[frame];
            int out = frame * 2;
            stereoOut[out] = sample;
            stereoOut[out + 1] = sample;
        }
    }

    static void foldStereoToMono(float[] stereoIn, int frames, float[] monoOut) {
        for (int frame = 0; frame < frames; frame++) {
            int in = frame * 2;
            monoOut[frame] = 0.5f * (stereoIn[in] + stereoIn[in + 1]);
        }
    }
}
